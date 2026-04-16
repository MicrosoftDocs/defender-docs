---
title: Enable attack surface reduction rules
description: Enable attack surface reduction rules to protect your devices from attacks that use macros, scripts, and common injection techniques.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: limwainstein
ms.author: lwainstein
ms.subservice: asr
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-asr
ms.custom: admindeeplinkDEFENDER
appliesto:
- Microsoft Defender for Endpoint Plan 1 and Plan 2
- Microsoft Defender XDR
- Microsoft Defender Antivirus
ms.date: 04/15/2026
---

# Enable attack surface reduction rules

[Attack surface reduction rules](attack-surface-reduction-rules-overview.md) help prevent actions that malware often abuses to compromise devices and networks. This article describes how to enable and configure attack surface reduction rules.

To manage ASR rules, we always recommend enterprise-level management solutions like Microsoft Intune or Microsoft Configuration Manager. ASR rule settings from Intune or Configuration Manager overwrite any conflicting settings from group policy or PowerShell on startup.

## Prerequisites

To use all ASR rule features, you need to meet the following requirements:

- Microsoft Defender Antivirus must be the primary anti-virus app on Windows devices. Microsoft Defender Antivirus can't be disabled or in passive mode.

- [Real-time protection](configure-real-time-protection-microsoft-defender-antivirus.md) must be on.

- [Cloud-delivery Protection](/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus) must be on (some rules require Cloud Protection).

- You must have [Cloud Protection network connectivity](configure-network-connections-microsoft-defender-antivirus.md)

- We recommend Microsoft 365 E5.

   Although attack surface reduction rules don't require a [Microsoft 365 E5 license](/microsoft-365/commerce/licenses/e3-extra-features-licenses), it is recommended to use attack surface reduction rules with a Microsoft 365 E5 license  (or similar licensing SKU) to take advantage of advanced management capabilities, including monitoring, analytics, and workflows available in Defender for Endpoint, as well as reporting and configuration capabilities in the [Microsoft Defender XDR](https://go.microsoft.com/fwlink/p/?linkid=2077139) portal. While these advanced capabilities aren't available with an E3 license, with an E3 license you can still use Event Viewer to review attack surface reduction rule events.

   If you have another license, such as Windows Professional or Microsoft 365 E3 that doesn't include advanced monitoring and reporting capabilities, you can develop your own monitoring and reporting tools on top of the events that are generated at each endpoint when attack surface reduction rules are triggered (for example, Event Forwarding).

   To learn more about Windows licensing, see [Windows Licensing](https://www.microsoft.com/licensing/product-licensing/windows) and get the [Microsoft Volume Licensing Reference Guide](https://www.microsoft.com/download/details.aspx?id=11091).

### Supported operating systems

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

<a name="exclude-files-and-folders-from-attack-surface-reduction-rules"></a>

## File and folder exclusions for ASR rules

> [!IMPORTANT]
> Excluding files or folders can severely reduce ASR rule protection. Excluded files are allowed to run, and no reports or events about the file are recorded. If ASR rules detect files that shouldn't be detected, [use Audit mode to test the rule](attack-surface-reduction-rules-deployment-test.md#step-1-test-attack-surface-reduction-rules-using-audit).

You can exclude specific **files** and **folders** from being evaluated by ASR rules. Even if an ASR rule determines the file or folder contains malicious behavior, it doesn't block the excluded files from running.

You can use the following methods to exclude files and folders from ASR rules:

- **Microsoft Defender Antivirus exclusions**: Not all ASR rules honor these exclusions. For more information about Microsoft Defender Antivirus exclusions, see [Configure custom exclusions for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md).
- **Global ASR rule exclusions**: These exclusions apply to all ASR rules. All methods of configuring ASR rules also support configuring global ASR rule exclusions.
- **Per-ASR rule exclusions**: Assign different exclusions selectively to different ASR rules. Only the following methods support configuring per-ASR rule exclusions:
  - Group policies (and the corresponding registry settings)
  - Endpoint security policies in Microsoft Intune.
- **Indicators of compromise (IoCs)**: Most ASR rules honor IoCs for blocked files and blocked certificates. For more information about IoCs, see [Overview of indicators in Microsoft Defender for Endpoint](indicators-overview.md).

The enforcement of different types of exclusions for ASR rules is summarized in the following table:

|Rule name|Honors MDAV<br>exclusions|Honors global ASR<br>exclusions|Honors per‑ASR rule<br>exclusions|Honors IoCs for<br>files|Honors IoCs for<br>certificates|
|---|:---:|:---:|:---:|:---:|:---:|
|**Standard protection rules**||||||
|Block abuse of exploited vulnerable signed drivers (Device)|Y|Y|Y|Y|Y|
|Block credential stealing from the Windows local security authority subsystem|N|Y|Y|N|N|
|Block persistence through WMI event subscription|N|Y|Y|N|N|
|**Other ASR rules**||||||
|Block Adobe Reader from creating child processes|N|Y|Y|Y|Y|
|Block all Office applications from creating child processes|Y|Y|Y|Y|Y|
|Block executable content from email client and webmail|Y|Y|Y|Y|Y|
|Block executable files from running unless they meet a prevalence, age, or trusted list criterion|Y|Y|Y|Y|Y|
|Block execution of potentially obfuscated scripts|Y|Y|Y|Y|Y|
|Block JavaScript or VBScript from launching downloaded executable content|Y|Y|Y|Y|Y|
|Block Office applications from creating executable content|N|Y|Y|Y|Y|
|Block Office applications from injecting code into other processes|N|Y|Y|N|N|
|Block Office communication application from creating child processes|N|Y|Y|Y|Y|
|Block process creations originating from PSExec and WMI commands|N|Y|Y|Y|Y|
|Block rebooting machine in Safe Mode|Y|Y|Y|Y|Y|
|Block untrusted and unsigned processes that run from USB|Y|Y|Y|Y|Y|
|Block use of copied or impersonated system tools|Y|Y|Y|Y|Y|
|Block Webshell creation for Servers|Y|Y|Y|Y|Y|
|Block Win32 API calls from Office macros|Y|Y|Y|Y|N|
|Use advanced protection against ransomware|Y|Y|Y|Y|Y|

When adding exclusions, keep these points in mind:

- Exclusion paths can use environment variables and wildcards. For more information, see [Use wildcards in the file name and folder path or extension exclusion lists](configure-extension-file-exclusions-microsoft-defender-antivirus.md#use-wildcards-in-the-file-name-and-folder-path-or-extension-exclusion-lists).

  > [!TIP]
  > Don't use **user** environment variables as wildcards in folder and process exclusions. Only use the following types of environment variables as wildcards:
  >
  > - System environment variables.
  > - Environment variables that apply to processes running as the NT AUTHORITY\SYSTEM account.
  >
  > For a list of system environment variables, see [System environment variables](configure-extension-file-exclusions-microsoft-defender-antivirus.md#system-environment-variables).

  - Wildcards can't define a drive letter.
  - To exclude more than one folder in a path, use multiple instances of `\*\` to indicate multiple nested folders. For example, `c:\Folder\*\*\Test`.
  - Microsoft Configuration Manager supports wildcards (`*` or `?`).
  - To exclude a file that contains random characters (for example, from automated file generation), use `?` symbol. For example, `C:\Folder\fileversion?.docx`.
- Exclusions apply only when the application or service starts. For example, if you add an exclusion for an update service that's already running, the update service continues to trigger ASR rule detections until you restart the service.

## How policy conflicts are handled

If the same device is assigned two different ASR rule policies, potential conflicts can occur based on the following elements:

- Whether the same ASR rules are assigned in different modes.
- Whether conflict management is in place.
- Whether the result is an error.

Nonconflicting ASR rules don't result in errors. The first rule is applied, and subsequent nonconflicting rules are merged into the policy.

If different ASR rule settings are applied to the same device by a [mobile device management (MDM) solution](#configure-asr-rules-in-any-mdm-solution-using-the-policy-csp) and [group policy](#configure-asr-rules-in-group-policy), the settings applied by group policy take precedence.

For information about how ASR rule setting conflicts are handled for the available deployment methods in Microsoft Intune, see [Devices managed by Intune](/intune/intune-service/protect/endpoint-security-asr-policy#devices-managed-by-intune).

<a name="configuration-methods"></a>

<a name="intune"></a>

<a name="endpoint-security-policy-preferred"></a>

<a name="device-configuration-profiles-alternative-1"></a>

## Configure ASR rules in Microsoft Intune

We recommend using endpoint security policies in Intune to deploy ASR rules, although other Intune methods are also available as described in the following subsections.

> [!NOTE]
> If you're using Intune on Windows Server 2012 R2 or Windows Server 2016 with the [modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2), the following ASR rules aren't supported and will fail to apply:
>
> - **Standard protection rules**:
>   - [Block persistence through WMI event subscription](attack-surface-reduction-rules-reference.md#block-persistence-through-wmi-event-subscription)
> - **Other ASR rules**:
>   - [Block JavaScript or VBScript from launching downloaded executable content](attack-surface-reduction-rules-reference.md#block-javascript-or-vbscript-from-launching-downloaded-executable-content)
>   - [Block Webshell creation for Servers](attack-surface-reduction-rules-reference.md#block-webshell-creation-for-servers) (available on Windows 2016 Exchange servers only)
>   - [Block Win32 API calls from Office macro](attack-surface-reduction-rules-reference.md#block-win32-api-calls-from-office-macros)

### Configure ASR rules and exclusions in Intune using endpoint security policies

To configure ASR rules using a Microsoft Intune Endpoint Security **Attack surface reduction** policy, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:

- **Policy type**: Attack surface reduction
- **Platform**: Windows
- **Profile**: Attack Surface Reduction Rules
- **Configuration settings**:
  - **Attack surface reduction**: In most cases, you can set the standard protection rules to **Block** mode without any testing. For all other rules, you should set them to **Audit** mode for testing before you enable them in **Block** or **Warn** mode. For more information, see [Attack surface reduction rules](attack-surface-reduction-rules-reference.md#attack-surface-reduction-rules).

    After you set the rule mode to **Audit**, **Block**, or **Warn**, an **ASR only per rule exclusions** section appears where you can specify exclusions that apply to that rule only.

  - **Attack surface reduction only exclusions**: Use this section to specify exclusions that apply to all ASR rules.

    To specify per-ASR rule exclusions or global ASR rule exclusions, use either of the following methods:

    - Select **Add**. In the box that appears, enter the path or path and filename to exclude. For example:
      - `C:\folder`
      - `%ProgramFiles%\folder\file.exe`
        `C:\path`

    - Select **Import** to import a CSV file that contains the names of files and folders to exclude. The CSV file uses the following format:

      ```text
      AttackSurfaceReductionOnlyExclusions
      "C:\folder"
      "%ProgramFiles%\folder\file.exe"
      "C:\path"
      ...
      ```

      > [!TIP]
      > Double quotation marks around the values are optional, and are ignored (aren't used in the values) if you include them. Don't use single quotation marks around the values.

    For more information about exclusions, see the [Exclude files and folders from attack surface reduction rules](#exclude-files-and-folders-from-attack-surface-reduction-rules) section earlier in this article.

  - **Enable controlled folder access**, **Controlled folder access protected folders**, and **Controlled folder access allowed applications**: For more information, see [Protect important folders with controlled folder access](controlled-folders.md).

<a name="custom-profile-in-intune-alternative-2"></a>

### Configure ASR rules in Intune using custom profiles with OMA-URIs and CSPs

Although we recommend using device configuration policies, you can also configure ASR rules in Intune using custom profiles that contain Open Mobile Alliance – Uniform Resource (OMA-URI) profiles using a Windows [Policy configuration service provider (CSP)](/windows/client-management/mdm/policy-configuration-service-provider).

For general information about OMA-URIs in Intune, see [Deploy OMA-URIs to target a CSP through Intune, and a comparison to on-premises](/troubleshoot/mem/intune/device-configuration/deploy-oma-uris-to-target-csp-via-intune).

1. In the Microsoft Intune admin center at <https://intune.microsoft.com>, select **Devices** \> **Manage devices** \> **Configuration**. Or, to go directly to the **Devices \| Configuration** page, use <https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/configuration>.

1. On the **Policies** tab of the **Devices \| Configuration** page, select **Create** \> **New policy**.

   :::image type="content" source="media/mem01-create-profile.png" alt-text="Screenshot of the Policies tab of the Devices - Configuration page in the Microsoft Intune admin center with Create selected." lightbox="media/mem01-create-profile.png":::

1. In the **Create a profile** flyout that opens, configure the following settings:
   - **Platform**: Select **Windows 10 and later**.
   - **Profile type**: Select **Templates**.
     - In the **Template name** section that appears, select **Custom**.

   Select **Create**.

   :::image type="content" source="media/mem02-profile-attributes.png" alt-text="The rule profile attributes in the Microsoft Intune admin center portal." lightbox="media/mem02-profile-attributes.png":::

1. The custom template wizard opens. On the **Basics** tab, configure the following settings:
   - **Name**: Enter a unique a name for the template.
   - **Description**: Enter an optional description.

   When you're finished on the **Basics** tab, select **Next**.

1. On the **Configuration settings** tab, select **Add**.

   :::image type="content" source="media/mem04-2-configuration-settings.png" alt-text="Screenshot showing the configuration settings in the Microsoft Intune admin center portal." lightbox="media/mem04-2-configuration-settings.png":::

   In the **Add row** flyout that opens, configure the following settings:

   - **Name**: Enter a unique name for the rule.
   - **Description**: Enter an optional, brief description.
   - **OMA-URI**: Enter the **Device** value from the [AttackSurfaceReductionRules](/windows/client-management/mdm/policy-csp-defender#attacksurfacereductionrules) CSP: `./Vendor/MSFT/Policy/Config/Defender/AttackSurfaceReductionRules`
     - **Data type**: Select **String**.
     - **Value**: Use the following syntax:

       ```text
       <RuleGuid1>=<ModeForRuleGuid1>
       <RuleGuid2>=<ModeForRuleGuid2>
       ...
       <RuleGuidN>=<ModeForRuleGuidN>
       ```

       - GUID values for ASR rules are available at [Attack surface reduction rules](attack-surface-reduction-rules-reference.md#attack-surface-reduction-rules).
       - The following [rule modes](attack-surface-reduction-rules-reference.md#asr-rule-modes) are available:
         - `0`: Off
         - `1`: Block
         - `2`: Audit
         - `5`: Not configured
         - `6`: Warn

       For example:

       ```text
       75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84=2
       3b576869-a4ec-4529-8536-b80a7769e899=1
       d4f940ab-401b-4efc-aadc-ad5f3c50688a=2
       d3e037e1-3eb8-44c8-a917-57927947596d=1
       5beb7efe-fd9a-4556-801d-275e5ffc04cc=0
       be9ba2d9-53ea-4cdc-84e5-9b1eeee46550=1

     :::image type="content" source="media/mem05-add-row-oma-uri.png" alt-text="Screenshot of the Add row flyout of the Configuration Settings tab of the OMA URI configuration in the Microsoft Intune admin center." lightbox="media/mem05-add-row-oma-uri.png":::

     When you're finished on the **Add row** flyout, select **Save**.

     > [!TIP]
     > At this point, you could also add global ASR rule exclusions to the custom profile instead of creating a separate profile just for exclusions. For instructions, see the next subsection [Configure global ASR rule exclusions in Intune using custom profiles with OMA-URIs and CSPs](#configure-global-asr-rule-exclusions-in-intune-using-custom-profiles-with-oma-uris-and-csps).

   Back on the **Configuration settings** tab, select **Next**.

1. On the **Assignments** tab, configure the following settings:
   - **Included groups** section: Select one of the following options:
     - **Add groups**: Select one or more groups to include.
     - **Add all users**
     - **Add all devices**
   - **Excluded groups** section: Select **Add groups** to specify any groups to exclude.

   When you're finished on the **Assignments** tab, select **Next**.

   :::image type="content" source="media/mem06-4-assignments.png" alt-text="Screenshot of the Assignments tab of the OMA URI configuration in the Microsoft Intune admin center." lightbox="media/mem06-4-assignments.png":::

1. On the **Applicability rules** tab, select **Next**.

   You can use the **OS edition** and **OS version** properties to define the types of devices that should or shouldn't get the profile.

   :::image type="content" source="media/mem07-5-applicability-rules.png" alt-text="The applicability rules in the Microsoft Intune admin center portal." lightbox="media/mem07-5-applicability-rules.png":::

1. On the **Review + create** tab, review the settings. You can use **Previous** or select a tab to go back and make changes.

   When you're ready to create the profile, select **Create** on the **Review + create** tab. and information you've selected and entered, and then select **Create**.

   :::image type="content" source="media/mem08-6-review-create.png" alt-text="Screenshot showing the Review and create tab in the Microsoft Intune admin center portal." lightbox="media/mem08-6-review-create.png":::

You immediately return to the **Policies** tab of the **Devices \| Configuration** page. You might need to select **Refresh** to see the policy.

ASR rules are active within minutes.

#### Configure global ASR rule exclusions in Intune using custom profiles with OMA-URIs and CSPs

The steps to configure global ASR rule **exclusions** in Intune using a custom profile are very similar to the ASR rule steps in the previous section. The only difference is in Step 5 (the **Configuration settings** tab) where you enter the information for ASR rule exceptions:

On the **Configuration settings** tab, select **Add**. In the **Add row** flyout that opens, configure the following settings:

- **Name**: Enter a unique name for the rule.
  - **Description**: Enter an optional, brief description.
  - **OMA-URI**: Enter the **Device** value from the [AttackSurfaceReductionOnlyExclusions](/windows/client-management/mdm/policy-csp-defender#attacksurfacereductiononlyexclusions) CSP: `./Device/Vendor/MSFT/Policy/Config/Defender/AttackSurfaceReductionOnlyExclusions`
    - **Data type**: Select **String**.
    - **Value**: Use the following syntax:

      ```text
      <PathOrPathAndFilename1>
      <PathOrPathAndFilename1>
      ...
      <PathOrPathAndFilenameN>
      ```

      For example:

      ```text
      C:\folder
      %ProgramFiles%\folder\file.exe
      C:\path
      ```

When you're finished on the **Add row** flyout, select **Save**.

Back on the **Configuration settings** tab, select **Next**.

The rest of the steps are the same as configuring ASR rules.

<a name="mdm"></a>

## Configure ASR rules in any MDM solution using the Policy CSP

The Policy configuration service provider (CSP) enables enterprise organizations to configure policies on Windows devices using any mobile device management (MDM) solution, not just Microsoft Intune. For more information, see [Policy CSP](/windows/client-management/mdm/policy-configuration-service-provider).

You can configure ASR rules using the [AttackSurfaceReductionRules](/windows/client-management/mdm/policy-csp-defender#attacksurfacereductionrules) CSP with the following settings:

**OMA-URI path**: `./Vendor/MSFT/Policy/Config/Defender/AttackSurfaceReductionRules`<br/>
**Value**: `<RuleGuid1>=<ModeForRuleGuid1>|<RuleGuid2>=<ModeForRuleGuid2>|...<RuleGuidN>=<ModeForRuleGuidN>`

- GUID values for ASR rules are available at [Attack surface reduction rules](attack-surface-reduction-rules-reference.md#attack-surface-reduction-rules)
- The following [rule modes](attack-surface-reduction-rules-reference.md#asr-rule-modes) are available:
  - `0`: Off
  - `1`: Block
  - `2`: Audit
  - `5`: Not configured
  - `6`: Warn

For example:

`75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84=2|3b576869-a4ec-4529-8536-b80a7769e899=1|d4f940ab-401b-4efc-aadc-ad5f3c50688a=2|d3e037e1-3eb8-44c8-a917-57927947596d=1|5beb7efe-fd9a-4556-801d-275e5ffc04cc=0|be9ba2d9-53ea-4cdc-84e5-9b1eeee46550=1`

> [!NOTE]
> Be sure to enter OMA-URI values without spaces.

### Configure global ASR rule exclusions in any MDM solution using the Policy CSP

You can use the Policy CSP to configure global ASR rule path and path and filename exclusions using the [AttackSurfaceReductionOnlyExclusions](/windows/client-management/mdm/policy-csp-defender#attacksurfacereductiononlyexclusions) CSP with the following settings:

**OMA-URI path**: `./Device/Vendor/MSFT/Policy/Config/Defender/AttackSurfaceReductionOnlyExclusions`<br/>
**Value**: `<PathOrPathAndFilename1>=0|<PathOrPathAndFilename1>=0|...<PathOrPathAndFilenameN>=0`

For example, `C:\folder|%ProgramFiles%\folder\file.exe|C:\path`

<a name="microsoft-configuration-manager"></a>

## Configure ASR rules and global ASR rule exclusions in Microsoft Configuration Manager

For instructions, see the attack surface reduction information in [Create and deploy an Exploit Guard policy](/intune/configmgr/protect/deploy-use/create-deploy-exploit-guard-policy).

> [!WARNING]
> There's a known issue with the applicability of attack surface reduction on Server OS versions which is marked as compliant without any actual enforcement. Currently, there's no defined release date for when this will be fixed.

> [!IMPORTANT]
> If you're using "Disable admin merge" set to `true` on devices, and you're using any of the following tools/methods, adding ASR rules per-rule exclusions or local ASR rule exclusions don't apply:
>
> - Defender for Endpoint Security Settings Management (Disable Local Admin Merge) **Windows policies** tab of the **Endpoint security policies** page in the Microsoft Defender portal at <https://security.microsoft.com/policy-inventory?osPlatform=Windows>
> - Microsoft Intune (Disable Local Admin Merge)
> - The Defender CSP (**[DisableLocalAdminMerge](/windows/client-management/mdm/defender-csp)**)
> - Group Policy (Configure local administrator merge behavior for lists)
>
> To modify this behavior, you need to change "Disable admin merge" to `false`.

<a name="group-policy"></a>

## Configure ASR rules and exclusions in group policy

> [!WARNING]
> If you manage your computers and devices with Intune, Microsoft Configuration Manager, or other enterprise-level management software, the management software overwrites any conflicting group policy settings on startup.

1. Open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click on the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **Microsoft Defender Exploit Guard \> Attack Surface Reduction**.

1. In the details pane of **Attack Surface Reduction**, the available settings are:

   - [Configure Attack Surface Reduction rules](#configure-asr-rules-in-group-policy)
   - [Exclude files and paths from Attack surface reduction rules](#enable-exclusions-for-all-asr-rules-in-group-policy)
   - [Apply a list of exclusions to specific attack surface reduction (ASR) rules](#enable-per-rule-exclusions-in-group-policy)

   To open and configure an ASR rule setting, use any of the following methods:
   - Double-click on the setting.
   - Right-click on the setting, and then select **Edit**
   - Select the setting, and then select **Action** \> **Edit**.

The available settings are described in the following subsections.

> [!IMPORTANT]
> Quotation marks, leading spaces, trailing spaces, and extra characters aren't supported in any of the ASR rule-related values in group policy.
>
> Group Policy paths before Windows 10 version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Both names refer to the same policy location.

<a name="enable-asr-rules"></a>

### Configure ASR rules in group policy

1. In the details pane of **Attack Surface Reduction**, open the **Configure Attack Surface Reduction rules** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   2. **Set the state for each ASR rule**: Select **Show...**.

1. In the **Set the state for each ASR rule** dialog that opens, configure the following settings:
   - **Value name**: Enter the [GUID value of the ASR rule](attack-surface-reduction-rules-reference.md#asr-rule-to-guid-matrix).
   - **Value**: Enter one of the following [rule mode](attack-surface-reduction-rules-reference.md#asr-rule-modes) values:
     - `0`: Off
     - `1`: Block
     - `2`: Audit
     - `5`: Not configured
     - `6`: Warn

   :::image type="content" source="media/asr-rules-gp.png" alt-text="Screenshot of Configure Attack Surface Reduction rules in Group Policy." lightbox="media/asr-rules-gp.png":::

   For more information, see [ASR rule modes](attack-surface-reduction-rules-reference.md#asr-rule-modes).

   Repeat this step as many times as necessary. When you're finished, select **OK**.

<a name="apply-exclusions-for-all-asr-rules"></a>

<a name="enable-exclusions-for-all-asr-rules-in-group-policy"></a>

### Configure global ASR rule exclusions in group policy

The paths or filenames with paths you specify are used as exclusions for all ASR rules.

1. In the details pane of **Attack Surface Reduction**, open the **Exclude files and paths from Attack surface reduction rules** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   2. **Exclusions from ASR rules**: Select **Show...**.

1. In the **Exclusions from ASR rules** dialog that opens, configure the following settings:
   - **Value name**: Enter the [GUID value of the ASR rule](attack-surface-reduction-rules-reference.md#asr-rule-to-guid-matrix).
   - **Value**: Enter one of the following types of values:
     - To exclude all files in a folder, enter the full folder path. For example, `C:\Data\Test`.
     - To exclude a specific file in a specify folder (recommended), enter the path and filename. For example, `C:\Data\Test\test.exe`.

   Repeat this step as many times as necessary. When you're finished, select **OK**.

<a name="apply-per-rule-exclusions"></a>

<a name="enable-per-rule-exclusions-in-group-policy"></a>

### Configure per-ASR rule exclusions in group policy

The paths or filenames with paths you specify are used as exclusions for all ASR rules.

> [!NOTE]
> If the **Apply a list of exclusions to specific attack surface reduction (ASR) rules** setting isn't available in your GPMC, you need version 24H2 or later of the [Administrative Templates files](/troubleshoot/windows-client/group-policy/create-and-manage-central-store#links-to-download-the-administrative-templates-files-based-on-the-operating-system-version) in your [Central Store](/troubleshoot/windows-client/group-policy/create-and-manage-central-store#the-central-store).

1. In the details pane of **Attack Surface Reduction**, open the **Apply a list of exclusions to specific attack surface reduction (ASR) rules** setting.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   2. **Exclusions for each ASR rule**: Select **Show...**.

1. In the **Exclusions for each ASR rule** dialog that opens, configure the following settings:
   - **Value name**: Enter the [GUID value of the ASR rule](attack-surface-reduction-rules-reference.md#asr-rule-to-guid-matrix).
   - **Value**: Enter one or more exclusions for the ASR rule. Use the syntax `Path1\ProcessName1>Path2\ProcessName2>...PathN\ProcessNameN`. For example, `C:\Windows\Notepad.exe>c:\Windows\regedit.exe>C:\SomeFolder\test.exe`.

   Repeat this step as many times as necessary. When you're finished, select **OK**.

<a name="powershell"></a>

## Configure ASR rules in PowerShell

> [!WARNING]
> If you manage your computers and devices with Intune, Configuration Manager, or another enterprise-level management platform, the management software overwrites any conflicting PowerShell settings on startup.

Use the following PowerShell command syntax in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**):

```powershell
<Add-MpPreference | Set-MpPreference | Remove-MpPreference> -AttackSurfaceReductionRules_Ids <RuleGuid1>,<RuleGuid2>,...<RuleGuidN> -AttackSurfaceReductionRules_Actions <ModeForRuleGuid1>,<ModeForRuleGuid2>,...<ModeForRuleGuidN>
```

- **Set-MpPreference** _overwrites_ any existing rules and their corresponding modes with the values you specify. To see the list of existing values, run the following command:

  ```powershell
  $p = Get-MpPreference;0..([math]::Min($p.AttackSurfaceReductionRules_Ids.Count,$p.AttackSurfaceReductionRules_Actions.Count)-1) | % {[pscustomobject]@{Id=$p.AttackSurfaceReductionRules_Ids[$_];Action=$p.AttackSurfaceReductionRules_Actions[$_]}} | Format-Table -AutoSize
  ```

  To add new rules and their corresponding modes without affecting any existing values, use the **Add-MpPreference** cmdlet. To remove the specified rules and their corresponding modes without affecting other existing values, use the **Remove-MpPreference** cmdlet. The command syntax is identical for the three cmdlets.

- GUID values for ASR rules are available at [Attack surface reduction rules](attack-surface-reduction-rules-reference.md#attack-surface-reduction-rules).
- Valid values for the _AttackSurfaceReductionRules\_Actions_ parameter are:
  - `0` or `Disabled`
  - `1` or `Enabled` (**Block** mode)
  - `2` or `AuditMode` or `Audit`
  - `5` or `NotConfigured`
  - `6` or `Warn`

The following example configures the specified ASR rules on the device:

- The first two rules are enabled in **Block** mode.
- The third rule is disabled.
- The last rule is enabled in **Audit** mode.

```powershell
Set-MpPreference -AttackSurfaceReductionRules_Ids 26190899-1602-49e8-8b27-eb1d0a1ce869,3b576869-a4ec-4529-8536-b80a7769e899,e6db77e5-3df2-4cf1-b95a-636979351e5,01443614-cd74-433a-b99e-2ecdc07bfc25 -AttackSurfaceReductionRules_Actions Enabled,Enabled,Disabled,AuditMode
```

### Configure global ASR rule exclusions in PowerShell

Use the following PowerShell command syntax in an elevated PowerShell session:

```powershell
<Add-MpPreference | Set-MpPreference | Remove-MpPreference> -AttackSurfaceReductionOnlyExclusions "<PathOrPathAndFilename1>","<PathOrPathAndFilename2>",..."<PathOrPathAndFilenameN>"
```

- **Set-MpPreference** _overwrites_ any existing ASR rule exclusions with the values you specify. To see the list of existing values, run the following command:

  ```powershell
  (Get-MpPreference).AttackSurfaceReductionOnlyExclusions
  ```

  To add new exceptions without affecting any existing values, use the **Add-MpPreference** cmdlet. To remove the specified exceptions without affecting any other values, use the **Remove-MpPreference** cmdlet. The command syntax is identical for the three cmdlets.

  The following example configures the specified path and path with filename as exclusions for all ASR rules on the device:

  ```powershell
  Set-MpPreference -AttackSurfaceReductionOnlyExclusions "C:\Data\Test","C:\Data\LOBApp\app1.exe"
  ```

## Related content

- [Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)
- [Evaluate attack surface reduction](attack-surface-reduction-rules-deployment-test.md)
- [Attack surface reduction FAQ](attack-surface-reduction-rules-overview.md)
