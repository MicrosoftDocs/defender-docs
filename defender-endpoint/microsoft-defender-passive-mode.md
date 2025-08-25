---
title: Defender for Endpoint with Defender Antivirus in passive mode
ms.topic: conceptual
description: Understand how Defender Antivirus in passive mode works and when to use it.
ms.service: defender-endpoint
author: KesemSharabi
ms.author: kesharab
ms.localizationpriority: high
audience: ITPro
ms.collection: 
- m365-security
- tier1
- mde-ngp
ms.subservice: ngp
search.appverid: met150
ms.date: 03/26/2025
---

# Defender Antivirus in passive mode

[!INCLUDE [side-by-side-scenarios](includes/side-by-side-scenarios.md)]

Microsoft Defender for Endpoint is a comprehensive security solution designed to protect your devices from evolving threats. One of its key features enables Microsoft Defender Antivirus to coexist with non-Microsoft antimalware solutions while still providing valuable endpoint detection and response capabilities.

Some of the key benefits of Defender Antivirus in passive mode are:

* **EDR Block mode** - Post-breach protection by detecting and remediating threats missed by the active antimalware solution

* **Data Loss Prevention (DLP)** - Endpoint DLP functionalities operate normally, ensuring sensitive data is safeguarded.

* **Security intelligence updates** - Microsoft Defender Antivirus continues to receive updates to stay aware of the latest threats.

* **Data Loss Prevention (DLP)** - Endpoint DLP functionalities operate normally, ensuring sensitive data is safeguarded.

For more information, see [How Microsoft Defender Antivirus affects Defender for Endpoint functionality](microsoft-defender-antivirus-compatibility.md#how-microsoft-defender-antivirus-affects-defender-for-endpoint-functionality).

>[!NOTE]
>Passive mode disables Microsoft Defender Antivirus scheduled scans unless specific configurations are applied.

## Prerequisites

* Operating system
    * Windows 10 or newer
    * Windows Server 2012 R2 or newer

* The device must be onboarded to Microsoft Defender for Endpoint

* Microsoft Defender Antivirus has to be installed and enabled

## Configure passive mode

On Windows 10 or newer, Defender Antivirus automatically enters passive mode when a non-Microsoft antimalware solution is installed and registered.

For Windows Server operating systems, follow the instructions in this section to configure passive mode for Microsoft Defender for Endpoint.

### Set the registry key

To avoid conflicts between Microsoft Defender Antivirus and a third-party antivirus solution, if you're using Windows Server, set the following registry key before onboarding the device to Microsoft Defender for Endpoint:

* **Path** - HKLM\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection

* **Name** - ForceDefenderPassiveMode

* **Type** - REG_DWORD

* **Value** - 1

### Enable EDR in block mode

When Microsoft Defender Antivirus is in passive mode, EDR in block mode can provide post-breach protection by detecting and remediating threats. Ensure this feature is enabled in Defender for Endpoint.

### Avoid service modifications

Don't disable, stop, or modify associated services such as `wscsvc`, `WinDefend`, or `MsMpEng`. Stopping these services can cause instability and make your device vulnerable to threats.

### Exclude Defender binaries in third-party antivirus

To prevent performance issues or conflicts, add Microsoft Defender Antivirus and Defender for Endpoint binaries to the exclusion list of your third-party antivirus solution.

## Verify that passive mode is enabled

This section describes how to confirm whether Microsoft Defender Antivirus is in passive mode.

### Windows PowerShell

Run the following PowerShell cmdlet:

```powershell
Get-MpComputerStatus | select AMRunningMode
```

The `AMRunningMode` value indicates the current Defender Antivirus state:

* **Normal** - Active mode

* **Passive** - Passive mode

* **EDR Block Mode** - EDR is operating in block mode

### Windows security app

Follow these steps to verify that Microsoft Defender Antivirus is in passive mode (Windows 10 and later only).

1. Open the Windows Security app.

2. Select **Virus & threat protection**.

3. Under **Who’s protecting me?**, select **Manage providers**.

4. On the *Security providers* page, verify the antivirus provider and state.

## Additional resources

[Microsoft Defender Antivirus compatibility with other security products](microsoft-defender-antivirus-compatibility.md)
