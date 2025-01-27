---
title: Protect your Egnyte environment (Preview) | Microsoft Defender for Cloud Apps
description: Learn how about connecting your Egnyte app to Defender for Cloud Apps using the API connector.
ms.date: 12/12/2024
ms.topic: how-to
---
# How Defender for Cloud Apps helps protect your Egnyte environment



Egnyte provides a cloud platform for enterprise file synchronization and sharing, as well as content and data governance. Along with the benefits of effective collaboration in the cloud, your organization's most critical assets may be exposed to threats. Preventing exposure of your critical assets in Egnyte requires continuous monitoring to prevent any malicious actors or security-unaware insiders from exfiltrating sensitive information.

Connecting Egnyte to Defender for Cloud Apps gives you improved insights into your users' activities and provides threat detection for anomalous behavior.

## Main threats

- Compromised accounts and insider threats

- Insufficient security awareness

- Unmanaged bring your own device (BYOD)

## How Defender for Cloud Apps helps to protect your environment

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)

- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## Control Egnyte with policies

| **Type**                           | **Name**                                                     |
| ---------------------------------- | ------------------------------------------------------------ |
| Built-in  anomaly detection policy | [Activity from anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses) <br> [Activity from infrequent countries/regions](anomaly-detection-policy.md#activity-from-infrequent-country) <br> [Activity from suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses) <br> [Impossible travel](anomaly-detection-policy.md#impossible-travel) <br> [Activity performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP) <br> [Multiple failed login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)  |
| Activity  policy                   | Build a customized policy by the Egnyte activities           |

For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

In addition to monitoring for potential threats, you can apply and automate the following Egnyte governance actions to remediate detected threats:

| **Type**        | **Action**                                                   |
| --------------- | ------------------------------------------------------------ |
| User governance | Notify user on  alert (via Microsoft Entra ID)<br />  Require user to sign in again (via Microsoft Entra ID)   <br /> Suspend user (via Microsoft Entra ID) |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Protect Egnyte in real time

Review our best practices for [securing and collaborating with external users](best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls) and [blocking and protecting the download of sensitive data to unmanaged or risky devices](best-practices.md#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices).

## Connect Egnyte to Microsoft Defender for Cloud Apps

This section describes how to connect Microsoft Defender for Cloud Apps to your existing Egnyte via the App Connector APIs. The resulting connection gives you visibility into and control over your organization's use of Egnyte.

### Prerequisites

- The authorizing user must be one of the following:

  - Power user with **can run reports** role
  - Administrator

- Audit reporting must be available in Egnyte's plan

**To connect Egnyte to Microsoft Defender for Cloud Apps**:

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**.

1. In the **App connectors** page, select **+Connect an app**, and then select **Egnyte**.

1. In the window that appears, give the connector a descriptive name, and then select **Next**.

1. In the **Enter details** page, in **Application URL**, insert your Egnyte URL by using the following format: `https://<domain_name>.egnyte.com`
1. Select **Next**.
1. Select **Connect Egnyte**.
1. In the redirected page, select **Allow**.
1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**. Make sure the status of the connected App Connector is **Connected**.

>[!NOTE]
>- Microsoft recommends using a short lived access token. Egnyte doesn't currently support short lived tokens. We recommend our customers to refresh the access token every 6 months as a security best practice. To refresh the access token, revoke the old token by following [Revoking an oAuth token](https://developers.egnyte.com/docs/read/Public_API_Authentication#Revoking-an-OAuth-Token). Once the old token is revoked, reconnect the Egnyte connector by following the process documented above.
>
>- Defender for Cloud Apps intentionally provides a lower rate limit than Egnyte's maximum to avoid exceeding the API constraints. For more information, see the relevant Egnyte documentation: [Rate limiting](https://developers.egnyte.com/docs/read/Best_Practices) | [Audit Reporting API v2](https://developers.egnyte.com/docs/read/Audit_Reporting_API_V2)

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps by using policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]
