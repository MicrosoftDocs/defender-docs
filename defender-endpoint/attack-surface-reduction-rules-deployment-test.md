---
title: Test attack surface reduction rules
description: Learn how to test attack surface reduction rules in Defender for Endpoint.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: limwainstein
ms.author: lwainstein
ms.reviewer: sugamar
ms.custom: asr
ms.topic: how-to
ms.collection:
 - m365-security
 - m365solution-asr-rules
 - highpri
 - tier1
 - mde-asr
ms.date: 03/06/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Test attack surface reduction rules

Testing Microsoft Defender for Endpoint attack surface reduction (ASR) rules helps you determine if rules impede line-of-business operations before you enable rules. By starting with a small, controlled group, you can limit potential work disruptions as you expand the deployment across your organization.

In this step of the ASR rules deployment guide, you learn how to:

- Configure rules using Microsoft Intune
- Use Microsoft Defender for Endpoint attack surface reduction rules reports
- Configure attack surface reduction rules exclusions
- Enable attack surface reduction rules using PowerShell
- Use Event Viewer for attack surface reduction rules events

> [!NOTE]
> Before you begin testing attack surface reduction rules, it's recommended that you first disable all rules that were previously set to either **audit** or **enable** (if applicable). See [Attack surface reduction rules reports](attack-surface-reduction-rules-report.md) for information about using the attack surface reduction rules report disabling attack surface reduction rules.

Begin your attack surface reduction rules deployment with ring 1.

> :::image type="content" source="media/asr-rules-testing-steps.png" alt-text="The Microsoft Defender for Endpoint attack surface reduction (ASR rules) test steps. Audit attack surface reduction rules, configure ASR rules exclusions. Configure ASR rules Intune. ASR rules exclusions. ASR rules event viewer." lightbox="media/asr-rules-testing-steps.png":::

## Step 1: Test attack surface reduction rules using Audit

Begin the testing phase by turning on the attack surface reduction rules with the rules set to Audit, starting with your champion users or devices in ring 1. Typically, the recommendation is that you enable all the rules (in Audit) so that you can determine which rules are triggered during the testing phase.

 Rules that are set to Audit don't generally impact functionality of the entity or entities to which the rule is applied but do generate logged events for the evaluation; there's no effect on end users.

### Configure attack surface reduction rules using Intune

To configure attack surface reduction rules using a Microsoft Intune Endpoint Security **Attack surface reduction** policy, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:

- **Policy type**: Attack surface reduction
- **Platform**: Windows 10, Windows 11, and Windows Server
- **Profile**: Attack Surface Reduction Rules
- **Configuration settings**: Set all rules to **Audit mode** to assess impact before enforcement

For more information about attack surface reduction profiles available in Microsoft Intune, see [Manage attack surface reduction settings with Microsoft Intune](/intune/intune-service/protect/endpoint-security-asr-policy#attack-surface-reduction-profiles).

After your policy is created and assigned, return to this article to continue with [testing and validation](#step-2-understand-the-attack-surface-reduction-rules-reporting-page-in-the-microsoft-defender-portal).

<a name='step-2-understand-the-asr-rules-reporting-page-in-the-microsoft-365-defender-portal'></a>

## Step 2: Understand the attack surface reduction rules reporting page in the Microsoft Defender portal

The attack surface reduction rules reporting page is found in **Microsoft Defender portal** > **Reports** > **Attack surface reduction rules**. This page has three tabs:

- Detections
- Configuration
- Add exclusions

### Detections tab

Provides a 30-day timeline of detected audit and blocked events.

> [!div class="mx-imgBorder"]
> :::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-card.png" alt-text="Graph that shows the attack surface reduction rules report summary detections card." lightbox="media/attack-surface-reduction-rules-report-main-detections-card.png":::

The attack surface reduction rules pane provides an overview of detected events on a per-rule basis.

> [!NOTE]
> There are some variations in attack surface reduction rules reports. Microsoft is in the process of updating the behavior of the attack surface reduction rules reports to provide a consistent experience.

:::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-configuration-card.png" alt-text="Graph that shows the attack surface reduction rules report summary configuration card." lightbox="media/attack-surface-reduction-rules-report-main-detections-configuration-card.png":::

Select **View detections** to open the **Detections** tab.

>:::image type="content" source="media/attack-surface-reduction-rules-report-main-tabs-search.png" alt-text="Screenshot that shows the attack surface reduction rules report search feature." lightbox="media/attack-surface-reduction-rules-report-main-tabs-search.png":::

The **GroupBy** and **Filter** pane provide the following options:

The **GroupBy** returns results set to the following groups:

- No grouping
- Detected file
- Audit or block
- Rule
- Source app
- Device
- User
- Publisher

> [!NOTE]
> When filtering by rule, the number of individual _detected_ items listed in the lower half of the report is currently limited to 200 rules. You can use **Export** to save the full list of detections to Excel.

:::image type="content" source="media/attack-surface-reduction-rules-report-main-tabs-search-configuration-tab.png" alt-text="Screenshot that shows the Azure Site Recovery rules report search feature on the configuration tab." lightbox="media/attack-surface-reduction-rules-report-main-tabs-search-configuration-tab.png":::

**Filter** opens the **Filter on rules** page, which enables you to scope the results to only the selected attack surface reduction rules:

> [!div class="mx-imgBorder"]
> :::image type="content" source="media/asr-defender365-filter.png" alt-text="The Attack surface reduction rules detections filter on rules" lightbox="media/asr-defender365-filter.png":::

> [!NOTE]
> If you have a license for Microsoft 365 Security E5 or A5, or Windows E5 or A5, the following link opens the Microsoft Defender portal with detections visible: [Attack surface reduction detections](https://security.microsoft.com/asr?viewid=detections).

### Configuration tab

Lists, on a per-computer basis, the aggregate state of attack surface reduction rules: Off, Audit, Block.

>:::image type="content" source="media/attack-surface-reduction-rules-report-main-configuration-tab.png" alt-text="Screenshot that shows the attack surface reduction rules report main configuration tab." lightbox="media/attack-surface-reduction-rules-report-main-configuration-tab.png":::

On the Configurations tab, you can see which attack surface reduction rules are enabled and their mode for each device by selecting the device you want to review.

>:::image type="content" source="media/attack-surface-reduction-rules-report-configuration-add-to-policy.png" alt-text="Screenshot that shows the ASR rules fly-out to add ASR rules to devices." lightbox="media/attack-surface-reduction-rules-report-configuration-add-to-policy.png":::

The **Get started** link opens the Microsoft Intune admin center, where you can create or modify an endpoint protection policy for attack surface reduction:

> [!div class="mx-imgBorder"]
> :::image type="content" source="media/asr-defender365-05b-mem1.png" alt-text="The *Endpoint security menu item on the Overview page" lightbox="media/asr-defender365-05b-mem1.png":::

In Endpoint security | Overview, select **Attack surface reduction**:

> [!div class="mx-imgBorder"]
> :::image type="content" source="media/asr-defender365-05b-mem2.png" alt-text="The Attack surface reduction in Intune" lightbox="media/asr-defender365-05b-mem2.png":::

The Endpoint Security | Attack surface reduction pane opens:

> [!div class="mx-imgBorder"]
> :::image type="content" source="media/asr-defender365-05b-mem3.png" alt-text="The Endpoint security Attack surface reduction pane" lightbox="media/asr-defender365-05b-mem3.png":::

> [!NOTE]
> If you have a Microsoft Defender 365 E5 (or Windows E5?) License, this link opens the Microsoft Defender 365  Reports > Attack surface reductions > [Configurations](https://security.microsoft.com/asr?viewid=configuration) tab.

### Add exclusions

This tab provides a method to select detected entities (for example, false positives) for exclusion. When exclusions are added, the report provides a summary of the expected impact.

> [!NOTE]
> Attack surface reduction rules honor Microsoft Defender Antivirus (AV) exclusion. See [Configure and validate exclusions based on extension, name, or location](configure-extension-file-exclusions-microsoft-defender-antivirus.md).

> [!div class="mx-imgBorder"]
> :::image type="content" source="media/asr-defender365-06d.png" alt-text="The pane for exclusion of the detected file" lightbox="media/asr-defender365-06d.png":::

> [!NOTE]
> If you have an appropriate license and permissions, this link opens the Microsoft Defender portal with [Exclusions visible](https://security.microsoft.com/asr?viewid=exclusions).

For more information about using the attack surface reduction rules report, see [Attack surface reduction rules reports](attack-surface-reduction-rules-report.md).

## Configure attack surface reduction per-rule exclusions

Attack surface reduction rules now provide the capability to configure rule-specific exclusions, known as "Per Rule Exclusions."

To configure specific rule exclusions, you have the choices of using the Defender for Endpoint Security Settings Management, Intune, and Group Policy.

> [!NOTE]
> When configuring Attack Surface Reduction per-rule exclusions, keep in mind that specifying only the file or application name (for example, `test1.exe`) isn't sufficient. You must provide the full file or application path (for example, `C:\test1.exe`) to ensure the exclusion is applied correctly.

#### Via Intune

1. Open the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431), and navigate to **Home** > **Endpoint security** > **Attack surface reduction**.

1. If it isn't already configured, set the rule for which you want to configure exclusions to **Audit** or **Block**.

1. In **ASR Only Per Rule Exclusion**, select the toggle to change from **Not configured** to **Configured.**

1. Enter the names of the files or application that you want to exclude.

1. At the bottom of the **Create profile** wizard, select **Next**, and then follow the wizard instructions.

>:::image type="content" source="media/attack-surface-reduction-rules-report-per-rule-exclusion.png" alt-text="Screenshot that shows the configuration settings for adding ASR per-rule exclusions." lightbox="media/attack-surface-reduction-rules-report-per-rule-exclusion.png":::

> [!TIP]
> Use the checkboxes next to your list of exclusion entries to select items to **Delete**, **Sort**, **Import**, or **Export**.

#### Via Group Policy

For instructions, see [Configure ASR rules via group policy](attack-surface-reduction-rules-enable.md#group-policy).

If the GPO isn't applied to devices, see [Troubleshoot Microsoft Defender Antivirus settings](troubleshoot-settings.md).

### Use PowerShell as an alternative method to enable attack surface reduction rules

Use PowerShell, as an alternative to Intune, to enable attack surface reduction rules in audit mode. This configuration allows you to view a record of apps that would have been blocked if the feature was fully enabled. You can also see how often the rules fire during normal use.

To enable an attack surface reduction rule in audit mode, use the following PowerShell cmdlet:

```PowerShell
Add-MpPreference -AttackSurfaceReductionRules_Ids <rule ID> -AttackSurfaceReductionRules_Actions AuditMode
```

Where `<rule ID>` is a [GUID value of the attack surface reduction rule](attack-surface-reduction-rules-reference.md).

To enable all the added attack surface reduction rules in audit mode, use the following PowerShell cmdlet:

```PowerShell
(Get-MpPreference).AttackSurfaceReductionRules_Ids | Foreach {Add-MpPreference -AttackSurfaceReductionRules_Ids $_ -AttackSurfaceReductionRules_Actions AuditMode}
```

> [!TIP]
> If you want to fully audit how attack surface reduction rules work in your organization, you need to use a management tool to deploy this setting to devices in your network.

You can also use Group Policy, Intune, or mobile device management (MDM) configuration service providers (CSPs) to configure and deploy the setting. Learn more in the main [Attack surface reduction rules](attack-surface-reduction-rules-overview.md) article.

<a name='use-windows-event-viewer-review-as-an-alternative-to-the-attack-surface-reduction-rules-reporting-page-in-the-microsoft-365-defender-portal'></a>

## Use Windows Event Viewer Review as an alternative to the attack surface reduction rules reporting page in the Microsoft Defender portal

To review apps that would be blocked, open Event Viewer and filter for Event ID 1121 in the Microsoft-Windows-Windows Defender/Operational log. The following table lists all network protection events.

|Event ID|Description|
|---|---|
|5007|Event when settings are changed|
|1121|Event when an attack surface reduction rule fires in block mode|
|1122|Event when an attack surface reduction rule fires in audit mode|

## Other articles in this deployment collection

[Attack surface reduction rules deployment overview](attack-surface-reduction-rules-deployment.md)

[Plan attack surface reduction rules deployment](attack-surface-reduction-rules-deployment-plan.md)

[Enable attack surface reduction rules](attack-surface-reduction-rules-deployment-implement.md)

[Operationalize attack surface reduction rules](attack-surface-reduction-rules-deployment-operationalize.md)

[Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)

[Troubleshoot attack surface reduction rules](troubleshoot-asr.md)



