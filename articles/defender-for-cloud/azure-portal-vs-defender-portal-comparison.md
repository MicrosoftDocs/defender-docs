---
title: Azure portal vs Defender portal feature comparison
description: Compare Microsoft Defender for Cloud features and capabilities between the Azure portal and Defender portal experiences to understand the enhanced functionality available in each platform.
author: dlanger
ms.author: dlanger
ms.topic: conceptual
ms.date: 10/16/2025
ms.service: defender-for-cloud
---

# Azure portal vs Defender portal feature comparison

> [!NOTE]
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
> Review the known limitations article to understand current gaps during the preview phase.

This article provides a comprehensive comparison of Microsoft Defender for Cloud features and capabilities between the Azure portal and Defender portal experiences. Understanding these differences helps you choose the right experience for your security operations and take advantage of enhanced capabilities available in the Defender portal.

## Overview of experiences

| Portal | Description | Primary Use Cases |
|--------|-------------|-------------------|
| **Azure portal** | Traditional Azure-integrated experience | Resource management, basic security posture, Azure-focused workflows |
| **Defender portal** | NextGen unified security experience | Advanced threat hunting, cross-cloud security, unified incident response |

## Feature comparison matrix

### Dashboard and overview

| Feature | Azure Portal | Defender Portal | Enhanced Capabilities in Defender Portal |
|---------|--------------|-----------------|----------------------------------------|
| **Security Overview** | Basic secure score and recommendations | [Cloud Infrastructure Dashboard](cloud-infrastructure-dashboard.md) | Unified multi-cloud visibility, threat protection insights, Exposure Management integration |
| **Asset Inventory** | Basic resource listing | [Enhanced Asset Management](asset-inventory.md) | Workload-specific tabs (VMs, Data, Containers, AI, API, DevOps, Identity, Serverless), advanced filtering |
| **Secure Score** | Azure-focused scoring | Contextual Cloud Secure Score | Risk-based scoring with exposure context, cross-cloud calculation |
| **Alerts Dashboard** | Basic alert listing | Integrated with Microsoft Security | Cross-solution correlation, unified incident management |

### Attack path analysis

| Feature | Azure Portal | Defender Portal | Enhanced Capabilities in Defender Portal |
|---------|--------------|-----------------|----------------------------------------|
| **Attack Paths** | [Basic attack path visualization](concept-attack-path.md) | [Advanced Attack Path Analysis](concept-attack-path.md) | Choke point identification, cross-solution correlation, historical tracking |
| **Path Filtering** | Limited filtering options | Enhanced filtering by risk, asset type, remediation status, time frame | Advanced query capabilities, persistent filters |
| **Path Correlation** | Azure-focused paths | Cross-cloud and cross-solution paths | Integration with endpoint data, identity insights |
| **Remediation Tracking** | Basic recommendations | Integrated remediation workflows | Incident correlation, progress tracking across solutions |

### Vulnerability management

| Feature | Azure Portal | Defender Portal | Enhanced Capabilities in Defender Portal |
|---------|--------------|-----------------|----------------------------------------|
| **Vulnerability Scanning** | [Basic vulnerability assessment](auto-deploy-vulnerability-assessment.md) | [Enhanced Vulnerability Management](auto-deploy-vulnerability-assessment.md) | Risk-based prioritization, exposure context, cross-solution insights |
| **Vulnerability Dashboard** | Simple vulnerability list | Risk-prioritized vulnerability insights | Integration with threat intelligence, exposure scoring |
| **Remediation Guidance** | Basic recommendations | Contextual remediation with risk impact | Business context, attack path integration |
| **Reporting** | Azure-focused reports | Unified vulnerability reporting | Cross-cloud visibility, executive dashboards |

### Access management and scoping

| Feature | Azure Portal | Defender Portal | Enhanced Capabilities in Defender Portal |
|---------|--------------|-----------------|----------------------------------------|
| **Role-Based Access** | Azure RBAC only | [Unified RBAC](cloud-scopes-unified-rbac.md) | Cross-solution permissions, cloud-aware scoping |
| **Resource Scoping** | Azure subscription/resource group based | [Cloud Scopes](cloud-scopes-unified-rbac.md) | Business-aligned scoping, cross-cloud environments |
| **Permission Management** | Separate per-service configuration | Centralized permissions management | Single pane for multi-solution access |
| **Filtering** | Basic Azure filters | Advanced scope-based filtering | Persistent filtering, workload-context aware |

### Notifications and integration

| Feature | Azure Portal | Defender Portal | Enhanced Capabilities in Defender Portal |
|---------|--------------|-----------------|----------------------------------------|
| **Email Notifications** | [Basic alert notifications](configure-email-notifications.md) | [Enhanced Notifications with Cloud Scopes](configure-email-notifications.md) | Granular control, organizational structure alignment |
| **SIEM Integration** | Basic data export | Enhanced data export with correlation | Cross-solution data correlation, unified schema |
| **Incident Management** | Azure-focused incidents | Unified incident management | Cross-solution correlation, automated workflows |
| **API Access** | Azure REST APIs | Unified security APIs | Cross-solution data access, enhanced querying |

### Advanced analytics

| Feature | Azure Portal | Defender Portal | Enhanced Capabilities in Defender Portal |
|---------|--------------|-----------------|----------------------------------------|
| **Threat Hunting** | Limited to Azure data | Cross-solution threat hunting | Unified data lake, advanced query capabilities |
| **Analytics Rules** | Azure-specific rules | Unified analytics across solutions | Cross-solution correlation rules |
| **Investigation** | Basic Azure resource investigation | Advanced cross-solution investigation | Timeline analysis, entity correlation |
| **Response Actions** | Limited to Azure actions | Unified response capabilities | Cross-solution automated response |

### Exposure management

| Feature | Azure Portal | Defender Portal | Enhanced Capabilities in Defender Portal |
|---------|--------------|-----------------|----------------------------------------|
| **Risk Assessment** | Basic compliance scoring | Comprehensive Exposure Management | Risk-based prioritization, attack surface analysis |
| **Initiative Management** | Not available | Security Initiatives dashboard | Coordinated security programs, progress tracking |
| **Recommendations** | Basic security recommendations | Risk-based recommendations | Exposure context, business impact assessment |
| **Score History** | Limited historical data | Comprehensive score trending | 6-month historical analysis, trend insights |

## Navigation and user experience

### Azure portal navigation

- Integrated within Azure portal structure
- Follows Azure resource management patterns
- Azure-centric terminology and workflows
- Limited cross-cloud visibility

### Defender portal navigation

- Dedicated security-focused navigation
- Unified security terminology
- Cross-solution integration points
- Enhanced filtering and scoping

## When to use each experience

### Use Azure portal when:

- Managing Azure-specific resources and configurations
- Working primarily within Azure ecosystem
- Need tight integration with Azure resource management
- Performing basic security posture assessments

### Use Defender portal when:

- Managing multi-cloud security environments
- Requiring advanced threat hunting capabilities
- Need unified incident response across solutions
- Working with complex attack path analysis
- Managing enterprise-scale security operations
- Requiring granular access control with business alignment

## Migration considerations

### Transitioning to Defender portal

1. **Gradual Adoption**: Start with enhanced features like attack paths and asset management
2. **Training**: Familiarize teams with new navigation and enhanced capabilities
3. **Access Control**: Configure cloud scopes and unified RBAC for your organization
4. **Integration**: Update SIEM and automation tools to leverage enhanced APIs

### Maintaining hybrid usage

- Both experiences can be used simultaneously
- Zone pivots in documentation provide seamless switching
- Data and configurations are synchronized between experiences
- Choose the best experience for specific use cases

## Feature roadmap

The Defender portal represents the future direction for Microsoft Defender for Cloud, with ongoing enhancements including:

- Enhanced cross-solution correlation
- Advanced AI-powered analytics
- Expanded cloud scope capabilities
- Deeper integration with Microsoft Security ecosystem

## Next steps

- [Get started with Defender for Cloud in the Defender portal](defender-portal/getting-started-defender-portal.md)
- [Explore the Cloud Infrastructure Dashboard](cloud-infrastructure-dashboard.md)
- [Configure Cloud Scopes and Unified RBAC](cloud-scopes-unified-rbac.md)
- [Set up Enhanced Attack Path Analysis](concept-attack-path.md)
- [Learn about Enhanced Asset Management](asset-inventory.md)

## Related articles

- [What is Defender for Cloud in the Defender portal?](defender-portal/defender-for-cloud-defender-portal.md)
- [Cloud Infrastructure Overview Dashboard](cloud-infrastructure-dashboard.md)
- [Cloud Scopes and Unified RBAC](cloud-scopes-unified-rbac.md)
- [Attack Path Analysis](concept-attack-path.md)
- [Asset Inventory](asset-inventory.md)
