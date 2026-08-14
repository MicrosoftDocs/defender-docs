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
ms.date: 08/12/2026
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

When Microsoft Defender Antivirus runs a scan, it attempts to remediate or remove threats that are detected. Remediation actions can include removing a file, sending it to quarantine, or allowing it to remain. This article includes information and links to resources about specifying what actions should be taken when threats are detected on devices. You can choose from several methods, such as:

- [Configure remediation for Microsoft Defender Antivirus detections](#configure-remediation-for-microsoft-defender-antivirus-detections)
  - [Configure remediation options using Intune](#configure-remediation-options-using-intune)
  - [Configure remediation options using Configuration Manager](#configure-remediation-options-using-configuration-manager)
  - [Configure remediation options using Group Policy](#configure-remediation-options-using-group-policy)
  - [Configure remediation options using PowerShell or WMI](#configure-remediation-options-using-powershell-or-wmi)
  - [See also](#see-also)

> [!IMPORTANT]
> Microsoft Defender Antivirus detects and remediates files based on many factors. Sometimes, completing a remediation requires a reboot. Even if the detection is later determined to be a false positive, the reboot must be completed to ensure all additional remediation steps have been completed.
>
> If you are certain Microsoft Defender Antivirus quarantined a file based on a false positive, you can restore the file from quarantine after the device reboots. See [Restore quarantined files in Microsoft Defender Antivirus](restore-quarantined-files-microsoft-defender-antivirus.md). To avoid false-positive quarantines in the future, you can exclude files from the scans. See [Configure and validate exclusions for Microsoft Defender Antivirus scans](microsoft-defender-antivirus-exclusions-configure.md).

For scan scheduling and related remediation settings, see [About regular quick and full scans with Microsoft Defender Antivirus](schedule-antivirus-scans.md).

## Prerequisites

### Supported operating systems

- Windows

## Configure remediation options using Intune

To configure remediation actions using a Microsoft Intune Endpoint Security **Antivirus policy** policy, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:

- **Policy type**: Attack surface reduction
- **Platform**: Windows
- **Profile**: Microsoft Defender Antivirus
- **Configuration settings**: In the **Threat security default action** section, configure the available settings:
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
  > Use standard remediation actions (Clean, Quarantine, Remove, or Block) in all other environments.

For more information about antivirus policies in Intune, see [Antivirus policy for endpoint security in Intune](/intune/intune-service/protect/endpoint-security-antivirus-policy).

## Configure remediation options using Configuration Manager

If you're using Configuration Manager, see the following articles:

- [Configure Endpoint Protection in Configuration Manager](/intune/configmgr/protect/deploy-use/endpoint-protection-configure)
- [Default Actions Settings](/intune/configmgr/protect/deploy-use/endpoint-antimalware-policies#default-actions-settings)

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

## Configure remediation options using PowerShell or WMI

You can also use the [`Set-MpPreference` PowerShell cmdlet](/powershell/module/defender/set-mppreference) or [`MSFT_MpPreference` WMI class](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal) to configure the threat default-action and remediation settings.

## See also

For platform-specific Defender for Endpoint configuration guidance, see the following articles:

- [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure Defender for Endpoint on Android features](android-configure.md)
- [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
