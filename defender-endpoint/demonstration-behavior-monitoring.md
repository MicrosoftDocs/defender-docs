---
title: Behavior Monitoring demonstration
description: Behavior Monitoring demonstration
ms.service: defender-endpoint
ms.subservice: ngp
author: YongRhee-MSFT
ms.author: yongrhee
ms.localizationpriority: normal
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


Behavior Monitoring in Microsoft Defender Antivirus monitors process behavior to detect and analyze potential threats based on the behavior of applications, services, and files. Rather than relying solely on content matching, which identifies known malware patterns, behavior monitoring focuses on observing how software behaves in real-time.

## Scenario requirements and setup

- This demonstration only runs on macOS
- [Microsoft Defender Real-time protection is enabled](#verify-microsoft-defender-real-time-protection-is-enabled)
- [Behavior Monitoring is enabled](#enable-behavior-monitoring-for-microsoft-defender-for-endpoint)

### Verify Microsoft Defender Real-time protection is enabled

To verify real-time protection (RTP) is enabled, open a terminal window and copy and execute the following command:

  ```bash
  mdatp health --field real_time_protection_enabled
  ```

When RTP is enabled, the result shows a value of 1.

### Enable Behavior Monitoring for Microsoft Defender for Endpoint

For more information on how to enable Behavior Monitoring for Defender for Endpoint, see [Deployment instructions](behavior-monitor-macos.md#deployment-instructions).

### Demonstration of how Behavior Monitoring works

To demonstrate how Behavior Monitoring blocks a payload:

1. Create a bash script using a script/text editor such as nano or Visual Studio Code (VS Code):

  ```bash
  #! /usr/bin/bash
  echo " " >> /tmp/9a74c69a-acdc-4c6d-84a2-0410df8ee480.txt 
  echo " " >>  /tmp/f918b422-751c-423e-bfe1-dbbb2ab4385a.txt 
  sleep 5
  ```

2. Save as BM_test.sh
3. Run the following command to make the bash script executable.

  ```bash
  sudo chmod u+x BM_test.sh
  ```
4. . Run the bash script 

  ```bash
  sudo bash BM_test.sh
  ```

The result shows:

zsh: killed      sudo bash BM_test.sh

The file was quarantined by Defender for Endpoint on macOS. Use the following command to list all the detected threats:

```bash
mdatp threat list
```

The result shows:

ID: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

Name: Behavior: MacOS/MacOSChangeFileTest

Type: "behavior"

Detection time: Tue May 7 20:23:41 2024

Status: "quarantined"

If you have Microsoft Defender for Endpoint P2/P1 or Microsoft Defender for Business, go to the [Microsoft Defender XDR portal](https://security.microsoft.com), and you'll see an alert named: "Suspicious 'MacOSChangeFileTest' behavior was blocked."

