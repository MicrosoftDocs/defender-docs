---
title: Enable and configure Microsoft Defender Antivirus always-on protection
description: Enable and configure Microsoft Defender Antivirus real-time protection features such as behavior monitoring, heuristics, and machine learning.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.topic: how-to
ms.date: 07/02/2026
ms.custom: nextgen, msecd-doc-authoring-1016
ms.collection: 
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
---
# Enable and configure Microsoft Defender Antivirus always-on protection



Always-on protection consists of real-time protection, behavior monitoring, and heuristics to identify malware based on known suspicious and malicious activities. Suspicious and malicious activities include events, such as processes making unusual changes to existing files, modifying or creating automatic startup registry keys and startup locations (also known as autostart extensibility points, or ASEPs), and other changes to the file system or file structure. Always-on protection is an important part of your antivirus protection and should be enabled. 

> [!NOTE]
> [Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) helps keep always-on protection and other security settings from being changed. As a result, when tamper protection is enabled, any changes made to [tamper-protected settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on) are ignored. If you must make changes to a device and those changes are blocked by tamper protection, we recommend using [troubleshooting mode](enable-troubleshooting-mode.md) to temporarily disable tamper protection on the device. Note that after troubleshooting mode ends, any changes made to tamper-protected settings are reverted to their configured state.
> If a file that contains a threat is placed in an Azure file share, it's not remediated when placed. A user has to open the file for it to be detected by real-time protection.

## Prerequisites

### Supported operating systems 

The following operating systems support always-on protection:

- Windows

## Manage antivirus settings with Microsoft Intune

You can use Intune to configure antivirus policies, and then apply those policies across devices in your organization. Antivirus policies help security admins focus on managing the discrete group of antivirus settings for managed devices. Each antivirus policy includes several profiles. Each profile contains only the settings that are relevant for Microsoft Defender Antivirus for macOS and Windows devices, or for the user experience in the Windows Security app on Windows devices. For more information, see [Antivirus policy for endpoint security in Intune](/intune/intune-service/protect/endpoint-security-antivirus-policy).

To create a new policy and manage antivirus settings with Intune, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating a new policy for Windows, choose the following options:

- **Policy type**: Antivirus
- **Platform**: Windows 10, Windows 11, and Windows Server
- **Profile**: Microsoft Defender Antivirus
- **Basics**: Type a name and description for your policy.
- **Configuration settings**: Expand **Defender** and select the settings you want to use for your policy. To get help with your settings, refer to [Policy CSP - Defender](/windows/client-management/mdm/policy-csp-defender?WT.mc_id=Portal-fx).
- **Scope tags**: Choose **Select scope tags** to open the *Select tags* pane to assign scope tags to the profile.
- **Assignments**: Select the groups to receive this profile. For more information on assigning profiles, see [Assign user and device profiles](/intune/intune-service/configuration/device-profile-assign).

When creating a new policy for macOS, choose the following options:

- **Platform**: macOS
- **Profile**: Antivirus
- **Basics**: Type a name and description for your policy. On the 
- **Configuration settings**: Select the settings you want to use for your policy. To get help with your settings, refer to [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md).
- **Scope tags**: Choose **Select scope tags** to open the *Select tags* pane to assign scope tags to the profile
- **Assignments**: Select the groups to receive this profile. For more information on assigning profiles, see [Assign user and device profiles](/intune/intune-service/configuration/device-profile-assign)

To edit an existing policy for Windows devices, see <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (opens in a new tab in the Intune documentation). Select your policy, expand **Defender**, and edit settings for your policy. To get help with your settings, refer to [Policy CSP - Defender](/windows/client-management/mdm/policy-csp-defender?WT.mc_id=Portal-fx).

To edit an existing policy for macOS devices, select your policy, select **Properties**, and choose **Edit** next to **Configuration settings**. Edit the policy settings under **Microsoft Defender for Endpoint**. To get help with your settings, refer to [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md).

## Are you using Group Policy?

> [!IMPORTANT]
> We recommend using [Microsoft Intune](/intune/intune-service/fundamentals/what-is-intune) to manage Microsoft Defender Antivirus settings for your organization. With Intune, you can control where tamper protection is enabled (or disabled) through policies. You can also protect Microsoft Defender Antivirus exclusions. For more information, see [Protect Microsoft Defender Antivirus exclusions from tampering](prevent-changes-to-security-settings-with-tamper-protection.md#protect-microsoft-defender-antivirus-exclusions).

You can use Group Policy to manage some Microsoft Defender Antivirus settings. If [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) is enabled in your organization, any changes made to [tamper-protected settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on) are ignored. You can't turn off tamper protection by using Group Policy. 

If you must make changes to a device and those changes are blocked by tamper protection, we recommend using [troubleshooting mode](enable-troubleshooting-mode.md) to temporarily disable tamper protection on the device. After troubleshooting mode ends, any changes made to tamper-protected settings are reverted to their configured state.
 
You can use **Local Group Policy Editor** to enable and configure Microsoft Defender Antivirus always-on protection settings.

### Enable and configure always-on protection using Group Policy

This procedure applies to Windows 10 and Windows 11 devices.

Use the following steps to enable and configure always-on protection using Local Group Policy Editor:

1. Open **Local Group Policy Editor**, as follows:

    1. In your taskbar search box, type **gpedit**.

    1. Under **Best match**, select **Edit group policy** to launch **Local Group Policy Editor**.
    
       :::image type="content" source="media/gpedit-search.png" alt-text="The GPEdit taskbar search result in the Control panel" lightbox="media/gpedit-search.png":::

1. In the left pane of **Local Group Policy Editor**, expand the tree to **Computer Configuration** \> **Administrative Templates** \> **Windows Components** \> **Microsoft Defender Antivirus**.

1. Configure the Microsoft Defender Antivirus antimalware service policy setting.

   In the **Microsoft Defender Antivirus** details pane on right, double-click **Allow antimalware service to start up with normal priority**, and set it to **Enabled**.

   Then select **OK**.

1. Configure the Microsoft Defender Antivirus real-time protection policy settings, as follows:

    1. In the **Microsoft Defender Antivirus** details pane, double-click **Real-time Protection**. Or, from the **Microsoft Defender Antivirus** tree on left pane, select **Real-time Protection**.

    1. In the **Real-time Protection** details pane on right, double-click the policy setting as specified in [Real-time protection policy settings](#real-time-protection-policy-settings).

    1. Configure the setting as appropriate, and select **OK**.

    1. Repeat the previous steps for each setting in the table.

1. Configure the Microsoft Defender Antivirus scanning policy setting, as follows:

    1. From the **Microsoft Defender Antivirus** tree on left pane, select **Scan**.
    
   1. In the **Scan** details pane on right, double-click **Turn on heuristics**, and set it to **Enabled**. 

   1. Select **OK**.

1. Close **Local Group Policy Editor**.

### Real-time protection policy settings

For the most current settings, get the latest ADMX files in the Group Policy Central Store. See [How to create and manage the Central Store for Group Policy Administrative Templates in Windows](/troubleshoot/windows-client/group-policy/create-and-manage-central-store) and download the latest files. 

### Disable real-time protection in Group Policy

> [!WARNING]
> **Disabling real-time protection drastically reduces the protection on your endpoints and is not recommended**. In addition, if [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) is enabled, you cannot turn it off by using Group Policy. If you must make changes to a device and those changes are blocked by tamper protection, we recommend using [troubleshooting mode](enable-troubleshooting-mode.md) to temporarily disable tamper protection on the device. Note that after troubleshooting mode ends, any changes made to tamper-protected settings are reverted to their configured state.

1. Open **Local Group Policy Editor**.

   1. In your Windows 10 or Windows 11 taskbar search box, type `gpedit`.

   1. Under **Best match**, select **Edit group policy** to launch **Local Group Policy Editor**.

1. In the left pane of **Local Group Policy Editor**, expand the tree to **Computer Configuration** \> **Administrative Templates** \> **Windows Components** \> **Microsoft Defender Antivirus** \> **Real-time Protection**.

1. In the **Real-time Protection** details pane on right, double-click **Turn off real-time protection**.

1. In the **Turn off real-time protection** setting window, set the option to **Enabled**.
   
1. select **OK**.

1. Close **Local Group Policy Editor**.

## See also

### Related content

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



