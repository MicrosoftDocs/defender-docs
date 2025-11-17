---
title: Custom data collection in Microsoft Defender for Endpoint
description: Custom data collection allows organizations to tailor telemetry collection to their specific threat hunting needs with customizable filters and enhanced visibility.
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
ms.topic: concept-article
search.appverid: 
  - MOE150
  - MET150
ms.date: 11/12/2025
appliesto:
  - Microsoft Defender for Endpoint
---

# Custom data collection in Microsoft Defender for Endpoint (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Custom data collection (Preview) enables organizations to expand and customize telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs. This feature allows security teams to define specific collection rules with tailored filters for event properties such as folder paths, process names, and network connections.

This article provides an overview of custom data collection so that you can understand the feature's capabilities and how it enhances your security visibility and threat hunting operations.

## How custom data collection works

Custom data collection uses rule-based filtering to capture specific events from endpoint devices and route them to your Microsoft Sentinel workspace for analysis and threat hunting.

Custom collection rules allow you to define the specific events you want to capture and the conditions under which they should be collected.

To create custom data collection rules, see [Create custom data collection rules](create-custom-data-collection-rules.md).

## Supported event tables

Custom data collection supports three event tables. Each event table uses the same schema as the default event table.

- **DeviceCustomFileEvents**: Stores data on file creation, modification, deletion, and access activities. For the list of columns, review the [DeviceFileEvents](/defender-xdr/advanced-hunting-devicefileevents-table) table reference.
- **DeviceCustomNetworkEvents**: Stores data on network connection events, including IP addresses, ports, and protocols. For the list of columns, review the [DeviceNetworkEvents](/defender-xdr/advanced-hunting-devicenetworkevents-table) table reference.
- **DeviceCustomScriptEvents**: Stores data on script execution activities through Antimalware Scan Interface (AMSI). For the list of columns, review the [DeviceEvents](/defender-xdr/advanced-hunting-deviceevents-table) table reference.

## Data flow and integration

This is the typical data flow for custom data collection:

1. Define collection rules in the Microsoft Defender portal with specific filters and device targets.
2. Rules are transmitted to targeted endpoints, typically within 20 minutes to one hour.
3. Endpoints collect events matching your rule criteria alongside default telemetry.
4. Custom event data flows to your connected Microsoft Sentinel workspace.
5. Query custom data using the supported event tables to learn about specific activities on your endpoints.

## Example scenarios

This section describes some example scenarios where custom data collection can enhance your threat hunting capabilities. For specific queries in advanced hunting, see [Analyze event data](create-custom-data-collection-rules.md#analyze-event-data).

### Enhanced file monitoring

Create targeted collection rules to monitor specific file types or locations:
- Monitor document files (*.docx, *.pdf) in sensitive directories
- Track executable files in temporary folders
- Collect file access events for compliance auditing

### Network activity analysis

Focus on specific network patterns relevant to your threat landscape:
- Monitor connections to specific IP ranges or domains
- Track unusual port usage or protocol patterns
- Collect data for network-based threat hunting

### Script execution visibility

Expand visibility into script-based attacks:
- Monitor PowerShell execution with specific parameters
- Track script files from untrusted locations
- Collect AMSI events for malicious script detection

## Frequently asked questions

### Does custom data collection affect the default Defender for Endpoint configuration?

No, custom data collection rules live side-by-side with the Defender for Endpoint out-of-the-box configuration.

### Is a Microsoft Sentinel workspace required?

Yes, you need a connected Microsoft Sentinel workspace to create custom data collection rules. For more information, see the [prerequisites](create-custom-data-collection-rules.md#prerequisites).

### How can I know if a rule has reached the endpoint?

You can query for events collected by the relevant rule, for the specific endpoint. For example, the following query returns all effective rules on the endpoint (now and in the past), counting the rules' collected events.

```kusto
search in (DeviceCustomFileEvents, DeviceCustomScriptEvents, DeviceCustomNetworkEvents) "your_device_id"
| where DeviceId == "your_device_id"
| summarize count() by RuleName, RuleLastModificationTime, $table
```

### Does custom data collection incur additional costs?

Custom Data Collection is provided to you as part of MDE P2 license free of charge. You are billed for the ingestion of data into your Microsoft Sentinel workspaces in accordance with your deal with Sentinel. The extra cost is based on the volume of data ingested.

### What client versions and operating systems are currently supported?

See [supported operating systems](create-custom-data-collection-rules.md#supported-operating-systems). To query your client version, in [advanced hunting](/defender-xdr/advanced-hunting-overview), use the **ClientVersion** column in the **DeviceInfo** table.

### Are manual (static) tags supported?

No, we currently only support dynamic tags. However, you can create dynamic tags out of manual tags in **Settings > Microsoft Defender XDR > Asset rule management**. For more information, see [Configure dynamic rules for devices in asset rule management](/defender-xdr/configure-asset-rules).

### How can I collect all events for a specific event type?

You can currently generate a broad rule, like: `FolderPath Not equals "veryrarestringwhichisnotexpected"`.

## Next steps

- Learn how to [create and manage custom data collection rules](create-custom-data-collection-rules.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]