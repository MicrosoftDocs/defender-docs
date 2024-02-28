---
title: Microsoft Security Exposure Management
description: Microsoft Security Exposure Management Overview
author: mjosephym
ms.author: v-mjosephy
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 01/09/2024
---


# What is Microsoft Security Exposure Management

Microsoft Security Exposure Management provides a unified view of your organization’s security posture and threat exposure information across your organizational workloads. In increasingly complex environments that combine legacy and modern apps, and hybrid/cloud environments, the organizational attack surface grows.

[!INCLUDE [prerelease](../../includes/prerelease.md)]

With Security Exposure Management eXtended Security Posture Management (XSPM) and exposure management tools, your organization has a means to identify and mitigate attack risks across your organization in one place. It manages continuous security posture improvement, systemically, while considering business priorities. In addition, it provides a consolidated view of your organization’s assets and exposure insights, identifying potential attack paths, and measures the maturity of security programs.

Security Exposure Management manages posture and exposure risk by building on your existing products and workloads. It consolidates security posture information and insights from domain specific products. It builds on your existing Security workloads including:

- Microsoft Defender for Endpoint (MDE)
- Microsoft Defender for Identity (MDI)
- Microsoft Defender for Cloud Apps (MDA)
- Microsoft Defender for Office (MDO)
- Microsoft Defender for IoT (MDIOT)
- Microsoft Secure Score  
- Microsoft Defender Vulnerability Management  
- Defender for Cloud Security Posture Management (CSPM) 
- Microsoft Entra ID  
- External Attack Surface Management

Security Exposure Management elevates workload specific experiences by incorporating advanced cross-workload analysis. It provides visibility into exposure across all security products. Security Exposure Management takes data from your existing workloads, and uses it to create actionable ways to automate the identification of critical organizational assets and advanced attack path management. Workload data contributes to metrics, recommendations, and initiatives that allow your security team to understand and address threats to these assets from an attacker's perspective.

## Address insights

Security Exposure Management determines potential threats and provides a means to address them proactively. It supports your organization through:

|Capability |Description |Get Started |
|---------|---------|---------|
| **Comprehensive exposure visibility** | The platform provides a single view of exposure across all security products, giving security managers a holistic understanding of their organization’s risk profile. | [Review organizational exposure](review-organizational-exposure.md)|
| **Drill-down capabilities** | Security managers can drill down into specific security programs or threats to see how exposed they are in that segment. Examining segments individually allows security managers to focus their remediation efforts on the areas of greatest risk based on business context and data. | [Improve security insights with exposure insights overview](exposure-insights-overview.md) |
|**Actionable recommendations** | The platform provides actionable recommendations for reducing exposure, helping security managers to prioritize their remediation efforts, and make the most of their resources. | [Improve security insights with exposure insights overview](exposure-insights-overview.md)  |
|**Exposure events feed** | Compiled critical exposure events are vital data for security decision-makers to monitor and respond to. These exposure events offer insights into changes in baseline conditions and emerging vulnerabilities related to your organization's assets. |  [Improve security insights with exposure insights overview](exposure-insights-overview.md) |
|**Critical Asset Identification** | The platform automatically identifies critical assets within your organization, highlighting their significance in relation to exposure and potential vulnerabilities. Users can also define their own logic for identifying critical assets in their organization. The ability to identify critical assets empowers security managers with a clear understanding of which assets are most vital to protect. This identification helps safeguard your key resources, proactively. | [Overview of identify and manage critical assets](critical-asset-management.md) |
|**Attack Path Management** | The platform effectively manages attack paths by identifying potential routes that attackers might use to access and compromise your critical assets. Security managers can proactively address these pathways, reducing the risk of security breaches and ensuring the safety of your organization's most crucial data and systems. This proactive approach enables you to stay ahead of potential threats and effectively safeguard your critical assets. | [Overview of work with attack paths](work-attack-paths-overview.md) |

<!--## Exposure insight -->

<!-- 

## Unified View

Microsoft Exposure Management consolidates exposure and posture-related aspects into a unified view to offer insights into:

- Exposure
- Potential attack paths
- Maturity of security programs
This drives continuous security posture improvement while considering business priorities.
-->
## Consolidate insights

Consolidation happens proactively and responsively in Security Exposure Management. **Initiatives** combines different security areas, such as ransomware protection and endpoint security, optimizing existing products to assess exposure and posture. The overview of different areas, contributes to better insights.

Security teams can use the aggregated view of the security events and review changes requiring attention to keep track and effectively respond to issues. They can also gain broad visibility into different assets throughout the organization and ask intelligent, exposure-related questions about them using advanced hunting capabilities.

:::image type="content" source="../../media/security-exposure-management/exposure-management-overview.png" alt-text="Screenshot of the exposure management overview page.":::

<!-- should this be removed here?  
Microsoft Exposure Management includes the following features:

- **Overview (dashboard):** The exposure management overview page:
  - Summarizes the exposure management workflows
  - Lists the most exposed metrics
  - Displays recent security events
  - Allows easy navigation for drill-down to features such as key initiatives and critical asset management.
  - Provides **asset criticality management**. Critical asset management allows users to manage the criticality level of assets, that Microsoft predefined as assets of interests. It also creates custom classification rules to detect critical assets. 
- **Attack surface** This allows users to explore, investigate, and remediate the attack paths identified, visually and by attack path.
- **Exposure Insights**
  - **Initiatives:** Initiatives or the Initiative catalog provides a full list of all initiatives and their details.
  - **Security Metrics:** Metrics or the Metrics catalog provides a full list of all metrics and their details, for all initiatives.
  - **Security Recommendations:** Recommendations or the Recommendation catalog provides a full list of all recommendations and their details, in relation to the relevant metrics and initiatives.
  - **Security Events:** Lists all events, with a historical view, across the entire platform.
- **Microsoft Secure Score**: Measures an organization's security posture, with a higher number indicating more recommended actions taken.
-->
## Next steps

- [Microsoft Exposure Management licensing datasheet](https://aka.ms/?)
- [Get started with Microsoft Security Exposure Management](get-started-exposure-management.md)
- [Prerequisites and support](prerequisites.md)