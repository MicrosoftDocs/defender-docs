---
title: Behavior Monitoring demonstration
description: Behavior Monitoring demonstration
ms.service: defender-endpoint
ms.subservice: ngp
author: YongRhee-MSFT
ms.author: yongrhee
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.custom: admindeeplinkDEFENDER
ms.topic: conceptual
search.appverid: met150
ms.date: 05/15/2024
---

# Behavior Monitoring demonstration

**Applies to:**

- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business)
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender Antivirus](microsoft-defender-antivirus-windows.md)
- [Microsoft Defender for Individuals](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals)

Behavior monitoring in Microsoft Defender Antivirus monitors process behavior to detect and analyze potential threats based on the behavior of applications, services, and files. Rather than relying solely on content matching, which identifies known malware patterns, behavior monitoring focuses on observing how software behaves in real-time.

## Scenario requirements and setup

- Windows 11, Windows 10, Windows 8.1, Windows 7 SP1

- Windows Server 2022, Windows Server 2019, Windows Server 2016, Windows Server 2012, and Windows Server 2008 R2

- macOS

- [Microsoft Defender Real-time protection is enabled](#verify-microsoft-defender-real-time-protection-is-enabled)

- [Behavior Monitoring is enabled](#enable-behavior-monitoring-for-microsoft-defender-for-endpoint)

## Windows

### Verify Microsoft Defender real-time protection is enabled

To verify real-time protection is enabled, open PowerShell as an administrator, and then run the following command:

```powershell
get-mpComputerStatus |ft RealTimeProtectionEnabled
```

When real-time protection is enabled, the result shows a value of `True`.

### Enable Behavior Monitoring for Microsoft Defender for Endpoint

For more information on how to enable Behavior Monitoring for Defender for Endpoint, see [how to enable Behavior Monitoring](/defender-endpoint/behavior-monitor).

### Demonstration of how Behavior Monitoring works in Windows and Windows Server

To demonstrate how Behavior Monitoring blocks a payload, run the following PowerShell command:

```powershell
powershell.exe -NoExit -Command "powershell.exe hidden 12154dfe-61a5-4357-ba5a-efecc45c34c4"
```

The output contains an expected error as follows:

```console
hidden : The term 'hidden' is not recognized as the name of a cmdlet, function, script, script file, or operable program.  Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
At line:1 char:1
+hidden 12154dfe-61a5-4357-ba5a-efecc45c34c4
+""""""
CategoryInfo             : ObjectNotFound: (hidden:String) [], CommandNotFoundException
FullyQualifiedErrorId : CommandNotFoundException
```

In the Microsoft Defender portal, in the Action center, you should see the following information:

- Windows Security
- Threats found
- Microsoft Defender Antivirus found threats. Get details.
- Dismiss

If you select the link, your Windows Security app opens. Select **Protection history**.

You should see information that resembles the following output:

```console
Threat blocked
Detected: Behavior:Win32/BmTestOfflineUI
Status: Removed
A threat or app was removed from this device.
Date: 6/7/2024 11:51 AM
Details: This program is dangerous and executes command from an attacker.
Affected items:
behavior: process: C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe, pid:6132:118419370780344
process: pid:6132,ProcessStart:133621698624737241
Learn more    Actions
```

In the [Microsoft Defender portal](https://security.microsoft.com), you should see information like this: 

`Suspicious 'BmTestOfflineUI' behavior was blocked`

When you select it, you see the alert tree that has the following information:

`Defender detected and terminated active 'Behavior:Win32/BmTestOfflineUI' in process 'powershell.exe' during behavior monitoring`

## macOS

### Verify Microsoft Defender Real-time protection is enabled

To verify real-time protection (RTP) is enabled, open a terminal window and copy and execute the following command:

```bash
mdatp health --field real_time_protection_enabled
```

When RTP is enabled, the result shows a value of 1.

### Enable Behavior Monitoring for Microsoft Defender for Endpoint

For more information on how to enable behavior monitoring for Defender for Endpoint, see [Deployment instructions for behavior monitoring](behavior-monitor-macos.md#deployment-instructions-for-behavior-monitoring).

### Demonstration of how Behavior Monitoring works

To demonstrate how Behavior Monitoring blocks a payload:

1. Create a bash script using a script/text editor such as nano or Visual Studio Code (VS Code):

   ```bash
   #! /usr/bin/bash
   echo " " >> /tmp/9a74c69a-acdc-4c6d-84a2-0410df8ee480.txt
   echo " " >> /tmp/f918b422-751c-423e-bfe1-dbbb2ab4385a.txt
   sleep 5
   ```

2. Save as `BM_test.sh`.

3. Run the following command to make the bash script executable:

   ```bash
   sudo chmod u+x BM_test.sh
   ```

4. Run the bash script:

   ```bash
   sudo bash BM_test.sh
   ```

   The result should look like this

   `zsh: killed      sudo bash BM_test.sh`

   The file is quarantined by Defender for Endpoint on macOS. Use the following command to list all the detected threats:

   ```bash
   mdatp threat list
   ```

   The result shows information like this:

   ```console
   ID: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

   Name: Behavior: MacOS/MacOSChangeFileTest

   Type: "behavior"

   Detection time: Tue May 7 20:23:41 2024

   Status: "quarantined"
   ```

If you have Microsoft Defender for Endpoint P2/P1 or Microsoft Defender for Business, go to the [Microsoft Defender portal](https://security.microsoft.com), and you see an alert titled, *Suspicious 'MacOSChangeFileTest' behavior was blocked*.
