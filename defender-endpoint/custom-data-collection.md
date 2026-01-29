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

Custom data collection (Preview) enables organizations to expand telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs. This feature allows security teams to define specific collection rules with tailored filters for event properties such as folder paths, process names, and network connections.

## Why use custom data collection?

Microsoft Defender for Endpoint collects extensive telemetry by default, but some security scenarios require additional, specialized data:

### When default telemetry isn't enough

Use custom data collection when you need to:

- **Hunt for specific threat patterns**: Collect detailed events for known indicators of compromise or threat actor techniques
- **Monitor line-of-business applications**: Track security-relevant activity for custom applications not covered by standard telemetry
- **Meet compliance requirements**: Gather evidence required by industry regulations or internal policies
- **Investigate specialized environments**: Monitor critical systems with enhanced granularity during incident response
- **Detect custom attack techniques**: Capture telemetry for threats unique to your organization or industry

### Security value

Custom data collection provides:

- **Targeted visibility**: Collect only the events you need, reducing noise and cost
- **Flexible hunting**: Build custom queries on specialized telemetry in Microsoft Sentinel
- **Evidence collection**: Capture detailed forensic data for investigations and compliance
- **Scalable monitoring**: Target collection to specific device groups using tags

> [!IMPORTANT]
> Custom data collection requires device targeting using dynamic tags. You must configure dynamic tags in Asset Rule Management before creating custom collection rules. See [Targeting devices](targeting-devices.md) and [Create and manage device tags](machine-tags.md).

## When to use custom data collection

| Scenario | Description | Example |
|----------|-------------|---------|
| **Threat hunting** | Search for specific attack patterns across your environment | Collect all PowerShell script executions from administrative workstations to detect malicious scripts |
| **Application monitoring** | Track security-relevant events for custom applications | Monitor file access patterns for a proprietary financial application |
| **Compliance evidence** | Capture detailed audit logs required by regulations | Collect all file modifications in folders containing sensitive data |
| **Incident response** | Gather forensic data during active investigations | Temporarily collect all network connections from potentially compromised servers |
| **Lateral movement detection** | Monitor for specific indicators of lateral movement | Track remote connections and authentication events across domain controllers |

## How custom data collection works

Custom data collection uses rule-based filtering to capture specific events from endpoint devices and route them to your Microsoft Sentinel workspace for analysis and threat hunting.

:::image type="content" source="media/custom-data-collection/custom-data-collection-main-view.png" alt-text="Screenshot of the main Custom Data Collection page." lightbox="media/custom-data-collection/custom-data-collection-main-view.png":::

### The collection process

1. **Define rules**: Create collection rules in the Microsoft Defender portal with specific event filters
2. **Target devices**: Use dynamic tags to specify which devices should collect the data
3. **Deploy rules**: Rules are transmitted to targeted endpoints (typically within 20 minutes to 1 hour)
4. **Collect events**: Endpoints collect events matching your rule criteria alongside default telemetry
5. **Analyze data**: Query custom event data in your Microsoft Sentinel workspace

> [!NOTE]
> Custom data collection rules work alongside default Defender for Endpoint configuration. Custom collection doesn't replace or modify standard telemetry—it adds to it.

## Supported event tables

Custom data collection supports the following event tables. Each table captures different types of security-relevant activities:

| Table name | Event types | Use for |
|------------|-------------|---------|
| **DeviceCustomProcessEvents** | Process creation, termination, and other process activities | Monitoring executable launches, tracking process trees, detecting malicious processes |
| **DeviceCustomImageLoadEvents** | DLL and image loading events | Identifying malicious library injection, tracking suspicious module loads |
| **DeviceCustomFileEvents** | File creation, modification, deletion, and access | Monitoring sensitive data access, tracking ransomware indicators, compliance auditing |
| **DeviceCustomNetworkEvents** | Network connection events with IPs, ports, and protocols | Detecting lateral movement, monitoring C2 communications, tracking unauthorized connections |
| **DeviceCustomScriptEvents** | Script execution (PowerShell, JavaScript, etc.) | Detecting fileless malware, monitoring administrative scripts, identifying script-based attacks |

For detailed schema information, see [Advanced hunting schema tables](/defender-xdr/advanced-hunting-schema-tables).

## Prerequisites and requirements

Before using custom data collection, ensure you have:

### Required licenses and connections

- **Microsoft Defender for Endpoint Plan 2** license
- **Connected Microsoft Sentinel workspace** for custom data storage and querying
  - Even if you already have a connected Sentinel workspace, you must select it when creating custom data collection rules
  - Currently limited to one Sentinel workspace per tenant for custom data collection

### Device targeting requirements

- **Dynamic tags** configured in [Asset Rule Management](/defender-xdr/configure-asset-rules)
- Dynamic tags must be run at least once before use in custom collection rules
- Manual (static) tags are not supported for custom data collection

See [Create custom data collection rules](create-custom-data-collection-rules.md#prerequisites) for complete prerequisites.

### Supported operating systems

- Windows 10 and 11 (minimum client version 10.8805)
  - Windows 10 requires enrollment in the Extended Security Updates (ESU) program
- Windows Server 2019 and later

## Data costs and performance

### Cost considerations

- Custom data collection is included with Microsoft Defender for Endpoint P2 licensing
- **Data ingestion into Microsoft Sentinel incurs charges** based on your Sentinel billing arrangement
- Target collection carefully to specific device groups to control data volume and costs

### Performance limits

- Each rule can capture up to **25,000 events per device per 24-hour rolling window**
- When a device reaches the threshold, telemetry for that specific rule stops until the window resets
- Multiple rules can be active simultaneously, each with its own limit
- Rule deployment typically takes 20 minutes to 1 hour

## Frequently asked questions

### Does custom data collection affect the default Defender for Endpoint configuration?

No, custom data collection rules work alongside the Defender for Endpoint default configuration without interference.

### Is a Microsoft Sentinel workspace required?

Yes, you need a connected Microsoft Sentinel workspace to create and use custom data collection rules. You must also select the workspace when creating rules.

### Why are dynamic tags required?

Dynamic tags ensure device targeting stays current as your environment changes. Manual tags don't update automatically, which could result in outdated collection targeting. Dynamic tags are also required for integration with Asset Rule Management.

### How can I tell if a rule is active on a device?

Query the relevant custom event table for the device to see collected events. For example:

```kusto
search in (DeviceCustomFileEvents, DeviceCustomScriptEvents, DeviceCustomNetworkEvents) "your_device_id"
| where DeviceId == "your_device_id"
| summarize count() by RuleName, RuleLastModificationTime, $table
```

## Next steps

- **[Create custom data collection rules](create-custom-data-collection-rules.md)**: Step-by-step instructions for creating and managing rules
- **[Targeting devices](targeting-devices.md)**: Understand how device tags enable targeted collection
- **[Create and manage device tags](machine-tags.md)**: Configure dynamic tags for device targeting

## See also

- [Advanced hunting overview](/defender-xdr/advanced-hunting-overview)
- [Configure asset rules](/defender-xdr/configure-asset-rules)
- [Microsoft Sentinel workspace connection](/azure/sentinel/quickstart-onboard)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]