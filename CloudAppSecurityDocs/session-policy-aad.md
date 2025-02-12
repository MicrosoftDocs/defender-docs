---
title: Create session policies | Microsoft Defender for Cloud Apps
description: Learn how to configure Microsoft Defender for Cloud Apps session policies with Conditional Access app control to gain visibility into user session activities and block downloads.
ms.date: 05/15/2024
ms.topic: how-to
---

# Create Microsoft Defender for Cloud Apps session policies

Microsoft Defender for Cloud Apps session policies provide granular visibility into cloud apps with real-time, session-level monitoring. Use session policies to take various actions, depending on the policy you set for a user session.

In contrast to [access policies](access-policy-aad.md), which allow or block access completely, session policies allow access while monitoring the session. Add Conditional Access app control to your session policies to limit specific session activities.

For example, you may want to allow users to access an app from unmanaged devices, or from specific locations. However, you may want to limit the download of sensitive files during those sessions or require that specific documents are protected from downloading, uploading, or copying when exiting the app.

Policies created for a host app are not connected to any related resource apps. For example, access policies that you create for Teams, Exchange, or Gmail are not connected to SharePoint, OneDrive, or Google Drive. If you need a policy for the resource app in addition to the host app, create a separate policy.

There is no limit to the number of policies that can be applied.

## Prerequisites

Before you start, make sure that you have the following prerequisites:

- A Defender for Cloud Apps license, either as a stand-alone license or as part of another license

- A license for Microsoft Entra ID P1, either as stand-alone license or as part of another license.

- If you're using a non-Microsoft IdP, the license required by your identity provider (IdP) solution.

- The relevant apps onboarded to Conditional Access app control. Microsoft Entra ID apps are automatically onboarded, while non-Microsoft IdP apps must be onboarded manually.

    If you're working with a non-Microsoft IdP, make sure that you've also configured your IdP to work with Microsoft Defender for Cloud Apps. For more information, see:

    - [Onboard non-Microsoft IdP catalog apps for Conditional Access app control](proxy-deployment-featured-idp.md)
    - [Onboard non-Microsoft IdP custom apps for Conditional Access app control](proxy-deployment-any-app-idp.md)

In order for your session policy to work, you must also have a Microsoft Entra ID Conditional Access policy, which creates the permissions to control traffic.

[!INCLUDE [entra-conditional-access-policy](includes/entra-conditional-access-policy.md)]

## Create a Defender for Cloud Apps session policy

This procedure describes how to create a new session policy in Defender for Cloud Apps.

1. In Microsoft Defender XDR, select the **Cloud Apps > Policies > Policy management > Conditional Access** tab.

1. Select **Create policy** > **Session policy**. For example:

    ![Screenshot of the Create a Conditional Access policy page.](media/create-policy-from-conditional-access-tab.png)
   
1. On the **Create session policy** page, start by either selecting a template from the **Policy template** dropdown, or by entering all details manually.

1. <a name="type"></a>Enter the following basic information for your policy. If you're using a template, much of the content is already filled in for you.

    |Name  |Description  |
    |---------|---------|
    |**Policy name**     |     A meaningful name for your policy, such as *Block Download of Sensitive Documents in Box for Marketing Users*    |
    |**Policy severity**     |  Select the severity you want to apply to your policy.        |
    |**Category**     |  Select the category you want to apply.       |
    | **Description** | Enter an optional, meaningful description for your policy to help your team understand its purpose. |
    | **Session control type** | Select one of the following options: <br><br>- **Monitor only**. Only monitors user activity and creates a *Monitor only* policy for the apps you select. <br>- **Block activities**.  Blocks specific activities defined by the **Activity type** filter. All activities from selected apps are monitored and reported in the Activity log. <br>- **Control file download (with inspection)**. Monitors file downloads, and can be combined with other actions, like blocking or protecting downloads. <br>- **Control file upload (with inspection)**. Monitors file uploads, and can be combined with other actions, like blocking or protecting uploads. <br><br> For more information, see [Supported activities for session policies](#supported-activities-for-session-policies). |

1. <a name="filter"></a>In the **Activities matching all of the following** area, select additional activity filters to apply to the policy. Filters include the following options: 

    |Name  |Description  |
    |---------|---------|
    | **Activity type** | Select the activity type you want to apply, such as: <br><br>- Printing <br>- Clipboard actions like cutting, copying, pasting <br>- Sending, sharing, unsharing, or editing items in supported apps.  <br><br>For example, use a *send items* activity in your conditions to catch a user attempting to send information in a Teams chat or Slack channel, and block the message if it contains sensitive information like a password or other credentials.|
    | **App** | Filters for a specific app to include in the policy. Select apps by first selecting whether they use **Automated Azure AD onboarding**, for Microsoft Entra ID apps, or **Manual onboarding**, for non-Microsoft IdP apps. Then, select the app you want to include in your filter from the list. <br><br>If your non-Microsoft IdP app is missing from the list, make sure that you've onboarded it fully. For more information, see: <br>- [Onboard non-Microsoft IdP catalog apps for Conditional Access app control](proxy-deployment-featured-idp.md).<br>- [Onboard non-Microsoft IdP custom apps for Conditional Access app control](proxy-deployment-any-app-idp.md)<br><br>If you choose not to use the **App** filter, the policy applies to all applications that are marked as **Enabled** on the **Settings > Cloud Apps > Connected apps > Conditional Access App Control apps** page. <br><br>**Note**: You may see some overlap between apps that are onboarded and apps that need manual onboarding. In case of a conflict in your filter between the apps, manually onboarded apps will take precedence.|
    | **Device** | Filter for device tags, such as for a specific device management method, or device types, such as PC, mobile, or tablet.|
    |**IP address**     |  Filter per IP address or use previously assigned IP address tags.       |
    |**Location**     |   Filter by geographic location. The absence of a clearly defined location may identify risky activities. |
    | **Registered ISP** |Filter for activities coming from a specific ISP.|
    | **User** | Filter for a specific user or group of users. |
    | **User agent string** |    Filter for a specific user agent string.|
    |**User agent tag**     | Filter for user agent tags, such as for outdated browsers or operating systems.  |

    For example:

    :::image type="content" source="media/session-policy-aad/onboarded-apps-filter.png" alt-text="Screenshot of a sample filter when creating an access policy.":::

    Select **Edit and preview results** to get a preview of the types of activities that would be returned with your current selection.

1. Configure extra options available for any specific session control types. 

    For example, if you selected **Block activities**, select **Use content inspection** to inspect the activity content, and then configure your settings as needed. In this case, you may want to inspect for text that includes specific expressions, such as a social security number.

1.  If you selected **Control file download (with inspection)** or **Control file upload (with inspection)**, configure the **Files matching all of the following** settings.

    1. Configure one of the following file filters:
        
        |Name  |Description  |
        |---------|---------|
        |**Sensitivity label**     | Filter by [Microsoft Purview Information Protection](azip-integration.md) sensitivity labels, if you also use Microsoft Purview, and your data is protected by its sensitivity labels.         |
        |**File name**     |  Filter for specific files.       |
        |**Extension**     |  Filter for specific file types, for example, block download for all .xls files.       |
        |**File size (MB)**     |    Filter for specific file sizes, such as large or small files.     |

    1. <a name="inspection"></a>In the **Apply to** area (Preview):

        - Select whether to apply the policy to all files, or files in specified folders only
        - Select an inspection method to use, such as data classification services, or malware. For more information, see [Microsoft Data Classification Services integration](dcs-inspection.md).
        - Configure more detailed options for your policy, such as scenarios based on elements like fingerprints or trainable classifiers.

1. <a name="actions"></a>In the **Actions** area, select one of the following options:
    
    |Name  |Description  |
    |---------|---------|
    |**Audit**     |   Monitors all activities. Select to explicitly allow download according to the policy filters you set.      |
    |**Block**     | Blocks file downloads and monitors all activities. Select to explicitly block downloads according to the policy filters you set. <br><br>Block policies also allow you to select to notify users by email, and to customize the block message.        |
    |**Protect**     |  Applies a sensitivity label to the download and monitors all activities. Available only if you'd selected **Control file download (with inspection)**.<br><br>If you use Microsoft Purview Information Protection, you can also select to apply a sensitivity label to matching files, apply custom permissions to the user downloading files, or block the download of specific files. <br><br>If you have a Microsoft Entra ID Conditional Access policy, you can also select to require step-up authentication (Preview).   |

    Optionally, select the **Always apply the selected action even if the data cannot be scanned** option as needed for your policy.

1. In the **Alerts** area, configure any of the following actions as needed:

    - **Create an alert for each matching event with the policy's severity**
    - **Send an alert as email**
    - **Daily alert limit per policy**
    - **Send alerts to Power Automate**

1. When you're done, select **Create**.

## Test your policy

After you've created your session policy, test it by re-authenticating to each app configured in the policy and testing the scenario you've configured in your policy.

We recommend that you:

- Sign out of all existing sessions before re-authenticating to your apps.
- Sign into mobile and desktop apps from both managed and unmanaged devices to ensure that activities are fully captured in the activity log.

Make sure to sign in with a user that matches your policy.

**To test your policy in your app**:

- Check to see if the lock :::image type="icon" source="media/in-browser-protection/lock.png"::: icon appears in your browser, or if you're working in a browser other than Microsoft Edge, check that your app URL contains the `.mcas` suffix. For more information, see [In-browser protection with Microsoft Edge for Business (Preview)](in-browser-protection.md).

- Visit all pages within the app that are part of a user's work process and verify that the pages render correctly.

- Verify that the behavior and functionality of the app isn't adversely affected by performing common actions such as downloading and uploading files.

- If you're working with custom, non-Microsoft IdP apps, check each of the domains that you've [manually added for your app](troubleshooting-proxy.md#add-domains-for-your-app).

If you encounter errors or issues, use the admin toolbar to gather resources such as `.har` files and recorded sessions for filing a support ticket.

**To check for updates in Microsoft Defender XDR**:

1. In the [Microsoft Defender Portal](https://security.microsoft.com), under **Cloud Apps**, go to **Policies**, then select **Policy management**. 

1. Select the policy you've created to view the policy report. A session policy match should appear shortly.

The policy report shows which sign-ins were redirected to Microsoft Defender for Cloud Apps for session control, as well as any other actions, such as which files were downloaded or blocked from the monitored sessions.

## Turn off user notification settings

By default, users are notified when their sessions are being monitored. If you'd prefer that your users are not notified, or to customize the notification message, configure notification settings.

In Microsoft Defender XDR, select **Settings > Cloud apps > Conditional Access App Control > User monitoring**.

Make one of the following selections:

- Clear the **Notify users that their activity is being monitored** option altogether
- Keep the selection and select to use either the default message or to customize your message.

Select the **Preview** link to view an example of the configured message in a new browser tab.

### Export Cloud discovery logs

Conditional Access App Control records the traffic logs of every user session that is routed through it. The traffic logs include the time, IP, user agent, URLs visited, and the number of bytes uploaded and downloaded. These logs are analyzed and a continuous report, **Defender for Cloud Apps Conditional Access App Control**, is added to the list of cloud discovery reports in the cloud discovery dashboard.

To export Cloud discovery logs from the cloud discovery dashboard:

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **Conditional Access App Control**.

1. Above the table, select the export button. For example:

    ![Screenshot of the export button.](media/export-button.png)
   
   
1. Select the range of the report and select **Export**. This process may take some time.

1. To download the exported log after the report is ready, in the Microsoft Defender Portal go to **Reports** -> **Cloud Apps** and then **Exported reports**.

1. In the table, select the relevant report from the list of **Conditional Access App Control traffic logs** and select **Download**. For example:

    ![Screenshot of the download button.](media/download-button.png)
   
## Supported activities for session policies

The following sections provide more details about each activity supported by Defender for Cloud Apps session policies.

### Monitor only

The **Monitor only** [session control type](#type) monitors only the *Login* activity. 

To monitor other activities, select one of the other session control types and use the **Audit** [action](#actions).

To monitor activities other than downloads and uploads, you must have at least one [block per activity](#block-specific-activities) policy in your monitor policy.

### <a name="block-download"></a>Block all downloads

When **Control file download (with inspection)** is set as the [session control type](#type), and **Block** is set as the [action](#actions), Conditional Access app control prevents users from downloading a file per the policies file filters. 

When a user initiates a download, a **Download restricted** message appears for the user, and the downloaded file is replaced with a text file. Configure the text file's message to the user as needed for your organization.

### Require step-up authentication

The **Require step-up authentication** [action](#actions) is available when the [session control type](#type) is set to **Block activities**, **Control file download (with inspection)**, or **Control file upload (with inspection)**.

When this action is selected, Defender for Cloud Apps redirects the session to Microsoft Entra Conditional Access for policy reevaluation, whenever the selected activity occurs.

Use this option to check claims like multi-factor authentication and device compliance during a session, based on the configured authentication context in Microsoft Entra ID.

<a name="block-activities"></a>
## Block specific activities

When **Block activities** is set as the [session control type](#type), select specific activities to block in specific apps.

- All activities from configured apps are monitored and reported in the **Cloud apps > Activity log**.

- To block specific activities, further select the **Block** [action](#actions) and select the activities you want to block.

- To raise alerts for specific activities, select the **Audit** [action](#actions) and configure your alert settings.

For example, you might want to block the following activities:

- **Sent Teams message**. Block users from sending messages from Microsoft Teams, or block Teams messages that contain specific content.

- **Print**. Block all print actions.

- **Copy**. Block all copy to clipboard actions, or only block copying for specific content only.

## <a name="protect-download"></a>Protect files on download

Select the **Block activities** [session control type](#type) to block specific activities, which you define using the **Activity type** [filter](#filter).

All activities from configured apps are monitored and reported in the **Cloud apps > Activity log**.

- Select the **Block** [action](#actions) to block specific activities, or select the **Audit** [action](#actions) and define alert settings to raise alerts for specific activities.

- Select the **Protect** [action](#actions) to protect files with sensitivity labeling and other protections as per the policy's file filters.

    Sensitivity labels are configured in Microsoft Purview and must be configured to apply encryption for it to appear as an option in the Defender for Cloud Apps session policy.

    When you've configured your session policy with a specific label and the user downloads a file that meets the policy's criteria, the label and any corresponding protections and permissions are applied on the file.

    The original file remains as it was in the cloud app while the downloaded file is protected. Users who try to access the downloaded file must meet the permission requirements determined by the protection applied.

Defender for Cloud Apps currently supports applying [sensitivity labels from Microsoft Purview Information Protection](azip-integration.md) for the following file types:

* **Word**: docm, docx, dotm, dotx
* **Excel**: xlam, xlsm, xlsx, xltx
* **PowerPoint**: potm, potx, ppsx, ppsm, pptm, pptx
* **PDF**

> [!NOTE]
> PDF files must be labeled with unified labels.
>
> The **Protect** option doesn't support overwriting files with an existing label in session policies.

<a name="protect-upload"></a>
### Protect uploads of sensitive files

Select the **Control file upload (with inspection)** [session control type](#type) to prevent a user from uploading a file as per the policy's file filters.

If the file being upload has sensitive data and doesn't have the right label, the file upload is blocked.

For example, create a policy that scans the content of a file to determine if it contains a sensitive content match such as a social security number. If it contains sensitive content and isn't labeled with a Microsoft Purview Information Protection *Confidential* label, the file upload is blocked.

> [!TIP]
> Configure a custom message to the user when a file is blocked, instructing them on how to label the file in order to upload it, helping to ensure that files stored in your cloud apps comply with your policies.
>
> For more information, see [Educate users to protect sensitive files](#educate-users-to-protect-sensitive-files).
>

### Block malware on upload or download

Select the **Control file upload (with inspection)** or **Control file download (with inspection)** as the [session control type](#type) and **Malware detection** as [inspection method](#inspection) to prevent a user from uploading or downloading a file with malware. Files are scanned for malware using the Microsoft threat intelligence engine.

View any files flagged as potential malware in the **Cloud apps > Activity log** by filtering for **Potential Malware Detected** items. For more information, see [Activity filters and queries](activity-filters-queries.md).

### Educate users to protect sensitive files

We recommend that you educate users when they're in violation of your policies so that they learn how to comply with your organization's requirements.

Since every enterprise has unique needs and policies, Defender for Cloud Apps allows you to customize a policy's filters and the message displayed to the user when a violation is detected.

Give specific guidance to your users, such as providing instructions on how to appropriately label a file, or how to enroll an unmanaged device to ensure files are uploaded successfully.

For example, if a user uploads a file without a sensitivity label, configure a message to be shown, explaining that the file contains sensitive content and requires an appropriate label. Similarly, if a user attempts to upload a document from an unmanaged device, configure a message to be shown with instructions on how to enroll that device or one that provides further explanation of why the device must be enrolled.

## Access controls in session policies

Many organizations that choose to use session controls for cloud apps to control in-session activities, also apply access controls to block the same set of built-in mobile and desktop client apps, thereby providing comprehensive security for the apps.

Block access to built-in mobile and desktop client apps with access policies by setting the **Client app** filter to **Mobile and desktop**. Some built-in client apps can be individually recognized, while others that are part of a suite of apps can only be identified as their top-level app. For example, apps like SharePoint Online can only be recognized by creating an access policy applied to Microsoft 365 apps.

> [!NOTE]
> Unless the **Client app** filter is specifically set to **Mobile and desktop**, the resulting access policy will only apply to browser sessions. This is intended to prevent inadvertently proxying user sessions.
>
> While most major browsers support performing a client certificate check, some mobile and desktop apps use built-in browsers that may not support this check. Therefore, using this filter can affect authentication for these apps.

## Conflicts between policies

When there's a conflict between two session policies, the more restrictive policy wins.

For example:

- If a user session matches both a policy where downloads are blocked
- And a policy where files are labeled upon download, or where downloads are audited,
- The file download option is blocked, to comply with the more restrictive policy.


## Related content

For more information, see:

- [Troubleshooting access and session controls](troubleshooting-proxy.md)
- [Tutorial: Block download of sensitive information with Conditional Access App Control](use-case-proxy-block-session-aad.md)
- [Blocking downloads on unmanaged devices using session controls](use-case-proxy-block-session-aad.md)
- [Conditional Access App Control webinar](webinars.md#on-demand-webinars)

[!INCLUDE [Open support ticket](includes/support.md)]
