---
title: Configure local overrides for Microsoft Defender Antivirus settings
description: Configure Group Policy local overrides and local administrator merge behavior for Microsoft Defender Antivirus settings on managed Windows devices.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
author: paulinbar
ms.author: painbar
ms.topic: how-to
ms.custom: nextgen, msecd-doc-authoring-1016
ms.date: 08/31/2026
ms.reviewer: yongrhee
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to control local changes to Microsoft Defender Antivirus settings so that managed policy remains authoritative.
---

# Prevent or allow users to locally modify Microsoft Defender Antivirus policy settings

By default, Microsoft Defender Antivirus settings that you deploy through a Group Policy Object (GPO) prevent users from changing those settings locally. However, some users might need to change settings on their own devices. For example, security researchers and threat investigators often need more control over individual settings.

The following procedures configure local overrides and control how local and global exclusion lists are merged.

> [!TIP]
> If you're looking for antivirus-related information for other platforms, see the following articles:
>
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

<a name="configure-local-overrides-for-microsoft-defender-antivirus-settings"></a>

## Configure local overrides for Microsoft Defender Antivirus settings using Group Policy

Group Policy is the only supported method for configuring these local override policies. By default, the policies are set to **Disabled**. If you set a policy to **Enabled**, users can change the related setting on their devices by using one of the following methods:

- The [Windows Security app](microsoft-defender-security-center-antivirus.md).
- The Local Group Policy Editor (`gpedit.msc`).
- The [**Set-MpPreference**](/powershell/module/defender/set-mppreference) cmdlet (where supported).

To configure local override policies by using Group Policy, follow these steps:

1. Open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus**.

1. Go to the **Location** identified in the following table (for example, **MAPS**).

   |Location|Setting|Article|
   |---|---|---|---|
   |MAPS|Configure local setting override for reporting to Microsoft MAPS|[Enable cloud-delivered protection](enable-cloud-protection-microsoft-defender-antivirus.md)|
   |Quarantine|Configure local setting override for the removal of items from Quarantine folder|[Configure remediation for scans](configure-remediation-microsoft-defender-antivirus.md)|
   |Real-time protection|Configure local setting override for monitoring file and program activity on your computer|[Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md)|
   |Real-time protection|Configure local setting override for monitoring for incoming and outgoing file activity|[Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md)|
   |Real-time protection|Configure local setting override for scanning all downloaded files and attachments|[Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md)|
   |Real-time protection|Configure local setting override to turn on behavior monitoring|[Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md)|
   |Real-time protection|Configure local setting override to turn on real-time protection|[Enable and configure Microsoft Defender Antivirus always-on protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md)|
   |Remediation|Configure local setting override for the time of day to run a scheduled full scan to complete remediation|[Configure remediation for scans](configure-remediation-microsoft-defender-antivirus.md)|
   |Scan|Configure local setting override for maximum percentage of CPU utilization|[Configure and run scans](run-scan-microsoft-defender-antivirus.md)|
   |Scan|Configure local setting override for the scheduled scan day|[About scheduled scans](schedule-antivirus-scans.md)|
   |Scan|Configure local setting override for scheduled quick scan time|[About scheduled scans](schedule-antivirus-scans.md)|
   |Scan|Configure local setting override for scheduled scan time|[About scheduled scans](schedule-antivirus-scans.md)|
   |Scan|Configure local setting override for the scan type to use for a scheduled scan|[About scheduled scans](schedule-antivirus-scans.md)|

1. In the details pane for the selected **Location**, find the setting listed in the **Setting** column of the table. For example, select **Configure local setting override for reporting to Microsoft MAPS**. Open the setting by using any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

1. In the setting window that opens, select the required configuration (for example, **Enabled** or **Disabled**), and then select **OK**.

   Repeat these steps for each setting you want to configure.

1. Deploy the GPO to the devices you want to manage.

<a id="merge-lists"></a>

## Configure how locally and globally defined threat remediation and exclusions lists are merged

You can also control how locally and globally defined lists are merged. The local administrator merge behavior setting applies to the following features:

- [Exclusion lists](microsoft-defender-antivirus-exclusions-configure.md)
- [Specified remediation lists](configure-remediation-microsoft-defender-antivirus.md)
- [File and folder exclusions for attack surface reduction (ASR) rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules)

By default, lists configured in Local Group Policy and the Windows Security app merge with lists from your deployed GPO. If the lists conflict, the deployed GPO takes precedence. You can disable local list merging so that only lists from management policies are used.

### Use Microsoft Intune to disable local list merging

[!INCLUDE [intune-recommended-separate-product](includes/intune-recommended-separate-product.md)]

To disable local list merging in Microsoft Intune, use an endpoint security **Antivirus** policy. For detailed instructions, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create endpoint security policies</a> or <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (links open new tabs in the Intune documentation).

When you create the policy, use these specific settings:

- **Policy type**: Select **Manage** \> **Antivirus** on the **Endpoint security \| Overview** page.
- **Platform**: Select **Windows**.
- **Profile**: Select **Microsoft Defender Antivirus**.

When you create or modify the policy, use this specific setting on the **Configuration settings** tab:

- **Disable local admin merge**: Select **Disable local admin merge**.

For more information about antivirus policy profiles available in Microsoft Intune, see [Antivirus policy for endpoint security in Intune](/intune/device-configuration/endpoint-security/antivirus).

### Use the Microsoft Defender portal to disable local list merging

If your organization [manages endpoint security policies in the Microsoft Defender portal](endpoint-security-policies-configure.md), use a Microsoft Defender Antivirus policy to disable local list merging.

For detailed instructions, see <a href="endpoint-security-policies-configure.md#create-an-endpoint-security-policy" target="_blank">Create an endpoint security policy</a> or <a href="endpoint-security-policies-configure.md#edit-an-endpoint-security-policy" target="_blank">Edit an endpoint security policy</a> (links open new tabs).

When you create the policy on the **Endpoint security policies** page in the Defender portal at <https://security.microsoft.com/policy-inventory>, use these specific settings:

- **Select platform**: Select **Windows**.
- **Select template**: Select **Microsoft Defender Antivirus**.

When you create or modify the policy, use this specific setting on the **Configuration settings** tab:

- **Disable local admin merge**: Select **Disable local admin merge**.

### Use Group Policy to disable local list merging

To disable local list merging by using Group Policy, follow these steps:

1. Open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus**.

1. In the details pane of **Microsoft Defender Antivirus**, open the **Configure local administrator merge behavior for lists** setting by using any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

1. In the setting window that opens, select **Disabled**, and then select **OK**.

> [!NOTE]
> In the following administrative templates, set **Configure local administrator merge behavior for lists** to **Enabled** to disable the local administrator merge behavior:
>
> - Administrative Templates (.admx) for Windows 11 2022 Update (22H2)
> - Administrative Templates (.admx) for Windows 10 November 2021 Update (21H2)

> [!NOTE]
> Disabling local list merging overrides controlled folder access settings. It also overrides any protected folders or allowed apps set by the local administrator. For more information about controlled folder access settings, see [Allow a blocked app in Windows Security](https://support.microsoft.com/Windows/Security/Threat-Malware-Protection/virus-and-threat-protection-in-the-windows-security-app).

## Related articles

See the following related articles:

- [Microsoft Intune](/intune/intune-service/protect/advanced-threat-protection-configure)
- [Microsoft Defender Antivirus in Windows](microsoft-defender-antivirus-windows.md)
- [Configure end-user interaction with Microsoft Defender Antivirus](configure-local-policy-overrides-microsoft-defender-antivirus.md)
