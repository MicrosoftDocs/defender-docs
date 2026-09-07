---
title: Manage tamper protection for your organization using Microsoft Intune
ms.reviewer: joshbregman, mattcall, pahuijbr, hayhov, oogunrinde
description: Turn tamper protection on or off for your organization in Microsoft Intune.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 07/03/2026
ms.topic: how-to
author: limwainstein
ms.author: lwainstein
ms.custom: 
- msecd-doc-authoring-1016
- nextgen
- admindeeplinkDEFENDER
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
---

# Manage tamper protection for your organization using Microsoft Intune

Tamper protection helps protect certain [security settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on), such as virus and threat protection, from being disabled or changed. If you're part of your organization's security team, and you're using [Microsoft Intune](/intune/intune-service/fundamentals/what-is-intune), you can manage the tamper protection feature for your organization in the [Intune admin center](https://intune.microsoft.com). Or, you can use [Configuration Manager](/intune/configmgr/protect/deploy-use/endpoint-protection-configure). With Intune or Configuration Manager, you can perform the following tasks:

- [Turn tamper protection on (or off) for some or all devices](#turn-tamper-protection-on-or-off-in-microsoft-intune). 
- [Protect Microsoft Defender Antivirus exclusions from tampering](#tamper-protection-for-antivirus-exclusions) (certain requirements must be met).

> [!IMPORTANT]
> If you're using Microsoft Intune to manage Defender for Endpoint settings, make sure to set [DisableLocalAdminMerge](/windows/client-management/mdm/defender-csp#configurationdisablelocaladminmerge) to `true` on devices.
>
> When tamper protection is turned on, [tamper-protected settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on) can't be changed. To avoid breaking management experiences, including Intune (and [Configuration Manager](manage-tamper-protection-configuration-manager.md)), keep in mind that changes to tamper-protected settings might appear to succeed but are blocked by tamper protection. Depending on your particular scenario, you have several options available: 
>
> - If you must make changes to a device, and the tamper protection feature blocks those changes, we recommend using [troubleshooting mode](enable-troubleshooting-mode.md) to temporarily disable tamper protection on the device. After the troubleshooting mode ends, any changes made to tamper-protected settings are reverted to their configured state.
> - You can use Intune or [Configuration Manager](manage-tamper-protection-configuration-manager.md) to exclude devices from tamper protection. 
> - If you're managing tamper protection through Intune, you can change [tamper-protected antivirus exclusions](#tamper-protection-for-antivirus-exclusions).

## Prerequisites

### Supported operating systems

- Windows

## Requirements for managing tamper protection in Intune

|Requirement|Details|
|---|---|
|Roles and permissions|You must have appropriate permissions assigned through roles, such as Security Administrator. See [Microsoft Entra roles with Intune access](/intune/intune-service/fundamentals/role-based-access-control#azure-active-directory-roles-with-intune-access).|
|Device management|Your organization uses Configuration Manager or [Intune to manage devices](/intune/intune-service/fundamentals/manage-devices). Co-managed devices aren't supported for this feature.|
|Intune licenses|Intune licenses are required. See [Microsoft Intune licensing](/intune/intune-service/fundamentals/licenses).|
|Operating System|Windows devices must be running Windows 10 [version 1709 or later](/lifecycle/announcements/revised-end-of-service-windows-10-1709) or Windows 11. (For more information about releases, see [Windows release information](/windows/release-health/release-information).) <br/><br/> For Mac, see [Protect macOS security settings with tamper protection](tamperprotection-macos.md).|
|Security intelligence|You must be using Windows security with [security intelligence](https://www.microsoft.com/wdsi/defenderupdates) updated to version `1.287.60.0` (or later).|
|Antimalware platform|Devices must be using antimalware platform version `4.18.1906.3` (or later) and anti-malware engine version `1.1.15500.X` (or later). See [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md).|
|Microsoft Entra ID|Your Intune and Defender for Endpoint tenants must share the same Microsoft Entra infrastructure.|
|Defender for Endpoint|Your devices must be onboarded to Defender for Endpoint.|

> [!NOTE]
> If devices aren't enrolled in Microsoft Defender for Endpoint, tamper protection shows up as **Not Applicable** until the onboarding process completes.
> Tamper protection may block changes to certain security settings. If you see an error code with Event ID 5013, see [Review event logs and error codes to troubleshoot issues with Microsoft Defender Antivirus](troubleshoot-microsoft-defender-antivirus.yml).

## Turn tamper protection on (or off) in Microsoft Intune

To create an antivirus policy in Microsoft Intune that turns tamper protection on or off for your devices, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the antivirus policy, use these settings:

- **Policy type**": Antivirus
- **Platform**: Windows
- **Profile**: Windows Security Experience
- **Basics**: Enter an name and description for your policy.
- **Configuration settings**: Turn **Tamper protection (device)** on in the **Defender** section
- **Scope tags**: If your organization is using [scope tags](/intune/intune-service/fundamentals/scope-tags), select the tags you want to use
- **Assignments**: Select **All users** and **All Devices**. Verify the **Target type** value is **Include** for both.

## Tamper protection for antivirus exclusions

Your organization can define [exclusions for Microsoft Defender Antivirus](microsoft-defender-antivirus-exclusions-configure.md). Tamper protection can protect those exclusions too, if the following conditions are all met:

|Condition|Criteria|
|---|---|
|Microsoft Defender platform|Devices must run platform version `4.18.2211.5` or later. See [Monthly platform and engine versions](microsoft-defender-antivirus-updates.md#platform-and-engine-releases).|
|`DisableLocalAdminMerge` setting|This setting prevents local list merging. Enable `DisableLocalAdminMerge` so that device settings don't merge with org policies (such as Intune settings). See [DisableLocalAdminMerge](/windows/client-management/mdm/defender-csp).|
|Device management|Devices must be managed in Intune only or Configuration Manager only. Sense must be enabled.|
|Antivirus exclusions|Exclusions must be managed in Intune or Configuration Manager. See [Microsoft Defender Antivirus policy settings for Windows devices](/intune/intune-service/protect/antivirus-microsoft-defender-settings-windows). <br/><br/>The exclusion protection feature must be enabled on devices. See [How to determine whether antivirus exclusions are tamper protected on a Windows device](#how-to-determine-whether-antivirus-exclusions-are-tamper-protected-on-a-windows-device).|

> [!NOTE]
> If Configuration Manager is the sole tool managing exclusions and all conditions are met, those exclusions are tamper protected. You don't need to also push exclusions through Intune.

To learn more about antivirus exclusions, see [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-exclusions-overview.md).

## How to determine whether antivirus exclusions are tamper protected on a Windows device

You can use a registry key to determine whether the functionality to protect Microsoft Defender Antivirus exclusions is enabled. Use this procedure to view, but not change, tamper protection status.

> [!CAUTION]
> **Do not change the value of the registry keys**. This procedure is for viewing registry values only. Changing keys has no effect on whether tamper protection applies to exclusions.

1. On a Windows device open Registry Editor. (Read-only mode is fine; you're not editing the registry key.)

1. To confirm that the device is managed by Intune only or managed by Configuration Manager only, with Sense enabled, check the following registry key values:

   - `ManagedDefenderProductType` (located at `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender` or `HKLM\SOFTWARE\Microsoft\Windows Defender`) 
   - `EnrollmentStatus` (located at `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SenseCM` or `HKLM\SOFTWARE\Microsoft\SenseCM`)

   The following table summarizes what the registry key values mean:

   |`ManagedDefenderProductType` value|`EnrollmentStatus` value|What the value means|
   |---|---|---|
   |`6`|(any value)|The device is managed with Intune only. <br/>(*Meets a requirement for exclusions to be tamper protected.*)|
   |`7`|`4`|The device is managed with Configuration Manager. <br/>(*Meets a requirement for exclusions to be tamper protected.*)|
   |`7`|`3`|The device is co-managed with Configuration Manager and Intune. <br/>(*This isn't supported for exclusions to be tamper protected.*)|
   |A value other than `6` or `7`|(any value)|The device isn't managed by Intune only or Configuration Manager only. <br/>(*Exclusions aren't tamper protected*.)|

1. To confirm that tamper protection is deployed and that exclusions are tamper protected, check the `TPExclusions` registry key (located at `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features` or `HKLM\SOFTWARE\Microsoft\Windows Defender\Features`).

   |`TPExclusions`|What the value means|
   |---|---|
   |`1`|The required conditions are met, and the new functionality to protect exclusions is enabled on the device.<br/>(*Exclusions are tamper protected.*)|
   |`0`|Tamper protection isn't currently protecting exclusions on the device.<br/> (*If all the requirements are met and this state seems incorrect, contact support*.)|

> [!CAUTION]
> **Do not change the value of the registry keys**. Use the preceding procedure for information only. Changing keys has no effect on whether tamper protection applies to exclusions.

## Related content

- [Controlled configuration in Microsoft Defender for Endpoint](secure-controlled-configuration.md)
- [Frequently asked questions (FAQs) on tamper protection](faqs-on-tamper-protection.yml)
- [Troubleshoot problems with tamper protection](troubleshoot-problems-with-tamper-protection.yml)
- [Manage Microsoft Defender for Endpoint on devices with Microsoft Intune](/intune/intune-service/protect/mde-security-integration)


