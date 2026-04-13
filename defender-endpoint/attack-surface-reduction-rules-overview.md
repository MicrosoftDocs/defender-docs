---
title: Overview of attack surface reduction rules
description: "Admins can learn about attack surface reduction (ASR) rules for Windows devices in Microsoft Defender for Endpoint, and how they can help prevent exploits from using apps and scripts to infect devices with malware."
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar
ms.custom: admindeeplinkDEFENDER
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-asr
ms.date: 10/20/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Attack surface reduction (ASR) rules overview

[!INCLUDE [MDE automated setup guide](../includes/security-analyzer-setup-guide.md)]

Attack surface reduction (ASR) rules for Windows devices in Microsoft Defender for Endpoint are a key component in reducing your organization's _attack surface_(entry points that could allow attackers access to your organization). For more information, see [Attack surface reduction in Microsoft Defender for Endpoint](attack-surface-reduction-overview.md).

ASR rules target specific software behavior on Windows devices that's often identified as malicious in nature. For example:

- Launching executable files and scripts that attempt to download or run files.
- Running obfuscated or otherwise untrusted scripts.
- Creating child processes from other, potentially vulnerable processes.
- Injecting code into other processes.

Although some legitimate apps might also take these types of actions, the actions are considered risky because attackers use malware that behaves in the same way. ASR rules rules can constrain software-based risky behavior on Windows devices to help keep your organization safe.

For a sequential deployment guide to plan, test, implement, and monitor ASR rules, see the following series of articles:

- [ASR rules deployment overview](attack-surface-reduction-rules-deployment.md)
  - [Plan your ASR rules deployment](attack-surface-reduction-rules-deployment-plan.md)
  - [Test ASR rules](attack-surface-reduction-rules-deployment-test.md)
  - [Enable ASR rules](attack-surface-reduction-rules-deployment-implement.md)
  - [Manage and monitor ASR rules](attack-surface-reduction-rules-deployment-operationalize.md)

## Supported operating systems for ASR rules

ASR rules are supported in all modern versions of Microsoft Windows and Windows Server:


You can set attack surface reduction rules for devices that are running any of the following editions and versions of Windows:

- [Windows 11 Pro](/windows/whats-new/windows-11-overview)
- [Windows 11 Enterprise](https://www.microsoft.com/microsoft-365/windows/windows-11-enterprise)
- Windows 10 Pro [version 1709](/windows/whats-new/whats-new-windows-10-version-1709) or later
- Windows 10 Enterprise [version 1709](/windows/whats-new/whats-new-windows-10-version-1709) or later
- Windows Server [version 1803 (Semi-Annual Channel)](/windows-server/get-started/whats-new-in-windows-server-1803) or later
- [Windows Server 2012 R2](/windows/win32/srvnodes/what-s-new-for-windows-server-2012-r2)
- [Windows Server 2016](/windows-server/get-started/whats-new-in-windows-server-2016)
- [Windows Server 2019](/windows-server/get-started-19/whats-new-19)
- [Windows Server 2022](/windows-server/get-started/whats-new-in-windows-server-2022)
- Windows Server 2025
- Azure Stack HCI OS, version 23H2 and later


## Prerequisites

### Supported operating systems

- Windows

<a name='assess-rules-before-deployment'></a>

<a name='audit-mode-for-evaluation'></a>

<a name='audit-mode'></a>

## Assess and evaluate rules before deployment

You can assess how an attack surface reduction rule might affect your network using the following methods:

- **Security recommendations in [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)**: In Defender for Endpoint Plan 2 or with the Defender Vulnerability Management add-on, you can use the **Devices** tab of the **Recommendations** page in the Microsoft Defender portal at **Exposure management** \> **Recommendations** (directly at <https://security.microsoft.com/exposure-recommendations>). When you select an ASR rule, the details flyout shows allows you to check the  user impact to determine what percentage of your devices can accept a new policy enabling the rule in blocking mode without adversely affecting productivity.
- 
by opening the security recommendation for that rule in [Microsoft Defender Vulnerability Management](/windows/security/threat-protection/).

:::image type="content" source="media/asrrecommendation.png" alt-text="The attack surface reduction recommendation" lightbox="media/asrrecommendation.png":::

In the recommendation details pane, check for user impact to determine what percentage of your devices can accept a new policy enabling the rule in blocking mode without adversely affecting productivity.

See [Requirements](attack-surface-reduction-rules-enable.md) in the "Enable attack surface reduction rules" article for information about supported operating systems and other requirement information.

## Audit mode for evaluation

### Audit mode

Use [audit mode](overview-attack-surface-reduction.md) to evaluate how attack surface reduction rules would affect your organization if enabled. Run all rules in audit mode first so you can understand how they affect your line-of-business applications. Many line-of-business applications are written with limited security concerns, and they might perform tasks in ways that seem similar to malware.

### Exclusions

By monitoring audit data and [adding exclusions](attack-surface-reduction-rules-deployment-test.md#add-exclusions) for necessary applications, you can deploy attack surface reduction rules without reducing productivity.

### Per-rule exclusions

For information about configuring per-rule exclusions, see [Configure attack surface reduction per-rule exclusions](attack-surface-reduction-rules-deployment-test.md#configure-attack-surface-reduction-per-rule-exclusions).

## Warn mode for users

Whenever an attack surface reduction rule blocks content, users see a dialog box that indicates the content is blocked. The dialog box also offers the user an option to unblock the content. The user can then retry their action, and the operation completes. When a user unblocks content, the content remains unblocked for 24 hours, and then blocking resumes.

Warn mode helps your organization have attack surface reduction rules in place without preventing users from accessing the content they need to perform their tasks.

### Requirements for warn mode to work

Warn mode is supported on devices running the following versions of Windows:

- [Windows 10, version 1809](/windows/whats-new/whats-new-windows-10-version-1809) or later
- Windows 11
- [Windows Server, version 1809](/windows-server/get-started/whats-new-in-windows-server-1809) or later

Microsoft Defender Antivirus must be running with real-time protection in [Active mode](/windows/security/threat-protection/microsoft-defender-antivirus/microsoft-defender-antivirus-compatibility#functionality-and-features-available-in-each-state).

Also, make sure [Microsoft Defender Antivirus and anti-malware updates](/windows/security/threat-protection/microsoft-defender-antivirus/manage-updates-baselines-microsoft-defender-antivirus#platform-and-engine-releases) are installed.

- Minimum platform release requirement: `4.18.2008.9`
- Minimum engine release requirement: `1.1.17400.5`

For more information and to get your updates, see [Update for Microsoft Defender anti-malware platform](microsoft-defender-antivirus-updates.md).

### Cases where warn mode isn't supported

Warn mode isn't supported for three attack surface reduction rules when you configure them in Microsoft Intune. (If you use Group Policy to configure your attack surface reduction rules, warn mode is supported.) The three rules that don't support warn mode when you configure them in Microsoft Intune are as follows:

- [Block JavaScript or VBScript from launching downloaded executable content](attack-surface-reduction-rules-reference.md#block-javascript-or-vbscript-from-launching-downloaded-executable-content) (GUID `d3e037e1-3eb8-44c8-a917-57927947596d`)
- [Block persistence through WMI event subscription](attack-surface-reduction-rules-reference.md#block-persistence-through-wmi-event-subscription) (GUID `e6db77e5-3df2-4cf1-b95a-636979351e5b`)
- [Use advanced protection against ransomware](attack-surface-reduction-rules-reference.md#use-advanced-protection-against-ransomware) (GUID `c1db55ab-c21a-4637-bb3f-a12568109d35`)

Also, warn mode isn't supported on devices running older versions of Windows. In those cases, attack surface reduction rules that are configured to run in warn mode runs in block mode.

## Notifications and alerts

Whenever an attack surface reduction rule is triggered, a notification is displayed on the device. You can [customize the notification](attack-surface-reduction-rules-deployment-implement.md#customize-attack-surface-reduction-rules) with your company details and contact information.

Also, when certain attack surface reduction rules are triggered, alerts are generated.

Notifications and any alerts that are generated can be viewed in the [Microsoft Defender portal](https://security.microsoft.com).

For specific details about notification and alert functionality, see [Alerts and notifications from ASR rule actions](attack-surface-reduction-rules-reference.md#alerts-and-notifications-from-asr-rule-actions), in the article **Attack surface reduction rules reference**.

## Advanced hunting and attack surface reduction events

You can use advanced hunting to view attack surface reduction events. To streamline the volume of incoming data, only unique processes for each hour are viewable with advanced hunting. The time of an attack surface reduction event is the first time that event is seen within the hour.

For example, suppose that an attack surface reduction event occurs on 10 devices during the 2:00 PM hour. Suppose that the first event occurred at 2:15, and the last at 2:45. With advanced hunting, you see one instance of that event (even though it actually occurred on 10 devices), and its timestamp is 2:15 PM.

For more information about advanced hunting, see [Proactively hunt for threats with advanced hunting](/defender-xdr/advanced-hunting-overview).

## Attack surface reduction features across Windows versions

You can set attack surface reduction rules for devices that are running any of the following editions and versions of Windows:

- Windows 10 Pro, [version 1709](/windows/whats-new/whats-new-windows-10-version-1709) or later
- Windows 10 Enterprise, [version 1709](/windows/whats-new/whats-new-windows-10-version-1709) or later
- Windows 11 Pro, version 21H2 or later
- Windows 11 Enterprise, version 21H2 or later
- Windows Server, [version 1803 (Semi-Annual Channel)](/windows-server/get-started/whats-new-in-windows-server-1803) or later
- Windows Server 2025
- [Windows Server 2022](/windows-server/get-started/whats-new-in-windows-server-2022) 
- [Windows Server 2019](/windows-server/get-started-19/whats-new-19)
- [Windows Server 2016](/windows-server/get-started/whats-new-in-windows-server-2016)
- [Windows Server 2012 R2](/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/hh801901(v=ws.11))
- Azure Stack HCI OS, version 23H2 and later

  > [!NOTE]
  > Windows Server 2016 and Windows Server 2012 R2 must be onboarded using the instructions in [Onboard Windows Server 2012 R2 and Windows Server 2016 to Microsoft Defender for Endpoint](onboard-server.md) for this feature to work.

Although attack surface reduction rules don't require a [Windows E5 license](/windows/deployment/deploy-enterprise-licenses), if you have Windows E5, you get advanced management capabilities. The advanced capabilities - available only in Windows E5 - include:S

- The monitoring, analytics, and workflows available in [Defender for Endpoint](microsoft-defender-endpoint.md)
- The reporting and configuration capabilities in [Microsoft Defender XDR](/defender-xdr/microsoft-365-defender).

These advanced capabilities aren't available with a Windows Professional or Windows E3 license. However, if you do have those licenses, you can use Event Viewer and Microsoft Defender Antivirus logs to review your attack surface reduction rule events.

<a name='review-attack-surface-reduction-events-in-the-microsoft-365-defender-portal'></a>

## Review attack surface reduction events in the Microsoft Defender portal

Defender for Endpoint provides detailed reporting for events and blocks as part of alert investigation scenarios.

You can query Defender for Endpoint data in [Microsoft Defender XDR](microsoft-defender-endpoint.md) by using [advanced hunting](/defender-xdr/advanced-hunting-query-language).

Here's an example query:

```kusto
DeviceEvents
| where ActionType startswith 'Asr'
```

## Review attack surface reduction events in Windows Event Viewer

You can review the Windows event log to view events generated by attack surface reduction rules:

1. Download the [Evaluation Package](https://aka.ms/mp7z2w) and extract the file *cfa-events.xml* to an easily accessible location on the device.

1. Enter the words, *Event Viewer*, into the Start menu to open the Windows Event Viewer.

1. Under **Actions**, select **Import custom view...**.

1. Select the file *cfa-events.xml* from where it was extracted. Alternatively, [copy the XML directly](overview-attack-surface-reduction.md).

1. Select **OK**.

   You can create a custom view that filters events to only show the following events, all of which are related to controlled folder access:

    |Event ID|Description|
    |---|---|
    |5007|Event when settings are changed|
    |1121|Event when rule fires in Block-mode|
    |1122|Event when rule fires in Audit-mode|

Defender for Endpoint generates the "engine version" that's listed in the event log for attack surface reduction. The operating system doesn't generate this version. Defender for Endpoint is integrated with Windows 10 and Windows 11, so this feature works on all devices with Windows 10 or Windows 11 installed.

## See also

- [Attack surface reduction rules deployment overview](attack-surface-reduction-rules-deployment.md)
- [Plan attack surface reduction rules deployment](attack-surface-reduction-rules-deployment-plan.md)
- [Test attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)
- [Enable attack surface reduction rules](attack-surface-reduction-rules-deployment-implement.md)
- [Operationalize attack surface reduction rules](attack-surface-reduction-rules-deployment-operationalize.md)
- [Attack surface reduction rules report](attack-surface-reduction-rules-report.md)
- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md)

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

