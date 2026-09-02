---
title: Apply Microsoft Defender Antivirus updates after certain events
description: Manage how Microsoft Defender Antivirus applies security intelligence updates after startup or receiving cloud-delivered detection reports.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1016
ms.date: 07/02/2026
ms.reviewer: pahuijbr
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

# Manage event-based forced updates

Microsoft Defender Antivirus lets you control whether updates occur after certain events. For example, you can trigger updates at startup or after receiving reports from the cloud protection service. This article shows how to configure event-based protection updates by using Group Policy, PowerShell, WMI, Microsoft Intune, and Microsoft Configuration Manager.

## Prerequisites

Before you configure event-based forced updates, make sure your environment meets the following requirements.

### Supported operating systems

The following operating systems are supported:

- Windows

## Check for protection updates before running a scan

You can use Microsoft Defender for Endpoint Security Settings Management, Microsoft Intune, Microsoft Configuration Manager, Group Policy, PowerShell cmdlets, and WMI to force Microsoft Defender Antivirus to check and download protection updates before running a scheduled scan.

### Use Microsoft Defender for Endpoint Security Settings Management to check for protection updates before running a scan

To configure protection update checks before scans in Microsoft Defender for Endpoint Security Settings Management, perform the following steps:

1. On your Microsoft Defender for Endpoint console ([Microsoft Defender portal](https://security.microsoft.com)), go to **Endpoints** > **Configuration management** > **Endpoint security policies** > **Create new policy**.

   - In the **Platform** list, select **Windows 10, Windows 11, and Windows Server**.
   - In the **Select Templates** list, select **Microsoft Defender Antivirus**.

1. Fill in the name and description, and then select **Next**>

1. Go to the **Scheduled scans** section and set **Check For Signatures Before Running Scan** to **Enabled**.

1. Deploy the updated policy by selecting **Next** to review your settings, and then select **Save**. The policy is applied to the device groups included in the policy scope.

### Use Microsoft Intune to check for protection updates before running a scan

To configure protection update checks before scans in Microsoft Intune, perform the following steps:

1. In the [Microsoft Intune admin center](https://intune.microsoft.com/), go to **Endpoints** > **Configuration management** > **Endpoint security policies**, and then select **Create new policy**.

   - In the **Platform** list, select **Windows 10, Windows 11, and Windows Server**.
   - In the **Select Templates** list, select **Microsoft Defender Antivirus**.

1. Fill in the name and description, and then select **Next**.

1. Go to the **Scheduled scans** section, and set **Check For Signatures Before Running Scan** to **Enabled**.

1. Save and deploy the policy.

### Use Configuration Manager to check for protection updates before running a scan

To configure protection update checks before scans in Configuration Manager, perform the following steps:

1. On your Microsoft Configuration Manager console, open the antimalware policy you want to change (select **Assets and Compliance** in the navigation pane, then expand the tree to **Overview** \> **Endpoint Protection** \> **Antimalware Policies**).

1. Go to the **Scheduled scans** section and set **Check for the latest security intelligence updates before running a scan** to **Yes**.

1. Select **OK**.

1. [Deploy the updated policy as usual](/sccm/protect/deploy-use/endpoint-antimalware-policies#deploy-an-antimalware-policy-to-client-computers).

### Use Group Policy to check for protection updates before running a scan

To configure protection update checks before scans in Group Policy, perform the following steps:

1. On your Group Policy management machine, open the [Group Policy Management Console](/previous-versions/windows/desktop/gpmc/group-policy-management-console-portal).

1. Right-click the Group Policy Object you want to configure, and then select **Edit**.

1. Using the **Group Policy Management Editor** go to **Computer configuration**.

1. Select **Policies** then **Administrative templates**.

1. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **Scan**.

1. Double-click **Check for the latest virus and spyware definitions before running a scheduled scan** and set the option to **Enabled**.

1. Select **OK**.

### Use PowerShell cmdlets to check for protection updates before running a scan

To require Microsoft Defender Antivirus to check for updated signatures before starting a scheduled scan, run the following cmdlet:

```PowerShell
Set-MpPreference -CheckForSignaturesBeforeRunningScan 1
```

For more information, see [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Defender Antivirus cmdlets](/powershell/module/defender/index).

### Use Windows Management Instrumentation (WMI) to check for protection updates before running a scan

To configure Microsoft Defender Antivirus to check for updated signatures before running a scan, use the [**Set** method of the **MSFT_MpPreference**](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) class with the following property:

```WMI
CheckForSignaturesBeforeRunningScan
```

For more information, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal).

## Check for protection updates on startup

You can use Group Policy to force Microsoft Defender Antivirus to check and download protection updates when the machine is started.

1. On your Group Policy management computer, open the [Group Policy Management Console](/previous-versions/windows/desktop/gpmc/group-policy-management-console-portal), right-click the Group Policy Object you want to configure and select **Edit**.

1. Using the **Group Policy Management Editor** go to **Computer configuration**.

1. Select **Policies** then **Administrative templates**.

1. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

1. Double-click **Check for the latest virus and spyware definitions on startup** and set the option to **Enabled**.

1. Select **OK**.

You can also use Group Policy, PowerShell, or WMI to configure Microsoft Defender Antivirus to check for updates at startup even when it isn't running.

### Use Group Policy to download updates when Microsoft Defender Antivirus is not present

To configure Group Policy to download updates when Microsoft Defender Antivirus is not present, perform the following steps:

1. On your Group Policy management machine, open the [Group Policy Management Console](/previous-versions/windows/desktop/gpmc/group-policy-management-console-portal), right-click the Group Policy Object you want to configure and select **Edit**.

1. Using the **Group Policy Management Editor**, go to **Computer configuration**.

1. Select **Policies** then **Administrative templates**.

1. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

1. Double-click **Initiate security intelligence update on startup** and set the option to **Enabled**.

1. Select **OK**.

### Use PowerShell cmdlets to download updates when Microsoft Defender Antivirus is not present

To control whether Microsoft Defender Antivirus downloads signature updates at startup when the antimalware engine isn't running, run the following cmdlet:

```PowerShell
Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine
```

For more information, see [Use PowerShell cmdlets to manage Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Defender Antivirus cmdlets](/powershell/module/defender/index) for more information on how to use PowerShell with Microsoft Defender Antivirus.

### Use Windows Management Instrumentation (WMI) to download updates when Microsoft Defender Antivirus is not present

To configure whether signature updates occur at startup when the antimalware engine isn't running, use the [**Set** method of the **MSFT_MpPreference**](/previous-versions/windows/desktop/legacy/dn455323(v=vs.85)) class with the following property:

```WMI
SignatureDisableUpdateOnStartupWithoutEngine
```

For more information, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal).

<a id="cloud-report-updates"></a>
## Allow ad hoc changes to protection based on cloud-delivered protection

Microsoft Defender Antivirus can update its protection based on cloud-delivered protection. These updates can happen outside of normal or scheduled updates.

When cloud-delivered protection is turned on, Microsoft Defender Antivirus sends suspicious files to the cloud for analysis. If the cloud reports that a file is malicious, you can use Group Policy to get that protection update right away. Microsoft Defender Antivirus can also automatically apply other critical protection updates identified by the cloud service.

### Use Group Policy to automatically download recent updates based on cloud-delivered protection

To configure Group Policy to automatically download recent updates based on cloud-delivered protection, perform the following steps:

1. On your Group Policy management machine, open the [Group Policy Management Console](/previous-versions/windows/desktop/gpmc/group-policy-management-console-portal), right-click the Group Policy Object you want to configure and select **Edit**.

1. Using the **Group Policy Management Editor** go to **Computer configuration**.

1. Select **Policies** then **Administrative templates**.

1. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **Security Intelligence Updates**.

1. Double-click **Allow real-time security intelligence updates based on reports to Microsoft MAPS** and set the option to **Enabled**. Then select **OK**.

1. **Allow notifications to disable definitions-based reports to Microsoft MAPS** and set the option to **Enabled**. Then select **OK**.

    > [!NOTE]
    > **Allow notifications to disable definitions based reports** enables Microsoft MAPS to disable those definitions known to cause false-positive reports. You must configure your computer to join Microsoft MAPS for this function to work.

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)

## See also

For more information about managing Microsoft Defender Antivirus updates, see the following articles:

- [Deploy Microsoft Defender Antivirus](deploy-manage-report-microsoft-defender-antivirus.md)
- [Manage Microsoft Defender Antivirus updates and apply baselines](microsoft-defender-antivirus-updates.md)
- [Manage when protection updates should be downloaded and applied](manage-protection-update-schedule-microsoft-defender-antivirus.md)
- [Manage updates for endpoints that are out of date](manage-outdated-endpoints-microsoft-defender-antivirus.md)
- [Manage updates for mobile devices and virtual machines (VMs)](manage-updates-mobile-devices-vms-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)



