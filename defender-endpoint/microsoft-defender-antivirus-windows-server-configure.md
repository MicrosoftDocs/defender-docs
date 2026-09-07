---
title: Configure Microsoft Defender Antivirus on Windows Server
description: Learn how to enable and configure Microsoft Defender Antivirus on Windows Server 2016 and later as well as Azure Stack HCI OS version 23H2 and later.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: pahuijbr
ms.topic: how-to
ms.date: 06/25/2026
ms.custom: msecd-doc-authoring-1015
ai-usage: ai-assisted
ms.collection: 
- m365-security
- tier2
- m365initiative-defender-endpoint
- mde-ngp
appliesto:
  - Microsoft Defender Antivirus

#customer intent: As a server administrator, I want to enable and configure Microsoft Defender Antivirus on Windows Server so that my servers stay protected.
---

# Configure Microsoft Defender Antivirus on Windows Server

<a name='overview'></a>

By default, Microsoft Defender Antivirus is installed and functional on Windows Server 2016 and later. For Windows Server 2012 R2, Microsoft Defender Antivirus is installed only after the device is onboarded to Microsoft Defender for Endpoint by using the [modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).

Use the procedures in this article to enable the user interface, install or reinstall Microsoft Defender Antivirus, verify that Microsoft Defender Antivirus is running, and update your antimalware security intelligence. You can also set Microsoft Defender Antivirus to passive mode if you use a non-Microsoft antivirus solution on Windows Server.

## Prerequisites

### Supported operating systems

- Windows Server 2016 and later
- Windows Server 2012 R2 (Requires Microsoft Defender for Endpoint)
- Azure Stack HCI OS version 23H2 and later

<a name='enable-the-user-interface-on-windows-server'></a>

## Enable the Microsoft Defender Antivirus user interface on Windows Server 2016

The user interface isn't required; you can use PowerShell, Group Policy, or other methods to manage Microsoft Defender Antivirus. On Windows Server 2016, if your organization prefers to use the user interface, use one of the following procedures to add it. The user interface requires the Desktop Experience installation option; it isn't available on Server Core.

> [!NOTE]
> On Windows Server 2019 and later with the Desktop Experience installation option, the Windows Security app is part of the operating system and isn't installed as a separate feature that you can turn on or turn off.

### Turn on the user interface by using PowerShell

To install the Microsoft Defender Antivirus user interface on Windows Server 2016, run the following command in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**):

```powershell
Install-WindowsFeature -Name Windows-Defender-GUI
```

### Turn on the user interface by using the Add Roles and Features Wizard

On Windows Server 2016, you can install the user interface by using the Add Roles and Features Wizard as described in [Add roles and features to Windows Server](/windows-server/administration/server-manager/add-remove-roles-features?tabs=gui#add-roles-and-features-to-windows-server).

On the **Features** step (Step 7), expand **Windows Defender Features** and then select **GUI for Windows Defender**.

## Install Microsoft Defender Antivirus on Windows Server

Microsoft Defender Antivirus is installed and enabled by default on Windows Server 2016 and later. If you need to reinstall it, use one of the following procedures.

### Use PowerShell to install Microsoft Defender Antivirus

To install or reinstall Microsoft Defender Antivirus on Windows Server 2016 and later, run the following command in an elevated PowerShell session:

```powershell
Install-WindowsFeature -Name Windows-Defender
```

### Use the Add Roles and Features Wizard to install Microsoft Defender Antivirus on Windows Server 2016

On Windows Server 2016, you can install Microsoft Defender Antivirus by using the Add Roles and Features Wizard as described in [Add roles and features to Windows Server](/windows-server/administration/server-manager/add-remove-roles-features?tabs=gui#add-roles-and-features-to-windows-server).

On the **Features** step (Step 7), expand **Windows Defender Features** and then select **Windows Defender**.

As described in [Enable the Microsoft Defender Antivirus user interface on Windows Server 2016](#enable-the-microsoft-defender-antivirus-user-interface-on-windows-server-2016), you can also select **GUI for Windows Defender** to install the user interface.

## Verify Microsoft Defender Antivirus is running

After you install Microsoft Defender Antivirus, verify that it's running. You can use either PowerShell or Command Prompt.

- **PowerShell**: Run the following command:

  ```powershell
  Get-Service -Name windefend
  ```

- **Command Prompt**: Run the following command:

  ```cmd
  sc query Windefend
  ```

> [!NOTE]
> Event messages for the antimalware engine included with Microsoft Defender Antivirus can be found in [Microsoft Defender Antivirus Events](troubleshoot-microsoft-defender-antivirus.yml).

## Update antimalware security intelligence

To get your regular security intelligence updates on Windows Server, the Windows Update service must be running. If you use an update management service, like Windows Server Update Services (WSUS), make sure Microsoft Defender Antivirus security intelligence updates are approved for the computers you manage.

By default, Windows Update doesn't download and install updates automatically on Windows Server 2016 and later, or on Azure Stack HCI OS version 23H2 and later. On Windows Server, you can change this configuration by using one of the following methods:

- **Windows Update in Control Panel**:
  - **Install updates automatically** installs all updates automatically, including Microsoft Defender Antivirus security intelligence updates.
  - **Download updates but let me choose whether to install them** lets Microsoft Defender Antivirus download and install security intelligence updates automatically, but other updates aren't installed automatically.

- **Group Policy**: Enable the **Configure Automatic Updates** policy at **Computer Configuration\Administrative Templates\Windows Components\Windows Update\Configure Automatic Updates**, and then select one of the following options:
  - **4 - Auto download and schedule the install** installs all updates automatically, including Microsoft Defender Antivirus security intelligence updates.
  - **3 - Auto download and notify for install** lets Microsoft Defender Antivirus download and install security intelligence updates automatically, but other updates aren't installed automatically.

- **The registry**: Set the `AUOptions` value under `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU` to one of the following `REG_DWORD` values to let Windows Update automatically download and install security intelligence updates:
  - **4** (**Install updates automatically**) installs all updates automatically, including Microsoft Defender Antivirus security intelligence updates.
  - **3** (**Download updates but let me choose whether to install them**) lets Microsoft Defender Antivirus download and install security intelligence updates automatically, but other updates aren't installed automatically.

To maintain protection from malware, keep the following Microsoft Defender Antivirus services and dependent services running. If any of these services are stopped, start them and set them to start automatically.

- **Windows Defender Service** (`WinDefend`): The main Microsoft Defender Antivirus service, which must always be running. Located at `C:\Program Files\Windows Defender\MsMpEng.exe`.
- **Windows Error Reporting Service** (`Wersvc`): Sends error reports back to Microsoft. Hosted by `svchost.exe -k WerSvcGroup`.
- **Windows Firewall** (`MpsSvc`): We recommend keeping this service enabled. Hosted by `svchost.exe -k LocalServiceNoNetwork`.
- **Windows Update** (`Wuauserv`): Required to get security intelligence updates and antimalware engine updates. Hosted by `svchost.exe -k netsvcs`.

## Microsoft Defender Antivirus modes on Windows Server

On Windows Server, Microsoft Defender Antivirus can run in active mode or passive mode, and its behavior depends on whether the server is onboarded to Defender for Endpoint.

In platform version 4.18.2208.0 (September 2022) or later, if a server is onboarded to Defender for Endpoint, the **Turn off Windows Defender** setting in [Group Policy](configure-endpoints-gp.md#update-endpoint-protection-configuration) no longer completely disables Microsoft Defender Antivirus on Windows Server 2012 R2 and later. Instead, it places Microsoft Defender Antivirus into passive mode.

If **Turn off Windows Defender** is already set before you onboard the device to Defender for Endpoint, there's no change and Microsoft Defender Antivirus remains disabled.

To switch Microsoft Defender Antivirus to passive mode, even if it was disabled before onboarding, apply the [ForceDefenderPassiveMode configuration](switch-to-mde-phase-2.md#manually-set-microsoft-defender-antivirus-to-passive-mode-on-windows-server) with a value of `1`. To place it into active mode, set this value to `0` instead.

> [!IMPORTANT]
> When tamper protection is enabled, the logic for `ForceDefenderPassiveMode` changes. After Microsoft Defender Antivirus is toggled to active mode, [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) prevents it from going into passive mode, even if `ForceDefenderPassiveMode` is set to `1`.

<a name='what-happens-if-a-non-microsoft-antivirus-product-is-uninstalled'></a>

## Reactivate Microsoft Defender Antivirus after uninstalling a non-Microsoft product

If a non-Microsoft antivirus product is installed on Windows Server, Microsoft Defender Antivirus is probably set to passive mode. When the non-Microsoft antivirus product is uninstalled, Microsoft Defender Antivirus should switch to active mode automatically. However, that switch might not occur on certain versions of Windows Server, such as Windows Server 2016, where Microsoft Defender Antivirus can remain in passive mode or stay disabled. Use the following procedure to check the status of Microsoft Defender Antivirus, and if necessary, set it to active mode:

1. Check the status of Microsoft Defender Antivirus by following the guidance in [Verify Microsoft Defender Antivirus is running](#verify-microsoft-defender-antivirus-is-running) (in this article).

1. If necessary, set Microsoft Defender Antivirus to active mode manually by following these steps:
   1. On the server, open Notepad and copy the following text:

      ```text
      Windows Registry Editor Version 5.00

      [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection]
      "ForceDefenderPassiveMode"=dword:00000000
      ```

   1. Save the file with a `.reg` extension in a location that's easy to find, such as `C:\Data\ForceDefenderActiveMode.reg`.
   1. In File Explorer, right-click the `.reg` file, select **Merge**, and then confirm the prompt to add the entry to the registry. You need administrator permissions to make this change.
   1. Restart the server.

> [!TIP]
> If you still need help, see the following troubleshooting items:
>
> - [Microsoft Defender Antivirus seems to be stuck in passive mode](switch-to-mde-troubleshooting.md#microsoft-defender-antivirus-seems-to-be-stuck-in-passive-mode).
> - [I'm having trouble re-enabling Microsoft Defender Antivirus on Windows Server 2016](switch-to-mde-troubleshooting.md#im-having-trouble-re-enabling-microsoft-defender-antivirus-on-windows-server-2016).

## See also

- [Turn on cloud protection in Microsoft Defender Antivirus](enable-cloud-protection-microsoft-defender-antivirus.md)
- [Configure Microsoft Defender Antivirus exclusions on Windows Server](microsoft-defender-antivirus-exclusions-windows-server.md)
- [Microsoft Defender Antivirus in Windows](microsoft-defender-antivirus-windows.md)
- [Microsoft Defender Antivirus compatibility with other security products](microsoft-defender-antivirus-compatibility.md)
- [Performance analyzer for Microsoft Defender Antivirus](tune-performance-defender-antivirus.md)
- [Troubleshoot performance issues related to real-time protection](troubleshoot-performance-issues.md)
- [Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md)
