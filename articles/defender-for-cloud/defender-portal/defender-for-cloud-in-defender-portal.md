---
title: Defender for Cloud in the Defender portal - Integration and Dashboard Overview
description: Learn about the integration of Microsoft Defender for Cloud in the Defender portal, including unified security management, dashboard features, and comprehensive cloud security insights.
author: dlanger
ms.author: dlanger
ms.topic: overview
ms.date: 09/03/2025
ms.service: defender-for-cloud
---

# What is Defender for Cloud in the Defender portal?

Microsoft Defender for Cloud is now fully integrated into the Defender portal, offering a unified and enhanced experience for managing cloud security. The new Cloud Security Dashboard provides comprehensive insights from both cloud and code environments, bringing together information that was previously only available in the Azure portal. With this seamless integration, users benefit from advanced security insights powered by the Microsoft Threat Protection suite.

The combined value of Defender workloads—like Defender for Endpoint, Defender for Identity, and others—comes from delivering comprehensive, integrated security across endpoints, identities, email, and cloud resources. This unified approach streamlines threat detection, correlates insights, and strengthens an organization's security posture. Powered by advanced AI and Microsoft's global threat intelligence, Defender solutions identify emerging risks faster and enable proactive defense against sophisticated attacks.

Cloud security insights are now included as part of Exposure Management, providing you with enhanced tools to identify and mitigate security risks more effectively. Key functionalities include:

- **Explore Initiatives** to track and manage your organization's cloud security goals and compliance requirements.
- **Vulnerability Management** to identify, assess, and remediate weaknesses in your cloud workloads.
- **Recommendations** for actionable guidance on improving your cloud security posture.
- **Attack maps** for a visual overview of your cloud assets and their security status, helping you understand relationships and exposure points.
- **Attack path analysis** to identify potential routes attackers could exploit and prioritize remediation efforts.
- **Cloud threat detection** within Incidents and Alerts workflows for real-time insights into suspicious activities.
- **Pre- and post-breach insights** to support comprehensive investigation and response.
- **Advanced hunting tools** for in-depth investigation of cloud threats and incidents.
- **Cloud Infrastructure Inventory** for full visibility into your multi-cloud and multi-pipeline estates, delivering resource-level insights across your environment.
- **Unified RBAC and Cloud Scoping** to streamline permission management, allowing you to efficiently manage access and assign roles within the Defender portal.

## Overview Dashboard - Your Central Hub

The Cloud overview dashboard is the new landing page for Microsoft Defender for Cloud in the Defender portal. It serves as the central hub for cloud security visibility, insights, and action, built with Cloud-Native Application Protection Platform (CNAPP) principles at its core. This dashboard gives security teams and workload owners a clear, actionable view of their cloud security status both pre- and post-breach, empowering them to understand their security posture, track progress over time, and take meaningful, immediate action, all from a single, unified experience. The overview dashboard also provides an at-scale view at the tenant-level or scope-based, helping users understand where to focus and how to drive effective security outcomes.

### Why the dashboard matters

As organizations scale their cloud environments, the need for a clear, actionable view of security status becomes critical. Customers have told us they want to know:

- "Am I more secure than yesterday?"
- "What should I focus on first?"
- "How do I show the value of Defender for Cloud to stakeholders?"

The overview dashboard answers these questions by providing a comprehensive, role-aware experience that supports both strategic oversight and tactical response.

### Who is the overview dashboard for?

The Overview Dashboard in Microsoft Defender for Cloud is designed with two core personas in mind. Each brings a unique perspective and set of responsibilities to cloud security—and the dashboard adapts to meet their needs.

#### Cloud Security Admins, Architects, and Engineers

These users are responsible for the big picture. They need to understand the security posture of the entire cloud environment, identify risks, and make informed decisions that protect the organization.

They use the dashboard to:

- Assess the overall cloud security status across environments
- Monitor critical security metrics and trends
- Identify and prioritize risks
- Serve as a central hub for visibility and decision-making

This persona benefits from the dashboard's high-level summaries, overtime tracking, and direct links to deeper insights like Exposure Management and Cloud Asset Inventory.

#### Workload Owners (Developers, DevOps, DevSecOps)

These users are closer to the code and infrastructure. They're responsible for specific workloads and need scoped, actionable insights to keep their areas secure.

They use the dashboard to:

- View security status based on their permissions and scope
- Identify and fix security issues in their workloads
- Track the progress of remediation efforts
- Use the dashboard as a landing page for daily operations

This persona benefits from workload-centric tiles, scoped filters, and actionable recommendations tailored to their domain.

### Dashboard controls

At the top of the dashboard, you'll find two key filters:

- **Scope Filter**: Choose the environment you want to view—tenant, subscription, or project. The dashboard adjusts based on your permissions.
- **Time Range**: Select 30 days, 3 months, or 6 months to view trends over time. This applies to all historical graphs and trend indicators.

### Dashboard components

#### Security at a glance

This section gives you a quick snapshot of your current security status:

- **Cloud Secure Score**: Your overall cloud security risk score with a trend indicator.
- **Threat Protection**: Number of alerts by severity.
- **Resource Coverage**: Number of protected resources by Defender for Cloud plans and their coverage status (Full, Partial, None).
- All cloud and code environments that are currently connected to Defender for Cloud are presented.

:::image type="content" source="../media/defender-portal-dashboard/overview-highlights.png" alt-text="Screenshot of dashboard highlights":::

#### Top actions

This section provides prioritized, actionable recommendations to help you reduce risk quickly. It helps you understand where to start and is designed to guide your next steps and reduce the attack surface efficiently. It highlights:

- **Critical Recommendations**: Focus on the most critical recommendations found in your environment.
- **High-Severity Incidents**: Investigate active alerts.
- **Attack Paths**: Understand potential lateral movement.
- **Connectivity Issues**: Identify connectivity issues preventing your connected cloud environments from being fully protected.

![Top Actions](../media/defender-portal-dashboard/top-actions.png)

#### Trends over time

Track how your security posture and threat detection evolve over time:

- **Security Posture**: View over time of the new cloud secure score in addition to recommendations by severity.

![Security Posture](../media/defender-portal-dashboard/security-posture.png)

- **Threat Detection**: View trends in the number of alerts over time, categorized by severity.

![Threat Detection](../media/defender-portal-dashboard/threat-detection.png)

Each graph updates daily and reflects the selected time range. Hover over data points to see daily breakdowns.

#### Workload insights (powered by CNAPP)

Dive into security insights by workload type. Each tile in this section surfaces insights from Microsoft's CNAPP.

Workloads include:

- VMs
- Containers
- APIs
- Data
- DevOps
- AI

Each tile acts as a mini dashboard, showing top issues, protection coverage, and links to detailed views—no sensitive or secret information is displayed. This helps teams focus on what matters most for each workload.

:::image type="content" source="../media/defender-portal-dashboard/api.png" alt-text="Screenshot of API widgits":::

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

## Core capabilities

| Capability                           | Description                                               |
|---------------------------------------|-----------------------------------------------------------|
| Cloud Security Posture Management     | Monitor and improve cloud security posture across environments |
| Threat Detection                      | Detect and respond to cloud-based threats                 |
| Vulnerability Management              | Identify and remediate vulnerabilities in cloud workloads |
| Attack Path Analysis                  | Visualize potential lateral movement paths                |
| Advanced Hunting                      | Use KQL to investigate cloud signals                      |
| Integration with Defender XDR         | Unified incident management and alert correlation         |

## Next steps

- [Get started with the Defender portal experience](getting-started-defender-portal.md)
- [Explore the Complete overview - four-column guide](defender-portal-four-column-overview.md)
- [Explore the Cloud Infrastructure Dashboard](../cloud-infrastructure-dashboard.md)
- [Configure Cloud Scopes and Unified RBAC](../cloud-scopes-unified-rbac.md)
- [Review cloud infrastructure assets](../asset-inventory.md?pivots=defender-portal)
- [Investigate attack paths in the Defender portal](../concept-attack-path.md?pivots=defender-portal)
- [Set up vulnerability management](../auto-deploy-vulnerability-assessment.md?pivots=defender-portal)
- [Configure enhanced email notifications](../configure-email-notifications.md?pivots=defender-portal)
- [Compare Azure portal vs Defender portal features](../azure-portal-vs-defender-portal-comparison.md)
