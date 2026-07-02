---
title: Conditional Access app control known limitations | Microsoft Defender for Cloud Apps
description: Learn about known limitations for working with Conditional Access app control in Microsoft Defender for Cloud Apps.
ms.date: 06/16/2026
ms.topic: how-to
ms.reviewer: AmitMishaeli
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Known limitations in Conditional Access app control 

This article describes known limitations for working with Conditional Access app control in Microsoft Defender for Cloud Apps. These limitations cover file size limits for session policies and content inspection, encrypted file handling, IPv6 support, reverse proxy session behavior, and Microsoft Edge in-browser protection. Review this information when you configure session or access policies, or when you troubleshoot unexpected policy behavior.

To learn more about security limitations, contact our support team.

## Maximum file size for session policies

You can apply session policies on files that have a maximum size of 50 MB. For example, this maximum file size is relevant when you're defining policies to monitor file downloads from OneDrive, block file updates, or block downloads or uploads of malware files.

For files larger than 50 MB, use the tenant settings to determine whether the file is allowed or blocked, regardless of any matching policies.

In Microsoft Defender XDR, select **Settings** > **Conditional Access App Control** > **Default behavior** to manage settings for files that are larger than 50 MB.

With Microsoft Edge in-browser protection, in case the end user session is protected AND the policy is set to 'Always apply the selected action even if data can't be scanned', any file larger than 50 MB is blocked.

## Maximum file size for session policies based on content inspection

Session policies can block or monitor file uploads and downloads based on content inspection. Content inspection runs only on files that meet both of these conditions: the file is smaller than 30 MB, and the file has fewer than 1 million characters.

For example, you might define one of these session policies:

- **Block upload of files that contain Social Security numbers**
- **Protect download of files that contain protected health information**
- **Block download of files that have a sensitivity label of "very sensitive"**

For content-inspection policies like these, files that are larger than 30 MB or have more than 1 million characters aren't scanned. Instead, unscanned files follow the **Always apply the selected action even if the data cannot be scanned** policy setting.

The following table lists more examples of files that are and aren't scanned:

|File description |Scanned |
|---------|---------|
|A TXT file, 1-MB size, and 1 million characters |Yes |
|A TXT file, 2-MB size, and 2 million characters |No |
|A Word file composed of images and text, 4-MB size, and 400 K characters | Yes |
|A Word file composed of images and text, 4-MB size, and 2 million characters |No |
|A Word file composed of images and text, 40-MB size, and 400 K characters |No |

## Files encrypted with sensitivity labels

If your tenant turns on coauthoring for files with encrypted sensitivity labels, those files can't be read during content inspection. Any session policy that blocks uploads or downloads based on label filters or file content uses the **Always apply the selected action even if data cannot be scanned** setting instead.

For example, say you set up a session policy to block downloads of files with credit card numbers. You also turn on **Always apply the selected action even if data cannot be scanned**. With this setup, any file that has an encrypted sensitivity label is blocked, no matter what it contains.

## External B2B users in Teams

Session policies don't protect external business-to-business (B2B) collaboration users in Microsoft Teams applications.

<a name="session-controls-with-non-interactive-tokens"></a>
## Session controls with non-interactive tokens
Some apps use non-interactive access tokens to redirect users between apps in the same suite. If one app is onboarded to Conditional Access App Control but the other isn't, session controls might not work as expected. For example, the Teams client can get a non-interactive token for SharePoint and start a session in SharePoint Online (SPO). The user isn't asked to sign in again, so session controls can't intercept or enforce policies. To avoid this gap, onboard all related apps, such as Teams, alongside SPO.

## IPv6 limitations
Access and session policies support IPv4 only. If a request is made over IPv6, IP-based policy rules aren't applied. This limitation applies when using both reverse proxy and Microsoft Edge in-browser protection.

## Limitations for sessions that the reverse proxy serves

The built-in app, context loss, and file upload limitations in this section apply only to sessions that the reverse proxy serves. Users of Microsoft Edge can benefit from in-browser protection instead of using the reverse proxy, so these limitations don't affect them.

### Built-in app and browser plug-in limitations

Conditional Access app control in Defender for Cloud Apps modifies underlying application code. It doesn't currently support built-in apps or browser extensions.

As an administrator, you might want to define default system behavior for when a policy can't be enforced. You can choose to either allow access or totally block it.

### Context loss limitations

In the following applications, we encountered scenarios where browsing to a link might result in loss of the link's full path. Typically, the user lands on the home page of the app.

- ArcGIS
- GitHub
- Microsoft Power Automate
- Microsoft Power Apps
- Workplace from Meta
- ServiceNow
- Workday
- Box
- Smartsheet

### File upload limitations

If you apply a session policy to block or monitor the upload of sensitive files, the user's attempts to upload files or folders by using a drag-and-drop operation block the complete list of files and folders in the following scenarios:

- A folder that contains at least one file and at least one subfolder
- A folder that contains multiple subfolders
- A selection of at least one file and at least one folder
- A selection of multiple folders

The following table lists example results when you define the **Block upload of files that contain personal data to OneDrive** policy:

|Scenario |Result |
|---------|---------|
|A user tries to upload a selection of 200 nonsensitive files by using a drag-and-drop operation. |Files are blocked. |
|A user tries to upload a selection of 200 files by using the file upload dialog. Some are sensitive, and some aren't. |Nonsensitive files are uploaded. <br><br>Sensitive files are blocked. |
|A user tries to upload a selection of 200 files by using a drag-and-drop operation. Some are sensitive, and some aren't. |The full set of files is blocked. |

## Limitations for sessions that are served with Microsoft Edge in-browser protection

The Google Workspace, deep link, and outdated policy enforcement limitations in this section apply only to sessions that are served with Microsoft Edge in-browser protection.

### Secure Microsoft Edge Session Controls can't be used with Google Workspace in Enterprise Microsoft Edge browsers
Google Workspace isn't supported with in-browser protection in the Enterprise Microsoft Edge browser. As a result, Secure Microsoft Edge Session controls in Google Workspaces aren't supported. In Google Workspaces, real time DLP files scans aren't supported, the fallback authentication of suffixes is used, and file upload, download, cut, and copy aren't supported.

### Deep link is lost when user switches to Microsoft Edge by clicking 'Continue in Microsoft Edge'  

A user who starts a session in a browser other than Microsoft Edge, is prompted to switch to Microsoft Edge by clicking the 'Continue in Microsoft Edge' button.

If the URL points to a resource within the secured application, the user is directed to the application's homepage in Microsoft Edge.

### Deep link is lost when user switches to Microsoft Edge work profile'  

A user who starts a session in Microsoft Edge with a profile other than their work profile, is prompted to switch to their work profile by clicking the ‘Switch to work profile’ button.

If the URL points to a resource within the secured application, the user is directed to the application's homepage in Microsoft Edge.

### Outdated session policy enforcement with Microsoft Edge
When a session policy is enforced using Microsoft Edge in-browser protection and the user is later removed from the corresponding Conditional Access (CA) policy, the original session enforcement may still persist.

Example Scenario:

A user was originally assigned a CA policy for Salesforce along with a Defender for Cloud Apps session policy to block file downloads. As a result, downloads were blocked when the user accessed Salesforce in Microsoft Edge.

Although the admin later removed the CA policy, the user still experiences the download block in Microsoft Edge due to cached policy data.

Mitigation Options:

Option 1: Automatic cleanup
1. Add the user/app back into the scope of the CA policy.
2. Remove the corresponding Defender for Cloud Apps session policy.
3. Wait for users to access the application using Microsoft Edge. This automatically triggers the policy removal.
4. Remove the user/app from the scope of the CA policy.
   
Option 2: Delete the cached policy file (Manual cleanup)
1. Go to: C:\Users\<username>\AppData\Local\Microsoft\Edge\
2. Delete the file: mda_store.1.txt

Option 3: Remove the work profile in Microsoft Edge (Manual cleanup)
1. Open Microsoft Edge.
2. Navigate to Profile Settings.
3. Delete the work profile associated with the outdated session policy.
  
Each of these mitigation options forces a policy refresh and resolves enforcement issues related to outdated session policies.

## Related content

- [Conditional Access app control in Microsoft Defender for Cloud Apps](proxy-intro-aad.md)
