---
title: Take response actions on a device in Microsoft Defender for Endpoint
description: Respond to attacks on a device in Microsoft Defender for Endpoint by isolating it, collecting an investigation package, running a scan, or restricting apps.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.date: 07/23/2026
ms.collection:
- m365-security
- tier2
- mde-edr
ms.topic: how-to
ms.subservice: edr
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Take response actions on a device

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Quickly respond to detected attacks by isolating devices or collecting an investigation package. After taking action on devices, you can check activity details on the Action center.

Response actions run along the top of a specific device page and include:

- Manage tags
- Initiate automated investigation
- Initiate live response session
- Collect investigation package
- Run antivirus scan
- Restrict app execution
- Isolate device
- Contain device
- Consult a threat expert
- Action center

:::image type="content" source="media/response-actions.png" alt-text="Screenshot that shows response actions across the top of a device page in the Microsoft Defender portal." lightbox="media/response-actions.png":::

> [!NOTE]
> [Defender for Endpoint Plan 1](defender-endpoint-plan-1.md) includes only the following manual response actions:
>
> - Run antivirus scan
> - Isolate device
> - Stop and quarantine a file
> - Add an indicator to block or allow a file
>
> [Microsoft Defender for Business](/defender-business/mdb-overview) doesn't include the "Stop and quarantine a file" action at this time.
>
> Your subscription must include Defender for Endpoint Plan 2 to have all of the response actions described in this article.

You can find device pages from any of the following views:

- **Alerts queue**: Select the device name beside the device icon from the alerts queue.
- **Devices list**: Select the heading of the device name from the devices list.
- **Search box**: Select **Device** from the drop-down menu and enter the device name.

> [!IMPORTANT]
> For information on availability and support for each response action, see the supported minimum operating system requirements listed in [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md).

Some high-impact response actions can be restricted on high-value assets to prevent potential business disruption. For more information, see [Restrict response actions on high-value assets](restrict-response-actions-high-value-assets.md).

## Manage tags

Add or manage tags to create a logical group affiliation. Device tags support proper mapping of the network, enabling you to attach different tags to capture context and to enable dynamic list creation as part of an incident.

For more information on device tagging, see [Create and manage device tags](machine-tags.md).

## Initiate automated investigation

You can start a new automated investigation on the device if needed. While an investigation runs, any other alert from the device is added to that investigation until it completes. If the same threat appears on other devices, those devices are also added.

For more information on automated investigations, see [Overview of Automated investigations](automated-investigations.md).

## Initiate live response session

Live response gives you instant access to a device through a remote shell connection. Live response lets you do deep investigative work and take quick action to contain threats in real time.

Live response helps you collect forensic data, run scripts, send suspicious entities for analysis, fix threats, and hunt for emerging threats.

For more information on live response, see [Investigate entities on devices using live response](live-response.md).

> [!NOTE]
> Live response can be restricted on devices onboarded as [high-value assets](restrict-response-actions-high-value-assets.md), based on the selective response actions defined when the device was onboarded. If live response isn't available for a device, review the device's selective response actions configuration.

## Collect investigation package from devices

As part of the investigation or response process, you can collect an investigation package from a device. By collecting the investigation package, you can identify the current state of the device and further understand the tools and techniques used by the attacker.

To download the package (zipped folder) and investigate the events that occurred on a device, follow these steps:

1. Select **Collect investigation package** from the row of response actions at the top of the device page.

1. Specify in the text box why you want to perform this action. Select **Confirm**.

1. The zip file downloads.

Or, use this alternate procedure:

1. Select **Collect Investigation Package** from the response actions section of the device page.

   :::image type="content" source="media/collect-investigation-package.png" alt-text="Screenshot of the device page option to collect an investigation package." lightbox="media/collect-investigation-package.png":::

1. Add comments and then select **Confirm**.

   :::image type="content" source="media/comments-confirm.png" alt-text="Screenshot of the confirmation dialog for adding a comment to the action." lightbox="media/comments-confirm.png":::

1. Select **Action center** from the response actions section of the device page.

   :::image type="content" source="media/action-center-selected.png" alt-text="Screenshot of the Action center selected in the response actions section of the device page." lightbox="media/action-center-selected.png":::

1. Select **Package collection package available** to download the collection package.

   :::image type="content" source="media/download-package.png" alt-text="Screenshot of the option to download the collected investigation package from the Action center." lightbox="media/download-package.png":::

   > [!NOTE]
   > Collection of the investigation package might fail if the target device has a low battery level or is on a metered connection.

### Investigation package contents for Windows devices

For Windows devices, the package contains the folders described in the following table:

|Folder|Description|
|---|---|
|Autoruns|Contains a set of files that each represent the content of the registry of a known auto start entry point (ASEP) to help identify attacker's persistency on the device. <br/><br/>If the registry key isn't found, the file contains the following message: "ERROR: The system was unable to find the specified registry key or value." |
|Installed programs|This .CSV file contains the list of installed programs that can help identify what is currently installed on the device. For more information, see [Win32_Product class](https://go.microsoft.com/fwlink/?linkid=841509).|
|Network connections|This folder contains a set of data points related to the connectivity information that can help in identifying connectivity to suspicious URLs, attacker's command and control (C&C) infrastructure, any lateral movement, or remote connections. <br/><br/>- `ActiveNetConnections.txt`: Displays protocol statistics and current TCP/IP network connections. Enables you to look for suspicious connectivity made by a process.<br/><br/>- `Arp.txt`: Displays the current address resolution protocol (ARP) cache tables for all interfaces. ARP cache can reveal other hosts on a network that were compromised or suspicious systems on the network that might be used to run an internal attack.<br/><br/>- `DnsCache.txt`: Displays the contents of the DNS client resolver cache, which includes both entries preloaded from the local Hosts file and any recently obtained resource records for name queries resolved by the computer. Reviewing the DNS cache can help identify suspicious connections.<br/><br/>- `IpConfig.txt`: Displays the full TCP/IP configuration for all adapters. Adapters can represent physical interfaces, such as installed network adapters, or logical interfaces, such as dial-up connections.<br/><br/>- `FirewallExecutionLog.txt` and `pfirewall.log`<br/><br/>The `pfirewall.log` file must exist in `%windir%\system32\logfiles\firewall\pfirewall.log`. It's included in the investigation package. For more information on creating the firewall log file, see [Configure the Windows Firewall with Advanced Security Log](/windows/security/operating-system-security/network-security/windows-firewall/configure-logging).|
|Prefetch files|Windows Prefetch files are designed to speed up the application startup process. It can be used to track all the files recently used in the system and find traces for applications that might be deleted but can still be found in the prefetch file list. <br/><br/>- `Prefetch folder`: Contains a copy of the prefetch files from `%SystemRoot%\Prefetch`. We recommend downloading a prefetch file viewer to view the prefetch files.<br/><br/>- `PrefetchFilesList.txt`: Contains the list of all the copied files that can be used to track if there were any copy failures to the prefetch folder.|
|Processes|Contains a .CSV file listing the processes currently running on the device. This process list can be useful when identifying a suspicious process and its state.|
|Scheduled tasks|Contains a .CSV file listing the scheduled tasks, which can be used to identify routines performed automatically on a chosen device to look for suspicious code that was set to run automatically.|
|Security event log|Contains the security event log, which contains records of sign-in or sign out activity, or other security-related events specified by the system's audit policy. <br/><br/>Open the event log file using Event viewer.|
|Services|Contains a .CSV file that lists services and their states.|
|Windows Server Message Block (SMB) sessions|Lists shared access to files, printers, and serial ports and miscellaneous communications between nodes on a network. Reviewing SMB session data can help identify data exfiltration or lateral movement.<br/><br/>Contains files for `SMBInboundSessions` and `SMBOutboundSession`. If there are no sessions (inbound or outbound), you get a text file that tells you that there are no SMB sessions found.|
|System Information|Contains a `SystemInformation.txt` file that lists system information such as OS version and network cards.|
|Temp Directories|Contains a set of text files that lists the files located in `%Temp%` for every user in the system. This can help to track suspicious files that an attacker might have dropped on the system. <br/><br/>If the file contains the following message: "The system can't find the path specified," it means that there's no temp directory for this user, and might be because the user didn't sign in to the system.|
|Users and Groups|Provides a list of files that each represent a group and its members.|
|WdSupportLogs|Provides the `MpCmdRunLog.txt` and `MPSupportFiles.cab`. This folder is only created on Windows 10, version 1709 or later with February 2020 update rollup or more recent versions installed: <br/><br/>- Win10 1709 (RS3) Build 16299.1717: [KB4537816](https://support.microsoft.com/help/4537816/windows-10-update-kb4537816)<br/><br/>- Win10 1803 (RS4) Build 17134.1345: [KB4537795](https://support.microsoft.com/help/4537795/windows-10-update-kb4537795)<br/><br/>- Win10 1809 (RS5) Build 17763.1075: [KB4537818](https://support.microsoft.com/help/4537818/windows-10-update-kb4537818)<br/><br/>- Win10 1903/1909 (19h1/19h2) Builds 18362.693 and 18363.693: [KB4535996](https://support.microsoft.com/help/4535996/windows-10-update-kb4535996)|
|CollectionSummaryReport.xls|The CollectionSummaryReport.xls file is a summary of the investigation package collection. It contains the list of data points, the command used to extract the data, the execution status, and the error code if there's failure. You can use this report to track if the package includes all the expected data and identify if there were any errors.|

### Investigation package contents for Mac and Linux devices

The following table lists the contents of the collection packages for Mac and Linux devices:

|Object|macOS|Linux|
|---|---|---|
|Applications|A list of all installed applications|Not applicable|
|Disk volume|- Amount of free space<br/>- List of all mounted disk volumes<br/>- List of all partitions</li>|- Amount of free space<br/>- List of all mounted disk volumes<br/>- List of all partitions|
|File|A list of all open files with the corresponding processes using these files|A list of all open files with the corresponding processes using these files|
|History|Shell history|Not applicable|
|Kernel modules|All loaded modules|Not applicable|
|Network connections|- Active connections<br/>- Active listening connections<br/>- ARP table<br/>- Firewall rules<br/>- Interface configuration<br/>- Proxy settings<br/>- VPN settings|- Active connections<br/>- Active listening connections<br/>- ARP table<br/>- Firewall rules<br/>- IP list<br/>- Proxy settings|
|Processes|A list of all running processes|A list of all running processes|
|Services and scheduled tasks|- Certificates<br/>- Configuration profiles<br/>- Hardware information|- CPU details<br/>- Hardware information<br/>- Operating system information</li>|
|System security information|- Extensible Firmware Interface (EFI) integrity information<br/>- Firewall status<br/>- Malware Removal Tool (MRT) information<br/>- System Integrity Protection (SIP) status</li>|Not applicable|
|Users and groups|- Sign-in history<br/>- Sudoers|- Sign-in history<br/>- Sudoers|

## Run Microsoft Defender Antivirus scan on devices

As part of the investigation or response process, you can remotely initiate an antivirus scan to help identify and remediate malware that might be present on a compromised device.

> [!IMPORTANT]
>
> - The remote antivirus scan action is supported for macOS and Linux for client version 101.98.84 and above. You can also use live response to run the action. For more information on live response, see [Investigate entities on devices using live response](live-response.md)
> - A Microsoft Defender Antivirus scan can run alongside other antivirus solutions, whether Microsoft Defender Antivirus is the active antivirus solution or not. Microsoft Defender Antivirus can be in Passive mode. For more information, see [Microsoft Defender Antivirus compatibility](microsoft-defender-antivirus-compatibility.md).

Once you have selected **Run antivirus scan**, select the scan type that you'd like to run (quick or full) and add a comment before confirming the scan.

:::image type="content" source="media/run-antivirus.png" alt-text="Screenshot of the notification to select a quick or full scan and add a comment." lightbox="media/run-antivirus.png":::

The Action center shows the antivirus scan details. The device timeline includes a new event that shows a scan action was submitted on the device. Microsoft Defender Antivirus alerts show any threats found during the scan.

> [!NOTE]
> When triggering a scan using Defender for Endpoint response action, Microsoft Defender Antivirus `ScanAvgCPULoadFactor` value applies and limits the CPU impact of the scan.
> If `ScanAvgCPULoadFactor` isn't configured, the default value is a limit of 50% maximum CPU load during a scan.
> For more information, see [Configure advanced scan types for Microsoft Defender Antivirus](configure-advanced-scan-types-microsoft-defender-antivirus.md).

## Restrict app execution

In addition to containing an attack by stopping malicious processes, you can also lock down a device and prevent subsequent attempts of potentially malicious programs from running.

> [!IMPORTANT]
>
> - Restrict app execution is available for devices on Windows 10, version 1709 or later, Windows 11, and Windows Server 2019 or later.
> - Restrict app execution is available if your organization uses Microsoft Defender Antivirus.
> - Restrict app execution needs to meet the Windows Defender Application Control code integrity policy formats and signing requirements. For more information, see [Code integrity policy formats and signing](/windows/security/application-security/application-control/app-control-for-business/deployment/use-code-signing-for-better-control-and-protection).

To restrict an app from running, a code integrity policy is applied. This policy only allows files to run if they're signed by a Microsoft-issued certificate. Allowing only Microsoft-signed files helps stop attackers from controlling compromised devices.

> [!NOTE]
> You are able to reverse the restriction of applications from running at any time. The button on the device page changes to say **Remove app restrictions**, and then you select **Remove app restrictions**, type a comment, and select **Confirm**.

Once you have selected **Restrict app execution** on the device page, type a comment and select **Confirm**. The Action center shows the app restriction details, and the device timeline includes a new event.

:::image type="content" source="media/restrict-app-execution.png" alt-text="Screenshot of the app restriction confirmation notification." lightbox="media/restrict-app-execution.png":::

### Device user notification for app restriction

When an app is restricted, the following notification is displayed to inform the user that an app is being restricted from running:

:::image type="content" source="media/atp-app-restriction.png" alt-text="Screenshot of the app restriction message shown to the device user." lightbox="media/atp-app-restriction.png":::

> [!NOTE]
> The notification isn't available on Windows Server 2016 and Windows Server 2012 R2.

## Isolate devices from the network

Depending on the severity of the attack and the sensitivity of the device, you might want to isolate the device from the network. Device isolation can help prevent the attacker from controlling the compromised device and performing further activities such as data exfiltration and lateral movement.

**Important points to keep in mind**:

- In environments that use web proxies (including Proxy Auto Configuration (PAC), WPAD, or static/direct proxy configurations), devices might not be able to recover from network isolation. Use selective isolation in such cases. When using selective isolation, exclusion settings aren't required to avoid this scenario.
- Isolating devices from the network is supported for macOS for client version 101.98.84 and above. You can also use live response to run the action. For more information on live response, see [Investigate entities on devices using live response](live-response.md)
- Full isolation is available for devices running Windows 11, Windows 10, version 1703 or later, Windows Server 2012 R2 and later, and Azure Stack HCI OS, version 23H2 and later.
- Isolating devices from the network is supported when Defender is running in passive mode on all supported Windows operating systems, macOS and Linux supported versions.
- You can use the device isolation capability on all supported Microsoft Defender for Endpoint on Linux listed in [System requirements](mde-linux-prerequisites.md). Ensure that the following prerequisites are enabled:
  - `iptables`
  - `ip6tables`
  - Linux kernel with `CONFIG_NETFILTER`, `CONFIG_IP_NF_IPTABLES`, and `CONFIG_IP_NF_MATCH_OWNER` for kernel version lower than 5.x and `CONFIG_NETFILTER_XT_MATCH_OWNER` from 5.x kernel.

- Selective isolation is available for devices running on Windows 11, Windows 10 version 1703 or later, Windows Server 2012 R2 and later, Azure Stack HCI OS, version 23H2 and later, and macOS. For more information about selective isolation, see [Isolation exclusions](network-isolation-exclusions.md).
- When isolating a device, only certain processes and destinations are allowed. Therefore, devices that are behind a full VPN tunnel won't be able to reach the Microsoft Defender for Endpoint cloud service after the device is isolated. We recommend using a split-tunneling VPN for Microsoft Defender for Endpoint and Microsoft Defender Antivirus cloud-based protection-related traffic.
- The feature supports VPN connection.
- You must have at least the `Active remediation actions` role assigned. For more information, see [Create and manage roles](user-roles.md).
- You must have access to the device based on the device group settings. For more information, see [Create and manage device groups](machine-groups.md).
- Exclusions, such as e-mail, messaging application, and other applications for both macOS and Linux isolation aren't supported.
- An isolated device is removed from isolation when an administrator modifies or adds a new `iptable` rule to the isolated device.
- Isolating a server running on Microsoft Hyper-V blocks network traffic to all child virtual machines of the server.
- Device isolation is automatically lifted after seven days.

The device isolation feature disconnects the compromised device from the network while retaining connectivity to the Defender for Endpoint service, which continues to monitor the device. On Windows 10, version 1709 or later, you can use selective isolation for more control over the network isolation level. You can also choose to enable Outlook and Microsoft Teams connectivity.

> [!NOTE]
> You can reconnect the device back to the network at any time. The button on the device page changes to say **Release from isolation**. At this stage, you can take the same steps as isolating the device.
>
> If a device is inactive or offline when an isolation action is submitted, Microsoft Defender for Endpoint retries enforcing the isolation for up to three days. If the device doesn't reconnect in that time, the isolation won't be retried, and administrators should reissue the isolation action after the device becomes active.

Once you have selected **Isolate device** on the device page, type a comment and select **Confirm**. The Action center shows the scan information and the device timeline includes a new event.

:::image type="content" source="media/isolate-device.png" alt-text="An isolated device details page" lightbox="media/isolate-device.png":::

> [!NOTE]
> The notification isn't available on non-Windows platforms.

<a id="isolate-device-automatic-attack-disruption"></a>

## Isolate device - automatic attack disruption (Preview)

When a device in your organization might be compromised, Microsoft Defender for Endpoint can automatically isolate it as part of [automatic attack disruption](/defender-xdr/automatic-attack-disruption). Automatic isolation helps reduce further impact on the organization and limit attacker lateral movement. It also helps prevent data exfiltration and ransomware spread.
When a device is isolated automatically:

- The compromised device is disconnected from the network, reducing the risk of further impact on the organization.
- The device retains connectivity to the Microsoft Defender for Endpoint service, which continues to monitor the device.

> [!NOTE]
> Automatic device isolation works only on end-user workstations that are onboarded and managed by Microsoft Defender for Endpoint.
>
> To manually isolate a device, see [Isolate devices from the network](#isolate-devices-from-the-network).

### View automatic device isolation actions

After automatic isolation is applied, you can review the action and its status in the Defender portal:

- Open the relevant incident and review the **Activities** tab.

    :::image type="content" source="/defender/media/defender-endpoint/view-automatic-device-isolation-activities.png" alt-text="Screenshot showing how to view automatic device isolation in the Activities tab." lightbox="/defender/media/defender-endpoint/view-automatic-device-isolation-activities.png":::

- Open the affected device page and confirm the device isolation status.
- Open **Action center** to review action history and current state.

    :::image type="content" source="/defender/media/defender-endpoint/view-automatic-device-isolation-action.png" alt-text="Screenshot showing how to view automatic device isolation in the Action center." lightbox="/defender/media/defender-endpoint/view-automatic-device-isolation-action.png":::

### Safeguards and business impact

Before deploying or responding to automatic device isolation, consider the following:

- **Scoped action**: Isolation targets specific devices involved in the incident rather than broadly throughout the environment.
- **Time-limited isolation**: Isolation is automatically undone after a defined time window. You can also release isolation earlier after completing investigation and remediation.
- **Customer control**: Security operators can review the incident context and take follow-up actions, including releasing isolation when it's safe to do so.

### Isolation exclusions and automatic attack disruption exclusions

There are two types of exclusions relevant to automatic device isolation:

- [Selective isolation exclusions](network-isolation-exclusions.md): Define which processes and network destinations remain accessible on an isolated device. Use these to preserve critical communications (for example, management tools or business applications) while the device is isolated. Selective isolation exclusions are available for devices running on Windows 11, Windows 10 version 1703 or later, Windows Server 2012 R2 and later, Azure Stack HCI OS, version 23H2 and later, and macOS.
- [Automatic attack disruption exclusions](/defender-xdr/automatic-attack-disruption-exclusions): Define which devices or entities are excluded from automatic disruption actions entirely. Use these to prevent business-critical devices from being isolated in the first place.

> [!NOTE]
> When an isolation exclusion rule is defined, automatic attack disruption uses selective isolation by default and isolates the device according to the configured isolation exclusion rules.

If an automatically isolated device is business-critical, prioritize rapid validation and stakeholder coordination. Release isolation only after you confirm appropriate containment and remediation steps are in place. Consider using [automatic attack disruption exclusions](/defender-xdr/automatic-attack-disruption-exclusions) to reduce the likelihood of isolating devices that can't tolerate interruption.

### Confirm automatic device isolation
To confirm that automatic device isolation was applied, follow these steps:

1. Open the relevant incident generated by automatic attack disruption in the [Microsoft Defender portal](https://security.microsoft.com).
1. Review the **Activity** tab or **Action center** to see which automated response actions were applied.
1. Open the affected device page and confirm that the device status shows that it's isolated.
    - If the isolation action shows as failed or pending, confirm that the device is online and can report to Defender for Endpoint. You can retry from the device action panel if available.
    - If a device appears isolated but you can't collect investigation data, verify that your investigation method (for example, live response) is supported for that device and scenario. Also confirm required service endpoints are reachable in your network configuration. For more information, see [Investigate entities on devices using live response](live-response.md) and [Configure device connectivity and proxy settings in Microsoft Defender for Endpoint](configure-device-connectivity.md).

### Release a device from automatic isolation

You can release the device from containment at any time after you mitigate the risk and complete investigation:

1. Select the device from the **Device inventory** or open the device page.
1. Select **Release from isolation** from the action menu.

For more information about releasing devices, see [Isolate devices from the network](#isolate-devices-from-the-network).

> [!NOTE]
> If isolation is removed unexpectedly, check whether a time-limited undo window applies in your environment and review the action history for the release event.

### Exclude devices from automatic device isolation

You can exclude specific devices from automatic device isolation by using policy applications and exclusions. Create a new device tag or use an existing tag, assign the tag to the devices you want to exclude, and configure the policy application to exclude the **Isolate device** action for that tag.

For detailed instructions, see [Policy applications and exclusions (Preview)](/defender-xdr/automatic-attack-disruption-exclusions#policy-applications-and-exclusions-preview).

:::image type="content" source="media/policy-application-isolate-device-exclusion.png" alt-text="Screenshot of the Configure exclusions step with the Isolate device action excluded." lightbox="media/policy-application-isolate-device-exclusion.png":::

When automatic attack disruption identifies an excluded device as compromised, the **Isolate device** action isn't performed. The action appears with a **Skipped** status in the Action center, and the device continues to operate normally.

:::image type="content" source="media/isolate-device-action-skipped.png" alt-text="Screenshot of a skipped Isolate device action in the Action center." lightbox="media/isolate-device-action-skipped.png":::

> [!IMPORTANT]
> If you're running a breach and attack simulation (BAS) or another security validation exercise, you might want to temporarily exclude the **Isolate device** action. This exclusion allows the simulated attack to proceed without automatically isolating the affected devices.

### Forcibly release device from isolation

The device isolation feature is an invaluable tool for safeguarding devices against external threats. However, there are instances when isolated devices become unresponsive.

There's a downloadable script for cases where isolated devices become unresponsive that you can run to forcibly release them from isolation. The script is available through a link on the device page in the Microsoft Defender portal.

> [!NOTE]
>
> - Admins and manage security settings in Security Center permissions can forcibly release devices from isolation.
> - The script is valid for the specific device only.
> - The script expires in three days.

To forcibly release device from isolation:

1. On the device page, select **Download script to force-release a device from isolation** from the action menu.

1. In the pane on the right, select **Download script**.

#### Minimum requirements for forcible device release

To forcibly release a device from isolation, the device must be running Windows. The following versions are supported:

- Windows 10 21H2 and 22H2 with KB5023773.
- Windows 11 version 21H2, all editions with KB5023774.
- Windows 11 version 22H2, all editions with KB5023778.

### Device user notification for isolation

When a device is being isolated, the following notification is displayed to inform the user that the device is being isolated from the network:

:::image type="content" source="media/atp-notification-isolate.png" alt-text="Screenshot of the no network connection message shown to the device user." lightbox="media/atp-notification-isolate.png":::

> [!NOTE]
> The notification isn't available on non-Windows platforms.

<a name="containing-critical-assets"></a>
## Contain critical assets

When a critical asset is compromised and used to spread threats, stopping the spread can be hard. These assets must keep running to avoid productivity loss. Defender for Endpoint contains the critical asset at a granular level. It stops the attack from spreading while keeping the asset running.

Through automatic attack disruption, Defender for Endpoint flags a malicious device and identifies its role. It then applies a matching policy to contain the critical asset. This containment blocks only specific ports and communication directions.

You can identify critical assets by the **critical asset** tag on the device or IP page. Device containment supports critical asset types like domain controllers, DNS servers, and DHCP servers.

## Contain devices from the network

When you find an unmanaged device that is compromised or might be compromised, you can contain it from the network. This prevents the attack from moving laterally. When you contain a device, all Defender for Endpoint onboarded devices block incoming and outgoing communication with that device. Containment helps protect nearby devices while the security analyst finds and fixes the threat.

> [!NOTE]
> Blocking incoming and outgoing communication with a 'contained' device is supported on onboarded Microsoft Defender for Endpoint Windows 10 and Windows Server 2019+ devices.

Once devices are contained, we recommend investigating and remediating the threat on the contained devices as soon as possible. After remediation, you should remove the devices from containment.

### How to contain a device

To contain a device from the Device inventory page, follow these steps:

1. Go to the **Device inventory** page and select the device to contain.

1. Select **Contain device** from the actions menu in the device flyout.

   :::image type="content" alt-text="Screenshot of the contain device popup message." source="/defender/media/defender-endpoint/contain_device.png" lightbox="/defender/media/defender-endpoint/contain_device.png":::

1. On the contain device popup, type a comment, and select **Confirm**.

   :::image type="content" alt-text="Screenshot of the contain device menu item." source="/defender/media/defender-endpoint/contain_device_popup.png" lightbox="/defender/media/defender-endpoint/contain_device_popup.png":::

> [!IMPORTANT]
> Containing a large number of devices might cause performance issues on Defender for Endpoint-onboarded devices. To prevent any issues, Microsoft recommends containing up to 100 devices at any given time.

### Contain a device from the device page

A device can also be contained from the device page by selecting **Contain device** from the action bar:

:::image type="content" alt-text="Screenshot of the contain device menu item on the device page." source="/defender/media/defender-endpoint/contain_device_page.png" lightbox="/defender/media/defender-endpoint/contain_device_page.png":::

> [!NOTE]
> It can take up to 5 minutes for the details about a newly contained device to reach Microsoft Defender for Endpoint onboarded devices.

> [!IMPORTANT]
>
> - If a contained device changes its IP address, all Microsoft Defender for Endpoint onboarded devices recognize this and start blocking communications with the new IP address. The original IP address is no longer blocked (It might take up to 5 minutes to see these changes).
> - In cases where the contained device's IP is used by another device on the network, a warning while containing the device with a link to advanced hunting (with a pre-populated query) is displayed. This provides visibility to other devices using the same IP to help you make a conscious decision if you'd like to continue containing the device.
> - In cases where the contained device is a network device, a warning appears with a message that containment can cause network connectivity issues (for example, containing a router that's acting as a default gateway). At this point, you're able to choose whether to contain the device or not.

After you contain a device, if the behavior isn't as expected, verify the Base Filtering Engine (BFE) service is enabled on the Defender for Endpoint onboarded devices.

### Stop containing a device

You can stop containing a device at any time.

1. Select the device from the **Device inventory** or open the device page.

1. Select **Release from containment** from the action menu. Releasing from containment restores the device's connection to the network.

## Contain IP addresses of undiscovered devices

> [!IMPORTANT]
> Some information in this article relates to prereleased product, which might be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

Defender for Endpoint can also contain IP addresses linked to devices that are undiscovered or not onboarded. Containing an IP address stops attackers from spreading attacks to other devices. When an IP address is contained, all onboarded devices block incoming and outgoing traffic with devices that use that IP address.

> [!NOTE]
> Blocking incoming and outgoing communication with a 'contained' device is supported on onboarded Defender for Endpoint Windows 10, Windows 11, Windows Server 2012 R2, and Windows Server 2016 devices.

Containing an IP address associated with undiscovered devices or devices not onboarded to Defender for Endpoint is done automatically through [automatic attack disruption](/defender-xdr/automatic-attack-disruption). The Contain IP policy automatically blocks a malicious IP address when Defender for Endpoint detects the IP address to be associated with an undiscovered device or a device not onboarded.

A message indicating that the action is applied appears on the applicable incident, device, or IP page. Here’s an example.

:::image type="content" source="/defender/media/defender-endpoint/contain-ip-attack-disrupt-small.png" alt-text="Screenshot that highlights a contained IP address in the incident graph." lightbox="/defender/media/defender-endpoint/contain-ip-attack-disrupt.png":::

After an IP address is contained, you can view the action in the History view of the Action center. You can see when the action occurred and identify the IP addresses that were contained.

:::image type="content" source="/defender/media/defender-endpoint/contain-ip-action-center-small.png" alt-text="Screenshot of the contained IP address in the Action center." lightbox="/defender/media/defender-endpoint/contain-ip-action-center.png":::

If a contained IP address is part of an incident, an indicator is present on the [incident graph](/defender-xdr/investigate-incidents#attack-story) and on the incident's [evidence and response](/defender-xdr/investigate-incidents#evidence-and-response) tab. Here’s an example.

:::image type="content" source="/defender/media/defender-endpoint/contain-ip-evidence-small.png" alt-text="Screenshot that highlights a contained IP address in the Evidence and response tab of an incident." lightbox="/defender/media/defender-endpoint/contain-ip-evidence.png":::

You can stop an IP address' containment at any time. To stop containment, select the **Contain IP** action in the **Action center**. In the flyout, select **Undo**. This action restores the IP address’ connection to the network.

<a name="contain-user-from-the-network"></a>
## Contain a user from the network

When an identity in your network might be compromised, you must prevent that identity from accessing the network and different endpoints. Defender for Endpoint can contain an identity, blocking it from access, and helping prevent attacks, specifically, ransomware. When an identity is contained, all supported Defender for Endpoint onboarded devices block incoming traffic in attack-related protocols (network logons, RPC, SMB, RDP). The devices also end ongoing remote sessions and log off existing RDP connections, including all related processes. Legitimate traffic continues to flow normally. Containing an identity can significantly help to reduce the impact of an attack. When an identity is contained, security operations analysts have extra time to locate, identify, and remediate the threat to the compromised identity. Once contained by automatic attack disruption, a user is automatically removed from containment in the next five days.

### Contain user important notes

- Defender for Endpoint enforces user containment at the endpoint layer and doesn't disable the account in the identity provider. Defender for Endpoint blocks attacker use of compromised identities on protected devices and limits authentication-based access, file system access, and network communication paths. This action applies controls at a granular level, so Microsoft can target attack-related activity and preserve normal business communication where possible.
- When the contain user action is triggered by [predictive shielding](/defender-xdr/shield-predict-threats) (Preview), the contain user action applies restrictions more selectively, with a focus on users identified as high risk through prediction logic. The contain user action in predictive shielding prevents new sessions rather than terminating existing ones.
- While the predictive shielding feature as a whole is in Preview, this action is generally available, both when triggered by attack disruption and predictive shielding.
- Blocking incoming communication with a "contained" user is supported on onboarded Microsoft Defender for Endpoint Windows 10 and 11 devices (Sense version 8740 and higher), Windows Server 2019+ devices, and Windows Servers 2012R2 and 2016 with the modern agent.
- **Important**: Once a **Contain user** action is enforced on a domain controller, it starts a GPO update on the Default Domain Controller policy. A change of a GPO starts a sync across the domain controllers in your environment.  This is expected behavior, and if you monitor your environment for AD GPO changes, you might be notified of such changes. Undoing the **Contain user** action reverts the GPO changes to their previous state, which will then start another AD GPO synchronization in your environment. Learn more about [merging of security policies on domain controllers](/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/jj966251(v=ws.11)#merging-of-security-policies-on-domain-controllers).

### How to contain a user

Currently, containing users is only available automatically by using automatic attack disruption. When Microsoft detects a user as being compromised a "Contain User" policy is automatically set.

### View the contain user actions

After a user is contained, you can view the action in the History view of the Action Center. In the Action Center History view, you can see when the action occurred and which users in your organization were contained:

:::image type="content" source="/defender/media/defender-endpoint/user-contain-action-center.png" alt-text="Screenshot of the user contain action in the Action center." lightbox="/defender/media/defender-endpoint/user-contain-action-center.png":::

Furthermore, after an identity is considered "contained", that user will be blocked by Defender for Endpoint and can't perform any malicious lateral movement or remote encryption on or to any supported Defender for Endpoint onboarded device. These blocks show up as alerts to help you quickly see the devices the compromised user attempted access and potential attack techniques:

:::image type="content" source="/defender/media/defender-endpoint/user-contain-lateral-move-block.png" alt-text="Screenshot of a user contain lateral movement block event." lightbox="/defender/media/defender-endpoint/user-contain-lateral-move-block.png":::

To view the current status of the contain user action and other actions, see [Track the action status in the Activities tab (Preview)](/defender-xdr/autoad-results#track-the-action-status-in-the-activities-tab-preview).

### Undo contain user actions

> [!TIP]
> Undoing contain user actions requires membership in the **Global Administrator**<sup>\*</sup> role in [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal).
>
> <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

You can release the blocks and containment on a user at any time:

1. Select the **Contain User** action in the **Action center**. In the side pane, select **Undo**.

1. Select the user from either the user inventory, Incident page side pane, or alert side pane and select **Undo**.

This action restores the user's connection to the network.

:::image type="content" source="/defender/media/defender-endpoint/undo-user-contain-action.png" alt-text="Screenshot of the user contain undo option in the Action center." lightbox="/defender/media/defender-endpoint/undo-user-contain-action.png":::

### Investigation capabilities with Contain User

After a user is contained, you can investigate the potential threat by viewing the blocked actions by the compromised user. In the device timeline view, you can see information about specific events, including protocol and interface granularity, and the relevant MITRE Technique associated it.

:::image type="content" source="/defender/media/defender-endpoint/event-blocked-by-contained-user.png" alt-text="Screenshot of blocked event details for a contained user." lightbox="/defender/media/defender-endpoint/event-blocked-by-contained-user.png":::

In addition, you can expand the investigation by using advanced hunting. Look for any action type starting with *contain* in the `DeviceEvents` table. Then, you can view all the different singular blocking events in relation to Contain User in your organization, dive deeper into the context of each block, and extract the different entities and techniques associated with those events.

:::image type="content" source="/defender/media/defender-endpoint/user-contain-advanced-hunting.png" alt-text="Screenshot of advanced hunting for user contain events." lightbox="/defender/media/defender-endpoint/user-contain-advanced-hunting.png":::

<a id="gpo-hardening-preview"></a>

## GPO hardening - predictive shielding (Preview)

The [predictive shielding](/defender-xdr/shield-predict-threats) (Preview) feature lets Defender for Endpoint apply the GPO hardening action. GPO hardening temporarily blocks new Group Policy Object policies on high-risk devices. This helps prevent compromise by limiting changes to key settings.

To get better results from predictive shielding, use the Microsoft Defender for Identity sensor. For more information, see [Enrich predictive shielding with Microsoft Defender for Identity](/defender-xdr/shield-predict-threats-manage#enrich-predictive-shielding-data).

After the action is applied, you can view its impact in the incident graph, track it in the Action center, and investigate with advanced hunting. For more information, see [Manage predictive shielding actions](/defender-xdr/shield-predict-threats-manage).

<a id="safeboot-hardening-preview"></a>

## Safeboot hardening - predictive shielding (Preview)

As part of the [predictive shielding](/defender-xdr/shield-predict-threats) (Preview) feature, Defender for Endpoint automatically applies the Safeboot hardening action. Safeboot hardening helps protect devices from being compromised by enforcing stricter boot settings on devices that are predicted to be at high risk of compromise.

To enrich predictive shielding actions, we recommend you use the Microsoft Defender for Identity sensor in your environment. For more information, see [Enrich predictive shielding with Microsoft Defender for Identity](/defender-xdr/shield-predict-threats-manage#enrich-predictive-shielding-data).

After the action is applied, you can view the action impact in the incident graph, track the actions in the Action center, and investigate further using advanced hunting. For more information, see [Manage predictive shielding actions](/defender-xdr/shield-predict-threats-manage).

To view the current status of the Safeboot hardening action and other actions, see [Track the action status in the Activities tab (Preview)](/defender-xdr/autoad-results#track-the-action-status-in-the-activities-tab-preview).

## Consult a threat expert

You can consult a Microsoft threat expert for more insights about a compromised or potentially compromised device. Microsoft Threat Experts work with you directly from the Defender portal for a timely and accurate response. Experts help you understand complex threats, targeted attack alerts, and threat intelligence shown on your portal dashboard.

See [Configure and manage Endpoint Attack Notifications](configure-microsoft-threat-experts.md) for details.

## Check activity details and status

The Action center ([https://security.microsoft.com/action-center](https://security.microsoft.com/action-center)) provides information on actions that were taken on a device or file. You can view the following details:

- Investigation package collection
- Antivirus scan
- App restriction
- Device isolation

All other related details are also shown, for example, submission date/time, submitting user, and if the action succeeded or failed.

:::image type="content" source="media/action-center-details.png" alt-text="Screenshot of the Action center with action details." lightbox="media/action-center-details.png":::

The **Activities** tab in the **Incident** page shows the details and status of actions that were taken as part of the incident response. For more information, see [Track the action status in the Activities tab (Preview)](/defender-xdr/autoad-results#track-the-action-status-in-the-activities-tab-preview).

## Related content

- [Take response actions on a file](respond-file-alerts.md)
- [Manual response actions in Microsoft Defender for Endpoint Plan 1](defender-endpoint-plan-1.md#manual-response-actions)
- [Report inaccuracy](/defender-vulnerability-management/tvm-security-recommendation#report-inaccuracy)
