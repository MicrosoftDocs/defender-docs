---
title: Run a detection test on a device recently onboarded to Microsoft Defender for Endpoint
description: Run the detection test script on a device recently onboarded to the Microsoft Defender for Endpoint service to verify that it's properly added.
search.appverid: met150
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
ms.date: 03/01/2025
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.topic: how-to
ms.subservice: onboard
---

# Run a detection test on a device recently onboarded to Microsoft Defender for Endpoint

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**
- Windows Server 2012 R2
- Windows Server 2016
- Windows Server 2019
- Windows Server 2022
- Windows Server 2025
- [Microsoft Defender for Endpoint Plan 1 and 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

When you add a device to the Microsoft Defender for Endpoint service for management, it's referred to as onboarding. Onboarding allows devices to report signals about their health status to the service.

Verifying that a device is added to the service successfully is a critical step in the entire deployment process. It helps ensure that all the devices expected are being managed. 

## Verify Microsoft Defender for Endpoint onboarding of a device using a PowerShell detection test

Run the following PowerShell script on a newly onboarded device to verify that it's properly reporting to the Defender for Endpoint service.

1. On the device, open Command Prompt as an administrator. 

2. At the prompt, copy and run the following command:

   ```powershell
   powershell.exe -NoExit -ExecutionPolicy Bypass -WindowStyle Hidden $ErrorActionPreference = 'silentlycontinue';(New-Object System.Net.WebClient).DownloadFile('http://127.0.0.1/1.exe', 'C:\\test-MDATP-test\\invoice.exe');Start-Process 'C:\\test-MDATP-test\\invoice.exe'
   ```

The Command Prompt window closes automatically. If successful, a new alert appears in the portal for the onboarded device in about 10 minutes.

> [!NOTE]
> You can also [use the EICAR test string](/defender-endpoint/configure-extension-file-exclusions-microsoft-defender-antivirus) to perform this test. You will receive a notification on the endpoint and an alert in the Microsoft Defender portal.

## Related articles

- [Onboard client devices](onboard-client.md)
- [Onboard servers](onboard-server.md)
- [Troubleshoot Microsoft Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
