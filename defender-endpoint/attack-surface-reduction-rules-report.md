---
title: Attack surface reduction rules reporting
description: Provides information about attack surface reduction rules detections, configuration, block threats, and methods to enable three standard rules and exclusions.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
audience: ITPro
author: limwainstein
ms.author: lwainstein
ms.reviewer: sugamar,
ms.custom: asr
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-asr
ms.date: 12/29/2025
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Attack surface reduction rules report

The Attack Surface Reduction Rules report provides detailed insights into the rules enforced on devices within your organization. Moreover, this report offers information about:

- Detected threats
- Blocked threats
- Devices that aren't configured to use the standard protection rules to block threats

In addition, the report provides an easy-to-use interface that enables you to:

- View threat detections
- View the configuration of the ASR rules
- Configure (add) exclusions
- Drill down to gather detailed information

To view the reports, you have the following options:

- From the [ASR report summary cards in the **Devices** section of the **Security report**](#asr-report-summary-cards-in-the-devices-section-of-the-security-report).
- Directly on the **Attack surface reduction rules** report page.

For more information about individual attack surface reduction rules, see [Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md).

## Prerequisites

- To access the attack surface reduction rules report, read permissions are required for the Microsoft Defender portal. 
- For Windows Server 2012 R2 and Windows Server 2016 to appear in the attack surface reduction rules report, these devices must be onboarded using the modern unified solution package. For more information, see [New functionality in the modern unified solution for Windows Server 2012 R2 and 2016](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).

### Supported operating systems

- Windows

## Report access permissions

To access the attack surface reduction rules report in the Microsoft Defender portal, the following permissions are required:

|Permission name|Permission type|
|---|---|
|View Data|Security operations|

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

To assign these permissions:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

1. In the navigation pane, select **Settings** \> **Endpoints** \> **Roles** (under **Permissions**).

1. Select the role you'd like to edit, and then select **Edit**.

1. In **Edit role**, on the **General** tab, in **Role name**, type a name for the role.

1. In **Description**, type a brief summary of the role.

1. In **Permissions**, select **View Data**, and under **View Data** select **Security operations**.

<a name='navigate-to-the-attack-surface-reduction-rules-report></a>

## ASR report summary cards in the Devices section of the Security report

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Reports** \> **General** section \> **Security report**. Or, to go directly to the security reports page, use <https://security.microsoft.com/reports>.

2. On the security reports page, find the **Devices** section that contains the ASR rule report summary cards:

  :::image type="content" source="media/attack-surface-reduction-rules-report-summary.png" alt-text="Shows the ASR rules report summary cards" lightbox="media/attack-surface-reduction-rules-report-summary.png":::

The ASR rules report summary is divided into two cards:

- [**ASR rule detections** summary card](#asr-rules-detections-summary-card)
- [**ASR rule configuration** summary card](#asr-rules-configuration-summary-card)

### ASR rules detections summary card

The ASR rules detections summary card shows a summary of the number of detected threats blocked by ASR rules. This card includes two action buttons:

- **View detections**: Opens the **Detections** tab
- **Add exclusions**: Opens the **Exclusions** tab

:::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-card.png" alt-text="Screenshot that shows the ASR rules report summary detections card." lightbox="media/attack-surface-reduction-rules-report-main-detections-card.png"::: 

Selecting the **ASR rules detections** link at the top of the card also opens the main [Attack surface reduction rules Detections tab](#attack-surface-reduction-rules-main-detections-tab).

### ASR rules configuration summary card

The top section focuses on three recommended rules, which protect against common attack techniques. This card shows current-state information about the computers in your organization that have the following [Three \(ASR\) standard protection rules](#simplified-standard-protection-option) set in **Block mode**, **Audit mode**, or **off** (not configured). The **Protect devices** button shows full configuration details for only the three rules; customers can quickly take action to enable these rules.

The bottom section surfaces six rules based on the number of unprotected devices per rule. The **View configuration** button surfaces all configuration details for all ASR rules. The **Add exclusions** button shows the **add exclusion** page with all detected file/process names listed for Security Operation Center (SOC) to evaluate. The **Add exclusion** page is linked to Microsoft Intune.

The card also includes two action buttons:

- **View configuration**: Opens the **Detections** tab
- **Add exclusions**: Opens the **Exclusions** tab

:::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-configuration-card.png" alt-text="Shows the ASR rules report summary configuration card." lightbox="media/attack-surface-reduction-rules-report-main-detections-configuration-card.png":::

Selecting the **ASR rules configuration** link at the top of the card also opens the main [Attack surface reduction rules Configuration tab](#attack-surface-reduction-rules-main-configuration-tab).

#### Simplified standard protection option

The configuration summary card provides a button to **Protect devices** with the three standard protection rules. At minimum, Microsoft recommends that you enable these three attack surface reduction standard protection rules:

- [Block credential stealing from the Windows local security authority subsystem (lsass.exe)](attack-surface-reduction-rules-reference.md#block-credential-stealing-from-the-windows-local-security-authority-subsystem)
- [Block abuse of exploited vulnerable signed drivers](attack-surface-reduction-rules-reference.md#block-abuse-of-exploited-vulnerable-signed-drivers)
- [Block persistence through Windows Management Instrumentation (WMI) event subscription](attack-surface-reduction-rules-reference.md#block-persistence-through-wmi-event-subscription)

To enable the three standard protection rules:

1. Select **Protect devices**. The main **Configuration** tab opens.

1. On the **Configuration** tab, **Basic rules** automatically toggles from **All rules** to **Standard protection rules** enabled.

1. In the **Devices** list, select the devices for which you want the standard protection rules to apply, and then select **Save**.

This card has two other navigation buttons:

- **View configuration**: Opens the **Configuration** tab.
- **Add exclusions**: Opens the **Exclusions** tab.

Selecting the **ASR rules configuration** link at the top of the card also opens the main [Attack surface reduction rules Configuration tab](#attack-surface-reduction-rules-main-configuration-tab).

<a name='attack-surface-reduction-rules-main-tabs'></a>

## The Attack surface reduction rules report page

While the ASR rules report summary cards are useful for getting quick summary of your ASR rules status, the main tabs provide more in-depth information with filtering and configuration capabilities:

In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Reports** \> **Endpoints** section \> **Attack surface reduction rules**. Or, to go directly to the **Attack surface reduction rules** report, use <https://security.microsoft.com/asr>

The following tabs are available on the **Attack surface reduction rules** report page:

- [Detections](#attack-surface-reduction-rules-main-detections-tab)
- [Configuration](#attack-surface-reduction-rules-main-configuration-tab)
- [Add exclusions](#attack-surface-reduction-rules-add-exclusions-tab)

### Attack surface reduction rules main Detections tab

To directly access the **Detections** tab of the **Attack surface reduction rules** report, use <https://security.microsoft.com/asr?viewid=detections>.

The **Detections** tab contains the following information:

- **Audit Detections**: Shows how many threat detections are captured by rules set in _Audit_ mode.
- **Blocked Detections**: Shows how many threat detections are blocked by rules set in _Block_ mode.
- **Large, consolidated graph**: Shows blocked and audited detections.

   :::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-tab.png" alt-text="Shows the ASR rules report main detections tab, with _Audit detections_ and _Blocked detections_ outlined." lightbox="media/attack-surface-reduction-rules-report-main-detections-tab.png":::

The graphs provide detection data over the displayed date range, with the capability to hover over a specific location to gather date-specific information.

The details table lists detected threats - on a per-device basis - with the following fields:

|Field name|Definition|
|---|---|
|Detected file|The file determined to contain a possible or known threat|
|Detected on|The date the threat was detected|
|Blocked\/Audited?|Whether the detecting rule for the specific event was in Block or Audit mode|
|Rule|Which rule detected the threat|
|Source app|The application that made the call to the offending "detected file"|
|Device|The name of the device on which the Audit or Block event occurred|
|Device group|The Active Directory group to which the device belongs|
|User|The machine account responsible for the call|
|Publisher|The company that released the particular .exe or application|

For more information about ASR rule audit and block modes, see [Attack surface reduction rule modes](attack-surface-reduction-rules-reference.md#asr-rule-modes).

The **Search** box is available to search entries by device ID, file name, or process name.

You can filter the information on the tab by selecting **Add filter**, and then selecting from the available options. After the filter is shown at the top of the tab, you can configure the selections for it:

- **Rules**: Select **Standard protection** or **All**.
- **Date**: Select a start date up to 30 days old.
- **Select rules**: Select one or more of the following rules:
  - **Block persistence through WMI event subscription**
  - **Block credential stealing from the Windows local security authority subsystem (lsass.exe)**
  - **Block abuse of exploited vulnerable signed drivers**

  > [!TIP]
  > To view all rules triggered, use the [DeviceEvents table in advanced hunting](/defender-xdr/advanced-hunting-deviceevents-table).
  >
  > Currently, the number of individual _detected_ items listed in the details table is limited to 200 rules. Use **Export** to save the full list of detections to a CSV file.

- **Device group**: Select an available device group.
- **Blocked/Audited?**: Select **Audited** or **Blocked**.

**GroupBy** is available in the details table with the following options:

- **No grouping**
- **Detected file**
- **Audit or block**
- **Rule**
- **Source app**
- **Device**
- **Device group**
- **User**
- **Publisher**

> [!TIP]
> Currently, to use **GroupBy**, you need to scroll to the last detection entry in the list to load the complete data set. Then you can use **GroupBy**. Otherwise, the results are incorrect for any result that has more than one viewable page of listed detections.

#### Actionable flyout

The "Detection" main page has a list of all detections (files/processes) in the last 30 days. Select on any of the detections to open with drill-down capabilities.

:::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-flyout.png" alt-text="Shows the ASR rules report main detections tab flyout" lightbox="media/attack-surface-reduction-rules-report-main-detections-flyout.png":::

The **Possible exclusion and impact** section provides the effect of the selected file or process. You can:

- Select **Go hunt** which opens the Advanced Hunting query page.
- **Open file page** opens Microsoft Defender for Endpoint detection.
- The **Add exclusion** button is linked with the add exclusion main page.

The following image illustrates how the Advanced Hunting query page opens from the link on the actionable flyout:

:::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-flyout-hunting.png" alt-text="Shows the attack surface reduction rules report main detections tab flyout link opening Advanced Hunting" lightbox="media/attack-surface-reduction-rules-report-main-detections-flyout-hunting.png":::

For more information about Advanced hunting, see [Proactively hunt for threats with advanced hunting in Microsoft Defender XDR](/defender-xdr/advanced-hunting-overview)

### Attack surface reduction rules main Configuration tab

To directly access the **Configuration** tab of the **Attack surface reduction rules** report, use <https://security.microsoft.com/asr?viewid=configuration>.

The **Configuration** tab provides summary and per-device ASR rules configuration details. There are three main aspects to the Configuration tab:

- **Basic rules** Provides a method to toggle results between **Basic rules** and **All Rules**. By default, **Basic rules** is selected.
- **Device configuration overview** Provides a current snapshot of devices in one of the following states:
  - All exposed Devices (devices with missing prerequisites, rules in Audit mode, misconfigured rules, or rules not configured)
  - Devices with rules not configured
  - Devices with rules in audit mode
  - Devices with rules in block mode
- **The lower, unnamed section** of the Configuration tab provides a listing of the current state of your devices (on a per-device basis):
  - Device (name)
  - Overall configuration (Whether any rules are on or all are off)
  - Rules in block mode (the number of rules per-device set to block)
  - Rules in audit mode (the number of rules in audit mode)
  - Rules turned off (rules that are turned off or aren't enabled)
  - Device ID (device GUID)

:::image type="content" source="media/attack-surface-reduction-rules-report-main-configuration-tab.png" alt-text="Shows the ASR rules report main configuration tab" lightbox="media/attack-surface-reduction-rules-report-main-configuration-tab.png":::

To enable ASR rules:

1. Under **Device**, select the device or devices for which you want to apply ASR rules.

1. In the flyout window, verify your selections and then select **Add to policy**. The **Configuration** tab and **add rule** flyout are shown in the following image.

   :::image type="content" source="media/attack-surface-reduction-rules-report-configuration-add-to-policy.png" alt-text="Shows the ASR rules fly-out to add ASR rules to devices" lightbox="media/attack-surface-reduction-rules-report-configuration-add-to-policy.png":::

  > [NOTE!]
  > If you have devices that require that different ASR rules be applied, you should configure those devices individually.

The **Search** box is available to search entries by device ID, file name, or process name.

At the top of the tab, you can filter rules by **Standard protection** or **All**.

### Attack surface reduction rules Add exclusions tab

To directly access the **Add exclusions** tab of the **Attack surface reduction rules** report, use <https://security.microsoft.com/asr?viewid=exclusions>.

The **Add exclusions** tab presents a ranked list of detections by file name and provides a method to configure exclusions. By default, **Add exclusions** information is listed for three fields:

- **File name**: The name of the file that triggered the ASR rules event.
- **Detections**: The total number of detected events for named file. Individual devices can trigger multiple ASR rules events.
- **Devices**: The number of devices on which the detection occurred.

:::image type="content" source="media/attack-surface-reduction-rules-report-exclusion-tab.png" alt-text="Shows the ASR rules report add exclusions tab." lightbox="media/attack-surface-reduction-rules-report-exclusion-tab.png":::

> [!IMPORTANT]
> Excluding files or folders can severely reduce the protection provided by ASR rules. Excluded files are allowed to run, and no report or event is recorded.
> If ASR rules are detecting files that you believe shouldn't be detected, you should [use audit mode first to test the rule](attack-surface-reduction-rules-deployment-test.md#step-1-test-attack-surface-reduction-rules-using-audit).

When you select a file, a **Summary & expected impact** fly out opens, presenting the following types of information:

- **Files selected** - The number of files you've selected for exclusion
- **(_number of_) detections** - States the expected reduction in detections after adding the selected exclusions. The reduction in detections is represented graphically for **Actual detections** and **Detections after exclusions**.
- **(_number of_) affected devices** - States the expected reduction in devices that report detections for the selected exclusions.

The Add exclusion page has two buttons for actions that can be used on any detected files (after selection). You can:

- **Add exclusion** which opens Microsoft Intune ASR policy page. For more information, see [Intune](enable-attack-surface-reduction.md) in "Enable ASR rules alternate configuration methods."
- **Get exclusion paths** which downloads file paths in a csv format.

  :::image type="content" source="media/attack-surface-reduction-rules-report-main-add-exclusions-flyout.png" alt-text="Shows the ASR rules report add exclusions tab flyout impact summary." lightbox="media/attack-surface-reduction-rules-report-main-add-exclusions-flyout.png":::

The **Search** box is available to search entries by device ID, file name, or process name.

Select **Filter** to filter rules by **Standard protection** or **All**.

## See also

- [Attack surface reduction rules deployment overview](attack-surface-reduction-rules-deployment.md)
- [Plan attack surface reduction rules deployment](attack-surface-reduction-rules-deployment-plan.md)
- [Test attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)
- [Enable attack surface reduction rules](attack-surface-reduction-rules-deployment-implement.md)
- [Operationalize attack surface reduction rules](attack-surface-reduction-rules-deployment-operationalize.md)
- [Attack surface reduction \(ASR\) rules report](attack-surface-reduction-rules-report.md)
- [Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)


