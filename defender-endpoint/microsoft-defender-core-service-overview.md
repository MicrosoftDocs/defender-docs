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

The Microsoft Defender Core service is releasing with [Microsoft Defender Antivirus platform version 4.18.23110.2009](./msda-updates-previous-versions-technical-upgrade-support.md#october-2023-platform-418231002009--engine-11231002009).

- Rollout begins in:

  - November 2023 to prerelease customers,
    
  - Mid April 2024 to Enterprise customers running Windows clients.
    
  - Mid May 2024 to Enterprise customers running Windows Servers.
    
  - Mid June 2024 to U.S. Government customers running Windows clients and Windows Servers.
    
If you are using the Microsoft Defender for Endpoint **streamlined** device connectivity experience, you do not need to add any additional URLs.

If you are using the Microsoft Defender for Endpoint **standard** device connectivity experience:

- Enterprise customers should allow the following URLs:

  - `*.events.data.microsoft.com`
    
  - `*.endpoint.security.microsoft.com`
    
  - `*.ecs.office.com` 
    
- If you do not want to use the wildcards, you can use:

  - us-mobile.events.data.microsoft.com/OneCollector/1.0
  
  - eu-mobile.events.data.microsoft.com/OneCollector/1.0
  
  - uk-mobile.events.data.microsoft.com/OneCollector/1.0
  
  - au-mobile.events.data.microsoft.com/OneCollector/1.0
  
  - mobile.events.data.microsoft.com/OneCollector/1.0
  
    and
    
  - ecs.office.com/config/v1/MicrosoftWindowsDefenderClient
  
- Enterprise U.S. Government customers should allow the following URLs:

  - `*.events.data.microsoft.com`
    
  - `*.endpoint.security.microsoft.us (GCC-H & DoD)`
    
  - `*.gccmod.ecs.office.com (GCC-M)`
    
  - `*.config.ecs.gov.teams.microsoft.us (GCC-H)`
    
  - `*.config.ecs.dod.teams.microsoft.us (DoD)`
    
- If you're using [Application Control for Windows](/windows/security/application-security/application-control/windows-defender-application-control/wdac), or you're running non-Microsoft antivirus or endpoint detection and response software, make sure to add the processes mentioned earlier to your allowlist. 

- Consumers don't need to take any actions to prepare. 

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

Q: Does the [MDE Client Analyzer](/microsoft-365/security/defender-endpoint/run-analyzer-windows) check the URL's for Microsoft Defender for Endpoint **standard** device connectivity experience?

A: Not yet, work is in progress to include these new URL's.

Q: Can I enforce keeping the Microsoft Defender Core service running as an Administrator?

A: Yes, you can enforce it by using any of these management tools:


|Management tool| Description|
| -------- | -------- |
| Microsoft Defender for Endpoint Security Settings Management| On the roadmap|
| Intune   | On the roadmap |
| Configuration Manager Tenant Attach | On the roadmap |
| Configuration Manager Co-Management | Info |
| Group Policy   | Go to **Computer Configuration** > **Administrative Templates** > **Windows Components**  > **Microsoft Defender Antivirus**, and set Experimentation and Configuration Service (ECS) integration for Defender Core Service to either **Not configured** or **Enabled** (this is the default setting). <br/><br/>The Microsoft Defender Core Service uses ECS to rapidly deliver critical, org-specific fixes for Microsoft Defender Antivirus and other Defender software. <br/><br/>When disabled, the Microsoft Defender Core Service stops using ECS. <br/><br/>For false positives, fixes are delivered via Security Intelligence updates. <br/><br/>For Platform and/or Engine updates, fixes are delivered thru Microsoft Update, Microsoft Update Catalog or WSUS. <br/><br/>When you set telemetry for the Microsoft Defender Core Service to **Not configured** or **Enabled** (this is the default setting), the Microsoft Defender Core Service collects telemetry from Microsoft Defender Antivirus and other Defender software. When disabled, the Microsoft Defender Core Service stops collecting telemetry from Microsoft Defender Antivirus and other Defender software. Disabling this setting can impact Microsoft's ability to quickly recognize and address problems, such as slow performance and false positives.|
| Powershell | `Set-MpPreferences -DisableCoreServiceECSIntegration $true | $false`<br/><br/> `Set-MpPreferences -DisableCoreServiceTelemetry $true | $false` |
| Registry | **HKLM\Software\Policies\Microsoft\Windows Defender\Features DisableCoreService1DSTelemetry** <br/>Set (dword) 0 (hex) 0 = Not Configured, enabled (default) 1 = disabled<br/><br/> `DisableCoreServiceECSIntegration`<br/>Set (dword) 0 (hex) 0 = Not Configured, enabled (default) 1 = disabled|
