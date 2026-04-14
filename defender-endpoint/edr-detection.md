---
title: EDR detection test for verifying device's onboarding and reporting service
description: EDR detection test to verify the device's proper onboarding and reporting to the service.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-macos
ms.custom: admindeeplinkDEFENDER
ms.topic: how-to
ms.subservice: edr
ms.date: 01/15/2026
appliesto:
    - Microsoft Defender for Endpoint Plan 2
    - Microsoft Defender for Business

---

# EDR detection test for verifying device's onboarding and reporting services

## Prerequisites

- Windows client devices must be running Windows 11, Windows 10 version 1709 build 16273 or newer, Windows 8.1, or Windows 7 SP1.
- Windows server devices must be running Windows Server 2008 R2 SP1, Windows Server 2012 R2 and later, or Azure Stack HCI OS, version 23H2 and later.
- Linux servers must be running a supported version (see [Prerequisites for Microsoft Defender for Endpoint on Linux](mde-linux-prerequisites.md))
- Devices must be onboarded to Defender for Endpoint

Endpoint detection and response for Endpoint provide advanced attack detections that are near real-time and actionable. Security analysts can prioritize alerts effectively, gain visibility into the full scope of a breach, and take response actions to remediate threats. You can run an EDR detection test to verify that the device is properly onboarded and reporting to the service. This article describes how to run an EDR detection test on a newly onboarded device.

### Windows

> [!TIP]
> The Windows device must be listening for requests on TCP port 80 for the following commands to work. You can verify by running the following PowerShell command: `Test-NetConnection 127.0.0.1 -Port 80`.

In a Command Prompt window, run the following commands:

```dos
powershell.exe -NoExit -ExecutionPolicy Bypass -WindowStyle Hidden $ErrorActionPreference='silentlycontinue';(New-Object System.Net.WebClient).DownloadFile('http://127.0.0.1/1.exe', 'C:\\test-WDATP-test\\invoice.exe');Start-Process 'C:\\test-WDATP-test\\invoice.exe'
```

If successful, the detection test is marked as completed and a new alert appears within a few minutes.

### Linux

1. Download [script file](https://aka.ms/MDE-Linux-EDR-DIY) to an onboarded Linux server.

   ```bash
   curl -o ~/Downloads/MDE-Linux-EDR-DIY.zip -L https://aka.ms/MDE-Linux-EDR-DIY
   ```

1. Extract the zipped folder.

   ```bash
   unzip ~/Downloads/MDE-Linux-EDR-DIY.zip
   ```

1. Run the following command to give the script executable permission:

   ```bash
   chmod +x ./mde_linux_edr_diy.sh
   ```

1. Run the following command to execute the script:

   ```bash
   ./mde_linux_edr_diy.sh
   ```

   After a few minutes, a detection should be raised in the [Microsoft Defender portal](https://security.microsoft.com). Look at the alert details, machine timeline, and perform your typical investigation steps.

### macOS

1. In your browser, Microsoft Edge for Mac or Safari, download *MDATP macOS DIY.zip* from [https://aka.ms/mdatpmacosdiy](https://aka.ms/mdatpmacosdiy) and extract the zipped folder.

      The following prompt appears:

      > Do you want to allow downloads on "mdatpclientanalyzer.blob.core.windows.net"?<br/>
      > You can change which websites can download files in **Websites Preferences**.

1. Select **Allow**.

1. Open **Downloads**.

1. You must be able to see **MDATP MacOS DIY**.

   > [!TIP]
   > If you double-click **MDATP MacOS DIY**, you'll get the following message:
   >
   > > **"MDATP MacOS DIY" cannot be opened because the developer cannot be verified.**<br/>
   > > macOS cannot verify that this app is free from malware.<br/>
   > > **[Move to Trash]** **[Done]**

1. Click **Done**.

1. Right-click **MDATP MacOS DIY**, and then click **Open**.

    The system displays the following message:

    > **macOS cannot verify the developer of MDATP MacOS DIY. Are you sure you want to open it?**<br/>
    > By opening this app, you will be overriding system security which can expose your computer and personal information to malware that may harm your Mac or compromise your privacy.

1. Click **Open**.

    The system displays the following message:

    > Microsoft Defender for Endpoint - macOS EDR DIY test file<br/>
    > Corresponding alert will be available in the MDATP portal.

1. Click **Open**.

    In few minutes, an alert *macOS EDR Test Alert* is raised.

1. Go to Microsoft Defender portal (https://security.microsoft.com/).

1. Go to the **Alert** Queue.

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
