---
title: Overview of connecting data sources in Microsoft Security Exposure Management
description: Learn about connecting data sources in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/06/2024
---

# Overview

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) consolidates security posture data from all your digital assets across endpoints, cloud environments, and external attack surfaces, enabling you to map your attack surface and focus your security efforts on areas at greatest risk. With the integration of Defender for Cloud in the Defender portal, data from Microsoft Security products like Microsoft Defender for Endpoint, Microsoft Defender for Identity, Microsoft Defender for Cloud (including Azure, AWS, and GCP), Microsoft Entra ID, and others are automatically ingested and consolidated within Exposure Management in the unified portal. You can further enrich and extend this data by connecting to a range of external data sources through the new Exposure Management connectors.

To provide coverage of all your assets and security signals and to help you establish a comprehensive, single source of truth for your assets, Exposure Management provides data connectors that replace the old Azure "bring your own license" scanner method for cloud vulnerability data. These new Exposure Management connectors ingest data from third-party security tools (such as ServiceNow CMDB for assets, and Tenable, Qualys, Rapid7 for vulnerabilities) and other asset management products deployed in your environment.

Benefits include:

- **Unified visibility**: Previously siloed vulnerabilities and asset information from external sources now appear in the unified Defender portal's Exposure Management inventory
- **Normalized within exposure graph**: All external data is integrated into the enterprise exposure graph for comprehensive analysis
- **Enhanced device inventory**: Enriches the unified inventory with assets and findings from third-party tools
- **Improved critical asset identification**: Assets discovered via connectors (like CMDB connectors) can be automatically tagged as critical if they meet certain criteria
- **Mapping relationships**: Creates connections between external assets and existing infrastructure
- **Revealing new attack paths**: Enables discovery of attack paths that include external assets and vulnerabilities
- **Comprehensive attack surface visibility**: Provides end-to-end visibility across Microsoft and third-party security tools
- **Enriched context**: Incorporates asset criticality and business application context from external sources
- **Unified visualization**: All connected data is available through the Attack Surface Map in the Defender portal
- **Advanced analytics**: External data can be explored using advanced hunting queries via KQL in the unified experience

The support for external solutions helps to further streamline, integrate, and orchestrate defenses from other security vendors with Exposure Management. This enables security teams to effectively manage their posture and exposure across the entire attack surface.

:::image type="content" source="media/connect-data-sources/data-connectors.png" alt-text="Screenshot of data connectors in MSEM" lightbox="media/connect-data-sources/data-connectors.png":::

Data Connectors in Microsoft Security Exposure Management is currently in public preview.

[!INCLUDE [prerelease](../includes//prerelease.md)]

> [!NOTE]
> During the preview phase, use of the data connectors feature is free. Once data connectors become generally available, there will be a consumption-based cost for each non-Microsoft data connector based on number of assets retrieved from the connected security tool. The charge will be according to volume of ingested billable assets, where a billable asset is any asset (device, container, identity, application) on which data is reported from that connector. Each connector will have clearly defined applicable assets and guidance on how to determine the numbers. Pricing will be announced before billing of external connectors starts at GA.  

## Next steps

[Configure your data connectors](configure-data-connectors.md).
