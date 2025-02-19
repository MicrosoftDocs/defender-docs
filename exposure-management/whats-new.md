---
title: Release notes
description: This page is updated frequently with the latest updates in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 12/03/2024

---

# What's new in Microsoft Security Exposure Management?

Microsoft Security Exposure Management (MSEM) is in active development and receives improvements on an ongoing basis. To stay up to date with the most recent developments, this page provides you with information about new features, bug fixes, and deprecated functionality.

<!-- Please don't adjust this next line without getting approval from the Defender for Cloud documentation team. It is necessary for proper RSS functionality. -->
This page is updated frequently with the latest updates in Microsoft Security Exposure Management.

Learn more about MSEM by reading the blogs, [here](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/bg-p/MicrosoftSecurityandCompliance).

> [!TIP]
> Get notified when this page is updated by copying and pasting the following URL into your feed reader:
>
> `https://aka.ms/msem/rss`

## February 2025

The following predefined classification rules were added to the critical assets list:

| Classification                                       | Description                                                  |
| :--------------------------------------------------- | :----------------------------------------------------------- |
| Azure Key Vault with high number of operations       | This rule identifies and classifies Azure Key Vaults that experience a high volume of operations, indicating their criticality within the cloud environment. |
| Security Operations Admin Device        | This rule applies to critical devices used to configure, manage, and monitor the security within an organization are vital for security operations administration and are at high risk of cyber threats. They require top-level security measures to prevent unauthorized access. |

For more information, see, [Predefined classifications](predefined-classification-rules-and-levels.md)

## January 2025

### Metrics enhancements

The metrics have been enhanced to show the improvement of the exposure levels with a progress bar, progressing from left to right and from 0% (indicating high exposure) to 100% (indicating no exposure).

In addition, the metrics weight is now displayed as high, medium, or low, based on the metric's importance to the initiative. The weight can also be defined as risk accepted.

For more information, see, [Working with metrics](exposure-insights-overview.md#working-with-metrics)

## December 2024

### New predefined classifications

The following predefined classification rules were added to the critical assets list:

| Classification                                       | Description                                                  |
| :--------------------------------------------------- | :----------------------------------------------------------- |
| Locked Azure Kubernetes Service cluster              | This rule applies to Azure Kubernetes Service clusters that are safeguarded by a lock. |
| Premium tier Azure Kubernetes Service cluster        | This rule applies to premium tier Azure Kubernetes Service clusters. |
| Azure Kubernetes Service cluster with multiple nodes | This rule applies to Azure Kubernetes Service clusters with multiple nodes. |
| Azure Arc Kubernetes cluster with multiple nodes     | This rule applies to Azure Arc clusters with multiple nodes. |

For more information, see, [Predefined classifications](predefined-classification-rules-and-levels.md)

### New documentation library for Microsoft's unified security operations platform

Find centralized documentation about [Microsoft's unified SecOps platform in the Microsoft Defender portal](/unified-secops-platform/overview-unified-security). Microsoft's unified SecOps platform brings together the full capabilities of Microsoft Sentinel, Microsoft Defender XDR, Microsoft Security Exposure Management, and generative AI into the Defender portal. Learn about the features and functionality available with Microsoft's unified SecOps platform, then start to plan your deployment.

## November 2024

### Announcing the General Availability of Microsoft Security Exposure Management

We are excited to announce the general availability of Microsoft Security Exposure Management. This powerful tool helps organizations focus on their most critical exposures and act swiftly. By integrating security insights across the entire digital estate, it provides a comprehensive view of risk posture, enabling faster, more informed decisions to reduce exposure before attackers can exploit it.

With this GA release, you can now build and enhance a Continuous Threat Exposure Management (CTEM) program, continuously identifying, prioritizing, and mitigating risks across your digital landscape.

### Attack path enhancements

##### **Hybrid attack paths: On-Prem to Cloud**

We now support the discovery and visualization of hybrid attack paths that originate from on-premises environments and traverse into cloud infrastructures. We have introduced a new **Type column** for the attack paths to display the support for hybrid paths that transition between
on-premises and cloud environments, or vice versa. This feature equips security teams to:

- **Identify cross-environment attack vectors:** See how vulnerabilities in on-prem environments can be leveraged to target assets in the cloud.
- **Prioritize remediation effectively:** Gain clarity on the potential risks to critical cloud assets stemming from your hybrid infrastructure.
- **Enhance hybrid defense strategies:** Use these insights to strengthen both on-prem and cloud security postures.

This capability bridges a critical gap in securing hybrid environments by offering end-to-end visibility into interconnected attack paths.

##### **DACL-based path analysis**

Our attack path calculations now include support for **Discretionary Access Control Lists (DACLs)**, providing a more accurate representation of potential attack paths by incorporating group-based permissions. This enhancement enables defenders to:

- Make more informed decisions when addressing risks related to permission structures.
- View risks in the environment the same way attackers do
- Identify low hanging fruit chokepoints that significantly expose the environment to risk
 
For more information, see, [Review attack paths](review-attack-paths.md)

### External data connectors

We have introduced new external data connectors to enhance data integration capabilities, allowing seamless ingestion of security data from other security vendors.  Data collected through these connectors is normalized within our exposure graph, enhancing your device inventory, mapping relationships, and revealing new attack paths for comprehensive attack surface visibility. These connectors help you to consolidate security posture data from various sources, providing a comprehensive view of your security posture.

For more information, see [Data connectors overview](overview-data-connectors.md).

### Discovery sources available in the inventory and attack surface map

The Device Inventory and Attack Surface Map now display the data sources for each discovered asset. This feature provides an overview of which tools or products reported each asset, including Microsoft and external connectors like Tenable or ServiceNow CMDB. In the inventory, use the **Discovery Sources** column to filter devices by reporting sources. In the **Attack Surface Map**, toggle the **Discovery Sources** view using the **Layers** option. You can also query **Discovery Sources** in the **Device Info** table via Advanced Hunting.

For more information on understanding data from external sources, see [Getting value from your data connectors](value-data-connectors.md)

### OT security initiative

The new Operational Technology (OT) security initiative equips practitioners with a powerful tool to identify, monitor, and mitigate risks across the OT environment, ensuring both operational reliability and safety. This initiative aims to identify devices across physical sites, assess their associated risks, and provide faster, more effective protection for OT systems.

For more information, see, [Review security initiatives](initiatives.md)

### Microsoft Security Exposure Management is now supported in Microsoft Defender XDR Unified role-based access control (RBAC)

Access control to Microsoft Security Exposure Management can now be managed using Microsoft Defender XDR Unified Role-Based Access Control (RBAC) permissions model with dedicated and granular permissions.

This new capability enables admins to grant their posture managers with access to Exposure Management data and experiences with the least privilege access approach rather than the Microsoft Azure Entra ID roles, which is still supported and can be used if needed.

To learn more about Microsoft Security Exposure Management access management using Microsoft Defender XDR Unified RBAC permissions model, see [Prerequisites and support](/security-exposure-management/prerequisites). 

To learn more about creating new custom roles in Microsoft Defender XDR Unified RBAC, see [Create custom roles in Microsoft Defender XDR Unified RBAC](/defender-xdr/create-custom-rbac-roles).

### Content versioning notifications

The new versioning feature in Microsoft Security Exposure Management offers proactive notifications about upcoming version updates, giving users advanced visibility into anticipated metric changes and their impact on their related initiatives. A dedicated side panel provides comprehensive details about each update, including the expected release date, release notes, current and new metric values, and any changes to related initiative scores. Additionally, users can share direct feedback on the updates within the platform, fostering continuous improvement and responsiveness to user needs.

For more information on exposure insights, see [Overview - Exposure insights](exposure-insights-overview.md)

### Exposure history for metrics

User can investigate metric changes by reviewing the asset exposure change details. From the initiative's **History** tab, by selecting a specific metric, you can now see the list of assets where exposure has been either added or removed, providing clearer insight into exposure shifts over time.

For more information, see, [Reviewing initiative history](exposure-insights-overview.md#reviewing-initiative-history)

### SaaS security initiative

The SaaS Security initiative delivers a clear view of your SaaS security coverage, health, configuration, and performance. Through metrics spanning multiple domains, it gives security managers a high-level understanding of their SaaS security posture.

For more information, see, [SaaS security initiative](/defender-cloud-apps/saas-security-initiative)

## October 2024

### New in attack paths

We have introduced four new features designed to enhance your security management and risk mitigation efforts. These features provide valuable insights into the attack paths identified within your environment, enabling you to prioritize risk mitigation strategies effectively and reduce the impact of potential threats.

The new features include:

- **Attack path widget on exposure management overview page**: Provides users with an at-a-glance, high-level view of discovered attack paths. It displays a timeline of newly identified paths, key entry points, target types, and more, ensuring security teams stay informed about emerging threats and can respond quickly.
- **Attack path dashboard**: Provides a high-level overview of all identified attack paths within the environment. This feature enables security teams to gain valuable insights into the types of paths identified, top entry points, target assets, and more, helping to prioritize risk mitigation efforts effectively.
- **Choke points**: Highlights critical assets that multiple attack paths intersect, identifying them as key vulnerabilities within the environment. By focusing on these choke points, security teams can efficiently reduce risk by addressing high-impact assets, thus preventing attackers from progressing through various paths.
- **Blast radius**: Allows users to visually explore the paths from a choke point. It provides a detailed visualization showing how the compromise of one asset could affect others, enabling security teams to assess the broader implications of an attack and prioritize mitigation strategies more effectively.

For more information, see [Overview of attack paths](work-attack-paths-overview.md).

## September 2024

### New Enterprise IoT Security Initiative

With this new initiative, Enterprise IoT Security offers a powerful solution to identify unmanaged IoT devices and enhance your security. With continuous monitoring, vulnerability assessments, and tailored recommendations designed for Enterprise IoT devices, you gain comprehensive visibility into the risks posed by these devices. This initiative not only helps you understand the potential threats but also strengthens your organization's resilience in mitigating them.

For more information, see, [Review security initiatives](initiatives.md)

### New predefined classifications

The following predefined classification rule was added to the critical assets list:

| Classification                                               | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Hyper-V Server**                                                 | This rule applies to devices identified as Hyper-V servers within a domain. These servers are essential for running and managing virtual machines within your infrastructure, serving as the core platform for their creation and management. |

For more information, see, [Predefined classifications](predefined-classification-rules-and-levels.md)

### Enhanced visibility for scoped users

This change now allows users who have been granted access to only some of the organization's devices to see the list of affected assets in metrics, recommendations, events, and initiative history within their specific scope.

For more information, see [Prerequisites and support](prerequisites.md).

### Proactively manage your security posture

Read how the *ExposureGraphEdges* and *ExposureGraphNodes* tables in Advanced Hunting helps your organizations proactively manage and understand your security posture by analyzing asset relationships and potential vulnerabilities.

**Blog** - [Microsoft Security Exposure Management Graph: Prioritization is the king](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/microsoft-security-exposure-management-graph-prioritization-is/ba-p/4160316)

For more information, see, [Query the enterprise exposure graph](query-enterprise-exposure-graph.md)

## August 2024

### New predefined classifications

The following predefined **Identity** classification rules were added to the critical assets list:

| Classification                                | Description                                                  |
| --------------------------------------------- | ------------------------------------------------------------ |
| External Identity Provider Administrator      | This rule applies to identities assigned with the Microsoft Entra "External Identity Provider Administrator" role. |
| Domain Name Administrator                     | This rule applies to identities assigned with the Microsoft Entra "Domain Name Administrator" role. |
| Permissions Management Administrator          | This rule applies to identities assigned with the Microsoft Entra "Permissions Management Administrator" role. |
| Billing Administrator                         | This rule applies to identities assigned with the Microsoft Entra "Billing Administrator" role. |
| License Administrator                         | This rule applies to identities assigned with the Microsoft Entra "License Administrator" role. |
| Teams Administrator                           | This rule applies to identities assigned with the Microsoft Entra "Teams Administrator" role. |
| External ID User Flow Administrator           | This rule applies to identities assigned with the Microsoft Entra "External ID User Flow Administrator" role. |
| External ID User Flow Attribute Administrator | This rule applies to identities assigned with the Microsoft Entra "External ID User Flow Attribute Administrator" role. |
| B2C IEF Policy Administrator                  | This rule applies to identities assigned with the Microsoft Entra "B2C IEF Policy Administrator" role. |
| Compliance Data Administrator                 | This rule applies to identities assigned with the Microsoft Entra "Compliance Data Administrator" role. |
| Authentication Policy Administrator           | This rule applies to identities assigned with the Microsoft Entra "Authentication Policy Administrator" role. |
| Knowledge Administrator                       | This rule applies to identities assigned with the Microsoft Entra "Knowledge Administrator" role. |
| Knowledge Manager                             | This rule applies to identities assigned with the Microsoft Entra "Knowledge Manager" role. |
| Attribute Definition Administrator            | This rule applies to identities assigned with the Microsoft Entra "Attribute Definition Administrator" role. |
| Attribute Assignment Administrator            | This rule applies to identities assigned with the Microsoft Entra "Attribute Assignment Administrator" role. |
| Identity Governance Administrator             | This rule applies to identities assigned with the Microsoft Entra "Identity Governance Administrator" role. |
| Cloud App Security Administrator              | This rule applies to identities assigned with the Microsoft Entra "Cloud App Security Administrator" role. |
| Windows 365 Administrator                     | This rule applies to identities assigned with the Microsoft Entra "Windows 365 Administrator" role. |
| Yammer Administrator                          | This rule applies to identities assigned with the Microsoft Entra "Yammer Administrator" role. |
| Authentication Extensibility Administrator    | This rule applies to identities assigned with the Microsoft Entra "Authentication Extensibility Administrator" role. |
| Lifecycle Workflows Administrator             | This rule applies to identities assigned with the Microsoft Entra "Lifecycle Workflows Administrator" role. |

For more information, see, [Predefined classifications](predefined-classification-rules-and-levels.md)

### New Initiative Event

A new event type has been created to notify users when a new initiative is added to MSEM.

For more information, see, [Overview - Exposure insights](exposure-insights-overview.md)

### News from the Research Team

Read more about what the research team has been up to in this blog - [Bridging the On-premises to Cloud Security Gap: Cloud Credentials Detection](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/bridging-the-on-premises-to-cloud-security-gap-cloud-credentials/ba-p/4211794)

## July 2024

### New predefined classifications

The following predefined classification rules were added to the critical assets list:

| Classification                                               | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Exchange**                                                 | This rule applies to devices identified as operational Exchange servers within a domain. These servers might hold sensitive data of the organization. |
| **VMware ESXi**                                              | This rule applies to devices identified as operational ESXi servers. These devices might hold other sensitive or critical devices. |
| **VMware vCenter**                                           | This rule applies to devices identified as operational VMware vCenter and frequently used by admins to manage the virtual infrastructure. |
| **Identity with Privileged Azure Role**                      | This rule applies to identities assigned with a Privileged Azure role, over a potentially business-critical scope. |
| **Exchange Administrator**                                   | This rule applies to identities assigned with the Microsoft Entra "Exchange Administrator" role. |
| **SharePoint Administrator**                                 | This rule applies to identities assigned with the Microsoft Entra "SharePoint Administrator" role. |
| **Compliance Administrator**                                 | This rule applies to identities assigned with the Microsoft Entra "Compliance Administrator" role. |
| **Groups Administrator**                                     | This rule applies to identities assigned with the Microsoft Entra "Groups Administrator" role. |
| **Confidential Azure Virtual Machine**                                    | This rule applies to Azure confidential Virtual Machines.    |
| **Locked Azure Virtual Machine**                                                | This rule applies to Azure virtual machines that are safeguarded by a lock. |
| **Azure Virtual Machine with High Availability and Performance** | This rule applies to Azure Virtual Machines that use premium Azure storage and are configured with an availability set. |
| **Immutable Azure Storage**                                  | This rule applies to Azure storage accounts that have immutability support enabled. |
| **Immutable and Locked Azure Storage**                       | This rule applies to Azure storage accounts that have immutability support enabled with a locked policy in place. |
| **Azure Virtual Machine has a Critical Signed-in user**            | This rule applies to Azure Virtual Machines with a Critical user signed in protected by Defender for Endpoint with high or very high-criticality users signed in. |
| **Azure Key Vaults with Many Connected Identities**          | This rule applies to Azure Key Vaults with high access compared to others, indicating critical workload usage. |

For more information, see, [Predefined classifications](predefined-classification-rules-and-levels.md)

## May 2024

### Integration with Threat Analytics

- New integration with Threat Analytics to enhance the set of domain security initiatives with threat-based security initiatives. These initiatives focus on specific attack techniques and active threat actors, as seen and analyzed by expert Microsoft security researchers.

- **Blog** - [Respond to trending threats and adopt zero-trust with Exposure Management](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/respond-to-trending-threats-and-adopt-zero-trust-with-exposure/ba-p/4130133)

For more information, see, [Review security initiatives](initiatives.md)

### New Exposure Management Tables

- MSEM released two new powerful tables within Advanced Hunting: *ExposureGraphNodes* and *ExposureGraphEdges*.

- **Blog** - [Microsoft Security Exposure Management Graph: unveiling the power](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/microsoft-security-exposure-management-graph-unveiling-the-power/ba-p/4148546)

For more information, see, [Query the enterprise exposure graph](query-enterprise-exposure-graph.md)

## April 2024

### Critical Asset Protection

- Microsoft Security Exposure Management introduces a contextual risk-based approach, allowing organizations to identify and prioritize critical assets effectively. By assessing potential exposures in real time, security teams gain clarity and focus on safeguarding their digital assets.

- **Blog** - [Critical Asset Protection with Microsoft Security Exposure Management](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/critical-asset-protection-with-microsoft-security-exposure/ba-p/4122645)

For more information, see, [Overview of critical asset management](critical-asset-management.md)
