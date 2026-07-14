---
title: Configure custom exclusions for Microsoft Defender Antivirus
description: Use Microsoft Intune to configure custom exclusions for Microsoft Defender Antivirus, including files, folders, processes, and process-opened files on Windows devices.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 07/02/2026
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1016
ms.reviewer: ksarens
ms.subservice: ngp
ms.audience: ITPro
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
---

# Configure custom exclusions for Microsoft Defender Antivirus

In general, you shouldn't need to define exclusions for Microsoft Defender Antivirus. However, you can exclude files, folders, processes, and process-opened files from Microsoft Defender Antivirus scans. File, folder, process, and process-opened-file exclusions are known as _custom exclusions_. This article describes how to use Microsoft Intune to define custom exclusions for Microsoft Defender Antivirus in Microsoft Windows.

Custom exclusions apply to [scheduled scans](schedule-antivirus-scans.md), [on-demand scans](run-scan-microsoft-defender-antivirus.md), and [always-on real-time protection and monitoring](configure-real-time-protection-microsoft-defender-antivirus.md). Exclusions for process-opened files apply only to real-time protection.

> [!TIP]
>
> - For a detailed overview of suppressions, submissions, and exclusions across Microsoft Defender Antivirus and Defender for Endpoint, see [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md).
> - If you use another method to distribute exclusions to Microsoft Defender Antivirus on Windows devices (for example, Microsoft Configuration Manager or Group Policy), or you want more information about custom exclusions, see these articles:
>   - [Configure and validate exclusions based on file extension and folder location](configure-extension-file-exclusions-microsoft-defender-antivirus.md)
>   - [Configure exclusions for files opened by processes](configure-process-opened-file-exclusions-microsoft-defender-antivirus.md)
> - The following methods are available to protect exclusions configured on devices:
>   - [Tamper protection for antivirus exclusions](manage-tamper-protection-intune.md#tamper-protection-for-antivirus-exclusions).
>   - [HideExclusionsFromLocalAdmins](/windows/client-management/mdm/defender-csp#configurationhideexclusionsfromlocaladmins):
>     - Doesn't remove existing exclusions from the device.
>     - Exclusions aren't visible in [Get-MpPreference](/powershell/module/defender/get-mppreference) or Registry Editor.
>   - [HideExclusionsFromLocalUsers](/windows/client-management/mdm/defender-csp#configurationhideexclusionsfromlocalusers): Implicitly enabled if HideExclusionsFromLocalAdmins is enabled.
> - Excluded files can still generate anti-virus alerts in the Microsoft Defender portal. For example, excluded files can trigger behavioral or heuristic detections.
> - Even when Antivirus exclusions are configured, Microsoft Defender Antivirus performs a minimal evaluation to determine whether the exclusion applies. This evaluation does not involve a full content scan. If the exclusion criteria are met, the scan is skipped for the specified file, folder, or process.

## Prerequisites

### Supported operating systems

Custom exclusions as described in this article are supported on the following operating systems:

- Windows

### Important points about exclusions

Keep the following points in mind before you define exclusions.

-
  > [!CAUTION]
  > Use exclusions sparingly. Exclusions are technically a protection gap that lowers Microsoft Defender Antivirus protection. Consider all options when you define exclusions. For more information, see [Manage exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md).

- Exclusions can directly affect whether Microsoft Defender Antivirus can block, remediate, or inspect events related to excluded files, folders, or processes.
  - Custom exclusion can affect features that depend on the antivirus engine. For example:
    - Malware protection.
    - [File IOCs](indicator-file.md).
    - [Certificate IOCs](indicator-certificates.md).
  - Process exclusions on any platform prevent [network protection](network-protection.md) and [attack surface reduction (ASR) rules](attack-surface-reduction-rules-overview.md) from inspecting traffic or enforcing rules for excluded processes.

- Periodically review and audit exclusions. Recheck and re-enforce mitigations as part of your review process. To avoid confusion, your security team should preserve context around why a certain exclusion was required.

- Use exclusions only for specific issues (for example, performance or app compatibility). Don't exclude something just because you think it might be a problem in the future.

<a name='#create-a-new-antivirus-policy-with-exclusions-in-intune'></a>

<a name='configure-and-validate-exclusions'></a>

## Create Microsoft Defender antivirus exclusion policies in Intune

To create a new AV policy in Microsoft Intune using the Microsoft Defender Antivirus Exclusions profile, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:

- **Policy type**: Antivirus
- **Platform**: Windows
- **Profile**: Microsoft Defender Antivirus exclusions
- **Configuration settings**: Configure the [ExcludedExtensions](/windows/client-management/mdm/policy-csp-defender#excludedextensions), [ExcludedPaths](/windows/client-management/mdm/policy-csp-defender#excludedpaths), and  [ExcludedProcesses](/windows/client-management/mdm/policy-csp-defender#excludedprocesses). To add an exclusion, select **Add** and enter the value in the box that appears. Repeat these steps to add more exclusions as necessary.

   > [!TIP]
   >
   > - The Microsoft Defender Antivirus service runs in the system context using the LocalSystem account. Therefore, environment variables like `%USERPROFILE%` are expanded using the LocalSystem profile rather than the signed-in user's profile, which means they resolve to different paths than you might expect. For more information, see [System environment variables](configure-extension-file-exclusions-microsoft-defender-antivirus.md#system-environment-variables).
   >
   > - Don't use **user** environment variables as wildcards in folder and process exclusions in Microsoft Defender Antivirus. Only use the following types of environment variables as wildcards:
   >
   > - System environment variables.
   > - Environment variables that apply to processes running as the NT AUTHORITY\SYSTEM account.
   >
   > For more information, see [Use wildcards in the file name and folder path or extension exclusion lists](configure-extension-file-exclusions-microsoft-defender-antivirus.md#use-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists).

For more information about Microsoft Defender Antivirus profiles in Microsoft Intune, see [Antivirus policy for endpoint security](/intune/intune-service/protect/endpoint-security-antivirus-policy).

## Modify exclusions in Microsoft Defender antivirus exclusion policies in Intune

To modify an existing AV policy in Microsoft Intune that uses the Microsoft Defender Antivirus Exclusions profile, see <a href="/intune/intune-service/protect/endpoint-security-policy#modify-existing-policies" target="_blank">Modify existing policies</a> (opens in a new tab in the Intune documentation). When modifying the policy, use these settings:

- **Manage**: Antivirus
- **Configuration settings**: Add or remove exclusions.

  - To add an exclusion, select **Add**, and then enter the value in the box that appears. Repeat this step as many times as necessary.
  - To remove an exclusion or an empty box, select the check box next to the entry, and then select **Remove**.
  - To import a .csv file of new exclusions, select **Import**.
  - To export the existing exclusions to a .csv file of, select **Export**.

For more information about Microsoft Defender Antivirus profiles in Microsoft Intune, see [Antivirus policy for endpoint security](/intune/intune-service/protect/endpoint-security-antivirus-policy).

<a name='audit-antivirus-exclusions-on-exchange-systems'></a>

## Antivirus exclusions on Exchange servers

Microsoft Exchange Server 2016 or later supports integration with the anti-malware Scan Interface (AMSI). For more information, see [Exchange Server AMSI integration](/exchange/antispam-and-antimalware/amsi-integration-with-exchange).

Many organizations exclude Exchange Server folders from antivirus scans for performance reasons. Microsoft recommends auditing Microsoft Defender Antivirus exclusions on Exchange servers and assessing whether you can remove exclusions without affecting performance. You can manage exclusions using Group Policy, PowerShell, or systems management tools like Microsoft Intune.

To audit Microsoft Defender Antivirus exclusions on an Exchange Server, run the [Get-MpPreference](/powershell/module/defender/get-mppreference) cmdlet from an elevated PowerShell prompt.

If you can't remove exclusions for the Exchange processes and folders, remember that a quick scan in Microsoft Defender Antivirus scans the Exchange directories and files, regardless of exclusions.

<a name="see-also"></a>
## Related articles

- [Microsoft Defender Antivirus exclusions on Windows Server 2016 and later](configure-server-exclusions-microsoft-defender-antivirus.md)
- [Common mistakes to avoid when defining exclusions](common-exclusion-mistakes-microsoft-defender-antivirus.md)
- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md)
- [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md)
- [Configure and validate exclusions for Microsoft Defender for Endpoint on macOS](mac-exclusions.md)
