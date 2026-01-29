---
title: Create and manage custom data collection rules in Microsoft Defender for Endpoint
description: Learn how to create and manage custom data collection rules in Microsoft Defender for Endpoint to enhance your threat hunting capabilities.
ms.service: defender-endpoint
f1.keywords: 
  - NOCSH
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
  - usx-security
ms.topic: how-to
search.appverid: 
  - MOE150
  - MET150
ms.date: 11/12/2025
appliesto:
  - Microsoft Defender for Endpoint
---

# Create and manage custom data collection rules in Microsoft Defender for Endpoint (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

This article shows you how to create and manage custom data collection rules in the Microsoft Defender portal.

> [!TIP]
> Before creating custom collection rules, review [Custom data collection](custom-data-collection.md) to understand when and why to use this feature.

## Prerequisites

Ensure you have:

- **Microsoft Defender for Endpoint Plan 2** license
- **Connected Microsoft Sentinel workspace** (required for custom data storage)
- **Dynamic tags** configured in [Asset Rule Management](/defender-xdr/configure-asset-rules) and run at least once
- **Supported operating systems**:
  - Windows 10 and 11 (minimum client version 10.8805; Windows 10 requires ESU enrollment)
  - Windows Server 2019 and later

> [!IMPORTANT]
> Even if you have a connected Microsoft Sentinel workspace, you must select the workspace when creating custom data collection rules.

### Performance and limits

- Each rule can capture up to **25,000 events per device per 24-hour rolling window**
- When a device reaches the threshold, telemetry for that rule stops until the window resets
- Rule deployment typically takes 20 minutes to 1 hour
- Custom collection operates alongside default configuration without interference

### Data costs

- Custom data collection is included with Microsoft Defender for Endpoint P2
- **Data ingestion into Microsoft Sentinel incurs charges** based on your Sentinel billing
- Target collection to specific device groups to control costs

## Common use cases and examples

Before creating rules, consider these common scenarios:

### Use case 1: Monitor critical application folder

**Scenario**: Track all file activity in a folder containing sensitive financial data

**Rule configuration**:
- **Table**: DeviceCustomFileEvents
- **Action**: FileCreated, FileModified, FileDeleted
- **Condition**: FolderPath contains "\\\\FinanceApp\\\\Data\\\\"
- **Target**: Dynamic tag "Finance-Servers"

**Security value**: Detect unauthorized access, data exfiltration attempts, or ransomware activity targeting sensitive data.

### Use case 2: Detect lateral movement

**Scenario**: Monitor remote connections to domain controllers for lateral movement indicators

**Rule configuration**:
- **Table**: DeviceCustomNetworkEvents
- **Action**: ConnectionSuccess
- **Condition**: RemotePort equals "445" OR RemotePort equals "3389"
- **Target**: Dynamic tag "Domain-Controllers"

**Security value**: Identify suspicious authentication attempts and remote desktop connections that may indicate lateral movement.

### Use case 3: Track PowerShell execution on admin workstations

**Scenario**: Collect all PowerShell script executions for security analysis

**Rule configuration**:
- **Table**: DeviceCustomScriptEvents
- **Action**: ScriptRun
- **Condition**: FileName equals "powershell.exe"
- **Target**: Dynamic tag "Admin-Workstations"

**Security value**: Detect fileless malware, malicious scripts, or unauthorized automation on privileged systems.

### Use case 4: Monitor DLL injection

**Scenario**: Track suspicious DLL loads into critical processes

**Rule configuration**:
- **Table**: DeviceCustomImageLoadEvents
- **Action**: ImageLoad
- **Condition**: InitiatingProcessFileName equals "lsass.exe" OR InitiatingProcessFileName equals "explorer.exe"
- **Target**: Dynamic tag "Sensitive-Workstations"

**Security value**: Identify code injection techniques used by malware or attackers for privilege escalation or persistence.

## Security considerations

Before creating rules, understand these security implications:

### Rule scope impact

- **Overly broad rules** generate large data volumes, increasing costs and making analysis difficult
- **Too narrow rules** may miss important security events
- **Balance specificity** with coverage by iterating and refining rules based on initial results

### Performance considerations

- Each device has a 25,000 event per rule per day limit
- Reaching the limit early stops collection for up to 24 hours
- Target rules carefully to devices where monitoring is essential
- Use multiple focused rules rather than one overly broad rule

### Testing strategy

1. Start with a small pilot group (5-10 devices) using a specific dynamic tag
2. Monitor data volume and event quality for 24-48 hours
3. Refine conditions based on initial results
4. Gradually expand to larger device groups
5. Review cost and performance metrics regularly

### Create rules

1. In the Microsoft Defender portal, navigate to **Settings** > **Endpoints** > **Rules** > **Custom Data Collection**.

1. To onboard your Microsoft Sentinel workspace, on the top right, select the Microsoft Sentinel workspace name.

    :::image type="content" source="media/create-custom-data-collection-rules/select-workspace.png" alt-text="Screenshot of selecting a Microsoft Sentinel workspace." lightbox="media/create-custom-data-collection-rules/select-workspace.png":::

1. In the **Workspace scope** page, select your workspace.

    :::image type="content" source="media/create-custom-data-collection-rules/select-workspace-scope.png" alt-text="Screenshot of selecting a Microsoft Sentinel workspace scope.":::

    > [!NOTE]
    > You need to select the workspace at this stage, even if you already have a connected Microsoft Sentinel workspace.

1. Select **Create rule**. In the **General Information** section, type a rule name and description, and select **Next**.

    :::image type="content" source="media/create-custom-data-collection-rules/create-custom-data-collection-rule-general.png" alt-text="Screenshot of creating a rule: General Information page." lightbox="media/create-custom-data-collection-rules/create-custom-data-collection-rule-general.png":::

1. In the **Create rule** section:

    1. Select which table you want to collect data from. For more information, see [Supported event tables](custom-data-collection.md#supported-event-tables).
    1. Select the action for which you want to collect data.
    1. Add rule conditions to filter the data even further. You can add multiple conditions to refine the data collection. Rule conditions are based on the selected table. For more information, see the respective table link under [Supported event tables](custom-data-collection.md#supported-event-tables).

    :::image type="content" source="media/create-custom-data-collection-rules/create-custom-data-collection-rule.png" alt-text="Screenshot of creating a rule: Create rule page." lightbox="media/create-custom-data-collection-rules/create-custom-data-collection-rule.png":::
   
1. Select **Next**.

1. In the **Define rule scope** section, select whether you want to collect data from all applicable client devices or from specific devices that include dynamic tags. For more information, see [Create dynamic rules for devices in asset rule management](/defender-xdr/configure-asset-rules).

    :::image type="content" source="media/create-custom-data-collection-rules/create-custom-data-collection-rule-define-scope.png" alt-text="Screenshot of creating a rule: Define scope page." lightbox="media/create-custom-data-collection-rules/create-custom-data-collection-rule-define-scope.png":::

    > [!NOTE]
    > Custom data collection only supports dynamic tags.

1. In the **Review and finish** section, review your rule settings, and select **Submit**.

    :::image type="content" source="media/create-custom-data-collection-rules/create-custom-data-collection-rule-review.png" alt-text="Screenshot of creating a rule: Review and finish page." lightbox="media/create-custom-data-collection-rules/create-custom-data-collection-rule-review.png":::

It can take up to an hour for the rule to be deployed to the targeted devices.

## Monitor and troubleshoot

### Verify rule deployment

To check if a rule is collecting data from a specific device, query the custom event tables:

```kusto
search in (DeviceCustomFileEvents, DeviceCustomScriptEvents, DeviceCustomNetworkEvents, DeviceCustomProcessEvents, DeviceCustomImageLoadEvents) "your_device_id"
| where DeviceId == "your_device_id"
| summarize EventCount = count() by RuleName, RuleLastModificationTime, $table
| order by RuleLastModificationTime desc
```

### Common issues and solutions

| Issue | Possible cause | Solution |
|-------|---------------|----------|
| No events collected | Rule not yet deployed | Wait up to 1 hour for deployment; check rule status |
| No events collected | Device not targeted correctly | Verify dynamic tag is applied to device and tag rule has run |
| Events stopped collecting | 25,000 event limit reached | Review rule conditions to make them more specific; wait for 24-hour window to reset |
| Unexpected devices collecting data | Dynamic tag applied broadly | Review tag rules in Asset Rule Management; refine targeting |
| Rule not visible on device | Device doesn't meet OS requirements | Check client version and OS version meet minimum requirements |

### Monitoring considerations

- **EDR exclusions** may prevent custom collection on excluded paths or processes
- **Dynamic tags update approximately every hour**—check **Last run time** in Asset Rule Management
- **Device reboots** may be required if custom collection isn't initializing after feature enablement

### Collect all events for a table

To collect all events from a specific table (for testing or comprehensive monitoring):

1. Create a rule with the desired table
2. Select all available actions
3. Add a condition that's always true, such as:
   - For network events: `RemotePort not equals 0`
   - For file events: `FileName not equals ""`
   - For process events: `ProcessCommandLine not equals ""`
4. Target to a small pilot group first due to high data volume

> [!WARNING]
> Collecting all events generates very large data volumes and can quickly reach the 25,000 event per device limit. Use comprehensive collection only for testing or specific investigative purposes on a small number of devices.

## Manage rules

### Edit a rule

1. Navigate to **Settings** > **Endpoints** > **Rules** > **Custom Collection**
2. Select the rule you want to edit
3. Select **Edit**
4. Modify rule settings as needed
5. Select **Submit**

Changes take effect on targeted devices within 20 minutes to 1 hour.

### Disable or enable a rule

1. In **Custom Collection**, select the rule
2. Select or clear the **Enable** checkbox under the rule description

When you disable a rule, data collection stops on all targeted devices immediately (within the next agent check-in).

### Delete a rule

1. In **Custom Collection**, select the rule
2. Select **Delete**
3. Confirm deletion

> [!IMPORTANT]
> Deleting a rule is permanent and cannot be undone. Historical data in Microsoft Sentinel remains available, but new collection stops immediately.

## Next steps

- **[Custom data collection overview](custom-data-collection.md)**: Review capabilities and when to use custom collection
- **[Targeting devices](targeting-devices.md)**: Learn how tags enable device targeting at scale
- **[Create and manage device tags](machine-tags.md)**: Configure dynamic tags for custom collection rules
- **[Advanced hunting](/defender-xdr/advanced-hunting-overview)**: Query custom event tables in Microsoft Sentinel

## See also

- [Configure asset rules](/defender-xdr/configure-asset-rules)
- [Microsoft Sentinel workspace connection](/azure/sentinel/quickstart-onboard)
- [Advanced hunting schema tables](/defender-xdr/advanced-hunting-schema-tables)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]