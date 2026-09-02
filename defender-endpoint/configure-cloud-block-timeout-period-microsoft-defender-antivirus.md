---
title: Configure Microsoft Defender Antivirus cloud block time-out
description: You can configure how long Microsoft Defender Antivirus blocks a file from running while waiting for a cloud determination.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1015
ms.reviewer: yongrhee
ms.subservice: ngp
ms.topic: how-to
ms.date: 09/02/2026
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
#customer intent: As a security administrator, I want to configure the cloud block time-out period so that Microsoft Defender Antivirus has more time to receive a cloud determination before a file runs.
---

# Configure the Microsoft Defender Antivirus cloud block time-out period

When Microsoft Defender Antivirus finds a suspicious file, it can prevent the file from running while it queries the [Microsoft Defender Antivirus cloud service](cloud-protection-microsoft-defender-antivirus.md).

By default, [Block at first sight](configure-block-at-first-sight-microsoft-defender-antivirus.md) blocks the file for 10 seconds while waiting for a cloud determination. You can add up to 50 seconds, for a maximum time-out period of 60 seconds. Before you begin, review the [prerequisites](#prerequisites) for this feature.

## Prerequisites

Before you specify an extended time-out period, enable [Block at first sight](configure-block-at-first-sight-microsoft-defender-antivirus.md), cloud protection, and automatic sample submission. Keep Microsoft Defender Antivirus up to date on the devices.

### Supported operating systems

The following operating systems support this feature:

- Windows
- Windows Server

  > [!NOTE]
  > Windows Server supports this Microsoft Defender Antivirus setting when you configure it directly by using Microsoft Configuration Manager, Group Policy, or PowerShell. The Microsoft Intune and Microsoft Defender portal procedures in this article can manage supported Windows Server versions through [Defender for Endpoint security settings management](endpoint-security-policies-configure.md).
  >
  > To onboard and manage servers through Defender for Endpoint, you need an eligible server license. If your organization accesses Defender for Endpoint only through Defender for Servers, you also need at least one active Defender for Endpoint user subscription license to use security settings management. For more information, see [Server plans](onboard-server.md#server-plans) and [Licensing and subscriptions for security settings management](/intune/device-security/microsoft-defender/security-settings-management#licensing-and-subscriptions).

## Specify the extended time-out period using Microsoft Intune

[!INCLUDE [intune-recommended-separate-product](includes/intune-recommended-separate-product.md)]

To specify the cloud block time-out period in Microsoft Intune, use an endpoint security **Antivirus** policy. For detailed instructions, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create endpoint security policies</a> or <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (links open new tabs in the Intune documentation).

When you create the policy, use these specific settings:

- **Policy type**: Go to **Manage** \> **Antivirus** on the **Endpoint security \| Overview** page at <https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/overview>.
- **Platform**: Select **Windows**.
- **Profile**: Select **Microsoft Defender Antivirus**.

When you create or modify the policy, use these specific settings on the **Configuration settings** tab:

- Slide the toggle for **Cloud Extended Timeout** to :::image type="icon" source="media/toggle-on.png" border="false"::: **Configured**.
- In the box that appears, specify a value from 0 to 50 seconds. The value is added to the default 10-second time-out period. For example, enter `50` for a total time-out period of 60 seconds.

<a name="specify-the-extended-time-out-period-using-microsoft-defender-for-endpoint-security-settings-management"></a>

## Specify the extended time-out period using the Microsoft Defender portal

If your organization [manages endpoint security policies in the Microsoft Defender portal](endpoint-security-policies-configure.md), you specify the cloud block time-out period with the same endpoint security policies that Intune uses.

For detailed instructions, see <a href="endpoint-security-policies-configure.md#create-an-endpoint-security-policy" target="_blank">Create an endpoint security policy</a> or <a href="endpoint-security-policies-configure.md#edit-an-endpoint-security-policy" target="_blank">Edit an endpoint security policy</a> (links open new tabs).

When you create the policy on the **Endpoint security policies** page in the Defender portal at <https://security.microsoft.com/policy-inventory>, use these specific settings:

- **Select platform**: Select **Windows**.
- **Select template**: Select **Microsoft Defender Antivirus**.

When you create or modify the policy, use these specific settings on the **Configuration settings** tab:

- Slide the toggle for **Cloud Extended Timeout** to :::image type="icon" source="media/toggle-on.png" border="false"::: **Configured**.
- In the box that appears, specify a value from 0 to 50 seconds. The value is added to the default 10-second time-out period. For example, enter `50` for a total time-out period of 60 seconds.

## Specify the extended time-out period using Microsoft Configuration Manager

For instructions to create and deploy an antimalware policy, see [Endpoint Protection antimalware policies in Configuration Manager](/intune/configmgr/protect/deploy-use/endpoint-antimalware-policies).

In the **Cloud Protection Service** settings of the antimalware policy, configure **Allow extended cloud check to block and scan for up to (seconds)**. Enter a value from `0` to `50`. The value is added to the default 10-second time-out period.

## Specify the extended time-out period using Group Policy

You can use Group Policy to specify an extended time-out period for cloud checks.

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MpEngine**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Both names refer to the same policy location.

1. In the details pane of **MpEngine**, open the **Configure extended cloud check** setting. To open the setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

1. In the setting window that opens, select **Enabled**.

1. In the **Options** section, for **Specify the extended cloud check time in seconds**, enter the extra time that Defender Antivirus prevents the file from running while waiting for a cloud determination. Enter a value from `0` to `50`. The value is added to the default 10-second time-out period.

1. Select **OK**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MpEngine**.

## Specify the extended time-out period using PowerShell

In an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**), replace \<0-50\> with an integer from 0 to 50, and then run the following command:

```powershell
Set-MpPreference -CloudExtendedTimeout <0-50>
```

For example, the following command adds 50 seconds to the default 10-second period, for a total of 60 seconds:

```powershell
Set-MpPreference -CloudExtendedTimeout 50
```

For detailed syntax and parameter information, see [Set-MpPreference](/powershell/module/defender/set-mppreference).

<a name="see-also"></a>

## Related content

For information about Microsoft Defender Antivirus and Defender for Endpoint on other platforms, see:

- [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
- [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
- [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
- [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure Defender for Endpoint on Android features](android-configure.md)
- [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
