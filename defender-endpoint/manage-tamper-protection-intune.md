---
title: Manage tamper protection for your organization using Microsoft Intune
ms.reviewer: joshbregman, mattcall, pahuijbr, hayhov, oogunrinde
description: Turn tamper protection on or off for your organization in Microsoft Intune.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 12/30/2025
audience: ITPro
ms.topic: how-to
author: limwainstein
ms.author: lwainstein
ms.custom: 
- nextgen
- admindeeplinkDEFENDER
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Antivirus

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

1. In the Microsoft Intune admin center at <https://intune.microsoft.com>, go to **Endpoint security**. On the **Endpoint security \| Overview** page, select **Antivirus** in the **Manage** section. Or, to go directly to the **Endpoint security \| Antivirus** page, use <https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/antivirus>.

2. On the **Summary** tab of the **Endpoint security \| Antivirus** page, select **Create policy** in the **AV policies** section.

3. On the **Create a profile** flyout that opens, configure the following settings:
   - **Platform**: Select **Windows**.
   - **Profile**: Select **Windows Security Experience**.

   Select **Create**.

4. The **Create policy** wizard opens. On the **Basics** tab, configure the following settings:
   - **Name**: Enter a unique, descriptive name for the policy.
   - **Description**: Enter an optional description.

   Select **Next**.

5. On the **Configuration settings** tab, **Tamper protection (device)** is available in the **Defender** section. Select **On**, and then select **Next**.

   :::image type="content" source="media/turnontamperprotectinmem.png" alt-text="Turn tamper protection turned on with Intune" lightbox="media/turnontamperprotectinmem.png":::

6. On the **Scope tags** tab, the scope tag named **Default** is select by default, but you can remove it and select other existing scope tags. When you're finished, select **Next**.

7. On the **Assignments** tab, click in the box, select **All users**, click in the box again, and then select select **All Devices**. Verify the **Target type** value is **Include** for both, and then select **Next**.

8. On the **Review + create** tab, verify the settings, and then select **Save**.

## Tamper protection for antivirus exclusions

If your organization has [exclusions defined for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md), tamper protection protects those exclusions, provided all of the following conditions are met:

|Condition|Criteria|
|---|---|
|Microsoft Defender platform|Devices are running Microsoft Defender platform `4.18.2211.5` or later. For more information, see [Monthly platform and engine versions](microsoft-defender-antivirus-updates.md#platform-and-engine-releases).|
|`DisableLocalAdminMerge` setting|This setting is also known as preventing local list merging. `DisableLocalAdminMerge` must be enabled so that settings configured on a device aren't merged with organization policies, such as settings in Intune. For more information, see [DisableLocalAdminMerge](/windows/client-management/mdm/defender-csp).|
|Device management|Devices are either managed in Intune only, or are managed with Configuration Manager only. Sense must be enabled.|
|Antivirus exclusions|Microsoft Defender Antivirus exclusions are managed in Microsoft Intune or Configuration Manager. For more information, see [Settings for Microsoft Defender Antivirus policy in Microsoft Intune for Windows devices](/intune/intune-service/protect/antivirus-microsoft-defender-settings-windows). <br/><br/>Functionality to protect Microsoft Defender Antivirus exclusions is enabled on devices. For more information, see [How to determine whether antivirus exclusions are tamper protected on a Windows device](#how-to-determine-whether-antivirus-exclusions-are-tamper-protected-on-a-windows-device).|

> [!NOTE]
> For example, when Configuration Manager is used solely to manage exclusions and the required conditions are met, exclusions from Configuration Manager are tamper protected. In this case, there's no need to push antivirus exclusions using Microsoft Intune.

For more detailed information about Microsoft Defender Antivirus exclusions, see [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md).

## How to determine whether antivirus exclusions are tamper protected on a Windows device

You can use a registry key to determine whether the functionality to protect Microsoft Defender Antivirus exclusions is enabled. The following procedure describes how to view, but not change, tamper protection status.

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

## See also

- [Frequently asked questions (FAQs) on tamper protection](faqs-on-tamper-protection.yml)
- [Troubleshoot problems with tamper protection](troubleshoot-problems-with-tamper-protection.yml)
- [Manage Microsoft Defender for Endpoint on devices with Microsoft Intune](/intune/intune-service/protect/mde-security-integration)


