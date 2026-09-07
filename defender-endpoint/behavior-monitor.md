---
title: Behavior monitoring in Microsoft Defender Antivirus
description: Learn how Microsoft Defender Antivirus behavior monitoring detects threats, how to configure and verify it, and how to troubleshoot performance.
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.topic: overview
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
ms.date: 08/13/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender for Individuals
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015
#customer intent: As an administrator, I want to understand and manage behavior monitoring so that Microsoft Defender Antivirus can detect suspicious activity while maintaining device performance.
---

# Behavior monitoring in Microsoft Defender Antivirus

Behavior monitoring is a critical Microsoft Defender Antivirus detection and protection capability. It observes process, file, and service activity in real time and detects threats from suspicious behavior, including threats that don't match known malware signatures.

## How behavior monitoring works

Behavior monitoring uses these approaches to identify and stop suspicious activity:

- **Real-time threat detection**: Continuously observes processes, file system activity, and interactions on the device. For example, Microsoft Defender Antivirus can detect unusual file changes or attempts to create or modify autostart extensibility point (ASEP) registry keys.
- **Dynamic analysis**: Uses known behavior patterns and anomaly detection to identify new and evolving threats while software runs.
- **Response and remediation**: Takes action when a program behaves suspiciously, such as attempting to modify critical system files.

Behavior monitoring is required for the following features:

- **Antimalware**: File hash allow and block indicators.
- **Network protection**: IP address and URL allow and block indicators, and web content filtering.

> [!IMPORTANT]
> Behavior monitoring is enabled by default and is protected by tamper protection. Keep behavior monitoring enabled except during a controlled, temporary troubleshooting test.

## Change the behavior monitoring policy

Use one of the following management tools to configure behavior monitoring.

|Management tool|Setting|Documentation|
|---|---|---|
|Defender for Endpoint security settings management|Allow behavior monitoring|[Manage Microsoft Defender Antivirus through security settings management](/intune/intune-service/protect/mde-security-integration)|
|Microsoft Intune|Allow behavior monitoring|[Microsoft Defender Antivirus policy settings for Windows](/intune/device-configuration/endpoint-security/ref-antivirus-defender-settings-windows#real-time-protection)|
|Configuration service provider (CSP)|AllowBehaviorMonitoring|[Defender Policy CSP](/windows/client-management/mdm/policy-csp-defender#allowbehaviormonitoring)|
|Configuration Manager tenant attach|Turn on behavior monitoring|[Microsoft Defender Antivirus policy settings for tenant-attached devices](/intune/device-configuration/endpoint-security/ref-antivirus-defender-settings-windows-tenant-attach#real-time-protection)|
|Group Policy|Turn on behavior monitoring|[Configure Microsoft Defender Antivirus with Group Policy](use-group-policy-microsoft-defender-antivirus.md)|
|PowerShell|**Set-MpPreference** _DisableBehaviorMonitoring_|[Set-MpPreference](/powershell/module/defender/set-mppreference#-disablebehaviormonitoring)|
|Windows Management Instrumentation (WMI)|DisableBehaviorMonitoring|[MSFT\_MpPreference class](/previous-versions/windows/desktop/defender/msft-mppreference)|

If you use Microsoft Defender for Business, see [Review or edit your next-generation protection policies in Microsoft Defender for Business](/defender-business/mdb-next-generation-protection).

## Modify the behavior monitoring settings by using PowerShell

To enable behavior monitoring, run the following command in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**):

```powershell
Set-MpPreference -DisableBehaviorMonitoring $false
```

To temporarily disable behavior monitoring for troubleshooting, run the following command in an elevated PowerShell session:

```powershell
Set-MpPreference -DisableBehaviorMonitoring $true
```

Changes made with PowerShell affect the local device. Policies deployed through Defender for Endpoint security settings management, Microsoft Intune, Configuration Manager tenant attach, or Group Policy can overwrite local changes.

For more information, see [Set-MpPreference](/powershell/module/defender/set-mppreference#-disablebehaviormonitoring).

## Query the behavior monitoring status from PowerShell

Run the following command to display the current behavior monitoring status:

```powershell
Get-MpComputerStatus | Format-Table BehaviorMonitorEnabled
```

If the command returns `True`, behavior monitoring is enabled.

## Query the behavior monitoring status by using Advanced Hunting

Organizations with Microsoft Defender for Endpoint Plan 2 or Microsoft Defender for Business can use advanced hunting to query behavior monitoring status. The query uses the `DeviceTvmSecureConfigurationAssessment` table in Defender advanced hunting. This method doesn't apply to Defender for Endpoint Plan 1 or Microsoft Defender for Individuals.

```kusto
let EvalTable = DeviceTvmSecureConfigurationAssessment
| where ConfigurationId in ("scid-91")
| summarize arg_max(Timestamp,IsCompliant, IsApplicable) by DeviceId, ConfigurationId,tostring(Context)
| extend Test = case(
ConfigurationId == "scid-91" , "BehaviorMonitoring",
"N/A"),
Result = case(IsApplicable == 0,"N/A",IsCompliant == 1 , "Enabled", "Disabled")
| extend packed = pack(Test,Result)
| summarize Tests = make_bag(packed) by DeviceId
| evaluate bag_unpack(Tests);
let DefUpdate = DeviceTvmSecureConfigurationAssessment
| where ConfigurationId == "scid-2011"
// | where isnotnull(Context)
| extend Definition = parse_json(Context[0][0])
| extend LastUpdated = parse_json(Context[0][2])
| project DeviceId,Definition,LastUpdated;
let DeviceInformation = DeviceInfo
| where isnotempty(OSPlatform)
| summarize arg_max(Timestamp,*) by DeviceId, DeviceName
| project DeviceId, DeviceName, MachineGroup;
let withNames = EvalTable
| join kind = inner DeviceInformation on DeviceId
| project-away DeviceId1
| project-reorder DeviceName, MachineGroup;
withNames | join kind = fullouter DefUpdate on DeviceId
| project-away DeviceId1
| sort by BehaviorMonitoring asc
```

## Troubleshooting high CPU usage

Behavior monitoring detections use the [`Behavior` malware naming type](/unified-secops-platform/malware-naming#type).

Use the [Microsoft Defender Antivirus Performance Analyzer](tune-performance-defender-antivirus.md) to identify files, file extensions, and processes that contribute to high CPU usage in `MsMpEng.exe`. Start a recording with **New-MpPerformanceRecording**, reproduce the issue, and analyze the recording with **Get-MpPerformanceReport**.

If the results indicate that behavior monitoring might contribute to the issue, use a controlled test to confirm the cause:

1. For eligible enterprise devices, [enable troubleshooting mode](enable-troubleshooting-mode.md) to temporarily change tamper-protected settings.
1. Temporarily turn off tamper protection, and then disable behavior monitoring.
1. Reproduce the performance issue for the shortest practical period.
1. Re-enable behavior monitoring and tamper protection immediately after the test.

Troubleshooting mode is a Defender for Endpoint enterprise feature and doesn't apply to Microsoft Defender for Individuals.

If disabling behavior monitoring resolves the issue, use the Performance Analyzer results to isolate the affected path, file, or process. If the issue started after a Microsoft Defender Antivirus update, follow the documented procedures to [roll back platform, engine, or security intelligence updates](microsoft-defender-antivirus-updates.md#how-to-roll-back-an-update). Roll back only the component suspected of causing the issue, and re-enable behavior monitoring after each test.

> [!WARNING]
> Antivirus exclusions reduce protection. Add a [contextual file or folder exclusion](microsoft-defender-antivirus-exclusions-overview.md#contextual-exclusions) only after you validate that the excluded activity is trusted and that a narrower exclusion can't resolve the issue.

If you can't isolate the cause, use the [Microsoft Defender for Endpoint Client Analyzer](data-collection-analyzer.md) with the `MDEClientAnalyzer.cmd -a` option to collect Defender Antivirus high-CPU tracing data, and then contact Microsoft Support.
