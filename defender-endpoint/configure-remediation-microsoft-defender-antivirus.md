---
title: Configure remediation for Microsoft Defender Antivirus detections
description: Configure what Microsoft Defender Antivirus should do when it detects a threat, and how long quarantined files should be retained in the quarantine folder.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.topic: how-to
ms.custom: nextgen, msecd-doc-authoring-1015
ms.date: 09/02/2026
ai-usage: ai-assisted
ms.reviewer: yongrhee
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
#customer intent: As a security administrator, I want to configure remediation actions and retention periods so that Microsoft Defender Antivirus handles detected threats according to my organization's requirements.
---

# Configure remediation for Microsoft Defender Antivirus detections

When Microsoft Defender Antivirus runs a scan, it attempts to remediate or remove threats that are detected. Remediation actions can include removing a file, sending it to quarantine, or allowing it to remain. This article includes information and links to resources about specifying what actions should be taken when threats are detected on devices.

> [!IMPORTANT]
> Microsoft Defender Antivirus detects and remediates files based on many factors. Sometimes, completing a remediation requires a reboot. Even if the detection is later determined to be a false positive, the reboot must be completed to ensure all additional remediation steps have been completed.
>
> If you are certain Microsoft Defender Antivirus quarantined a file based on a false positive, you can restore the file from quarantine after the device reboots. See [Restore quarantined files in Microsoft Defender Antivirus](restore-quarantined-files-microsoft-defender-antivirus.md). To avoid false-positive quarantines in the future, you can exclude files from the scans. See [Configure and validate exclusions for Microsoft Defender Antivirus scans](microsoft-defender-antivirus-exclusions-configure.md).

For scan scheduling and related remediation settings, see [About regular quick and full scans with Microsoft Defender Antivirus](schedule-antivirus-scans.md).

## Prerequisites

### Supported operating systems

- Windows

## Configure remediation options using Intune

[!INCLUDE [intune-recommended-separate-product](includes/intune-recommended-separate-product.md)]

To configure remediation actions in Microsoft Intune, use an endpoint security **Antivirus** policy. For detailed instructions, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create endpoint security policies</a> or <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (links open new tabs in the Intune documentation).

When you create the policy, use these specific settings:

- **Policy type**: Go to **Manage** \> **Antivirus** on the **Endpoint security \| Overview** page at <https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/overview>.
- **Platform**: Select **Windows**.
- **Profile**: Select **Microsoft Defender Antivirus**.

When you create or modify the policy, use these specific settings on the **Configuration settings** tab:

- In the **Threat security default action** section, configure the available settings:
  - **Remediation action for High severity threats**
  - **Remediation action for Severe threats**
  - **Remediation action for Low severity threats**
  - **Remediation action for Moderate severity threats**

  with an available action value:

  - **Not configured** (default)
  - **Clean**
  - **Quarantine**
  - **Remove**
  - **Allow**
  - **User defined**
  - **Block**

  > [!WARNING]
  > **Allow** doesn't remediate detected threats and suppresses ongoing detection events. Don't configure this action when [tamper protection is enabled](prevent-changes-to-security-settings-with-tamper-protection.md). Use **Allow** only in specialized environments (for example, industrial control systems or critical infrastructure) where:
  >
  > - Automatic remediation isn't practical for operations.
  > - Other procedures exist to respond to detected threats.
  > - Compensating security controls are deployed.
  >
  > Use standard remediation actions (**Clean**, **Quarantine**, **Remove**, or **Block**) in all other environments.

For more information about antivirus policies in Intune, see [Antivirus policy for endpoint security in Intune](/intune/intune-service/protect/endpoint-security-antivirus-policy).

## Configure remediation options in the Microsoft Defender portal

If your organization [manages endpoint security policies in the Microsoft Defender portal](endpoint-security-policies-configure.md), use a Microsoft Defender Antivirus policy to configure remediation actions.

For detailed instructions, see <a href="endpoint-security-policies-configure.md#create-an-endpoint-security-policy" target="_blank">Create an endpoint security policy</a> or <a href="endpoint-security-policies-configure.md#edit-an-endpoint-security-policy" target="_blank">Edit an endpoint security policy</a> (links open new tabs).

When you create the policy on the **Endpoint security policies** page in the Defender portal at <https://security.microsoft.com/policy-inventory>, use these specific settings:

- **Select platform**: Select **Windows**.
- **Select template**: Select **Microsoft Defender Antivirus**.

When you create or modify the policy, use the same remediation action settings described in [Configure remediation options using Intune](#configure-remediation-options-using-intune) on the **Configuration settings** tab.

## Configure remediation options using Configuration Manager

For instructions to create and deploy an antimalware policy, see [Endpoint Protection antimalware policies in Configuration Manager](/intune/configmgr/protect/deploy-use/endpoint-antimalware-policies).

Configure the following settings in the antimalware policy:

- **Default Actions Settings**: For each threat severity level, select one of the following remediation actions:
  - **Recommended**: Use the action recommended in the malware definition file.
  - **Quarantine**: Quarantine the detected malware without removing it.
  - **Remove**: Remove the detected malware.
  - **Allow**: Don't remove or quarantine the detected malware.
- **Threat Overrides Settings**: For **Threat name and override action**, select **Set** to configure the remediation action for a specific threat ID.

> [!WARNING]
> **Allow** doesn't remediate detected threats. Use **Allow** only in specialized environments where automatic remediation isn't practical, other threat-response procedures exist, and compensating security controls are deployed.

## Configure remediation options using Group Policy

Use the following steps to configure remediation options in Group Policy:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Both names refer to the same policy location.

1. In the details pane of **Microsoft Defender Antivirus**, use the following table to select the location and setting you want to configure.

   |Subfolder|Setting|Description|Default setting (if not configured)|
   |---|---|---|---|
   |n/a|Turn off routine remediation.|Specify whether Microsoft Defender Antivirus automatically remediates threats, or whether to prompt the user.|Disabled. Threats are remediated automatically.|
   |Quarantine|Configure removal of items from Quarantine folder.|Specify how many days items should be kept in quarantine before being removed.|90 days|
   |Scan|Create a system restore point.|A system restore point is created each day before cleaning or scanning is attempted. |Disabled|
   |Scan|Turn on removal of items from scan history folder.|Specify how many days items should be kept in the scan history.|30 days|
   |Threats|Specify threat alert levels at which default action shouldn't be taken when detected.|Every threat that is detected by Microsoft Defender Antivirus is assigned a threat level: <ul><li>`1`: Low</li><li>`2`: Medium</li><li>`4`: High</li><li>`5`: Severe</li></ul> Use this setting to specify how threats for each level are remediated. Valid values are: <ul><li>`2`: Quarantine</li><li>`3`: Remove</li><li>`6`: Ignore</li><li>`11`: None</li></ul> **Warning**: The actions Ignore (`6`) and None (`11`) don't remediate detected threats. Ignore (`6`) suppresses ongoing detection events, while None (`11`) continues to generate alerts and Protection History entries. Don't configure either action when [tamper protection is enabled](prevent-changes-to-security-settings-with-tamper-protection.md). Use these actions only in specialized environments (for example, industrial control systems or critical infrastructure) where Automatic remediation isn't practical for operations, other procedures exist to respond to detected threats, or compensating security controls are deployed. Use standard remediation actions (Quarantine (`2`) or Remove (`3`)) in all other environments.|n/a|
   |Threats|Specify threats upon which default action shouldn't be taken when detected.|Specify how specific threats (using their threat ID) should be remediated. You can specify whether the specific threat should be quarantined, removed, or ignored.|n/a|

1. In the details pane of the selected location, open the setting. To open and configure a setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

1. In the setting window that opens, configure the setting, and then select **OK**.

   Repeat this step as many times as necessary.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus**.

<a name="configure-remediation-options-using-powershell-or-wmi"></a>

## Configure remediation options using PowerShell

Run the commands in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**).

### Configure default actions by threat severity

The following example quarantines low and moderate severity threats and removes high and severe threats:

```powershell
Set-MpPreference -LowThreatDefaultAction Quarantine -ModerateThreatDefaultAction Quarantine -HighThreatDefaultAction Remove -SevereThreatDefaultAction Remove
```

### Configure the default action for a specific threat

Replace `<threat-ID>` with the numeric threat ID. The following command quarantines the specified threat:

```powershell
Set-MpPreference -ThreatIDDefaultAction_Ids <threat-ID> -ThreatIDDefaultAction_Actions Quarantine
```

To configure multiple threats, specify comma-separated lists of threat IDs and corresponding actions. Each action applies to the threat ID in the same position in the other list.

### Configure quarantine and scan history retention

The following example keeps items in quarantine for 90 days and items in scan history for 30 days:

```powershell
Set-MpPreference -QuarantinePurgeItemsAfterDelay 90 -ScanPurgeItemsAfterDelay 30
```

Specify `0` to keep items indefinitely.

### Turn on system restore point creation

The following command allows Microsoft Defender Antivirus to create a system restore point before cleaning or scanning:

```powershell
Set-MpPreference -DisableRestorePoint $false
```

For detailed syntax, available remediation actions, and parameter information, see [**Set-MpPreference**](/powershell/module/defender/set-mppreference).

## See also

For platform-specific Defender for Endpoint configuration guidance, see the following articles:

- [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure Defender for Endpoint on Android features](android-configure.md)
- [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
