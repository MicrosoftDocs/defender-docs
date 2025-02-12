---
title: Evaluate Microsoft Defender Antivirus using Microsoft Defender Endpoint Security Settings Management (Endpoint security policies)
ms.reviewer: yonghree
description: Learn how to evaluate Microsoft Defender Antivirus using Microsoft Defender Endpoint Security Settings Management (Endpoint security policies).
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.localizationpriority: medium
manager: dolmont
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: conceptual
ms.custom: 
- cx-ti
- cx-ean
ms.subservice: edr
search.appverid: met150
ms.date: 02/12/2025
---

# Evaluate Microsoft Defender Antivirus using Microsoft Defender Endpoint Security Settings Management (Endpoint security policies)

In Windows 10 or later, and in Windows Server 2016 or later, you can use next-generation protection features offered by Microsoft Defender Antivirus (MDAV) and Microsoft Defender Exploit Guard (Microsoft Defender EG).

This article outlines the configuration options available in Windows 10 and later versions, as well as in Windows Server 2016 and later versions. It provides step-by-step guidance on how to activate and test the key protection features in Microsoft Defender Antivirus (MDAV) and Microsoft Defender for Endpoint (EG).

If you have any questions about a detection that MDAV makes, or you discover a missed detection, you can submit a file to us at our [sample submission help site](/defender-xdr/submission-guide).

## Use Microsoft Defender Endpoint Security Settings Management (Endpoint security policies) to enable the features

This section describes the [Microsoft Defender for Endpoint Security Settings Management (Endpoint security policies)](/mem/intune/protect/mde-security-integration) that configure the features you should use to evaluate our protection.

MDAV indicates a detection through [standard Windows notifications](configure-notifications-microsoft-defender-antivirus.md). You can also review detections in the MDAV app. To do this, see [Review Microsoft Defender Antivirus scan results](review-scan-results-microsoft-defender-antivirus.md).

The Windows event log also records detection and engine events. See the Microsoft Defender Antivirus events article for a list of event IDs and their corresponding actions. For information on the list of event IDs and their corresponding actions, see [Review event logs and error codes to troubleshoot issues with Microsoft Defender Antivirus](troubleshoot-microsoft-defender-antivirus.yml).

To configure the options that you must use to test the protection features, perform the following steps:

1. Sign in to [Microsoft Defender XDR](https://sip.security.microsoft.com/).
1. Go to **Endpoints > Configuration management > Endpoint security policies > Windows policies > Create new policy**.
1. Select **Windows 10, Windows 11, and Windows Server** from the **Select Platform** drop-down list.
1. Select **Microsoft Defender Antivirus** from the **Select Template** drop-down list.
1. Select **Create policy**. The **Create a new policy** page appears.
1. On the **Basics** page, enter a name and description for the profile in the **Name** and **Description** fields, respectively.
1. Select **Next**.
1. On the **Configuration settings** page, expand the groups of settings.
1. From these groups of settings, select those settings that you want to manage with this profile.
1. Set the policies for the chosen groups of settings by configuring the settings as described in the following tables:

   **Real-time Protection (Always-on protection, real-time scanning)**:

   |Description|Settings|
   |---|---|
   |Allow Real-time Monitoring|Allowed|
   |Real Time Scan Direction|Monitor all files (bi-directional)|
   |Allow Behavior Monitoring|Allowed|
   |Allow On Access Protection|Allowed|
   |PUA Protection|PUA Protection on|

   **Cloud protection features**:

   |Description|Setting|
   |---|---|
   |Allow Cloud Protection|Allowed|
   |Cloud Block Level|High|
   |Cloud Extended Time-out|Configured, 50|
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
|Allow Full Scan Removable Drive Scanning|Allowed|

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

**Security Intelligence updates**:

|Description|Setting|
|---|---|
|Signature Update Interval|Configured, 4|

**Description**: Signature Update Fallback Order
**Setting**: Select the checkbox for **Signature Update Fallback**

InternalDefinitionUpdateServer|MicrosoftUpdateServer|MMPC, where 'InternalDefinitionUpdateServer' is WSUS with Microsoft Defender Antivirus updates allowed; 'MicrosoftUpdateServer' = Microsoft Update (formerly Windows Update); and MMPC = https://www.microsoft.com/en-us/wdsi/definitions.

**Local administrator AV**:

Disable local administrator AV settings such as exclusions, and set the policies from the Microsoft Defender for Endpoint Security Settings Management as described in the following table:

|Description|Setting|
|---|---|
|Disable Local Admin Merge|Disable Local Admin Merge|

**Threat severity default action**:

|Description|Setting|
|---|---|
|Remediation action for High severity threats|Quarantine|
|Remediation action for Severe threats|Quarantine|
|Remediation action for Low severity threats|Quarantine|
|Remediation action for Moderate severity threats|Quarantine|

|Description|Setting|
|---|---|
|Days to Retain Cleaned|Configured, 60|
|Allow User UI Access|Allowed.  Let users access UI.|

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
2. On the **Assignments** tab, select **Device Group** or **User Group** or **All devices** or **All Users**.
3. Select **Next**.
4. On the **Review + create** tab, review your policy settings, and then select **Save**.

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
- [Submit files for analysis](/defender-xdr/submission-guide) if you have Microsoft Defender Antivirus.
