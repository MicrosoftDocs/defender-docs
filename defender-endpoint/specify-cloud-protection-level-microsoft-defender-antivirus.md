---
title: Specify the cloud protection level for Microsoft Defender Antivirus
description: Set your level of cloud protection for Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.date: 07/02/2026
ms.custom: nextgen, msecd-doc-authoring-1016
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
---
# Specify the cloud protection level


Cloud protection works together with Microsoft Defender Antivirus to deliver protection to your devices faster than through traditional security intelligence updates. You can configure your level of cloud protection by using Microsoft Intune (recommended) or Group Policy.

## Prerequisites

### Supported operating systems 

Cloud protection level configuration is supported on the following operating systems:

- Windows

## Use Microsoft Intune to specify the level of cloud protection

To specify the level of cloud protection for an existing policy in Microsoft Intune, see <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (opens in a new tab in the Intune documentation). When you edit the policy, use the following settings:

- **Policy type**: Antivirus
- Configuration settings: Choose **Edit** and scroll down to **Cloud Block Level**. Select one of the following options:
  - **Not configured**: Default state.
  - **High**: Applies a strong level of detection.
  - **High Plus**: Uses the **High** level and applies extra protection measures (might affect client performance).
  - **Zero Tolerance**: Blocks all unknown executables.

> [!TIP]
> Need some help? See the following resources:
>
> - [Manage device security with endpoint security policies in Microsoft Intune](/intune/intune-service/protect/endpoint-security-policy)
> - [Configure Endpoint Protection](/intune/configmgr/protect/deploy-use/endpoint-protection-configure) (Configuration Manager)

## Use Group Policy to specify the level of cloud protection

Perform the following steps to specify the level of cloud protection by using Group Policy:

1. On your Group Policy management machine, open the [Group Policy Management Console](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731212(v=ws.11)).

1. Right-click the Group Policy Object you want to configure, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer Configuration** \> **Administrative templates**.

1. Expand the tree to **Windows Components** \> **Microsoft Defender Antivirus** \> **MpEngine**.

1. Double-click the **Select cloud protection level** setting, and set it to **Enabled**. 

1. Under **Select cloud blocking level**, set the level of protection:

    - **Default blocking level** provides strong detection without increasing the risk of detecting legitimate files.
    - **Moderate blocking level** provides moderate only for high confidence detections
    - **High blocking level** applies a strong level of detection while optimizing client performance (but can also give you a greater chance of false positives).
    - **High + blocking level** applies extra protection measures (might affect client performance and increase your chance of false positives).
    - **Zero tolerance blocking level** blocks all unknown executables.

    > [!CAUTION]
    > If you're using [Resultant Set of Policy with Group Policy](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/dn789183(v=ws.11)) (RSOP), and **Default blocking level** is selected, it can produce misleading results, as a setting with a `0` value is read as disabled by RSOP. You can instead confirm the registry key is present in `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine` or use [GPresult](/windows-server/administration/windows-commands/gpresult).

1. Select **OK**.

1. Deploy your updated Group Policy Object. For deployment steps, see [Group Policy Management Console](/windows/win32/srvnodes/group-policy).

> [!TIP]
> Are you using Group Policy Objects on premises? See how they translate in the cloud. [Analyze your on-premises group policy objects using Group Policy analytics in Microsoft Intune](/intune/intune-service/configuration/group-policy-analytics).

## Related content

For more information about cloud protection, see the following resource:

- [Turn on cloud protection in Microsoft Defender Antivirus](enable-cloud-protection-microsoft-defender-antivirus.md)



