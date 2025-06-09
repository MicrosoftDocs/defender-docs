---
title:       Protect your Workplace environment | Microsoft Defender for Cloud Apps
description: Learn how about connecting your Workplace app to Defender for Cloud Apps using the API connector.
ms.topic:    how-to
ms.date: 06/09/2025
---

# How Defender for Cloud Apps helps protect your Workplace environment (Preview)



Workplace by Meta is an online collaboration software tool developed by Meta that facilitates online group work, instant messaging, video conferencing, and news sharing in one place. Along with the benefits of effective collaboration in the cloud, your organization's most critical assets may be exposed to threats. Exposed assets include messages, posts, and files with potentially sensitive information, collaboration, partnership details, and more. Preventing exposure of this data requires continuous monitoring to prevent any malicious actors or security-unaware insiders from exfiltrating sensitive information.

Connecting Workplace by Meta to Defender for Cloud Apps gives you improved insights into your users' activities and provides threat detection for anomalous behavior.

## Main threats

- Compromised accounts and insider threats
- Insufficient security awareness
- Unmanaged bring your own device (BYOD)

## How Defender for Cloud Apps helps to protect your environment

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## Control Workplace by Meta with policies

| Type | Name |
| ---- | ---- |
| Built-in  anomaly detection policy | [Activity from   anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)   [Activity from infrequent country/region](anomaly-detection-policy.md#activity-from-infrequent-country)  [Activity from   suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)   [Impossible travel](anomaly-detection-policy.md#impossible-travel)   [Activity   performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)   [Multiple failed login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)   [Unusual   administrative activities](anomaly-detection-policy.md#unusual-activities-by-user)   [Unusual impersonated activities](anomaly-detection-policy.md#unusual-activities-by-user) |
| Activity  policy                   | Built a customized policy by the Workplace by Meta activities|

For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

In addition to monitoring for potential threats, you can apply and automate the following Workplace governance actions to remediate detected threats:

| Type | Action |
| ---- | ---- |
| User governance | Notify user on  alert (via Microsoft Entra ID)  Require user to sign in again (via Microsoft Entra ID)    Suspend user (via Microsoft Entra ID) |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Protect Workplace by Meta in real time

Review our best practices for [securing and collaborating with external users](best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls) and [blocking and protecting the download of sensitive data to unmanaged or risky devices](best-practices.md#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices).

## SaaS security posture management (Preview)

[Connect Workplace](#connect-workplace-to-microsoft-defender-for-cloud-apps) to automatically get security posture recommendations for Workplace in Microsoft Secure Score. In Secure Score, select **Recommended actions** and filter by **Product** = **Workplace**. Workplace supports security recommendations to *Adopt SSO (Single sign on) in Workplace by Meta*.

For more information, see:

- [Security posture management for SaaS apps](security-saas.md)
- [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)


## Connect Workplace to Microsoft Defender for Cloud Apps

> [!NOTE]
> Due to the [planned deprecation](https://www.workplace.com/help/work/1167689491269151) by Meta of Workplace from Meta, we no longer support new connections to the Workplace from Meta API connector. If you have an existing Workplace from Meta connection, it will continue to work as expected.

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]
