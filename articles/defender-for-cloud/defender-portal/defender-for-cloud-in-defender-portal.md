---
title: Defender for Cloud in the Defender portal
description: Learn about the integration of Microsoft Defender for Cloud in the Defender portal, including unified security management and dashboard features.
author: dlanger
ms.author: dlanger
ms.topic: overview
ms.date: 09/03/2025
ms.service: defender-for-cloud
---

# What is Defender for Cloud in the Defender portal?

Microsoft Defender for Cloud is now fully integrated into the Defender portal, offering a unified and enhanced experience for managing cloud security. The new Cloud Security Dashboard provides comprehensive insights from both cloud and code environments, bringing together information that was previously only available in the Azure portal. With this seamless integration, users benefit from advanced security insights powered by the Microsoft Threat Protection suite.

The combined value of Defender workloads—like Defender for Endpoint, Defender for Identity, and others—comes from delivering comprehensive, integrated security across endpoints, identities, email, and cloud resources. This unified approach streamlines threat detection, correlates insights, and strengthens an organization’s security posture. Powered by advanced AI and Microsoft’s global threat intelligence, Defender solutions identify emerging risks faster and enable proactive defense against sophisticated attacks.

Cloud security insights are now included as part of Exposure Management, providing you with enhanced tools to identify and mitigate security risks more effectively. Key functionalities include:

- **Explore Initiatives** to track and manage your organization’s cloud security goals and compliance requirements.
- **Vulnerability Management** to identify, assess, and remediate weaknesses in your cloud workloads.
- **Recommendations** for actionable guidance on improving your cloud security posture.
- **Attack maps** for a visual overview of your cloud assets and their security status, helping you understand relationships and exposure points.
- **Attack path analysis** to identify potential routes attackers could exploit and prioritize remediation efforts.
- **Cloud threat detection** within Incidents and Alerts workflows for real-time insights into suspicious activities.
- **Pre- and post-breach insights** to support comprehensive investigation and response.
- **Advanced hunting tools** for in-depth investigation of cloud threats and incidents.
- **Cloud Infrastructure Inventory** for full visibility into your multi-cloud and multi-pipeline estates, delivering resource-level insights across your environment.
- **Unified RBAC and Cloud Scoping** to streamline permission management, allowing you to efficiently manage access and assign roles within the Defender portal.

## NextGen Portal features

The enhanced Defender portal experience introduces several advanced capabilities:

### Cloud Infrastructure Overview Dashboard
Access comprehensive cloud security insights through the [Cloud Infrastructure Overview Dashboard](../cloud-infrastructure-dashboard.md), which provides:
- Unified visibility across Azure, AWS, and GCP environments
- Security posture trends and threat protection alerts
- Workload-specific insights with enhanced filtering capabilities
- Integration with Exposure Management for risk-based prioritization

### Cloud Scopes and Unified RBAC
Manage granular access control with [Cloud Scopes and Unified RBAC](../cloud-scopes-unified-rbac.md):
- Organize cloud resources by business value or operational structure
- Set specific access permissions for each group
- Apply persistent filtering across dashboards and experiences
- Streamline permission management across multi-cloud environments

### Enhanced Asset Management
The [Assets → Cloud Infrastructure](../asset-inventory.md?pivots=defender-portal) experience provides:
- Workload-specific views (VMs, Data, Containers, AI, API, DevOps, Identity, Serverless)
- Contextual health data and device actions integration
- Risk factor analysis and scoping filters
- Seamless integration with Exposure Management workflows

### Advanced Attack Path Analysis
Enhanced [attack path capabilities](../concept-attack-path.md?pivots=defender-portal) include:
- Choke points identification for focused mitigation efforts
- Advanced filtering by risk level, asset type, and remediation status
- Historical tracking and cross-solution correlation
- Integration with Microsoft Defender XDR incident workflows

### Comprehensive Vulnerability Management
Access vulnerability insights through [enhanced vulnerability management](../auto-deploy-vulnerability-assessment.md?pivots=defender-portal):
- Centralized vulnerability dashboard (Vulnerability Management → Overview → Cloud tab)
- Risk-based prioritization and enhanced filtering
- Integration with cloud asset inventory and attack path analysis

## Core capabilities

| Capability                           | Description                                               |
|---------------------------------------|-----------------------------------------------------------|
| Cloud Security Posture Management     | Monitor and improve cloud security posture across environments |
| Threat Detection                      | Detect and respond to cloud-based threats                 |
| Vulnerability Management              | Identify and remediate vulnerabilities in cloud workloads |
| Attack Path Analysis                  | Visualize potential lateral movement paths                |
| Advanced Hunting                      | Use KQL to investigate cloud signals                      |
| Integration with Defender XDR         | Unified incident management and alert correlation         |

## Microsoft Defender portal ecosystem

The Defender for Cloud overview dashboard is part of the broader Microsoft Defender portal ecosystem, which provides a unified security operations experience across multiple Microsoft security solutions. The portal combines protection, detection, investigation, and response capabilities across your entire organization in a central location.

### Integrated security solutions

The Microsoft Defender portal brings together multiple security services to provide comprehensive protection:

- **Microsoft Defender XDR**: Correlates signals from various Microsoft security solutions to help security teams investigate and respond to attacks through unified experiences for incidents, alerts, hunting, and threat analytics.
- **Microsoft Security Copilot**: AI-powered security assistant that helps summarize incidents, analyze threats, generate KQL queries, and provide guided responses to security events.
- **Unified search and notifications**: Global search across all entities and centralized notifications for important security events and updates.
- **Cross-service correlation**: Automatic correlation of alerts and incidents across cloud resources, devices, and identities for complete attack visibility.

### Enhanced investigation capabilities

When using Defender for Cloud within the Microsoft Defender portal, you gain access to enhanced investigation features:

- **Attack story visualization**: See how cloud resources fit into the broader attack narrative alongside endpoint, identity, and email security events.
- **Advanced hunting**: Use KQL queries to hunt across cloud audit events, process events, and security signals from all connected Microsoft security services.
- **Incident correlation**: Defender for Cloud alerts are automatically correlated with incidents from other Microsoft security solutions, providing comprehensive context for investigations.

Additionally, Defender for Cloud integrates with Microsoft Exposure Security Management, enabling organizations to proactively identify, assess, and remediate exposure risks across their cloud environments. This integration provides comprehensive visibility into vulnerabilities, misconfigurations, and security gaps, empowering security teams to prioritize remediation efforts based on risk and potential impact. By leveraging exposure insights alongside threat detection and incident response capabilities, organizations can strengthen their overall security posture and reduce the likelihood of successful attacks.

### Microsoft Defender XDR integration

Defender for Cloud is deeply integrated with Microsoft Defender XDR, providing:

- **Unified incident management**: All Defender for Cloud incidents appear in the Microsoft Defender XDR incident queue with full correlation capabilities.
- **Alert synchronization**: Status changes are synchronized between Defender for Cloud and Microsoft Defender XDR.
- **Cloud asset visibility**: Cloud resources appear as first-class entities in incident investigations, with dedicated asset pages and detailed activity timelines.
- **Unified API access**: Export security data from all integrated services through a single Microsoft Defender XDR API.

## Next steps

- [Explore the Cloud Infrastructure Overview Dashboard](../cloud-infrastructure-dashboard.md)
- [Configure Cloud Scopes and Unified RBAC](../cloud-scopes-unified-rbac.md)
- [Review cloud infrastructure assets](../asset-inventory.md?pivots=defender-portal)
- [Investigate attack paths in the Defender portal](../concept-attack-path.md?pivots=defender-portal)
- [Set up vulnerability management](../auto-deploy-vulnerability-assessment.md?pivots=defender-portal)
- [Configure enhanced email notifications](../configure-email-notifications.md?pivots=defender-portal)
- [Get started with the Defender portal experience](getting-started-defender-portal.md)
