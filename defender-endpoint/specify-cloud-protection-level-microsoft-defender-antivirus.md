---
title: Specify the cloud protection level for Microsoft Defender Antivirus
description: Set your level of cloud protection for Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.topic: how-to
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.date: 10/20/2025
manager: bagol
ms.custom: nextgen
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
- mde-ngp
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

---
# Specify the cloud protection level


Cloud protection works together with Microsoft Defender Antivirus to deliver protection to your devices faster than through traditional security intelligence updates. You can configure your level of cloud protection by using Microsoft Intune (recommended) or Group Policy.

## Prerequisites

### Supported operating systems 

- Windows

## Use Microsoft Intune to specify the level of cloud protection

1. Go to the Microsoft Intune admin center ([https://intune.microsoft.com](https://intune.microsoft.com)) and sign in.

1. Choose **Endpoint security** \> **Antivirus**.

1. Select an antivirus profile. If you don't have one yet, or if you want to create a new profile, see [Configure device restriction settings in Microsoft Intune](/intune/intune-service/configuration/device-restrictions-configure).

1. Next to **Configuration settings**, choose **Edit**.

1. Scroll down to **Cloud Block Level**, and select one of the following:

    - **Not configured**: Default state.
    - **High**: Applies a strong level of detection.
    - **High Plus**: Uses the **High** level and applies extra protection measures (might affect client performance).
    - **Zero Tolerance**: Blocks all unknown executables.

1. Choose **Next**, and then choose **Save**.

> [!TIP]
> Need some help? See the following resources:
>
> - [Manage device security with endpoint security policies in Microsoft Intune](/intune/intune-service/protect/endpoint-security-policy)
> - [Configure Endpoint Protection](/intune/configmgr/protect/deploy-use/endpoint-protection-configure) (Configuration Manager)

## Use Group Policy to specify the level of cloud protection

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

1. Deploy your updated Group Policy Object. See [Group Policy Management Console](/windows/win32/srvnodes/group-policy)

> [!TIP]
> Are you using Group Policy Objects on premises? See how they translate in the cloud. [Analyze your on-premises group policy objects using Group Policy analytics in Microsoft Intune](/intune/intune-service/configuration/group-policy-analytics).

## See also

- [Turn on cloud protection in Microsoft Defender Antivirus](enable-cloud-protection-microsoft-defender-antivirus.md)



