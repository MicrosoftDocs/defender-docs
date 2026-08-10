---
title: Microsoft Defender for Endpoint Network protection demonstrations
description: Shows how Network protection prevents employees from using any application to access dangerous domains that might host phishing scams, exploits, and other malicious content on the Internet.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier2
- demo
ms.topic: how-to
ms.subservice: asr
ms.date: 07/03/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---
# Network protection demonstrations

Network Protection helps reduce the attack surface of your devices from Internet-based events. It prevents employees from using any application to access dangerous domains that might host phishing scams, exploits, and other malicious content on the Internet.

This article walks you through how to demonstrate and test Network Protection on Windows, macOS, and Linux devices. You'll enable Network Protection, navigate to a test site, and verify that the connection is blocked as expected.

## Prerequisites

- Client devices must be running Windows 11, Windows 10 version 1709 build 16273 or newer, or macOS
- Server devices must be running Windows Server 2012 R2 (with the new unified client) and later, Linux, or Azure Stack HCI OS, version 23H2 and later.
- Microsoft Defender Antivirus

## Windows

To enable Network Protection in block mode on Windows so that connections to dangerous domains are blocked, run the following PowerShell command:

```powershell
Set-MpPreference -EnableNetworkProtection Enabled
```

Following are the Rule states:

|State | Mode| Numeric value |
|:---|:---|:---|
| Disabled | = Off | 0 |
| Enabled | = Block mode | 1 |
| Audit | = Audit mode | 2 |

To verify that Network Protection is enabled, run the following PowerShell command and confirm that the `EnableNetworkProtection` value is set to `1` (block mode):

```powershell
Get-MpPreference
```

**Consider the following scenario**:

1. Enable Network Protection in block mode so that connections to dangerous domains are blocked during the following validation steps:

   ```powershell
   Set-MpPreference -EnableNetworkProtection Enabled
   ```

1. Using the browser of your choice (not Microsoft Edge*), navigate to the [Network Protection website test](https://smartscreentestratings2.net/). Microsoft Edge has other security measures in place to protect from malicious or phishing websites (SmartScreen).

Following are the expected results:

Navigation to the website should be blocked and you should see a **Connection blocked** notification.

After testing, restore your device to its pre-test configuration by disabling Network Protection with the following command:

```powershell
Set-MpPreference -EnableNetworkProtection Disabled
```

## macOS/Linux

On macOS and Linux, you use the `mdatp` command-line tool to set the Network Protection enforcement level. Replace `[enforcement-level]` with `block` to actively block dangerous connections, or `audit` to log them without blocking. Run the following command from the Terminal:


```bash
mdatp config network-protection enforcement-level --value [enforcement-level]
```

For example, to set Network Protection to block mode so that connections to malicious or test destinations are actively prevented, run the following command:


```bash
mdatp config network-protection enforcement-level --value block
```

To verify that Network Protection is running, query the Defender health status by running the following command from the Terminal. The `network_protection_status` field should display `started`:


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

After testing, restore your device to its pre-test configuration by switching Network Protection back to audit mode. In audit mode, Network Protection logs connections to dangerous domains without blocking them:

```bash
mdatp config network-protection enforcement-level --value audit
```

<a name="see-also"></a>
## Related content

- For an overview of Network Protection capabilities, see [Network Protection](network-protection.md).
- For other demonstration scenarios, see [Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md).


