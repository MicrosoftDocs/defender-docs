---
title: Protect your Mural environment | Microsoft Defender for Cloud Apps
description: This article provides information about the benefits of connecting your Mural app to Defender for Cloud Apps using the API connector for visibility and control over use.
ms.date: 05/06/2024
ms.topic: how-to
---

# Protect your Mural environment (Preview)

Mural is an online workspace that enables distributed, cross-functional teams organize and collaborate on projects. Mural holds critical data of your organization, and this makes it a target for malicious actors.

Connecting Mural to Defender for Cloud Apps gives you improved insights into your users' activities and provides threat detection using machine learning based anomaly detections.

## Main threats

- Compromised accounts and insider threats
- Data leakage
- Insufficient security awareness
- Unmanaged bring your own device (BYOD)

## How Defender for Cloud Apps helps to protect your environment

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## Control Mural with policies

| **Type**                           | **Name**                                                     |
| ---------------------------------- | ------------------------------------------------------------ |
| **Built-in  anomaly detection policy** | [Activity from   anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)  <br /> [Activity from   infrequent country](anomaly-detection-policy.md#activity-from-infrequent-country) <br /> [Activity from   suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)  <br /> [Impossible travel](anomaly-detection-policy.md#impossible-travel)  <br /> [Activity   performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)   <br />[Multiple failed   login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)  <br /> |
| **Activity  policy**                   | Built a customized policy by using the [Mural Audit Log API](https://support.mural.co/s/article/audit-logs).  |

<!--check xrefs -->
For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

In addition to monitoring for potential threats, you can apply and automate the following Mural governance actions to remediate detected threats:

| **Type**        | **Action**                                                   |
| --------------- | ------------------------------------------------------------ |
| **User governance** | Notify user on  alert (via Microsoft Entra ID)<br />  Require user to sign in again (via Microsoft Entra ID)   <br /> Suspend user (via Microsoft Entra ID) |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Connect Mural to Microsoft Defender for Cloud Apps

This section provides instructions for connecting Microsoft Defender for Cloud Apps to your existing Mural account using the App Connector APIs. This connection gives you visibility into and control over Mural usage. 

**Prerequisites**:

- A Mural enterprise account is a pre-requisite for this connection. You must be signed-in as an admin to Mural.

**To connect Mural to Defender for Cloud Apps**:

1.	Sign into your [Mural](https://app.mural.co/) account and select your account icon > **Manage Company > Development > API keys > Create API key**.
1.	Select all checkboxes and then select **Create API Key** and then **Copy Key**.
1.	In the Microsoft Defender portal, select **Settings > Cloud Apps > Connected Apps > App Connectors > Connect an app > Mural**.
1.	In the connection wizard, enter your instance name, and then select **Next**.
1.	Paste the API key you'd copied from the Mural portal and then select **Submit**.

Once the connection is successfully established, Defender for Cloud Apps starts fetching Mural audit logs. Since Mural's API logs are delayed by 48 hours, the audit log ingestion to Defender for Cloud Apps is similarly delayed.

If you have any problems connecting the app, see [Troubleshooting App Connectors](/defender-cloud-apps/troubleshooting-api-connectors-using-error-messages).

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)


[!INCLUDE [Open support ticket](includes/support.md)]
