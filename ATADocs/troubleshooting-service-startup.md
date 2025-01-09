---
# required metadata

title: Troubleshooting Advanced Threat Analytics service startup
description: Describes how you can troubleshoot ATA startup issues
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 5a65285c-d1de-4025-9bb4-ef9c20b13cfa

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: bennyl
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Troubleshooting service startup

[!INCLUDE [Banner for top of topics](includes/banner.md)]

## Troubleshooting ATA Center service startup

If your ATA Center does not start, perform the following troubleshooting procedure:

1. Run the following Windows PowerShell command:
    `Get-Service Pla | Select Status`
to make sure the Performance counter service is running. If it's not, then it's a platform issue, and you need to make sure you get this service running again.
1. If it was running, Try to restart it, and see if it resolves the issue:
    `Restart-Service Pla`
1. Try to create a new data collector manually (any will suffice, even just collect machine CPU for example).
If it can start, the platform is probably fine. If not, it is still a platform issue.

1. Try to manually recreate the ATA data collector, using an elevated prompt, running these commands:

```cmd
sc stop ATACenter
logman stop "Microsoft ATA Center"
logman export "Microsoft ATA Center" -xml c:\center.xml
logman delete "Microsoft ATA Center"
logman import "Microsoft ATA Center" -xml c:\center.xml
logman start "Microsoft ATA Center"
sc start ATACenter
```

## Troubleshooting ATA Lightweight Gateway startup

**Symptom**

Your ATA Gateway does not start and you get this error:<br></br>
*System.Net.Http.HttpRequestException: Response status code does not indicate success: 500 (Internal Server Error)*

**Description**

This happens because as part of the Lightweight Gateway installation process, ATA allocates a CPU threshold that enables the Lightweight Gateway to utilize CPU with a buffer of 15%. If you have independently set a threshold using the registry key: this conflict will prevent the Lightweight Gateway from starting. 

**Resolution**

1. Under the registry keys, if there is a DWORD value called **Disable Performance Counters** make sure it is set to **0**:

```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PerfOS\Performance\
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PerfProc\Performance
```

1. Then restart the Pla service. The ATA Lightweight Gateway will automatically detect the change and restart the service.

## See Also

- [ATA prerequisites](ata-prerequisites.md)
- [ATA capacity planning](ata-capacity-planning.md)
- [Configure event collection](configure-event-collection.md)
- [Configuring Windows event forwarding](configure-event-collection.md)
- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
