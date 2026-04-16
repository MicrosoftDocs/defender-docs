---
author: mberdugo
ms.author: monaberdugo
ms.date: 04/01/2026
ms.topic: include
ms.service: microsoft-defender-xdr
---

## Built-in alert tuning rules

> [!NOTE]
> This feature is currently in Preview, isn't available in all organizations, and is subject to change.

Microsoft Defender XDR includes built-in alert tuning rules that help reduce reporting noise from common benign activity. These built-in rules suppress alerts without affecting other features like AIR investigations and email notifications. If the AIR investigation detects malicious or suspicious activity, the new alert is reactivated.

To see the built-in alert tuning rules in the [Microsoft Defender portal](https://security.microsoft.com), go to **System** \> **Settings** \> **Microsoft Defender XDR** \> **Rules** section \> **Alert tuning** or directly on the **Alert tuning** page at <https://security.microsoft.com/securitysettings/defender/alert_suppression>.

Be sure to review these rules to understand how they might affect which alerts appear in the Microsoft Defender portal.

> [!NOTE]
> The [Microsoft Security Copilot Phishing Triage Agent](/defender-xdr/phishing-triage-agent) doesn't classify alerts suppressed by [alert tuning](/defender-xdr/investigate-alerts#tune-an-alert). Be sure to disable the **Auto-Resolve - Email reported by user as malware or phish** built-in alert tuning rule and any custom tuning rules that suppress this alert.
