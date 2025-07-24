---
title: Conditional Access app control known limitations | Microsoft Defender for Cloud Apps
description: Learn about known limitations for working with Conditional Access app control in Microsoft Defender for Cloud Apps.
ms.date: 01/23/2024
ms.topic: how-to
---

# Known limitations in Conditional Access app control 

This article describes known limitations for working with Conditional Access app control in Microsoft Defender for Cloud Apps.

To learn more about security limitations, contact our support team.

## Maximum file size for session policies

You can apply session policies on files that have a maximum size of 50 MB. For example, this maximum file size is relevant when you're defining policies to monitor file downloads from OneDrive, block file updates, or block downloads or uploads of malware files.

In cases like these, be sure to cover files that are larger than 50 MB by using the tenant settings to determine whether the file is allowed or blocked, regardless of any matching policies.

In Microsoft Defender XDR, select **Settings** > **Conditional Access App Control** > **Default behavior** to manage settings for files that are larger than 50 MB.

With Edge in-browser protection, in case the end user session is protected AND the policy is set to 'Always apply the selected action even if data cannot be scanned', any file larger than 50MB is blocked.

## Maximum file size for session policies based on content inspection

When you apply a session policy to block file uploads or downloads based on content inspection, the inspection is performed only on files that are smaller than 30 MB and that have fewer than 1 million characters.

For example, you might define one of the following session policies:

- **Block upload of files that contain Social Security numbers**
- **Protect download of files that contain protected health information**
- **Block download of files that have a sensitivity label of "very sensitive"**

In such cases, files that are larger than 30 MB or that have more than 1 million characters aren't scanned. These files are treated according to the **Always apply the selected action even if the data cannot be scanned** policy setting.

The following table lists more examples of files that are and aren't scanned:

|File description |Scanned |
|---------|---------|
|A TXT file, 1-MB size and 1 million characters |Yes |
|A TXT file, 2-MB size and 2 million characters |No |
|A Word file composed of images and text, 4-MB size and 400K characters | Yes |
|A Word file composed of images and text, 4-MB size and 2 million characters |No |
|A Word file composed of images and text, 40-MB size and 400K characters |No |

## Files encrypted with sensitivity labels

For tenants that enable coauthoring for files encrypted with sensitivity labels, a session policy to block file upload/download that relies on label filters or file content will operate based on the **Always apply the selected action even if data cannot be scanned** policy setting.

For example, assume that a session policy is configured to prevent downloading files that contain credit card numbers and is set to **Always apply the selected action even if data cannot be scanned**. Any file with an encrypted sensitivity label is blocked from downloading, regardless of its content.

## External B2B users in Teams

Session policies don't protect external business-to-business (B2B) collaboration users in Microsoft Teams applications.

## Session Controls with Non-Interactive Tokens
Some applications utilize non-interactive access tokens to facilitate seamless redirection between apps within the same suite or realm. When one application is onboarded to Conditional Access App Control and the other is not, session controls may not be enforced as expected. For example, if the Teams client retrieves a non-interactive token for SharePoint Online (SPO), it can initiate an active session in SPO without prompting the user for reauthentication. As a result, the session control mechanism cannot intercept or enforce policies on these sessions. To ensure consistent enforcement, it's recommended to onboard all relevant applications, such as Teams, alongside SPO. 

## IPv6 limitations
Access and session policies support IPv4 only. If a request is made over IPv6, IP-based policy rules are not applied. This limitation applies when using both reverse proxy and Edge in-browser protection.

## Limitations for sessions that the reverse proxy serves

The following limitations apply only on sessions that the reverse proxy serves. Users of Microsoft Edge can benefit from in-browser protection instead of using the reverse proxy, so these limitations don't affect them.

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

## Limitations for sessions that are served with Edge in-browser protection

The following limitations apply only on sessions that are served with Edge in-browser protection.


### Deep link is lost when user switches to Edge by clicking 'Continue in Edge'  

A user who starts a session in a browser other than Edge, is prompted to switch to Edge by clicking the ‘Continue in Edge’ button.

If the URL points to a resource within the secured application, the user will be directed to the application's homepage in Edge.

### Deep link is lost when user switches to Edge work profile'  

A user who starts a session in Edge with a profile other than his work profile, is prompted to switch to his work profile by clicking the ‘Switch to work profile’ button.

If the URL points to a resource within the secured application, the user will be directed to the application's homepage in Edge.

### Outdated session policy enforcement with Edge
When a session policy is enforced using Edge in-browser protection and the user is later removed from the corresponding Conditional Access (CA) policy, the original session enforcement may still persist.

Example Scenario:

A user was originally assigned a CA policy for Salesforce along with a Defender for Cloud Apps session policy to block file downloads. As a result, downloads were blocked when the user accessed Salesforce in Edge.

Although the admin later removed the CA policy, the user still experiences the download block in Edge due to cached policy data.

Mitigation Options:

Option 1: Automatic cleanup
1. Add the user/app back into the scope of the CA policy.
2. Remove the corresponding Defender for Cloud Apps session policy.
3. Wait for users to access the application using Edge. This will automatically trigger the policy removal.
4. Remove the user/app from the scope of the CA policy.
   
Option 2: Delete the cached policy file (Manual cleanup)
1. Go to: C:\Users\<username>\AppData\Local\Microsoft\Edge\
2. Delete the file: mda_store.1.txt

Option 3: Remove the work profile in Edge (Manual cleanup)
1. Open Edge.
2. Navigate to Profile Settings.
3. Delete the work profile associated with the outdated session policy.
  
These steps will force a policy refresh and resolve enforcement issues related to outdated session policies.

## Related content

- [Conditional Access app control in Microsoft Defender for Cloud Apps](proxy-intro-aad.md)
