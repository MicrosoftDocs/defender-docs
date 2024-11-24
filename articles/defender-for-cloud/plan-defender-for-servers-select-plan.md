---
title: Select a Defender for Servers plan in Microsoft Defender for Cloud
description: Decide which Defender for Servers plan you want to deploy.
ms.topic: concept-article
ms.author: dacurwin
author: dcurwin
ms.date: 06/25/2024
#customer intent: As a reader, I want to understand which Defender for Servers plan I want to deploy.
---

# Select a Defender for Servers plan

This article helps you to understand the requirements for data collection in the [Defender for Servers plan](defender-for-servers-overview.md) in Microsoft Defender for Cloud.


## Before you begin

This article is the *third* article in the Defender for Servers planning guide. Before you begin, review the earlier articles:

1. [Start planning your deployment](plan-defender-for-servers.md).
1. [Review Defender for Servers access roles](plan-defender-for-servers-roles.md).

## Review plans

Defender for Servers offers two paid plans:


- **Defender for Servers Plan 1** is entry-level, and focuses on the endpoint detection and response (EDR) capabilities provided by the Defender for Endpoint integration with Defender for Cloud.
- **Defender for Servers Plan 2** provides the same features as Plan 1, and additional capabilities that include:
    - [Agentless](concept-agentless-data-collection.md) posture assessment, threat protection, vulnerability scanning, malware scanning, and secrets scanning.
    - [Compliance assessment](regulatory-compliance-dashboard.md) against a variety of regulatory standards. Available with Defender for Servers Plan 2 or any other paid plan.
    - Capabilities provided by [premium Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management-capabilities).
    - [Free data ingestion benefit](data-ingestion-benefit.md) for specific data types.
    - [OS configuration assessment](operating-system-misconfiguration.md) against compute security baselines provided by Microsoft Cloud Security Benchmark.
    - [OS updates assessment](enable-periodic-system-updates.md) using Azure Update integration.
    - [File integrity monitoring](file-integrity-monitoring-overview.md) to examine files and registries for changes that might indicate an attack.
    - [Just-in-time machine access](just-in-time-access-overview.md) to lock down machine ports and reduce attack surfaces.
    - [Network map](protect-network-resources.md) to get a geographical view of network recommendations.


For a full list, review [Defender for Servers plan features](defender-for-servers-overview.md#plan-protection-features).


## Deciding on plan scope

We recommend enabling Defender for Servers at subscription level, but you can enable and disable Defender for Servers at resource level if you need deployment granularity.

You can enable and disable at the resource level as follows:

**Scope** | **Plan 1** | **Plan 2**
--- | --- | ---
**Enable for Azure subscription** | Yes | Yes
**Enable for resource** | Yes | No
**Disable for resource** | Yes | Yes

- Plan 1 can be enabled and disabled at resource level per server.
- Plan 2 can't be enabled at the resource level, but you can disable the plan at resource level.

Here are a couple of use case examples to help you decide.

- **Use case 1**: Turn on Defender for Servers Plan 1 or Plan 2 for the entire subscription. This is the recommended option. [Learn about the features provided with each plan](defender-for-servers-overview.md#defender-for-servers-plans).
- **Use case 2**: Enable Defender for Servers Plan 1 for specific resources in your subscription, and don't enable the plan in the entire subscription.
- **Use case 3**: Enable Defender for Servers Plan 2 on the entire subscription, and then turn off the plan for specific resources, or downgrade specific resources to Plan 1. 

[Learn more]() about how to deploy the plan for specific resources.


## Workspace considerations

Defender for Servers needs a Log Analytics workspace when:

- You deploy Defender for Servers Plan 2 and you want to take advantage of free daily ingestion for specific data types. [Learn more](data-ingestion-benefit.md).
- You deploy Defender for Servers Plan 2 and you're using file integrity monitoring. [Learn more](file-integrity-monitoring-overview.md).

## Azure ARC onboarding

We recommend that you onboard machine in non-Azure clouds and on-premises to Azure as Azure Arc-enabled VMs. Enabling as Azure Arc VMs allows machines to take full advantage of Defender for Servers features. Azure Arc-enabled machines have the Azure Arc Connected Machine agent installed on them.

- When you use the Defender for Cloud multicloud connector to connect to [AWS accounts](quickstart-onboard-aws.md)  and [GCP projects](quickstart-onboard-gcp.md) , you can automatically onboard the Azure Arc agent to AWS or GCP servers.
- We recommend that you [onboard on-premises machines as Azure Arc-enabled](quickstart-onboard-machines.md).
- Although you can [on-premises machines by directly installing the Defender for Endpoint agent](onboard-machines-with-defender-for-endpoint.md) instead of onboarding machines with Azure Arc, Defender for Servers Plan functionality is available. For Defender for Servers Plan 2, in addition to Plan 1 features, only the premium Defender Vulnerability Management features are available.

Before you deploy Azure Arc:

- [Review a full list](/azure/azure-arc/servers/prerequisites#supported-operating-systems) of operating systems supported by Azure Arc.
- Review the Azure Arc [planning recommendations](/azure/azure-arc/servers/plan-at-scale-deployment) and [deployment prerequisites](/azure/azure-arc/servers/prerequisites).
- [Review networking requirements](/azure/azure-arc/servers/arc-gateway) for the Connected Machine agent.
- Open the [network ports for Azure Arc](support-matrix-defender-for-servers.md#network-requirements) in your firewall.
- Review requirements for the Connected Machine agent:
    - [Agent components and data collected from machines](/azure/azure-arc/servers/agent-overview#agent-resources).
    - [Network and internet access](/azure/azure-arc/servers/network-requirements) for the agent.
    - [Connection options](/azure/azure-arc/servers/deployment-options) for the agent.


## Next steps

[Understand how data is collected](plan-defender-for-servers-agents.md) to Azure.

