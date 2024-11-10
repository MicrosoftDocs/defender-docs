---
title: Understand Defender for Servers data collection in Microsoft Defender for Cloud
description: Understand how the Defender for Servers plan collects data. 
ms.topic: concept-article
ms.author: dacurwin
author: dcurwin
ms.date: 06/25/2024
#customer intent: As a reader, I want to understand how to plan the deployment of Defender for Servers agents and extensions.
---

# Understand how data is collected in Defender for Servers

This article helps you to understand the requirements for data collection in the [Defender for Servers plan](defender-for-servers-overview.md) in Microsoft Defender for Cloud.


## Before you begin

This article is the *fourth* article in the Defender for Servers planning guide. Before you begin, review the earlier articles:

1. [Start planning your deployment](plan-defender-for-servers.md).
1. [Understand where your data is stored and Log Analytics workspace requirements](plan-defender-for-servers-data-workspace.md).
1. [Review Defender for Servers access roles](plan-defender-for-servers-roles.md).

## Plan for Azure Arc deployment

We recommend that you onboard machine in non-Azure clouds, and machines on premises to Azure as Azure Arc-enabled VMs. Enabling as Azure Arc VMs allows machines to take full advantage of Defender for Servers features.

Azure Arc-enabled machines have the Azure Arc Connected Machine agent installed.

When you use the Defender for Cloud multicloud connector to connect to [AWS accounts](quickstart-onboard-aws.md)  and [GCP projects](quickstart-onboard-gcp.md) , you can automatically onboard the Azure Arc agent to your AWS or GCP servers.

You can also [onboard on-premises machines as Azure Arc-enabled](quickstart-onboard-machines.md).


Before you deploy Azure Arc:

- [Review a full list](/azure/azure-arc/servers/prerequisites#supported-operating-systems) of operating systems supported by Azure Arc.
- Review the Azure Arc [planning recommendations](/azure/azure-arc/servers/plan-at-scale-deployment) and [deployment prerequisites](/azure/azure-arc/servers/prerequisites).
- [Review networking requirements](/azure/azure-arc/servers/arc-gateway) for the Connected Machine agent.
- Open the [network ports for Azure Arc](support-matrix-defender-for-servers.md#network-requirements) in your firewall.
- Review requirements for the Connected Machine agent:

    - [Agent components and data collected from machines](/azure/azure-arc/servers/agent-overview#agent-resources).
    - [Network and internet access](/azure/azure-arc/servers/network-requirements) for the agent.
    - [Connection options](/azure/azure-arc/servers/deployment-options) for the agent.

## Azure Monitor agent

If you want to take advantage of the [free ingestion benefit for specific data types](data-ingestion-benefit.md), the [Azure Monitor agent must be installed](/azure/azure-monitor/agents/azure-monitor-agent-manage) on relevant machines. Defender for Servers doesn't use the Azure Monitor agent for any other scenarios.


## Agentless machine scanning

Defender for Cloud uses [agentless machine scanning](concept-agentless-data-collection.md) for a number of Defender for Servers Plan 2features, including:


- **Detecting endpoint detection and response (EDR) solutions**: Scan machines to assess whether they're running an EDR solution. [Learn more](endpoint-detection-response.md)
- **Scanning software inventory**: Scan your [software inventory](/defender-vulnerability-management/tvm-software-inventory) with integrated Microsoft Defender Vulnerability Management.
-  **Scanning for machine vulnerabilities**: [Assess machines for vulnerabilities](auto-deploy-vulnerability-assessment.md) using integrated Defender Vulnerability Management.
- **Scanning for secrets on machines**: Locate plain text secrets in your compute environment with agentless [secrets scanning](secrets-scanning.md).
- **Scanning for malware**: [Scan machines for malware and viruses](agentless-malware-scanning.md) using [Microsoft Defender Antivirus](/microsoft-365/security/defender-endpoint/microsoft-defender-antivirus-windows).

## Defender for Endpoint sensor

When you enable Defender for Servers, Defender for Cloud automatically deploys the Defender for Endpoint sensor on connected machines as follows:

- Windows machines extension: `MDE.Windows`
- Linux machines extension: `MDE.Linux`

Learn about [automatic provisioning requirements](enable-defender-for-endpoint.md#prerequisites) before you start Defender for Servers deployment.


## Azure policy machine configuration

Machine information is gathered for assessment using the Azure Policy machine configuration (formerly known as the guest configuration) extension running on the machine.

Defender for Cloud uses the Azure Policy machine configuration to collect data for assessment, and enforce best practices using [built-in Azure policy initiatives](policy-reference.md), including machine operating system assessment against compute security baselines in the the [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction). The MCSB is Defender for Cloud's default initiative.

- [Learn more](security-baseline-guest-configuration.md) about deployikng the Azure Policy machine configuration extension.
- [Learn more](operating-system-misconfiguration.md) about assessing OS settings against compute security baselines.


## Next steps

After working through these planning steps, you can start deployment:

- [Connect on-premises machines](quickstart-onboard-machines.md) to Azure.
- [Connect AWS accounts](quickstart-onboard-aws.md) to Defender for Cloud.
- [Connect GCP projects](quickstart-onboard-gcp.md) to Defender for Cloud.
- [Enable Defender for Servers](tutorial-enable-servers-plan.md)

In addition, learn about [scaling Defender for Server deployment](plan-defender-for-servers-scale.md).
