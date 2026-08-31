---
title: Configure Microsoft Defender Antivirus always-on protection
description: Configure Microsoft Defender Antivirus always-on protection in Intune or Group Policy to monitor files, programs, and behavior for threats.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.topic: how-to
ms.date: 08/25/2026
ms.custom: nextgen, msecd-doc-authoring-1016
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

#customer intent: As a security administrator, I want to configure Microsoft Defender Antivirus always-on protection so that Windows devices continuously monitor files, programs, and behavior for threats.

ai-usage: ai-assisted
---

# Enable and configure Microsoft Defender Antivirus always-on protection

Always-on protection in Microsoft Defender Antivirus uses real-time protection, behavior monitoring, and heuristics to detect suspicious and malicious activity. Security administrators can use Microsoft Intune or Group Policy to configure these capabilities on Windows devices. Review the supported operating systems before you begin.

> [!NOTE]
> [Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) helps keep always-on protection and other security settings from being changed. As a result, when tamper protection is enabled, any changes made to [tamper-protected settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on) are ignored. To temporarily change tamper-protected settings for testing or diagnostics, use [troubleshooting mode](enable-troubleshooting-mode.md). After troubleshooting mode ends, the settings return to their configured values. To make permanent changes, update the policy in the management tool that configures the device.
>
> If a file containing a threat is added to an Azure file share, the file isn't remediated immediately. Real-time protection detects the threat when a user opens the file.

## Prerequisites

### Supported operating systems

The following operating systems support always-on protection:

- Windows

To use the Intune procedure, enroll Windows devices in Intune.

## Configure always-on protection settings in Microsoft Intune

[!INCLUDE [Intune is recommended but is a separate product](includes/intune-recommended-separate-product.md)]

You can configure always-on protection settings in a Microsoft Intune endpoint security antivirus policy. For more information about creating and assigning antivirus policies, see [Antivirus policy for endpoint security in Intune](/intune/intune-service/protect/endpoint-security-antivirus-policy).

To create a new policy and manage antivirus settings with Intune, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating a new policy for Windows, choose the following options:

- **Platform**: Select **Windows**.
- **Profile**: Select **Microsoft Defender Antivirus**.
- **Configuration settings**: In the **Defender** section, configure the following settings:
  - **Allow Real-Time Monitoring**: Select **Allowed**.
  - **Allow On Access Protection**: Select **Allowed**.
  - **Real Time Scan Direction**: Select **Monitor all files (bi-directional)**.
  - **Allow behavior monitoring**: Select **Allowed**.

To edit an existing policy for Windows devices, see <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (opens in a new tab in the Intune documentation):

1. On the **Summary** tab of the **Endpoint security \| Antivirus** page, select the policy.
1. Find the **Configuration settings** section in the **Properties** section:
   - Expand **Defender** to see the current settings.
   - Select **Edit** next to **Configuration settings** to update the settings.
1. Configure **Allow Real-Time Monitoring**, **Allow On Access Protection**, **Real Time Scan Direction**, and **Allow behavior monitoring** by using the values listed for a new policy.

The Microsoft Defender Antivirus profile doesn't include a separate setting for heuristics. Heuristics are part of real-time protection. For descriptions of all available Windows settings, options, defaults, recommendations, and CSP mappings, see [Configure Microsoft Defender Antivirus using Microsoft Intune](use-intune-config-manager-microsoft-defender-antivirus.md#policies-and-settings).

<a name="group-policy"></a>

## Configure always-on protection settings in Group Policy

You can use Group Policy to manage some Microsoft Defender Antivirus settings. If [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) is enabled in your organization, any changes made to [tamper-protected settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on) are ignored. You can't turn off tamper protection by using Group Policy.

To temporarily change tamper-protected settings for testing or diagnostics, use [troubleshooting mode](enable-troubleshooting-mode.md). After troubleshooting mode ends, the settings return to their configured values. To make permanent changes, use a management tool that supports changes to tamper-protected settings, such as Intune.

The following procedure applies to Windows devices.

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.
1. In the GPMC console tree, expand **Group Policy Objects** in the forest and domain containing the Group Policy Object (GPO) you want to edit.
1. Right-click the GPO, and then select **Edit**.
1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus**.
1. In the details pane of **Microsoft Defender Antivirus**, the folders used to configure always-on protection are:
   - **Real-time Protection**: [Configure real-time protection settings](#configure-real-time-protection-settings-in-group-policy).
   - **Scan**: [Turn on heuristics](#turn-on-heuristics-in-group-policy).

   To open and configure a setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus**.

Configure the settings as described in the following subsections.

### Configure real-time protection settings in Group Policy

If a setting described in this article isn't available in Group Policy Management Editor, update the Administrative Templates in your Group Policy Central Store. The Central Store isn't updated automatically. For instructions, see [How to create and manage the Central Store for Group Policy Administrative Templates in Windows](/troubleshoot/windows-client/group-policy/create-and-manage-central-store).

Configure the following policies to turn on real-time and behavior monitoring:

|Policy|Value|
|---|---|
|Turn off real-time protection|Disabled|
|Configure monitoring for incoming and outgoing file and program activity|Enabled, bi-directional (full on-access)|
|Turn on behavior monitoring|Enabled|
|Monitor file and program activity on your computer|Enabled|

1. Go to **Microsoft Defender Antivirus** \> **Real-time Protection**.
1. In the details pane of **Real-time Protection**, select a policy setting to view its description and supported options in the help pane. For a list of the settings and links to related guidance, see [Group Policy settings and resources](use-group-policy-microsoft-defender-antivirus.md#group-policy-settings-and-resources).
1. Open each policy setting in the table, configure the specified value, and then select **OK**.

### Turn on heuristics in Group Policy

Enable the heuristics policy in the **Scan** folder:

1. Go to **Microsoft Defender Antivirus** \> **Scan**.
1. In the details pane of **Scan**, open **Turn on heuristics**.
1. Select **Enabled**, and then select **OK**.

### Disable real-time protection in Group Policy

> [!WARNING]
> Disabling real-time protection drastically reduces the protection on your endpoints and isn't recommended. If [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) is enabled, you can't turn off real-time protection by using Group Policy. To turn off real-time protection temporarily for testing or diagnostics, use [troubleshooting mode](enable-troubleshooting-mode.md). After troubleshooting mode ends, real-time protection returns to its configured value.

To disable real-time protection by using Group Policy:

1. Go to **Microsoft Defender Antivirus** \> **Real-time Protection**.
1. In the details pane of **Real-time Protection**, open **Turn off real-time protection**.
1. Select **Enabled**, and then select **OK**.

## Related content

- [Configure behavioral, heuristic, and real-time protection](configure-protection-features-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)

### Other platforms

If you're looking for antivirus-related information for other platforms, see:

- [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
- [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
- [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
- [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure Defender for Endpoint on Android features](android-configure.md)
- [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
