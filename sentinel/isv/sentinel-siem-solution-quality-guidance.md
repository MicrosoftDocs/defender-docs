---
title: Microsoft Sentinel SIEM solution quality guidelines
description: Learn quality requirements and best practices to build, publish, and maintain Microsoft Sentinel SIEM solutions that deliver immediate customer value.
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: 
ms.service: microsoft-sentinel
ms.subservice: sentinel-siem
ms.topic: concept-article
ms.date: 06/02/2026
ms.custom: msecd-doc-authoring-1012
ai-usage: ai-assisted

# customer intent: As an ISV partner, I want quality guidance for Microsoft Sentinel SIEM solutions so that customers get out-of-the-box value from the solution.
---

# Microsoft Sentinel SIEM solution quality guidelines

Use these guidelines to build Microsoft Sentinel SIEM solutions that deliver value as soon as customers install them.

## SIEM solution components

A Microsoft Sentinel SIEM solution consists of multiple content items, each serving a specific purpose.  

This section describes requirements for each content type that can be included in a Sentinel SIEM solution. 


## Data connectors 

Use the Codeless Connector Framework (CCF) to create data connectors. CCF lets partners, advanced users, and developers create custom connectors for Microsoft Sentinel without deploying service infrastructure. CCF includes health monitoring, Microsoft Sentinel support, and automatic scaling to support changing ingestion volume. Customers configure ingestion in a guided UI and pay only for ingested data. For more information on CCF connectors, see [Create a codeless connector for Microsoft Sentinel](/azure/sentinel/create-codeless-connector)

> [!IMPORTANT]
> Partners are required to use the Codeless Connector Framework (CCF), instead of Azure Functions, for all new data connectors. If you find blockers during data connector development because of CCF limitations, log an issue titled **CCF Limitations** in the [Azure-Sentinel GitHub repository](https://github.com/Azure/Azure-Sentinel/issues). The Microsoft Sentinel team works with you to resolve the issue or provide a workaround. If the issue remains a blocker, the Microsoft Sentinel team can create an exception for your data connector. To contact the Microsoft Sentinel team for assistance, email Microsoft Sentinel Partners at [AzureSentinelPartner@microsoft.com](mailto:AzureSentinelPartner@microsoft.com).

## Analytics rules 

Analytics rules must include appropriate MITRE mappings so customers can monitor and visualize threat coverage in their security infrastructure. For more information, see [View MITRE coverage for your organization from Microsoft Sentinel](/azure/sentinel/mitre-coverage?tabs=azure-portal).  

Scope rules to cover key data columns that each data connector pulls. This helps customers see value from ingested data. 

Map entities to rule output where applicable. Standardized entities help correlate output with other Microsoft Sentinel data points. Common entities include user accounts, hosts, mailboxes, IP addresses, files, cloud applications, processes, and URLs. For more information, see [Entities in Microsoft Sentinel](/azure/sentinel/entities). 

> [!IMPORTANT]
> Partners must create at least one analytics rule as part of their Microsoft Sentinel SIEM solution.
> 
> Analytics rules are central to SIEM value. Ingestion is only the first step. Customers need detections to monitor their environment and receive actionable alerts. Include prebuilt analytics rules so customers can start monitoring right after setup.

## Playbooks

A playbook is an Azure Logic App that runs automated response actions when a Microsoft Sentinel incident or alert is triggered. Playbooks help SOC analysts automate tactical tasks such as notifying teams, blocking users, or enriching incidents with external data, so analysts can focus on deeper investigation and response. As you design your solution, identify automated actions that can resolve incidents created by your analytics rules. For more information, see [Automate response with playbooks in Microsoft Sentinel](/azure/sentinel/automation/automate-responses-with-playbooks).

## Hunting queries

Hunting queries aren't required, but Microsoft strongly recommends including them. Hunting queries help SOC analysts understand the schema and build new investigation scenarios. 

When you build hunting queries, use these best practices:
- **Use MITRE mappings** to align queries with common tactics, techniques, and procedures (TTPs).
- **Cover key connector columns** so queries remain useful and highlight data gaps.
- **Use threat intelligence context** to improve analyst decisions. For more information, see [Threat intelligence in Microsoft Sentinel](/azure/sentinel/understand-threat-intelligence). 


## Parsers 

Review available ASIM schemas and map your data to one or more relevant schemas. This speeds onboarding for SOC analysts and helps existing ASIM-based content work with your product data. For more information, see [Advanced Security Information Model (ASIM) schemas](/azure/sentinel/normalization-about-schemas).

ASIM supports two approaches to normalization:
- Ingest-time normalization: Data is normalized as it arrives and written directly to a dedicated ASIM table, such as ASimDnsActivityLogs or ASimAuthenticationEventLogs. This approach improves query performance because data is already in normalized form when queried. If your CCF connector writes to one of these native ASIM tables, no additional parser is needed.

- Query-time parsers: Data is stored in its original form (for example, in CommonSecurityLog or a custom table), and a KQL function transforms it into the normalized schema at query time. These are the source-specific parsers named `_Im_<schema>_<source>`. The unifying parser `_Im_<schema>` automatically includes both native ASIM table data and all source-specific query-time parsers.

Microsoft Sentinel provides many built-in source-specific parsers. You might need to modify or create parsers when:
- Your device events fit an ASIM schema, but no source-specific parser exists for that schema.
- A source-specific parser exists, but your device sends events in a different format.
- Your source device is configured to send nonstandard events.
-To understand parser placement in ASIM architecture, see the ASIM architecture diagram.


> [!NOTE] 
> Microsoft doesn't mandate the availability of parsers in your solution. However if our certification team identifies that your data maps closely to an existing ASIM schema, our team may mandate the creation of parsers to avail the benefits of normalization.

## Workbooks 

Workbooks aren't required because requirements vary by use case. If you include workbooks, ensure each workbook aligns with ingested data and delivers customer value.

When you create workbooks, use these best practices:
- **Use clear titles and descriptions** so users quickly understand each workbook purpose.
- **Use appropriate visualizations** such as line charts for trends, bar charts for comparisons, and tables for detail.
- **Use filters and parameters** so users can focus on relevant time ranges and sources.
- **Optimize performance** by using summary rules when workbook queries process large volumes of data.
- **Provide built-in guidance** through documentation or tooltips.

## Maintaining solutions 

After publication, maintain and update your SIEM solution regularly:
- **Plan for feature deprecations** and update at least six months before end-of-life or end-of-service milestones.
- **Keep the solution description page accurate** and fix broken links quickly.
- **Address GitHub CodeQL alerts** in a timely manner.

## Related content
- [Create and publish hunting queries for Microsoft Sentinel solutions](sentinel-hunting-rules-creation.md)
- [ Create and publish playbooks for Microsoft Sentinel solutions](sentinel-playbook-creation.md)
- [Create and publish analytics rules for Microsoft Sentinel solutions](sentinel-analytic-rules-creation.md)
- [Create and publish summary rules for Microsoft Sentinel solutions](sentinel-summary-rules-creation.md)
- [Create and publish workbooks for Microsoft Sentinel solutions](sentinel-workbook-creation.md)
- [Sentinel SIEM solution lifecycle post publish](sentinel-solutions-post-publish-tracking.md)
