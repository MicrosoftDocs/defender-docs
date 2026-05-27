---
title: ASR rules report
description: View ASR rule detections, device configuration status, and exclusion management in the Attack surface reduction rules report in the Microsoft Defender portal.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
audience: ITPro
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar
ms.custom: asr, msecd-doc-authoring-1012
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-asr
ms.date: 05/04/2026
search.appverid: met150
ai-usage: ai-assisted
#customer intent: As an IT admin, I want to understand the ASR rules report so I can monitor detections, review device configuration, and manage exclusions.
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

For more information about ASR rules, see [Attack surface reduction (ASR) rules overview](attack-surface-reduction-rules-overview.md).

## Prerequisites

### Supported operating systems

- Windows

  To appear in the report, Windows Server 2012 R2 and Windows Server 2016 devices must be onboarded using the modern unified solution package. For more information, see [New functionality in the modern unified solution for Windows Server 2012 R2 and 2016](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2).

### Report access permissions

You need to be assigned permissions before you can do the procedures in this article. You have the following options:

- [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac): **Security operations \ Security data \ Security data basics (read)**.
- [Defender for Endpoint permissions](user-roles.md) (available in organizations created before February 2025): **View data** \> **Security operations**.
- [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup>, **Security Administrator**, **Global Reader**, or **Security Reader** roles gives users the required permissions _and_ permissions for other features in Microsoft 365.

  > [!IMPORTANT]
  > Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

<a name='navigate-to-the-attack-surface-reduction-rules-report'></a>

<a name='attack-surface-reduction-rules-main-tabs'></a>

## The Attack surface reduction rules report page

In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Reports** \> **Endpoints** tab \> **Attack surface reduction rules**. Or, to go directly to the **Attack surface reduction rules** report page, use <https://security.microsoft.com/asr>.

The following tabs are available on the **Attack surface reduction rules** report page:

- [Detections](#attack-surface-reduction-rules-main-detections-tab)
- [Configuration](#attack-surface-reduction-rules-main-configuration-tab)
- [Add exclusions](#attack-surface-reduction-rules-add-exclusions-tab)

<a name='attack-surface-reduction-rules-main-detections-tab'></a>

### Detections tab

The **Detections** tab is the default tab of the page. To go directly to the **Detections** tab of the **Attack surface reduction rules** report, use <https://security.microsoft.com/asr> or <https://security.microsoft.com/asr?viewid=detections>.

:::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-tab.png" alt-text="Screenshot showing the Attack surface reduction rules report page in the Microsoft Defender portal." lightbox="media/attack-surface-reduction-rules-report-main-detections-tab.png":::

By default, the ASR rule information on the page uses the following filters:

- **Rules**: The value **Standard protection** is selected by default to show data for [standard protection rules](attack-surface-reduction-rules-overview.md#asr-rules) only, but you can change the value to **All** to show data for all ASR rules.

- **Date**: The date range of the last 30 days is selected by default, but you can change the **Start time** and **End time** values to a range within the last 30 days.

- **Select rules**<sup>\*</sup>: The value **Any** is selected by default, but you can change the value based on the **Rules** filter value:
  - **Standard protection**: Select one or more standard protection rules in the drop down list.
  - **All**: Select one or more ASR rules (including standard protection rules) in the drop down list.

You can use the following extra filters that aren't configured by default by selecting **Add filter**, and then selecting from the available options. After the filter is shown at the top of the tab, you can configure the selections for it:

- **Device group**<sup>\*</sup>: Select one or more available device groups.
- **Blocked/Audited?**: Select **Audited** or **Blocked**.

<sup>\*</sup> Selecting all available values or no values for this filter shows the same results.

To remove a filter, select :::image type="icon" source="media/defender-portal-icon-remove-selection.png" border="false"::: **Clear**. To reset all filters, select :::image type="icon" source="media/defender-portal-icon-clear-filters.png" border="false"::: **Reset all**.

Below the filters and above the graph, the following information is shown:

- **Audit detections**: The number of threat detections by ASR rules in **Audit** mode using the specified filters.
- **Blocked Detections**: The number of threat detections by ASR rules in **Block** mode using the specified filters.

  For more information about **Audit** mode and **Block** mode, see [ASR rule modes](attack-surface-reduction-rules-overview.md#modes-for-asr-rules).

The graph shows audited and blocked detections per day over the selected date range. Hover the data for a specific day to see the **Audit** or **Block** counts based on the current filters.

The details table below the graph contains the following information:

- **Detected file**: The file determined to contain a possible or known threat.
- **Detected on**: The date the threat was detected.
- **Blocked/Audited?**: Whether the detecting rule for the specific event was in **Block** or **Audit** mode.
- **Rule**: The rule that detected the threat.
- **Source app**: The application that made the call to the **Detected file**.
- **Device**: The name of the device where the **Audit** or **Block** event occurred.
- **Device group**: The device group the device belongs to.
- **User**: The account responsible for the **Source app** opening the **Detected file** (for example, `SYSTEM` for the NT AUTHORITY\SYSTEM account).
- **Publisher**: The company that published the app.

Select a column header to sort by that value.

The :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box is available to search entries in the details table by device ID, file name, or process name.

:::image type="icon" source="media/defender-portal-icon-group.png" border="false"::: **GroupBy** is available to group the information in the details table with the following options:

- **No grouping** (default)
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

When you select a detection event from the details table on the **Detections** tab of the **Attack surface reduction rules** report page by clicking anywhere in the row other than the check box next to the **Detected file** value, a **File info** details flyout opens with the following information:

- **Detections** section:

  This section shows a smaller version of the graph on the main page filtered by ASR rule detection for the file.

  The following actions are available in this section:

  - **Go hunt**: In Defender for Endpoint Plan 2, this action opens the advanced hunting query page with the detected filename specified in the query. For example, for the file `conhost.exe`, the query looks like this:

    ```kql
    DeviceEvents
        | where Timestamp >= ago(1d)
        | where FileName == 'conhost.exe'
        | where ActionType startswith 'Asr'
        | extend ParsedFields=parse_json(AdditionalFields)
        | distinct ActionType, Audit=tostring(ParsedFields.IsAudit), InitiatingProcessParentFileName, InitiatingProcessFolderPath, InitiatingProcessFileName, InitiatingProcessCommandLine, FolderPath, FileName, ProcessCommandLine, ASRRuleId=tostring(ParsedFields.RuleId)
        | take 1000
    ```

    For more information about Advanced hunting, see [Proactively hunt for threats with advanced hunting in Microsoft Defender XDR](/defender-xdr/advanced-hunting-overview).

  - **Open the file page**: Opens the file in the [file entity page](investigate-files.md) for the detected file in Defender for Endpoint.

- **Possible exclusion and impact** section: Shows details about detections of the file by ASR rules over the last 30 days (the total number of detections and the percentage).

- **Add exclusions** at the bottom of the flyout opens the Microsoft Intune admin center. For more information about configuring exclusions for ASR rules, see [Configure attack surface reduction (ASR) rules and exclusions](attack-surface-reduction-rules-configure.md).

<!--- The **Add exclusion** button is linked with the add exclusion main page.--->

:::image type="content" source="media/attack-surface-reduction-rules-report-main-detections-flyout.png" alt-text="Screenshot showing the File info details flyout after you select an entry from the details table on the Detections tab of the Attack surface reduction rules report." lightbox="media/attack-surface-reduction-rules-report-main-detections-flyout.png":::

<a name='attack-surface-reduction-rules-main-configuration-tab'></a>

### Configuration tab

To go directly to the **Configuration** tab of the **Attack surface reduction rules** report page, use <https://security.microsoft.com/asr?viewid=configuration>.

:::image type="content" source="media/attack-surface-reduction-rules-report-main-configuration-tab.png" alt-text="Screenshot of the Configuration tab of the Attack surface reduction rules report page in the Microsoft Defender portal." lightbox="media/attack-surface-reduction-rules-report-main-configuration-tab.png":::

The **Configuration** tab provides summary and per-device ASR rule configuration details.

**Rules** allows you to filter the results in the **Device configuration overview** section. By default, **Standard protection** is selected to show data for [standard protection rules](attack-surface-reduction-rules-overview.md#asr-rules) only, but you can switch to **All** to show data for all ASR rules.

The **Device configuration overview** section shows totals for ASR rule states based on the **Standard protection** or **All** filter:

- **All exposed devices**: The number of devices with unconfigured ASR rules.
- The number of **Devices with rules not configured**
- The number of **Devices with rules in audit mode**
- The number of **Devices with rules in block mode**

The details table shows the following information for each affected device:

- **Device**: The name of the device.
- **Overall configuration**: Summarizes the condition of all ASR rules on the device. For example:
  - **Rules in block mode**: Some rules on the device are in **Block** mode.
  - **Rules off**: Some rules on the device are turned off.
- **Rules in block mode**
- **Rules in audit mode**
- **Rules in warn mode**

  For more information about the different ASR rule modes, see [ASR rule modes](attack-surface-reduction-rules-overview.md#modes-for-asr-rules).

- **Rules turned off**
- **Rules not applicable**: For example, the [Block Webshell creation for Servers](attack-surface-reduction-rules-reference.md#block-webshell-creation-for-servers) rule on client workstations.
- **Unknown**
- **Device ID**: The unique SHA-1 hash value identifier for the device in Microsoft Defender for Endpoint. For more information, see [Machine resource type](api/machine.md).

Select a column header to sort by that value.

Use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find a specific device in the details table by **Device** or **Device ID** value. Partial matches are supported.

#### Device details

When you select a device entry from the details table on the **Configuration** tab of the **Attack surface reduction rules** report page by clicking anywhere in the row, a device details flyout opens with the following information:

- A list of all available ASR rules and their states on the device:

- **Off**
- **Audit**
- **Block**
- **Warn**
- **Not applicable**

- **Add to policy** at the bottom of the flyout opens the Microsoft Intune admin center. For more information about the different ways to configure ASR rules, see [Deployment and configuration methods for ASR rules](attack-surface-reduction-rules-overview.md#deployment-and-configuration-methods-for-asr-rules).

:::image type="content" source="media/attack-surface-reduction-rules-report-configuration-flyout.png" alt-text="Screenshot of the devices details flyout for a device from the Configuration tab of the Attack surface reduction rules report page." lightbox="media/attack-surface-reduction-rules-report-configuration-flyout.png":::

<a name='attack-surface-reduction-rules-add-exclusions-tab'></a>

### Add exclusions tab

> [!IMPORTANT]
> Excluding files or folders can severely reduce the protection provided by ASR rules. Excluded files are allowed to run, and no report or event is recorded.
>
> If ASR rules are detecting files that you believe shouldn't be detected, you should switch the rule to [**Audit** mode](attack-surface-reduction-rules-overview.md#modes-for-asr-rules) for investigation.

To go directly to the **Add exclusions** tab of the **Attack surface reduction rules** report page, use <https://security.microsoft.com/asr?viewid=exclusions>.

:::image type="content" source="media/attack-surface-reduction-rules-report-exclusion-tab.png" alt-text="Screenshot of the Add exclusions tab of the Attack surface reduction rules report page in the Microsoft Defender portal." lightbox="media/attack-surface-reduction-rules-report-exclusion-tab.png":::

The **Add exclusions** tab lists file detections by ASR rules across all devices.

**Filter \> Rules** or :::image type="icon" source="media/defender-portal-icon-clear-filters.png" border="false"::: **Filter** allows you to filter the results on the page. By default, **Standard protection** is selected to show data for [standard protection rules](attack-surface-reduction-rules-overview.md#asr-rules) only, but you can switch to **All** to show data for all ASR rules.

The details table shows the following information:

- **File name**: The name of the file that triggered the ASR rule event.
- **Detections**: The total number of detected events for the file. Individual devices can trigger multiple ASR rule events.
- **Devices**: The number of devices where the detection occurred.

Select a column header to sort by that value.

Use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find entries by filename.

#### Summary & expected impact pane

When you select one or more file entries from the details table on the **Add exclusions** tab of the **Attack surface reduction rules** report by selecting the check boxes next to the **File name** column, the **Summary & expected impact** pane fills with information and actions for the selected files:

- **Summary** section: The number of files you selected.

- **\<n\> detections** section: What will happen to ASR rule detections for the selected files if you exclude them from ASR rules:
  - How many rule detections will be excluded (**\<n\> detections less after exclusions**)
  - A graph that shows the number of **Actual detections** and **Detections after exclusions**.

- **\<n\> affected devices section**: What will happen to ASR rule detections on devices if you exclude the selected files from ASR rules:
  - **\<n\> affected devices**: How many devices will be affected (**\<n\> devices less after exclusions**)
  - A graph that shows the number of devices that **Continue to have detections** and **No longer have detections**.

- The following actions are available at the bottom of the **Summary & expected impact** pane:
  - **Add exclusions**: Opens the Microsoft Intune admin center. For more information about the different ways to exclude files and folders from ASR rules, see [File and folder exclusions for ASR rules](attack-surface-reduction-rules-overview.md#file-and-folder-exclusions-for-asr-rules).

  - **Get selected exclusion paths**: Generates an `AsrExclusionPaths.csv` file with the complete paths to the affected files for download.

:::image type="content" source="media/attack-surface-reduction-rules-report-main-add-exclusions-tab.png" alt-text="Screenshot showing the Add exclusions tab of the Attack surface reduction rules report page with file entries selected." lightbox="media/attack-surface-reduction-rules-report-main-add-exclusions-tab.png":::

## Related content

- [Attack surface reduction (ASR) rules deployment guide](attack-surface-reduction-rules-deployment.md)
- [Plan your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-plan.md)
- [Test your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-test.md)
- [Enable attack surface reduction (ASR) rules](attack-surface-reduction-rules-deployment-implement.md)
- [Manage and monitor your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-operationalize.md)
- [Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md)
