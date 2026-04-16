---
title: Configure custom exclusions for Microsoft Defender Antivirus
description: You can exclude files (including files modified by specified processes) and folders from Microsoft Defender Antivirus scans.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 02/20/2026
author: chrisda
ms.author: chrisda
ms.custom: nextgen
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
---

# Configure custom exclusions for Microsoft Defender Antivirus

In general, you shouldn't need to define exclusions for Microsoft Defender Antivirus. However, you can exclude files, folders, processes, and process-opened files from Microsoft Defender Antivirus scans. These types of exclusions are known as _custom exclusions_. This article describes how to use Microsoft Intune to define custom exclusions for Microsoft Defender Antivirus in Microsoft Windows.

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

## Prerequisites

### Supported operating systems

- Windows

### Important points about exclusions

-
  > [!CAUTION]
  > Use exclusions sparingly. Exclusions are technically a protection gap that lowers Microsoft Defender Antivirus protection. Consider all options when you define exclusions. For more information, see [Manage exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md).

- Exclusions can directly affect whether Microsoft Defender Antivirus can block, remediate, or inspect events related to excluded files, folders, or processes.
  - Custom exclusion can affect features that depend on the antivirus engine. For example:
    - Malware protection.
    - [File IOCs](indicator-file.md).
    - [Certificate IOCs](indicator-certificates.md).
  - Process exclusions on any platform prevent [network protection](network-protection.md) and [attack surface reduction rules](attack-surface-reduction.md) from inspecting traffic or enforcing rules for excluded processes.

- Periodically review and audit exclusions. Recheck and re-enforce mitigations as part of your review process. To avoid confusion, your security team should preserve context around why a certain exclusion was required.

- Use exclusions only for specific issues (for example, performance or app compatibility). Don't exclude something just because you think it might be a problem in the future.

<a name='#create-a-new-antivirus-policy-with-exclusions-in-intune'></a>

<a name='configure-and-validate-exclusions'></a>

## Create Microsoft Defender antivirus exclusion policies in Intune

To create a new AV policy in Microsoft Intune using the Microsoft Defender Antivirus Exclusions profile, do the following steps:

1. In the Microsoft Intune admin center at <https://intune.microsoft.com>, go to **Endpoint security**.

2. On the **Endpoint security \| Overview** page, select **Antivirus** in the **Manage** section. Or, to go directly to the **Endpoint security \| Antivirus** page, use <https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/antivirus>.

3. On the **Summary** tab of the **Endpoint security \| Antivirus** page, select **Create policy** in the **AV policies** section.

4. On the **Create a profile** flyout that opens, configure the following settings:
   - **Platform**: Select **Windows**.
   - **Profile**: Select **Microsoft Defender Antivirus exclusions**.

   Select **Create**.

5. The **Create policy** wizard opens. On the **Basics** tab, configure the following settings:
   - **Name**: Enter a unique, descriptive name for the policy.
   - **Description**: Enter an optional description.

   Select **Next**.

6. On the **Configuration settings** tab, configure some or all of the following settings:
   - **Excluded extensions** section: Exclusions by file type extension. The exclusion applies to any files with that extension, regardless of location. For more information, see [ExcludedExtensions](/windows/client-management/mdm/policy-csp-defender#excludedextensions).
   - **Excluded paths** section: Exclusions by location (path). Also known as _file and folder exclusions_. Separate each path and enter one path per line. For more information, see [ExcludedPaths](/windows/client-management/mdm/policy-csp-defender#excludedpaths).
   - **Excluded processes** section: Exclusions for files opened by specified processes. Separate each file type in the list, with one file type per line. The processes themselves aren't excluded. To exclude processes, you can use file and folder exclusions. For more information, see [ExcludedProcesses](/windows/client-management/mdm/policy-csp-defender#excludedprocesses).

   To add an exclusion, select **Add**, and then enter the value in the box that appears. Repeat this step as many times as necessary.

   > [!TIP]
   >
   > - The Microsoft Defender Antivirus service runs in the system context using the LocalSystem account. The service gets information from **system** environment variables, not **user** environment variables. Therefore, environment variables like `%USERPROFILE%` are likely interpreted differently than you expect. For more information, see [System environment variables](configure-extension-file-exclusions-microsoft-defender-antivirus.md#system-environment-variables).
   >
   > - Don't use **user** environment variables as wildcards in folder and process exclusions in Microsoft Defender Antivirus. Only use the following types of environment variables as wildcards:
   >
   > - System environment variables.
   > - Environment variables that apply to processes running as the NT AUTHORITY\SYSTEM account.
   >
   > For more information, see [Use wildcards in the file name and folder path or extension exclusion lists](configure-extension-file-exclusions-microsoft-defender-antivirus.md#use-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists).

   To remove an exclusion or an empty box, select the check box next to the entry, and then select **Remove**.

   To import a .csv file of exclusions, select **Import**.

   When you're finished on the **Configuration settings** tab, select **Next**.

7. On the **Scope tags** tab, the scope tag named **Default** is select by default, but you can remove it and select other existing [scope tags](/intune/intune-service/fundamentals/scope-tags). When you're finished, select **Next**.

8. On the **Assignments** tab, click in the search box or start typing a group name, and then select it from the results.

   You can select **All users** or **All devices**.

   When you select a custom group, you can use the **Target type** setting to **Include** or **Exclude** the group members.

   Repeat this step as many times as necessary.

   When you're finished on the **Assignments** tab, select **Next**.

9. On the **Review + create** tab, review your settings. Use **Back** or select a tab to make changes.

   When you're finished on the **Review + create** tab, select **Save**.

Back on the **Summary** tab of the **Endpoint security \| Antivirus** page, the new AV policy is listed. The **Policy type** value is **Microsoft Defender Antivirus exclusions**.

<a name='manage-antivirus-exclusions-in-intune-for-existing-policies'></a>

## Modify exclusions in Microsoft Defender antivirus exclusion policies in Intune

To modify an existing AV policy in Microsoft Intune that uses the Microsoft Defender Antivirus Exclusions profile, do the following steps:

1. In the Microsoft Intune admin center at <https://intune.microsoft.com>, go to **Endpoint security**.

2. On the **Endpoint security \| Overview** page, select **Antivirus** in the **Manage** section. Or, to go directly to the **Endpoint security \| Antivirus** page, use <https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/antivirus>.

3. On the **Summary** tab of the **Endpoint security \| Antivirus** page, select a policy in the **AV policies** section where the **Policy type** value is **Microsoft Defender Antivirus exclusions**.

4. On the policy properties page that opens, select **Edit** next to **Configuration settings**.

5. On the **Configuration settings** tab of the **Edit policy** page that opens, add or remove exclusions:
   - **Excluded extensions** section: Exclusions by file type extension. The exclusion applies to any files with that extension, regardless of location. For more information, see [ExcludedExtensions](/windows/client-management/mdm/policy-csp-defender#excludedextensions).
   - **Excluded paths** section: Exclusions by location (path). Also known as _file and folder exclusions_. Separate each path and enter one path per line. For more information, see [ExcludedPaths](/windows/client-management/mdm/policy-csp-defender#excludedpaths).
   - **Excluded processes** section: Exclusions for files opened by specified processes. Separate each file type in the list, with one file type per line. The processes themselves aren't excluded. To exclude processes, you can use file and folder exclusions. For more information, see [ExcludedProcesses](/windows/client-management/mdm/policy-csp-defender#excludedprocesses).

   To add an exclusion, select **Add**, and then enter the value in the box that appears. Repeat this step as many times as necessary.

   To remove an exclusion or an empty box, select the check box next to the entry, and then select **Remove**.

   To import a .csv file of new exclusions, select **Import**.

   To export the existing exclusions to a .csv file of, select **Export**.

   When you're finished on the **Configuration settings** tab, select **Next**.

6. On the **Review**, tab, review your settings. Use **Back** or select the **Configuration settings** tab to make changes.

   When you're finished on the **Review** tab, select **Save**.

Back on the policy properties page, updates to the exclusion list are shown in the **Configuration settings** \> **Defender** section.

<a name='audit-antivirus-exclusions-on-exchange-systems'></a>

## Antivirus exclusions on Exchange servers

Microsoft Exchange Server 2016 or later supports integration with the anti-malware Scan Interface (AMSI). For more information, see [Exchange Server AMSI integration](/exchange/antispam-and-antimalware/amsi-integration-with-exchange).

Many organizations exclude Exchange Server folders from antivirus scans for performance reasons. Microsoft recommends auditing Microsoft Defender Antivirus exclusions on Exchange servers and assessing whether you can remove exclusions without affecting performance. You can manage exclusions using Group Policy, PowerShell, or systems management tools like Microsoft Intune.

To audit Microsoft Defender Antivirus exclusions on an Exchange Server, run the [Get-MpPreference](/powershell/module/defender/get-mppreference) cmdlet from an elevated PowerShell prompt.

If you can't remove exclusions for the Exchange processes and folders, remember that a quick scan in Microsoft Defender Antivirus scans the Exchange directories and files, regardless of exclusions.

## See also

- [Microsoft Defender Antivirus exclusions on Windows Server 2016 and later](configure-server-exclusions-microsoft-defender-antivirus.md)
- [Common mistakes to avoid when defining exclusions](common-exclusion-mistakes-microsoft-defender-antivirus.md)
- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md)
- [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md)
- [Configure and validate exclusions for Microsoft Defender for Endpoint on macOS](mac-exclusions.md)
