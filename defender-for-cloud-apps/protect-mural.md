---
title: Protect your Mural environment | Microsoft Defender for Cloud Apps
description: Connect Mural to Microsoft Defender for Cloud Apps by using the API connector to monitor user activity and detect anomalous behavior.
ms.date: 07/03/2026
ms.topic: how-to
ms.reviewer: AmitMishaeli
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# How Microsoft Defender for Cloud Apps helps protect your Mural environment (Preview)

Mural is an online workspace where teams can organize and work together on projects. Mural holds key data for your organization, which makes it a target for malicious actors.

When you connect Mural to Defender for Cloud Apps, you get better visibility into user activity. You also get threat detection with machine learning based anomaly detections.

<a name="main-threats"></a>
## Main threats to your Mural environment

Connecting Mural without adequate protection exposes your organization to the following threats:

- Compromised accounts and insider threats
- Data leakage
- Insufficient security awareness
- Unmanaged bring your own device (BYOD)

## How Defender for Cloud Apps helps to protect your environment

Defender for Cloud Apps can help protect your Mural environment in the following ways:

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## Control Mural with policies

You can use these policy types to monitor and control Mural.

> [!NOTE]
> The **Activity performed by terminated user** policy requires Microsoft Entra ID as your identity provider (IdP).

| **Type**                           | **Name**                                                     |
| ---------------------------------- | ------------------------------------------------------------ |
| **Built-in  anomaly detection policy** | [Activity from   anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)  <br /> [Activity from   infrequent country](anomaly-detection-policy.md#activity-from-infrequent-country) <br /> [Activity from   suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)  <br /> [Impossible travel](anomaly-detection-policy.md#impossible-travel)  <br /> [Activity   performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)   <br />[Multiple failed   login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)  <br /> |
| **Activity  policy**                   | Build a custom policy with the [Mural Audit Log API](https://support.mural.co/s/article/audit-logs).  |

<!--check xrefs -->
For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

You can also apply and automate these Mural governance actions to fix detected threats:

| **Type**        | **Action**                                                   |
| --------------- | ------------------------------------------------------------ |
| **User governance** | Notify user on  alert (via Microsoft Entra ID)<br />  Require user to sign in again (via Microsoft Entra ID)   <br /> Suspend user (via Microsoft Entra ID) |

To learn more about fixing threats from apps, see [Governing connected apps](governance-actions.md).

## Connect Mural to Microsoft Defender for Cloud Apps

The following instructions explain how to connect Microsoft Defender for Cloud Apps to your existing Mural account using the App Connector APIs. This connection gives you visibility into and control over Mural usage.

### Prerequisites

- A Mural enterprise account. 
- You must be signed-in as an admin to Mural.

<a name="to-connect-mural-to-defender-for-cloud-apps"></a>
### Connect Mural to Defender for Cloud Apps

Perform the following steps to connect Mural to Defender for Cloud Apps:

1.	Sign into your [Mural](https://app.mural.co/) account.
1.	Create an API Key and then copy the key.
1.	In the Microsoft Defender portal, select **Settings > Cloud Apps > Connected Apps > App Connectors > Connect an app > Mural**.
1.	In the connection wizard, enter your instance name, and then select **Next**.
1.	Paste the API key you copied from the Mural portal and then select **Submit**.

After the connection is established, Defender for Cloud Apps starts fetching Mural audit logs. Because Mural's API logs are delayed by 48 hours, audit log ingestion into Defender for Cloud Apps is also delayed by 48 hours.



## Next steps

- If you have any problems connecting the app, see [Troubleshooting App Connectors](/defender-cloud-apps/troubleshooting-api-connectors-using-error-messages).

- Learn how to [Control cloud apps with policies](control-cloud-apps-with-policies.md).
