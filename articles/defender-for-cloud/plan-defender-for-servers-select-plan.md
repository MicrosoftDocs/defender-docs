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

This article helps you to understand which[Defender for Servers plan](defender-for-servers-overview.md) you want to deploy in Microsoft Defender for Cloud.


## Before you begin

This article is the *third* article in the Defender for Servers planning guide. Before you begin, review the earlier articles:

1. Start [planning your deployment](plan-defender-for-servers.md).
1. Review [Defender for Servers access roles](plan-defender-for-servers-roles.md).

## Review plans

Defender for Servers offers two paid plans:

- **Defender for Servers Plan 1** is entry-level, and focuses on the endpoint detection and response (EDR) capabilities provided by the Defender for Endpoint integration with Defender for Cloud.
- **Defender for Servers Plan 2** provides the same features as Plan 1, and additional capabilities that include:

    - [Agentless scanning](concept-agentless-data-collection.md) for(concept-agentless-data-collection.md) machine posture assessment, threat protection, vulnerability scanning, malware scanning, and secrets scanning.
    - [Compliance assessment](regulatory-compliance-dashboard.md) against a variety of regulatory standards. Available with Defender for Servers Plan 2 or any other paid plan.
    - Capabilities provided by [premium Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management-capabilities).
    - [Free data ingestion benefit](data-ingestion-benefit.md) for specific data types.
    - [OS configuration assessment](operating-system-misconfiguration.md) against compute security baselines provided by Microsoft Cloud Security Benchmark.
    - [OS updates assessment](enable-periodic-system-updates.md) using Azure Update integration.
    - [File integrity monitoring](file-integrity-monitoring-overview.md) to examine files and registries for changes that might indicate an attack.
    - [Just-in-time machine access](just-in-time-access-overview.md) to lock down machine ports and reduce attack surfaces.
    - [Network map](protect-network-resources.md) to get a geographical view of network recommendations.


For a full list, review [Defender for Servers plan features](defender-for-servers-overview.md#plan-protection-features).


## Decide on plan scope

We recommend enabling Defender for Servers at subscription level, but you can enable and disable Defender for Servers at resource level if you need deployment granularity.

You can enable and disable at the resource level as follows:

**Scope** | **Plan 1** | **Plan 2**
--- | --- | ---
**Enable for Azure subscription** | Yes | Yes
**Enable for resource** | Yes | No
**Disable for resource** | Yes | Yes

- Plan 1 can be enabled and disabled at resource level.
- Plan 2 can't be enabled at the resource level, but you can disable the plan at resource level.

Here are a couple of use case examples to help you decide.

**Use case** | **Details** 
--- | ---
**Turn on Defender for Servers Plan 1 or Plan 2 for the entire subscription**| This is the recommended option. [Learn about plan features](defender-for-servers-overview.md#defender-for-servers-plans).
**Turn off the Defender for Servers plan on individual machines in the subscription**. | Use the Azure Resource Manager [Pricings operation group](https://rest/api/defenderforcloud/pricings?view=rest-defenderforcloud-2024-01-01).<br/><br/>In [Update Pricings](/rest/api/defenderforcloud/pricings/update?view=rest-defenderforcloud-2024-01-01&tabs=HTTP), use a PUT request to set the requires a PUT request setting the pricingTier property to *free*.<br/><br/> The pricingTier property indicates whether the plan is enabled on the selected scope.
**Turning off plan setting for individual machines** | If you've turned off the plan for a specific resource and you want to turn it on again, use the [**Delete**](/rest/api/defenderforcloud/pricings/delete?view=rest-defenderforcloud-2024-01-01&tabs=HTTP) property to delete the pricing configuration for the machine.
**Enable Defender for Servers Plan 1 for multiple resources** | Defender for Servers provides a script for enabling Defender for Servers Plan 1 on multiple resources in the subscription.<br/><br/> This is useful if you want to enable Defender for Servers on a subset of resources without enabling it on the entire subscription.<br/><br/> In the script you specify machines to enable using a resource tag or resource group. The tag is customer-specific.
**Enable Defender for Servers Plan 2 on the entire subscription. Turn off the plan for multiple resources.** | After enabling Plan 2 in a subscription, you can then use the script to disable Plan 2 on multiple resources.<br/><br/> You can then enable Plan 1 on those machines as needed using the script.

In addition to these methods, you can use Defender for Cloud's built-in Azure Policy policies to configure the plan on resources based on a resource tag or resource group.

In Azure Policy in the Azure portal, the relevant policies are in the **Security Center - Granular Pricing** category.

[Learn more](tutorial-enable-servers-plan.md) about how to deploy the plan on a subscription and on specific resources.


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

