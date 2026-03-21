---
title: Enable controlled folder access
description: Learn how to protect your important files by enabling Controlled folder access.
ms.service: defender-endpoint
ms.topic: how-to
ms.localizationpriority: medium
audience: ITPro
author: paulinbar
ms.author: painbar
ms.reviewer: sugamar; moeghasemi
manager: bagol
ms.subservice: asr
ms.collection: 
- m365-security
- tier3
- mde-asr
search.appverid: met150
ms.date: 03/10/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
---

# Enable controlled folder access

[Controlled folder access](controlled-folders.md) helps you protect valuable data from malicious apps and threats, such as ransomware. Controlled folder access is available in the following operating systems:

- Included in Windows 10 or later.
- Included in Windows Server 2019 or later.
- Available in Windows Server 2016 and Windows Server 2012 R2 as part of the [modern, unified Microsoft Defender for Endpoint solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).

You can enable controlled folder access by using any of the following methods described in this article:

- [Enable controlled folder access in the Microsoft Intune admin center](#enable-controlled-folder-access-in-the-microsoft-intune-admin-center)
  - [Mobile Device Management (MDM)](#mobile-device-management-mdm)
  - [Microsoft Configuration Manager](#microsoft-configuration-manager)
  - [Group Policy](#group-policy)
  - [PowerShell](#powershell)

> [!TIP]
> Exclusions don't work if you're using [data loss prevention (DLP)](/purview/dlp-learn-about-dlp). Do the following steps to investigate:
>
> 1. Download and install the [Defender for Endpoint client analyzer](run-analyzer-windows.md).
> 2. Run a trace for at least five minutes.
> 3. In the resulting `MDEClientAnalyzerResult.zip` output file, extract the contents of the `EventLogs` folder, and search for instances of `DLP EA` in the available `.evtx` log files.

## Prerequisites

### Supported operating systems

- Windows

## Enable controlled folder access in the Microsoft Intune admin center

To configure controlled folder access using a Microsoft Intune Endpoint Security **Attack surface reduction** policy, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:

- **Policy type**: Attack surface reduction
- **Platform**: Windows 10, Windows 11, and Windows Server
- **Profile**: Attack Surface Reduction Rules
- **Configuration settings**: Set **Enable Controlled Folder Access** to **Audit mode** to assess impact before switching to **Enabled**

For more information about attack surface reduction profiles available in Microsoft Intune, see [Manage attack surface reduction settings with Microsoft Intune](/intune/intune-service/protect/endpoint-security-asr-policy#attack-surface-reduction-profiles).

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

For more information about Microsoft Configuration Manager and Controlled Folder Access, visit [Controlled folder access policies and options](/intune/configmgr/protect/deploy-use/create-deploy-exploit-guard-policy).

## Group Policy

1. On your Group Policy management device, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console). Right-click the Group Policy Object you want to configure and select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** and select **Administrative templates**.

1. Expand the tree to **Windows components > Microsoft Defender Antivirus > Microsoft Defender Exploit Guard > Controlled folder access**.

1. Double-click the **Configure Controlled folder access** setting and set the option to **Enabled**. In the options section, you must specify one of the following options:

   - **Enable** - Malicious and suspicious apps aren't allowed to make changes to files in protected folders. A notification is provided in the Windows event log.
   - **Disable (Default)** - The Controlled folder access feature won't work. All apps can make changes to files in protected folders.
   - **Audit Mode** - Changes are allowed if a malicious or suspicious app attempts to make a change to a file in a protected folder. However, it's recorded in the Windows event log where you can assess the impact on your organization.
   - **Block disk modification only** - Attempts by untrusted apps to write to disk sectors are logged in Windows Event log. These logs can be found in **Applications and Services Logs** > Microsoft > Windows > Windows Defender > Operational > ID 1123.
   - **Audit disk modification only** - Only attempts to write to protected disk sectors are recorded in the Windows event log (under **Applications and Services Logs** > **Microsoft** > **Windows** > **Windows Defender** > **Operational** > **ID 1124**). Attempts to modify or delete files in protected folders won't be recorded.

   :::image type="content" source="/defender/media/cfa-gp-enable.png" alt-text="Screenshot shows the group policy option enabled and Audit Mode selected." lightbox="/defender/media/cfa-gp-enable.png":::

> [!IMPORTANT]
> To fully enable controlled folder access, you must set the Group Policy option to **Enabled** and select **Block** in the options drop-down menu.

## PowerShell

1. Type **powershell** in the Start menu, right-click **Windows PowerShell** and select **Run as administrator**.

1. Run the following command:

   ```powershell
   Set-MpPreference -EnableControlledFolderAccess Enabled
   ```

   You can enable the feature in audit mode by specifying `AuditMode` instead of `Enabled`. Use `Disabled` to turn off the feature.

For detailed syntax and parameter information, see [EnableControlledFolderAccess](/powershell/module/defender/set-mppreference#-enablecontrolledfolderaccess).

## See also

- [Protect important folders with controlled folder access](controlled-folders.md)
- [Customize controlled folder access](customize-controlled-folders.md)
- [Evaluate Microsoft Defender for Endpoint](evaluate-mde.md)


