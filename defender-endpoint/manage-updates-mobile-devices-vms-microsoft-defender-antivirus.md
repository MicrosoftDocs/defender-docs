---
title: Define how mobile devices are updated by Microsoft Defender Antivirus
description: Configure Microsoft Defender Antivirus protection update behavior for mobile devices and VMs, including Microsoft Update fallback and battery-power settings.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1015
ms.reviewer: yongrhee
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
ms.date: 08/12/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
#customer intent: As a security administrator, I want to configure protection update behavior for mobile devices and virtual machines so that updates follow my organization's connectivity and battery-power requirements.
---

# Manage updates for mobile devices and virtual machines (VMs)

This article explains how to configure Microsoft Defender Antivirus update settings for mobile devices and virtual machines (VMs) to reduce performance impact during updates. Mobile devices and VMs may require more configuration to ensure performance is not impacted by updates.

For Microsoft Defender Antivirus, two update-related settings are especially useful for mobile devices and VMs:

- Opt in to Microsoft Update on mobile computers without a WSUS connection
- Prevent Security intelligence updates when running on battery power

The following articles may also be useful in these situations:

- [About scheduled scans](schedule-antivirus-scans.md)
- [Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md)
- [Deployment guide for Microsoft Defender Antivirus in a virtual desktop infrastructure (VDI) environment](deployment-vdi-microsoft-defender-antivirus.md)

## Prerequisites

Before you configure the update settings described in this article, make sure your environment meets the following requirements.

### Supported operating systems

The following operating systems are supported:

- Windows

## Opt in to Microsoft Update on mobile computers without a WSUS connection

You can use Microsoft Update to keep Security intelligence on mobile devices running Microsoft Defender Antivirus up to date when they are not connected to the corporate network or don't otherwise have a WSUS connection.

Opting in to Microsoft Update means that protection updates can be delivered to devices (via Microsoft Update) even if you have set WSUS to override Microsoft Update.

You can opt in to Microsoft Update on the mobile device in one of the following ways:

- Change the setting with Group Policy.
- Use a VBScript to create a script, then run it on each computer in your network.
- Manually opt in every computer on your network through the **Settings** menu.

### Use Group Policy to opt in to Microsoft Update

Perform the following steps to enable Microsoft Update by using Group Policy:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Group Policy paths before Windows 10, version 1909 (November 2019) might use _Signature Updates_ instead of _Security Intelligence Updates_. The older and newer names refer to the same policy locations.

1. In the details pane of **Security Intelligence Updates**, open the **Allow security intelligence updates from Microsoft Update** setting. To open the setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

1. In the setting window that opens, select **Enabled**, and then select **OK**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

### Use a VBScript to opt in to Microsoft Update

Use the following process to create and run a VBScript that opts devices in to Microsoft Update:

1. Use the instructions in the MSDN article [Opt-In to Microsoft Update](/windows/win32/wua_sdk/opt-in-to-microsoft-update) to create the VBScript.

1. Run the VBScript you created on each computer in your network.

### Manually opt in to Microsoft Update

To manually opt a device in to Microsoft Update, complete the following steps:

1. Open **Windows Update** in **Update & security** settings on the computer you want to opt in.

1. Select **Advanced** options.

1. Select the checkbox for **Give me updates for other Microsoft products when I update Windows**.

## Prevent Security intelligence updates when running on battery power

You can configure Microsoft Defender Antivirus to only download protection updates when the PC is connected to a wired power source.

### Use Group Policy to prevent security intelligence updates on battery power

Perform the following steps to prevent security intelligence updates when devices are running on battery power:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Group Policy paths before Windows 10, version 1909 (November 2019) might use _Signature Updates_ instead of _Security Intelligence Updates_. The older and newer names refer to the same policy locations.

1. In the details pane of **Security Intelligence Updates**, open the **Allow security intelligence updates when running on battery power** setting. To open the setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

1. In the setting window that opens, select **Disabled**, and then select **OK**.

Disabling **Allow security intelligence updates when running on battery power** prevents protection updates from downloading when the PC is on battery power.

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)

## Related articles

The following articles provide related guidance:

- [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md)
- [Update and manage Microsoft Defender Antivirus in Windows 10](deploy-manage-report-microsoft-defender-antivirus.md)
