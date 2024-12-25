---
title: Azure Kubernetes Service (AKS) Security Dashboard
description: Explain the views and actions in the AKS security Dashboard to enable and protect an individual cluster with Defender for Containers.
author: ehorwitz-ms
ms.author: dacurwin
ms.topic: conceptual
ms.date: 12/19/2024

CustomerIntent: As the person responsible for the security of a cluster, I want know what views and actions the cluster security dashboard provides, so I can remediate security issues in the cluster.
---

# Azure Kubernetes Service (AKS) Security Dashboard (Preview)

The dashboard consolidates operational and security information in one view, empowering platform engineering teams to understand the security risks in their Kubernetes environment, quickly remediate issues, and reduce the risk of overlooking security threats to the cluster.

The AKS Security Dashboard allows the user to:
- View the security posture of the cluster.
- Enable Defender for Container plan and configure extensions for the specific cluster resource.
- Review vulnerability assessment recommendations.
- Review configurations of the running cluster and containers that deviate from security best practices ("misconfigurations"), together with guided or automated remediation.
- Assign an owner to a recommendation or misconfiguration responsible for remediation by a specified date. (Available with Defender Cloud Security Posture Management (DCSPM) enabled for the cluster.)

## Prerequisites

The AKS Security Dashboard only shows security vulnerabilities and misconfigurations for a cluster if at least one of the following plans is enabled:
- [Defender for Containers on the subscription](tutorial-enable-containers-azure.md) or [the individual cluster](#setting-the-defender-for-containers-plan)
- [DCSPM](tutorial-enable-cspm-plan.md) on the subscription

> !NOTE
> When enabling Defender for Cloud for a single cluster in a subscription, a subscription owner must enable Defender for Cloud plans. A resource group contributor or higher role can enable or disable the Azure Policy extension for Defender for Containers.

When [enabling Defender for Containers for a single cluster](#setting-the-defender-for-containers-plan):
- Security misconfigurations are shown.
- Vulnerability assessment recommendations are shown if Defender for Containers is enabled for the subscription.
- [Risk prioritization](risk-prioritization.md#how-is-risk-calculated) is only calculated by the recommendations available to the single cluster. If the subscription of the single cluster has DCSPM enabled, risk prioritization is based on multiple resource risk factors, including attack path analysis.

## Using the AKS Security Dashboard 

The AKS Security Dashboard is accessed from a cluster resource pane by selecting **Microsoft Defender for Cloud** in the menu list. The dashboard shows:

- The **Security findings for this cluster** summary. It shows the total vulnerabilities and misconfigurations by risk level.
- The **Vulnerabilities** and **Misconfigurations** tabs. Each of the tabs shows a summary of the risk level and list of recommendations.
- The **Microsoft Defender for Containers status** for the cluster and the option to configure its coverage

### Remediation of vulnerabilities and misconfigurations

In both the **Vulnerabilities** and **Misconfiguration** tabs, selecting one of the recommendations opens a pane showing the full details of the recommendation. In the details pane, the user can:

- View the full details of the recommendation and the steps for remediation.
- Remediate the issue by selecting the **Quick Fix** option. Some recommendations might require the user to remediate the issue by selecting **Additional Details**.
- Assign an owner that is responsible for remediation of the issue. Selecting **Assign Owner** opens a pane where the owner name, remediation time frame, periodic email reminders can be set.

The user can select multiple recommendations using the checkbox beside each recommendation and then select **Assign owner** in the dashboard ruler, to assign a single owner to all of them.

Selecting **Download CSV report** downloads the cluster vulnerabilities and misconfigurations as a CSV file. The cluster vulnerabilities and misconfigurations can also be retrieved using the [Defender for Cloud REST API](/rest/api/defenderforcloud-composite/assessments?view=rest-defenderforcloud-composite-stable).

### Setting the Defender for Containers plan

Selecting **Settings** of **Microsoft Defender for Containers status** opens a pane for the user to enable or disable the Defender for Containers plan **for the cluster only**. After the user toggles the Defender for Containers plan to **on**, the following extensions can then be toggled:

- **Kubernetes API access** - Enable agentless Container Security Posture Management, runtime vulnerability assessment and response actions.
- **Registry access** - Enable agentless vulnerability assessment for registry images.
- **Azure policy** - Enable the deployment of an agent on the cluster to harden the data plane.

The Defender for Containers plan for the cluster can also be set using the [REST API commands](/rest/api/defenderforcloud-composite/pricings/update).
