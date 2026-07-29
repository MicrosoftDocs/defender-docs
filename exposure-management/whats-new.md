---
title: What's new in Microsoft Security Exposure Management
description: This page is updated frequently with the latest updates in Microsoft Security Exposure Management.
ms.topic: overview
ms.author: dlanger
author: dlanger
ms.date: 06/30/2026
ai-usage: ai-assisted
---

# What's new in Microsoft Security Exposure Management

Microsoft Security Exposure Management (MSEM) is in active development and receives ongoing improvements. To stay up to date with the latest developments, this page provides information about new features, bug fixes, and deprecated functionality.

<!-- Please don't adjust this next line without getting approval from the Defender for Cloud documentation team. It is necessary for proper RSS functionality. -->
This page is updated frequently with the latest developments in Microsoft Security Exposure Management.

Learn more about MSEM by reading the [Microsoft Security and Compliance blog](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/bg-p/MicrosoftSecurityandCompliance).

> [!TIP]
> Get notified when this page is updated by copying and pasting the following URL into your feed reader:
>
> `https://aka.ms/msem/rss`

## July 2026

### Codename MDASH - MAI-Augmented scan profile now available for on-demand scans private preview

Expanding on the previously released Defender CLI support, the MAI-Augmented scan profile is now also available in preview for on-demand scans triggered from the Microsoft Defender portal. Security teams can select this profile when starting an on-demand scan from the Scans tab.

For more information, see [Trigger an on-demand agentic scan](/security-exposure-management/trigger-on-demand-scan).

### Codename MDASH - MAI-Augmented scan profile private preview

The MAI-Augmented scan profile is now available in preview as part of Codename MDASH. The MAI-Augmented profile can be used when triggering a scan through the Defender CLI.  
It includes MAI-Cyber-1-Flash, a new cyber-specialized model that extends the current agentic scanner in addition to the existing required models. 

Security teams can choose this profile when triggering a scan from Defender CLI or continue using a scan profile based on the existing models.

For more information, see [Scan with a scan profile (Preview)](defender-cli.md#scan-with-a-scan-profile-preview).

### Codename MDASH - Agentic code scanner private preview

Codename MDASH - Agentic code scanner is now available in private preview in Microsoft Security Exposure Management.

Codename MDASH uses a multi-model agentic AI system to detect code vulnerabilities with greater depth and accuracy than traditional static analysis. Security teams can run scans from Defender CLI or through a GitHub connector, review findings in the Defender portal, and use results to help prioritize code security risks.

For more information, see [Agentic code security overview](ai-code-security-overview.md).

### OT data connectors in Microsoft Security Exposure Management

Microsoft Security Exposure Management now supports operational technology (OT) data connectors for Armis, Dragos, and Forescout.

OT data connectors bring OT asset and vulnerability data from supported third-party OT platforms into the Defender portal. This helps security teams view OT devices alongside other assets, enrich device inventory with OT context, and investigate vulnerabilities across IT and OT environments.

For more information, see [OT data connectors](ot-data-connectors.md).

## June 2026
 
### New predefined classifications for AI agents

The following predefined **AI agent** classification rules were added to the critical assets list:

| Classification | Description |
| -------------- | ----------- |
| Executive-Sponsored AI Agent | This rule applies to AI agents that are created or owned by senior executives in the organization. As such, these agents may be granted access to sensitive data and act on the executive's behalf. Compromise could lead to unauthorized actions performed under executive authority, and exposure of sensitive executive-level data - without the executive's identity being directly compromised. |


For more information, see [Predefined classifications](predefined-classification-rules-and-levels.md).

### New predefined classifications

The following predefined **Identity** classification rules were added to the critical assets list:

| Classification | Description |
| -------------- | ----------- |
| Widespread Local Admin on Servers | This rule applies to identities that are configured as local administrators on a high number of servers in the environment. |
| Widespread Local Admin on Workstations | This rule applies to identities that are configured as local administrators on a high number of workstations in the environment. |
| Widespread Local Admin on Servers and Workstations | This rule applies to identities that are configured as local administrators on a high number of both servers and workstations in the environment. **Note**: This rule logic relies on the predefined critical identity classifications "Widespread Local Admin on Servers" and "Widespread Local Admin on Workstations". |

For more information, see [Predefined classifications](predefined-classification-rules-and-levels.md).

### Overview dashboard (preview)

The updated Microsoft Security Exposure Management overview dashboard is now in preview. The dashboard consolidates signals from cloud resources and devices into a single, action-oriented view of exposure risk, organized around two core actions: **Resolve Now** and **Monitor Exposure**.

For more information, see [Start using Microsoft Security Exposure Management](get-started-exposure-management.md).

### New predefined classifications

The following predefined **SaaS application** classification rules were added to the critical assets list. These classifications require onboarding to Microsoft Defender for Cloud Apps.

| Classification | Description |
| -------------- | ----------- |
| Microsoft Entra ID | Core identity and access control plane for the tenant. Compromise can enable tenant-wide privilege escalation, persistent access, role manipulation, token abuse, application ownership takeover, and conditional access or policy tampering. |
| Microsoft Azure | Cloud infrastructure and management plane for workloads, networking, storage, and secrets. Compromise can result in full environment takeover, workload disruption, secret exposure, and governance/control-plane abuse. |
| Microsoft 365 Defender | Unified security operations and detection platform for identities, endpoints, email, and cloud apps. Compromise can blind detection, suppress or manipulate incidents and alerts, and interfere with security response actions. |
| Microsoft Intune | Endpoint management and compliance control plane for enterprise devices. Compromise can enable device reconfiguration, remote wipe/reset, BitLocker key access, policy tampering, and fleet-wide operational disruption. |
| Microsoft Dynamics 365 | Business-critical CRM and ERP platform containing customer, financial, operational, and service data. Compromise can lead to business-data exposure, process abuse, and high-impact operational disruption. |
| Microsoft Purview | Governance, compliance, and information protection platform for eDiscovery, DLP, labeling, and lifecycle controls. Compromise can cause severe compliance, legal, and regulatory impact through abuse of highly privileged governance capabilities. |
| Microsoft SharePoint Online | Enterprise content and collaboration backbone with tenant-wide access to sites, files, and document repositories. Compromise can enable bulk data exfiltration, ransomware-style impact, and widespread document exposure. |
| Microsoft Teams | Organization-wide collaboration and communication hub for chats, meetings, calls, and files. Compromise can enable surveillance, internal reconnaissance, lateral movement, and abuse of integrated SharePoint and Exchange content. |
| Microsoft Exchange Online | Primary organizational email and calendaring surface. Compromise can enable mailbox access, impersonation, phishing/BEC operations, message manipulation, and large-scale email data exfiltration. |
| Microsoft OneDrive | User and enterprise cloud file storage platform with scalable access to user content. Compromise can enable silent bulk exfiltration of sensitive files at scale. |
| Microsoft Office Online | Web-based productivity layer for document interaction for Word, Excel, and PowerPoint via browser workflows. Compromise can amplify access to enterprise documents through inherited SharePoint and OneDrive-connected data paths. |
| Microsoft Power Apps | Low-code application platform capable of connecting to business systems and data sources. Compromise can turn applications into access brokers and indirectly expose or manipulate critical connected systems. |
| Microsoft Power Automate | Workflow automation platform that enables headless data movement and orchestration for services and connectors. Compromise can support persistence, silent data transfer, and chaining throughout enterprise applications. |
| Microsoft Power BI | Business intelligence and reporting platform with access to strategic, financial, and operational analytics. Compromise can expose sensitive insight data, reports, and dashboards used for decision-making. |
| Microsoft Universal Print | Cloud print management service with service-specific printer and print-job permissions. Compromise is typically limited to a niche workload and has relatively low enterprise-wide security impact compared to core control planes. |

For more information, see [Predefined classifications](predefined-classification-rules-and-levels.md).

## May 2026

### New predefined classification

The following predefined **Device** classification rule was added to the critical assets list:

| Classification | Description |
| -------------- | ----------- |
| Senior Executive User Workstation | Devices in frequent use by users classified as senior executives. This rule logic relies on the predefined critical identity classifications whose names start with "Senior Executive". |

For more information, see [Predefined classifications](predefined-classification-rules-and-levels.md).

## April 2026

### New predefined classifications

The following predefined **Cloud resource** classification rule was added to the critical assets list:

| Classification | Description |
| -------------- | ----------- |
| APIs with Sensitive Data | This rule applies to APIs that contain sensitive data. This often indicates that the API is used for critical production workloads, and might require additional monitoring and protection.|

For more information, see [Predefined classifications](predefined-classification-rules-and-levels.md).

## March 2026

### Updates to Secure Score category calculations for increased accuracy

To improve accuracy and better protect organizational identities, some security recommendations categorized as **Cloud apps** recommendations are now considered identity‑related and grouped under the **Identity** category. While the total Secure Score remains unchanged, individual identity and app scores may change.

## January 2026

### New predefined classifications

The following predefined **Device** classification rule was added to the critical assets list:

| Classification | Description |
| -------------- | ----------- |
| WSUS Server | Centralized Windows update management service used to approve and distribute Microsoft software updates and security patches to Windows devices across an organization. Compromise could enable distribution of malicious updates or disruption of security patching, increasing exposure risk across managed Windows endpoints. |

For more information, see [Predefined classifications](predefined-classification-rules-and-levels.md).

### Cloud software inventory in vulnerability management (Preview)

Cloud software inventory is available in preview in vulnerability management in the Microsoft Defender portal.

This feature shows software in your cloud environment, application versions, assets where each software is installed, and related vulnerabilities. The software inventory helps you understand exposure, find vulnerable software, and prioritize vulnerability assessments.

Learn more about [vulnerability management](/security-exposure-management/vulnerability-management-integration).

## November 2025

### Integration of Microsoft Defender for Cloud’s CSPM capabilities and Microsoft Defender Vulnerability Management into Exposure Management

This major milestone brings comprehensive Microsoft Defender for Cloud’s posture capabilities (secure score, recommendations, and attack paths) and vulnerability management integration to Microsoft Security Exposure Management, which significantly expands the scope and capabilities of the platform.

**Unified portal experience** – All exposure management and vulnerability management functions are now accessible in the Microsoft Defender portal at security.microsoft.com under the Exposure Management section.

#### New unified recommendations catalog

**One place, full coverage** – You can now explore all Microsoft security recommendations in a single, streamlined experience that consolidates recommendations from:

- Microsoft secure score

- Microsoft Security Exposure Management recommendations catalog

- Microsoft Defender for Cloud

- Microsoft Defender for Vulnerability Management

**Organized by attack surfaces** – The catalog is divided into tabs based on attack surfaces:

- **Devices** - Including separate views for **Misconfigurations** and **Vulnerabilities**

- **Cloud** – Including multicloud (Azure, AWS, GCP), hybrid, and code recommendations

- **Identity** - Identity protection recommendations

- **SaaS Apps** - Software-as-a-Service application recommendations

- **Data** - Data security recommendations

**Enhanced capabilities** – Each tab incorporates unified fields and functionalities from previous experiences, providing consistent and efficient ways to discover, evaluate, and prioritize security recommendations.

#### Devices misconfigurations and vulnerabilities

**Separated workflows** – For the first time, misconfiguration recommendations are separated from vulnerabilities, recognizing they represent distinct workflows handled by different personas.

- **Devices Misconfigurations**: Configuration issues from Vulnerability Management, Microsoft Secure Score, and Security Exposure Management, contributing to Devices Secure Score.

- **Devices Vulnerabilities**: Software vulnerabilities from Vulnerability Management with the same exposure score and prioritization logic customers know, preserving familiar structure and workflows.

#### Cloud Resources with risk-based prioritization

**Risk-focused approach** – For the first time in the Defender portal, cloud recommendations are prioritized by risk, helping customers focus on what matters most. The view includes:

- Risk factors per asset for broader exposure context

- New risk-based scoring that weighs recommendations based on severity, asset context, and potential impact

- Enhanced recommendation data from Azure Security Center enriched with Exposure Management capabilities

#### New secure score integration

- **Side-by-side scoring** – Both Microsoft secure score and the newly introduced Cloud secure score are now available in Security Exposure Management, viewable side by side for comprehensive posture tracking.

#### Enhanced Attack Path analysis

- **Hybrid scenarios** – Attack paths now include hybrid scenarios spanning on-premises and cloud contexts, enabling security teams to identify attack vectors that traverse between environments. 

#### Microsoft Defender Vulnerability Management integration

**New home under Exposure Management** – Vulnerability Management experiences now reside in Exposure Management, including:

- Overview dashboard (focusing on vulnerabilities only)

- Vulnerabilities (weaknesses) with side-by-side Devices and Cloud views

- Remediation workflows

- Inventories and baseline assessment

- Vulnerability Management Recommendations migrated to unified recommendations page

- Event timeline accessible via events widget

**Unified vulnerability view** – Customers with both Defender for Cloud and Defender for Endpoint licenses can now see all vulnerabilities affecting their digital estate in one place.

Learn more about the [integration with Microsoft Vulnerability Management](vulnerability-management-integration.md) and the specific [changes to the Microsoft Vulnerability Management experience](/defender-vulnerability-management/whats-new-in-microsoft-defender-vulnerability-management#microsoft-defender-vulnerability-management-and-microsoft-security-exposure-management-integration).

#### Expanded Critical Asset Management

**Comprehensive coverage** – Critical asset management now covers the unified inventory spanning endpoints, cloud resources, and external assets discovered through third-party integrations.

For more information, see [Microsoft Defender Vulnerability Management integration with Exposure Management](vulnerability-management-integration.md).

### ServiceNow connector OAuth 2.0 authentication support

The ServiceNow data connector now supports OAuth 2.0 authentication in addition to Basic Authentication. This enhancement allows organizations to use modern authentication standards with client credentials flow, providing improved security through easier credential rotation and scoped authentication based on OAuth Application User roles.

For more information, see [ServiceNow data connector](ServiceNow-data-connector.md).

## September 2025

### Critical assets classified based on interaction with sensitive documents (Purview eDLP)

Microsoft Security Exposure Management now integrates with Microsoft Purview Endpoint Data Loss Prevention (eDLP) to automatically identify and classify critical assets based on their interaction with sensitive documents. This new capability introduces dynamic criticality reclassification where endpoints accessing high-sensitivity documents are automatically tagged as high criticality.

Key features include:

- **Dynamic reclassification**: Endpoints are automatically elevated to high criticality when accessing sensitive content
- **Automatic reversion**: Asset classification reverts to baseline after 5 consecutive days of inactivity with sensitive content
- **Out-of-the-box detection**: Built-in detection rules for three Purview Classifier Sensitive Information Types:
  - Azure Document DB Auth Key
  - Azure Redis Cache Connection String  
  - Azure Storage Account Key
- **Enhanced visibility**: Critical assets are surfaced across Microsoft Defender XDR experiences for improved security posture management

This integration provides the first offering to combine the experience between Purview and Microsoft Defender Portal for classifying critical assets and gathering important prebreach insights.

For more information, see [Predefined classifications](predefined-classification-rules-and-levels.md).
### Blast radius analysis

Blast radius analysis is an advanced graph visualization integrated into incident investigation experience. Built on the Microsoft Sentinel data lake and graph infrastructure, it generates an interactive graph showing possible propagation paths from the selected node to predefined critical targets scoped to the user’s permissions.

For more information, see [Blast radius analysis](/defender-xdr/investigate-incidents?branch=release-preview-sentinel-graph#blast-radius-analysis).

### New data connectors

We have added new data connectors for Wiz and Palo Alto Prisma. These connectors enable seamless integration of vulnerability and asset data from leading cloud security platforms into Microsoft Security Exposure Management, providing enhanced visibility and context for your environments.

For more information, see:

- [Wiz data connector](wiz-data-connector.md)
- [Palo Alto Prisma data connector](palo-alto-prisma-data-connector.md)

### New predefined classifications

The following predefined **Device** classification rules were added to the critical assets list:

| Classification | Description |
| -------------- | ----------- |
| SharePoint Server | The SharePoint server is responsible for secure content management, collaboration, and document sharing across teams. It hosts intranet portals and enterprise search within an organization. Compromise could lead to unauthorized access to sensitive information and disruption of content services. |
| Microsoft Entra ID Cloud Sync | The Microsoft Entra ID Cloud Sync agent is responsible for syncing on-premises directory data to the Microsoft Entra ID tenant using lightweight infrastructure. Compromise could disrupt identity synchronization, leading to authentication issues and potential security breaches. |

Microsoft Entra ID Cloud Sync has been introduced alongside Microsoft Entra ID Connect. While both support identity synchronization, Microsoft Entra ID Connect is designed for hybrid environments with on-premises Active Directory, whereas Microsoft Entra ID Cloud Sync offers a lightweight, cloud-native solution optimized for cloud-only setups.

Additionally, SharePoint device role is now available, introduced in response to recent vulnerability events. This role enhances tracking and management of SharePoint-related assets.

For more information, see [Predefined classification](predefined-classification-rules-and-levels.md).

### Migration from AzureAdConnectServer to EntraConnectServer

The legacy Azure AD Connect asset rule has been removed from Critical Assets. Its associated device role, AzureADConnectServer, will be deprecated in December 2025. Ensure all relevant custom rules are transitioned to use the new device role, EntraConnectServer, to maintain compliance and visibility.

For more information, see [Predefined classification](predefined-classification-rules-and-levels.md).

### Refined attack path experience

Cloud Attack Paths now reflect real, externally driven and exploitable risks that adversaries could use to compromise your organization, helping you cut through the noise and act faster. The paths now focus on external entry points and how attackers could progress through your environment reaching business-critical targets.

On-premises Attack Path now terminates automatically when they reach End Game assets (Domain Admins, Enterprise Admins, Administrators, or Domain Controllers). These assets provide full domain control if compromised. The visualization and prioritization of attack path risks for on-premises infrastructure provide consistent clarity, enabling security teams to focus on high-impact scenarios and reduce noise.

The changes bring greater clarity, focus, and prioritization empowering security teams to mitigate the most critical risks with confidence.

Read more about it in this blog: [Refining Attack Paths: Prioritizing Real-World, Exploitable Threats](https://techcommunity.microsoft.com/blog/securityexposuremanagement/refining-attack-paths-prioritizing-real-world-exploitable-threats/4454051)

For more information, see [Overview of attack paths](work-attack-paths-overview.md) and [Review attack paths](work-attack-paths-overview.md).

## May 2025

### Enhanced External Attack Surface Management integration with Exposure Management

This new integration allows you to incorporate detailed external attack surface data from Microsoft Defender External Attack Surface Management (MDEASM) into Exposure Management. This provides a comprehensive risk overview directly within the External Attack Surface initiative page, helping to identify and reduce external exposures more effectively. Additionally, it supports graph exploration, enabling users to analyze relationships between assets and vulnerabilities seamlessly.

For more information, see [External attack surface management initiative](external-attack-surface-management-initiative.md).

### Enhanced support for device groups scoping

The device groups scoping within Exposure Management has been expanded. This update enhances the existing capability to filter the list of affected devices based on your assigned scope by extending it to security metrics and exposed entities in recommendations. With this enhancement, initiative scores, metric progress, security events, and historical insights will now be calculated and displayed according to your specific user scope. As a result, the data presented, including on the Overview page, will be tailored to align with your designated scope.

We'll also support the device groups filter, which is already available in Microsoft Defender Vulnerability Management experiences. This filter enables end users to refine their view within their access scope, allowing them to focus on specific devices as needed. Once the filter is adjusted based on the user’s selection, all related data will be refreshed accordingly.

> [!NOTE]
> The device groups scoping capability applies only to data associated with Endpoint devices.

For more information, see [Review security initiatives](initiatives.md)

## March 2025

### New predefined classifications

The following predefined **Identity** classification rules were added to the critical assets list:

| Classification                     | Description                                                  |
| ---------------------------------- | ------------------------------------------------------------ |
| Senior Executive (Technology)      | This rule applies to identities classified as senior executives in the field of Technology. |
| Senior Executive (Finance)         | This rule applies to identities classified as senior executives in the field of Finance. |
| Senior Executive (Operations)      | This rule applies to identities classified as senior executives in the field of Operations. |
| Senior Executive (Marketing)   | This rule applies to identities classified as senior executives in the field of Marketing. |
| Senior Executive (Information)     | This rule applies to identities classified as senior executives in the field of Information. |
| Senior Executive (Execution)       | This rule applies to identities classified as senior executives in the field of Execution. |
| Senior Executive (Human Resources) | This rule applies to identities classified as senior executives in the field of Resources. |
| Security Operations Admin User              | This rule applies to security operations admin users that configure, manage, monitor, and respond to threats within the organization. |

For more information, see, [Predefined classifications](predefined-classification-rules-and-levels.md)

## February 2025

### New predefined classifications

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

### New documentation library for unified security operations in the Microsoft Defender portal

Find centralized documentation about [unified security operations in the Microsoft Defender portal](/unified-secops-platform/overview-unified-security). The Defender portal brings together the full capabilities of Microsoft Sentinel, Microsoft Defender XDR, Microsoft Security Exposure Management, and generative AI. Learn about the features and functionality available for unified security operations, and then start to plan your deployment.

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
 
For more information, see, [Review attack paths](work-attack-paths-overview.md)

### External data connectors

We have introduced new external data connectors to enhance data integration capabilities, allowing seamless ingestion of security data from other security vendors.  Data collected through these connectors is normalized within our exposure graph, enhancing your device inventory, mapping relationships, and revealing new attack paths for comprehensive attack surface visibility. These connectors help you to consolidate security posture data from various sources, providing a comprehensive view of your security posture.

For more information, see [Data connectors overview](overview-data-connectors.md).

### Discovery sources available in the inventory and attack surface map

The Device Inventory and Attack Surface Map now display the data sources for each discovered asset. This feature provides an overview of which tools or products reported each asset, including Microsoft and external connectors like Tenable or ServiceNow CMDB. In the inventory, use the **Discovery Sources** column to filter devices by reporting sources. In the **Attack Surface Map**, toggle the **Discovery Sources** view using the **Layers** option. You can also query **Discovery Sources** in the **Device Info** table via Advanced Hunting.

For more information on understanding data from external sources, see [Getting value from your data connectors](value-data-connectors.md)

### OT security initiative

The new OT security initiative equips practitioners with a powerful tool to identify, monitor, and mitigate risks across the OT environment, ensuring both operational reliability and safety. This initiative aims to identify devices across physical sites, assess their associated risks, and provide faster, more effective protection for OT systems.

For more information, see, [Review security initiatives](initiatives.md)

### Microsoft Security Exposure Management is now supported in Microsoft Defender unified role-based access control (RBAC)

Access control to Microsoft Security Exposure Management can now be managed using Microsoft Defender unified Role-Based Access Control (RBAC) permissions model with dedicated and granular permissions.

This new capability enables admins to grant their posture managers with access to Exposure Management data and experiences with the least privilege access approach rather than the Microsoft Azure Entra ID roles, which is still supported and can be used if needed.

To learn more about Microsoft Security Exposure Management access management using Microsoft Defender unified RBAC permissions model, see [Prerequisites and support](/security-exposure-management/prerequisites). 

To learn more about creating new custom roles in Microsoft Defender unified RBAC, see [Create custom roles in Microsoft Defender unified RBAC](/defender-xdr/create-custom-rbac-roles).

### Content versioning notifications

The new versioning feature in Microsoft Security Exposure Management offers proactive notifications about upcoming version updates, giving users advanced visibility into anticipated metric changes and their impact on their related initiatives. A dedicated side panel provides comprehensive details about each update, including the expected release date, What's new in Microsoft Security Exposure Management, current and new metric values, and any changes to related initiative scores. Additionally, users can share direct feedback on the updates within the platform, fostering continuous improvement and responsiveness to user needs.

For more information on exposure insights, see [Overview - Exposure insights](exposure-insights-overview.md)

### Exposure history for metrics

User can investigate metric changes by reviewing the asset exposure change details. From the initiative's **History** tab, by selecting a specific metric, you can now see the list of assets where exposure has been either added or removed, providing clearer insight into exposure shifts over time.

For more information, see, [Reviewing initiative history](exposure-insights-overview.md#reviewing-initiative-history)

### SaaS security initiative

The SaaS Security initiative delivers a clear view of your SaaS security coverage, health, configuration, and performance. Through metrics spanning multiple domains, it gives security managers a high-level understanding of their SaaS security posture.

For more information, see, [SaaS security initiative](/defender-cloud-apps/saas-security-initiative)

