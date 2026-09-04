---
title: Determine data residency requirements and agent considerations for multicloud security
description: Learn about determining data residency requirements when planning multicloud deployment with Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 07/03/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1013
---

# Determine data residency requirements

## Overview

This guide helps you determine data residency requirements for a multicloud deployment that uses cloud security posture management (CSPM) and cloud workload protection platform (CWPP) solutions in Microsoft Defender for Cloud.

<a name="goal"></a>
## Data residency planning goals

Identify data residency requirements for your multicloud deployment and understand how Defender for Cloud plans and agents affect where data is processed and stored.

<a name="get-started"></a>
## Get started with data residency planning

When you protect assets across clouds, identify which plans to enable and whether each plan requires agents.

As part of this analysis, identify regional and legal requirements for data handling.

## Agent considerations for data residency

Consider data residency and data handling implications for the agents and extensions used by Defender for Cloud.

- **CSPM:** Cloud security posture management (CSPM) functionality in Defender for Cloud is agentless. No agents are required for CSPM to work.
- **CWPP:** Cloud workload protection platform (CWPP) functionality in Defender for Cloud can require agents to collect data.

<a name="defender-for-servers-plan"></a>
## Data residency considerations for Defender for Servers

Agents are used in the Defender for Servers plan as follows:

- Non-Azure public clouds connect to Azure by leveraging the [Azure Arc](/azure/azure-arc/servers/overview) service.
- The [Azure Connected Machine agent](/azure/azure-arc/servers/agent-overview) is installed on multicloud machines that onboard as Azure Arc machines. Defender for Cloud should be enabled in the subscription in which the Azure Arc machines are located.
- Defender for Cloud leverages the Connected Machine agent to install extensions (such as Microsoft Defender for Endpoint) that are needed for [Defender for Servers](./defender-for-servers-introduction.md) functionality.

<a name="defender-for-containers-plan"></a>
## Data residency considerations for Defender for Containers

[Defender for Containers](./defender-for-containers-introduction.md) protects your multicloud container deployments running in:

- **Azure Kubernetes Service (AKS)** - Microsoft's managed service for developing, deploying, and managing containerized applications.
- **Amazon Elastic Kubernetes Service (EKS) in a connected AWS account** - Amazon's managed service for running Kubernetes on AWS without needing to install, operate, and maintain your own Kubernetes control plane or nodes.
- **Google Kubernetes Engine (GKE) in a connected GCP project** - Google’s managed environment for deploying, managing, and scaling applications using GCP infrastructure.
- **Other Kubernetes distributions** - using [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview), which allows you to attach and configure Kubernetes clusters running anywhere, including other public clouds and on-premises.

Defender for Containers has both sensor-based and agentless components.

- **Agentless collection of Kubernetes audit log data**: [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) or GCP Cloud Logging collects audit log data and sends the data to Defender for Cloud for further analysis.
- **Agentless collection for Kubernetes inventory**: Collect data on your Kubernetes clusters and their resources, such as: Namespaces, Deployments, Pods, and Ingresses.
- **Sensor-based Azure Arc-enabled Kubernetes**: Connects your EKS and GKE clusters to Azure using [Azure Arc agents](/azure/azure-arc/kubernetes/conceptual-agent-overview), so that they’re treated as Azure Arc resources.
- **[Defender sensor](defender-for-cloud-glossary.md#defender-sensor)**: A DaemonSet that collects signals from hosts by using extended Berkeley Packet Filter (eBPF) technology and provides runtime protection. The extension is registered with a Log Analytics workspace and used as a data pipeline. Kubernetes audit log data isn't stored in the Log Analytics workspace.
- **Azure Policy for Kubernetes**: configuration information is collected by Azure Policy for Kubernetes.
  - Azure Policy for Kubernetes extends the open-source Gatekeeper v3 admission controller webhook for Open Policy Agent.
  - The extension registers as a web hook to Kubernetes admission control and makes it possible to apply at-scale enforcement, safeguarding your clusters in a centralized, consistent manner.

> [!IMPORTANT]
> Kubernetes audit log data collection uses the Amazon EKS or GCP logging service in the source cloud. Confirm regional storage and transfer behavior to meet your organization's privacy and internal residency requirements.

<a name="defender-for-databases-plan"></a>
## Data residency considerations for Defender for Databases

For the [Defender for Databases plan](./quickstart-enable-database-protections.md) in a multicloud scenario, you use Azure Arc to manage multicloud Structured Query Language (SQL) Server databases. The SQL Server instance is installed on a virtual or physical machine connected to Azure Arc.

- Automatic SQL server discovery and registration needs to be set to On to allow SQL database discovery on the machines.
- The [Azure Connected Machine agent](/azure/azure-arc/servers/agent-overview) is installed on machines connected to Azure Arc.
- The Defender for Databases plan should be enabled in the subscription in which the Azure Arc machines are located.
- The Log Analytics agent for Microsoft Defender SQL Servers should be provisioned on the Azure Arc machines. It collects security-related configuration settings and event logs from machines.

For AWS and GCP resources protected by Defender for Cloud, the resource location is determined directly by AWS and GCP.

<a name="next-step"></a>
## Next steps

> [!div class="nextstepaction"]
> [Determine compliance requirements](plan-multicloud-security-determine-compliance-requirements.md)
