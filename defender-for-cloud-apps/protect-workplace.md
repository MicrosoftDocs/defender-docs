---
title:       Protect your Workplace environment | Microsoft Defender for Cloud Apps
description: Connect Workplace by Meta to Microsoft Defender for Cloud Apps with the API connector to monitor user activity and detect suspicious behavior.
ms.topic:    how-to
ms.date: 07/03/2026
ms.reviewer: AmitMishaeli 
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# How Defender for Cloud Apps helps protect your Workplace environment (Preview)



Workplace by Meta is a collaboration tool built by Meta. It brings group work, instant messaging, video calls, and news sharing into one place. Cloud collaboration has many benefits, but it can also expose critical assets to threats. These assets include messages, posts, and files that might contain sensitive data or partnership details. You need continuous monitoring to stop malicious actors or careless insiders from leaking this data.

Connect Workplace by Meta to Defender for Cloud Apps to get better insights into user activity and detect unusual behavior.

<a name="main-threats"></a>
## Main threats to Workplace by Meta

The main threats to Workplace by Meta include the following:

- Compromised accounts and insider threats
- Insufficient security awareness
- Unmanaged bring your own device (BYOD)

## How Defender for Cloud Apps helps to protect your environment

Defender for Cloud Apps helps protect your Workplace by Meta environment in the following ways:

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## Control Workplace by Meta with policies

The following table lists the policy types available for controlling Workplace by Meta:

| Type | Name |
| ---- | ---- |
| Built-in  anomaly detection policy | [Activity from   anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)   [Activity from infrequent country/region](anomaly-detection-policy.md#activity-from-infrequent-country)  [Activity from   suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)   [Impossible travel](anomaly-detection-policy.md#impossible-travel)   [Activity   performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as the identity provider (IdP))   [Multiple failed login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)   [Unusual   administrative activities](anomaly-detection-policy.md#unusual-activities-by-user)   [Unusual impersonated activities](anomaly-detection-policy.md#unusual-activities-by-user) |
| Activity  policy                   | Built a customized policy by the Workplace by Meta activities|

For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

Beyond monitoring for threats, you can also automate Workplace governance actions to fix detected issues:

| Type | Action |
| ---- | ---- |
| User governance | Notify user on  alert (via Microsoft Entra ID)  Require user to sign in again (via Microsoft Entra ID)    Suspend user (via Microsoft Entra ID) |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Protect Workplace by Meta in real time

Review our best practices for [securing and collaborating with external users](best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls) and [blocking and protecting the download of sensitive data to unmanaged or risky devices](best-practices.md#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices).

<a name="saas-security-posture-management-preview"></a>
## SaaS security posture management for Workplace by Meta (Preview)

When you connect Workplace by Meta to Defender for Cloud Apps using the API connector, you automatically get security posture recommendations for Workplace in Microsoft Secure Score. In Secure Score, select **Recommended actions** and filter by **Product** = **Workplace**. Workplace supports security recommendations to *Adopt SSO (Single sign on) in Workplace by Meta*.

For more information, see:

- [Security posture management for SaaS apps](security-saas.md)
- [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)


<a name="connect-workplace-to-microsoft-defender-for-cloud-apps"></a>
## Connect Workplace by Meta to Microsoft Defender for Cloud Apps

The following information describes the current support status for connecting Workplace by Meta to Defender for Cloud Apps using the API connector.

> [!NOTE]
> Due to the [Workplace from Meta planned deprecation notice](https://www.workplace.com/help/work/1167689491269151) by Meta of Workplace from Meta, we no longer support new connections to the Workplace from Meta API connector. If you have an existing Workplace from Meta connection, it will continue to work as expected.

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]
