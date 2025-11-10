---
title: Overview of Defender for Cloud in Defender portal
description: Comprehensive overview of Microsoft Defender for Cloud in the Defender portal, including navigation hub, dashboard features, and unified security management capabilities.
author: dlanger
ms.author: dlanger
ms.topic: overview
ms.date: 11/10/2025
ms.service: defender-for-cloud
---

# Defender for Cloud in Defender portal (preview)

> [!IMPORTANT]
> Microsoft Defender for Cloud is expanding to the Defender portal to provide a unified security experience across cloud and code environments. As part of this expansion, some features are now available in the Microsoft Defender Portal, and additional capabilities will be added to the Defender portal over time.
> 
> This change is designed to:
> - Unlock new cloud and posture management experiences.
> - Provide deep integration with other Microsoft security services.
> - Empower security teams with streamlined workflows by bringing all tools together in one portal.
> 
> To identify documentation specific for the Defender Portal, look for the portal entry point at the top of the article. This pivot indicates whether the content applies to the Defender portal or the Azure portal.
> 
> Our documentation will be continuously updated to reflect these changes, so check back regularly for the latest guidance and feature availability.
> 
> Review the [known limitations](known-limitations.md) article to understand current gaps during the preview phase.

This article provides a comprehensive overview of Microsoft Defender for Cloud's integration with the Defender portal, covering key features, benefits, and capabilities available in this unified security experience.

## Overview

Microsoft Defender for Cloud (MDC) is now deeply integrated into the Defender portal and part of the broader Microsoft Security eco-system. With threat protection already deeply embedded into the Defender portal, this integration adds posture management—bringing together a complete cloud security solution in one unified experience. This native-integration eliminates silos so security teams can see and act on threats across all cloud, hybrid and code environments - all from one place.

## How to get started?

The experience is available for Defender for Cloud customers with at least one paid plan. In the first phase, the journey for new customer still start in the Azure portal.

To [enable the preview](enable-preview-features.md)

Read the [known limitations](known-limitations.md)

## What are the key values and benefits for security personas?

**Unified cloud security experience** – Cloud security is now fully integrated into the Microsoft Defender portal at security.microsoft.com, giving security teams a single, unified view across all workloads. This eliminates the need to switch between tools and portals, enabling SOC teams to work more efficiently with complete security posture visibility across workloads. The new cloud-agnostic integration supports Azure, AWS, GCP, and other platforms in a single interface, making it ideal for hybrid and multi-cloud organizations seeking comprehensive exposure management too.

**[Cloud security dashboard](../cloud-infrastructure-dashboard.md?pivots=defender-portal)** - This new cloud security dashboard centralizes both posture management and threat protection, giving security personas an overview of their environment. It also highlights the top improvement actions for risk reduction, workload-specific views with security insights and includes tools to track security progress over time out of the box. New unified dashboard consolidates Security Posture, Defender coverage, cloud assets, health data, and exposure insights across Azure, AWS, and GCP environments.

**[Cloud asset inventory](../asset-inventory.md?pivots=defender-portal)** – A new centralized inventory offers a comprehensive view of cloud and code assets across Azure, AWS, and GCP. Assets are categorized by workload, criticality, and coverage, with integrated health data, device actions, and risk signals. Information security and SOC teams can easily access resource-specific views, exposure map, and metadata to address security recommendations and respond quickly to threats.

**[Unified cloud security posture capabilities](../concept-attack-path.md?pivots=defender-portal)** – We are unifying all the cloud security posture management (CSPM) capabilities into Microsoft Security Exposure Management (MSEM). Security personas can now view secure scores, prioritized recommendations, attack paths and vulnerabilities —all in a single pane of glass, empowering them to reduce risk and get an holistic view of all their posture end-to-end including devices, identities, SaaS apps and data. For more information, see [What's new in Microsoft Security Exposure Management](/security-exposure-management/whats-new).

**[Granular access management](../cloud-scopes-unified-rbac.md?pivots=defender-portal)** – Security teams can now provide targeted access to security content, so only relevant users see necessary information. This allows users to view security insights without direct resource permissions, enhancing operational security and compliance. Using a new cloud scopes capability, cloud accounts like Azure subscriptions, AWS accounts, and GCP projects can be organized into logical groups for improved data pivoting and RBAC, supporting segmentation by business unit, region, or workload with persistent filtering across dashboards and workflows.

The combined value of Defender workloads—like Defender for Endpoint, Defender for Identity, and others—comes from delivering comprehensive, integrated security across endpoints, identities, email, and cloud resources. This unified approach streamlines threat detection, correlates insights, and strengthens an organization's security posture. Powered by advanced AI and Microsoft's global threat intelligence, Defender solutions identify emerging risks faster and enable proactive defense against sophisticated attacks.

Cloud security insights are now included as part of Exposure Management, providing you with enhanced tools to identify and mitigate security risks more effectively. Key functionalities include:

**Explore Initiatives** to track and manage your organization's cloud security goals and compliance requirements.

**[Vulnerability Management](../auto-deploy-vulnerability-assessment.md?pivots=defender-portal)** to identify, assess, and remediate weaknesses in your cloud workloads.

**Recommendations** for actionable guidance on improving your cloud security posture.

**Attack maps** for a visual overview of your cloud assets and their security status, helping you understand relationships and exposure points.

**[Attack path analysis](../concept-attack-path.md?pivots=defender-portal)** to identify potential routes attackers could exploit and prioritize remediation efforts.

**Cloud threat detection** within Incidents and Alerts workflows for real-time insights into suspicious activities.

**Pre-breach and post-breach insights** to support comprehensive investigation and response.

**Advanced hunting tools** for in-depth investigation of cloud threats and incidents.

**[Cloud Infrastructure Inventory](../asset-inventory.md?pivots=defender-portal)** for full visibility into your multi-cloud and multi-pipeline estates, delivering resource-level insights across your environment.

**[Unified RBAC and Cloud Scoping](../cloud-scopes-unified-rbac.md?pivots=defender-portal)** to streamline permission management, allowing you to efficiently manage access and assign roles within the Defender portal.

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

## Navigation Hub - Quick Access to Key Capabilities

Navigate quickly to Microsoft Defender for Cloud's key capabilities and features in the unified Microsoft Defender portal.

:::row:::
   :::column span="":::
      ### Getting Started

      - [Microsoft Defender for Cloud](../defender-for-cloud-introduction.md)
      - [Getting started in the Defender portal](getting-started-defender-portal.md)
      - [Cost calculator](../cost-calculator.md)
      - [Planning and operations guide](../defender-for-cloud-planning-and-operations-guide.md)
   :::column-end:::
   :::column span="":::
      ### Security Posture Management

      - [Secure Score overview](../secure-score-access-and-track.md?pivots=defender-portal)
      - [Attack path analysis](../concept-attack-path.md?pivots=defender-portal)
      - [Cloud Infrastructure Dashboard](../cloud-infrastructure-dashboard.md?pivots=defender-portal)
      - [Asset Inventory](../asset-inventory.md?pivots=defender-portal)
      - [Cloud Scopes & RBAC](../cloud-scopes-unified-rbac.md?pivots=defender-portal)
      - [Vulnerability Management](../auto-deploy-vulnerability-assessment.md?pivots=defender-portal)
      - [Email notifications](../configure-email-notifications.md?pivots=defender-portal)
      - [Data security posture management](../concept-data-security-posture.md)
   :::column-end:::
   :::column span="":::
      ### Threat Detection & Response

      - [Attack Path Management](../how-to-manage-attack-path.md?pivots=defender-portal)
      - [Security alerts overview](../alerts-overview.md)
      - [Microsoft Defender XDR integration](../concept-integration-365.md)
      - [Alert validation](../alert-validation.md)
      - [Microsoft Security Copilot](../copilot-security-in-defender-for-cloud.md)
      - [Automated response](../continuous-export.md)
   :::column-end:::
:::row-end:::

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
- [Explore the Cloud Infrastructure Dashboard](../cloud-infrastructure-dashboard.md)
- [Configure Cloud Scopes and Unified RBAC](../cloud-scopes-unified-rbac.md)
- [Review cloud infrastructure assets](../asset-inventory.md?pivots=defender-portal)
- [Investigate attack paths in the Defender portal](../concept-attack-path.md?pivots=defender-portal)
- [Set up vulnerability management](../auto-deploy-vulnerability-assessment.md?pivots=defender-portal)
- [Configure enhanced email notifications](../configure-email-notifications.md?pivots=defender-portal)
- [Compare Azure portal vs Defender portal features](../azure-portal-vs-defender-portal-comparison.md)
