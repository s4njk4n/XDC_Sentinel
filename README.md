# XDC Sentinel: XDC node uptime alerts on your phone

[![GitHub stars](https://img.shields.io/github/stars/s4njk4n/XDC_Sentinel?style=social)](https://github.com/s4njk4n/XDC_Sentinel/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/s4njk4n/XDC_Sentinel?style=social)](https://github.com/s4njk4n/XDC_Sentinel/network/members)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

<img src="XDC_Sentinel.jpg" alt="XDC Sentinel banner" style="max-width: 100%; height: auto; display: block; margin: 0 auto;">

**XDC Sentinel** checks your XDC nodes every hour and sends a push notification to your phone (iOS or Android, via [ntfy](https://ntfy.sh)) when:

- a node goes **offline**, with a reminder every 2 hours until it's back
- a node comes **back online**
- every morning, to confirm each node **remains online** (at a time and in a time zone you choose)

It works for any number of nodes, and several people can get the same alerts, so your whole team knows when something's wrong.

Part of [XDC Outpost](https://xdcoutpost.xyz/?utm_source=github-sentinel) · ⭐ Star the repo if it helps you.

**Two ways to use it:**
- [Run it yourself for free](#run-it-yourself-free) in your own GitHub account. About 10 minutes to set up.
- [Let me run it for you](#hosted-monitoring) for US$40 per node per year.

---

## Run it yourself (free)

It runs on GitHub Actions in your own copy of this repo. There's nothing to install and no server needed.

### 1. Copy the repo
Click **Fork** (top right), then in your fork open the **Actions** tab and click **"I understand my workflows, go ahead and enable them"**. GitHub switches workflows off in new forks until you do this.

### 2. Set up notifications
[ntfy](https://ntfy.sh) is a free, open-source push notification app. No account is needed.
1. Install the app: [iOS](https://apps.apple.com/us/app/ntfy/id1625396347) or [Android](https://play.google.com/store/apps/details?id=io.heckel.ntfy).
2. Make up a long, random **topic** name, such as `xdc-sentinel-7f3k92lqz`. Anyone who knows it can read your alerts, so don't use something guessable.
3. In the app, tap **+** and subscribe to that topic.

### 3. Add your nodes
In your fork go to **Settings → Secrets and variables → Actions → New repository secret**.
- **Name:** `NODES_CSV`
- **Value:** your node list, one node per line:
  ```csv
  Name,IP,P2P_Port,ntfy_Topic
  MyNode,203.0.113.53,30303,xdc-sentinel-7f3k92lqz
  BackupNode,192.0.2.1,30303,another-random-topic-abc456
  ```
  Alerts show only the last two parts of each IP (for example `0.53`).

### 4. Choose when the daily message arrives (optional)
On the **Variables** tab (next to Secrets), add:
- `NOTIFY_TZ`: your time zone, for example `Europe/London`, `America/New_York` or `Asia/Singapore` ([list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)). Default: `Australia/Sydney`.
- `DAILY_HOUR`: the hour (0–23) the daily "remains ONLINE" message is sent after. Default: `8`.

### 5. Test it
**Actions → XDC Sentinel Monitoring → Run workflow.** You should get a notification within a minute or two. From then on it runs every hour by itself.

### Good to know
- **It keeps itself running.** GitHub switches off scheduled workflows in public repos after 60 days without activity. Sentinel adds an empty commit about every 50 days to stop that, so you don't need to do anything.
- **Your details stay private.** They live in GitHub Secrets, which are encrypted and never shown in logs, even though your fork is public. Never put node details in the code itself.
- **How it checks:** it tries to connect to each node's P2P port from GitHub's servers. If your firewall only allows certain IPs, allow the port publicly or use the hosted option.
- **No alerts?** Open the latest run in the **Actions** tab to see the log, and check the topic name matches exactly in the app.

---

## Hosted monitoring

Prefer not to set it up? I'll run it for you.

- **US$40 per node per year**, starting from the day you join
- **30-day free trial.** If it's not for you, you pay nothing.
- **Changes are free:** new IP, port, topic, or extra team members' phones
- **Included free** with a [node care plan](https://github.com/s4njk4n/Plugin-XDC-Secure-RPC-WSS#done-for-you)
- Payable in the US-dollar equivalent in XDC, USDT or AUDD

[![Start a free trial on Telegram](https://img.shields.io/badge/Start%20a%20free%20trial-Telegram-26A5E4?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/s4njk4n?text=Hi%20s4njk4n%2C%20I%27d%20like%20to%20try%20hosted%20XDC%20Sentinel.)

Send me your node's name, IP and P2P port, and I'll send you a private topic to subscribe to.

### Privacy (hosted service)
- **What I keep:** each node's name, IP, port and notification topic, plus your Telegram contact and payment records.
- **How it's used:** only to run the monitoring and keep billing records. It's stored encrypted and never shared unless the law requires it.
- **When it's deleted:** node details are deleted when your service ends. You can ask for your data or its deletion at any time on Telegram.

---

## Questions and support

- **Something not working, or an idea?** Open a [GitHub issue](https://github.com/s4njk4n/XDC_Sentinel/issues). I can't always reply quickly, but I read them.
- **Hosted customers:** message me on [Telegram](https://t.me/s4njk4n).
- **Need help with the node itself?** See [installs and node care](https://github.com/s4njk4n/Plugin-XDC-Secure-RPC-WSS#done-for-you).

## License and disclaimer

[MIT License](LICENSE). Provided as-is, without warranty. Monitoring and notifications can be delayed or fail (for example during GitHub, ntfy or network outages), so don't rely on it as your only safeguard. I'm not liable for losses from downtime or missed alerts. For the hosted service, liability is limited to the fee paid.
