---
title: Microsoft Defender Core service overview
description: Get an overview of Microsoft Defender Core service.
author: YongRhee-MSFT
ms.author: yongrhee
manager: deniseb
ms.service: defender-endpoint
ms.subservice: ngp
ms.topic: overview
ms.date: 04/24/2024
search.appverid: met150
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier2
---

# Microsoft Defender Core service overview

Microsoft Defender Core service

To enhance your endpoint security experience, Microsoft is releasing the Microsoft Defender Core service to help with the stability and performance of Microsoft Defender Antivirus. 

Pre-requisites

1. The Microsoft Defender Core service is releasing with [Microsoft Defender Antivirus platform version 4.18.23110.2009](./msda-updates-previous-versions-technical-upgrade-support.md#october-2023-platform-418231002009--engine-11231002009).

1. Rollout begins on:

   - November 2023 to prerelease customers,
      
   - Mid April 2024 to Enterprise customers running Windows clients.
      
   - Mid June 2024 to U.S. Government customers running Windows clients.
      
1. If you are using the Microsoft Defender for Endpoint **streamlined** device connectivity experience, you do not need to add any additional URLs.

1. If you are using the Microsoft Defender for Endpoint **standard** device connectivity experience:

   Enterprise customers should allow the following URLs:
   
   - `*.endpoint.security.microsoft.com`
      
   - `ecs.office.com/config/v1/MicrosoftWindowsDefenderClient`
      
   - `*.events.data.microsoft.com`
      
   If you do not want to use the wildcards for `*.events.data.microsoft.com`, you can use:
   
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

| Process or service | Where to view its status |
|--|--|
| `Antimalware Core Service` | **Processes** tab |
| `MpDefenderCoreService.exe` | **Details** tab | 
| `Microsoft Defender Core Service` | **Services** tab |

To learn more about the Microsoft Defender Core service configurations and experimentation (ECS), see [Microsoft Defender Core service configurations and experimentation](microsoft-defender-core-service-configurations-and-experimentation.md).

Frequently Asked Questions (FAQ's):

Q: What's the recommendation for Microsoft Defender Core service?

A: We highly recommend to let the default settings of keeping the Microsoft Defender Core service running and reporting.

Q: What data storage and privacy does the Microsoft Defender Core service adhere to?

A: Please review [Microsoft Defender for Endpoint data storage and privacy](/microsoft-365/security/defender-endpoint/data-storage-privacy) 

Q: Can I enforce keeping the Microsoft Defender Core service running as an Administrator?

A: Yes, you can enforce it by using any of these management tools:

- Configuration Manager Co-Management

- Group Policy

- Powershell

- Registry

### Configuration Manager Co-Management (ConfigMgr, formerly MEMCM/SCCM)

Use Microsoft [Configuration Manager](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Flearn.microsoft.com%2Fmem%2Fconfigmgr%2Fcore%2Funderstand%2Fintroduction&data=05%7C02%7Cyongrhee%40microsoft.com%7C5b1cbdedcec441b8587108dc65896987%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638496888170125399%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=WgxfHpdLBPLKKUwhP6cxpW%2FOW90oQEu5%2BUw5Qq9x2vo%3D&reserved=0) to update the policy for Microsoft Defender Core service Configuration Manager has an integrated ability to run PowerShell scripts to update Microsoft Defender Antivirus policy settings across all computers in your network

1. Open the Microsoft Configuration Manager console. Select Software Library > Scripts > Create Script.

1. Enter the script name (for example, Microsoft Defender Core service enforcement), description (Demo configuration to enable Microsoft Defender Core service settings), language (PowerShell), timeout seconds (180), and then paste in the following "Microsoft Defender Core service enforcement" script example to use as a template.

```
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
#Set up Microsoft Defender Core service
Set-RegistryKeyValue -KeyPath "HKLM:\Software\Policies\Microsoft\Windows Defender\Features\" -ValueName "DisableCoreService1DSTelemetry" -Value "0" -PropertyType "Dword" -LogFile $LogFile
Set-RegistryKeyValue -KeyPath "HKLM:\Software\Policies\Microsoft\Windows Defender\Features\" -ValueName "DisableCoreServiceECSIntegration" -Value "0" -PropertyType "Dword" -LogFile $LogFile
$ExecutionTime = Get-Date
Add-Content -Path $LogFile -Value "------------------------------------ 
$ExecutionTime - Execution Ends -------------------------------------------"
```

1. When adding a new script, you must select and approve it. The approval state will change from "Waiting for approval" to "Approved".
2. Once approved, right-click a single device or device collection and select Run script.
3. On the script page of the Run Script wizard, choose your script from the list (Microsoft Defender Core service enforcement in our example). Only approved scripts are displayed. Select Next and complete the wizard.

### Group Policy

1. Download the latest Microsoft Defender Group Policy Administrative Templates from [here](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FYongRhee-MSFT%2FMicrosoft-Defender-Antivirus-Group-Policy-Administrative-Templates&data=05%7C02%7Cyongrhee%40microsoft.com%7C5b1cbdedcec441b8587108dc65896987%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638496888170132859%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=ZCeqpGpoSPoLlbsDttbCUtTxY1FgF1VTdQqP4pyFVEw%3D&reserved=0).

1. Setup the Domain Controller [Central Repository](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Flearn.microsoft.com%2Ftroubleshoot%2Fwindows-client%2Fgroup-policy%2Fcreate-and-manage-central-store&data=05%7C02%7Cyongrhee%40microsoft.com%7C5b1cbdedcec441b8587108dc65896987%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638496888170140405%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=V4O9CmhHIeh8co474xWsg6qw%2B4pnhZu52KBV6v0W9Fc%3D&reserved=0) Copy the .admx and the .adml to the En-US folder.

Start, GPMC.msc (e.g. Domain Controller or ) or GPEdit.msc

Computer Configuration -> Administrative Templates -> Windows Components -> Microsoft Defender Antivirus

- Turn on ECS integration for Defender core service  
  ```
  Not configured or enabled (default), the Microsoft Defender core service will use ECS to rapidly deliver critical, org-specific fixes for Microsoft Defender Antivirus and other Defender software.
  
  
  Disabled, the Microsoft Defender core service will stop using the Experimentation and Configuration Service (ECS) to rapidly deliver critical, org-specific fixes for Microsoft Defender Antivirus and other Defender software. For false positives, fixes will be delivered via "Security Intelligence updates", and for Platform and/or Engine updates, fixes will be delivered thru Microsoft Update, Microsoft Update Catalog or WSUS.
  ```- Turn on telemetry for Defender core service  
  ```
  Not configured or enabled (default), the Microsoft Defender core service will collect telemetry from Microsoft Defender Antivirus and other Defender software  
  
  
  Disabled, the Microsoft Defender core service will stop collecting telemetry from Microsoft Defender Antivirus and other Defender software. Disabling this setting can impact Microsoft's ability to quickly recognize and address problems, such as slow performance and false positives.
  ```### Powershell

Start, Powershell (Run as administrator)

Set-MpPreferences -DisableCoreServiceECSIntegration $true or $false  
 e.g.


```
Set-MpPreferences -DisableCoreServiceECSIntegration $false 
```

Set-MpPreferences -DisableCoreServiceTelemetry $true or $false  
 e.g.


```
Set-MpPreferences -DisableCoreServiceTelemetry $false
```

$false = enabled  
$true = disabled|

### Registry

Start, Regedit.exe (Run as administrator) 

HKLM\Software\Policies\Microsoft\Windows Defender\Features

DisableCoreService1DSTelemetry (dword) 0 (hex)  
 0 = Not configured, enabled (default)  
 1 = Disabled

DisableCoreServiceECSIntegration (dword) 0 (hex)  
 0 = Not configured, enabled (default)  
 1 = Disabled
