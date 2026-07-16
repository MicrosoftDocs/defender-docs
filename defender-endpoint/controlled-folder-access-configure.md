---
title: Configure controlled folder access
description: Enable controlled folder access to protect your important files and folders from malicious apps and threats such as ransomware.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar; moeghasemi
ms.subservice: asr
ms.topic: how-to
ms.collection:
- m365-security
- tier3
- mde-asr
ms.date: 06/16/2026
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to enable controlled folder access on devices so that I can protect important files and folders from ransomware and other malicious apps.
appliesto:
- Microsoft Defender for Endpoint Plan 1
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender Antivirus
---

# Configure controlled folder access (CFA)

[Controlled folder access](controlled-folder-access-overview.md) (CFA) helps protect your valuable data from malicious apps and threats, such as ransomware, by preventing untrusted apps from changing files in protected folders. You can enable and configure CFA by using any of the methods in this article.

For best results, use an enterprise-level management solution such as Microsoft Intune or Microsoft Configuration Manager to manage CFA.

## Prerequisites

CFA is available in the following operating systems:

- Windows 10 or later.
- Windows Server 2019 or later.
- Windows Server 2016 and Windows Server 2012 R2 as part of the [modern, unified Microsoft Defender for Endpoint solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).

<a name="enable-controlled-folder-access-in-the-microsoft-intune-admin-center"></a>

## Configure CFA in Intune using endpoint security policies

[!INCLUDE [Intune is recommended but is a separate product](includes/intune-recommended-separate-product.md)]

In Intune, endpoint security policies are the recommended method to deploy CFA.

To configure CFA using a Microsoft Intune Endpoint Security **Attack surface reduction** policy, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:

- **Policy type**: Attack surface reduction
- **Platform**: Windows
- **Profile**: Attack Surface Reduction Rules
- **Configuration settings**: After you configure the [attack surface reduction (ASR) rules settings](attack-surface-reduction-rules-configure.md#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies), configure the following CFA settings:
  - **Enable controlled folder access**: Select an available [mode value](controlled-folder-access-overview.md#modes-for-cfa). After you assess the effect of CFA in **Audit Mode**, you can set it to **Enabled**.

  - **Controlled folder access protected folders**: To add more folders that get CFA protection, use either of the following methods:
    - Select :::image type="icon" source="media/defender-portal-icon-create.png" border="false"::: **Add**. In the box that appears, enter the path to include. For example:
      - `C:\Data\Reports`
      - `C:\Data\Finance`

    - Select :::image type="icon" source="media/intune-icon-import.png" border="false"::: **Import** to import a CSV file that contains the paths to include. The CSV file uses the following format:

      ```text
      ControlledFolderAccessProtectedFolders
      "C:\folder1"
      "C:\folder2"
      ...
      ```

      > [!TIP]
      > Double quotation marks around the values are optional, and are ignored (aren't used in the values) if you include them. Don't use single quotation marks around the values.

  - **Controlled folder access allowed applications**: To specify apps that are allowed to make changes to files in protected folders, use the same :::image type="icon" source="media/defender-portal-icon-create.png" border="false"::: **Add** or :::image type="icon" source="media/intune-icon-import.png" border="false"::: **Import** methods described for **Controlled folder access protected folders**, specifying the path and file name of each app.

    The CSV file uses the following format:

    ```text
    ControlledFolderAccessAllowedApplications
    "C:\Apps\app1.exe"
    "%ProgramFiles%\Fabrikam\DriveManager\*\DriveService.exe"
    ...
    ```

    The path of each app can include environment variables and wildcards, as described in [Allow apps to modify files in protected folders](controlled-folder-access-overview.md#allow-apps-to-modify-files-in-protected-folders).

For more information about attack surface reduction profiles in Microsoft Intune, see [Manage attack surface reduction settings with Microsoft Intune](/intune/intune-service/protect/endpoint-security-asr-policy#attack-surface-reduction-profiles).

<a name="mobile-device-management-mdm"></a>

## Configure CFA in any MDM solution using the Policy CSP

The Policy configuration service provider (CSP) enables enterprise organizations to configure CFA on Windows devices using any mobile device management (MDM) solution, not just Microsoft Intune. For more information, see [Policy CSP](/windows/client-management/mdm/policy-configuration-service-provider).

Use the following CSPs from the [Policy CSP - Defender](/windows/client-management/mdm/policy-csp-defender) area to configure CFA.

### Enable CFA using the Policy CSP

Use the [EnableControlledFolderAccess](/windows/client-management/mdm/policy-csp-defender#enablecontrolledfolderaccess) CSP to configure CFA and select the protection mode.

**OMA-URI path**: `./Device/Vendor/MSFT/Policy/Config/Defender/EnableControlledFolderAccess`<br/>
**Value**: Enter one of the following [mode values](controlled-folder-access-overview.md#modes-for-cfa):

- `0`: Disabled (default).
- `1`: Enabled (block).
- `2`: Audit Mode.
- `3`: Block disk modification only.
- `4`: Audit disk modification only.

### Add folders to protected folders using the Policy CSP

CFA protects [an unmodifiable list of common folders](controlled-folder-access-overview.md#default-folders-protected-by-cfa). To add more folders that get CFA protection, use the [ControlledFolderAccessProtectedFolders](/windows/client-management/mdm/policy-csp-defender#controlledfolderaccessprotectedfolders) CSP:

**OMA-URI path**: `./Device/Vendor/MSFT/Policy/Config/Defender/ControlledFolderAccessProtectedFolders`<br/>
**Value**: Enter one or more folder paths separated by the pipe (`|`) character.

For example, `C:\Data\Reports|C:\Data\Finance`.

### Allow apps to modify files in protected folders using the Policy CSP

Use the [ControlledFolderAccessAllowedApplications](/windows/client-management/mdm/policy-csp-defender#controlledfolderaccessallowedapplications) CSP to allow more apps to make changes to files in protected folders.

**OMA-URI path**: `./Device/Vendor/MSFT/Policy/Config/Defender/ControlledFolderAccessAllowedApplications`<br/>
**Value**: Enter one or more app paths separated by the pipe (`|`) character. The path of each app can include environment variables and wildcards, as described in [Allow apps to modify files in protected folders](controlled-folder-access-overview.md#allow-apps-to-modify-files-in-protected-folders).

For example, `C:\Apps\app1.exe|%ProgramFiles%\Fabrikam\DriveManager\*\DriveService.exe`

<a name="microsoft-configuration-manager"></a>

## Configure CFA in Microsoft Configuration Manager

In Microsoft Configuration Manager, you configure CFA in a Windows Defender Exploit Guard policy. For instructions, see the CFA information in [Create and deploy an Exploit Guard policy](/intune/configmgr/protect/deploy-use/create-deploy-exploit-guard-policy#bkmk_CFA).

> [!NOTE]
> For considerations when you add protected folders or allow apps (such as wildcard support and the requirement to restart allowed apps), see [Add other folders to CFA](controlled-folder-access-overview.md#add-other-folders-to-cfa) and [Allow apps to modify files in protected folders](controlled-folder-access-overview.md#allow-apps-to-modify-files-in-protected-folders).

<a name="group-policy"></a>

## Configure CFA in Group Policy

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Microsoft Defender Exploit Guard** \> **Controlled Folder Access**.

1. In the details pane of **Controlled Folder Access**, the available settings are:
   - [Configure allowed applications](#allow-apps-to-modify-files-in-protected-folders-in-group-policy)
   - [Configure controlled folder access](#enable-cfa-in-group-policy)
   - [Configure protected folders](#add-folders-to-protected-folders-in-group-policy)

   To open and configure a CFA setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Microsoft Defender Exploit Guard** \> **Controlled Folder Access**.

The available settings are described in the following subsections.

> [!IMPORTANT]
> Quotation marks, leading spaces, trailing spaces, and extra characters aren't supported in any of the CFA values in Group Policy.

### Enable CFA in Group Policy

1. In the details pane of **Controlled Folder Access**, open the **Configure controlled folder access** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Configure the guard my folders feature**: Select one of the following [mode values](controlled-folder-access-overview.md#modes-for-cfa):
      - **Disable (Default)**
      - **Block**
      - **Audit Mode**
      - **Block disk modification only**
      - **Audit disk modification only**

   :::image type="content" source="media/controlled-folder-access-group-policy-enable.png" alt-text="Screenshot shows the group policy option enabled and Audit Mode selected." lightbox="media/controlled-folder-access-group-policy-enable.png":::

> [!IMPORTANT]
> To fully enable CFA, you must set the Group Policy option to **Enabled** and select **Block** in the options drop-down menu.

### Add folders to protected folders in Group Policy

1. In the details pane of **Controlled Folder Access**, open the **Configure protected folders** setting.
   1. Select **Enabled**.
   1. **Enter the folders that should be guarded**: Select **Show...**.
   1. In the setting window that opens, configure the following options:
      - **Value name**: Enter the path to include in CFA protection.
      - **Value**: Enter the value `0`.

   Repeat this step as many times as necessary. When you're finished, select **OK**.

   For considerations when you add folders (such as support for network shares, mapped drives, and environment variables), see [Add other folders to CFA](controlled-folder-access-overview.md#add-other-folders-to-cfa).

### Allow apps to modify files in protected folders in Group Policy

1. In the details pane of **Controlled Folder Access**, open the **Configure allowed applications** setting.
   1. Select **Enabled**.
   1. **Enter the applications that should be trusted**: Select **Show...**.
   1. In the setting window that opens, configure the following options:
      - **Value name**: Enter the path and file name of the application that's allowed to make changes to files in protected folders.
      - **Value**: Enter the value `0`.

   Repeat this step as many times as necessary. When you're finished, select **OK**.

   For considerations when you allow apps (such as wildcard support and the requirement to restart allowed apps), see [Allow apps to modify files in protected folders](controlled-folder-access-overview.md#allow-apps-to-modify-files-in-protected-folders).

<a name="powershell"></a>

## Enable and configure CFA in PowerShell

On the target device, run the commands in this section from an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**).

To turn on CFA and select the [protection mode](controlled-folder-access-overview.md#modes-for-cfa), use the following command:

```powershell
Set-MpPreference -EnableControlledFolderAccess <Mode>
```

Valid values for the _EnableControlledFolderAccess_ parameter are:

- `0` or `Disabled` (default)
- `1` or `Enabled`
- `2` or `AuditMode`
- `3` or `BlockDiskModificationOnly`
- `4` or `AuditDiskModificationOnly`

To see the existing CFA mode on the device, run the following command:

```powershell
Get-MpPreference | Format-Table EnableControlledFolderAccess
```

> [!NOTE]
>
> - In the following subsections, **Set-MpPreference** _overwrites_ any existing protected folders or allowed apps with the values you specify. To see the list of existing values, run the following commands in an elevated PowerShell session:
>
>   ```powershell
>   $cfa = Get-MpPreference; "ProtectedFolders:"; "-"*25; $cfa.ControlledFolderAccessProtectedFolders | Sort-Object; "`n`n"; "AllowedApplications:"; "-"*25; $cfa.ControlledFolderAccessAllowedApplications | Sort-Object
>   ```
>
>   To add other folders or allowed apps to CFA without affecting any existing values, use the **Add-MpPreference** cmdlet. To remove the specified folders or allowed apps from CFA without affecting other existing values, use the **Remove-MpPreference** cmdlet. The command syntax is identical for the three cmdlets.
>
> - The protected folders and allowed apps take effect only when CFA is turned on (the _EnableControlledFolderAccess_ value isn't `0` or `Disabled`).

### Add folders to protected folders in PowerShell

To [add more folders for CFA to protect](controlled-folder-access-overview.md#add-other-folders-to-cfa), use the following syntax in an elevated PowerShell session:

```powershell
<Add-MpPreference | Set-MpPreference | Remove-MpPreference> -ControlledFolderAccessProtectedFolders "<Path1>","<Path2>",..."<PathN>"
```

The following example adds the specified folders to the existing list of protected folders:

```powershell
Add-MpPreference -ControlledFolderAccessProtectedFolders "C:\Folder1","C:\Folder2"
```

### Allow apps to modify files in protected folders in PowerShell

To add [allowed apps](controlled-folder-access-overview.md#allow-apps-to-modify-files-in-protected-folders) that can make changes to files in protected folders, use the following syntax in an elevated PowerShell session:

```powershell
<Add-MpPreference | Set-MpPreference | Remove-MpPreference> -ControlledFolderAccessAllowedApplications "<PathAndFilename1>","<PathAndFilename2>",..."<PathAndFilenameN>"
```

The following example replaces any existing allowed apps with the specified apps. The path can include environment variables and wildcards, as described in [Allow apps to modify files in protected folders](controlled-folder-access-overview.md#allow-apps-to-modify-files-in-protected-folders):

```powershell
Set-MpPreference -ControlledFolderAccessAllowedApplications "C:\Apps\app1.exe","%ProgramFiles%\Fabrikam\DriveManager\*\DriveService.exe"
```

## Configure CFA in the Windows Security app

You can use the [Windows Security app](https://support.microsoft.com/windows/stay-protected-with-the-windows-security-app-2ae0363d-0ada-c064-8b56-6a39afb6a963) on individual devices to configure CFA. This method is useful for testing or for configuring a single device. To configure CFA on many devices, use one of the enterprise management methods described earlier in this article.

> [!NOTE]
> The Windows Security app supports only **On** (equivalent to the **Enabled** [mode](controlled-folder-access-overview.md#modes-for-cfa)) and **Off** (the **Disabled** mode). To use **Audit Mode** or the disk modification modes, use one of the other methods described in this article.

1. In the **Windows security** app on the device, go to **Virus & threat protection**.
1. In the **Virus & threat protection** pane, in the **Virus & threat protection settings** section, select **Manage settings**.
1. In the **Virus & threat protection** pane, in the **Controlled folder access** section, select **Manage controlled folder access**.
1. In the **Ransomware protection** pane, the following settings are available in the **Controlled folder access** section:
   - [Turn controlled folder access on or off](#enable-cfa-in-the-windows-security-app)
   - [Protected folders](#add-folders-to-protected-folders-in-the-windows-security-app)<sup>\*</sup>
   - [Allow an app through Controlled folder access](#allow-apps-to-modify-files-in-protected-folders-in-the-windows-security-app)<sup>\*</sup>

   <sup>\*</sup> This setting is available only when CFA is turned on.

The available settings are described in the following subsections.

### Enable CFA in the Windows Security app

1. In the **Controlled folder access** section on the **Ransomware protection** pane, slide the toggle to :::image type="icon" source="media/toggle-on.png" border="false"::: **On**.
1. Select **Yes** in the **User Account Control** prompt.

   If you previously specified protected folders and allowed apps before you disabled CFA, you're asked to confirm whether you want to keep those values.

### Add folders to protected folders in the Windows Security app

1. In the **Controlled folder access** section on the **Ransomware protection** pane, select **Protected folders**.
1. Select **Yes** on the **User Account Control** prompt.
1. In the pane that opens, select **+ Add a protected folder**, and then find and select the folder. Repeat this step as many times as necessary.

### Allow apps to modify files in protected folders in the Windows Security app

1. In the **Controlled folder access** section on the **Ransomware protection** pane, select **Allow an app through Controlled folder access**.
1. Select **Yes** on the **User Account Control** prompt.
1. In the **Allow an app through the Controlled folder access** pane, select **+ Add an allowed app**, and then select one of the following values:
   - **Recently blocked apps**: In the **Recently blocked apps** dialog that opens, select an app from the list of recently blocked apps.

     If no recently blocked apps are shown, select **Browse all apps** to find and select the .exe or .com file to add.

   - **Browse all apps**: Find and select the .exe or .com file to add.

   Repeat this step as many times as necessary.

## Related content

- [Controlled folder access (CFA) overview](controlled-folder-access-overview.md)
- [Evaluate Microsoft Defender for Endpoint](evaluate-mde.md)
