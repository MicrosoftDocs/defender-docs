---
title: Plan a Defender for Servers deployment to protect on-premises and multicloud servers
description: Design a solution to protect on-premises and multicloud servers with Microsoft Defender for Servers.
ms.topic: conceptual
ms.date: 05/11/2023
author: dcurwin
ms.author: dacurwin
---
# Plan Defender for Servers deployment

The Defender for Servers plan in Microsoft Defender for Cloud reduces security risk by providing actionable recommendations to improve and remediate machine security posture. Defender for Servers also helps to protect machines against real-time security threats and attacks.

This guide helps you design and plan an effective Defender for Servers deployment.

## About this guide

The intended audience of this guide is cloud solution and infrastructure architects, security architects and analysts, and anyone who's involved in protecting cloud and hybrid servers and workloads.

The guide answers these questions:

- What does Defender for Servers do and how is it deployed?
- Where is my data stored and when do I need a Log Analytics workspace?
- How do I control access to Defender for Servers resources?
- Which Defender for Servers plan should I choose, and where should I deploy the plan?
- What agents and extensions are needed in my deployment?
- How do I scale a deployment?

## Before you begin

Before you begin deployment planning:

- Learn more about [Defender for Cloud](defender-for-cloud-introduction.md) capabilities, and [review pricing details](https://azure.microsoft.com/pricing/details/defender-for-cloud/).
- [Get an overview](defender-for-servers-overview.md) of Defender for Servers.
- If you're deploying for AWS machines or GCP projects, review the [multicloud planning guide](plan-multicloud-security-get-started.md).
- Onboarding AWS/GCP and on-premises machines as Azure Arc VMs ensures that you can use all features in Defender for Servers. Before you begin planning, learn more about [Azure Arc](/azure/azure-arc/overview).


## Deployment steps

The following table summarizes Defender for Servers deployment steps.

**Step** | **Details** | **Outcome**
--- | --- | ---                      | 
**Connect AWS/GCP machines**   | To protect AWS and GCP machines with Defender for Servers, [connect AWS accounts](quickstart-onboard-aws.md) and [GCP projects](quickstart-onboard-gcp.md) to Defender for Cloud.<br/><br/> You can enable Defender for Cloud plans, including Defender for Servers, as part of the connection process.<br/><br/> To take full advantage of Defender for Servers features, we recommend onboarding AWS and GCP machines as Azure Arc VMs. Installation of the Azure Arc agent is available as part of the connection process. | AWS and GCP machines are successfully onboarded to Defender for Cloud. 
**Connect on-premises machines** | To protect on-premises machines, we recommend [onboarding on-premises machines as Azure Arc VMs](quickstart-onboard-machines.md).<br/><br/> You can [directly onboard on-premises machines to Defender for Cloud](onboard-machines-with-defender-for-endpoint.md). However, with direct onboarding you won't have full access to Defender for Servers Plan 2 features. | On-premises machines are successfully onboarded to Defender for Cloud 
**Enable Defender for Servers** | [Deploy a Defender for Servers plan](tutorial-enable-servers-plan.md).
**Take advantage of free data ingestion** | To take advantage of 500 MB of free daily ingestion for specific data types, machines must be running the Azure Monitor Agent (AMA), and be connected to a Log Analytics workspace. [Learn more](data-ingestion-benefit.md).<br/><br/> The benefit is granted for the supported data types on the Log Analytics workspace to which machines report.
**Prepare for OS assessment** | For Defender for Servers Plan 2 to [assesses operation system configuration settings](operating-system-misconfiguration.md) against compute security baselines in Microsoft Cloud Security Benchmark, machines must be running the Azure Policy machine configuration extension. [Learn more](security-baseline-guest-configuration.md) about setting up the extension. | Defender for Servers Plan 2 collects OS configuration information for assessment.
**Set up file integrity monitoring** | After enabling Defender for Servers Plan 2, you [set up file integrity monitoring after enabling the plan](file-integrity-monitoring-overview.md).<br/><br/> You need a Log Analytics workspace for file integrity monitoring. You can use an existing workspace, or create a new workspace when you configure the feature. | Defender for Servers monitors critical file changes. 

## Next steps

After kicking off the planning process, review the [second article in this planning series](plan-defender-for-servers-data-workspace.md) to understand how your data is stored.
