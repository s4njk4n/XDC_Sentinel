# XDC Sentinel: Node Monitoring Notification Service

![XDC Sentinel Logo](XDC_Sentinel.jpg)

## Overview
XDC Sentinel is a monitoring tool designed to check the status of XDC network nodes by verifying if their P2P port (e.g., 30303) is open and responsive. It runs periodic checks and sends notifications to your iPhone/Android via [ntfy.sh](https://ntfy.sh) for events such as:
- Node going offline or coming back online.
- Repeated offline reminders (every 2 hours if offline persists).
- Daily "remains online" confirmation (sent on the first check after 08:00 AEST/AEDT).

The script itself is a Bash-based tool that uses `netcat` for port checks and `curl` for notifications. It is hosted and executed on a GitHub Actions workflow for reliability, with state persistence to track node history.

**Important Note**: XDC Sentinel is not affiliated with the XDC Network or any official entities. It is an independent monitoring service provided for informational purposes only.

For more about my projects, visit my website: [XDC Outpost](https://s4njk4n.github.io/XDCOutpost/).

## What You Are Purchasing
By purchasing access to XDC Sentinel notifications, you are **not** purchasing the XDC Sentinel script, software, or any ownership rights. Instead, you are paying for:
- Subscription to personalized notifications for your specified XDC node(s), delivered via a dedicated ntfy.sh topic.
- The service of configuring and maintaining the monitoring for your node(s) in the backend workflow.

This is similar to historical Linux distributions where users paid for packaging, support, and distribution materials rather than the open-source Linux kernel itself. The underlying script logic is derived from open-source principles, but the hosted monitoring and notification delivery is the paid service.

You will provide your node's IP address (and P2P port if you have changed it) during setup. Notifications will be sent based on the script's checks, but as detailed below, there are no guarantees of perfect functionality.

## Pricing and Subscription Terms
- **Price**: 100 XDC per full month of service.
- **Billing Period**: Payment is required upfront for the period from the purchase date until March 1st of the following year. For example, if you purchase on November 1, 2025, you pay for November 2025 through February 2026 (4 months × 100 XDC = 400 XDC).
- **Renewal**: All subscriptions expire on March 1st annually. To continue service, you must repurchase starting from that date. There are no automatic renewals or prorated refunds.
- **Payment Method**: Payments are accepted in XDC cryptocurrency only. Instructions will be provided upon contact.

## Liability and Disclaimers
XDC Sentinel is provided on an "as-is" basis with no warranties or guarantees. By proceeding with purchase, you acknowledge and agree to the following:
- **No Uptime Guarantee**: The monitoring runs on GitHub Actions, and is therefore subject to any performance limits of that service (including but not limited to delays, outages, or inconsistencies in scheduling (e.g., checks intended every hour may vary due to platform load)). Notifications are also similarly subject to the functionality and performance limits of ntfy.sh (including but not-limited to potential delays or non-transmission of notifications).
- **Fallibility of Systems**: Hardware, software, networks, and third-party services (e.g., GitHub, ntfy.sh) are inherently fallible. It is possible for checks to fail, miss events, or produce inaccurate results due to technical issues, connectivity problems, or external factors. We do not guarantee 100% accuracy or reliability.
- **No Liability**: The provider (s4njk4n) assumes no liability for any losses, damages, or missed opportunities resulting from use (or non-use) of this service, including but not limited to node downtime, financial impacts on your XDC operations, or delayed notifications. You use this service at your own risk.
- **Agreement**: By contacting to purchase and proceeding with payment, you confirm that you understand and accept these terms, including the potential for imperfect performance.

## Eligibility and Compliance
To ensure compliance with local Australian tax regulations:
- By proceeding with purchase, you declare that you (or your organization) are **not** a citizen or resident of Australia.
- You also declare that XDC Sentinel will **not** be used to monitor servers or nodes located in Australia.

If these conditions apply to you, please do not proceed. Purchases from ineligible parties will be refunded (minus any transaction fees), and access will be denied.

## How to Purchase
If you agree to the terms above and wish to proceed:
- Contact me on Telegram: [@s4njk4n](https://t.me/s4njk4n)
- Provide your node details (IP, port).
- I'll confirm setup and provide payment instructions.

[![Purchase Now](https://img.shields.io/badge/Purchase%20Now-4CAF50?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/s4njk4n)

Thank you for your interest in XDC Sentinel!
