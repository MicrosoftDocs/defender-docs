---
title: Protect your Salesforce environment | Microsoft Defender for Cloud Apps
description: Learn how about connecting your Salesforce app to Defender for Cloud Apps using the API connector.
ms.date: 01/05/2025
ms.topic: how-to
ms.reviewer: AmitMishaeli
---

# How Defender for Cloud Apps helps protect your Salesforce environment

As a major CRM cloud provider, Salesforce incorporates large amounts of sensitive information about customers, pricing playbooks, and major deals inside your organization. Being a business-critical app, Salesforce is accessed and used by people inside your organization and by others outside of it (such as partners and contractors) for various purposes. In many cases, a large proportion of your users accessing Salesforce have low awareness of security and might put your sensitive information at risk by unintentionally sharing it. In other instances, malicious actors might gain access to your most sensitive customer-related assets.

Connecting Salesforce to Defender for Cloud Apps gives you improved insights into your users' activities, provides threat detection using machine learning based anomaly detections and information protection detections (such as detecting external information sharing). It also enables automated remediation controls, and detects threats from enabled third-party apps in your organization.

[!INCLUDE [security-posture-management-connector](includes/security-posture-management-connector.md)]

## Main threats

- Compromised accounts and insider threats
- Data leakage
- Elevated privileges
- Insufficient security awareness
- Malicious third-party apps and Google add-ons
- Ransomware
- Unmanaged bring your own device (BYOD)


### Prerequisites

- Install and authorize the Salesforce Connected App in the target Salesforce org before you start the connection process. Salesforce enforces usage restrictions on Connected Apps. For more information, see:[Prepare for Connected App Usage Restrictions Change](https://help.salesforce.com/s/articleView?id=005132365&type=1)

- Assign the **Approve Uninstalled Connected Apps** permission to the Salesforce service account used to connect Microsoft Defender for Cloud Apps. Salesforce requires this permission to connect third-party apps via OAuth.

## How Defender for Cloud Apps helps to protect your environment

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Discover, classify, label, and protect regulated and sensitive data stored in the cloud](best-practices.md#discover-classify-label-and-protect-regulated-and-sensitive-data-stored-in-the-cloud)
- [Discover and manage OAuth apps that have access to your environment](manage-app-permissions.md)
- [Enforce DLP and compliance policies for data stored in the cloud](best-practices.md#enforce-dlp-and-compliance-policies-for-data-stored-in-the-cloud)
- [Limit exposure of shared data and enforce collaboration policies](best-practices.md#limit-exposure-of-shared-data-and-enforce-collaboration-policies)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## SaaS security posture management

[Connect Salesforce](#connect-salesforce-to-microsoft-defender-for-cloud-apps) to automatically get security recommendations for Salesforce in Microsoft Secure Score.

In Secure Score, select **Recommended actions** and filter by **Product** = **Salesforce**. For example, recommendations for Salesforce include:

- *Require identity verification during multi-factor authentication (MFA) registration*
- *Enforce login IP ranges on every request*
- *Maximum invalid login attempts*
- *Password complexity requirement*

For more information, see:
-	[Security posture management for SaaS apps](security-saas.md)
-	[Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

## Control Salesforce with built-in policies and policy templates

You can use the following built-in policy templates to detect and notify you about potential threats:

| Type | Name |
| ---- | ---- |
| Built-in anomaly detection policy | [Activity from anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)<br />[Activity from infrequent country](anomaly-detection-policy.md#activity-from-infrequent-country)<br />[Activity from suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)<br />[Impossible travel](anomaly-detection-policy.md#impossible-travel)<br />[Activity performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)<br />[Multiple failed login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)<br />[Unusual administrative activities](anomaly-detection-policy.md#unusual-activities-by-user)<br />[Unusual file deletion activities](anomaly-detection-policy.md#unusual-activities-by-user) (Temporarily not supported due to limitation in Salesforce API)<br />[Unusual file share activities](anomaly-detection-policy.md#unusual-activities-by-user)<br />[Unusual impersonated activities](anomaly-detection-policy.md#unusual-activities-by-user)<br />[Unusual multiple file download activities](anomaly-detection-policy.md#unusual-activities-by-user) |
| Activity policy template | Logon from a risky IP address<br />Mass download by a single user|
| File policy template | Detect a file shared with an unauthorized domain<br />Detect a file shared with personal email addresses|

For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

In addition to monitoring for potential threats, you can apply and automate the following Salesforce governance actions to remediate detected threats:

| Type | Action |
| ---- | ---- |
| User governance | - Notify users of pending alerts<br />- Send DLP violation digest to file owners<br />- Suspend user<br />- Notify user on alert (via Microsoft Entra ID)<br />- Require user to sign in again (via Microsoft Entra ID)<br />- Suspend user (via Microsoft Entra ID) |
| OAuth app governance | - Revoke OAuth app for users |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Protect Salesforce in real time

Review our best practices for [securing and collaborating with external users](best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls) and [blocking and protecting the download of sensitive data to unmanaged or risky devices](best-practices.md#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices).


## Connect Salesforce to Microsoft Defender for Cloud Apps

### Prerequisites 

- For all integrations other than SSPM, make sure that Salesforce Shield is available for your Salesforce instance.

This section provides instructions for connecting Microsoft  Defender for Cloud Apps to your existing Salesforce account using the app connector API. This connection gives you visibility into and control over Salesforce use.

[!INCLUDE [security-posture-management-connector](includes/security-posture-management-connector.md)]


1. In your Salesforce account, create a dedicated service admin account for Defender for Cloud Apps.

1. Make sure that the Salesforce account is assigned to one of the following editions, which support REST API access:

    - Performance
    - Enterprise
    - Unlimited
    - Developer
    - Professional. REST API must be added to the Professional edition separately.
 

1. Create a new profile for the Defender for Cloud Apps service account. This profile will be used to configure the App connector.

1. Make sure that the service account profile includes the following permissions:

    - **API Enabled**
    - **View All Data**
    - **Manage Salesforce CRM Content**
    - **Manage Users**
    - **[Query All Files](https://go.microsoft.com/fwlink/?linkid=2106480)**
    - **Modify Metadata Through Metadata API Functions**
    - **View Setup And Configuration**

1. If **Salesforce CRM Content** is active in your organization:
 - Grant Salesforce CRM Content access to the Defender for Cloud Apps service admin account.
 - Turn off **Lock sessions to the IP address from which they originated** for the service account profile.
 - Turn on **Content Deliveries and Public Links**. 

> [!NOTE]
> The Content Deliveries feature needs to be enabled for Defender for Cloud Apps to query file sharing data. For more information, see [ContentDistribution](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_contentdistribution.htm).

### How to connect Defender for Cloud Apps to Salesforce

1. In the Defender for Cloud Apps console, select **Investigate** and then **Connected apps**.

1. In the **App connectors** page, select **+Connect an app** followed by **Salesforce**.

    :::image type="content" source="media/connect-salesforce.png" alt-text="Screenshot that shows how to add the Salesforce app connector in the Defender portal." lightbox="media/connect-salesforce.png":::

1. In the next window, give the connection a name and select **Next**.

1. In the **Follow the link** page, select **Connect Salesforce**.

1. This opens the Salesforce sign in page. Enter your credentials to allow Defender for Cloud Apps access to your team's Salesforce app.

    :::image type="content" source="media/salesforce-logon.png" alt-text="Screenshot that shows a pop up and how to enter your Salesforce credentials." lightbox="media/salesforce-logon.png":::

1. Salesforce will ask you if you want to allow Defender for Cloud Apps access to your team information and activity log and perform any activity as any team member. To continue, select **Allow**.

1. At this point, you'll receive a success or failure notice for the deployment. Defender for Cloud Apps is now authorized in Salesforce.com.

1. Back in the Defender for Cloud Apps console, you should see the Salesforce was successfully connected message.

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**. Make sure the status of the connected App Connector is **Connected**.

After connecting Salesforce, you'll receive Events as follows: Log in events and Setup Audit Trail for seven days prior to connection, EventMonitoring 30 days, or one day back - depending on your Salesforce EventMonitoring license. The Defender for Cloud Apps API communicates directly with the APIs available from Salesforce. Because Salesforce limits the number of API calls it can receive, Defender for Cloud Apps takes this into account and respects the limitation. Salesforce APIs send each response with a field for the API counters, including total available and remaining. Defender for Cloud Apps calculates this into a percentage and makes sure to always leave 10% of available API calls remaining.

> [!NOTE]
> Defender for Cloud Apps throttling is calculated solely on its own API calls with Salesforce, not with those of any other applications making API calls with Salesforce.
>Limiting API calls due to throttling may temporarily slow data ingestion in Defender for Cloud Apps, but the process typically catches up overnight

> [!NOTE]
> If your Salesforce instance isn't in English, select the appropriate **language** attribute value for the integration service admin account.
>
> To change the language attribute, navigate to **Administration** -> **Users** -> **User** and open the integration system admin account. Now navigate to **Locale Settings** -> **Language** and select the desired language.

Defender for Cloud Apps processeS Salesforce events as follows:

* Sign-in events every 15 minutes
* Setup audit trails every 15 minutes
* Event logs every 1 hour. For more information about Salesforce events, see [Using event monitoring](https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/using_resources_event_log_files.htm).


## Next steps

- If you have any problems connecting the app, see [Troubleshooting App Connectors](troubleshooting-api-connectors-using-error-messages.md).

- [Control cloud apps with policies](control-cloud-apps-with-policies.md)


