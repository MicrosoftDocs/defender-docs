---
title: Custom data collection in Microsoft Defender for Endpoint
description: Custom data collection allows organizations to tailor telemetry collection to their specific threat hunting needs with customizable filters and enhanced visibility.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.collection: 
  - m365-security
  - tier1
  - usx-security
ms.topic: concept-article
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

:::image type="content" source="media/custom-data-collection/custom-data-collection-main-view.png" alt-text="Screenshot of the main Custom Data Collection page." lightbox="media/custom-data-collection/custom-data-collection-main-view.png":::

Custom collection rules allow you to define the specific events you want to capture and the conditions under which they should be collected.

To create custom data collection rules, see [Create custom data collection rules](create-custom-data-collection-rules.md).

## Supported event tables

Custom data collection supports the following event tables.

| Table name | Description | Learn more |
|------------|-------------|------------|
| **DeviceCustomProcessEvents** | Stores data on process creation, termination, and other process-related activities. | [In-portal schema reference](/defender-xdr/advanced-hunting-schema-tables?#get-schema-information-in-the-security-center) or [DeviceProcessEvents](/defender-xdr/advanced-hunting-deviceprocessevents-table) table reference |
| **DeviceCustomImageLoadEvents** | Stores data on image loading events, including details about the loaded images and their origins. | [In-portal schema reference](/defender-xdr/advanced-hunting-schema-tables?#get-schema-information-in-the-security-center) or [DeviceImageLoadEvents](/defender-xdr/advanced-hunting-deviceimageloadevents-table) table reference |
| **DeviceCustomFileEvents** | Stores data on file creation, modification, deletion, and access activities. | [In-portal schema reference](/defender-xdr/advanced-hunting-schema-tables?#get-schema-information-in-the-security-center) or [DeviceFileEvents](/defender-xdr/advanced-hunting-devicefileevents-table) table reference |
| **DeviceCustomNetworkEvents** | Stores data on network connection events, including IP addresses, ports, and protocols. | [In-portal schema reference](/defender-xdr/advanced-hunting-schema-tables?#get-schema-information-in-the-security-center) or [DeviceNetworkEvents](/defender-xdr/advanced-hunting-devicenetworkevents-table) table reference |
| **DeviceCustomScriptEvents** | Stores data on script execution and process details related to any explicit customer request for collection. This table is a new addition and does not have a reference in the default event tables. | [In-portal schema reference](/defender-xdr/advanced-hunting-schema-tables?#get-schema-information-in-the-security-center) |

## Data flow and integration

This is the typical data flow for custom data collection:

1. Define collection rules in the Microsoft Defender portal with specific filters and device targets.
1. Rules are transmitted to targeted endpoints, typically within 20 minutes to one hour.
1. Endpoints collect events matching your rule criteria alongside default telemetry.
1. Custom event data flows to your connected Microsoft Sentinel workspace.
1. Query custom data using the supported event tables to learn about specific activities on your endpoints.

## Frequently asked questions

### Does custom data collection affect the default Defender for Endpoint configuration?

No, custom data collection rules live side-by-side with the Defender for Endpoint out-of-the-box configuration.

### Is a Microsoft Sentinel workspace required?

Yes, you need a connected Microsoft Sentinel workspace to create custom data collection rules. For more information, see the [prerequisites](create-custom-data-collection-rules.md#prerequisites).

You also need to select the Microsoft Sentinel workspace when creating a custom data collection rule. For more information, see [Create rules](create-custom-data-collection-rules.md#create-rules).

### How can I know if a rule has reached the endpoint?

You can query for events collected by the relevant rule, for the specific endpoint. For example, the following query returns all effective rules on the endpoint (now and in the past), counting the rules' collected events.

```kusto
search in (DeviceCustomFileEvents, DeviceCustomScriptEvents, DeviceCustomNetworkEvents) "your_device_id"
| where DeviceId == "your_device_id"
| summarize count() by RuleName, RuleLastModificationTime, $table
```

### Does custom data collection incur additional costs?

See [data costs](create-custom-data-collection-rules.md#data-costs).

### What client versions and operating systems are currently supported?

See [supported operating systems](create-custom-data-collection-rules.md#supported-operating-systems). To query your client version, in [advanced hunting](/defender-xdr/advanced-hunting-overview), use the **ClientVersion** column in the **DeviceInfo** table.

### Are manual (static) tags supported?

No, we currently only support dynamic tags. However, you can create dynamic tags out of manual tags in **Settings > Microsoft Defender XDR > Asset rule management**. For more information, see [Configure dynamic rules for devices in asset rule management](/defender-xdr/configure-asset-rules).

### How can I collect all events for a specific event type?

See [Monitor and troubleshoot](create-custom-data-collection-rules.md#monitor-and-troubleshoot).

## Next steps

- Learn how to [create and manage custom data collection rules](create-custom-data-collection-rules.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]