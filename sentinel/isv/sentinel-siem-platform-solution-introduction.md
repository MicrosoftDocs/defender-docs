---
title: Microsoft Sentinel SIEM and platform solution overview
description: Learn how Microsoft Sentinel SIEM and platform solutions differ, find the right build and publish guidance for each path, and get support when you need it.
author: EdB-MSFT
ms.author: edbaynash
ms.service: microsoft-sentinel
ms.topic: concept-article
ms.custom: msecd-doc-authoring-101
ms.date: 06/28/2026
ai-usage: ai-assisted
#customer intent: As an ISV partner, I want to understand Microsoft Sentinel SIEM and platform solution paths so that I can find the right build and publish guidance and get support when I need it.
---

# Microsoft Sentinel SIEM and platform solution overview

Microsoft Sentinel ISV solutions are partner-built integrations and content that extend Microsoft Sentinel for customer scenarios. As an independent software vendor (ISV), you package your product's connectors, detections, automation, and analytics experiences into a solution that customers discover, install, and use directly inside Microsoft Sentinel. A well-built solution lets customers onboard your product in minutes instead of building integrations themselves, and it gives your product a presence in the marketplaces that security teams already use.

You can build two solution types, and they target different parts of the Microsoft Sentinel experience:

- **SIEM solutions** deliver detection, investigation, and automated response content for Security Operations Center (SOC) teams. They bring your product's logs into Microsoft Sentinel and turn that data into ready-to-use analytics rules, hunting queries, workbooks, playbooks, and parsers. 

- **Platform solutions** deliver large-scale data analysis and AI-driven experiences built on the Microsoft Sentinel data lake and graph. They include Security Copilot agents, Model Context Protocol (MCP) tools, custom graphs, and notebook jobs for scenarios that analyze large volumes of security data. 

The two paths use different content types, build tooling, quality requirements, and publishing flows. Understanding the differences early helps you choose the right content path, scope your work accurately, and avoid rework before you start development and publishing. The rest of this article compares the two solution types and links to the detailed build and publish guidance for each.

## Compare SIEM and platform solutions

The two solution types serve different customer needs, use different content, and publish through different stores.

| | SIEM solutions | Platform solutions |
|---|---|---|
| **Purpose** | Detection, investigation, and automated response for Security Operations Center (SOC) teams | Large-scale data analysis and AI-driven scenarios that use the Microsoft Sentinel data lake and graph |
| **Primary audience** | SOC analysts, threat hunters, and detection engineers | Security data scientists, threat researchers, and teams building AI-assisted investigations |
| **Typical content** | Data connectors, analytics rules, hunting queries, summary rules, workbooks, playbooks, and Advanced Security Information Model (ASIM) parsers | Security Copilot agents, Model Context Protocol (MCP) tools, custom graphs, and notebook jobs |
| **Foundation** | Microsoft Sentinel workspace and content hub | Microsoft Sentinel data lake and graph |
| **Data scope** | Real-time and near-real-time analytics on workspace tables | Large historical and high-volume datasets stored in the data lake |
| **Build tooling** | AI connector builder agent, Codeless Connector Framework (CCF), YAML content templates, and the V3 solution packaging tool |  KQL jobs, VS Code notebook and graph development tools, and the platform packaging flow |

If you're not sure which content your scenario needs, start with [Decide which components to include in your solution](siem-components-to-include.md) for SIEM solutions <!-- Uncoment after platform content merged: or [Decide which platform solution components to build](which-platform-components-to-build.md) for platform solutions-->.

## Build and publish SIEM solutions

SIEM solutions focus on detections, investigations, and automation for SOC teams. Use the following articles to plan, build content, publish, and maintain a SIEM solution.

### Plan and understand the lifecycle

- [Build and publish Microsoft Sentinel SIEM solutions](sentinel-integration-guide.md)
- [Develop a SIEM solution for Microsoft Sentinel](develop-siem-solutions-overview.md)
- [Decide which components to include in your solution](siem-components-to-include.md)
- [Microsoft Sentinel SIEM solution quality guidelines](sentinel-siem-solution-quality-guidance.md)

### Build data connectors

- [Build custom connectors with AI in Microsoft Sentinel](create-custom-connector-builder-agent.md)
- [Create a pull codeless connector (CCF)](create-codeless-connector.md)
- [Create push codeless connectors (CCF)](create-push-codeless-connector.md)

### Build detection, hunting, and visualization content

- [Create analytics rules](sentinel-analytic-rules-creation.md)
- [Create hunting queries](sentinel-hunting-rules-creation.md)
- [Create summary rules](sentinel-summary-rules-creation.md)
- [Create workbooks](sentinel-workbook-creation.md)
- [Create parsers](sentinel-parsers-creation.md)
- [Create playbooks](sentinel-playbook-creation.md)
- [Develop Advanced Security Information Model (ASIM) parsers](../normalization-develop-parsers.md)

### Publish and maintain

- [Publish SIEM solutions to Microsoft Sentinel](publish-sentinel-solutions.md)
- [Microsoft Sentinel solution lifecycle in Partner Center](sentinel-solutions-post-publish-tracking.md)

<!-- Uncoment after platform content merged
## Build and publish platform solutions

Platform solutions focus on Microsoft Sentinel data lake, graph, and related platform capabilities. They're designed for scenarios that analyze large volumes of security data and power AI-driven experiences. Use the following articles to decide what to build, set up the data lake, develop content, and publish to the Microsoft Security Store.

### Plan and set up

- [Decide which platform solution components to build](which-platform-components-to-build.md)
- [Onboard to the Microsoft Sentinel data lake](sentinel-data-lake-onboarding.md)
- [Ingest sample data into the data lake](ingest-sample-data.md)
- [Microsoft Sentinel platform solution quality guidelines](platform-solution-quality-guidance.md)

### Develop platform content

- [Develop a Security Copilot agent platform solution](build-agent-security-copilot.md)
- [Develop custom graph platform solutions](develop-custom-graph-platform-solutions.md)
- [Develop a notebook solution for Microsoft Sentinel](develop-notebook-platform-solutions.md)

### Publish and manage

- [Package and publish notebook and graph solutions](package-publish-notebook-graph-solutions.md)
- [Publish a Microsoft Security Copilot agent to the Microsoft Security Store](publish-agent-to-security-store.md)
- [Manage Microsoft Sentinel platform solutions](manage-platform-solutions.md) 

-->

## Troubleshoot solutions

If you run into data ingestion, analytics, packaging, or agent integration issues while building or publishing either solution type, see [Troubleshoot solutions in Microsoft Sentinel](troubleshoot-sentinel-solutions.md).

## Contact App Assure

If you're an independent software vendor (ISV) and need support when building a Microsoft Sentinel integration by using the Microsoft Sentinel Codeless Connector Framework, the Microsoft App Assure team might be able to assist. To engage the App Assure team, send an email to [AzureSentinelPartner@microsoft.com](mailto:AzureSentinelPartner@microsoft.com) for assistance.