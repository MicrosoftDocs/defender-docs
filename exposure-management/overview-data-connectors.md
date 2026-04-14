---
title: Overview of connecting data sources in Microsoft Security Exposure Management
description: Learn about connecting data sources in Microsoft Security Exposure Management.
ms.topic: overview
ms.date: 09/21/2025
---

# Connecting data sources in Microsoft Security Exposure Management

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) consolidates security posture data from all your digital assets across endpoints, cloud environments, and external attack surfaces, enabling you to map your attack surface and focus your security efforts on areas at greatest risk. Data from Microsoft Security products like Microsoft Defender for Endpoint, Microsoft Defender for Identity, Microsoft Defender for Cloud (including Azure, AWS, and GCP), Microsoft Entra ID, and others are automatically ingested and consolidated within Exposure Management in the unified portal. You can further enrich and extend this data by connecting to a range of external data sources through the new Exposure Management connectors.

To provide coverage of all your assets and security signals and to help you establish a comprehensive, single source of truth for your assets, Exposure Management provides data connectors. These new Exposure Management connectors ingest data from third-party security tools (such as ServiceNow CMDB for assets, and Tenable, Qualys, Rapid7 for vulnerabilities) and other asset management products deployed in your environment.

These third-party vulnerability management connectors also replace the 'bring your own license' scanners previously available in Microsoft Defender for Cloud in Azure, but they offer significantly more capabilities beyond just that functionality.

Benefits include:

- **Unified visibility**: Previously siloed vulnerabilities and asset information from external sources now appear in the unified Defender portal's Exposure Management inventory
- **Normalized within exposure graph**: All external data is integrated into the enterprise exposure graph and can be explored in the Attack Surface Map for comprehensive analysis
- **Enhanced device inventory**: Enriches the unified inventory with assets and findings from third-party tools
- **Improved critical asset identification**: Asset criticality signals discovered via connectors can be used to automatically apply criticality tags in Exposure Management
- **Mapping relationships**: Creates connections between external assets and existing infrastructure
- **Revealing new attack paths**: Enables discovery of attack paths that include external assets and vulnerabilities
- **Comprehensive attack surface visibility**: Provides end-to-end visibility across Microsoft and third-party security tools
- **Enriched context**: Incorporates asset criticality and business application context from external sources
- **Advanced analytics**: External data can be explored using advanced hunting queries via KQL in the unified experience

The support for external solutions helps to further streamline, integrate, and orchestrate defenses from other security vendors with Exposure Management. This enables security teams to effectively manage their posture and exposure across the entire attack surface.

:::image type="content" source="media/connect-data-sources/data-connectors.png" alt-text="Screenshot of data connectors available in MSEM" lightbox="media/connect-data-sources/data-connectors.png":::

Data Connectors in Microsoft Security Exposure Management is currently in public preview.

[!INCLUDE [prerelease](../includes//prerelease.md)]

> [!NOTE]
> During the preview phase, use of the data connectors feature is free. Once data connectors become generally available, there will be a consumption-based charge based on data ingested from each third party product. Pricing will be announced before billing of external connectors starts at GA.

## Next steps

[Configure your data connectors](configure-data-connectors.md).
