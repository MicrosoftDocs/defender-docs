---
title: Troubleshoot Microsoft Defender Antivirus service startup problems
description: Learn how to troubleshoot Microsoft Defender Antivirus service startup problems.
author: denisebmsft
ms.author: ewalsh
manager: ewalsh
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.topic: troubleshooting-general
ms.date: 01/18/2025
ms.subservice: ngp
ms.localizationpriority: medium
ms.collection: # Useful for querying on a set of strategic or high-priority content.
ms.custom: partner-contribution
search.appverid: MET150
f1.keywords: NOCSH
audience: ITPro
---

# Troubleshoot Microsoft Defender Antivirus service startup problems   

**Applies to:**

- [Microsoft Defender XDR](/defender-xdr)

- [Microsoft Defender for Endpoint Plan 1 and 2](microsoft-defender-endpoint.md)

- [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business)

- [Microsoft Defender for Individuals](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals)

- Microsoft Defender Antivirus

In the following screenshot, **Virus & threat protection** displays a red cross, where it says **Threat service has stopped.  Restart it now**.

:::image type="content" source="media/virus-threat-protection.jpg" alt-text="Screenshot of virus and threat protection notification.":::

Within **Security Providers**, you can see the following. <br> **Microsoft Defender Antivirus is turned off**.

:::image type="content" source="media/security-providers.png" alt-text="Screenshot of security providers.":::  

The following screenshot displays the message: **Threat service has stopped. Restart it now.**

:::image type="content" source="media/virus-threat-protection-2.png" alt-text="Screenshot of threat service has stopped.":::  

The following screenshot displays the message: **Unexpected error. Sorry, we ran into a problem. Please try again.** <br> Select **Close**.

:::image type="content" source="media/unexpected-error.png" alt-text="Screenshot of unexpected error." lightbox="media/unexpected-error.png":::  

## Events

The *Windows Defender – Operational* event log might display the following events:

### Event 5007

The configuration of Microsoft Defender Antivirus has changed. If you expected this event, review the settings, as it may be the result of malware.

|Old value  |New value  |
|---------|---------|
|`HKLM\SOFTWARE\Microsoft\Windows Defender\Diagnostics\RolledbackPlatformHealthData = <OVERALL>:<BAD>, <AGE>:<36>, <DIRTY_SHUTDOWNS>:<22>`     | `Default\Diagnostics\RolledbackPlatformHealthData = 0`        |
|`Default\ServiceStartStates = 0x0`     | `HKLM\SOFTWARE\Microsoft\Windows Defender\ServiceStartStates = 0x1`        |
|`HKLM\SOFTWARE\Microsoft\Windows Defender\ServiceStartStates = 0x1`     | `Default\ServiceStartStates = 0x0`        |
|`Default\ProductAppDataPath = C:\ProgramData\Microsoft\Windows Defender`    | `HKLM\SOFTWARE\Microsoft\Windows Defender\ProductAppDataPath = C:\ProgramData\Microsft\Windows Defender`        |
|`Default\IsServiceRunning = 0x0`     | `HKLM\SOFTWARE\Microsoft\Windows Defender\IsServiceRunning = 0x1`        |
|`Default\ProductAppDataPath = C:\ProgramData\Microsoft\Windows Defender`     | `HKLM\SOFTWARE\Microsoft\Windows Defender\ProductAppDataPath = C:\ProgramData\Microsoft\Windows Defender`        |
|`Default\IsServiceRunning = 0x0`    |`HKLM\SOFTWARE\Microsoft\Windows Defender\IsServiceRunning = 0x1`         |

### Event 5001

Microsoft Defender Antivirus Real-time Protection scanning for malware and other potentially unwanted software  was disabled.

## Resolution

Follow these steps to resolve the issue:

1. Check the services and filter drivers for Microsoft Defender Antivirus.

   Run the following PowerShell command as an administrator.
```powershell
gsv WinDefend, WdBoot, WdFilter, WdNisSvc, WdNisDrv, SecurityHealthService, wscsvc | ft -auto DisplayName, Name, StartType, Status
```

| Display Name | Name | StartType | Status | Comments |
| --- | --- | --- | --- | --- |
| Windows Security Service | SecurityHealthService | Manual | Running |  |
| Microsoft Defender Antivirus Boot Driver | WdBoot | Boot | Stopped | It’s normal to be stopped after boot. |
| Microsoft Defender Antivirus Mini-Filter Driver | WdFilter | Boot | Running | If stopped, check steps 3, 6, 7. |
| Microsoft Defender Antivirus Network Inspection System Driver | WdNisDrv | Manual | Running | If stopped, check steps 3, 6, 7. |
| Microsoft Defender Antivirus Network Inspection Service | WdNisSvc | Manual | Running | If stopped, check steps 3, 6, 7. |
| Microsoft Defender Antivirus Service | WinDefend | Automatic | Running | If stopped, check steps 3, 6, 7. |
| wscsvc | Security Center | Automatic | Running |  |

1. Download and run the [Microsoft Safety Scanner](safety-scanner-download.md) to rule out any malware.

1. If you're using Microsoft Defender Antivirus as your primary antivirus, make sure to uninstall third-party antivirus software.

1. Remove the **Security Intelligence** and **engine**.

   Run the following PowerShell command as an administrator.

    ```powershell
    & "${env:ProgramFiles}\Windows Defender\MpCmdRun.exe" -RemoveDefinitions -All
    ```

1. Reset the **Platform**.

   Run the following PowerShell command as an administrator.

    ```powershell
    & "${env:ProgramFiles}\Windows Defender\MpCmdRun.exe" -ResetPlatform
    ```

1. Backup Microsoft Defender Antivirus policies.

   Run the following PowerShell command as an administrator.

    ```powershell
    New-Item -Path "C:\temp" -ItemType Directory
    Invoke-Command {reg export 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender' C:\Temp\MDAV\_backup.reg
    ```

1. Delete any policies that are set for Microsoft Defender Antivirus.

    Run the following PowerShell command as an administrator.

    ```powershell
    Remove-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Force
    ```
    For more information, see: [Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md).

1. Re-enable Microsoft Defender Antivirus.

    Run the following PowerShell command as an administrator.

    ```powershell
    & "${env:ProgramFiles}\Windows Defender\MpCmdRun.exe" -WdEnable
    ```

1. Update Security Intelligence.

    Run the following PowerShell command as an administrator.

    ```powershell
    & "${env:ProgramFiles}\Windows Defender\MpCmdRun.exe" -SignatureUpdate -MMPC
    ```

1.  Make sure that **Tamper Protection** is enabled.

    :::image type="content" source="media/tamper-protection.png" alt-text="Screenshot of Tamper Protection is enabled.":::

1. Run **Microsoft Update**.