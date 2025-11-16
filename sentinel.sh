#!/bin/bash

# Variables Section
NTFY_SERVER="https://ntfy.sh"            # ntfy.sh server URL (default)
TIMEOUT=10                               # Timeout for netcat command in seconds
RETRY_ATTEMPTS=3                         # Number of retry attempts for port check
RETRY_DELAY=5                            # Delay between retries in seconds
OFFLINE_NOTIFICATION_INTERVAL=$((2*3600)) # 2 hours in seconds
CSV_FILE="nodes.csv"                     # CSV file with node details
STATE_FILE="node_states.txt"             # File to track node states and notification times
LOG_FILE="xdc_monitor.log"               # Log file for status messages
LOG_RETENTION_SECONDS=$((24*3600))       # 24 hours in seconds

# Function to write to log file
write_to_log() {
    local message="$1"
    echo "$(TZ=Australia/Sydney date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOG_FILE"
}

# Function to clean log file (keep last 24 hours)
clean_log_file() {
    local current_time
    current_time=$(date +%s)
    local temp_file
    temp_file=$(mktemp)

    # Read log file, keep entries within last 24 hours
    while IFS= read -r line; do
        if [ -z "$line" ]; then
            continue
        fi
        # Extract timestamp from log entry
        log_time_str=$(echo "$line" | cut -d' ' -f1-2)
        log_time=$(TZ=Australia/Sydney date -d "$log_time_str" +%s 2>/dev/null || continue)
        if [ $((current_time - log_time)) -le $LOG_RETENTION_SECONDS ]; then
            echo "$line" >> "$temp_file"
        fi
    done < "$LOG_FILE"

    # Replace log file with filtered content
    mv "$temp_file" "$LOG_FILE"
}

# Function to check internet connectivity (using curl)
check_connectivity() {
    if curl -s --head --max-time "$TIMEOUT" http://www.google.com | grep "200 OK" >/dev/null; then
        return 0  # Connected
    else
        write_to_log "Script is offline, skipping node checks"
        return 1  # No connection
    fi
}

# Function to extract last two octets of IP address
get_ip_tail() {
    local ip="$1"
    echo "$ip" | awk -F. '{print $(NF-1)"."$NF}'
}

# Function to check XDC node status via P2P port
check_xdc_status() {
    local node_ip="$1"
    local node_port="$2"
    local attempt=1
    local success=0

    while [ $attempt -le $RETRY_ATTEMPTS ]; do
        if nc -z -w "$TIMEOUT" "$node_ip" "$node_port" 2>/dev/null; then
            success=1
            break
        else
            write_to_log "Attempt $attempt/$RETRY_ATTEMPTS failed for $node_ip:$node_port"
            attempt=$((attempt + 1))
            sleep "$RETRY_DELAY"
        fi
    done

    if [ $success -eq 1 ]; then
        return 0  # Node online
    else
        return 1  # Node offline
    fi
}

# Function to send ntfy notification
send_ntfy_notification() {
    local topic="$1"
    local message="$2"
    if curl -s -m "$TIMEOUT" -d "$message" "$NTFY_SERVER/$topic" >/dev/null; then
        write_to_log "Notification sent to $topic: $message"
    else
        write_to_log "Failed to send notification to $topic"
    fi
}

# Function to check if daily notification has already been sent today
has_daily_notification_been_sent() {
    local today
    today=$(TZ=Australia/Sydney date +%Y-%m-%d)
    grep -q "^DAILY_SENT:$today$" "$STATE_FILE"
}

# Function to mark daily notification as sent for today
mark_daily_notification_sent() {
    local today
    today=$(TZ=Australia/Sydney date +%Y-%m-%d)
    # Remove any old DAILY_SENT entries
    sed -i "/^DAILY_SENT:/d" "$STATE_FILE" 2>/dev/null || true
    echo "DAILY_SENT:$today" >> "$STATE_FILE"
}

# Function to check if it's the first run after 08:00 AEST
is_first_run_after_0800() {
    local current_hour
    current_hour=$(TZ=Australia/Sydney date +%H)
    [ "$current_hour" -ge 8 ] && ! has_daily_notification_been_sent
}

# Function to manage node state and notifications
manage_node_state() {
    local node_name="$1"
    local node_ip="$2"
    local node_port="$3"
    local ntfy_topic="$4"
    local ip_tail
    ip_tail=$(get_ip_tail "$node_ip")
    local current_time
    current_time=$(date +%s)
    local state_file_entry
    state_file_entry=$(grep "^$node_name:" "$STATE_FILE" 2>/dev/null)
    local last_state="unknown"
    local last_notification=0

    # Read last state and notification time
    if [ -n "$state_file_entry" ]; then
        last_state=$(echo "$state_file_entry" | cut -d: -f2)
        last_notification=$(echo "$state_file_entry" | cut -d: -f3)
    fi

    # Check node status
    if check_xdc_status "$node_ip" "$node_port"; then
        # Node is online
        write_to_log "$node_name ($node_ip:$node_port) is online"
        if [ "$last_state" = "offline" ]; then
            # Node was offline, now online
            send_ntfy_notification "$ntfy_topic" "XDC Node ($node_name) with IP ending in $ip_tail is back ONLINE!"
            sed -i "/^$node_name:/d" "$STATE_FILE" 2>/dev/null
            echo "$node_name:online:$current_time" >> "$STATE_FILE"
        elif [ "$last_state" = "online" ] || [ "$last_state" = "unknown" ]; then
            # Node remains online, send daily "remains ONLINE" only on first run after 08:00
            if is_first_run_after_0800; then
                local last_notification_date
                last_notification_date=$(date -d "@$last_notification" +%Y-%m-%d 2>/dev/null || echo "unknown")
                local current_date
                current_date=$(TZ=Australia/Sydney date +%Y-%m-%d)
                if [ "$last_notification_date" != "$current_date" ]; then
                    send_ntfy_notification "$ntfy_topic" "XDC Node ($node_name) with IP ending in $ip_tail remains ONLINE"
                    sed -i "/^$node_name:/d" "$STATE_FILE" 2>/dev/null
                    echo "$node_name:online:$current_time" >> "$STATE_FILE"
                    mark_daily_notification_sent
                fi
            fi
        fi
    else
        # Node is offline
        write_to_log "$node_name ($node_ip:$node_port) is offline"
        if [ "$last_state" = "online" ] || [ "$last_state" = "unknown" ]; then
            # Node was online or unknown, now offline
            send_ntfy_notification "$ntfy_topic" "XDC Node ($node_name) with IP ending in $ip_tail is OFFLINE!"
            sed -i "/^$node_name:/d" "$STATE_FILE" 2>/dev/null
            echo "$node_name:offline:$current_time" >> "$STATE_FILE"
        elif [ "$last_state" = "offline" ]; then
            # Node remains offline, check if 2-hour notification is due
            if [ $((current_time - last_notification)) -ge $OFFLINE_NOTIFICATION_INTERVAL ]; then
                send_ntfy_notification "$ntfy_topic" "XDC Node ($node_name) with IP ending in $ip_tail is still OFFLINE!"
                sed -i "/^$node_name:/d" "$STATE_FILE" 2>/dev/null
                echo "$node_name:offline:$current_time" >> "$STATE_FILE"
            fi
        fi
    fi
}

# Check if CSV file exists
if [ ! -f "$CSV_FILE" ]; then
    write_to_log "Error: CSV file $CSV_FILE not found"
    exit 1
fi

# Initialize log file if it doesn't exist
[ ! -f "$LOG_FILE" ] && touch "$LOG_FILE"

# Initialize state file if it doesn't exist
[ ! -f "$STATE_FILE" ] && touch "$STATE_FILE"

# Main execution (single iteration)
write_to_log "Starting XDC node monitoring"

# Clean log file
clean_log_file

# Check script connectivity
if ! check_connectivity; then
    write_to_log "Exiting due to no connectivity"
    exit 0
fi

# Read CSV file, skipping header
tail -n +2 "$CSV_FILE" | while IFS=, read -r node_name node_ip node_p2p_port ntfy_topic; do
    # Skip empty lines
    [ -z "$node_name" ] && continue
    write_to_log "Checking $node_name ($node_ip:$node_p2_port)"
    manage_node_state "$node_name" "$node_ip" "$node_p2p_port" "$ntfy_topic"
done
