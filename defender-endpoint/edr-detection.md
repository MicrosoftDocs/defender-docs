---
title: EDR detection test for verifying device's onboarding and reporting service
description: Run the EDR detection test to confirm a device is correctly onboarded and reporting to Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-macos
ms.custom: admindeeplinkDEFENDER, msecd-doc-authoring-1014
ms.topic: how-to
ms.subservice: edr
ms.date: 06/17/2026
appliesto:
    - Microsoft Defender for Endpoint Plan 2
    - Microsoft Defender for Business

ai-usage: ai-assisted
---

# EDR detection test for verifying device's onboarding and reporting services

## Prerequisites

- Windows client devices must be running Windows 11, Windows 10 version 1709 build 16273 or newer, Windows 8.1, or Windows 7 SP1.
- Windows server devices must be running Windows Server 2008 R2 SP1, Windows Server 2012 R2 and later, or Azure Stack HCI OS, version 23H2 and later.
- Linux servers must be running a supported version (see [Prerequisites for Microsoft Defender for Endpoint on Linux](mde-linux-prerequisites.md))
- Devices must be onboarded to Defender for Endpoint

Endpoint detection and response (EDR) in Microsoft Defender for Endpoint provides advanced, near real-time, actionable detections. Security analysts can prioritize alerts effectively, gain visibility into the full scope of a breach, and take response actions to remediate threats. You can run an EDR detection test to verify that the device is properly onboarded and reporting to the service. This article describes how to run an EDR detection test on a newly onboarded device.

## Run an EDR detection test

<a name="windows"></a>
### Run the EDR detection test on Windows

> [!TIP]
> The Windows device must be listening for requests on TCP port 80 for the following commands to work. You can verify by running the following PowerShell command: `Test-NetConnection 127.0.0.1 -Port 80`.

In a Command Prompt window, run the following commands:

```dos
powershell.exe -NoExit -ExecutionPolicy Bypass -WindowStyle Hidden $ErrorActionPreference='silentlycontinue';(New-Object System.Net.WebClient).DownloadFile('http://127.0.0.1/1.exe', 'C:\\test-WDATP-test\\invoice.exe');Start-Process 'C:\\test-WDATP-test\\invoice.exe'
```

If the command runs successfully and the test file executes, the detection test is marked as completed and a new alert appears within a few minutes.

<a name="linux"></a>
### Run the EDR detection test on Linux

Perform the following steps to run the EDR detection test on Linux.

1. Download the MDE Linux EDR DIY package to an onboarded Linux server so you can extract and run the test script locally. For more information, see the [script file](https://aka.ms/MDE-Linux-EDR-DIY).

   ```bash
   curl -o ~/Downloads/MDE-Linux-EDR-DIY.zip -L https://aka.ms/MDE-Linux-EDR-DIY
   ```

1. Extract the downloaded archive to access the DIY test script and supporting files.

   ```bash
   unzip ~/Downloads/MDE-Linux-EDR-DIY.zip
   ```

1. Make the script executable so it can be launched from the terminal:

   ```bash
   chmod +x ./mde_linux_edr_diy.sh
   ```

1. Run the DIY script to start the EDR test scenario and verify endpoint detection behavior:

   ```bash
   ./mde_linux_edr_diy.sh
   ```

   After a few minutes, a detection should be raised in the [Microsoft Defender portal](https://security.microsoft.com). Look at the alert details, machine timeline, and perform your typical investigation steps.

<a name="macos"></a>
### Run the EDR detection test on macOS

Perform the following steps to run the EDR detection test on macOS.

1. In your browser, Microsoft Edge for Mac or Safari, download *MDATP macOS DIY.zip* from the [macOS EDR DIY test file download page](https://aka.ms/mdatpmacosdiy) and extract the zipped folder.

      The following prompt appears:

      > Do you want to allow downloads on "mdatpclientanalyzer.blob.core.windows.net"?<br/>
      > You can change which websites can download files in **Websites Preferences**.

1. Select **Allow** to permit downloads from "mdatpclientanalyzer.blob.core.windows.net".

1. Open **Downloads**.

1. You must be able to see **MDATP MacOS DIY**.

   > [!TIP]
   > If you double-click **MDATP MacOS DIY**, you'll get the following message:
   >
   > > **"MDATP MacOS DIY" cannot be opened because the developer cannot be verified.**<br/>
   > > macOS cannot verify that this app is free from malware.<br/>
   > > **[Move to Trash]** **[Done]**

1. In the developer-verification warning dialog, click **Done**.

1. Right-click **MDATP MacOS DIY**, and then click **Open**.

    The system displays the following message:

    > **macOS cannot verify the developer of MDATP MacOS DIY. Are you sure you want to open it?**<br/>
    > By opening this app, you will be overriding system security which can expose your computer and personal information to malware that may harm your Mac or compromise your privacy.

1. In the macOS security confirmation dialog, click **Open**.

    The system displays the following message:

    > Microsoft Defender for Endpoint - macOS EDR DIY test file<br/>
    > Corresponding alert will be available in the MDATP portal.

1. In the EDR DIY test file dialog, click **Open**.

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
