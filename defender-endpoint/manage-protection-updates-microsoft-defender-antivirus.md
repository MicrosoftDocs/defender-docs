---
title: Manage how and where Microsoft Defender Antivirus receives updates
description: Manage the fallback order for how Microsoft Defender Antivirus receives protection updates.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.reviewer: pahuijbr
ms.custom: nextgen, msecd-doc-authoring-1015
ms.subservice: ngp
ms.collection:
- m365-security
- tier2
ms.date: 08/12/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to configure protection update sources and their order so that endpoints can retrieve security intelligence updates reliably.
---

# Manage the sources for Microsoft Defender Antivirus protection updates

<a id="protection-updates"></a>
<!-- this has been used as anchor in VDI content -->

Keeping your antivirus protection up to date is critical. There are two components to managing protection updates for Microsoft Defender Antivirus:

- *Where* the updates are downloaded from; and
- *When* updates are downloaded and applied

This article describes how to specify from where updates should be downloaded (specifying the update download source order is also known as the fallback order). See [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md) article for an overview on how updates work, and how to configure other aspects of updates (such as scheduling updates).

> [!IMPORTANT]
> Microsoft Defender Antivirus Security intelligence updates and platform updates are delivered through Windows Update and starting Monday, October 21, 2019, all security intelligence updates are SHA-2 signed exclusively. Your devices must be updated to support SHA-2 in order to update your security intelligence. To learn more, see [2019 SHA-2 Code Signing Support requirement for Windows and WSUS](https://support.microsoft.com/help/4472027/2019-sha-2-code-signing-support-requirement-for-windows-and-wsus).

<a id="fallback-order"></a>

## Prerequisites

### Supported operating systems

The following operating systems are supported:

- Windows

<a name="fallback-order"></a>
## Understand fallback order for protection update sources

Typically, you configure endpoints to individually download updates from a primary source followed by other sources in order of priority, based on your network configuration. Updates are obtained from sources in the order you specify. If updates from the update source currently being checked are out-of-date, the next configured update source in the fallback order is used immediately.

When updates are published, logic is applied to minimize the size of the update. In most cases, only the differences between the latest update and the update that is currently installed is downloaded and applied to the device. The set of differences is referred to as the *delta*. The size of the delta depends on two main factors:

- The age of the last update on the device; and
- The source used to download and apply updates

The older the updates on an endpoint, the larger the download is. However, you must also consider download frequency as well. A more frequent update schedule can result in more network usage, whereas a less-frequent schedule can result in larger file sizes per download.

There are five locations where you can specify where an endpoint should obtain updates:

- [Microsoft Update](https://support.microsoft.com/help/12373/windows-update-faq)
- [Windows Server Update Service](/windows-server/administration/windows-server-update-services/get-started/windows-server-update-services-wsus). If you use a Software Update Point (SUP) in Microsoft Configuration Manager, you can transition to co-management and use the Intune internal definition update server option with on-premises WSUS as the update source.
- [Microsoft Configuration Manager](/intune/configmgr/core/servers/manage/updates)
- [Network file share](#unc-share)
- [Security intelligence updates for Microsoft Defender Antivirus and other Microsoft anti-malware](manage-protection-update-schedule-microsoft-defender-antivirus.md). Your policy and registry might list this source as Microsoft Malware Protection Center (MMPC) security intelligence, its former name.

> [!NOTE]
> Intune Internal Definition Update Server: If you use a Software Update Point (SUP) in Microsoft Configuration Manager to get definition updates for Microsoft Defender Antivirus, and you must access Windows Update on blocked client devices, you can transition to co-management and offload the endpoint protection workload to Intune. In the antimalware policy configured in Intune, there's an "internal definition update server" option that you can set to use on-premises Windows Server Update Service (WSUS) as the update source. This configuration helps you control which updates from the official Windows Update (WU) server are approved for enterprise organizations. It also helps proxy and save network traffic to the official Windows Updates network.
> Your policy and registry might have this listed as Microsoft Malware Protection Center (MMPC) security intelligence, its former name.

To ensure the best level of protection, Microsoft Update allows for rapid releases, which means smaller downloads on a frequent basis. The Windows Server Update Service, Microsoft Configuration Manager, Microsoft security intelligence updates, and platform updates sources deliver less frequent updates. Thus, the delta package might be larger, resulting in larger downloads.

Platform updates and engine updates are released on a monthly cadence. Security intelligence updates are delivered multiple times a day, but this delta package doesn't contain an engine update. See [Microsoft Defender Antivirus security intelligence and product updates](microsoft-defender-antivirus-updates.md).

> [!IMPORTANT]
> If you have set [Microsoft Security intelligence page](https://www.microsoft.com/security/portal/definitions/adl.aspx) updates as a fallback source after Windows Server Update Service or Microsoft Update, updates are only downloaded from security intelligence updates and platform updates when the current update is considered out-of-date. (By default, this is seven consecutive days of not being able to apply updates from the Windows Server Update Service or Microsoft Update services).
> You can, however, [set the number of days before protection is reported as out-of-date](manage-outdated-endpoints-microsoft-defender-antivirus.md).<p>
> Starting Monday, October 21, 2019, security intelligence updates and platform updates are SHA-2 signed exclusively. Devices must be updated to support SHA-2 in order to get the latest security intelligence updates and platform updates. To learn more, see [2019 SHA-2 Code Signing Support requirement for Windows and WSUS](https://support.microsoft.com/help/4472027/2019-sha-2-code-signing-support-requirement-for-windows-and-wsus).

Each source has typical scenarios that depend on how your network is configured, in addition to how often they publish updates. The following update source locations and sample scenarios describe when to use each source:

|Location|Sample scenario|
|---|---|
|Windows Server Update Service|You're using Windows Server Update Service to manage updates for your network.|
|Microsoft Update|You want your endpoints to connect directly to Microsoft Update. This option is useful for endpoints that irregularly connect to your enterprise network, or if you don't use Windows Server Update Service to manage your updates.|
|UNC Share|You have devices that aren't connected to the Internet (such as virtual machines, or VMs). You can use your Internet-connected VM host to download the updates to a network share, from which the VMs can obtain the updates. See the [VDI deployment guide](deployment-vdi-microsoft-defender-antivirus.md) for how file shares are used in virtual desktop infrastructure (VDI) environments. Platform updates can also be deployed using this method. |
|Microsoft Configuration Manager|You're using Microsoft Configuration Manager to update your endpoints.|
|Security intelligence updates and platform updates for Microsoft Defender Antivirus and other Microsoft anti-malware (formerly referred to as MMPC)|[Make sure devices are updated to support SHA-2](https://support.microsoft.com/help/4472027/2019-sha-2-code-signing-support-requirement-for-windows-and-wsus). Microsoft Defender Antivirus Security intelligence and platform updates are delivered through Windows Update. As of October 21, 2019, security intelligence updates and platform updates are SHA-2 signed exclusively. <br/>Download the latest protection updates because of a recent infection or to help provision a strong, base image for [VDI deployment](deployment-vdi-microsoft-defender-antivirus.md). The security intelligence updates source should be used only as a final fallback source, and not the primary source. It's only to be used if updates can't be downloaded from Windows Server Update Service or Microsoft Update for [the configured number of days before protection is reported as out-of-date](manage-outdated-endpoints-microsoft-defender-antivirus.md#set-the-number-of-days-before-protection-is-reported-as-out-of-date).|

You can manage the order in which update sources are used with Group Policy, Microsoft Configuration Manager, PowerShell cmdlets, and WMI.

> [!IMPORTANT]
> If you set Windows Server Update Service as a download location, you must approve the updates, regardless of the management tool you use to specify the location. You can set up an automatic approval rule with Windows Server Update Service, which might be useful as updates arrive at least once a day. For instructions on configuring automatic approval rules, see [synchronize endpoint protection updates in standalone Windows Server Update Service](/intune/configmgr/protect/deploy-use/endpoint-definitions-wsus#to-synchronize-endpoint-protection-definition-updates-in-standalone-wsus).

The procedures in this article first describe how to set the order, and then how to set up the Windows File Server - **File share** option if the file share source is enabled in your update policy.

## Use Group Policy to manage the update location

Perform the following steps to configure the update location by using Group Policy:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Group Policy paths before Windows 10, version 1909 (November 2019) might use _Signature Updates_ instead of _Security Intelligence Updates_. The older and newer names refer to the same policy locations.

1. In the details pane of **Security Intelligence Updates**, the available settings are:
   - [Define the order of sources for downloading security intelligence updates](#enable-and-configure-the-security-intelligence-update-source-order)
   - [Define file shares for downloading security intelligence updates](#enable-and-configure-security-intelligence-update-file-shares)

   To open and configure a security intelligence update source setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

### Enable and configure the security intelligence update source order

1. In the details pane of **Security Intelligence Updates**, open the **Define the order of sources for downloading security intelligence updates** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Define the order of sources for downloading security intelligence updates** in the **Options** section: Enter the update sources in the order in which they should be contacted, separated by a single pipe (`|`). The available values are `InternalDefinitionUpdateServer`, `MicrosoftUpdateServer`, `MMPC`, and `FileShares`. For example, `InternalDefinitionUpdateServer|MicrosoftUpdateServer|MMPC`.

   :::image type="content" source="/defender/media/wdav-order-update-sources.png" alt-text="Screenshot of the Group Policy setting that defines the order of security intelligence update sources." lightbox="/defender/media/wdav-order-update-sources.png":::

   When you're finished, select **OK**.

### Enable and configure security intelligence update file shares

1. In the details pane of **Security Intelligence Updates**, open the **Define file shares for downloading security intelligence updates** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Define file shares for downloading security intelligence updates** in the **Options** section: Enter the file share sources in the order in which they should be contacted, separated by a single pipe (`|`). Use [standard UNC notation](/openspecs/windows_protocols/ms-dtyp/62e862f4-2a51-452e-8eeb-dc4ff5ee33cc) for each path. For example, `\\WindowsFileServer\share-name\object-name|\\host-name2\share-name\object-name`.

   If you don't enter any paths, the file share source is skipped when the VM downloads updates.

   When you're finished, select **OK**.

<a name="use-microsoft-endpoint-configuration-manager-to-manage-the-update-location"></a>

## Use Microsoft Configuration Manager to manage the update location

See [Configure Security intelligence Updates for Endpoint Protection](/intune/configmgr/protect/deploy-use/endpoint-definition-updates) for details on configuring Microsoft Configuration Manager (current branch).

## Use PowerShell cmdlets to manage the update location

Use the following PowerShell cmdlets to set the update order.

```PowerShell
Set-MpPreference -SignatureFallbackOrder "LOCATION|LOCATION|LOCATION|LOCATION"
Set-MpPreference -SignatureDefinitionUpdateFileSharesSource "\\UNC\PATH1|\\UNC\PATH2"
```

For more information, see the following articles:

- [Set-MpPreference -SignatureFallbackOrder](/powershell/module/defender/set-mppreference)
- [Set-MpPreference -SignatureDefinitionUpdateFileSharesSource](/powershell/module/defender/set-mppreference#-signaturedefinitionupdatefilesharessources)
- [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md)
- [Defender Antivirus cmdlets](/powershell/module/defender/index)

## Use Windows Management Instrumentation (WMI) to manage the update location

Use the [**Set** method of the **MSFT_MpPreference**](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) class for the following properties:

```WMI
SignatureFallbackOrder
SignatureDefinitionUpdateFileSharesSource
```

See the following articles for more information:

- [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal)

## Use Mobile Device Management (MDM) to manage the update location

See [Policy CSP - Defender/SignatureUpdateFallbackOrder](/windows/client-management/mdm/policy-csp-defender#defender-signatureupdatefallbackorder) for details on configuring MDM.

## What if we're using a non-Microsoft vendor?

This article describes how to configure and manage updates for Microsoft Defender Antivirus. However, you can hire non-Microsoft vendors to perform these tasks.

For example, suppose that Contoso has hired Fabrikam to manage their security solution, which includes Microsoft Defender Antivirus. Fabrikam typically uses [Windows Management Instrumentation](./use-wmi-microsoft-defender-antivirus.md), [PowerShell cmdlets](./use-powershell-cmdlets-microsoft-defender-antivirus.md), or [Windows command-line](./command-line-arguments-microsoft-defender-antivirus.md) to deploy patches and updates.

> [!NOTE]
> Microsoft does not test third-party solutions for managing Microsoft Defender Antivirus.

<a id="unc-share"></a>

## Create a UNC share for security intelligence

On a Windows File Server, set up a UNC (Universal Naming Convention) network file share (also known as a mapped drive) to download security intelligence from the Microsoft Malware Protection Center (MMPC) site by using a scheduled task.

1. On the system for which you want to provision the share and download the updates, create a folder for the script.

    ```cmd
    Start, CMD (Run as admin)
    MD C:\Tool\PS-Scripts\
    ```

1. Create a folder for signature updates.

    ```cmd
    MD C:\Temp\TempSigs\x64
    MD C:\Temp\TempSigs\x86
    ```

1. Download the PowerShell script from the [SignatureDownloadCustomTask package on PowerShell Gallery](https://www.powershellgallery.com/packages/SignatureDownloadCustomTask/1.4).

1. Select **Manual Download**.

1. Select **Download the raw nupkg file**.

1. Extract the file.

1. Copy the file `SignatureDownloadCustomTask.ps1` to the folder you previously created, `C:\Tool\PS-Scripts\` .

1. Use the command line to set up the scheduled task.

   > [!NOTE]
   > There are two types of updates: full and delta.

   - For x64 delta:

       ```powershell
       Powershell (Run as admin)

       C:\Tool\PS-Scripts\

       ".\SignatureDownloadCustomTask.ps1 -action create -arch x64 -isDelta $true -destDir C:\Temp\TempSigs\x64 -scriptPath C:\Tool\PS-Scripts\SignatureDownloadCustomTask.ps1 -daysInterval 1"
       ```

   - For x64 full:

       ```powershell
       Powershell (Run as admin)

       C:\Tool\PS-Scripts\

       ".\SignatureDownloadCustomTask.ps1 -action create -arch x64 -isDelta $false -destDir C:\Temp\TempSigs\x64 -scriptPath C:\Tool\PS-Scripts\SignatureDownloadCustomTask.ps1 -daysInterval 1"
       ```

   - For x86 delta:

       ```powershell
       Powershell (Run as admin)

       C:\Tool\PS-Scripts\

       ".\SignatureDownloadCustomTask.ps1 -action create -arch x86 -isDelta $true -destDir C:\Temp\TempSigs\x86 -scriptPath C:\Tool\PS-Scripts\SignatureDownloadCustomTask.ps1 -daysInterval 1"
       ```

   - For x86 full:

       ```powershell
       Powershell (Run as admin)

       C:\Tool\PS-Scripts\

       ".\SignatureDownloadCustomTask.ps1 -action create -arch x86 -isDelta $false -destDir C:\Temp\TempSigs\x86 -scriptPath C:\Tool\PS-Scripts\SignatureDownloadCustomTask.ps1 -daysInterval 1"
       ```

   > [!NOTE]
   > When the scheduled tasks are created, you can find these in the Task Scheduler under `Microsoft\Windows\Windows Defender`.

1. Run each task manually and verify that you have data (`mpam-d.exe`, `mpam-fe.exe`, and `nis_full.exe`) in the following folders (you might use different locations):

   - `C:\Temp\TempSigs\x86`
   - `C:\Temp\TempSigs\x64`

   If the scheduled task fails, run the following commands:

   ```cmd
    C:\windows\system32\windowspowershell\v1.0\powershell.exe -NoProfile -executionpolicy allsigned -command "&\"C:\Tool\PS-Scripts\SignatureDownloadCustomTask.ps1\" -action run -arch x64 -isDelta $False -destDir C:\Temp\TempSigs\x64"

    C:\windows\system32\windowspowershell\v1.0\powershell.exe -NoProfile -executionpolicy allsigned -command "&\"C:\Tool\PS-Scripts\SignatureDownloadCustomTask.ps1\" -action run -arch x64 -isDelta $True -destDir C:\Temp\TempSigs\x64"

    C:\windows\system32\windowspowershell\v1.0\powershell.exe -NoProfile -executionpolicy allsigned -command "&\"C:\Tool\PS-Scripts\SignatureDownloadCustomTask.ps1\" -action run -arch x86 -isDelta $False -destDir C:\Temp\TempSigs\x86"

    C:\windows\system32\windowspowershell\v1.0\powershell.exe -NoProfile -executionpolicy allsigned -command "&\"C:\Tool\PS-Scripts\SignatureDownloadCustomTask.ps1\" -action run -arch x86 -isDelta $True -destDir C:\Temp\TempSigs\x86"
    ```

   > [!NOTE]
   > Because the scheduled task launches PowerShell with `-ExecutionPolicy AllSigned`, the task runs non-interactively under the SYSTEM account. It can't respond to the `Do you want to run software from this untrusted publisher?` prompt that PowerShell displays the first time it encounters a signed script from a publisher that isn't yet classified as trusted. The first run of `SignatureDownloadCustomTask.ps1` can fail with an `UnauthorizedAccess` error.
   >
   > Before you run the scheduled task (or the recovery commands shown later), export the Authenticode code-signing certificate that's used to sign `SignatureDownloadCustomTask.ps1`, and import it into the local computer's Trusted Publishers certificate store.
   >
   > Alternatively, in environments where Group Policy is available, deploy the certificate to **Computer Configuration** \> **Policies** \> **Windows Settings** \> **Security Settings** \> **Public Key Policies** \> **Trusted Publishers**. For more information, see [about_Execution_Policies](/powershell/module/microsoft.powershell.core/about/about_execution_policies) and [about_Signing](/powershell/module/microsoft.powershell.core/about/about_signing).

1. Create a share pointing to `C:\Temp\TempSigs` (for example, `\\server\updates`).

    > [!NOTE]
    > At a minimum, authenticated users must have "Read" access. This requirement also applies to domain computers, the share, and NTFS (security).

1. Set the share location in the policy to the share.

    > [!NOTE]
    > Don't add the x64 (or x86) folder in the path. The `MpCmdRun.exe` process adds it automatically.

## Enable platform updates using UNC share

To enable platform updates using UNC share, download KB4052623 and copy it into the architecture folders as `updateplatform.exe`. The `updateplatform.exe` files are updated monthly and must be manually replaced each month.

KB4052623 is available for the following architectures:

- [x86](https://go.microsoft.com/fwlink/?LinkID=870379&clcid=0x409&arch=x86)

- [amd64](https://go.microsoft.com/fwlink/?LinkID=870379&clcid=0x409&arch=x64)

- [arm64](https://go.microsoft.com/fwlink/?LinkID=851034&clcid=0x409&arch=arm64)

**Example structure**:

```dos
[UNC Share]\
    x86\
       mpam-fe.exe
       mpam-d.exe
       updateplatform.exe
    x64\
       mpam-fe.exe
       mpam-d.exe
       updateplatform.exe
```

## Related articles

- [Deploy Microsoft Defender Antivirus](deploy-manage-report-microsoft-defender-antivirus.md)
- [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md)
- [Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md)
- [Manage event-based forced updates](manage-event-based-updates-microsoft-defender-antivirus.md)
- [Manage updates for mobile devices and VMs](manage-updates-mobile-devices-vms-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)
