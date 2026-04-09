---
title: Microsoft Defender for Endpoint Network protection demonstrations
description: Shows how Network protection prevents employees from using any application to access dangerous domains that might host phishing scams, exploits, and other malicious content on the Internet.
search.appverid: met150
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier2
- demo
ms.topic: how-to
ms.subservice: asr
ms.date: 03/04/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Antivirus

---
# Network protection demonstrations

Network Protection helps reduce the attack surface of your devices from Internet-based events. It prevents employees from using any application to access dangerous domains that might host phishing scams, exploits, and other malicious content on the Internet.

## Prerequisites

- Client devices must be running Windows 11, Windows 10 version 1709 build 16273 or newer, or macOS
- Server devices must be running Windows Server 2012 R2 (with the new unified client) and later, Linux, or Azure Stack HCI OS, version 23H2 and later.
- Microsoft Defender Antivirus

## Windows

Run the following PowerShell command:

```powershell
Set-MpPreference -EnableNetworkProtection Enabled
```

Following are the Rule states:

|State | Mode| Numeric value |
|:---|:---|:---|
| Disabled | = Off | 0 |
| Enabled | = Block mode | 1 |
| Audit | = Audit mode | 2 |

Verify the configuration using the following PowerShell command:

```powershell
Get-MpPreference
```

**Consider the following scenario**:

1. Turn on Network Protection using PowerShell command:

   ```powershell
   Set-MpPreference -EnableNetworkProtection Enabled
   ```

1. Using the browser of your choice (not Microsoft Edge*), navigate to the [Network Protection website test](https://smartscreentestratings2.net/). Microsoft Edge has other security measures in place to protect from this vulnerability (SmartScreen).

Following are the expected results:

Navigation to the website should be blocked and you should see a **Connection blocked** notification.

Run the following command to Clean-up:

```powershell
Set-MpPreference -EnableNetworkProtection Disabled
```

## macOS/Linux

To configure the Network Protection enforcement level, run the following command from the Terminal:


```bash
mdatp config network-protection enforcement-level --value [enforcement-level]
```

For example, to configure network protection to run in blocking mode, execute the following command:


```bash
mdatp config network-protection enforcement-level --value block
```

To confirm that network protection has started successfully, run the following command from the Terminal, and verify that it prints "started":


```bash
mdatp health --field network_protection_status
```

To test Network Protection on macOS/Linux:

1. Using the browser of your choice (not Microsoft Edge), navigate to the [Network Protection website test](https://smartscreentestratings2.net/). Microsoft Edge has other security measures in place to protect from this vulnerability (SmartScreen).
1. Or run the following command from the terminal: 

    ```bash
    curl -o ~/Downloads/smartscreentestratings2.net https://smartscreentestratings2.net/ 
    ```

Following are the expected results:

Navigation to the website should be blocked and you should see a **Connection blocked** notification.

Run the following command to Clean-up:

```bash
mdatp config network-protection enforcement-level --value audit
```

## See also

[Network Protection](network-protection.md)

[Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md)


