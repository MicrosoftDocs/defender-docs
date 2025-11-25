---
title: Azure portal vs Defender portal feature comparison
description: Compare Microsoft Defender for Cloud features and capabilities between the Azure portal and Defender portal experiences to understand the enhanced functionality available in each platform.
author: dlanger
ms.author: dlanger
ms.topic: article
ms.date: 10/16/2025
ms.service: defender-for-cloud
---

# Azure portal vs Defender portal feature comparison

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
> Review the [known limitations](defender-portal/known-limitations.md) article to understand current gaps during the preview phase.

This article provides a comprehensive comparison of Microsoft Defender for Cloud features and capabilities between the Azure portal and Defender portal experiences. Understanding these differences helps you choose the right experience for your security operations and take advantage of enhanced capabilities available in the Defender portal.

## Feature comparison matrix

| Feature name | Azure portal | Defender portal |
|-------------|--------------|-----------------|
| **Security recommendations** | Yes | Yes - Integrated into Exposure Management<br><br>**Note**: In the Defender portal, some recommendations that previously appeared as a single aggregated item now display as multiple individual recommendations. |
| **Asset inventory** | Yes | Yes |
| **Secure score** | Yes | Yes - New risk-based secure score |
| **Data visualization and reporting with Azure Workbooks** | Yes | No |
| **Data exporting** | Yes | No |
| **Workflow automation** | Yes | No |
| **Tools for remediation (quick fixes)** | Yes | No |
| **Microsoft Cloud Security Benchmark** | Yes | Partial - Security recommendations appear but security policies management is only in Azure. You can see the results in the Defender portal. |
| **AI security posture management** | Yes | Yes |
| **Agentless VM vulnerability scanning** | Yes | Yes |
| **Agentless VM secrets scanning** | Yes | Yes |
| **Attack path analysis** | Yes | Yes - Integrated into Attack Paths experience in Exposure Management |
| **Risk prioritization** | Yes | Yes |
| **Risk hunting with security explorer** | Yes | No |
| **Code-to-cloud mapping for containers** | Yes | Yes |
| **Code-to-cloud mapping for IaC** | Yes | Yes |
| **PR annotations** | Yes | No |
| **Internet exposure analysis** | Yes | Yes |
| **External attack surface management** | Yes | Yes |
| **Regulatory compliance assessments** | Yes | Partial - Security recommendations appears but security policies management only in Azure |
| **ServiceNow Integration** | Yes | No |
| **Critical assets protection** | Yes | Yes |
| **Governance to drive remediation at scale** | Yes | No |
| **Data security posture management (DSPM)** | Yes | Yes |
| **Agentless discovery for Kubernetes** | Yes | Yes |
| **Custom Recommendations** | Yes | No |
| **Agentless code-to-cloud containers vulnerability assessment** | Yes | Yes |
| **API security posture management** | Yes | Yes |

## Next steps

- [Explore the Cloud overview dashboard](cloud-infrastructure-dashboard.md)
- [Configure Cloud scopes and Unified RBAC](cloud-scopes-unified-rbac.md)
- [Review cloud assets](asset-inventory.md?pivots=defender-portal)
