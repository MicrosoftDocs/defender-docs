---
title: Manual deployment for Microsoft Defender for Endpoint on macOS
description: Install Microsoft Defender for Endpoint on macOS manually, from the command line.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-macos
ms.custom: admindeeplinkDEFENDER
ms.topic: install-set-up-deploy
ms.subservice: macos
ms.date: 05/01/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Manual deployment for Microsoft Defender for Endpoint on macOS


> Want to experience Defender for Endpoint? [Sign up for a free trial](https://go.microsoft.com/fwlink/p/?linkid=2225630).

This article describes how to deploy Microsoft Defender for Endpoint on macOS manually. A successful deployment requires the completion of all of the following steps:

- [Download installation and onboarding packages](#download-installation-and-onboarding-packages)
- [Application installation (macOS 13 and newer versions)](#application-installation-macos-13-and-newer-versions)
- [Onboarding Package](#onboarding-package)
- [Grant Full Disk Access](#allow-full-disk-access)
- [Ensure Background Execution](#background-execution)

## Prerequisites and system requirements

Before you get started, see [the main Microsoft Defender for Endpoint on macOS page](microsoft-defender-endpoint-mac.md) for a description of prerequisites and system requirements for the current software version.

> [!IMPORTANT]
> Manual installation of Microsoft Defender for Endpoint on macOS requires changes to the Privacy & Security Settings on macOS.  Please consult Apple's documentation for details.  
> - [Change Privacy & Security settings on MacOS Sonoma 14](https://support.apple.com/guide/mac-help/change-privacy-security-settings-on-mac-mchl211c911f/14.0/mac/14.0)
> -  [Change Privacy & Security settings on MacOS Sequoia 15](https://support.apple.com/guide/mac-help/change-privacy-security-settings-on-mac-mchl211c911f/15.0/mac/15.0)
> - [Change Privacy & Security settings on MacOS Tahoe 26](https://support.apple.com/guide/mac-help/change-privacy-security-settings-on-mac-mchl211c911f/mac)

## Download installation and onboarding packages

Download the installation and onboarding packages from Microsoft Defender portal.

[!INCLUDE [Defender for Endpoint repackaging warning](../includes/repackaging-warning.md)]

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings > Endpoints > Device management > Onboarding**.

1. In Section 1 of the page, set operating system to **macOS** and Deployment method to **Local script**.

1. In Section 2 of the page, select **Download installation package**. Save it as wdav.pkg to a local directory.

1. In Section 2 of the page, select **Download onboarding package**. Save it as WindowsDefenderATPOnboardingPackage.zip to the same directory.

1. From a command prompt, verify that you have the two files.
    - Type *cd Downloads* and press **Enter**.
    - Type *ls* and press **Enter**.

1. Copy the *wdav.pkg* and *MicrosoftDefenderATPOnboardingMacOs.sh* to the device where you want to deploy the Microsoft Defender for Endpoint on macOS.

## Application installation (macOS 13 and newer versions)

To complete this process, you must have admin privileges on the device.

Do one of the following steps:

- Navigate to the downloaded *wdav.pkg* in **Finder** and open it.

   Or

- You can download the *wdav.pkg*- from **Terminal**.
   
     ```console
     sudo installer -pkg /Users/admin/Downloads/wdav.pkg -target /
     ```

1. Select **Continue**.

1. Read through the **Software License Agreement** and select **Continue** to agree with the terms.

1. Read through the *End-User License Agreement (EULA)* and select **Agree**.

1. From **Destination Select**, select the disk where you want to install the Microsoft Defender Software, for example, *Macintosh HD* and select **Continue**.

   > [!NOTE]
   > The amount of disk space required for installation is around 777 MB.

1. To change the installation destination, select **Change Install Location...**.

1. Select **Install**.

1. Enter the password, when prompted.

1. Select **Install Software**.

1. At the end of the installation process, for macOS Ventura (13.0) or latest version, you're prompted to approve the system extensions used by the product. Select **Open Security Preferences**.

1. To enable system extension, select **Details**.


1. From the **Security & Privacy** window, select the checkboxes next to **Microsoft Defender** and select **OK**.

1. Repeat steps 11 and 12 for all system extensions distributed with Microsoft Defender for Endpoint on macOS.

1. As part of the Endpoint Detection and Response capabilities, Microsoft Defender for Endpoint on macOS inspects socket traffic and reports this information to the Microsoft Defender portal. When prompted to grant Microsoft Defender for Endpoint permissions to filter network traffic, select **Allow**.


    To troubleshoot System Extension issues, refer [Troubleshoot System Extension](mac-support-sys-ext.md).

## Allow Full Disk Access

The macOS Catalina (10.15) and newer versions require full disk access to be granted to **Microsoft Defender for Endpoint** in order to be able to protect and monitor.

> [!NOTE]
> Full disk access grant to **Microsoft Defender for Endpoint** is a new requirement for non-Microsoft software by Apple for files and folders containing personal data.

To grant full disk access:

1. Open **System Preferences** \> **Security & Privacy** \> **Privacy** \> **Full Disk Access**. Select the lock icon to make changes (bottom of the dialog box).

1. Grant **Full Disk Access** permission to **Microsoft Defender** and **Microsoft Defenders Endpoint Security Extension**.

1. Select **General** \> **Restart** for the new system extensions to take effect.

1. Enable *Potentially Unwanted Application* (PUA) in block mode.

   To enable PUA, refer [configure PUA protection](mac-pua.md).

1. Enable *Network Protection*.

   To enable *Network protection*, refer [manual deployment](network-protection-macos.md).

1. Enable *Device Control*.

   To enable *Device Control*, refer [device control for macOS](mac-device-control-overview.md).

1. Enable *Tamper Protection* in block mode.

   To enable *Tamper Protection*, refer [Protect macOS security settings with tamper protection](tamperprotection-macos.md).

1. If you have the *Microsoft Purview – Endpoint data loss prevention license*,  you can review [Get started with Microsoft Purview - Endpoint data loss prevention](/purview/endpoint-dlp-getting-started).


## Background execution

Starting with macOS 13, a user must explicitly allow an application to run in background.
macOS will pop a prompt up, telling the user that Microsoft Defender can run in background.


You can view applications permitted to run in background in System Settings => sign in Items => Allow in the Background at any time:


Make sure all Microsoft Defender and Microsoft Corporation items are enabled. If they're disabled, then macOS won't start Microsoft Defender after a machine restart.

## Bluetooth permissions

Starting with macOS 14, a user must explicitly allow an application to access Bluetooth.
macOS will pop a prompt up, telling the user that Microsoft Defender can access Bluetooth (applies only if you use Bluetooth based policies for Device Control).
Select Allow to grant Microsoft Defender to access Bluetooth.


You can confirm that permissions are granted in System Settings => Privacy Settings => Bluetooth.

## Onboarding Package

Once you install the MDE on macOS client, you must now onboard the package, which registers to your Microsoft Defender for Endpoint tenant and licenses it.

1. Verify if MDE on macOS is onboard.

   Copy *wdav.pkg* and *MicrosoftDefenderATPOnboardingMacOs.sh* to the device where you deployed Microsoft Defender for Endpoint on macOS.

   The client device isn't associated with *org_id*. The *org_id* attribute is blank.

   ```bash
   mdatp health --field org_id
   ```

1. Run the Bash script to install the onboarding package:

   ```bash
   sudo bash -x MicrosoftDefenderATPOnboardingMacOs.sh
   ```

1. Verify that the device is now associated with your organization and reports a valid org ID:

   ```bash
   mdatp health --field org_id
   ```

   After installation, you'll see the Microsoft Defender icon in the macOS status bar in the top-right corner.

   > [!div class="mx-imgBorder"]
   > :::image type="content" source="media/mdatp-icon-bar.png" alt-text="Screenshot that shows the Microsoft Defender icon in status bar":::

   You can [troubleshoot license issues for Microsoft Defender for Endpoint on macOS](mac-support-license.md).

1. Run the connectivity test.

   ```bash
   mdatp connectivity test
   ```

You can [troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on macOS](troubleshoot-cloud-connect-mdemac.md).

## Verifying anti-malware detection

See the following article to test for anti-malware detection review: [Antivirus detection test to verify device onboarding and reporting services](validate-antimalware.md)

## Verifying EDR detection

See the following article to test for an EDR detection review: [EDR detection test to verify device onboarding and reporting services](edr-detection.md).

## Logging installation issues

For more information on how to find the automatically generated log that's created by the installer, see [Logging installation issues](mac-resources.md#logging-installation-issues).

For information on troubleshooting procedures, see:

- [Troubleshoot system extension issues in Microsoft Defender for Endpoint on macOS](mac-support-sys-ext.md)
- [Troubleshoot installation issues for Microsoft Defender for Endpoint on macOS](mac-support-install.md)
- [Troubleshoot license issues for Microsoft Defender for Endpoint on macOS](mac-support-license.md)
- [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on macOS](troubleshoot-cloud-connect-mdemac.md)
- [Troubleshoot performance issues for Microsoft Defender for Endpoint on macOS](mac-support-perf.md)

## Uninstallation

See [Uninstalling](mac-resources.md#uninstalling) for details on how to remove Microsoft Defender for Endpoint on macOS from client devices.

> [!TIP]
> - If you have any feedback that you like to share, submit it by opening Microsoft Defender Endpoint on macOS on your device and navigate to **Help** \> **Send feedback**.

## Recommended content

- [Learn how to install, configure, update, and use Microsoft Defender for Endpoint on macOS](microsoft-defender-endpoint-mac.md).
- [Learn how to set up the Microsoft Defender for Endpoint on macOS policies in Jamf](mac-jamfpro-policies.md).
- [Learn how to deploy Microsoft Defender for Endpoint on macOS with Jamf Pro](mac-install-with-jamf.md).
- [Learn how to troubleshoot license issues in Microsoft Defender for Endpoint on Mac](mac-support-license.md).
- [Learn how to use resources for Microsoft Defender for Endpoint on macOS, including how to uninstall it, how to collect diagnostic logs, CLI commands, and known issues with the product](mac-resources.md).
- [Learn how to configure Microsoft Defender for Endpoint on macOS in enterprise organizations](mac-preferences.md).
- [Learn how to install Microsoft Defender for Endpoint on macOS on other management solutions](mac-install-with-other-mdm.md).
- [Learn how to detect and block Potentially Unwanted Applications (PUA) using Microsoft Defender for Endpoint on macOS](mac-pua.md).

