---
title: Schedule Microsoft Defender Antivirus protection updates
description: Schedule the day, time, and interval for when protection updates should be downloaded.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 08/12/2026
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1015
ms.reviewer: pahuijbr
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
#customer intent: As a security administrator, I want to schedule protection updates so that endpoints receive security intelligence updates at the required times.
---
# Manage the schedule for when protection updates should be downloaded and applied

> [!IMPORTANT]
> Customers who applied the March 2022 Microsoft Defender engine update (**1.1.19100.5**) might have encountered high resource utilization (CPU and/or memory). Microsoft has released an update (**1.1.19200.5**) that resolves the bugs introduced in the earlier version. Customers are recommended to update to Microsoft Defender Antivirus Engine build **1.1.19200.5**. To ensure any performance issues are fully fixed, it's recommended to reboot machines after applying Microsoft Defender Antivirus Engine update 1.1.19200.5. For more information, see [Monthly platform and engine versions](microsoft-defender-endpoint-releases.md#microsoft-defender-antivirus-releases).


This article explains how to configure scheduled protection updates for Microsoft Defender Antivirus using Configuration Manager, Group Policy, PowerShell, or WMI. Microsoft Defender Antivirus lets you determine when it should look for and download updates.

You can schedule updates for your endpoints by:

- Specifying the day of the week to check for protection updates
- Specifying the interval to check for protection updates
- Specifying the time to check for protection updates

You can also randomize the times when each endpoint checks and downloads protection updates. For more information, see [About schedule scans](schedule-antivirus-scans.md).

## Prerequisites

Before you configure scheduled protection updates, make sure the following requirements are met.

### Supported operating systems

The following operating systems are supported:

- Windows

## Use Configuration Manager to schedule protection updates

To schedule protection updates by using Configuration Manager, perform the following steps:

1. On your Microsoft Configuration Manager console, open the antimalware policy you want to change (select **Assets and Compliance** in the navigation pane on the left, then expand the tree to **Overview** \> **Endpoint Protection** \> **Antimalware Policies**)

1. Go to the **Security intelligence updates** section.

1. To check and download updates at a certain time:

   - Set **Check for Endpoint Protection security intelligence updates at a specific interval...** to **0**.
   - Set **Check for Endpoint Protection security intelligence updates daily at...** to the time when updates should be checked.

1. To check and download updates on a continual interval, Set **Check for Endpoint Protection security intelligence updates at a specific interval...** to the number of hours that should occur between updates.

1. [Deploy the updated policy as usual](/sccm/protect/deploy-use/endpoint-antimalware-policies#deploy-an-antimalware-policy-to-client-computers).

## Use Group Policy to schedule protection updates

> [!IMPORTANT]
> By default, the update schedule day (`SignatureScheduleDay`) is set to "8" (no day specified) and the update check interval (`SignatureUpdateInterval`) is set to "0" (disabled), so Microsoft Defender Antivirus doesn't schedule protection updates automatically. Enabling `SignatureScheduleDay` or `SignatureUpdateInterval` overrides that default.

To schedule protection updates by using Group Policy, perform the following steps:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Group Policy paths before Windows 10, version 1909 (November 2019) might use _Signature Updates_ instead of _Security Intelligence Updates_. The older and newer names refer to the same policy locations.

1. In the details pane of **Security Intelligence Updates**, the available settings are:
   - [Specify the day of the week to check for security intelligence updates](#enable-and-configure-the-security-intelligence-update-day)
   - [Specify the interval to check for security intelligence updates](#enable-and-configure-the-security-intelligence-update-interval)
   - [Specify the time to check for security intelligence updates](#enable-and-configure-the-security-intelligence-update-time)

   To open and configure a security intelligence update schedule setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

### Enable and configure the security intelligence update day

1. In the details pane of **Security Intelligence Updates**, open the **Specify the day of the week to check for security intelligence updates** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Specify the day of the week to check for security intelligence updates** in the **Options** section: Select the day of the week to check for updates.

   When you're finished, select **OK**.

### Enable and configure the security intelligence update interval

1. In the details pane of **Security Intelligence Updates**, open the **Specify the interval to check for security intelligence updates** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Specify the interval to check for security intelligence updates** in the **Options** section: Enter a value from `1` to `24` for the number of hours between updates.

   When you're finished, select **OK**.

### Enable and configure the security intelligence update time

1. In the details pane of **Security Intelligence Updates**, open the **Specify the time to check for security intelligence updates** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Specify the time to check for security intelligence updates** in the **Options** section: Enter the number of minutes after midnight when updates should be checked. For example, enter `120` for 2:00 AM. The schedule is based on the local time of the endpoint.

   When you're finished, select **OK**.

## Use PowerShell cmdlets to schedule protection updates

Use the following cmdlets to set the day, time, and interval for protection update checks:

```PowerShell
Set-MpPreference -SignatureScheduleDay
Set-MpPreference -SignatureScheduleTime
Set-MpPreference -SignatureUpdateInterval
```

See [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md)  and [Defender Antivirus cmdlets](/powershell/module/defender/) for more information on how to use PowerShell with Microsoft Defender Antivirus.

## Use Windows Management Instrumentation (WMI) to schedule protection updates

Use the [**Set** method of the **MSFT_MpPreference**](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) class for the following properties to configure the signature update schedule day, time, and interval:

```WMI
SignatureScheduleDay
SignatureScheduleTime
SignatureUpdateInterval
```

See the following for more information and allowed parameters:

- [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal)

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)

<a name="related-articles"></a>
## Related content

- [Deploy Microsoft Defender Antivirus](deploy-manage-report-microsoft-defender-antivirus.md)
- [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md)
- [Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md)
- [Manage event-based forced updates](manage-event-based-updates-microsoft-defender-antivirus.md)
- [Manage updates for mobile devices and virtual machines (VMs)](manage-updates-mobile-devices-vms-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10 and 11](microsoft-defender-antivirus-windows.md)
