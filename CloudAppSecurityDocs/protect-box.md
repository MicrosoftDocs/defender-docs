---
title: Protect your Box environment | Microsoft Defender for Cloud Apps
description: Learn how about connecting your Box app to Defender for Cloud Apps using the API connector.
ms.date: 12/05/2023
ms.topic: how-to
---
# How Defender for Cloud Apps helps protect your Box environment



As a cloud file storage and collaboration tool, Box enables your users to share their documents across your organization and partners in a streamlined and efficient way. Using Box may expose your sensitive data not only internally, but also to external collaborators, or even worse make it publicly available via a shared link. Such incidents can be caused by malicious actors, or by unaware employees.

Connecting Box to Defender for Cloud Apps gives you improved insights into your users' activities, provide threat detection using machine learning based anomaly detections, information protection detections such as detecting external information sharing, and enabling automated remediation controls.

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

## Control Box with built-in policies and policy templates

You can use the following built-in policy templates to detect and notify you about potential threats:

| Type | Name |
| ---- | ---- |
| Built-in anomaly detection policy | [Activity from anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)<br />[Activity from infrequent country](anomaly-detection-policy.md#activity-from-infrequent-country)<br />[Activity from suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)<br />[Impossible travel](anomaly-detection-policy.md#impossible-travel)<br />[Activity performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)<br />[Malware detection](anomaly-detection-policy.md#malware-detection)<br />[Multiple failed login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)<br />[Ransomware detection](anomaly-detection-policy.md#ransomware-activity)<br />[Unusual administrative activities](anomaly-detection-policy.md#unusual-activities-by-user)<br />[Unusual file deletion activities](anomaly-detection-policy.md#unusual-activities-by-user)<br />[Unusual file share activities](anomaly-detection-policy.md#unusual-activities-by-user)<br />[Unusual multiple file download activities](anomaly-detection-policy.md#unusual-activities-by-user) |
| Activity policy template | Logon from a risky IP address<br />Mass download by a single user<br />Potential ransomware activity |
| File policy template | Detect a file shared with an unauthorized domain<br />Detect a file shared with personal email addresses<br />Detect files with PII/PCI/PHI |

For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

In addition to monitoring for potential threats, you can apply and automate the following Box governance actions to remediate detected threats:

| Type | Action |
| ---- | ---- |
| Data governance | - Change shared link access level on folders<br />- Put folders in admin quarantine<br />- Put folders in user quarantine<br />- Remove a collaborator from folders<br />- Remove direct shared links on folders<br />- Remove external collaborators on folders<br />- Send DLP violation digest to file owners<br />- Send violation digest to last file editor<br />- Set expiration date to a folder shared link<br /> - Trash folder |
| User governance | - Suspend user<br />- Notify user on alert (via Microsoft Entra ID)<br />- Require user to sign in again (via Microsoft Entra ID)<br />- Suspend user (via Microsoft Entra ID) |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Protect Box in real time

Review our best practices for [securing and collaborating with external users](best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls) and [blocking and protecting the download of sensitive data to unmanaged or risky devices](best-practices.md#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices).

## Connect Box to Microsoft Defender for Cloud Apps

This section provides instructions for connecting Microsoft Defender for Cloud Apps to your existing Box account using the App Connector APIs. This connection gives you visibility into and control over Box use. For information about how Defender for Cloud Apps protects Box, see [Protect Box](protect-box.md).

> [!NOTE]
> Deploying with an account that is not an Admin account leads to a failure in the API test and does not allow Defender for Cloud Apps to scan all of the files in Box. If this is a problem for you, you can deploy with a Co-Admin that has all of the privileges checked, but the API test will continue to fail and files owned by other admins in Box will not be scanned.

**To connect Box to Defender for Cloud Apps**:

1. If you restrict application permission access, follow this step. Otherwise, skip to step 2.

    1.  Sign into your Box account as an Admin user.
    1.  Go to the custom app settings. For more information, see [Managing custom apps – Box Support](https://support.box.com/hc/en-us/articles/360044196653-Managing-custom-apps#:~:text=Open%20your%20Admin%20Console.%20In%20the%20left%20sidebar%2C,you%20want%20to%20enforce%2C%20click%20the%20slider%20button.)
    1.  If your settings are configured to disable unpublished apps by default, enter the Defender for Cloud Apps API key for your data center, as listed in the following table, and save your changes.

        | **Data center**<br> | **Defender for Cloud Apps API key**<br> |
        | --- | --- |
        | US1 | `nduj1o3yavu30dii7e03c3n7p49cj2qh` |
        | US2 | `w0ouf1apiii9z8o0r6kpr4nu1pvyec75` |
        | US3 | `dmcyvu1s9284i2u6gw9r2kb0hhve4a0r`|
        | EU1| `me9cm6n7kr4mfz135yt0ab9f5k4ze8qp` |
        | EU2 | `uwdy5r40t7jprdlzo85v8suw1l4cdsbf`|

        Your data center details are shown in the Defender for Cloud Apps **About** page in the **Settings** area. For more information, see [View your data center](network-requirements.md#view-your-data-center).

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**.

1. In the **App connectors** page, select **+Connect an app**, and then select **Box**.

    ![Connect Box.](media/connect-box.png "Connect Box")

1. In the **Instance name** page, enter a name for the connection. Then select **Next**.

1. In the **Follow the link** pop-up, select **Connect Box**.

1. The Box sign-in page opens. Enter your credentials to allow Defender for Cloud Apps access to your team's Box app.

1. Box asks you if you want to allow Defender for Cloud Apps access to your team information, activity log, and perform activities as a team member. To proceed, select **Allow**.

1. Back in the Microsoft Defender Portal, you should receive a message saying that Box was successfully connected.

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**. Make sure the status of the connected App Connector is **Connected**.

**After connecting Box**:

- You'll receive events for the 7 days prior to connection.
- Defender for Cloud Apps will perform a full scan of all files. Depending on how many files and users you have, completing the full scan can take a while.

To enable near real-time scanning, files on which activities are detected are moved to the beginning of the scan queue. For example, a file that is edited, updated, or shared is scanned right away rather than waiting for the regular scan process. Near real-time scanning doesn't apply to files that aren't inherently modified. For example, files that are viewed, previewed, printed, or exported are scanned as part of the regularly scheduled scan.

If you have any problems connecting the app, see [Troubleshooting App Connectors](troubleshooting-api-connectors-using-error-messages.md).

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]