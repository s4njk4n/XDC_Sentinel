# XDC Sentinel: Node Monitoring Notification Service

![XDC Sentinel Logo](XDC_Sentinel.jpg)

## Overview
XDC Sentinel is a monitoring tool designed to check the status of XDC network nodes by verifying if their P2P port (e.g., 30303) is open and responsive. It runs periodic checks and sends notifications to your iPhone/Android for events such as:
- Node going offline or coming back online.
- Repeated offline reminders (every 2 hours if offline persists).
- Daily "remains online" confirmation (sent on the first check after 08:00 AEST/AEDT).

The script itself is a Linux-based tool that uses standard linux utilities for port checks and for notifications. It is hosted and executed on a GitHub Actions workflow for reliability, with state persistence to track node history.

**Important Note**: XDC Sentinel is not affiliated with the XDC Network or any official entities. It is an independent monitoring service provided for informational purposes only.

For more about my projects, visit my website: [XDC Outpost](https://s4njk4n.github.io/XDCOutpost/).

## What You Are Purchasing
By purchasing access to XDC Sentinel notifications, you are **not** purchasing the XDC Sentinel script, software, or any ownership rights. Instead, you are paying for:
- Subscription to personalized notifications for your specified XDC node(s), delivered via a dedicated ntfy.sh topic.
- The service of configuring and maintaining the monitoring for your node(s) in the backend workflow.

This is similar to historical Linux distributions where users paid for packaging, support, and distribution materials rather than the open-source Linux kernel itself. The underlying script logic is derived from open-source principles, but the hosted monitoring and notification delivery is the paid service.

You will provide your node's IP address (and P2P port if you have changed it) during setup. Notifications will be sent based on the script's checks, but as detailed below, there are no guarantees of perfect functionality.

## Pricing and Subscription Terms
- **30-Day Trial**: Your first 30 days of using XDC Sentinel are considered a trial period. Full payment is required upfront before starting. If you decide not to continue within these 30 days, your payment will be fully refunded.
- **Price**: A flat fee of 1200 XDC covers service until the upcoming October 1st (no prorated discounts based on purchase date).
- **Billing Period**: Payment is due in full upfront and provides access from your purchase date through September 30th of the same year if purchased before October 1st, or through September 30th of the next year if purchased on or after October 1st. For example:
  - If you purchase on March 1, 2025, you pay 1200 XDC for service until September 30, 2025.
  - If you purchase on November 1, 2025, you pay 1200 XDC for service until September 30, 2026.
- **Renewal**: Subscriptions expire annually on October 1st. To renew, you must make a new purchase of 1200 XDC for the next period. There are no automatic renewals or refunds outside the trial period.
- **Payment Method**: Payments are accepted in XDC cryptocurrency only. Detailed instructions will be provided upon contact.

## Eligibility and Compliance
To ensure compliance with local Australian tax regulations:
- By proceeding with purchase, you declare that you (or your organization) are **not** a citizen or resident of Australia.
- You also declare that XDC Sentinel will **not** be used to monitor servers or nodes located in Australia.

If these conditions apply to you, please do not proceed. Purchases from ineligible parties will be refunded (minus any transaction fees), and access will be denied.

## How to Purchase
If you agree to the terms above as well as the Privacy Policy and Disclaimers below and wish to proceed:
- Contact me on Telegram: [@s4njk4n](https://t.me/s4njk4n)
- Provide your node details (IP, port).
- I'll confirm setup and provide payment instructions.

[![Purchase Now Today](https://img.shields.io/badge/Purchase%20Now%20Today-4CAF50?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/s4njk4n)

---

### Privacy Policy
Your privacy is important to us. This Privacy Policy explains how we collect, use, store, and protect your information when you use or purchase access to XDC Sentinel. By purchasing or using the service, you agree to the practices described here.

#### Information We Collect
- **Node Details**: When you provide your node's IP address, P2P port, and ntfy.sh channel for setup, this information is used solely to configure your personalized monitoring and notifications.
- **Purchase Details**: We collect minimal information related to your purchase, such as your Telegram username and payment transaction details (e.g., XDC wallet address and amount). This is kept for accounting and compliance purposes.
- **No Personal Data**: We do not collect names, email addresses, or other personally identifiable information unless voluntarily provided during contact.

#### How We Use Your Information
- Node details are used exclusively to monitor your XDC node and send notifications via ntfy.sh.
- Purchase details are used to process your subscription, provide receipts, and comply with local tax regulations.

#### Storage and Security
- **Encryption**: Your node's IP address, port, and ntfy.sh channel are stored encrypted (AES-256) in GitHub Secrets vaults. Once encrypted, even we (the provider) cannot retrieve or view the original values—access is limited to the automated workflow for monitoring purposes.
- **Offline Storage**: Purchase details and any related records are kept offline in secure, private storage and are not stored on cloud services or shared with third parties.
- **Retention**: Purchase details are retained only for the period required by local Australian regulations (e.g., for tax and accounting purposes, typically 7 years). Node details are deleted upon subscription expiration or cancellation.

#### Sharing and Disclosure
- We do not share, sell, or disclose your information to any third parties, except as required by law.
- **ntfy.sh Notifications**: Notifications are sent to your specified ntfy.sh channel, which is public if accessed directly (e.g., via https://ntfy.sh/your-channel). Anyone who knows or guesses your channel code can view messages. We recommend keeping your channel code private and not sharing it. Notification content is minimal and anonymized (e.g., "XDC Node (Server Name/type) with IP ending in 111.222 is OFFLINE!"), avoiding full IPs or sensitive details.

#### Your Rights
- You can request access to, correction of, or deletion of your data by contacting us via Telegram (@s4njk4n).
- If you cancel your subscription, we will delete your node details promptly.

#### Changes to This Policy
We may update this Privacy Policy from time to time. Changes will be posted in this repository, and continued use of the service constitutes acceptance of the updated terms.

If you have questions about this Privacy Policy, contact us at [@s4njk4n](https://t.me/s4njk4n).

*This Privacy Policy is effective as of October 27, 2025.*

### Liability and Disclaimers
XDC Sentinel is provided on an "as-is" basis with no warranties or guarantees. By proceeding with purchase, you acknowledge and agree to the following:
- **No Uptime Guarantee**: The monitoring runs on GitHub Actions, and is therefore subject to any performance limits of that service (including but not limited to delays, outages, or inconsistencies in scheduling (e.g., checks intended every hour may vary due to platform load)). Notifications are also similarly subject to the functionality and performance limits of ntfy.sh (including but not-limited to potential delays or non-transmission of notifications).
- **Fallibility of Systems**: Hardware, software, networks, and third-party services (e.g., GitHub, ntfy.sh) are inherently fallible. It is possible for checks to fail, miss events, or produce inaccurate results due to technical issues, connectivity problems, or external factors. We do not guarantee 100% accuracy or reliability.
- **No Liability**: The provider (s4njk4n) assumes no liability for any losses, damages, or missed opportunities resulting from use (or non-use) of this service, including but not limited to node downtime, financial impacts on your XDC operations, or delayed notifications. You use this service at your own risk.
- **Agreement**: By contacting to purchase and proceeding with payment, you confirm that you understand and accept these terms, including the potential for imperfect performance.

Thank you for your interest in XDC Sentinel!
