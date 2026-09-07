---
title: Configure Microsoft Defender Antivirus always-on protection
description: Configure Microsoft Defender Antivirus always-on protection with supported management tools to monitor files, programs, and behavior for threats.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.topic: how-to
ms.date: 09/02/2026
ms.custom: nextgen, msecd-doc-authoring-1015
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

Always-on protection in Microsoft Defender Antivirus uses real-time protection, behavior monitoring, and heuristics to detect suspicious and malicious activity. Security administrators can configure these capabilities on Windows devices by using Microsoft Intune, the Microsoft Defender portal, Microsoft Configuration Manager, or Group Policy. You can also use PowerShell or the Windows Security app. Review the supported operating systems before you begin.

> [!NOTE]
> [Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) helps keep always-on protection and other security settings from being changed. As a result, when tamper protection is enabled, any changes made to [tamper-protected settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on) are ignored. To temporarily change tamper-protected settings for testing or diagnostics, use [troubleshooting mode](enable-troubleshooting-mode.md). After troubleshooting mode ends, the settings return to their configured values. To make permanent changes, update the policy in the management tool that configures the device.
>
> If a file containing a threat is added to an Azure file share, the file isn't remediated immediately. Real-time protection detects the threat when a user opens the file.

## Prerequisites

### Supported operating systems

The following operating systems support always-on protection:

- Windows

To use the Intune procedure, enroll Windows devices in Intune.

Before using Configuration Manager, configure it for Endpoint Protection. For more information, see [Configure Endpoint Protection in Configuration Manager](/intune/configmgr/protect/deploy-use/endpoint-protection-configure).

## Configure always-on protection settings in Microsoft Intune

[!INCLUDE [Intune is recommended but is a separate product](includes/intune-recommended-separate-product.md)]

To configure always-on protection settings in Microsoft Intune, use an endpoint security **Antivirus** policy. For detailed instructions, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create endpoint security policies</a> or <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (links open new tabs in the Intune documentation).

When you create the policy, use these specific settings:

- **Policy type**: Go to **Manage** \> **Antivirus** on the **Endpoint security \| Overview** page at <https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/overview>.
- **Platform**: Select **Windows**.
- **Profile**: Select **Microsoft Defender Antivirus**.

When you create or modify the policy, use these specific settings on the **Configuration settings** tab:

- In the **Defender** section, configure the following settings:
  - **Allow Real-Time Monitoring**: Select **Allowed**.
  - **Allow On Access Protection**: Select **Allowed**.
  - **Real Time Scan Direction**: Select **Monitor all files (bi-directional)**.
  - **Allow behavior monitoring**: Select **Allowed**.

The Microsoft Defender Antivirus profile doesn't include a separate setting for heuristics. Heuristics are part of real-time protection. For descriptions of all available Windows settings, options, defaults, recommendations, and CSP mappings, see [Configure Microsoft Defender Antivirus using Microsoft Intune](use-intune-config-manager-microsoft-defender-antivirus.md#policies-and-settings).

## Configure always-on protection settings in the Microsoft Defender portal

If your organization [manages endpoint security policies in the Microsoft Defender portal](endpoint-security-policies-configure.md), use a Microsoft Defender Antivirus policy to configure always-on protection.

For detailed instructions, see <a href="endpoint-security-policies-configure.md#create-an-endpoint-security-policy" target="_blank">Create an endpoint security policy</a> or <a href="endpoint-security-policies-configure.md#edit-an-endpoint-security-policy" target="_blank">Edit an endpoint security policy</a> (links open new tabs).

When you create the policy on the **Endpoint security policies** page in the Microsoft Defender portal at <https://security.microsoft.com/policy-inventory>, use these specific settings:

- **Select platform**: Select **Windows**.
- **Select template**: Select **Microsoft Defender Antivirus**.

When you create or modify the policy, use these specific settings on the **Configuration settings** tab:

- In the **Defender** section, configure the following settings:
  - **Allow Real-Time Monitoring**: Select **Allowed**.
  - **Allow On Access Protection**: Select **Allowed**.
  - **Real Time Scan Direction**: Select **Monitor all files (bi-directional)**.
  - **Allow behavior monitoring**: Select **Allowed**.

The Microsoft Defender Antivirus template doesn't include a separate setting for heuristics. Heuristics are part of real-time protection.

## Configure always-on protection settings in Microsoft Configuration Manager

For instructions to create and deploy an antimalware policy, see [Endpoint Protection antimalware policies in Configuration Manager](/intune/configmgr/protect/deploy-use/endpoint-antimalware-policies).

In the **Real-time protection** settings of the antimalware policy, configure the following settings:

- **Enable real-time protection**: Select **Yes**.
- **Monitor file and program activity on your computer**: Select **Yes**.
- **Scan system files**: Select **Scan incoming and outgoing files**.
- **Enable behavior monitoring**: Select **Yes**.

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

## Configure always-on protection settings using PowerShell

Run the commands in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**).

The following command turns on real-time monitoring and behavior monitoring, and configures Microsoft Defender Antivirus to scan incoming and outgoing files:

```powershell
Set-MpPreference -DisableRealtimeMonitoring $false -DisableBehaviorMonitoring $false -RealTimeScanDirection Both
```

The following command displays the configured values:

```powershell
Get-MpPreference | Select-Object DisableRealtimeMonitoring, DisableBehaviorMonitoring, RealTimeScanDirection
```

Verify that _DisableRealtimeMonitoring_ and _DisableBehaviorMonitoring_ are set to `False`, and _RealTimeScanDirection_ is set to `0`.

For detailed syntax and parameter information, see [**Set-MpPreference**](/powershell/module/defender/set-mppreference) and [**Get-MpPreference**](/powershell/module/defender/get-mppreference).

## Turn on real-time protection in the Windows Security app

You can use the [Windows Security app](https://support.microsoft.com/Windows/Security/Windows-Security/stay-protected-with-the-windows-security-app) to turn on real-time protection on an individual device. It doesn't provide separate controls for all the always-on protection settings described in this article.

To turn on real-time protection in the Windows Security app:

1. In the **Windows security** app on the device, go to **Virus & threat protection**.
1. In the **Virus & threat protection** pane, in the **Virus & threat protection settings** section, select **Manage settings**.
1. In the **Virus & threat protection settings** pane, slide the **Real-time protection** toggle to :::image type="icon" source="media/toggle-on.png" border="false"::: **On**.

If your organization manages real-time protection, the **Real-time protection** setting might be unavailable. If you turn off real-time protection, it turns on again automatically after a short delay.

For more information, see [Microsoft Defender Antivirus in the Windows Security app](microsoft-defender-security-center-antivirus.md).

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
