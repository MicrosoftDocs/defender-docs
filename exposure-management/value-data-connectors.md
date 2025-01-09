---
title: Working with the data connectors in Microsoft Security Exposure Management
description: Learn about using the data connectors in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---

# Getting value from your data connectors

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) consolidates security posture data from all your digital assets enabling you to map your attack surface and focus your security efforts on areas at greatest risk. The data from Microsoft products gets ingested automatically once connected to Exposure Management, and you can add more data connectors from external data sources.

## Imported assets and data types

The intent of connecting to external products is to create complete visibility across all your digital assets and any security context that could impact your attack surface. The following asset types, context enrichment, and vulnerability information are ingested for this purpose:

- Devices
- Cloud assets
- Vulnerabilities
- Asset Criticality information
- Asset risk assessment
- Network details
- Exposure insights (for example, Internet exposure)
- Users (future)
- SaaS apps (future)

The asset information and security context are imported into Exposure Management and consolidated to provide a comprehensive view of the security posture across all digital assets. Currently supported external data sources include Qualys, Rapid7 InsightVM, Tenable Vulnerability Management, and ServiceNow CMDB.

Data ingested from the Connectors gets normalized and incorporated into the Exposure Graph and Device Inventory. Exposure Management uses the valuable context and insights gained to generate a more accurate assessment of your attack surface, and provide you with a deeper understanding of your exposure risk. This data can be consumed in the Device Inventory, in Exposure Graph exploration tools like the Attack Surface Map and Advanced Hunting, and within Attack Paths that are discovered based on enrichment data ingested by the connectors.

Eventually this data will additionally serve to enhance security metrics that measure your exposure risk against a particular criteria, and it will also impact broader organizational initiatives that measure exposure risk across a workload or related to a specific threat area.

:::image type="content" source="media/value-data-connectors/device inventory with 3P.png" alt-text="Screenshot of device inventory with discovery source" lightbox="media/value-data-connectors/device inventory with 3P.png":::

Benefits of using the external data connectors include:

- Normalized within exposure graph
- Enhancing device inventory
- Mapping relationships
- Revealing new attack paths
- Providing comprehensive attack surface visibility
- Incorporating asset criticality
- Enriching context with business application or operational affiliation
- Visualizing through the Attack Map tool
- Exploring using advanced hunting queries via KQL

### Connectors data in the Device Inventory

In the Device Inventory, you'll see the discovery sources for each device, which are the products from which we got any report on this device. These might include Microsoft Security products like MDE, MDC, and MDI, and also external data sources like Qualys or ServiceNow CMDB. You can filter on one or more discovery sources within the inventory to view devices that were discovered specifically by those sources.

:::image type="content" source="media/value-data-connectors/DI data connectors.png" alt-text="Screenshot of device inventory with discovery source highlighted" lightbox="media/value-data-connectors/DI data connectors.png":::
":::

### Critical Asset Management

Identifying critical assets is key in helping ensure that the most important assets in your organization are protected against risk of data breaches and operational disruptions.

Enrichment information on criticality of assets is retrieved from the data connectors, based on the criticality assessments calculated in those external products. As this data is ingested, Critical Asset Management contains built-in rules to transform the criticality value retrieved from the third-party product to the Exposure Management criticality value for each asset. You can view these classifications and enable or disable them in the Critical Asset Management experience.

:::image type="content" source="media/value-data-connectors/critical asset management data connectors.png" alt-text="Screenshot of data connector info in critical asset management" lightbox="media/value-data-connectors/critical asset management data connectors.png":::

### Exposure graph

To explore your assets and enrichment data retrieved from external data products, you can also view this information in the Exposure Graph. Within the Attack Surface map, you can view the nodes representing assets discovered by your connectors, with built-in icons showing the discovery sources for each asset.

:::image type="content" source="media/value-data-connectors/exposure graph data connectors main.png" alt-text="Screenshot of data connectors in exposure graph shown" lightbox="media/value-data-connectors/exposure graph data connectors main.png":::

By opening the side pane for the asset, you can also view the detailed data retrieved from the connector for each asset.

:::image type="content" source="media/value-data-connectors/exposure graph data connectors.png" alt-text="Screenshot of data connectors in exposure graph" lightbox="media/value-data-connectors/exposure graph data connectors.png":::

:::image type="content" source="media/value-data-connectors/exposure graph data connectors all data.png" alt-text="Screenshot of data connectors in exposure graph side pane" lightbox="media/value-data-connectors/exposure graph data connectors all data.png":::

### Advanced Hunting

To explore your discovered and ingested data from the external data sources, you can [run queries](query-enterprise-exposure-graph.md) on the Exposure Graph in Advanced Hunting.

**Examples**:

This query will return all assets retrieved from ServiceNow CMDB and their detailed metadata.

```kusto
ExposureGraphNodes
| where NodeProperties contains ("serviceNowCmdbAssetInfo")
| extend SnowInfo = NodeProperties.rawData.serviceNowCmdbAssetInfo
```

This query will return all assets retrieved from Qualys.

```kusto
ExposureGraphNodes
| where EntityIds contains ("QualysAssetId")
```

This query will return all vulnerabilities (CVEs) reported by Rapid7 on ingested assets.

```kusto
ExposureGraphEdges
| where EdgeLabel == "affecting"
| where tostring(EdgeProperties.rawData.reportInfo.reportedBy) == "rapid7"
| project AssetName = TargetNodeName, CVE = SourceNodeName
```

This query will return all vulnerabilities (CVEs) reported by Tenable on ingested assets.

```kusto
ExposureGraphEdges
| where EdgeLabel == "affecting"
| where tostring(EdgeProperties.rawData.reportInfo.reportedBy) == "tenable"
| project AssetName = TargetNodeName, CVE = SourceNodeName
```

> [!NOTE]
> When troubleshooting Advanced Hunting (AH) queries that don't work or yield no results, note that the "reportedBy" field is case-sensitive. For example, valid values include "rapid7", "tenable", etc.
>

### Attack paths

Security Exposure Management automatically generates attack paths based on the data collected across assets and workloads, including data from external connectors. It simulates attack scenarios, and identifies vulnerabilities and weaknesses that an attacker could exploit.

As you explore attack paths in your environment, you can view the discovery sources that contributed to this attack path based on the graphical view of the path.

:::image type="content" source="media/value-data-connectors/attack paths data connectors.png" alt-text="Screensot of attach path with discovery source" lightbox="media/value-data-connectors/attack paths data connectors.png":::

## Next steps

- [Overview of attack paths](work-attack-paths-overview.md)
