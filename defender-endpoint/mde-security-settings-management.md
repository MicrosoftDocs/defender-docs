---
title: Manage Microsoft Defender Antivirus by using Defender for Endpoint Security Settings Management
description: Learn how to use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus
author: emmwalshh
ms.author: ewalsh
ms.reviewer: yongrhee
manager: deniseb
ms.service: defender-endpoint
ms.subservice: ngp
ms.topic: how-to
ms.date: 07/22/2024
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
ms.localizationpriority: medium
ms.custom: 
- nextgen
- partner-contribution
---

# Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus

**Applies to:**

- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 1](defender-endpoint-plan-1.md)

**Platforms**

- Windows
- Windows Server
- macOS
- Linux

Use the Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus security policies on devices. 

### Pre-requisites:

Please review the pre-requisites [here](/mem/intune/protect/mde-security-integration). 

> [!NOTE]
> The **Endpoint Security Policies** page in  the Microsoft Defender portal is available only for [users with the Security Administrator role assigned](assign-portal-access.md). Any other user role, such as Security Reader, cannot access the portal. When a user has the required permissions to view policies in the Microsoft Defender portal, the data is presented based on Intune permissions. If the user is in scope for Intune role-based access control, it applies to the list of policies presented in the Microsoft Defender portal. We recommend granting security administrators with the [Intune built-in role, "Endpoint Security Manager"](/mem/intune/fundamentals/role-based-access-control#built-in-roles) to effectively align the level of permissions between Intune and  the Microsoft Defender portal.

As a security administrator, you can configure different Microsoft Defender Antivirus security policy settings in the [Microsoft Defender portal](https://security.microsoft.com).

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

You'll find endpoint security policies under **Endpoints** > **Configuration management** > **Endpoint security policies**.

:::image type="content" source="./media/endpoint-security-policies.png" alt-text="Managing Endpoint security policies in the Microsoft Defender portal":::

The following list provides a brief description of each endpoint security policy type:

- **Antivirus** - Antivirus policies help security admins focus on managing the discrete group of antivirus settings for managed devices. 

- **Disk encryption** - Endpoint security disk encryption profiles focus on only the settings that are relevant for a devices built-in encryption method, like FileVault or BitLocker. This focus makes it easy for security admins to manage disk encryption settings without having to navigate a host of unrelated settings.

- **Firewall** - Use the endpoint security Firewall policy in Intune to configure a devices built-in firewall for devices that run macOS and Windows 10/11.

- **Endpoint detection and response** - When you integrate Microsoft Defender for Endpoint with Intune, use the endpoint security policies for endpoint detection and response (EDR) to manage the EDR settings and onboard devices to Microsoft Defender for Endpoint.

- **Attack surface reduction** - When Microsoft Defender Antivirus is in use on your Windows 10/11 devices, use Intune endpoint security policies for attack surface reduction to manage those settings for your devices.

## Create an endpoint security policy

1. Sign in to the <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a> using at least a Security Administrator role.

2. Select **Endpoints** > **Configuration management** > **Endpoint security policies** and then select **Create new Policy**. 

3. Select a platform from the dropdown list.

4. Select a template, then select **Create policy**.

5. On the **Basics** page, enter a name and description for the profile, then choose **Next**.

6. On the **Settings** page, expand each group of settings, and configure the settings you want to manage with this profile.

   When you're done configuring settings, select **Next**.

7. On the **Assignments** page, select the groups that will receive this profile. 

   Select **Next**.

8. On the **Review + create** page, when you're done, select **Save**. The new profile is displayed in the list when you select the policy type for the profile you created.

> [!NOTE]
> To edit the scope tags, you'll need to go to the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431).

## To edit an endpoint security policy

1. Select the new policy, and then select **Edit**.
 
2. Select **Settings** to expand a list of the configuration settings in the policy. You can't modify the settings from this view, but you can review how they're configured.

3. To modify the policy, select **Edit** for each category where you want to make a change:
   - Basics
   - Settings
   - Assignments

4. After you've made changes, select **Save** to save your edits.  Edits to one category must be saved before you can introduce edits to additional categories.

## Verify endpoint security policies

To verify that you have successfully created a policy, select a policy name from the list of endpoint security policies.

> [!NOTE]
> It can take up to 90 minutes for a policy to reach a device. To expedite the process, for devices Managed by Defender for Endpoint, you can select **Policy sync** from the actions menu so that it is applied in approximately 10 minutes.
> :::image type="content" source="./media/policy-sync.png" alt-text="Image showing policy sync button":::

The policy page displays details that summarize the status of the policy. You can view a policy's status, which devices it has been applied to, and assigned groups.

During an investigation, you can also view the **Security policies** tab in the device page to view the list of policies that are being applied to a particular device. For more information, see [Investigating devices](investigate-machines.md#security-policies).


:::image type="content" source="./media/security-policies-list.png" alt-text="Security policies tab with list of policies":::

## Antivirus policies for Windows and Windows Server

1. **Real-time Protection (Always-on protection, real-time scanning)**:

   |Description|Settings|
   |---|---|
   |Allow Realtime Monitoring|Allowed|
   |Real Time Scan Direction|Monitor all files (bi-directional)|
   |Allow Behavior Monitoring|Allowed|
   |Allow On Access Protection|Allowed|
   |PUA Protection|PUA Protection on|
   
For more information, see:

[Advanced technologies at the core of Microsoft Defender Antivirus](/defender-endpoint/adv-tech-of-mdav)

[Enable and configure Microsoft Defender Antivirus always-on protection](/defender-endpoint/configure-real-time-protection-microsoft-defender-antivirus)

[Behavior monitoring in Microsoft Defender Antivirus](/defender-endpoint/behavior-monitor)

[Detect and block potentially unwanted applications](/defender-endpoint/detect-block-potentially-unwanted-apps-microsoft-defender-antivirus)

1. **Cloud protection features**:

|Description|Setting|
|---|---|
|Allow Cloud Protection|Allowed|
|Cloud Block Level|High|
|Cloud Extended Timeout|Configured, 50|
|Submit Samples Consent|Send all samples automatically|

Standard security intelligence updates can take hours to prepare and deliver; our cloud-delivered protection service can deliver this protection in seconds. For more information, see [Use next-gen technologies in Microsoft Defender Antivirus through cloud-delivered protection](cloud-protection-microsoft-defender-antivirus.md).

**Scans**:

|Description|Setting|
|---|---|
|Allow Email Scanning|Allowed|
|Allow scanning of all downloaded files and attachments|Allowed|
|Allow Script Scanning|Allowed|
|Allow Archive Scanning|Allowed|
|Allow Scanning Network Files|Allowed|
|Allow Full Scan Removable Drive Scanning |Allowed|
|Allow Full Scan On Mapped Network Drives |Not Allowed|

For more information, see:

[Configure Microsoft Defender Antivirus scanning options](/defender-endpoint/configure-advanced-scan-types-microsoft-defender-antivirus)

**Security Intelligence updates**:

|Description|Setting|
|---|---|
|Signature Update Interval|Configured, 4|
|Signature Update Fallback Order| 'InternalDefinitionUpdateServer, MicrosoftUpdateServer, MMPC'|
|Signature Update File Shares Sources | a |
| Metered Connection Updates | a |
| Security Intelligence Updates Channel | a |

> [!NOTE]
> Where 'InternalDefinitionUpdateServer' is WSUS with Microsoft Defender Antivirus updates allowed.
> 'MicrosoftUpdateServer' is Microsoft Update (formerly Windows Update).
> 'MMPC' is Microsoft Defender security intelligence center (WDSI formerly Microsoft Malware Protection Center) https://www.microsoft.com/en-us/wdsi/definitions.

**Engine updates**

|Description|Setting|
|---|---|
| Engine Updates Channel | a |

**Platform updates**

|Description|Setting|
|---|---|
| Platform Updates Channel | a |

**Scheduled scan and On-Demand scan**

***General settings for Scheduled scan and On-Demand scan***

|Description|Setting|
|---|---|
| Check For Signatures Before Running Scan | a |
| Randomize Schedule Task Times | a |
| Scheduler Randomization Time | a |
| Avg CPU Load Factor | a |
| Enable Low CPU Priority | a |
| Disable Catchup Full Scan | a |
| Disable Catchup Quick Scan | a |
| Archive Max Depth | a |
| Archive Max Size | a |

*** Daily or Hourly Quick Scan ***

|Description|Setting|
|---|---|
| Schedule Quick Scan Time | a |

*** Weekly Quick Scan or Full Scan ***

|Description|Setting|
|---|---|
| Scan Parameter | a |
| Schedule Scan Day | a |
| Schedule Scan Time | a |


**Local administrator AV**:

Disable local administrator AV settings such as exclusions, and set the policies from the Microsoft Defender for Endpoint Security Settings Management as described in the following table:

|Description|Setting|
|---|---|
|Disable Local Admin Merge|Disable Local Admin Merge| a |

**Threat severity default action**:

|Description|Setting|
|---|---|
|Remediation action for High severity threats|Quarantine|
|Remediation action for Severe threats|Quarantine|
|Remediation action for Low severity threats|Quarantine|
|Remediation action for Moderate severity threats|Quarantine|

|Description|Setting|
|---|---|
|Days To Retain Cleaned Malware|Configured, 60|
|Allow User UI Access|Allowed.  Let users access UI.|

** Antivirus exclusions **

|Description|Setting|
|---|---|
|Excluded Extensions | a |
|Excluded Paths | a |
|Excluded Processes | a |

** Microsoft Defender Core service **

|Description|Setting|
|---|---|
| Disable Core Service ECS Integration | a |
| Disable Core Service Telemetry | a |

**Network Protection**:

|Description|Setting|
|---|---|
|Enable Network Protection|Enabled (block mode)|
|Allow Network Protection Down Level|Network protection is enabled downlevel.|
|Allow Datagram Processing On Win Server|Datagram processing on Windows Server is enabled.|
|Disable DNS over TCP parsing|DNS over TCP parsing is enabled.|
|Disable HTTP parsing|HTTP parsing is enabled.|
|Disable SSH parsing|SSH parsing is enabled.|
|Disable TLS parsing|TLS parsing is enabled.|
|Enable DNS Sinkhole|DNS Sinkhole is enabled.|

1. When you're done configuring settings, select **Next**.
1. On the **Assignments** tab, select **Device Group** or **User Group** or **All devices** or **All Users**. 
1. Select **Next**.
1. On the **Review + create** tab, review your policy settings, and then select **Save**.

### Attack Surface Reduction rules

To enable Attack Surface Reduction (ASR) rules using the endpoint security policies, perform the following steps:

1. Sign in to [Microsoft Defender XDR](https://sip.security.microsoft.com/).
1. Go to **Endpoints > Configuration management > Endpoint security policies > Windows policies > Create new policy**.
1. Select **Windows 10, Windows 11, and Windows Server** from the **Select Platform** drop-down list.
1. Select **Attack Surface Reduction Rules** from the **Select Template** drop-down list.
1. Select **Create policy**.
1. On the **Basics** page, enter a name and description for the profile; then, choose **Next**.
1. On the **Configuration settings** page, expand the groups of settings and configure those settings you want to manage with this profile.
1. Set the policies based on the following recommended settings:

   |Description|Setting|
   |---|---|
   |Block executable content from email client and webmail|Block|
   |Block Adobe Reader from creating child processes|Block|
   |Block execution of potentially obfuscated scripts|Block|
   |Block abuse of exploited vulnerable signed drivers (Device)|Block|
   |Block Win32 API calls from Office macros|Block|
   |Block executable files from running unless they meet a prevalence, age, or trusted list criterion|Block|
   |Block Office communication application from creating child processes|Block|
   |Block all Office applications from creating child processes|Block|
   |[PREVIEW] Block use of copied or impersonated system tools|Block|
   |Block JavaScript or VBScript from launching downloaded executable content|Block|
   |Block credential stealing from the Windows local security authority subsystem|Block|
   |Block Web shell creation for Servers|Block|
   |Block Office applications from creating executable content|Block|
   |Block untrusted and unsigned processes that run from USB|Block|
   |Block Office applications from injecting code into other processes|Block|
   |Block persistence through WMI event subscription|Block|
   |Use advanced protection against ransomware|Block|
   |Block process creations originating from PSExec and WMI commands|Block (If you have Configuration Manager (formerly SCCM), or other management tools that use WMI you might need to set this to **Audit** instead of **Block**)|
   |[PREVIEW] Block rebooting machine in Safe Mode|Block|
   |Enable Controlled Folder Access|Enabled|

> [!TIP]
> Any of the rules might block behavior you find acceptable in your organization. In these cases, add the per-rule exclusions named "Attack Surface Reduction Only Exclusions." Additionally, change the rule from **Enabled** to **Audit** to prevent unwanted blocks.

1. Select **Next**.
1. On the **Assignments** tab, select **Device Group** or **User Group** or **All devices** or **All Users**.
1. Select **Next**.
1. On the **Review + create** tab, review your policy settings, and then select **Save**.


#### Enable Tamper Protection

1. Sign in to [Microsoft Defender XDR](https://sip.security.microsoft.com/).
1. Go to **Endpoints > Configuration management > Endpoint security policies > Windows policies > Create new policy**.
1. Select **Windows 10, Windows 11, and Windows Server** from the **Select Platform** drop-down list.
1. Select **Security Experience** from the **Select Template** drop-down list.
1. Select **Create policy**. The **Create a new policy** page appears.
1. On the **Basics** page, enter a name and description for the profile in the **Name** and **Description** fields, respectively.
1. Select **Next**.
1. On the **Configuration settings** page, expand the groups of settings.
1. From these groups, select the settings that you want to manage with this profile.
1. Set the policies for the chosen groups of settings by configuring them as described in the following table:

   |Description| Setting|
   | -------- | -------- |
   | TamperProtection (Device) | On|

#### Check the Cloud Protection network connectivity

It's important to check that the Cloud Protection network connectivity is working during your penetration testing.

CMD (Run as admin)


```powershell
cd "C:\Program Files\Windows Defender"
MpCmdRun.exe -ValidateMapsConnection
```

For more information [Use the cmdline tool to validate cloud-delivered protection](/defender-endpoint/configure-network-connections-microsoft-defender-antivirus).

#### Check the platform update version

The latest "Platform Update" version Production channel (GA) is available in [Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4052623+update).

To check which "Platform Update" version you have installed, run the following command in PowerShell using the privileges of an administrator:

```powershell
Get-MPComputerStatus | Format-Table AMProductVersion
```

#### Check the Security Intelligence Update version

The latest "Security Intelligence Update" version is available in [Latest security intelligence updates for Microsoft Defender Antivirus and other Microsoft anti-malware - Microsoft Security Intelligence](https://www.microsoft.com/wdsi/defenderupdates).

To check which "Security Intelligence Update" version you have installed, run the following command in PowerShell using the privileges of an administrator:

```powershell
Get-MPComputerStatus | Format-Table AntivirusSignatureVersion
```

#### Check the Engine Update version

The latest scan "engine update" version is available in [Latest security intelligence updates for Microsoft Defender Antivirus and other Microsoft anti-malware - Microsoft Security Intelligence](https://www.microsoft.com/wdsi/defenderupdates).

To check which "Engine Update" version you have installed, run the following command in PowerShell using the privileges of an administrator:

```powershell
Get-MPComputerStatus | Format-Table AMEngineVersion
```

If yo find that your settings aren't taking effect, you might have a conflict. For information on how to resolve conflicts, see [Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md).

#### For False Negatives (FNs) submissions

To information on how to make False Negatives (FNs) submissions, see:

- [Submit files in Microsoft Defender for Endpoint](admin-submissions-mde.md) if you have Microsoft XDR, Microsoft Defender for Endpoint P2/P1, or Microsoft Defender for Business.
- [Submit files for analysis](/unified-secops-platform/submission-guide) if you have Microsoft Defender Antivirus.
