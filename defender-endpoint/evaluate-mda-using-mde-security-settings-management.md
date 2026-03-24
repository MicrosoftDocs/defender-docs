---
title: Evaluate Microsoft Defender Antivirus using Microsoft Defender Endpoint Security Settings Management (Endpoint security policies)
ms.reviewer: yonghree
description: Learn how to evaluate Microsoft Defender Antivirus using Microsoft Defender Endpoint Security Settings Management (Endpoint security policies).
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: how-to
ms.subservice: edr
search.appverid: met150
ms.date: 02/12/2025
---

# Evaluate Microsoft Defender Antivirus using Microsoft Defender Endpoint Security Settings Management (Endpoint security policies)

In Windows 10 or later, and in Windows Server 2016 or later, you can use next-generation protection features offered by Microsoft Defender Antivirus (MDAV) and Microsoft Defender Exploit Guard (Microsoft Defender EG).

This article outlines the configuration options available in Windows 10 and later versions, as well as in Windows Server 2016 and later versions. It provides step-by-step guidance on how to activate and test the key protection features in Microsoft Defender Antivirus (MDAV) and Microsoft Defender for Endpoint (EG).

If you have any questions about a detection that MDAV makes, or you discover a missed detection, you can submit a file to us at our [sample submission help site](/unified-secops-platform/submission-guide).

## Use Microsoft Defender Endpoint Security Settings Management (Endpoint security policies) to enable the features

This section describes the [Microsoft Defender for Endpoint Security Settings Management (Endpoint security policies)](/intune/intune-service/protect/mde-security-integration) that configure the features you should use to evaluate our protection.

MDAV indicates a detection through [standard Windows notifications](configure-notifications-microsoft-defender-antivirus.md). You can also review detections in the MDAV app. To do this, see [Review Microsoft Defender Antivirus scan results](review-scan-results-microsoft-defender-antivirus.md).

The Windows event log also records detection and engine events. See the Microsoft Defender Antivirus events article for a list of event IDs and their corresponding actions. For information on the list of event IDs and their corresponding actions, see [Review event logs and error codes to troubleshoot issues with Microsoft Defender Antivirus](troubleshoot-microsoft-defender-antivirus.yml).

To configure the options that you must use to test the protection features, do the following steps:

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Endpoints** \> **Configuration management** \> **Endpoint security policies**. Or, to go directly to the **Endpoint security policies** page, use <https://security.microsoft.com/policy-inventory> Windows policies.
1. On the **Endpoint security policies** page, verify the **Windows policies** tab is selected, and then select **Create new policy**
1. On the **Create a new policy flyout** that opens, configure the following settings:
   - **Select a platform**: Select **Windows**.
   - **Select template**: Select **Microsoft Defender Antivirus**.

   Select **Create policy**.

1. The create a new policy wizard opens. On the **Basics** page, configure the following settings:
   - **Name**: Enter a unique name for the policy.
   - **Description**: Enter an optional description.

   Select **Next**

1. On the **Configuration settings** page, configure the settings in the **Defender** section as described in the following tables:

   - **Real-time Protection**:

     |Setting|Value|
     |---|---|
     |Allow Realtime Monitoring|Allowed. Turns on and runs the real-time monitoring service. (Default)|
     |Real Time Scan Direction|Monitor all files (bi-directional). (Default)|
     |Allow Behavior Monitoring|Allowed. Turns on real-time behavior monitoring (Default).|
     |Allow On Access Protection|Allowed. (Default)|
     |PUA Protection|PUA Protection on. Detected items are blocked. They will show in history along with other threats.|

   - **Cloud protection features**:

     |Setting|Value|
     |---|---|
     |Allow Cloud Protection|Allowed. Turns on Cloud Protection. (Default)|
     |Cloud Block Level|High|
     |Cloud Extended Time-out|Configured, 50|
     |Submit Samples Consent|Send all samples automatically|

     Standard security intelligence updates can take hours to prepare and deliver. Our cloud-delivered protection service can deliver this protection in seconds. For more information, see [Use next-gen technologies in Microsoft Defender Antivirus through cloud-delivered protection](cloud-protection-microsoft-defender-antivirus.md).

   - **Scans**:

     |Setting|Value|
     |---|---|
     |Allow Email Scanning|Allowed. Turns on email scanning.|
     |Allow scanning of all downloaded files and attachments|Allowed. (Default)|
     |Allow Script Scanning|Allowed. (Default)|
     |Allow Archive Scanning|Allowed. Scans the archive files. (Default)|
     |Allow Scanning Network Files|Allowed. Scans network files. (Default)|
     |Allow Full Scan Removable Drive Scanning|Allowed. Scans removable drives.|

   - **Network Protection**:

     |Setting|Value|
     |---|---|
     |Enable Network Protection|Enabled (block mode)|
     |Allow Network Protection Down Level|Network protection will be enabled downlevel.|
     |Allow Datagram Processing On Win Server|Datagram processing on Windows Server is enabled.|
     |Disable DNS over TCP parsing|DNS over TCP parsing is enabled (Default)|
     |Disable HTTP parsing|HTTP parsing is enabled (Default)|
     |Disable SSH parsing|SSH parsing is enabled (Default)|
     |Disable TLS parsing|parsing is enabled (Default)|

   - **Security Intelligence updates**:

     |Setting|Value|
     |---|---|
     |Signature Update Interval|Configured, 4|
     |Signature Update Fallback Order|<ol><li>Select **Add** for as many fallback sources as you want to specify.</li><li>Enter one of the following values in each box in the order you want: <ul><li>`InternalDefinitionUpdateServer`: Your own WSUS server with Microsoft Defender Antivirus updates allowed.</li><li>`MicrosoftUpdateServer`: Microsoft Update.</li><li>`MMPC`: `https://www.microsoft.com/wdsi/definitions`</li></ul></li></ol> </br> To remove a fallback source (populated or empty), select the check box next to the box, and then select **Remove**.|

   - **Local administrator AV**:

     Disable local administrator AV settings such as exclusions, and set the policies from the Microsoft Defender for Endpoint Security Settings Management as described in the following table:

     |Setting|Value|
     |---|---|
     |Disable Local Admin Merge|Disable Local Admin Merge|

   - **Threat severity default action**:

     |Setting|Value|
     |---|---|
     |Remediation action for High severity threats|Quarantine. Move files to quarantine.|
     |Remediation action for Severe threats|Quarantine. Move files to quarantine.|
     |Remediation action for Low severity threats|Quarantine. Move files to quarantine.|
     |Remediation action for Moderate severity threats|Quarantine. Move files to quarantine.|

   - **Quarantine options**

     |Setting|Value|
     |---|---|
     |Days to Retain Cleaned Malware|Configured, 60|
     |Allow User UI Access|Allowed. Let users access UI. (Default)|

   When you're finished on the **Configuration settings** page, select **Next**.

1. On the **Assignments** page, click in the box and select from the following values:
   - **All users** or **All devices**.
   - When you find and select one or more available groups, you can use the **Target type** value on the group entry to to **Include** or **Exclude** the group members.

   When you're finished on the **Assignments** page, select **Next**.

1. On the **Review + create** page, review your settings. Select **Back** or select the page name to make changes.

   When you're finished on the **Review + create** page, select **Save**.

When the policy creation is complete, you're taken to the details page of the new policy.

Select **Endpoint security policies** at the top of the page to return to the **Endpoint security policies** page where the new policy is listed with the **Policy type** value **Microsoft Defender Antivirus**.

### Attack Surface Reduction rules

To enable Attack Surface Reduction (ASR) rules using the endpoint security policies, do the following steps:

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Endpoints** \> **Configuration management** \> **Endpoint security policies**. Or, to go directly to the **Endpoint security policies** page, use <https://security.microsoft.com/policy-inventory> Windows policies.
1. On the **Endpoint security policies** page, verify the **Windows policies** tab is selected, and then select **Create new policy**
1. On the **Create a new policy flyout** that opens, configure the following settings:
   - **Select a platform**: Select **Windows**.
   - **Select template**: Select **Attack Surface Reduction Rules**.

   Select **Create policy**

1. The create a new policy wizard opens. On the **Basics** page, configure the following settings:
   - **Name**: Enter a unique name for the policy.
   - **Description**: Enter an optional description.

   Select **Next**

1. On the **Configuration settings** page, configure the settings based on the following recommendations:

   |Setting|Value|
   |---|---|
   |Block executable content from email client and webmail|Block|
   |Block Adobe Reader from creating child processes|Block|
   |Block execution of potentially obfuscated scripts|Block|
   |Block abuse of exploited vulnerable signed drivers (Device)|Block|
   |Block Win32 API calls from Office macros|Block|
   |Block executable files from running unless they meet a prevalence, age, or trusted list criterion|Block|
   |Block Office communication application from creating child processes|Block|
   |Block all Office applications from creating child processes|Block|
   |Block use of copied or impersonated system tools|Block|
   |Block JavaScript or VBScript from launching downloaded executable content|Block|
   |Block credential stealing from the Windows local security authority subsystem|Block|
   |Block Webshell creation for Servers|Block|
   |Block Office applications from creating executable content|Block|
   |Block untrusted and unsigned processes that run from USB|Block|
   |Block Office applications from injecting code into other processes|Block|
   |Block persistence through WMI event subscription|Block|
   |Use advanced protection against ransomware|Block|
   |Block process creations originating from PSExec and WMI commands|Block (If you have Configuration Manager (formerly SCCM), or other management tools that use WMI you might need to set this to **Audit** instead of **Block**)|
   |Block rebooting machine in Safe Mode|Block|
   |Enable Controlled Folder Access|Enabled|

> [!TIP]
> Any of the rules might block behavior you find acceptable in your organization. In these cases, add the per-rule exclusions named "Attack Surface Reduction Only Exclusions." Additionally, change the rule from **Enabled** to **Audit** to prevent unwanted blocks.

1. On the **Assignments** page, click in the box and select from the following values:
   - **All users** or **All devices**.
   - When you find and select one or more available groups, you can use the **Target type** value on the group entry to to **Include** or **Exclude** the group members.

   When you're finished on the **Assignments** page, select **Next**.

1. On the **Review + create** page, review your settings. Select **Back** or select the page name to make changes.

   When you're finished on the **Review + create** page, select **Save**.

When the policy creation is complete, you're taken to the details page of the new policy.

Select **Endpoint security policies** at the top of the page to return to the **Endpoint security policies** page where the new policy is listed with the **Policy type** value **Attack Surface Reduction Rules**.

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

For more information [Use the cmdline tool to validate cloud-delivered protection](configure-network-connections-microsoft-defender-antivirus.md).

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
