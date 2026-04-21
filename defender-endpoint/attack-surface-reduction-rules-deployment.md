---
title: Microsoft Defender for Endpoint attack surface reduction rules deployment overview
description: Provides overview and prerequisite guidance about deploying Microsoft Defender for Endpoint attack surface reduction rules. Links to articles that show how to plan and ASR deployment, test ASR rules, configure ASR rules, and enable ASR rules.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: limwainstein
ms.author: lwainstein
ms.reviewer: sugamar
ms.custom: asr
ms.topic: concept-article
ms.collection:
 - m365-security
 - m365solution-asr-rules
 - highpri
 - tier1
 - mde-asr
ms.date: 03/09/2026
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Attack surface reduction rules deployment overview

_Attack surfaces_ are the places where your organization is vulnerable to threats and attacks. Reducing your attack surface means protecting your organization's devices and network. Protected attack surfaces leave attackers with fewer ways to attack your organization.

_Attack surface reduction (ASR) rules_ in Microsoft Defender for Endpoint can help reduce the attack surface in your organization by disabling risky software behavior. For example:

- Launching executable files and scripts that attempt to download or run files.
- Running obfuscated or otherwise suspicious scripts.
- Preventing unnatural app behavior.

By reducing the different attack surfaces, you can help prevent attacks from happening in the first place.

This deployment collection provides information about the following aspects of attack surface reduction rules:

- attack surface reduction rules requirements
- plan for attack surface reduction rules deployment
- test attack surface reduction rules
- configure and enable attack surface reduction rules
- attack surface reduction rules best practices
- attack surface reduction rules advanced hunting
- attack surface reduction rules event viewer

## Attack surface reduction rules deployment steps

You need to carefully plan and deploy attack surface reduction rules to test the effects on your line-of-business apps and customer workflows.

  :::image type="content" source="media/asr-rules-deployment-phases.png" alt-text="Plan Microsoft Defender for Endpoint attack surface reduction rules, test attack surface reduction rules, Enable attack surface reduction rules, maintain attack surface reduction rules." lightbox="media/asr-rules-deployment-phases.png":::

## Important predeployment caveat

We recommended that you enable the following three _standard protection rules_. See [Attack surface reduction rules by type](attack-surface-reduction-rules-reference.md#attack-surface-reduction-rules) for important details about the two types of attack surface reduction rules.

- [Block credential stealing from the Windows local security authority subsystem](attack-surface-reduction-rules-reference.md#block-credential-stealing-from-the-windows-local-security-authority-subsystem)
- [Block abuse of exploited vulnerable signed drivers (Device)](attack-surface-reduction-rules-reference.md#block-abuse-of-exploited-vulnerable-signed-drivers)
- [Block persistence through WMI event subscription](attack-surface-reduction-rules-reference.md#block-persistence-through-wmi-event-subscription)

Typically, you can enable the standard protection rules with minimal-to-no noticeable impact to the end user. For an easy method to enable the standard protection rules, see [Simplified standard protection option](attack-surface-reduction-rules-report.md#simplified-standard-protection-option).

> [!NOTE]
> For customers who are using a non-Microsoft HIPS and are transitioning to Microsoft Defender for Endpoint attack surface reduction rules, Microsoft advises running the HIPS solution alongside attack surface reduction rules deployment until the moment you shift from Audit mode to Block mode. Keep in mind that you must reach out to your non-Microsoft antivirus provider for exclusion recommendations.

## Before you begin testing or enabling attack surface reduction rules

During your initial preparation, it's vital to understand the capabilities of the systems that you put in place. Understanding the capabilities help you determine which attack surface reduction rules are most important for protecting your organization. Additionally, there are several prerequisites, which you must attend to in preparation of your attack surface reduction deployment.

> [!IMPORTANT]
> This guide provides images and examples to help you decide how to configure attack surface reduction rules; these images and examples might not reflect the best configuration options for your environment.

Before you start, review the following documentation:

- **Foundational information**:
  - [Overview of attack surface reduction](attack-surface-reduction-overview.md)
  - [Demystifying attack surface reduction rules - Part 1](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-1/ba-p/1306420)
- **ASR rule details**:
  - [Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md), which also includes the rule to GUID mapping.

Attack surface reduction rules are only one capability of the attack surface reduction capabilities within Microsoft Defender for Endpoint. This document goes into more detail on deploying attack surface reduction rules effectively to stop advanced threats like human-operated ransomware and other threats.

### Attack surface reduction rules list by category

The following table shows attack surface reduction rules by category:

|Polymorphic threats|Lateral movement & credential theft|Productivity apps rules|Email rules|Script rules|Misc rules|
|---|---|---|---|---|---|
|Block executable files from running unless they meet a prevalence, age, or trusted list criterion|Block process creations originating from PSExec and WMI commands|Block Office applications from creating executable content|Block executable content from email client and webmail|Block execution of potentially obfuscated scripts|Block abuse of exploited vulnerable signed drivers (Device) <sup>[[1](#fn1)]<sup></sup>|
|Block untrusted and unsigned processes that run from USB|Block credential stealing from the Windows local security authority subsystem<sup>[[2](#fn1)]<sup></sup>|Block all Office applications from creating child processes|Block Office communication application from creating child processes|Block JavaScript or VBScript from launching downloaded executable content||
|Use advanced protection against ransomware|Block persistence through WMI event subscription|Block Office applications from injecting code into other processes|Block Office communication application from creating child processes|||
|||Block Adobe Reader from creating child processes||||

(<a id="fn1">1</a>) _Block abuse of exploited vulnerable signed drivers (Device)_ is now available under **Endpoint Security** > **Attack Surface Reduction**.

(<a id="fn1">2</a>) Some attack surface reduction rules generate considerable noise, but don't block functionality. For example, if you're updating Chrome, Chrome accesses **lsass.exe**; passwords are stored in **lsass** on the device. However, Chrome shouldn't be accessing local device **lsass.exe**. If you enable the rule to block access to **lsass**, you see many events. Those events are good events because the software update process shouldn't access lsass.exe. Using this rule blocks Chrome updates from accessing **lsass**, but won't block Chrome from updating. This is also true of other applications that make unnecessary calls to **lsass.exe**. The _block access to lsass_ rule blocks unnecessary calls to **lsass**, but doesn't block the application from running.

### Attack surface reduction infrastructure requirements

Although multiple methods of implementing attack surface reduction rules are possible, this guide is based on an infrastructure consisting of

- Microsoft Entra ID
- Microsoft Intune
- Windows 10 and Windows 11 devices
- Microsoft Defender for Endpoint E5 or Windows E5 licenses

To take full advantage of attack surface reduction rules and reporting, we recommend using a Microsoft Defender XDR E5 or Windows E5 license, and A5. Learn more at [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md).

> [!NOTE]
> There are multiple methods to configure attack surface reduction rules. Attack surface reduction rules can be configured using: Microsoft Intune, PowerShell, Group Policy, Microsoft Configuration Manager (ConfigMgr), Intune OMA-URI.
> If you are using a different infrastructure configuration than what is listed for _Infrastructure requirements_, you can learn more about deploying attack surface reduction rules using other configurations here: [Enable attack surface reduction rules](attack-surface-reduction-rules-enable.md).

### Attack surface reduction rules dependencies

Microsoft Defender Antivirus must be enabled and configured as primary anti-virus solution, and must be in the following mode:

- Primary antivirus/antimalware solution
- State: Active mode

Microsoft Defender Antivirus must not be in any of the following modes:

- Passive
- Passive Mode with Endpoint detection and response (EDR) in Block Mode
- Limited periodic scanning (LPS)
- Off

See [Cloud-delivered protection and Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md) for more.

### Cloud Protection (MAPS) must be enabled to enable attack surface reduction rules

Microsoft Defender Antivirus works seamlessly with Microsoft cloud services. These cloud protection services, also referred to as Microsoft Advanced Protection Service (MAPS), enhances standard real-time protection, arguably providing the best antivirus defense. Cloud protection is critical to preventing breaches from malware and a critical component of attack surface reduction rules.
[Turn on cloud-delivered protection in Microsoft Defender Antivirus](enable-cloud-protection-microsoft-defender-antivirus.md).

### Microsoft Defender Antivirus components must be current versions for attack surface reduction rules

The following Microsoft Defender Antivirus component versions must be no more than two versions older than the most-currently-available version:

- **Microsoft Defender Antivirus Platform update version** - Microsoft Defender Antivirus platform is updated monthly.
- **Microsoft Defender Antivirus engine version** - Microsoft Defender Antivirus engine is updated monthly.
- **Microsoft Defender Antivirus security intelligence** - Microsoft continually updates Microsoft Defender security intelligence (also known as, definition and signature) to address the latest threats, and to refine detection logic.

Keeping Microsoft Defender Antivirus versions current helps reduce attack surface reduction rules false positive results and improves Microsoft Defender Antivirus detection capabilities. For more details on the current versions and how to update the different Microsoft Defender Antivirus components visit [Microsoft Defender Antivirus platform support](microsoft-defender-antivirus-updates.md).

### Caveat

Some rules don't work well if unsigned, internally developed application and scripts are in high usage. It's more difficult to deploy attack surface reduction rules if code signing isn't enforced.

## Other articles in this deployment collection

[Test attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)

[Enable attack surface reduction rules](attack-surface-reduction-rules-deployment-implement.md)

[Operationalize attack surface reduction rules](attack-surface-reduction-rules-deployment-operationalize.md)

[Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)

## Reference

### Blogs

[Demystifying attack surface reduction rules - Part 1](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-1/ba-p/1306420)

[Demystifying attack surface reduction rules - Part 2](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-2/ba-p/1326565)

[Demystifying attack surface reduction rules - Part 3](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-3/ba-p/1360968)

[Demystifying attack surface reduction rules - Part 4](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/demystifying-attack-surface-reduction-rules-part-4/ba-p/1384425)

### Attack surface reduction rules collection

[Overview of attack surface reduction](attack-surface-reduction-overview.md)

[Use attack surface reduction rules to prevent malware infection](attack-surface-reduction-rules-overview.md)

[Enable attack surface reduction rules - alternate configurations](attack-surface-reduction-rules-enable.md)

[Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)

[Attack surface reduction FAQ](attack-surface-reduction-faq.yml)

### Microsoft Defender

[Address false positives/negatives in Microsoft Defender for Endpoint](defender-endpoint-false-positives-negatives.md)

[Cloud-delivered protection and Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md)

[Turn on cloud-delivered protection in Microsoft Defender Antivirus](enable-cloud-protection-microsoft-defender-antivirus.md)

[Configure and validate exclusions based on extension, name, or location](configure-extension-file-exclusions-microsoft-defender-antivirus.md)

[Microsoft Defender Antivirus platform support](microsoft-defender-antivirus-updates.md)

[Overview of inventory in the Microsoft 365 Apps admin center](/deployoffice/admincenter/inventory)

[Create a deployment plan for Windows](/windows/deployment/update/create-deployment-plan)

[Use role-based access control (RBAC) and scope tags for distributed IT in Intune](/intune/intune-service/fundamentals/scope-tags)

[Assign device profiles in Microsoft Intune](/intune/intune-service/configuration/device-profile-assign#exclude-groups-from-a-profile-assignment)

### Management sites

[Microsoft Intune admin center](https://intune.microsoft.com/#home)

[Attack surface reduction](https://security.microsoft.com/asr?viewid=detections)

[Attack surface reduction rules configurations](https://security.microsoft.com/asr?viewid=configuration)

[Attack surface reduction rules exclusions](https://security.microsoft.com/asr?viewid=exclusions)



