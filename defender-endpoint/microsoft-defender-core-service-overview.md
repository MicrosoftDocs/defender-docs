---
title: Microsoft Defender Core service overview
description: Get an overview of Microsoft Defender Core service.
author: paulinbar
ms.author: painbar
manager: bagol
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.subservice: ngp
ms.topic: overview
ms.date: 01/08/2026
search.appverid: met150
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier2
---

# Microsoft Defender Core service overview

To enhance your endpoint security experience, Microsoft is releasing the Microsoft Defender Core service to help with stability and performance of Microsoft Defender Antivirus. Microsoft Defender Core service is included in Microsoft Defender Antivirus, so it's available wherever Microsoft Defender Antivirus is included. For example:

- Windows 10 and Windows 11 Enterprise.
- Windows Server 2019 or later.
- Microsoft Defender for Endpoint standalone or bundled with other offerings. For example:
  - Microsoft 365 A5/E5/G5
  - Microsoft 365 Defender Suite
  - Microsoft Defender for Business (standalone or included in Microsoft 365 Business Premium)

## Prerequisites

1. The Microsoft Defender Core service is releasing with [Microsoft Defender Antivirus platform version 4.18.23110.2009](./msda-updates-previous-versions-technical-upgrade-support.md#october-2023-platform-418231002009--engine-11231002009).

1. Rollout is planned to begin as follows:

   - November 2023 to prerelease customers.
   - Mid April 2024 to Enterprise customers running Windows clients.
   - Beginning of July 2024 to U.S. Government customers running Windows clients.

     The Microsoft Defender Core service for Windows Server is releasing with [Microsoft Defender Antivirus platform version 4.18.25050.5.](/defender-endpoint/microsoft-defender-antivirus-updates)

   - Mid July 2025 to Enterprise customers running Windows Server 2019 or later.

   - Mid September 2025 to Enterprise customers running the [unified Microsoft Defender for Endpoint client](/defender-endpoint/update-agent-mma-windows) for Windows Server 2012 R2 or Windows Server 2016.

1. If you're using the Microsoft Defender for Endpoint **streamlined** device connectivity experience, you don't need to add any other URLs.

1. If you're using the Microsoft Defender for Endpoint **standard** device connectivity experience:

   Enterprise customers should allow the following URLs:

   - `*.endpoint.security.microsoft.com`
   - `ecs.office.com/config/v1/MicrosoftWindowsDefenderClient`
   - `*.events.data.microsoft.com`

   If you don't want to use the wildcards for `*.events.data.microsoft.com`, you can use:

   - `us-mobile.events.data.microsoft.com/OneCollector/1.0`
   - `eu-mobile.events.data.microsoft.com/OneCollector/1.0`
   - `uk-mobile.events.data.microsoft.com/OneCollector/1.0`
   - `au-mobile.events.data.microsoft.com/OneCollector/1.0`
   - `mobile.events.data.microsoft.com/OneCollector/1.0`

   Enterprise U.S. Government customers should allow the following URLs:

   - `*.events.data.microsoft.com`
   - `*.endpoint.security.microsoft.us (GCC-H & DoD)`
   - `*.gccmod.ecs.office.com (GCC-M)`
   - `*.config.ecs.gov.teams.microsoft.us (GCC-H)`
   - `*.config.ecs.dod.teams.microsoft.us (DoD)`

1. If you're using [Application Control for Windows](/windows/security/application-security/application-control/windows-defender-application-control/wdac), or you're running non-Microsoft antivirus or endpoint detection and response software, make sure to add the processes mentioned earlier to your allowlist.

1. Consumers don't need to take any actions to prepare.

## Microsoft Defender Antivirus processes and services

The following table summarizes where you can view Microsoft Defender Antivirus processes and services (`MdCoreSvc`) using Task Manager on Windows devices.

|Process or service|Where to view its status|
|---|---|
|`Antimalware Core Service`|**Processes** tab|
|`MpDefenderCoreService.exe`|**Details** tab|
|`Microsoft Defender Core Service`|**Services** tab|

To learn more about the Microsoft Defender Core service configurations and experimentation (ECS), see [Microsoft Defender Core service configurations and experimentation](microsoft-defender-core-service-configurations-and-experimentation.md).

## Frequently Asked Questions (FAQs)

### What's the recommendation for Microsoft Defender Core service?

We highly recommend keeping the default settings of the Microsoft Defender Core service running and reporting.

### What data storage and privacy does the Microsoft Defender Core service adhere to?

Review [Microsoft Defender for Endpoint data storage and privacy](/microsoft-365/security/defender-endpoint/data-storage-privacy).

### Can I enforce the Microsoft Defender Core service stays running as an Administrator?

You can enforce it by using any of these management tools:

- [Configuration Manager co-management](#use-configuration-manager-co-management-configmgr-formerly-memcmsccm-to-update-the-policy-for-microsoft-defender-core-service)
- [Group Policy](#use-group-policy-editor-to-update-group-policy-for-microsoft-defender-core-service)
- [PowerShell](#use-powershell-to-update-the-policies-for-microsoft-defender-core-service)
- [The registry](#use-the-registry-to-update-the-policies-for-microsoft-defender-core-service)

#### Use Configuration Manager co-management (ConfigMgr, formerly MEMCM/SCCM) to update the policy for Microsoft Defender Core service

Microsoft [Configuration Manager](/intune/configmgr/core/understand/introduction) has an integrated ability to run PowerShell scripts to update Microsoft Defender Antivirus policy settings across all computers in your network.

1. Open the Microsoft Configuration Manager console.
1. Select **Software Library > Scripts > Create Script**.
1. Enter the **Script name**, for example, Microsoft Defender Core service enforcement and **Description**, for example, Demo configuration to enable Microsoft Defender Core service settings.
1. Set the **Language** to PowerShell and the **Timeout seconds** to 180
1. Paste in the following "Microsoft Defender Core service enforcement" script example to use as a template:

```powershell
######
#ConfigMgr Management of Microsoft Defender Core service enforcement
#"Microsoft Defender Core service is a new service to help keep the reliability and performance of Microsoft Defender Antivirus.
#Check Log File for enforcement status - C:\Windows\temp\ConfigDefenderCoreService-<TimeStamp>.log
######

Function Set-RegistryKeyValue{
param (
$KeyPath,
$ValueName,
$Value,
$PropertyType,
$LogFile
)
Try {
    If (!(Test-path $KeyPath)) {
    $Path = ($KeyPath.Split(':'))[1].TrimStart("\")
    ([Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine,$env:COMPUTERNAME)).CreateSubKey($Path)
    New-ItemProperty -path $KeyPath -name $ValueName -value $Value -PropertyType $PropertyType -Force | Out-Null
    }
    Else {
    New-ItemProperty -path $KeyPath -name $ValueName -value $Value -PropertyType $PropertyType -Force | Out-Null
    }
    $TestValue = (Get-ItemProperty -Path $KeyPath)."$ValueName"
    If ($TestValue -eq $Value){ Add-Content -Path $LogFile -Value "$KeyPath,$ValueName,$Value,$PropertyType,$TestValue,Success" }
    Else { Add-Content -Path $LogFile -Value "$KeyPath,$ValueName,$Value,$PropertyType,$TestValue,Failure" }
    }
    Catch {
    $ExceptionMessage = $($PSItem.ToString()) -replace [Environment]::NewLine,"";
    Add-Content -Path $LogFile -Value "$KeyPath,$ValueName,$Value,$PropertyType,$TestValue,Failure - $ExceptionMessage"
    }
}
$ExecutionTime = Get-Date

$StartTime = Get-Date $ExecutionTime -Format yyyyMMdd-HHmmss

$LogFile = "C:\Windows\temp\ConfigDevDrive-$StartTime.log"

Add-Content -Path $LogFile -Value "------------------------------------V 1.0

$ExecutionTime - Execution Starts -------------------------------------------"

Add-Content -Path $LogFile -Value "RegistryKeyPath,ValueName,ExpectedValue,PropertyType,CurrentValue,ComparisonResult"

# Set up Microsoft Defender Core service

Set-RegistryKeyValue -KeyPath "HKLM:\Software\Policies\Microsoft\Windows Defender\Features\" -ValueName "DisableCoreService1DSTelemetry" -Value "0" -PropertyType "Dword" -LogFile $LogFile

Set-RegistryKeyValue -KeyPath "HKLM:\Software\Policies\Microsoft\Windows Defender\Features\" -ValueName "DisableCoreServiceECSIntegration" -Value "0" -PropertyType "Dword" -LogFile $LogFile

$ExecutionTime = Get-Date

Add-Content -Path $LogFile -Value "------------------------------------

$ExecutionTime - Execution Ends -------------------------------------------"
```

When adding a new script, you must select and approve it. The approval state changes from _Waiting for approval_ to _Approved_. Once approved, right-click a single device or device collection, and select **Run script**.

On the script page of the Run Script wizard, choose your script from the list (Microsoft Defender Core service enforcement in our example). Only approved scripts are displayed. Select Next and complete the wizard.

#### Use Group Policy Editor to update Group Policy for Microsoft Defender Core service

1. Download the latest Microsoft Defender Group Policy Administrative Templates from [here](https://github.com/YongRhee-MSFT/Microsoft-Defender-Antivirus-Group-Policy-Administrative-Templates).
1. Set up the Domain Controller [Central Repository](/troubleshoot/windows-client/group-policy/create-and-manage-central-store).

   > [!NOTE]
   > Copy the .admx, and separately the .adml to the En-US folder.

1. Start, GPMC.msc (e.g. Domain Controller or) or GPEdit.msc
1. Go to **Computer Configuration** -> **Administrative Templates** -> **Windows Components** -> **Microsoft Defender Antivirus**

1. Turn on Experimentation and Configuration Service (ECS) integration for Defender core service
   - **Not configured or enabled (default)**: The Microsoft Defender core service uses ECS to rapidly deliver critical, org-specific fixes for Microsoft Defender Antivirus and other Defender software.
   - **Disabled**: The Microsoft Defender core service doesn't use ECS to deliver fixes for Microsoft Defender Antivirus and other Defender software.
     - For false positives, fixes are delivered via "Security Intelligence updates".
     - For Platform and/or Engine updates, fixes are delivered through Microsoft Update, Microsoft Update Catalog, or WSUS.

1. Turn on telemetry for Defender core service
   - **Not configured or enabled (default)**: The Microsoft Defender Core service collects telemetry from Microsoft Defender Antivirus and other Defender software.
   - **Disabled**: The Microsoft Defender Core service doesn't collect telemetry from Microsoft Defender Antivirus and other Defender software. Disabling this setting can impact Microsoft's ability to quickly recognize and address problems, such as slow performance and false positives.

#### Use PowerShell to update the policies for Microsoft Defender Core service

Use the following syntax in an elevated PowerShell window (a PowerShell window you opened by selecting **Run as administrator**):

```powershell
Set-MpPreference -DisableCoreServiceECSIntegration <$true | $false> -DisableCoreServiceTelemetry <$true | $false>
```

- _DisableCoreServiceECSIntegration_:
  - `$false` (default): The Microsoft Defender core service uses ECS to rapidly deliver critical, org-specific fixes for Microsoft Defender Antivirus and other Defender software.
  - `$true`: The Microsoft Defender core service doesn't use ECS to deliver fixes for Microsoft Defender Antivirus and other Defender software.
    - For false positives, fixes are delivered via "Security Intelligence updates".
    - For Platform and/or Engine updates, fixes are delivered through Microsoft Update, Microsoft Update Catalog, or WSUS.

- _DisableCoreServiceTelemetry_:
  - `$false` (default): The Microsoft Defender Core service collects telemetry from Microsoft Defender Antivirus and other Defender software.
  - `$true`: The Microsoft Defender Core service doesn't collect telemetry from Microsoft Defender Antivirus and other Defender software. Disabling this setting can impact Microsoft's ability to quickly recognize and address problems, such as slow performance and false positives.

For example:

```powershell
Set-MpPreference -DisableCoreServiceECSIntegration` $false -DisableCoreServiceTelemetry $true
```

For detailed syntax and parameter information, see [Set-MpPreference](/powershell/module/defender/set-mppreference).

#### Use the Registry to update the policies for Microsoft Defender Core service

1. Select **Start**, and then open Regedit.exe as an administrator.
1. Go to `HKLM\Software\Policies\Microsoft\Windows Defender\Features`
1. Set the values:
   - `DisableCoreService1DSTelemetry` (dword) 0 (hex)
     - `0` = Not configured, enabled (default)
     - `1` = Disabled
   - `DisableCoreServiceECSIntegration` (dword) 0 (hex)
     - `0` = Not configured, enabled (default)
     - `1` = Disabled
