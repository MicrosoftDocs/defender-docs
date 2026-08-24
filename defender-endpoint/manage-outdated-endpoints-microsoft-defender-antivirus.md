---
title: Apply Microsoft Defender Antivirus protection updates to out of date endpoints
description: Define when and how updates should be applied for out of date endpoints in Microsoft Defender Antivirus.
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
- tier3
ms.date: 08/21/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
#customer intent: As a security administrator, I want to configure catch-up updates and scans so that endpoints remain protected after missing scheduled security intelligence updates or scans.
---

# Manage Microsoft Defender Antivirus updates and scans for endpoints that are out of date

With Microsoft Defender Antivirus, your security team can define how long an endpoint can avoid an update or how many scans it can miss before it's required to receive the update and run a scan. This article shows how to configure catch-up protection updates, set the out-of-date reporting threshold, and enable catch-up scans for endpoints that have missed scheduled updates or scans. This capability is especially useful in environments where devices aren't often connected to a corporate or external network, or for devices that aren't used on a daily basis.

For example, an employee who uses a particular computer takes three days off of work, and doesn't sign on their computer during that time. When the employee returns to work and signs into their computer, Microsoft Defender Antivirus will immediately check and download the latest protection updates, and then run a scan.

## Prerequisites

### Supported operating systems

The following operating systems support catch-up protection updates and catch-up scans:

- Windows

## Set up catch-up protection updates for endpoints that haven't updated for a while

If Microsoft Defender Antivirus didn't download protection updates for a specified period, you can set it up to automatically check and download the latest update the next time someone signs in on an endpoint. Configuring catch-up protection updates to check for updates at sign-in is useful if you have [globally disabled automatic update downloads on startup](manage-event-based-updates-microsoft-defender-antivirus.md).

You can use one of several methods to set up catch-up protection updates:

- [Use Configuration Manager to configure catch-up protection updates](#use-configuration-manager-to-configure-catch-up-protection-updates)
- [Use Group Policy to enable and configure the catch-up update feature](#use-group-policy-to-enable-and-configure-the-catch-up-update-feature)
- [Use PowerShell cmdlets to configure catch-up protection updates](#use-powershell-cmdlets-to-configure-catch-up-protection-updates)
- [Use Windows Management Instrumentation (WMI) to configure catch-up protection updates](#use-windows-management-instruction-wmi-to-configure-catch-up-protection-updates)

### Use Configuration Manager to configure catch-up protection updates

To configure catch-up protection updates in Configuration Manager, use the following steps:

1. On your Microsoft Configuration Manager console, open the anti-malware policy you want to change (select **Assets and Compliance** in the navigation pane on the left, then expand the tree to **Overview** \> **Endpoint Protection** \> **Antimalware Policies**)

1. Go to the **Security intelligence updates** section and configure the following settings:

    - Set **Force a security intelligence update if the client computer is offline for more than two consecutive scheduled updates** to **Yes**.
    - For the  **If Configuration Manager is used as a source for security intelligence updates...**, specify the hours before which the security intelligence updates delivered by Configuration Manager should be considered out of date. When the updates are considered out of date, the **If Configuration Manager is used as a source for security intelligence updates...** setting causes the endpoint to download updates from the next source in the configured [fallback source order](manage-protection-updates-microsoft-defender-antivirus.md#fallback-order).

1. Select **OK**.

1. [Deploy the antimalware policy to client computers](/sccm/protect/deploy-use/endpoint-antimalware-policies#deploy-an-antimalware-policy-to-client-computers).

### Use Group Policy to enable and configure the catch-up update feature

To enable and configure the catch-up update feature in Group Policy, use the following steps:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Group Policy paths before Windows 10, version 1909 (November 2019) might use _Signature Updates_ instead of _Security Intelligence Updates_. The older and newer names refer to the same policy locations.

1. In the details pane of **Security Intelligence Updates**, open the **Define the number of days after which a catch-up security intelligence update is required** setting. To open the setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. Enter the number of days after which you want Microsoft Defender Antivirus to check for and download the latest protection update.

   When you're finished, select **OK**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

### Use PowerShell cmdlets to configure catch-up protection updates

Use the following cmdlet to set the number of days after which a catch-up security intelligence update is required:

```PowerShell
Set-MpPreference -SignatureUpdateCatchupInterval
```

For more information about using PowerShell with Microsoft Defender Antivirus, see the following articles:

- [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md)
- [Defender Antivirus cmdlets](/powershell/module/defender/)

<a name='use-windows-management-instruction-wmi-to-configure-catch-up-protection-updates'></a>

### Use Windows Management Instrumentation (WMI) to configure catch-up protection updates

Use the [**Set** method of the **MSFT_MpPreference**](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) class with the following property to configure the number of days after which a catch-up security intelligence update is required:

```WMI
SignatureUpdateCatchupInterval
```

For more information and allowed parameters, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal).

## Set the number of days before protection is reported as out of date

You can also specify the number of days after which Microsoft Defender Antivirus protection is considered old or out of date. After the specified number of days, the client will report itself as "out of date" and will show an error to the endpoint user. When an endpoint is considered out of date, Microsoft Defender Antivirus might attempt to download an update from other sources (based on the defined [fallback source order](manage-protection-updates-microsoft-defender-antivirus.md#fallback-order)).

You can use Group Policy to specify the number of days after which endpoint protection is considered to be out of date.

### Use Group Policy to specify the number of days before protection is considered out of date

To specify when protection is considered out of date by using Group Policy, use the following steps:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Group Policy paths before Windows 10, version 1909 (November 2019) might use _Signature Updates_ instead of _Security Intelligence Updates_. The older and newer names refer to the same policy locations.

1. In the details pane of **Security Intelligence Updates**, the available settings are:
   - [Define the number of days before spyware security intelligence is considered out of date](#enable-and-configure-the-spyware-security-intelligence-age-setting)
   - [Define the number of days before virus security intelligence is considered out of date](#enable-and-configure-the-virus-security-intelligence-age-setting)

   To open and configure a security intelligence age setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

#### Enable and configure the spyware security intelligence age setting

1. In the details pane of **Security Intelligence Updates**, open the **Define the number of days before spyware security intelligence is considered out of date** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Define the number of days before spyware security intelligence is considered out of date** in the **Options** section: Enter the number of days after which you want Microsoft Defender Antivirus to consider spyware security intelligence to be out of date.

   When you're finished, select **OK**.

#### Enable and configure the virus security intelligence age setting

1. In the details pane of **Security Intelligence Updates**, open the **Define the number of days before virus security intelligence is considered out of date** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Define the number of days before virus security intelligence is considered out of date** in the **Options** section: Enter the number of days after which you want Microsoft Defender Antivirus to consider virus security intelligence to be out of date.

   When you're finished, select **OK**.

## Set up catch-up scans for endpoints that haven't been scanned for a while

You can set the number of consecutive scheduled scans that can be missed before Microsoft Defender Antivirus forces a scan.

The process for enabling catch-up scans is:

1. Set up at least one scheduled scan.

1. Enable the catch-up scan feature.

1. Define the number of scans that can be skipped before a catch-up scan occurs.

Catch-up scans can be enabled for both full and quick scans.

> [!IMPORTANT]
> Before you configure catch-up scans, set up at least one scheduled scan. Catch-up scans depend on an existing scheduled scan configuration.

> [!TIP]
> We recommend using quick scans for most situations. To learn more, see [About scheduled scans](schedule-antivirus-scans.md#comparing-the-quick-scan-full-scan-and-custom-scan).

You can use one of several methods to set up catch-up scans:

- [Use Group Policy to enable and configure the catch-up scan feature](#use-group-policy-to-enable-and-configure-the-catch-up-scan-feature)
- [Use PowerShell cmdlets to configure catch-up scans](#use-powershell-cmdlets-to-configure-catch-up-scans)
- [Use Windows Management Instrumentation (WMI) to configure catch-up scans](#use-windows-management-instruction-wmi-to-configure-catch-up-scans)
- [Use Configuration Manager to configure catch-up scans](#use-configuration-manager-to-configure-catch-up-scans)

### Use Group Policy to enable and configure the catch-up scan feature

To enable and configure the catch-up scan feature in Group Policy, use the following steps:

1. Ensure you set up at least one scheduled scan.

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Scan**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Both names refer to the same policy location.

1. In the details pane of **Scan**, the available settings are:
   - [Turn on catch-up quick scan](#enable-and-configure-catch-up-quick-scans)
   - [Turn on catch-up full scan](#enable-and-configure-catch-up-full-scans)
   - [Define the number of days after which a catch-up scan is forced](#enable-and-configure-forced-catch-up-scans)

   To open and configure a catch-up scan setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Scan**.

#### Enable and configure catch-up quick scans

1. In the details pane of **Scan**, open the **Turn on catch-up quick scan** setting.

1. In the setting window that opens, select **Enabled**, and then select **OK**.

#### Enable and configure catch-up full scans

1. In the details pane of **Scan**, open the **Turn on catch-up full scan** setting.

1. In the setting window that opens, select **Enabled**, and then select **OK**.

#### Enable and configure forced catch-up scans

1. In the details pane of **Scan**, open the **Define the number of days after which a catch-up scan is forced** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. Enter the number of scans that can be missed before a scan automatically runs when the user next signs in on the endpoint.

   The type of scan that runs is determined by the **Specify the scan type to use for a scheduled scan** setting. For more information, see [About scheduled scans](schedule-antivirus-scans.md).

   When you're finished, select **OK**.

> [!NOTE]
> The Group Policy setting title refers to the number of days. The setting, however, is applied to the number of scans (not days) before the catch-up scan will be run.

### Use PowerShell cmdlets to configure catch-up scans

Use the following cmdlets to enable or disable catch-up scans for full and quick scheduled scans. By default, catch-up full and quick scans are disabled. Set the corresponding value to `$false` to enable catch-up behavior and force a scan after missed scheduled scans:

```PowerShell
Set-MpPreference -DisableCatchupFullScan
Set-MpPreference -DisableCatchupQuickScan

```

For more information about using PowerShell with Microsoft Defender Antivirus, see the following articles:

- [Use PowerShell cmdlets to manage Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) 
- [Defender Antivirus cmdlets](/powershell/module/defender/)

<a name='use-windows-management-instruction-wmi-to-configure-catch-up-scans'></a>

### Use Windows Management Instrumentation (WMI) to configure catch-up scans

Use the [**Set** method of the **MSFT_MpPreference**](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) class with the following properties to enable or disable catch-up behavior for full and quick scheduled scans:

```WMI
DisableCatchupFullScan
DisableCatchupQuickScan
```

For more information and allowed parameters, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal).

### Use Configuration Manager to configure catch-up scans

To configure catch-up scans in Configuration Manager, use the following steps:

1. On your Microsoft Configuration Manager console, open the anti-malware policy you want to change (select **Assets and Compliance** in the navigation pane on the left, then expand the tree to **Overview** \> **Endpoint Protection** \> **Antimalware Policies**)

1. Go to the **Scheduled scans** section and **Force a scan of the selected scan type if client computer is offline...** to **Yes**.

1. Select **OK**.

1. [Deploy the antimalware policy to client computers](/sccm/protect/deploy-use/endpoint-antimalware-policies#deploy-an-antimalware-policy-to-client-computers).

### Use Group Policy to configure security intelligence updates over a metered connection

To configure security intelligence updates over a metered connection by using Group Policy, use the following steps:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

1. In the details pane of **Security Intelligence Updates**, open the **Allows Microsoft Defender Antivirus to update and communicate over a metered connection.** setting. To open the setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

1. In the setting window that opens, select **Enabled**, and then select **OK**.
    
|Settings|Description|Default|
|---|---|---|
|Allows Microsoft Defender Antivirus to update and communicate over a metered connection.|Enabling this policy automatically downloads updates, even over metered data connections (charges might apply).|Disabled|

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

- [Deploy Microsoft Defender Antivirus](deploy-manage-report-microsoft-defender-antivirus.md)
- [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md)
- [Manage when protection updates should be downloaded and applied](manage-protection-update-schedule-microsoft-defender-antivirus.md)
- [Manage event-based forced updates](manage-event-based-updates-microsoft-defender-antivirus.md)
- [Manage updates for mobile devices and virtual machines (VMs)](manage-updates-mobile-devices-vms-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)
