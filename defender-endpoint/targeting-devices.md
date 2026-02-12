---
title: Target devices with device groups and tags in Microsoft Defender for Endpoint
description: Understand how device tags and device groups enable security actions at scale in Microsoft Defender for Endpoint
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: concept-article
search.appverid: met150
ms.date: 01/29/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Target devices with device groups and tags

Device targeting is how you apply security actions to specific groups of devices in your environment. Rather than managing devices individually, targeting lets you organize devices into meaningful groups and apply configurations, policies, or data collection rules at scale.

This article explains how device tags and device groups enable targeting and how targeting powers key security capabilities in Microsoft Defender for Endpoint.

## What is device targeting?

Device targeting uses device tags to identify which devices should receive specific security actions. Tags serve as the bridge between your devices and the security operations you want to perform on them.

**The targeting flow**:

```
Device tags → Device groups → Security actions
```

1. **Create tags**: Apply tags to devices (manually or using dynamic rules)
2. **Form groups**: Tags create logical device groups based on business context
3. **Apply actions**: Use those groups to target security operations

## Why targeting matters

| Without targeting | With targeting |
|-------------------|----------------|
| Security teams manage devices individually (doesn't scale) | Manage hundreds of devices as a single group |
| Configurations apply to all devices or none (no granularity) | Apply different security postures to different device types |
| Investigating specific device groups requires complex queries | Quickly scope investigations, rules, and automation to relevant devices |

## Use manual or dynamic tags

Tags are the foundation of device targeting in Defender for Endpoint. There are two types of tags, each suited for different scenarios:

| Tag type | Description | Use when | Benefits | Limitations |
|----------|-------------|----------|----------|-------------|
| **Manual tags** | Custom labels you apply directly to individual devices through the portal or API | • Tagging specific devices for investigation<br>• Small group organization<br>• Temporary classifications during incident response | • Quick to apply<br>• No setup required<br>• Flexible for ad-hoc needs | • Doesn't scale well<br>• Requires manual updates<br>• Not supported for custom data collection or some automation scenarios |
| **Dynamic tags** | Automatically apply to devices based on rules you define; update as device properties change | • Large-scale automatic tagging<br>• Custom data collection targeting<br>• Maintaining accurate device groups<br>• Automation rules | • Scales to thousands of devices<br>• Always current<br>• Required for custom data collection<br>• Supports advanced automation | • Requires initial setup<br>• Updates approximately every hour<br>• Needs Asset Rule Management configuration |

**Example use cases**:
- **Manual tags**: Tag devices involved in an active investigation with "Investigation-2026-01" to easily track them
- **Dynamic tags**: Automatically tag all devices in the "Domain Controllers" role with "Critical-Infrastructure"

> [!IMPORTANT]
> Many advanced Defender for Endpoint capabilities, including custom data collection, require dynamic tags. Manual tags are not supported for these scenarios.

For detailed information on creating and managing both tag types, see [Create and manage device tags](machine-tags.md).

## Device groups for role-based access

Device groups allow you to organize devices and control which security teams can access and manage them. Device groups are built using device tags and enable distributed security operations with proper governance.

### What are device groups?

In an enterprise scenario, security operation teams are typically assigned a set of devices. These devices are grouped together based on attributes such as their domains, computer names, or designated tags.

Device groups enable you to:

- **Limit access** to related alerts and data to specific Microsoft Entra user groups with assigned RBAC roles
- **Configure different auto-remediation settings** for different sets of devices
- **Assign specific remediation levels** to apply during automated investigations
- **Filter investigations** by specific device groups using the **Group** filter in the device inventory

### Create device groups

When you create a device group, you'll:

- Set the automated remediation level for that group (No automated response, Semi-require approval for various folders, or Full remediation)
- Specify the matching rule that determines which devices belong to the group based on device name, domain, tags, and OS platform
- Select the Microsoft Entra user groups that should have access to the device group
- Rank the device group relative to other groups

> [!NOTE]
> A device group is accessible to all users if you don't assign any Microsoft Entra groups to it. If a device matches multiple groups, it's added only to the highest ranked device group.

For detailed instructions on creating and managing device groups, see [Create and manage device groups](machine-groups.md).

### Device groups vs. device tags

| Aspect | Device tags | Device groups |
|--------|-------------|---------------|
| **Purpose** | Label devices with business context | Control access and apply security policies |
| **Creation** | Manual or dynamic rules | Created in Defender portal using tags as criteria |
| **Access control** | No access control | Limits access to specific user groups (RBAC) |
| **Remediation settings** | No remediation settings | Configure automated remediation levels |
| **Use for** | Filtering, searching, targeting actions | Role-based access, distributed security operations |
| **Visibility** | All users see all tagged devices | Users only see devices in their assigned groups |

Device targeting enables security operations across multiple areas:

### 1. Investigations and threat hunting

**Use case**: Scope your investigation to specific device groups

**How targeting helps**:
- Filter alerts by tagged devices
- Query only devices with specific tags in advanced hunting
- Track suspicious activity across a device group

**Example scenarios**:
- Investigate all "Finance-Department" devices for suspicious lateral movement
- Hunt for threats across all "Windows-Servers" in a specific region
- Track devices involved in a compromise using "Incident-12345" tag

**Learn more**: [Advanced hunting overview](/defender-xdr/advanced-hunting-overview)

### 2. Custom data collection

**Use case**: Collect specialized telemetry from specific device sets

**How targeting helps**:
- Target custom data collection rules to devices with dynamic tags
- Collect detailed telemetry only where needed (reduces costs)
- Monitor line-of-business applications on specific device groups

**Example scenarios**:
- Collect file events from all "Database-Servers" to monitor data access
- Capture network connections from "Developer-Workstations" for audit compliance
- Monitor script execution on "Administrative-Systems" for security analysis

**Requirements**:
- Requires dynamic tags (manual tags not supported)
- Requires Microsoft Sentinel workspace connection

**Learn more**: [Custom data collection](custom-data-collection.md)

### 3. Automation rules

**Use case**: Apply automated response actions to device categories

**How targeting helps**:
- Define automated responses for specific device types
- Isolate tagged devices automatically when certain conditions occur
- Run custom remediation scripts on device groups

**Example scenarios**:
- Auto-isolate "Public-Kiosk" devices if high-severity malware is detected
- Automatically run forensic data collection on "Critical-Servers" during incidents
- Restrict "BYOD-Devices" from accessing sensitive resources when anomalies are detected

**Learn more**: [Configure automated investigation and response](/defender-xdr/m365d-configure-auto-investigation-response)

### 4. Device groups for role-based access

**Use case**: Control which security analysts can see and act on specific devices

**How targeting helps**:
- Create device groups based on tags
- Assign device groups to specific security teams
- Enable distributed security operations while maintaining governance

**Example scenarios**:
- Give the "Finance Security Team" access only to "Finance-Department" devices
- Allow regional teams to manage devices in their geographic locations
- Restrict junior analysts to "Non-Production" device groups for training

**Learn more**: [Create and manage device groups](machine-groups.md)

### 5. Attack surface reduction rules

**Use case**: Apply different security controls to different device types

**How targeting helps**:
- Deploy strict ASR rules to high-risk devices
- Use more permissive rules for development environments
- Test new rules on pilot groups before broad deployment

**Example scenarios**:
- Enable aggressive blocking rules on "Internet-Facing-Servers"
- Use audit mode on "Development-Machines" to prevent workflow disruption
- Apply "Standard-Security" baseline to general user workstations

**Learn more**: [Attack surface reduction rules deployment overview](/defender-endpoint/attack-surface-reduction-rules-deployment)

### 6. Conditional Access policies

**Use case**: Enforce access controls based on device security posture

**How targeting helps**:
- Use device risk levels and tags to inform access decisions
- Block or allow access based on device group membership
- Enforce compliance requirements for specific device categories

**Example scenarios**:
- Require MFA for "High-Risk-Devices" accessing sensitive applications
- Block "Non-Compliant-Devices" from corporate resources
- Allow "Managed-BYOD" devices limited access to approved services

**Learn more**: [Enforce compliance for Microsoft Defender for Endpoint with Conditional Access in Intune](/mem/intune/protect/advanced-threat-protection)

## Targeting strategies

### Strategy 1: Functional targeting

Organize devices by their business function:

- **Tag by role**: Web-Servers, Database-Servers, Workstations, Domain-Controllers
- **Tag by service**: Email-Infrastructure, HR-Systems, Finance-Applications
- **Use for**: Applying security configurations appropriate to each function

**Example**:
- Domain-Controllers: Strictest security, aggressive monitoring, no exceptions
- Developer-Workstations: Balanced security, some ASR rule exclusions
- General-Workstations: Standard security baseline

### Strategy 2: Geographic targeting

Organize devices by location:

- **Tag by region**: EMEA, APAC, Americas
- **Tag by site**: HQ-NewYork, Branch-London, Datacenter-Singapore
- **Use for**: Distributed security operations, regional compliance, timezone-aware investigations

**Example**:
- EMEA-Devices: Subject to GDPR requirements, monitored by EU security team
- APAC-Devices: Local incident response during APAC business hours
- Americas-Devices: Different compliance frameworks and audit requirements

### Strategy 3: Risk-based targeting

Organize devices by security criticality:

- **Tag by criticality**: Critical-Assets, High-Value, Standard, Low-Risk
- **Tag by exposure**: Internet-Facing, DMZ, Internal, Isolated
- **Use for**: Prioritizing investigations, applying compensating controls, focusing security resources

**Example**:
- Critical-Assets: 24/7 monitoring, immediate alerting, manual isolation approval required
- Internet-Facing: Enhanced logging, aggressive ASR rules, frequent vulnerability scans
- Low-Risk: Standard monitoring, automated response enabled

### Strategy 4: Lifecycle targeting

Organize devices by their operational status:

- **Tag by stage**: Production, Staging, Development, Testing
- **Tag by status**: New-Onboarding, Standard-Operation, Decommissioning
- **Use for**: Applying appropriate security postures based on device lifecycle

**Example**:
- Production: Full security controls, all monitoring enabled
- Testing: Audit mode for new security features, enhanced logging
- Decommissioning: Reduced monitoring, scheduled for exclusion

## Best practices for effective targeting

### 1. Use dynamic tags for automation

- Create dynamic tag rules in Asset Rule Management
- Dynamic tags update automatically as device properties change
- Required for custom data collection and many automation scenarios

### 2. Follow a consistent naming convention

- Use clear, hierarchical names: `Function-Subfuction-Detail`
- Examples: `Server-Web-Production`, `Workstation-Finance-Manager`
- Makes tags easier to understand and manage at scale

### 3. Combine multiple targeting dimensions

- Apply multiple tags to each device for flexible targeting
- Example: A device might have `Location-EMEA`, `Function-Database`, and `Criticality-High`
- Enables targeting by any combination of dimensions

### 4. Start with broad categories, refine over time

- Begin with essential groupings (Production vs. Non-Production, Servers vs. Workstations)
- Add more specific tags as your security program matures
- Avoid over-tagging early—complexity increases management burden

### 5. Document your tagging strategy

- Maintain documentation of what each tag means
- Define who can create new tags
- Document which security actions use which tags

### 6. Review and update tags regularly

- Schedule periodic reviews of your tagging strategy
- Remove obsolete tags that are no longer used
- Update dynamic tag rules as your environment changes

## Targeting limitations and considerations

### Dynamic tags vs. manual tags

| Feature | Dynamic tags | Manual tags |
|---------|--------------|-------------|
| **Automatic updates** | Yes | No |
| **Scale** | Unlimited | Limited to manual effort |
| **Custom data collection** | Supported | Not supported |
| **Automation rules** | Supported | Limited support |
| **Advanced hunting** | Supported | Supported |
| **Device groups** | Supported | Supported |

### Performance considerations

- Each device can have multiple tags
- Tags are evaluated periodically (dynamic tags update approximately every hour)
- Large numbers of tags don't significantly impact performance
- Custom data collection rules can target multiple tag combinations

### Permissions

- Creating dynamic tags requires appropriate permissions in Asset Rule Management
- Applying manual tags requires device-level permissions
- Using tags in automation requires rule creation permissions

## Common targeting scenarios

### Scenario 1: Monitor critical servers

**Goal**: Collect detailed telemetry from database servers without collecting from all devices

**Approach**:
1. Create dynamic tag rule: `Device Role = Database Server` → Tag = `Critical-Database`
2. Create custom data collection rule targeting `Critical-Database` tag
3. Collect file access and network connection events
4. Query data in Microsoft Sentinel for security analysis

### Scenario 2: Pilot new security feature

**Goal**: Test new attack surface reduction rule before deploying to production

**Approach**:
1. Create manual tag: `ASR-Pilot-2026`
2. Apply tag to 10-20 representative devices
3. Deploy ASR rule in audit mode to `ASR-Pilot-2026` devices
4. Monitor for false positives using advanced hunting filtered to pilot tag
5. Refine rule, then expand to production using broader dynamic tag

### Scenario 3: Regional security operations

**Goal**: Enable regional security teams to manage devices in their geography

**Approach**:
1. Create dynamic tags for each region: `Location-EMEA`, `Location-APAC`, `Location-Americas`
2. Create device groups based on location tags
3. Assign device groups to regional security teams
4. Regional teams can now view, investigate, and respond to alerts on their devices only

### Scenario 4: Incident response containment

**Goal**: Quickly identify and isolate all devices potentially affected by a compromise

**Approach**:
1. During investigation, identify compromise pattern (e.g., specific software version)
2. Use advanced hunting to find all affected devices
3. Apply manual tag: `Incident-2026-01-Containment`
4. Create automation rule to isolate devices with that tag
5. Gradually remove tag as devices are remediated and verified clean

## Next steps

Now that you understand how targeting works, take these next steps:

- **[Create and manage device tags](machine-tags.md)**: Learn how to apply manual and dynamic tags
- **[Custom data collection](custom-data-collection.md)**: Use tags to target specialized telemetry collection
- **[Create and manage device groups](machine-groups.md)**: Organize devices for role-based access control
- **[Advanced hunting](/defender-xdr/advanced-hunting-overview)**: Query devices using tags in KQL queries

## See also

- [Device inventory](machines-view-overview.md)
- [Manage device scope and relevance](manage-device-scope-relevance.md)
- [Configure asset rules](/defender-xdr/configure-asset-rules)
- [Automated investigation and response](/defender-xdr/m365d-autoir)
