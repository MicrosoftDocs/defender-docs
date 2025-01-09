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

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) consolidates security posture data from all your digital assets, enabling you to map your attack surface and focus your security efforts on areas at greatest risk. Data from Microsoft Security products like Microsoft Defender for Endpoint, Microsoft Defender for Identity, Microsoft Defender for Cloud, Microsoft Entra ID, and others are automatically ingested and consolidated within Exposure Management. You can further enrich and extend this data by connecting to a range of external data sources.

To provide coverage of all your assets and security signals and to help you establish a comprehensive, single source of truth for your assets, Exposure Management provides data connectors that ingest data from other security or asset management products deployed in your environment.

Benefits include:

- Normalized within exposure graph
- Enhancing device inventory
- Mapping relationships
- Revealing new attack paths
- Providing comprehensive attack surface visibility
- Incorporating asset criticality
- Enriching context with business application or operational affiliation
- Visualizing through the Attack Map tool
- Exploring using advanced hunting queries via KQL

The support for external solutions helps to further streamline, integrate, and orchestrate defenses from other security vendors with Exposure Management. This enables security teams to effectively manage their posture and exposure across the entire attack surface.

:::image type="content" source="media/connect-data-sources/data-connectors.png" alt-text="Screenshot of data connectors in MSEM" lightbox="media/connect-data-sources/data-connectors.png":::

Data Connectors in Microsoft Security Exposure Management is currently in public preview.

[!INCLUDE [prerelease](../includes//prerelease.md)]

> [!NOTE]
> During the preview phase, use of the data connectors feature is free. Once data connectors become generally available, there will be a consumption-based cost for each non-Microsoft data connector based on number of assets retrieved from the connected security tool. The charge will be according to volume of ingested billable assets, where a billable asset is any asset (device, container, identity, application) on which data is reported from that connector. Each connector will have clearly defined applicable assets and guidance on how to determine the numbers. Pricing will be announced before billing of external connectors starts at GA.  

## Prerequisites

The following prerequisites are required to integrate external data connecters to Microsoft Security Exposure Management.

### Roles & permissions

For full access to connect and disconnect the data connectors you need one of the following Microsoft Entra ID roles:

- Global Admin (read and write permissions)
- Security Admin (read and write permissions)
- Security Operator (read and limited write permissions)

To view the status of the connectors, you can use one of the following roles:

- Global Reader (read permissions)
- Security Reader (read permissions)

You can find more details about the permission levels here, [Prerequisites, and support](prerequisites.md).

## Next steps

[Configure your data connectors](configure-data-connectors.md).
