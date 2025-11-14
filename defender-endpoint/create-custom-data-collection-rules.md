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

[Custom data collection (Preview)](custom-data-collection.md) enables organizations to expand and customize telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs.

Custom data collection rules allow you to define specific events and analyze the data to enhance your security visibility and threat hunting operations. Custom data collection rules are based on tailored filters for event properties such as folder paths, process names, and network connections.

This article shows you how to create and manage custom data collection rules in the Microsoft Defender portal.

## Create custom data collection rules

### Prerequisites

To use custom data collection, you need:

- A Microsoft Defender for Endpoint P2 license.
- A connected [Microsoft Sentinel workspace](/azure/sentinel/quickstart-onboard): required for custom data storage and querying.
- Minimum client version: 10.8797 (Windows only).
- Dynamic tags configured in [Asset Rule Management](/defender-xdr/configure-asset-rules) for device targeting. To use a tag for custom data collection, the tag should be run at least once.

### Supported platforms

- **Windows**: Minimum client version 10.8797
- **Windows 10**: Requires enrollment in [Extended Security Updates (ESU) program](/windows/whats-new/extended-security-updates).

### Performance and limits

- Collection rules are limited to 25,000 events each for performance protection.
- Rule deployment typically takes 20 minutes to one hour.
- Custom collection operates alongside default Defender for Endpoint configuration without interference.

### Data costs

Custom data collection is included with Microsoft Defender for Endpoint P2 licensing. However, data ingestion into Microsoft Sentinel workspaces incurs charges based on your Sentinel billing arrangement.

### Create rules

1. In the Microsoft Defender portal, navigate to **Settings** > **Endpoints** > **Rules** > **Custom Collection**.

1. If your Microsoft Sentinel workspace isn't connected, select the **Enhance event collection** note to connect your Microsoft Sentinel workspace.

    > [!NOTE]
    > You can currently connect only one Microsoft Sentinel workspace.

1. To select the workspace scope, select the workspace name on the top right, and select the workspace you want to use. 
1. Select **Create rule**, type a rule name and description, and select **Next**.
1. Select which table you want to collect data from. For more information, see [Supported event tables](custom-data-collection.md#supported-event-tables). 
1. Select the action for which you want to collect data.
1. Add rule conditions to filter the data even further. You can add multiple conditions to refine the data collection. Rule conditions are based on the selected table. For more information, see the respective table link under [Supported event tables](custom-data-collection.md#supported-event-tables).

    > [!NOTE]
    > If you use the **Not equals** operator, this selects all events. To avoid using large data volumes, combine it with other conditions.

1. Select whether you want to collect data from all applicable client devices or from specific devices that include tags. For more information, see [Create dynamic rules for devices in asset rule management](/defender-xdr/configure-asset-rules).

    > [!TIP]
    > To view devices where the tag is applied, select **Devices** > **Device inventory**, and filter by the tag name. You can also see the tag in the device details page.

It can take up to an hour for the rule to be deployed to the targeted devices.

## Monitor and troubleshoot

If rules aren't working as expected:

- Create a general collect-all rule for the organization.
- Apply individual filters and tags to isolate issues.
- If a device isn't responding after you enable the feature, reboot the device.

Review these considerations when monitoring and troubleshooting custom data collection rules:

- [Endpoint detection and response (EDR) exclusions](navigate-defender-endpoint-antivirus-exclusions.md) may override custom collection rules.
- Dynamic tags update approximately every hour. Check the **Custom collection** > **Last run time** column for the status.

## Query custom data in advanced hunting

You can use advanced hunting queries to analyze the data collected by custom data collection rules and investigate specific events.

### Analyze event data

Query the **DeviceCustomFileEvents** table to see the collection files created by the background task scheduler. This scheduler creates and deletes files every five minutes.

TBD - query

The events use a similar schema and properties as the default events in the [DeviceFileEvents table](/defender-xdr/advanced-hunting-devicefileevents-table), including existing enrichments.

In the query results, review the following data:

- The **fileExtension** column is set to **defenderforendpoint** and the **ActionType** is set to **FileDeleted** or **FileCreate**. This indicates that the file was created or deleted by the custom data collection rule.
- The **RuleName** and **RuleLastModificationTime** columns allow you to identify which rules are applied to a specific endpoint.
- When you inspect a record, the remote session information in the **InitiatingProcessRemoteSessionDeviceName** and the **InitiatingProcessRemoteSessionIP** shows the remote device name and IP address of the machine that initiated the file creation or deletion.

### Analyze script execution data

Query the **DeviceCustomScriptEvents** table to see the scripts that created and deleted the collection files. 

TBD - query

In the query results, review the following data:

- The **ActionType** shows the action used by the script. In this example, the script uses the **AMSIScriptContent** action, which reflects the AMSI script filter that was initially configured in the rule settings. 
- When you inspect a record, the **InitiatingProcessCommandLine** field includes the **CustomDataCollection** string, which indicates that custom data collection is used to run the script.

## Edit, delete, and turn custom data collection rules on or off

- To edit a rule, navigate to **Settings** > **Endpoints** > **Rules** > **Custom Collection**, select the rule you want to edit, and select **Edit**.
- To delete a rule, select the rule you want to delete, and select **Delete**.
- To turn a rule off or on, select the rule you want to modify, and **Turn off** or **Turn on**.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]