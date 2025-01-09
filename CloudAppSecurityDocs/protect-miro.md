---
title: Protect your Miro environment
description: This article provides information about the benefits of connecting your Miro app to Defender for Cloud Apps using the API connector for visibility and control over use.
ms.date: 12/06/2023
ms.topic: how-to
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

- A Miro account with an enterprise plan is a pre-requisite for this connection. You must sign-in as a company admin to Miro. 

**To connect Miro to Defender for Cloud Apps**:

1. Sign into [Miro](https://miro.com/app/dashboard/) portal with a company admin account.
2. Create a developer team from the portal. To create a developer team, navigate to **Company Settings > User & Team management > Teams > Create new team**.
3. Give a descriptive name to the team and set the permissions to ‘Default’. Select ‘Create as a Developer Team’ and create the team.
4. Create a new application in the newly created developer team. To create a new application, navigate to **Profile settings > Your apps** and click on **‘Create new app’**
5. Give a name to the app, select the newly created developer team, and click on **Create app**.
6. Copy the Client ID and Client secret for future reference. 
7. Provide 'https://portal.cloudappsecurity.com/api/oauth/saga' as the 'Redirect URI for OAuth2.0'.
8. Provide ‘auditlogs:read’ and ‘organization:read; permissions and click on **Install app and get OAuth token**.
9. In the [Defender for Cloud Apps](https://portal.cloudAppSecurity.com) portal, navigate to Investigate >Connected apps.
10. In the App connectors page, click on Connect an app and choose Miro. 
11. Enter a name for Miro connection in the connection wizard and click on Connect Miro.
12. Enter the Client ID, Client secret and click on Connect in Miro.
13. Select the Miro team that you want to connect with Defender for Cloud Apps and click on Add again. Note that this Miro team is different from the developer team in which you created the app.
14. Click on Test now to make sure the connection succeeded. Audit events will start flowing into Defender for Cloud apps from the time the connection is successfully established.

If you have any problems connecting the app, see [Troubleshooting App Connectors](/defender-cloud-apps/troubleshooting-api-connectors-using-error-messages).

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)


[!INCLUDE [Open support ticket](includes/support.md)]
