# XDC Sentinel: XDC Node Monitoring & Notifications

[![GitHub stars](https://img.shields.io/github/stars/s4njk4n/XDC_Sentinel?style=social)](https://github.com/s4njk4n/XDC_Sentinel/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/s4njk4n/XDC_Sentinel?style=social)](https://github.com/s4njk4n/XDC_Sentinel/network/members)
[![GitHub issues](https://img.shields.io/github/issues/s4njk4n/XDC_Sentinel)](https://github.com/s4njk4n/XDC_Sentinel/issues)

<img src="XDC_Sentinel.jpg" alt="XDC Sentinel Banner" style="max-width: 100%; height: auto; display: block; margin: 0 auto;">



**XDC Sentinel** monitors XDC Network nodes by checking their P2P ports. It sends instant push notifications via ntfy.sh for:
- Nodes going offline or back online.
- Ongoing offline reminders (every 2 hours).
- Daily "all good" confirmations after 08:00 AEST/AEDT.

Supports multiple nodes and devices (e.g., notify your whole team!). **Not affiliated with XDC Network.**

For more projects, visit [XDC Outpost](https://s4njk4n.github.io/XDCOutpost/).

## 🚀 Free Open-Source Version
For tech-savvy users: Fork and self-host in GitHub Actions—no cost, full control.

### Quick Setup
1. **Fork this repo** (top-right button—keep public to support the community!).

2. **Set Up ntfy.sh Notifications**  
   ntfy.sh is a free, open-source push notification service—no account required!  
   - **Step 1**: Download the app (iOS/Android) from [ntfy.sh/apps](https://ntfy.sh/apps) or use the web version at [ntfy.sh](https://ntfy.sh).  
   - **Step 2**: Create a unique, random "topic" (e.g., `xdc-alerts-xyz123`)—this is your private channel.  
   - **Step 3**: Subscribe in the app: Tap "+" and add your topic for instant alerts.  
   - **Tips**: Use long/random topics to prevent guessing. See [ntfy docs](https://docs.ntfy.sh/subscribe/) for more.

3. **Add Your Secret** (Settings > Secrets & variables > Actions > New secret):  
   - Name: `NODES_CSV`  
   - Value (multiline CSV):  
     ```csv
     Name,IP,P2P_Port,ntfy_Topic
     MyNode,125.34.268.53,30303,xdc-alerts-xyz123
     BackupNode,192.0.2.1,30303,another-topic-abc456
     ```  
     (IPs are anonymized in alerts, showing only the last two octets, e.g., `x.y`.)

4. **Test & Run**: Actions tab > XDC Sentinel Monitoring > Run workflow. Check for alerts. It's scheduled hourly—edit `xdc-sentinel.yml` for changes.

**Security Notes**:  
- Never commit secrets to code—use GitHub Secrets only (encrypted & secure).  
- Public forks are safe; secrets don't copy over.  
- Test with dummy data first. Enable 2FA and repo alerts.

**Debug Tips**:  
- Workflow fails? Check Actions logs for errors (e.g., connectivity issues).  
- No alerts? Verify topic in app/logs. Script skips checks if offline.  
- Port issues? GitHub runners are cloud-based—firewalls may vary.

Runs free on GitHub runners. State persists via cache; logs auto-rotate daily.

## 💰 Paid Managed Service
For hassle-free monitoring: I handle setup, hosting, and support. Ideal if you lack time or tech skills.

[![Purchase Now](https://img.shields.io/badge/Purchase%20Now-4CAF50?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/s4njk4n?text=Hi%20s4njk4n.%20I%27m%20interested%20in%20purchasing%20access%20to%20XDC%20Sentinel.)

### What You're Purchasing
- Personalized notifications for your node(s) via push app.  
- Backend configuration and maintenance.  
- Multi-device support (e.g., notify your whole team).  

(No software ownership—just the service.)

### Pricing & Terms
- **Launch Deal (2025 Only)**: If you purchase in 2025, your service covers from the start date through Dec 31, 2026—at the standard 1200 XDC price!
- **Risk-Free Trial**: 30 days from start—full refund if not satisfied.
- **Standard Price**: 1200 XDC per node per calendar year (Jan 1–Dec 31). No prorating.
- **Renewal**: Manual renewal only—no auto-billing. To continue after your current coverage ends, pay 1200 XDC for the next full calendar year.
- **Modifications**: 600 XDC fee for any changes during your coverage (e.g., updating IP, port, or ntfy topic).
- **Payment**: XDC cryptocurrency only; I'll provide wallet details and instructions upon agreement.

### Eligibility
To comply with Australian regs:  
- You/your org must not be Australian-based.  
- Nodes must not be in Australia.  

Ineligible? Refund issued (minus fees).

### How to Get Started
Agree to terms? Contact [@s4njk4n on Telegram](https://t.me/s4njk4n). Provide node details—I'll set it up!

## 📞 Support Policy
Thrilled to share the open-source code for self-setup! However, with limited time, I can't offer troubleshooting or respond to questions about the free version.  

If setup challenges arise, consider the paid service—I'll manage everything, including support. Reach out on Telegram for paid inquiries.  

For code improvements, open a GitHub issue or PR.

## 🔒 Privacy Policy
Your privacy matters. By using/purchasing:  

- **Collected Data**: Node IP/port/topic (for monitoring); Telegram/payment details (for billing). No names/emails unless provided.  
- **Usage**: Solely for service delivery/compliance.  
- **Security**: AES-256 encryption; offline storage for records. Node data deleted on expiration.  
- **Sharing**: None, except legally required. Keep topics private—alerts are minimal/anonymized.  
- **Rights**: Request access/deletion via Telegram.  

Updates posted here. Effective: Oct 27, 2025.

## ⚠️ Liability & Disclaimers
"As-is" service—no warranties.  

- **No Uptime Guarantee**: Subject to platform/notification delays/outages.  
- **Fallibility**: Systems can fail; no 100% accuracy.  
- **No Liability**: Not responsible for losses from downtime/delays. Use at own risk.  

Payment confirms acceptance.

Thanks for your interest! Stars/forks appreciated. Questions? Telegram for paid service.
