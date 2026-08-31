---
title: Turn on cloud protection in Microsoft Defender Antivirus
description: Turn on cloud protection to benefit from fast and advanced protection features.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.date: 08/12/2026
ms.reviewer: pahuijbr
ms.custom: nextgen, msecd-doc-authoring-1015
ms.subservice: asr
ms.collection:
- m365-security
- tier2
- mde-asr
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
#customer intent: As a security administrator, I want to turn on cloud protection so that Microsoft Defender Antivirus can use cloud-delivered detection and protection features.
---
# Turn on cloud protection in Microsoft Defender Antivirus


[Cloud protection in Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md) delivers accurate, real-time, and intelligent protection. Cloud protection should be enabled by default.

> [!NOTE]
> [Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) helps keep cloud protection and other security settings from being changed. Because tamper protection prevents unauthorized changes, any changes made to [tamper-protected settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on) are ignored when tamper protection is enabled. If you must make changes to a device and those changes are blocked by tamper protection, we recommend using [troubleshooting mode](enable-troubleshooting-mode.md) to temporarily disable tamper protection on the device. Note that after troubleshooting mode ends, any changes made to tamper-protected settings are reverted to their configured state.

## Prerequistes

### Supported operating systems

The following operating systems support cloud protection:

- Windows

## Why cloud protection should be turned on

Microsoft Defender Antivirus cloud protection helps protect against malware on your endpoints and across your network. We recommend keeping cloud protection turned on, because certain security features and capabilities in Microsoft Defender for Endpoint only work when cloud protection is enabled.

[![Diagram of Defender for Endpoint features that depend on cloud protection, such as tamper protection, block at first sight, and ASR rules.](media/mde-cloud-protection.png#lightbox)](enable-cloud-protection-microsoft-defender-antivirus.md)

The following table summarizes the features and capabilities that depend on cloud protection:

| Feature/Capability  | Subscription requirement | Description |
| --- | --- | --- |
| **Checking against metadata in the cloud**. The Microsoft Defender Antivirus cloud service uses machine learning models as an extra layer of defense. These machine learning models include metadata, so when a suspicious or malicious file is detected, its metadata is checked. <br/><br/>To learn more, see [Blog: Get to know the advanced technologies at the core of Microsoft Defender for Endpoint next-generation protection](https://www.microsoft.com/security/blog/2019/06/24/inside-out-get-to-know-the-advanced-technologies-at-the-core-of-microsoft-defender-atp-next-generation-protection/)  | Microsoft Defender for Endpoint Plan 1 or Plan 2 (Standalone or included in a plan like Microsoft 365 E3 or E5) |
| **[Cloud protection and sample submission](cloud-protection-microsoft-antivirus-sample-submission.md)**. Files and executables can be sent to the Microsoft Defender Antivirus cloud service for detonation and analysis. Automatic sample submission relies on cloud protection, although it can also be configured as a standalone setting.<br/><br/>To learn more, see [Cloud protection and sample submission in Microsoft Defender Antivirus](cloud-protection-microsoft-antivirus-sample-submission.md). | Microsoft Defender for Endpoint Plan 1 or Plan 2 (Standalone or included in a plan like Microsoft 365 E3 or E5) |
| **[Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md)**. Tamper protection helps protect against unwanted changes to your organization's security settings. <br/><br/>To learn more, see [Protect security settings with tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md).  | Microsoft Defender for Endpoint Plan 2 (Standalone or included in a plan like Microsoft 365 E5) |
| **[Block at first sight](configure-block-at-first-sight-microsoft-defender-antivirus.md)** <br/>Block at first sight detects new malware and blocks it within seconds. When a suspicious or malicious file is detected, block at first sight capabilities queries the cloud protection backend and applies heuristics, machine learning, and automated analysis of the file to determine whether it's a threat.<br/><br/>To learn more, see [What is "block at first sight"?](configure-block-at-first-sight-microsoft-defender-antivirus.md#what-is-block-at-first-sight)  | Microsoft Defender for Endpoint Plan 1 or Plan 2 (Standalone or included in a plan like Microsoft 365 E3 or E5) |
| **[Emergency signature updates](microsoft-defender-antivirus-updates.md#security-intelligence-updates)**. When malicious content is detected, emergency signature updates and fixes are deployed. Rather than wait for the next regular update, you can receive these fixes and updates within minutes. <br/><br/>To learn more about updates, see [Microsoft Defender Antivirus security intelligence and product updates](microsoft-defender-antivirus-updates.md). | Microsoft Defender for Endpoint Plan 2 (Standalone or included in a plan like Microsoft 365 E5) |
| **[Endpoint detection and response (EDR) in block mode](edr-in-block-mode.md)**. EDR in block mode provides extra protection when Microsoft Defender Antivirus isn't the primary antivirus product on a device. EDR in block mode remediates artifacts found during EDR-generated scans that the non-Microsoft, primary antivirus solution might have missed. When enabled for devices with Microsoft Defender Antivirus as the primary antivirus solution, EDR in block mode provides the added benefit of automatically remediating artifacts identified during EDR-generated scans. <br/><br/>To learn more, see [EDR in block mode](edr-in-block-mode.md). | Microsoft Defender for Endpoint Plan 2 (Standalone or included in a plan like Microsoft 365 E5) |
| **[Attack surface reduction (ASR) rules](attack-surface-reduction-rules-overview.md)**. ASR rules block risky behavior from apps. Some ASR rules require cloud protection. For m9ore information, see [Requirements for ASR rules](attack-surface-reduction-rules-overview.md#requirements-for-asr-rules). | Microsoft Defender for Endpoint Plan 1 or Plan 2 (Standalone or included in a plan like Microsoft 365 E3 or E5) |
| **[Indicators of compromise (IoCs)](indicators-overview.md)**. In Defender for Endpoint, IoCs can be configured to define the detection, prevention, and exclusion of entities. Examples: <br/>"Allow" indicators can be used to define exceptions to antivirus scans and remediation actions.<br/>"Alert and block" indicators can be used to prevent files or processes from executing. <br/><br/>To learn more, see [Create indicators](indicators-overview.md). | Microsoft Defender for Endpoint Plan 2 (Standalone or included in a plan like Microsoft 365 E5) |

## Methods to configure cloud protection

You can turn Microsoft Defender Antivirus cloud protection on or off by using one of the following methods:

- [Turn on cloud protection in Microsoft Defender Antivirus](#turn-on-cloud-protection-in-microsoft-defender-antivirus)
  - [Why cloud protection should be turned on](#why-cloud-protection-should-be-turned-on)
  - [Methods to configure cloud protection](#methods-to-configure-cloud-protection)
  - [Use Microsoft Intune to turn on cloud protection](#use-microsoft-intune-to-turn-on-cloud-protection)
  - [Use Group Policy to turn on cloud protection](#use-group-policy-to-turn-on-cloud-protection)
  - [Use PowerShell cmdlets to turn on cloud protection](#use-powershell-to-turn-on-cloud-protection)
  - [Use Windows Management Instrumentation (WMI) to turn on cloud protection](#use-windows-management-instruction-wmi-to-turn-on-cloud-protection)
  - [Turn on cloud protection on individual clients with the Windows Security app](#turn-on-cloud-protection-on-individual-clients-with-the-windows-security-app)
  - [See also](#see-also)

You can also use [Configuration Manager](/intune/configmgr/protect/deploy-use/defender-advanced-threat-protection). And, you can turn cloud protection on or off on individual endpoints by using the [Windows Security app](#turn-on-cloud-protection-on-individual-clients-with-the-windows-security-app).

For more information about the specific network-connectivity requirements to ensure your endpoints can connect to the cloud protection service, see [Configure and validate network connections](configure-network-connections-microsoft-defender-antivirus.md).

> [!NOTE]
> In Windows 10 and Windows 11, there is no difference between the **Basic** and **Advanced** reporting options described in this article. The distinction between the Basic and Advanced reporting options is legacy, and choosing either setting results in the same level of cloud protection. There is no difference in the type or amount of information that is shared. For more information on what we collect, see the [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?linkid=521839).

## Use Microsoft Intune to turn on cloud protection

To enable cloud protection by using Microsoft Intune, you first select an existing policy or create a new policy.

To create a new policy and enable cloud protection in Intune, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the endpoint security policy, use these settings:

- **Policy type**: Antivirus
- **Platform**: Windows
- **Profile**: Microsoft Defender Antivirus
- **Basics**: Specify a name and description for the policy
- **Defender**: Find **Allow Cloud Protection** and set it to **Allowed**.
- **Submit Samples Consent**: Select **Send all samples automatically** or **Send safe samples automatically**
- **Scope tags**: If your organization is using [scope tags](/intune/intune-service/fundamentals/scope-tags), select the tags you want to use
- **Assignments**: Select the groups, users, or devices to whicj that you want to apply this policy

When modifying an existing policy, see <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (opens in a new tab in the Intune documentation). Select the antivirus policy you want to edit and choose the following options:

- **Defender**: Find **Allow Cloud Protection** and set it to **Allowed**.
- **Submit Samples Consent**: Select **Send all samples automatically** or **Send safe samples automatically**

> [!TIP]
> To learn more about Microsoft Defender Antivirus settings in Intune, see [Antivirus policy for endpoint security in Intune](/intune/intune-service/protect/endpoint-security-antivirus-policy).

## Use Group Policy to turn on cloud protection

> [!NOTE]
> MAPS settings are equal to cloud-delivered protection.

To enable cloud protection by using Group Policy, perform the following steps:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MAPS**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Both names refer to the same policy location.

1. In the details pane of **MAPS**, the available settings are:
   - [Join Microsoft MAPS](#enable-and-configure-join-microsoft-maps)
   - [Send file samples when further analysis is required](#enable-and-configure-send-file-samples-when-further-analysis-is-required)

   To open and configure a cloud protection setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MAPS**.

### Enable and configure Join Microsoft Maps

1. In the details pane of **MAPS**, open the **Join Microsoft MAPS** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Join Microsoft MAPS** in the **Options** section: Select one of the following values:
      - **Basic MAPS**: Basic membership sends basic information to Microsoft about malware and potentially unwanted software that has been detected on your device. Information includes where the software came from (like URLs and partial paths), the actions taken to resolve the threat, and whether the actions were successful.
      - **Advanced MAPS**: In addition to basic information, advanced membership sends detailed information about malware and potentially unwanted software, including the full path to the software, and detailed information about how the software has affected your device.

   When you're finished, select **OK**.

### Enable and configure Send file samples when further analysis is required

1. In the details pane of **MAPS**, open the **Send file samples when further analysis is required** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Send file samples when further analysis is required** in the **Options** section: Select one of the following values:
      - **Send safe samples**: Most samples are sent automatically. Files that are likely to contain personal information prompt the user for more confirmation.
      - **Send all samples**

   When you're finished, select **OK**.

> [!NOTE]
>
> - **Always Prompt** lowers the protection state of the device.
> - **Never send** lowers the protection state of the device and disables [Block at First Sight](configure-block-at-first-sight-microsoft-defender-antivirus.md).

<a name="use-powershell-cmdlets-to-turn-on-cloud-protection"></a>

## Use PowerShell to turn on cloud protection

The following command in an elevated PowerShell prompt (a PowerShell window you opened by selecting **Run as administrator**) enables advanced cloud-delivered protection (Microsoft Active Protection Service (MAPS)) reporting and configures automatic sample submission for all file types:

```powershell
Set-MpPreference -MAPSReporting Advanced -SubmitSamplesConsent SendAllSamples
```

_SubmitSamplesConsent_ supports the following values:

- `SendSafeSamples`: The default, recommended setting. Most samples are sent automatically. Files that are likely to contain personal information result in a prompt for the user to continue, and require confirmation.
- `AlwaysPrompt`: Lowers the protection state of the device.
- `NeverSend`: Lowers the protection state of the device and disables [Block at First Sight](configure-block-at-first-sight-microsoft-defender-antivirus.md).

For more information on how to use PowerShell with Microsoft Defender Antivirus, see [Use PowerShell cmdlets to configure and run Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md) and [Microsoft Defender Antivirus cmdlets](/powershell/module/defender/). [Policy CSP - Defender](/windows/client-management/mdm/policy-csp-defender) also has more information specifically on [-SubmitSamplesConsent](/windows/client-management/mdm/policy-csp-defender#defender-submitsamplesconsent).

<a name='use-windows-management-instruction-wmi-to-turn-on-cloud-protection'></a>

## Use Windows Management Instrumentation (WMI) to turn on cloud protection

Use the [**Set** method of the **MSFT_MpPreference**](/previous-versions/windows/desktop/defender/set-msft-mppreference) class to configure the following properties that control cloud-delivered protection (MAPS reporting) and sample submission behavior:

```WMI
MAPSReporting
SubmitSamplesConsent
```

For more information about allowed parameters, see [Windows Defender WMIv2 APIs](/previous-versions/windows/desktop/defender/windows-defender-wmiv2-apis-portal).

## Turn on cloud protection on individual clients with the Windows Security app

> [!NOTE]
> If the **Configure local setting override for reporting Microsoft MAPS** Group Policy setting is set to **Disabled**, then the **Cloud-based protection** setting in **Windows Security > Virus & threat protection settings** is greyed out and unavailable. Changes made through a Group Policy Object must first be deployed to individual endpoints before the setting is updated in **Windows Security > Virus & threat protection settings**.

1. Open the Windows Security app by selecting the shield icon in the task bar, or by searching the start menu for **Windows Security**.

1. Select the **Virus & threat protection** tile (or the shield icon on the left menu bar), and then, under **Virus & threat protection settings**, select **Manage settings**.

   :::image type="content" source="/defender/media/wdav-protection-settings-wdsc.png" alt-text="The Virus & threat protection settings" lightbox="/defender/media/wdav-protection-settings-wdsc.png":::

1. Confirm that **Cloud-based Protection** and **Automatic sample submission** are switched to **On**.

   > [!NOTE]
   > If automatic sample submission has been configured with Group Policy, then the setting is greyed out and unavailable.

## See also

- [Use Microsoft cloud protection in Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md)
- [Configuration Manager: Microsoft Defender for Endpoint](/intune/configmgr/protect/deploy-use/defender-advanced-threat-protection)
- [Use PowerShell cmdlets to manage Microsoft Defender Antivirus](use-powershell-cmdlets-microsoft-defender-antivirus.md)

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
>
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
