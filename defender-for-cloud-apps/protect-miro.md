---
title: Protect your Miro environment
description: This article provides information about the benefits of connecting your Miro app to Defender for Cloud Apps using the API connector for visibility and control over use.
ms.date: 01/01/2026
ms.topic: how-to
ms.reviewer: AmitMishaeli
---

# How Defender for Cloud Apps helps protect your Miro environment

Miro is an online workspace that enables distributed, cross-functional teams organize and collaborate on projects. Miro holds critical data of your organization, and this makes it a target for malicious actors. 

Connecting Miro to Defender for Cloud Apps gives you improved insights into your users' activities and provides threat detection using machine learning based anomaly detections.

## Main threats

- Compromised accounts and insider threats
- Data leakage
- Insufficient security awareness
- Unmanaged bring your own device (BYOD)

## How Defender for Cloud Apps helps to protect your environment

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## Control Miro with policies

| **Type**                           | **Name**                                                     |
| ---------------------------------- | ------------------------------------------------------------ |
| Built-in  anomaly detection policy | [Activity from   anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)  <br /> [Activity from   infrequent country](anomaly-detection-policy.md#activity-from-infrequent-country) <br /> [Activity from   suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)  <br /> [Impossible travel](anomaly-detection-policy.md#impossible-travel)  <br /> [Activity   performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)   <br />[Multiple failed   login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)  <br />|
| Activity  policy                   | Built a customized policy by using the [Miro Audit Log](https://help.miro.com/hc/en-us/articles/360017571434-Audit-logs) activities |

For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

In addition to monitoring for potential threats, you can apply and automate the following Miro governance actions to remediate detected threats:

| **Type**        | **Action**                                                   |
| --------------- | ------------------------------------------------------------ |
| User governance | Notify user on  alert (via Microsoft Entra ID)<br />  Require user to sign in again (via Microsoft Entra ID)   <br /> Suspend user (via Microsoft Entra ID) |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Connect Miro to Microsoft Defender for Cloud Apps

This section provides instructions for connecting Microsoft Defender for Cloud Apps to your existing Miro account using the App Connector APIs. This connection gives you visibility into and control over Miro usage. 

**Prerequisites**:

- You must have a Miro account with an enterprise plan. 

### Configure Miro 

1. Sign into [Miro](https://miro.com/app/dashboard/) portal with a company admin account.
1. Create a developer team with default permissions.
1. Create a new application in the developer team and ensure the “Expire user authentication token” setting is checked.
1. Copy the **Client ID** and **Client secret**. You'll need them later.
1. Configure 'OAuth2.0' by setting the redirect URL to 'https://portal.cloudappsecurity.com/api/oauth/saga'.
1. Grant these required permissions, and then select **Install app and get OAuth token**.
- ‘auditlogs:read’
- ‘organization:read’

### Connect Microsoft Defender for Cloud Apps

1. In the [Defender for Cloud Apps](https://portal.cloudAppSecurity.com) portal, navigate to Investigate > Connected apps.
1. In the **App connectors** page, select **Connect an app**, and choose **Miro**.
1. In the connection wizard, enter a name for Miro connection, and select **Connect Miro**.
1. Enter the **Client ID, Client secret** and select **Connect in Miro**.
1. Select the Miro team that you want to connect with Defender for Cloud Apps and select **Add** again. Note that this Miro team is different from the developer team in which you created the app.
1. Select **Test now** to make sure the connection succeeded. Audit events start flowing into Defender for Cloud apps from the time the connection is successfully established.


## Next steps

- If you have any problems connecting the app, see [Troubleshooting App Connectors](/defender-cloud-apps/troubleshooting-api-connectors-using-error-messages).
- [Control cloud apps with policies](control-cloud-apps-with-policies.md)

