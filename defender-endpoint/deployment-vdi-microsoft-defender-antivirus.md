---
title: Configure Microsoft Defender Antivirus on a remote desktop or virtual desktop infrastructure environment
description: Get an overview of how to configure Microsoft Defender Antivirus in a remote desktop or non-persistent virtual desktop environment.
ms.localizationpriority: medium
ms.date: 08/20/2026
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1015
ms.reviewer: jesquive
ms.subservice: ngp
ms.service: defender-endpoint
ms.collection:
- m365-security
- tier2
- ContentEngagementFY23
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to configure Microsoft Defender Antivirus for remote desktop or virtual desktop infrastructure so that virtual machines have appropriate protection and performance.
---

# Configure Microsoft Defender Antivirus on a remote desktop or virtual desktop infrastructure environment

This article is designed for customers who are using Microsoft Defender Antivirus capabilities only. If you have Microsoft Defender for Endpoint (which includes Microsoft Defender Antivirus alongside other device protection capabilities), see [Onboard non-persistent virtual desktop infrastructure (VDI) devices in Microsoft Defender](configure-endpoints-vdi.md).

You can use Microsoft Defender Antivirus in a remote desktop (RDS) or non-persistent virtual desktop infrastructure (VDI) environment. Using the configuration steps in this guide for Microsoft Defender Antivirus in RDS or VDI environments, you can configure updates to download directly to your RDS or VDI environments whenever a user signs in.

This guide describes how to configure Microsoft Defender Antivirus on your VMs for optimal protection and performance, including how to:

- [Set up a dedicated VDI file share for security intelligence updates](#set-up-a-dedicated-vdi-file-share-for-security-intelligence)
- [Download and unpackage the latest updates](#download-and-unpackage-the-latest-updates)
- [Configure Microsoft Defender Antivirus settings](#microsoft-defender-antivirus-configuration-settings)
- [Run the Windows Defender Cache Maintenance scheduled task](#run-the-windows-defender-cache-maintenance-scheduled-task)

> [!IMPORTANT]
> Although a VDI can be hosted on Windows Server 2012 or Windows Server 2016, virtual machines (VMs) should be running Windows 10, version 1607 at a minimum, due to increased protection technologies and features that are unavailable in earlier versions of Windows.

## Prerequisites

Before you configure Microsoft Defender Antivirus for your RDS or VDI environment, verify that your devices meet the following requirements.

### Supported operating systems

Microsoft Defender Antivirus VDI configuration is supported on the following operating systems:

- Windows

## Set up a dedicated VDI file share for security intelligence

In Windows 10, version 1903, Microsoft introduced the shared security intelligence feature, which offloads the unpackaging of downloaded security intelligence updates onto a host machine. Offloading unpackaging to a host machine reduces the usage of CPU, disk, and memory resources on individual machines. Shared security intelligence now works on Windows 10, version 1703 and later. You can set up the shared security intelligence feature by using Group Policy or PowerShell.

<a name="group-policy"></a>
### Configure the VDI file share by using Group Policy

Use the following steps to configure the shared security intelligence location by using Group Policy:

1. On your Group Policy management computer, open the Group Policy Management Console, right-click the Group Policy Object you want to configure, and then select **Edit**.

1. In the Group Policy Management Editor, go to **Computer configuration**.

1. Select **Administrative templates**. Expand the tree to **Windows components** > **Microsoft Defender Antivirus** > **Security Intelligence Updates**.

1. Double-click **Define security intelligence location for VDI clients**, and then set the option to **Enabled**. A field automatically appears.

1. In the field, type `\\<File Server shared location\>\wdav-update`. (For help with this value, see [Download and unpackage the latest updates](#download-and-unpackage-the-latest-updates).)

1. Select **OK**, and then deploy the Group Policy Object to the VMs you want to test.

<a name="powershell"></a>
### Configure the VDI file share by using PowerShell

Use PowerShell to configure the shared security intelligence path on each device:

1. On each RDS or VDI device, use the following cmdlet to enable the feature:

   `Set-MpPreference -SharedSignaturesPath \\<File Server shared location>\wdav-update`

1. Push the update as you normally would push PowerShell-based configuration policies onto your VMs. (See [Download and unpackage the latest updates](#download-and-unpackage-the-latest-updates), specifically the example file-share path `\FileServer.fqdn\mdatp$\wdav-update`.)

## Download and unpackage the latest updates

Use the following sample PowerShell script to download and unpack security intelligence updates for your VMs. The sample script is the easiest way to download new updates and get them ready for your VMs. You should then schedule the security intelligence download script to run at a certain time on the management machine by using a scheduled task. Or, if you're familiar with using PowerShell scripts in Azure, Intune, or Configuration Manager, you could deploy the sample script through those tools instead.

```powershell
$vdmpathbase = "$env:systemdrive\wdav-update\{00000000-0000-0000-0000-"
$vdmpathtime = Get-Date -format "yMMddHHmmss"
$vdmpath = $vdmpathbase + $vdmpathtime + '}'
$vdmpackage = $vdmpath + '\mpam-fe.exe'

New-Item -ItemType Directory -Force -Path $vdmpath | Out-Null

Invoke-WebRequest -Uri 'https://go.microsoft.com/fwlink/?LinkID=121721&arch=x64' -OutFile $vdmpackage

Start-Process -FilePath $vdmpackage -WorkingDirectory $vdmpath -ArgumentList "/x"
```

You can set a scheduled task to run once a day so that whenever the package is downloaded and unpacked then the VMs receive the new update. We suggest starting with once a day, but you should experiment with increasing or decreasing the frequency to understand the impact.

Security intelligence packages are typically published once every three to four hours. Setting a frequency shorter than four hours isn't advisable because it increases the network overhead on your management machine for no benefit.

You can also set up your single server or machine to fetch the updates on behalf of the VMs at an interval and place them in the file share for consumption. File-share-based update distribution is possible when the devices have share and read access (NTFS permissions) to the share so they can grab the updates. To set up this configuration, follow these steps:

1. Create an SMB/CIFS file share.

1. Use the following example to create a file share with the following share permissions.

   ```PowerShell

   PS c:\> Get-SmbShareAccess -Name mdatp$

   Name   ScopeName AccountName AccessControlType AccessRight
   ----   --------- ----------- ----------------- -----------
   mdatp$ *         Everyone    Allow             Read

   ```

   > [!NOTE]
   > An NTFS permission is added for **Authenticated Users:Read:**.

   In the preceding sample configuration, the file share is `\\FileServer.fqdn\mdatp$\wdav-update`.

### Set a scheduled task to run the PowerShell script

Perform the following steps to create a scheduled task that runs the security intelligence update script on the management machine:

1. On the management machine, open the **Start** menu and type `Task Scheduler`. From the results, select Task Scheduler and then select **Create task...** in the side panel.

1. Specify the name as `Security intelligence unpacker`.

1. On the **Trigger** tab, select **New...** > **Daily**, and select **OK**.

1. On the **Actions** tab, select **New...**.

1. Specify `PowerShell` in the **Program/Script** field.

1. In the **Add arguments**  field, type `-ExecutionPolicy Bypass c:\wdav-update\vdmdlunpack.ps1`, and then select **OK**.

1. Configure any other settings as appropriate.

1. Select **OK** to save the scheduled task.

To initiate the update manually, right-click on the task, and then select **Run**.

### Download and unpackage manually

If you would prefer to do everything manually, here's what to do to replicate the script's behavior:

1. Create a new folder on the system root called `wdav_update` to store intelligence updates. For example, create the folder `c:\wdav_update`.

1. Create a subfolder under `wdav_update` with a GUID name, such as `{00000000-0000-0000-0000-000000000000}`

   Here's an example: `c:\wdav_update\{00000000-0000-0000-0000-000000000000}`

   > [!NOTE]
   > We set the script so that the last 12 digits of the GUID are the year, month, day, and time when the file was downloaded so that a new folder is created each time. You can change the GUID-based folder naming behavior so that the file is downloaded to the same folder each time.

1. Download a security intelligence package from [Microsoft Defender security intelligence updates](https://www.microsoft.com/wdsi/defenderupdates) into the GUID folder. The file should be named `mpam-fe.exe`.

1. Open a Command Prompt window and navigate to the GUID folder you created. Use the `/X` extraction command to extract the files. For example, `mpam-fe.exe /X`.

   > [!NOTE]
   > The VMs pick up the updated package whenever a new GUID folder is created with an extracted update package or whenever an existing folder is updated with a new extracted package.

## Microsoft Defender Antivirus configuration settings

Use the following recommended Microsoft Defender Antivirus configuration settings to optimize protection and performance for VDI environments.

> [!TIP]
> The latest Windows group policy administrative templates are available in [Create and manage Central Store](/troubleshoot/windows-client/group-policy/create-and-manage-central-store).

<a name="root"></a>
### Configure root-level Microsoft Defender Antivirus settings

Configure the following root-level policy settings:

- Configure detection for potentially unwanted applications: `Enabled - Block`

- Configure local administrator merge behavior for lists: `Disabled` — Set this policy to **Disabled** to prevent locally defined exclusions and lists from being merged with centrally managed policies. When disabled, only centrally managed policies (for example, Group Policy) are applied.

> [!NOTE]
> Disabling local administrator merge behavior for lists ensures that local administrators cannot override centrally managed exclusion lists and policy configurations on VDI VMs.

- Control whether or not exclusions are visible to Local Admins: `Enabled`

- Turn off routine remediation: `Disabled`

- Randomize scheduled scans: `Enabled`

<a name="client-interface"></a>
### Configure client interface settings

Use the following client interface settings:

- Enable headless UI mode: `Enabled`

   > [!NOTE]
   > The Enable headless UI mode policy hides the entire Microsoft Defender Antivirus user interface from end users in your organization.

- Suppress all notifications: `Enabled`

   > [!NOTE]
   > Sometimes, Microsoft Defender Antivirus notifications are sent to or persist across multiple sessions. To help avoid user confusion, you can lock down the Microsoft Defender Antivirus user interface.
   >
   > Suppressing notifications prevents notifications from Microsoft Defender Antivirus from showing up when scans are done or remediation actions are taken. However, your security operations team sees the results of a scan if an attack is detected and stopped. Alerts, such as an initial access alert, are generated, and appear in the [Microsoft Defender portal](https://security.microsoft.com).

<a name="maps"></a>
### Configure Microsoft Active Protection Service (MAPS) settings

Configure Microsoft MAPS with the following settings:

- Join Microsoft MAPS (Turn on cloud-delivered protection): `Enabled - Advanced MAPS`

- Send file samples when further analysis is required: `Send all samples (more secure)` or `Send safe sample (less secure)`

<a name="mpengine"></a>
### Configure MPEngine settings

Use the following antimalware engine settings:

- Configure extended cloud check: `20`

- Select cloud protection level: `Enabled - High`

- Enable file hash computation feature: `Enabled`

> [!NOTE]
> "Enable file hash computation feature" is only needed if using Indicators – File hash. It can cause higher amount of CPU utilization, since it has to parse through each binary on disk to get the file hash.

<a name="real-time-protection"></a>
### Configure real-time protection settings

Configure real-time protection with the following settings:

- Configure monitoring for incoming and outgoing file and program activity: `Enabled – bi-directional (full on-access)`

- Monitor file and program activity on your computer: `Enabled`

- Scan all downloaded files and attachments: `Enabled`

- Turn on behavior monitoring: `Enabled`

- Turn on process scanning whenever real-time protection is enabled: `Enabled`

- Turn on raw volume write notifications: `Enabled`

<a name="scans"></a>
### Configure scan settings

Use the following scan settings:

- Check for the latest virus and spyware security intelligence before running a scheduled scan: `Enabled`

- Scan archive files: `Enabled`

- Scan network files: `Not configured`

- Scan packed executables: `Enabled`

- Scan removable drives: `Enabled`

- Turn on catch-up full scan (Disable catch-up full scan): `Not configured`

- Turn on catch-up quick scan (Disable catch-up quick scan): `Not configured`

   > [!NOTE]
   > To run a quick scan after a virtual machine misses two consecutive scheduled scans, configure the setting for your management method:
   >
   > - Group Policy: Set **Turn on catch-up quick scan** to `Enabled`.
   > - Intune: Set **Disable Catchup Quick Scan** to `Disabled`.
   >
   > Catch-up scans use more CPU when they run.

- Turn on e-mail scanning: `Enabled`

- Turn on heuristics: `Enabled`

- Turn on reparse point scanning: `Enabled`

#### General scheduled scan settings

Configure general scheduled scan behavior with the following settings:

- Configure low CPU priority for scheduled scans (Use low CPU priority for scheduled scans): `Not configured`

- Specify the maximum percentage of CPU utilization during a scan (CPU usage limit per scan): `50`

- Start the scheduled scan only when computer is on but not in use (ScanOnlyIfIdle): `Not configured`

- Use the following cmdlet, to stop a quick or scheduled scan whenever the device goes idle if it is in passive mode.

   ```powershell

   Set-MpPreference -ScanOnlyIfIdleEnabled $false

   ```

> [!TIP]
> The setting, "Start the scheduled scan only when computer is on but not in use" prevents significant CPU contention in high-density environments.

#### Daily quick scan

Use the following daily quick scan settings:

- Specify the interval to run quick scans per day: `Not configured`

- Specify the time for a daily quick scan (Run daily quick scan at): `12 PM`

#### Run a weekly scheduled scan (quick or full)

Configure weekly scheduled scans with the following settings:

- Specify the scan type to use for a scheduled scan (Scan type): `Not configured`

- Specify the time of day to run a scheduled scan (Day of week to run scheduled scan): `Not configured`

- Specify the day of the week to run a scheduled scan (Time of day to run a scheduled scan): `Not configured`

<a name="security-intelligence-updates"></a>
### Configure security intelligence update settings

Use the following security intelligence update settings:

- Turn on scan after security intelligence update (Disable scans after an update): `Disabled`

   > [!NOTE]
   > Disabling a scan after a security intelligence update prevents a scan from occurring after receiving an update. You can apply this setting when creating the base image if you have also run a quick scan. By disabling scans after a security intelligence update, you can prevent the newly updated VM from performing a scan again (as you've already scanned it when you created the base image).

   > [!IMPORTANT]
   > Running scans after an update helps ensure your VMs are protected with the latest security intelligence updates. Disabling this option reduces the protection level of your VMs and should only be used when first creating or deploying the base image.

- Specify the interval to check for security intelligence updates (Enter how often to check for security intelligence updates): `Enabled - 8`

- Leave other settings in their default state

<a name="threats"></a>
### Configure threat default actions

Configure threat default actions with the following settings:

- Specify threat alert levels at which default action shouldn't be taken when detected: `Enabled`

- Set `Severe (5)`, `High (4)`, `Medium (2)`, and `Low (1)` all to `Quarantine (2)`, as shown in the following table:

   |Value name|Value |
   | -------- | -------- |
   |`1` (Low) |`2` |
   |`2` (Medium) |`2`|
   |`4` (High) |`2`|
   |`5` (Severe) |`2`|

<a name="attack-surface-reduction-rules"></a>
### Configure attack surface reduction rules

ASR rules target risky software behavior on Windows devices that attackers commonly exploit through malware (for example, launching scripts that download files, running obfuscated scripts, and injecting code into other processes). For more information, see [Attack surface reduction (ASR) rules overview](attack-surface-reduction-rules-overview.md).

Typically, you can enable the [standard protection rules](attack-surface-reduction-rules-overview.md#asr-rules) in **Block** or **Warn** mode without testing. You should test other ASR rules in **Audit** mode before you switch them to **Block** or **Warn** mode. For more information, see the [ASR rules deployment guide](attack-surface-reduction-rules-deployment.md).

### Enable network protection

Prevent users and apps from accessing dangerous websites (Enable network protection): `Enabled - Audit mode`.

### SmartScreen for Microsoft Edge

Use the following SmartScreen for Microsoft Edge settings:

- Require SmartScreen for Microsoft Edge: `Yes`

- Block malicious site access: `Yes`

- Block unverified file download: `Yes`

## Run the Windows Defender Cache Maintenance scheduled task

Optimize the "Windows Defender Cache Maintenance" scheduled task for non-persistent and/or persistent VDI environments. Run this task on the main image before sealing.

1. Open up the **Task Scheduler** mmc (`taskschd.msc`).

1. Expand **Task Scheduler Library** > **Microsoft** > **Windows** > **Windows Defender**, and then right-click on **Windows Defender Cache Maintenance**.

   > [!WARNING]
   > If you skip this step, each VM can experience higher CPU utilization while the cache maintenance task runs.

1. Select **Run**, and let the scheduled task finish.

### Enable tamper protection

Enable tamper protection to prevent Microsoft Defender Antivirus from being disabled in the [Microsoft Defender portal](https://security.microsoft.com).

<a name="exclusions"></a>
### Configure antivirus exclusions for VDI environments

If you think you need to add exclusions, see [Manage exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-exclusions-overview.md).

<a name="next-step"></a>
## Next steps

If you're also deploying [endpoint detection and response](overview-endpoint-detection-response.md) (EDR) to your Windows-based VDI VMs, see [Onboard non-persistent virtual desktop infrastructure (VDI) devices in Microsoft Defender](configure-endpoints-vdi.md).

## See also

- [Tech Community Blog: Configuring Microsoft Defender Antivirus for non-persistent VDI machines](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/configuring-microsoft-defender-antivirus-for-non-persistent-vdi/ba-p/1489633)
- [SignatureDownloadCustomTask PowerShell script](https://www.powershellgallery.com/packages/SignatureDownloadCustomTask/1.4)

If you're looking for information about Defender for Endpoint on non-Windows platforms, see the following resources:

- [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure Defender for Endpoint on Android features](android-configure.md)
- [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
