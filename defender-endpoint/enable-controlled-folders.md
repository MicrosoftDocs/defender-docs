---
title: Enable controlled folder access
description: Learn how to protect your important files by enabling Controlled folder access
ms.service: defender-endpoint
ms.topic: how-to
ms.localizationpriority: medium
audience: ITPro
author: emmwalshh
ms.author: ewalsh
ms.reviewer: sugamar; moeghasemi
manager: deniseb
ms.subservice: asr
ms.collection: 
- m365-security
- tier3
- mde-asr
search.appverid: met150
ms.date: 05/06/2025
---

# Enable controlled folder access

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- Microsoft Defender Antivirus

**Platforms**
- Windows

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[Controlled folder access](controlled-folders.md) helps you protect valuable data from malicious apps and threats, such as ransomware. Controlled folder access is included with Windows 10, Windows 11, and Windows Server 2019. Controlled folder access is also included as part of the [modern, unified solution for Windows Server 2012R2 and 2016](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).

You can enable controlled folder access by using any of these methods:

- [Enable controlled folder access](#enable-controlled-folder-access)
- [Enable controlled folder access](#enable-controlled-folder-access)
  - [Mobile Device Management (MDM)](#mobile-device-management-mdm)
  - [Microsoft Configuration Manager](#microsoft-configuration-manager)
  - [Group Policy](#group-policy)
  - [PowerShell](#powershell)
  - [See also](#see-also)

3. Select **Platform**, choose **Windows 10, Windows 11, and Windows Server**, and select the profile **Attack Surface Reduction rules** > **Create**.

4. Name the policy and add a description. Select **Next**.

5. Scroll down, and in the **Enable Controlled Folder Access** drop-down, select an option, such as **Audit Mode**.   
  
   We recommend enabling controlled folder access in audit mode first to see how it works in your organization. You can set it to another mode, such as **Enabled**, later.

6. To optionally add folders that should be protected, select **Controlled Folder Access Protected Folders** and then add folders. Files in these folders can't be modified or deleted by untrusted applications. Keep in mind that your default system folders are automatically protected. You can view the list of default system folders in the Windows Security app on a Windows device. To learn more about this setting, see [Policy CSP - Defender: ControlledFolderAccessProtectedFolders](/windows/client-management/mdm/policy-csp-defender?#controlledfolderaccessprotectedfolders).

7. To optionally add applications that should be trusted, select **Controlled Folder Access Allowed Applications** and then add the apps can access protected folders. Microsoft Defender Antivirus automatically determines which applications should be trusted. Only use this setting to specify additional applications. To learn more about this setting, see [Policy CSP - Defender: ControlledFolderAccessAllowedApplications](/windows/client-management/mdm/policy-csp-defender#controlledfolderaccessallowedapplications).

8. Select the profile **Assignments**, assign to **All Users & All Devices**, and select **Save**.

9. Select **Next** to save each open blade and then **Create**.

> [!NOTE]
> Wildcards are supported for applications, but not for folders. Allowed apps continue to trigger events until they're restarted.

## Mobile Device Management (MDM)

Use the [./Vendor/MSFT/Policy/Config/ControlledFolderAccessProtectedFolders](/windows/client-management/mdm/policy-csp-defender) configuration service provider (CSP) to allow apps to make changes to protected folders.

## Microsoft Configuration Manager

1. In Microsoft Configuration Manager, go to **Assets and Compliance** > **Endpoint Protection** > **Windows Defender Exploit Guard**.

1. Select **Home** > **Create Exploit Guard Policy**.

1. Enter a name and a description, select **Controlled folder access**, and select **Next**.

1. Choose whether block or audit changes, allow other apps, or add other folders, and select **Next**.

   > [!NOTE]
   > Wildcard is supported for applications, but not for folders. Allowed apps continue to trigger events until they're restarted.
   
1. Review the settings and select **Next** to create the policy.

1. After the policy is created, **Close**.

For more information about Microsoft Configuration Manager and Controlled Folder Access, visit [Controlled folder access policies and options](/mem/configmgr/protect/deploy-use/create-deploy-exploit-guard-policy).

## Group Policy

1. On your Group Policy management device, open the [Group Policy Management Console](https://technet.microsoft.com/library/cc731212.aspx). Right-click the Group Policy Object you want to configure and select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** and select **Administrative templates**.

1. Expand the tree to **Windows components > Microsoft Defender Antivirus > Microsoft Defender Exploit Guard > Controlled folder access**.

1. Double-click the **Configure Controlled folder access** setting and set the option to **Enabled**. In the options section you must specify one of the following options:

   - **Enable** - Malicious and suspicious apps aren't allowed to make changes to files in protected folders. A notification is provided in the Windows event log.
   - **Disable (Default)** - The Controlled folder access feature won't work. All apps can make changes to files in protected folders.
   - **Audit Mode** - Changes are allowed if a malicious or suspicious app attempts to make a change to a file in a protected folder. However, it's recorded in the Windows event log where you can assess the impact on your organization.
   - **Block disk modification only** - Attempts by untrusted apps to write to disk sectors will be logged in Windows Event log. These logs can be found in **Applications and Services Logs** > Microsoft > Windows > Windows Defender > Operational > ID 1123.
   - **Audit disk modification only** - Only attempts to write to protected disk sectors will be recorded in the Windows event log (under **Applications and Services Logs** > **Microsoft** > **Windows** > **Windows Defender** > **Operational** > **ID 1124**). Attempts to modify or delete files in protected folders won't be recorded.

   :::image type="content" source="/defender/media/cfa-gp-enable.png" alt-text="Screenshot shows the group policy option enabled and Audit Mode selected." lightbox="/defender/media/cfa-gp-enable.png":::
   
> [!IMPORTANT]
> To fully enable controlled folder access, you must set the Group Policy option to **Enabled** and select **Block** in the options drop-down menu.

## PowerShell

1. Type **powershell** in the Start menu, right-click **Windows PowerShell** and select **Run as administrator**.

2. Type the following cmdlet:

   ```PowerShell
   Set-MpPreference -EnableControlledFolderAccess Enabled
   ```

   You can enable the feature in audit mode by specifying `AuditMode` instead of `Enabled`. Use `Disabled` to turn off the feature.

## See also

- [Protect important folders with controlled folder access](controlled-folders.md)
- [Customize controlled folder access](customize-controlled-folders.md)
- [Evaluate Microsoft Defender for Endpoint](evaluate-mde.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
