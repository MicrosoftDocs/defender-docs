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

This article provides an overview of custom data collection so that you can understand its capabilities and how it enhances your security visibility and threat hunting operations.

## How custom data collection works

Custom data collection uses rule-based filtering to capture specific events from endpoint devices and route them to your Microsoft Sentinel workspace for analysis and threat hunting.

Custom collection rules allow you to define the specific events you want to capture and the conditions under which they should be collected.

To create custom data collection rules, see [Create custom data collection rules](create-custom-data-collection-rules.md).

## Supported event tables

Custom data collection currently supports three primary event tables:

- **DeviceCustomFileEvents**: Stores data on file creation, modification, deletion, and access activities.
- **DeviceCustomNetworkEvents**: Stores data on network connection events, including IP addresses, ports, and protocols.
- **DeviceCustomScriptEvents**: Stores data on script execution activities through Antimalware Scan Interface (AMSI).

## Data flow and integration

This is the typical data flow for custom data collection:

1. **Rule creation**: Define collection rules in the Microsoft Defender portal with specific filters and device targets.
2. **Rule deployment**: Rules are transmitted to targeted endpoints, typically within 20 minutes to 1 hour.
3. **Event collection**: Endpoints collect events matching your rule criteria alongside default telemetry.
4. **Data routing**: Custom event data flows to your connected Microsoft Sentinel workspace.
5. **Analysis**: Query custom data using DeviceCustom* tables (DeviceCustomFileEvents, DeviceCustomScriptEvents).

## Example scenarios

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

## Next steps

- Learn how to [create and manage custom data collection rules](configure-custom-data-collection.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
