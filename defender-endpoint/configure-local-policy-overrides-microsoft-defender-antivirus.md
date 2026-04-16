---
title: Configure local overrides for Microsoft Defender Antivirus settings
description: Enable or disable users from locally changing settings in Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
author: paulinbar
ms.author: painbar
ms.topic: how-to
ms.custom: nextgen
ms.date: 04/15/2026
ms.reviewer: yongrhee
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
---

# Prevent or allow users to locally modify Microsoft Defender Antivirus policy settings

By default, Microsoft Defender Antivirus settings deployed via a Group Policy Object (GPO) to the endpoints in your organization prevents users from locally changing the settings. You might want to allow some users to change these settings. For example, security researchers and threat investigators might need more control over individual settings on the endpoints they use.

This article explains how to configure local overrides and merge behavior of local and global exclusion lists.

> [!TIP]
> If you're looking for antivirus-related information for other platforms, see the following articles:

> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)

## Prerequisites

### Supported operating systems

- Windows

## Configure local overrides for Microsoft Defender Antivirus settings

The default setting for these local override policies is **Disabled**. When you change the policies to **Enabled**, users can make changes to the associated settings on their devices by using the following methods:

- The [Windows Security](microsoft-defender-security-center-antivirus.md) app.
- Local group policy settings.
- PowerShell cmdlets (where appropriate).

To configure these settings:

1. Open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click on the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus**.

1. Go to the **Location** identified in the following table (for example, **MAPS**).

   |Location|Setting|Article|
   |---|---|---|---|
   |MAPS|Configure local setting override for reporting to Microsoft MAPS|[Enable cloud-delivered protection](enable-cloud-protection-microsoft-defender-antivirus.md)|
   |Quarantine|Configure local setting override for the removal of items from Quarantine folder|[Configure remediation for scans](configure-remediation-microsoft-defender-antivirus.md)|
   |Real-time protection|Configure local setting override for monitoring file and program activity on your computer|[Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md)|
   |Real-time protection|Configure local setting override for monitoring for incoming and outgoing file activity|[Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md)|
   |Real-time protection|Configure local setting override for scanning all downloaded files and attachments|[Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md)|
   |Real-time protection|Configure local setting override for turn on behavior monitoring|[Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md)|
   |Real-time protection|Configure local setting override to turn on real-time protection|[Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md)|
   |Remediation|Configure local setting override for the time of day to run a scheduled full scan to complete remediation|[Configure remediation for scans](configure-remediation-microsoft-defender-antivirus.md)|
   |Scan|Configure local setting override for maximum percentage of CPU utilization|[Configure and run scans](run-scan-microsoft-defender-antivirus.md)|
   |Scan|Configure local setting override for schedule scan day|[About scheduled scans](schedule-antivirus-scans.md)|
   |Scan|Configure local setting override for scheduled quick scan time|[About scheduled scans](schedule-antivirus-scans.md)|
   |Scan|Configure local setting override for scheduled scan time|[About scheduled scans](schedule-antivirus-scans.md)|
   |Scan|Configure local setting override for the scan type to use for a scheduled scan|[About scheduled scans](schedule-antivirus-scans.md)|

1. In the details pane of the **Location** you selected, open the setting you want to configure as identified by the **Setting** value in the previous table (for example, **Configure local setting override for reporting to Microsoft MAPS**). You can use any of the following methods to open the setting:
   - Double-click on the setting.
   - Right-click on the setting, and then select **Edit**
   - Select the setting, and then select **Action** \> **Edit**.

1. In the setting window that opens, select your desired configuration (for example, **Enabled** or **Disabled**), and then Select **OK**

   Repeat the previous steps for any other settings.

1. Deploy the GPO as usual.

<a id="merge-lists"></a>

## Configure how locally and globally defined threat remediation and exclusions lists are merged

You can also configure how locally defined lists are combined or merged with globally defined lists. This setting applies to the following features:

- [Exclusion lists](configure-exclusions-microsoft-defender-antivirus.md)
- [Specified remediation lists](configure-remediation-microsoft-defender-antivirus.md)
- [Attack surface reduction rules](attack-surface-reduction-rules-overview.md)

By default, lists configured in local group policy and the Windows Security app are merged with lists defined by the appropriate GPO you deployed. Where there are conflicts, the globally defined list takes precedence. You can disable this setting to ensure that only globally defined lists (for example, from any deployed GPOs) are used.

### Use Group Policy to disable local list merging

1. Open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click on the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus**.

1. In the details pane of **Microsoft Defender Antivirus**, open the **Configure local administrator merge behavior for lists** setting using any of the following methods:
   - Double-click on the setting.
   - Right-click on the setting, and then select **Edit**
   - Select the setting, and then select **Action** \> **Edit**.

1. In the setting window that opens, select **Disabled**, and then select **OK**.

> [!NOTE]
> In the following administrative templates, set **Configure local administrator merge behavior for lists** to **Enabled** to disable the local administrator merge behavior:
>
> - Administrative Templates (.admx) for Windows 11 2022 Update (22H2)
> - Administrative Templates (.admx) for Windows 10 November 2021 Update (21H2)

### Use Microsoft Intune to disable local list merging

To disable local list merging in a Microsoft Intune Endpoint Security **Antivirus** policy, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation).

When creating a policy, use these settings:

- **Policy type**: Antivirus
- **Platform**: Windows
- **Profile**: Microsoft Defender Antivirus

When creating or modifying an Antivirus policy, use this setting on the **Configuration settings** tab:

- **Disable local admin merge**: Select **Disable local admin merge**.

For more information about antivirus policy profiles available in Microsoft Intune, see [Antivirus policy for endpoint security in Intune](/intune/device-configuration/endpoint-security/antivirus).

(/intune/device-configuration/endpoint-security/antivirus)

> [!NOTE]
> Disabling local list merging overrides controlled folder access settings. It also overrides any protected folders or allowed apps set by the local administrator. For more information about controlled folder access settings, see [Allow a blocked app in Windows Security](https://support.microsoft.com/help/4046851/windows-10-allow-blocked-app-windows-security).


## Related articles

- [Microsoft Intune](/intune/intune-service/protect/advanced-threat-protection-configure)
- [Microsoft Defender Antivirus in Windows](microsoft-defender-antivirus-windows.md)
- [Configure end-user interaction with Microsoft Defender Antivirus](configure-local-policy-overrides-microsoft-defender-antivirus.md)
