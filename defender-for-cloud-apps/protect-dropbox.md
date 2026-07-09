---
title: Protect your Dropbox environment | Microsoft Defender for Cloud Apps
description: Connect Dropbox to Microsoft Defender for Cloud Apps by using the API connector to monitor user activity, detect threats and external sharing risks, and enable automated remediation controls.
ms.date: 06/16/2026
ms.topic: how-to
ms.reviewer: AmitMishaeli
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# How Defender for Cloud Apps helps protect your Dropbox environment

As a cloud file storage and collaboration tool, Dropbox enables your users to share their documents across your organization and partners in a streamlined and efficient way. Using Dropbox may expose your sensitive data not only internally, but also to external collaborators, or even worse make it publicly available via a shared link. These data exposure incidents can be caused by malicious actors or unaware employees.

Connecting Dropbox to Defender for Cloud Apps gives you improved insights into your users' activities, provide threat detection using machine learning based anomaly detections, information protection detections such as detecting external information sharing, and enabling automated remediation controls.

> [!NOTE]
> Dropbox changed the way shared folders are stored, moving them to Team Spaces. The Defender for Cloud Apps file scan will be updated in due course to include Team Spaces.

## Main threats

- Compromised accounts and insider threats
- Data leakage
- Insufficient security awareness
- Malware
- Ransomware
- Unmanaged bring your own device (BYOD)

## How Defender for Cloud Apps helps to protect your environment

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Discover, classify, label, and protect regulated and sensitive data stored in the cloud](best-practices.md#discover-classify-label-and-protect-regulated-and-sensitive-data-stored-in-the-cloud)
- [Enforce DLP and compliance policies for data stored in the cloud](best-practices.md#enforce-dlp-and-compliance-policies-for-data-stored-in-the-cloud)
- [Limit exposure of shared data and enforce collaboration policies](best-practices.md#limit-exposure-of-shared-data-and-enforce-collaboration-policies)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## Control Dropbox with built-in policies and policy templates

You can use the following built-in policy templates to detect and notify you about potential threats:

> [!IMPORTANT]
> File policies retire on January 6, 2027. To maintain file-based data protection for this app, [migrate to Microsoft Purview DLP or auto-labeling policies](migrate-file-policies-to-purview.md).

| Type | Name |
| ---- | ---- |
| Built-in anomaly detection policy | [Activity from anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)<br />[Activity from infrequent country](anomaly-detection-policy.md#activity-from-infrequent-country)<br />[Activity from suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)<br />[Impossible travel](anomaly-detection-policy.md#impossible-travel)<br />[Activity performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)<br />[Malware detection](anomaly-detection-policy.md#malware-detection)<br />[Multiple failed login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)<br />[Ransomware detection](anomaly-detection-policy.md#ransomware-activity)<br />[Unusual file deletion activities](anomaly-detection-policy.md#unusual-activities-by-user)<br />[Unusual file share activities](anomaly-detection-policy.md#unusual-activities-by-user)<br />[Unusual multiple file download activities](anomaly-detection-policy.md#unusual-activities-by-user) |
| Activity policy template | Logon from a risky IP address<br />Mass download by a single user<br />Potential ransomware activity |
| File policy template | Detect a file shared with an unauthorized domain<br />Detect a file shared with personal email addresses<br />Detect files with PII/PCI/PHI |

For more information about creating policies, see [Create a policy in Defender for Cloud Apps](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

In addition to monitoring for potential threats, you can apply and automate the following Dropbox governance actions to remediate detected threats:

| Type | Action |
| ---- | ---- |
| Data governance | - Remove direct shared link<br />- Send DLP violation digest to file owners<br />- Trash file |
| User governance | - Notify user on alert (via Microsoft Entra ID)<br /> - Require user to sign in again (via Microsoft Entra ID)<br /> - Suspend user (via Microsoft Entra ID) |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Protect Dropbox in real time

Review our best practices for [securing and collaborating with external users](best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls) and [blocking and protecting the download of sensitive data to unmanaged or risky devices](best-practices.md#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices).

<a name="saas-security-posture-management"></a>
## SaaS security posture management for Dropbox

[Connect Dropbox](#connect-dropbox-to-microsoft-defender-for-cloud-apps) to automatically get security posture recommendations for Dropbox in Microsoft Secure Score. In Secure Score, select **Recommended actions** and filter by **Product** = **Dropbox**. Dropbox supports security recommendations to *Enable web session timeout for web users*.

For more information, see:

- [Security posture management for SaaS apps](security-saas.md)
- [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

## Connect Dropbox to Microsoft Defender for Cloud Apps

Use the following instructions to connect Microsoft Defender for Cloud Apps to your existing Dropbox account using the connector APIs. This connection gives you visibility into and control over Dropbox use.

Dropbox enables access to files from shared links without signing in, Defender for Cloud Apps registers these users as Unauthenticated users. If you see unauthenticated Dropbox users, it might indicate users who aren't from your organization, or they might be recognized users from within your organization who didn't sign in.

**To connect Dropbox to Defender for Cloud Apps**

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**.

1. In the **App connectors** page, select **+Connect an app**, followed by **Dropbox**.

    :::image type="content" source="media/connect-dropbox/connect-an-app-drop-box.png" alt-text="Screenshot that shows how to connect Dropbox in the Microsoft Defender portal." lightbox="media/connect-dropbox/connect-an-app-drop-box.png":::

1. In the next window, give the connector a name and select **Next**.

1. In the **Enter details** window, enter the admin account email address.

1. In the **Follow the link** window, select **Connect Dropbox**.

    The Dropbox sign in page opens. Enter your credentials to allow Defender for Cloud Apps access to your team's Dropbox instance.

1. Dropbox asks you if you want to allow Defender for Cloud Apps access to your team information, activity log, and perform activities as a team member. To proceed, select **Allow**.

1. Back in the Defender for Cloud Apps console, you should receive a message that Dropbox was successfully connected.

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**. Make sure the status of the connected App Connector is **Connected**.

   After connecting DropBox, you'll receive events for seven days prior to connection.

> [!NOTE]
> Any Dropbox events for adding a file are displayed in Defender for Cloud Apps as Upload file to align to all other apps connected to Defender for Cloud Apps.

If you have any problems connecting the app, see [Troubleshooting App Connectors](troubleshooting-api-connectors-using-error-messages.md).

## Related content

- [Control cloud apps with policies](control-cloud-apps-with-policies.md)
