---
title: Protect your Asana environment | Microsoft Defender for Cloud Apps
description: Learn how about connecting your Asana app to Defender for Cloud Apps using the API connector.
ms.date: 01/04/2026
ms.topic: how-to
ms.reviewer: AmitMishaeli
ms.custom: sfi-image-nochange
---

# How Defender for Cloud Apps helps protect your Asana environment

Asana is a cloud-based project management tool that enables your users to collaborate on projects and tasks across your organization and partners in a streamlined and efficient way. Asana holds critical data of your organization, and this makes it a target for malicious actors. 

Connecting Asana to Defender for Cloud Apps gives you improved insights into your users' activities and provides threat detection using machine learning based anomaly detections.

Main threats include:

- Compromised accounts and insider threats
- Data leakage
- Insufficient security awareness
- Unmanaged bring your own device (BYOD)

## Control Asana with policies

| **Type**                           | **Name**                                                     |
| ---------------------------------- | ------------------------------------------------------------ |
| **Built-in  anomaly detection policy** | [Activity from   anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)  <br /> [Activity from   infrequent country](anomaly-detection-policy.md#activity-from-infrequent-country) <br /> [Activity from   suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)  <br /> [Impossible travel](anomaly-detection-policy.md#impossible-travel)  <br /> [Activity   performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)   <br />[Multiple failed   login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)  <br /> |
| **Activity  policy**                   | Built a customized policy by using the [Asana Audit Log](https://developers.asana.com/docs/audit-log-events) activities |

For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

In addition to monitoring for potential threats, you can apply and automate the following Asana governance actions to remediate detected threats:

| **Type**        | **Action**                                                   |
| --------------- | ------------------------------------------------------------ |
| **User governance** | Notify user on  alert (via Microsoft Entra ID)<br />  Require user to sign in again (via Microsoft Entra ID)   <br /> Suspend user (via Microsoft Entra ID) |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Connect Asana to Defender for Cloud Apps

This section describes how to connect Microsoft Defender for Cloud Apps to your existing Asana account using the App Connector APIs. This connection gives you visibility into and control over your organization's Asana use.

### Prerequisites

- An Asana enterprise account. 
- You must be signed-in as an admin to Asana. 

### To connect Asana:

1. Sign in to [Asana](https://app.asana.com/) with an admin account.
1. Copy the service account Token. You might have to **Reset and generate new token** to copy the token if you have an existing service account. 

1. Copy the workspace ID from the URL and save it for future reference.

### Configure Defender for Cloud Apps

1. In the [Microsoft Defender portal](https://security.microsoft.com), navigate to **Settings > Cloud Apps > Connected apps > App Connectors**.
1. Select **Connect an app** and then select **Asana.**
1. Enter an Instance name, and select **Next.**
1. Enter the copied access token and workspace ID in API Key and workspace ID fields. Once entered select **Submit.**
1. Defender for Cloud Apps will start to fetch Asana audit logs once the connection is successfully established.


## Related content

- If you have any problems connecting the app, see [Troubleshooting App Connectors](/defender-cloud-apps/troubleshooting-api-connectors-using-error-messages).
- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)
