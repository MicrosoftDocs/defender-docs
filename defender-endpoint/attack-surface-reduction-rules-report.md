---
title: ASR rules report
description: Admins can learn about the Attack surface reduction rules report in the Microsoft Defender portal, which includes information about ASR rule detections, configuration, and blocked threats.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
audience: ITPro
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar
ms.custom: asr
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-asr
ms.date: 04/07/2026
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Attack surface reduction (ASR) rules report in the Microsoft Defender portal

The Attack surface reduction (ASR) rules report provides detailed insights into the rules enforced on devices within your organization. For example:

- Detected threats.
- Blocked threats.
- Devices that aren't configured to use the [standard protection rules](attack-surface-reduction-rules-overview.md#asr-rules) to block threats.

The report provides an easy-to-use interface that enables you to complete the following tasks:

- View threat detections.
- View the configuration of ASR rules.
- Add and manage exclusions.
- Gather detailed information.

For more information about ASR rules, see [Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md).

## Prerequisites

### Supported operating systems

- Windows

  To appear in the report, Windows Server 2012 R2 and Windows Server 2016 devices devices must be onboarded using the modern unified solution package. For more information, see [New functionality in the modern unified solution for Windows Server 2012 R2 and 2016](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).

### Report access permissions

To access the attack surface reduction rules report in the Microsoft Defender portal, you have the following options:

- You need to be assigned permissions before you can do the procedures in this article. You have the following options:
  - [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac): **Security operations \ Security data \ Security data basics (read)**.
  - [Defender for Endpoint permissions](user-roles.md) (available in organizations created before February 2025): **View data** \> **Security operations**.
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup>, **Security Administrator**, **Global Reader**, or **Security Reader** roles gives users the required permissions _and_ permissions for other features in Microsoft 365.

    > [!IMPORTANT]
    > Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

<a name='navigate-to-the-attack-surface-reduction-rules-report'></a>

<a name='attack-surface-reduction-rules-main-tabs'></a>

## The Attack surface reduction rules report page

In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Reports** \> **Endpoints** section \> **Attack surface reduction rules**. Or, to go directly to the **Attack surface reduction rules** report page, use <https://security.microsoft.com/asr>

The following tabs are available on the **Attack surface reduction rules** report page:

- [Detections](#attack-surface-reduction-rules-main-detections-tab)
- [Configuration](#attack-surface-reduction-rules-main-configuration-tab)
- [Add exclusions](#attack-surface-reduction-rules-add-exclusions-tab)

<a name='attack-surface-reduction-rules-main-detections-tab'></a>

### Detections tab

The **Detections** tab is the default tab of the page. To go directly to the **Detections** tab of the **Attack surface reduction rules** report, use <https://security.microsoft.com/asr> or <https://security.microsoft.com/asr?viewid=detections>.

:::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-tab.png" alt-text="Screenshot showing the Attack surface reduction rules report page in the Microsoft Defender portal." lightbox="media/attack-surface-reduction-rules-report-main-detections-tab.png":::

By default, the information on the page is filtered:

- **Rules**: The value **Standard protection** is selected by default to show data for [standard protection rules](attack-surface-reduction-rules-overview.md#asr-rules) only, but you can change the value to **All** to show data for all ASR rules.

- **Date**: The date range of the last 30 days is selected by default, but you can change the **Start time** and **End time** values to a range within the last 30 days.
- **Select rules**: The value **Any** is selected by default, but you can change the value to one or more of the following values:
  - **Block persistence through WMI event subscription**
  - **Block credential stealing from the Windows local security authority subsystem (lsass.exe)**
  - **Block abuse of exploited vulnerable signed drivers**

You can use the following extra filters that aren't configured by default by selecting **Add filter**, and then selecting from the available options. After the filter is shown at the top of the tab, you can configure the selections for it:

- **Device group**: Select an available device group.
- **Blocked/Audited?**: Select **Audited** or **Blocked**.

Below the filters, the following information is shown:

- **Audit detections**: The number of threat detections by ASR rules in **Audit** mode during the specified time period.
- **Blocked Detections**: The number of threat detections by ASR rules in **Block** mode during the specified time period

  For more information about **Audit** mode and **Block** mode, see [Attack surface reduction rule modes](attack-surface-reduction-rules-overview.md#modes-for-asr-rules).

The graph shows audited and blocked detections per day over the specified date range. HHover a detection type in the graph to see specific information about that detection type for that day.

The details table below the graph contains the following information:

- **Detected file**: The file determined to contain a possible or known threat.
- **Detected on**: The date the threat was detected.
- **Blocked/Audited?**: Whether the detecting rule for the specific event was in Block or Audit mode.
- **Rule**: Which rule detected the threat.
- **Source app**: The application that made the call to the offending "detected file".
- **Device**: The name of the device on which the Audit or Block event occurred.
- **Device group**: The Active Directory group to which the device belongs.
- **User**: The machine account responsible for the call.
- **Publisher**: The company that released the particular .exe or application.

The **Search** box is available to search entries by device ID, file name, or process name.

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
>
> Currently, the number of individual _detected_ items listed in the details table is limited to 200 rules. Use **Export** to save the full list of detections to a CSV file.
>
> To view all ASR rules triggered in Defender for Endpoint Plan 2, use the [DeviceEvents table in advanced hunting](/defender-xdr/advanced-hunting-deviceevents-table).

<a name='actionable-flyout'></a>

#### Detected file details

When you select a detection event from the details table by clicking anywhere in the row other than the check box next to the **Detected file** value, a **File info** flyout opens with the following information:

- **Detected file**
- **Detections** section:
  - **Go hunt**: In Defender for Endpoint Plan 2, this action opens the advanced hunting query page with the detected filename specified in the query.

    :::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-flyout-hunting.png" alt-text="Screenshot showing the Advanced Hunting query that opens when you select Go hunt." lightbox="media/attack-surface-reduction-rules-report-main-detections-flyout-hunting.png":::

    For more information about Advanced hunting, see [Proactively hunt for threats with advanced hunting in Microsoft Defender XDR](/defender-xdr/advanced-hunting-overview).

  - **Open the file page**: Opens Microsoft Defender for Endpoint detection.
- **Possible exclusion and impact** section: Shows details about detections of the file by ASR rules over the last 30 days (the total number of detections and the percentage).

<!--- The **Add exclusion** button is linked with the add exclusion main page.--->

:::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-flyout.png" alt-text="Screenshot showing the File info details flyout after you select an entry from the details table on the Detections tab of the Attack surface reduction rules report." lightbox="media/attack-surface-reduction-rules-report-main-detections-flyout.png":::

<a name='attack-surface-reduction-rules-main-configuration-tab'></a>

### Configuration tab

To go directly to the **Configuration** tab of the **Attack surface reduction rules** report page, use <https://security.microsoft.com/asr?viewid=configuration>.

:::image type="content" source="media/attack-surface-reduction-rules-report-main-configuration-tab.png" alt-text="Screenshot showing the Configuration tab of the the Shows the ASR rules report main configuration tab" lightbox="media/attack-surface-reduction-rules-report-main-configuration-tab.png":::

The **Configuration** tab provides summary and per-device ASR rule configuration details.

**Rules** allows you to filter the results on the page. By default, **Standard protection** is selected to show data for [standard protection rules](attack-surface-reduction-rules-overview.md#asr-rules) only, but you can switch to **All** to show data for all ASR rules.

The **Device configuration overview** section shows a current snapshot of device states related to ASR rules:

- **Devices with rules not configured**
- **Devices with rules in audit mode**
- **Devices with rules in block mode**
- **All exposed devices**: The total number of devices in the previous states.

The details table shows the following information for each affected device:

- **Device**: The name of the device.
- **Overall configuration**: Valid values are:
  - ???
  - **Rules in bock mode**
  - **Rules off**: No ASR rules are enabled on the device
- **Rules in block mode**: The number of rules on the device in **Block** mode.
- **Rules in audit mode**: The number of rules on the device in **Audit** mode.
- **Rules in warn mode**: The number of rules on the device in **Warn** mode.

  For more information about the different ASR rule modes, see [ASR rule modes](attack-surface-reduction-rules-overview.md#modes-for-asr-rules).

- **Rules turned off**: The number of ASR rules that aren't enabled on the device.
- **Rules not applicable**: ???
- **Unknown**: ???
- **Device ID**: The GUID value of the device in Microsoft Defender for Endpoint.

  Use the **Search** box to find a specific device in the details table by **Device** or **Device ID** value. Partial matches are supported.

#### Device details

When you select a device from the details table by clicking anywhere in the row other than the check box next to the **Device** value, a device details flyout opens with the following information:

- All available ASR rules are shown in the **Rule** column. The **Status** column value shows the status of the ASR rule on the device:
  - **Off\Unknown**
  - **Audit**
  - **Block**
  - **Warn**

- Select **Add to policy** at the bottom of the flyout to ???.

To enable ASR rules:

1. Under **Device**, select the device or devices for which you want to apply ASR rules.

1. In the flyout window, verify your selections and then select **Add to policy**. The **Configuration** tab and **add rule** flyout are shown in the following image.

   :::image type="content" source="media/attack-surface-reduction-rules-report-configuration-add-to-policy.png" alt-text="Shows the ASR rules fly-out to add ASR rules to devices" lightbox="media/attack-surface-reduction-rules-report-configuration-add-to-policy.png":::

  > [NOTE!]
  > If you have devices that require that different ASR rules be applied, you should configure those devices individually.

<a name='attack-surface-reduction-rules-add-exclusions-tab'></a>

### Add exclusions tab

To go directly to the **Add exclusions** tab of the **Attack surface reduction rules** report page, use <https://security.microsoft.com/asr?viewid=exclusions>.

The **Add exclusions** tab lists detections by ASR rules across all devices.

**Rules** allows you to filter the results on the page. By default, **Standard protection** is selected to show data for [standard protection rules](attack-surface-reduction-rules-overview.md#asr-rules) only, but you can switch to **All** to show data for all ASR rules.

The details table shows the following information:

- **File name**: The name of the file that triggered the ASR rule event.
- **Detections**: The total number of detected events for the file. Individual devices can trigger multiple ASR rule events.
- **Devices**: The number of devices where the detection occurred.

:::image type="content" source="media/attack-surface-reduction-rules-report-exclusion-tab.png" alt-text="Screenshot of the Add exclusions tab of the Attack surface reduction rules report page in the Microsoft Defender portal." lightbox="media/attack-surface-reduction-rules-report-exclusion-tab.png":::

> [!IMPORTANT]
> Excluding files or folders can severely reduce the protection provided by ASR rules. Excluded files are allowed to run, and no report or event is recorded.
> If ASR rules are detecting files that you believe shouldn't be detected, you should [use audit mode first to test the rule](attack-surface-reduction-rules-deployment-test.md#step-1-test-attack-surface-reduction-rules-using-audit).

When you select a file, a **Summary & expected impact** fly out opens, presenting the following types of information:

- **Files selected** - The number of files you've selected for exclusion
- **(_number of_) detections** - States the expected reduction in detections after adding the selected exclusions. The reduction in detections is represented graphically for **Actual detections** and **Detections after exclusions**.
- **(_number of_) affected devices** - States the expected reduction in devices that report detections for the selected exclusions.

The Add exclusion page has two buttons for actions that can be used on any detected files (after selection). You can:

- **Add exclusion** which opens Microsoft Intune ASR policy page. For more information, see [Configure ASR rules in Microsoft Intune](attack-surface-reduction-rules-configure.md#configure-asr-rules-in-microsoft-intune) in "Enable ASR rules alternate configuration methods."
- **Get exclusion paths** which downloads file paths in a csv format.

  :::image type="content" source="media/attack-surface-reduction-rules-report-main-add-exclusions-flyout.png" alt-text="Shows the ASR rules report add exclusions tab flyout impact summary." lightbox="media/attack-surface-reduction-rules-report-main-add-exclusions-flyout.png":::

The **Search** box is available to search entries by device ID, file name, or process name.

Select **Filter** to filter rules by **Standard protection** or **All**.

## See also

- [Attack surface reduction (ASR) rules deployment guide](attack-surface-reduction-rules-deployment.md)
- [Plan your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-plan.md)
- [Test your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-test.md)
- [Enable attack surface reduction (ASR) rules](attack-surface-reduction-rules-deployment-implement.md)
- [Manage and monitor your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-operationalize.md)
- [Attack surface reduction (ASR) rules report](attack-surface-reduction-rules-report.md)
- [Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md)
