---
title: Protect your Microsoft 365 environment | Microsoft Defender for Cloud Apps
description: Learn how about connecting your Microsoft 365 app to Defender for Cloud Apps using the API connector.
ms.date: 12/06/2023
ms.topic: how-to
---
# How Defender for Cloud Apps helps protect your Microsoft 365 environment



As a major productivity suite providing cloud file storage, collaboration, BI, and CRM tools, Microsoft 365 enables your users to share their documents across your organization and partners in a streamlined and efficient way. Using Microsoft 365 may expose your sensitive data not only internally, but also to external collaborators, or even worse make it publicly available via a shared link. Such incidents might occur due to malicious actor, or by an unaware employee. Microsoft 365 also provides a large third-party app eco-system to help boost productivity. Using these apps can expose your organization to the risk of malicious apps or use of apps with excessive permissions.

Connecting Microsoft 365 to Defender for Cloud Apps gives you improved insights into your users' activities, provides threat detection using machine learning based anomaly detections, information protection detections (such as detecting external information sharing), enables automated remediation controls, and detects threats from enabled third-party apps in your organization.

Defender for Cloud Apps integrates directly with [Microsoft 365's audit logs](/microsoft-365/compliance/detailed-properties-in-the-office-365-audit-log?view=o365-worldwide&preserve-view=true) and provides protection for all supported services. For a list of supported services, see [Microsoft 365 services that support auditing](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#microsoft-365-services-that-support-auditing).

[!INCLUDE [security-posture-management-connector](includes/security-posture-management-connector.md)]


## File scanning improvements for Microsoft 365

Defender for Cloud Apps has added new file scanning improvements for SharePoint and OneDrive:

- Faster near-real-time scanning speed for files in SharePoint and OneDrive.  

- Better identification for a file's access level in SharePoint: file access level in SharePoint will be marked by default as **Internal**, and not as **Private** (since every file in SharePoint is accessible by the site owner, and not only by the file owner).

    >[!NOTE]
    >This change could impact your file policies (if a file policy is looking for **Internal** or **Private** files in SharePoint).

## Main threats

- Compromised accounts and insider threats
- Data leakage
- Insufficient security awareness
- Malicious third-party apps
- Malware
- Phishing
- Ransomware
- Unmanaged bring your own device (BYOD)

## How Defender for Cloud Apps helps to protect your environment

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Discover, classify, label, and protect regulated and sensitive data stored in the cloud](best-practices.md#discover-classify-label-and-protect-regulated-and-sensitive-data-stored-in-the-cloud)
- [Discover and manage OAuth apps that have access to your environment](manage-app-permissions.md)
- [Enforce DLP and compliance policies for data stored in the cloud](best-practices.md#enforce-dlp-and-compliance-policies-for-data-stored-in-the-cloud)
- [Limit exposure of shared data and enforce collaboration policies](best-practices.md#limit-exposure-of-shared-data-and-enforce-collaboration-policies)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## Control Microsoft 365 with built-in policies and policy templates

You can use the following built-in policy templates to detect and notify you about potential threats:

| Type | Name |
| ---- | ---- |
| Built-in anomaly detection policy | [Activity from anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)<br />[Activity from infrequent country](anomaly-detection-policy.md#activity-from-infrequent-country)<br />[Activity from suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)<br />[Impossible travel](anomaly-detection-policy.md#impossible-travel)<br />[Activity performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)<br />[Malware detection](anomaly-detection-policy.md#malware-detection)<br />[Multiple failed login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)<br />[Ransomware detection](anomaly-detection-policy.md#ransomware-activity)<br />[Suspicious email deletion activity (Preview)](anomaly-detection-policy.md#suspicious-email-deletion-activity-preview)<br />[Suspicious inbox forwarding](anomaly-detection-policy.md#suspicious-inbox-forwarding)<br />[Unusual file deletion activities](anomaly-detection-policy.md#unusual-activities-by-user)<br />[Unusual file share activities](anomaly-detection-policy.md#unusual-activities-by-user)<br />[Unusual multiple file download activities](anomaly-detection-policy.md#unusual-activities-by-user) |
| Activity policy template | Logon from a risky IP address<br />Mass download by a single user<br />Potential ransomware activity<br />Access level change (Teams)<br />External user added (Teams)<br />Mass deletion (Teams) |
| File policy template | Detect a file shared with an unauthorized domain<br />Detect a file shared with personal email addresses<br />Detect files with PII/PCI/PHI |
| OAuth app anomaly detection policy | [Misleading OAuth app name](app-permission-policy.md#oauth-app-anomaly-detection-policies)<br />[Misleading publisher name for an OAuth app](app-permission-policy.md#oauth-app-anomaly-detection-policies)<br />[Malicious OAuth app consent](app-permission-policy.md#oauth-app-anomaly-detection-policies) |

For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

In addition to monitoring for potential threats, you can apply and automate the following Microsoft 365 governance actions to remediate detected threats:

| Type | Action |
| ---- | ---- |
| Data governance | **OneDrive:**<br /> - Inherit parent folder permissions<br /> - Make file/folder private<br /> - Put file/folder in admin quarantine<br /> - Put file/folder in user quarantine<br /> - Trash file/folder<br /> - Remove a specific collaborator<br /> - Remove external collaborators on file/folder<br /> - Apply Microsoft Purview Information Protection sensitivity label<br /> - Remove Microsoft Purview Information Protection sensitivity label<br /> **SharePoint:**<br /> - Inherit parent folder permissions<br /> - Make file/folder private<br /> - Put file/folder in admin quarantine<br /> - Put file/folder in user quarantine<br /> - Put file/folder in user quarantine and add owner permissions<br /> - Trash file/folder<br /> - Remove external collaborators on file/folder<br /> - Remove a specific collaborator<br /> - Apply Microsoft Purview Information Protection sensitivity label<br /> - Remove Microsoft Purview Information Protection sensitivity label |
| User governance | - Notify user on alert (via Microsoft Entra ID)<br /> - Require user to sign in again (via Microsoft Entra ID)<br /> - Suspend user (via Microsoft Entra ID) |
| OAuth app governance | - Revoke OAuth app permission |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Protect Microsoft 365 in real time

Review our best practices for [securing and collaborating with external users](best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls) and [blocking and protecting the download of sensitive data to unmanaged or risky devices](best-practices.md#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices).

## Defender for Cloud Apps integration with Microsoft 365
  
Defender for Cloud Apps supports the legacy Microsoft 365 Dedicated Platform as well as the latest offerings of Microsoft 365 services, commonly referred as the *vNext* release family of Microsoft 365.

In some cases, a vNext service release differs slightly at the administrative and management levels from the standard Microsoft 365 offering.

### Audit logging

Defender for Cloud Apps integrates directly with [Microsoft 365's audit logs](/microsoft-365/compliance/detailed-properties-in-the-office-365-audit-log?view=o365-worldwide&preserve-view=true) and receives all audited events from all supported services. For a list of supported services, see [Microsoft 365 services that support auditing](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#microsoft-365-services-that-support-auditing).

- Exchange administrator audit logging, which is enabled by default in Microsoft 365, logs an event in the Microsoft 365 audit log when an administrator (or a user who has been assigned administrative privileges) makes a change in your Exchange Online organization. Changes made using the Exchange admin center or by running a cmdlet in Windows PowerShell are logged in the Exchange admin audit log. For more detailed information about admin audit logging in Exchange, see [Administrator audit logging](/exchange/security-and-compliance/exchange-auditing-reports/view-administrator-audit-log).

- Events from **Exchange**, **Power BI**, and **Teams** will only appear after activities from those services are detected in the portal.


- [Multi-geo deployments](/microsoft-365/enterprise/microsoft-365-multi-geo) are only supported for OneDrive

### Microsoft Entra integration

- If your Microsoft Entra ID is set to automatically sync with the users in your Active Directory on-premises environment the settings in the on-premises environment override the Microsoft Entra settings and use of the **Suspend user** governance action is reverted.

- For Microsoft Entra sign-in activities, Defender for Cloud Apps only surfaces interactive sign-in activities and sign-in activities from legacy protocols such as ActiveSync. Non-interactive sign-in activities may be viewed in the Microsoft Entra audit log.

- If Office apps are enabled, groups that are part of Microsoft 365 are also imported to Defender for Cloud Apps from the specific Office apps, for example, if SharePoint is enabled, Microsoft 365 groups are imported as SharePoint groups as well.

### Quarantine support

- In SharePoint and OneDrive, Defender for Cloud Apps supports user quarantine only for files in **Shared Documents** libraries (SharePoint Online) and files in the **Documents** library (OneDrive for Business).

- In SharePoint, Defender for Cloud Apps supports quarantine tasks only for files with **Shared Documents** in path in English.


## Connect Microsoft 365 to Microsoft Defender for Cloud Apps

This section provides instructions for connecting Microsoft Defender for Cloud Apps to your existing Microsoft 365 account using the app connector API. This connection gives you visibility into and control over Microsoft 365 use. For information about how Defender for Cloud Apps protects Microsoft 365, see [Protect Microsoft 365](protect-office-365.md).

[!INCLUDE [security-posture-management-connector](includes/security-posture-management-connector.md)]

**Prerequisites**:

- You must have at least one assigned Microsoft 365 license to connect Microsoft 365 to Defender for Cloud Apps.

- To enable monitoring of Microsoft 365 activities in Defender for Cloud Apps, you are required to enable auditing in [Microsoft Purview](/purview/audit-log-enable-disable).

- Exchange Mailbox audit logging must be turned on for each user mailbox before user activity in Exchange Online is logged, see [Exchange Mailbox activities](https://support.office.com/article/Search-the-audit-log-in-the-Office-365-Security-Compliance-Center-0d4d0f35-390b-4518-800e-0c7ec95e946c).

- You must [enable auditing in Power BI](/power-bi/admin/service-admin-auditing) to get the logs from there. Once auditing is enabled, Defender for Cloud Apps starts getting the logs (with a delay of 24-72 hours).
- You must [enable auditing in Dynamics 365](/power-platform/admin/enable-use-comprehensive-auditing#enable-auditing) to get the logs from there. Once auditing is enabled, Defender for Cloud Apps starts getting the logs (with a delay of 24-72 hours).


**To connect Microsoft 365 to Defender for Cloud Apps**:

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**.
1. In the **App connectors** page, select **+Connect an app**, and then select **Microsoft 365**.

    ![Connect O365 menu option.](media/connect-o365.png)

1. In the **Select Microsoft 365 components** page, select the options you require, and then select **Connect**.

    > [!NOTE]
    >
    > - For best protection, we recommend selecting all Microsoft 365 components.
    > - The **Azure AD files** component, requires the **Azure AD activities** component and Defender for Cloud Apps file monitoring (**Settings** > **Cloud Apps** > **Files** > **Enable file monitoring**).

    ![connect O365 components.](media/connect-o365-components.png)

1. On the **Follow the link** page, select **Connect Microsoft 365**.

1. After Microsoft 365 is displayed as successfully connected, select **Done**.
1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**. Make sure the status of the connected App Connector is **Connected**.

SaaS Security Posture Management (SSPM) data is shown in the Microsoft Defender Portal on the **Secure Score** page. For more information, see [Security posture management for SaaS apps](/defender-cloud-apps/security-saas).

> [!NOTE]
> After connecting Microsoft 365, you will see data from a week back including any third-party applications connected to Microsoft 365 that are pulling APIs. For third-party apps that weren't pulling APIs prior to connection, you see events from the moment you connect Microsoft 365 because Defender for Cloud Apps turns on any APIs that had been off by default.

If you have any problems connecting the app, see [Troubleshooting App Connectors](troubleshooting-api-connectors-using-error-messages.md).

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]
