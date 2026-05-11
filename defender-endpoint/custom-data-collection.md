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
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint
---

# Custom data collection in Microsoft Defender for Endpoint (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Custom data collection (Preview) enables organizations to expand telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs. This feature allows security teams to define specific collection rules with tailored filters for event properties such as folder paths, process names, and network connections.

## Why use custom data collection?

Microsoft Defender for Endpoint collects extensive telemetry by default, but some security scenarios require additional, specialized data. Use custom data collection when you need targeted visibility for threat hunting, application monitoring, compliance evidence, or incident response without the cost and noise of collecting all events.

### When to use custom data collection

| Scenario | Use when | Example | Security value |
|----------|----------|---------|----------------|
| **Threat hunting** | You need to search for specific attack patterns across your environment | Collect all PowerShell script executions from administrative workstations to detect malicious scripts | Detect fileless malware, malicious scripts, or unauthorized automation on privileged systems |
| **Application monitoring** | You need to track security-relevant events for custom applications | Monitor file access patterns for a proprietary financial application | Identify unauthorized access, data exfiltration attempts, or compliance violations for line-of-business apps |
| **Compliance evidence** | You need to capture detailed audit logs required by regulations | Collect all file modifications in folders containing sensitive data | Meet regulatory requirements (PCI-DSS, HIPAA, GDPR) with detailed forensic audit trails |
| **Incident response** | You need to gather forensic data during active investigations | Temporarily collect all network connections from potentially compromised servers | Capture detailed evidence for investigation, identify lateral movement, and support remediation efforts |
| **Lateral movement detection** | You need to monitor for specific indicators of lateral movement | Track remote connections and authentication events across domain controllers | Detect attackers moving between systems using stolen credentials or remote access tools |

### Benefits of custom data collection

| Benefit | Description |
|---------|-------------|
| **Targeted visibility** | Collect only the events you need, reducing noise and controlling data ingestion costs in Microsoft Sentinel |
| **Flexible hunting** | Build custom queries on specialized telemetry in Microsoft Sentinel for deep threat hunting and investigation |
| **Evidence collection** | Capture detailed forensic data for investigations, compliance audits, and incident response |
| **Scalable monitoring** | Target collection to specific device groups using dynamic tags, ensuring collection stays current as your environment changes |
| **Cost control** | Avoid collecting unnecessary data by using specific filters and device targeting |

> [!IMPORTANT]
> Custom data collection requires device targeting using dynamic tags. You must configure dynamic tags in Asset Rule Management before creating custom collection rules. See [Create and manage device tags and target devices](machine-tags.md).

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

For complete prerequisites and setup requirements, see [Create custom data collection rules](create-custom-data-collection-rules.md#prerequisites).

## Frequently asked questions

| Question | Answer |
|----------|--------|
| **Does custom data collection affect the default Defender for Endpoint configuration?** | No, custom data collection rules work alongside the Defender for Endpoint default configuration without interference. Custom collection doesn't replace or modify standard telemetry—it adds to it. |
| **Is a Microsoft Sentinel workspace required?** | Yes, you need a connected Microsoft Sentinel workspace to create and use custom data collection rules. You must also select the workspace when creating rules. |
| **Why are dynamic tags required?** | Dynamic tags ensure device targeting stays current as your environment changes. Manual tags don't update automatically, which could result in outdated collection targeting. Dynamic tags are also required for integration with Asset Rule Management. |
| **How can I tell if a rule is active on a device?** | Query the relevant custom event table for the device to see collected events. For example:<br><br>`search in (DeviceCustomFileEvents, DeviceCustomScriptEvents, DeviceCustomNetworkEvents) "your_device_id"`<br>`\| where DeviceId == "your_device_id"`<br>`\| summarize count() by RuleName, RuleLastModificationTime, $table` |
| **What happens when a device reaches the 75,000 event limit?** | Telemetry collection for that specific rule stops until the 24-hour rolling window resets. Other rules on the device continue to collect events. Refine your rule conditions to make them more specific and reduce event volume. |
| **Can I use manual tags for custom data collection?** | No, only dynamic tags are supported. Dynamic tags automatically update as device properties change, ensuring collection targeting stays accurate. |
| **How long does it take for a rule to deploy to devices?** | Rule deployment typically takes 20 minutes to 1 hour. Verify deployment by querying the custom event tables for data from targeted devices. |

## Next steps

- **[Create custom data collection rules](create-custom-data-collection-rules.md)**: Step-by-step instructions for creating and managing rules
- **[Create and manage device tags and target devices](machine-tags.md)**: Configure dynamic tags for device targeting