---
title: Cluster Security Dashboard
description: Explain the views and action in the Cluster Security Dashboard.
author: ehorwitz-ms
ms.author: dacurwin
ms.topic: conceptual
ms.date: 12/19/2024

CustomerIntent: As the person responsible for the security of a cluster, I want know what views and actions the cluster security dashboard provides, so I can remediate security issues in the cluster.
---

# Cluster Security Dashboard views and actions (Preview)

The Cluster Security Dashboard gives the user the ability to view an individual cluster's security posture and to remediate any security issues.

The Cluster Security Dashboard allows the user to:
- View the security posture of the cluster.
- Enable Defender for Container plans for the specific cluster resource.
- Review vulnerability assessment recommendations for containers and node pools.
- Review cluster misconfigurations.
- Remediate the vulnerabilities and misconfigurations.
- Assign an owner to a recommendation or misconfiguration responsible for remediation by a specified date.

## Prerequisites

The Cluster Security Dashboard only shows security vulnerabilities and misconfigurations for a cluster if at least one of the following plans is enabled:
- [Defender for Containers on the subscription](tutorial-enable-containers-azure.md) or [the individual cluster](#setting-the-defender-for-containers-plan)
- [Defender Cloud Security Posture Management (DCSPM)](tutorial-enable-cspm-plan.md) on the subscription

In addition, the first cluster in a subscription must be onboarded to Defender for Cloud plans by a subscription owner. The Azure Policy extension can only enabled by a cluster contributor or higher role.

When [enabling Defender for Containers for an individual cluster](#setting-the-defender-for-containers-plan):
- Only container image vulnerability assessments, data plane hardening, and control plane vulnerability recommendations are performed. Runtime threat protection and node pool vulnerability assessment aren't performed.
- [Risk prioritization](risk-prioritization.md#how-is-risk-calculated) is only calculated by the recommendations available to the individual cluster. If the subscription of the individual cluster has DCSPM enabled, risk prioritization is based on multiple resource risk factors, including attack path analysis.

## Using the Cluster Security Dashboard 

The Cluster Security Dashboard is accessed from a cluster resource pane by selecting **Microsoft Defender for Cloud** in the menu list. The dashboard shows:

- The **Security findings for this cluster** summary. It shows the total vulnerabilities and misconfigurations by risk level.
- The **Vulnerabilities** and **Misconfigurations** tabs. Each of the tabs shows a summary of the risk level and list of recommendations.
- The **Microsoft Defender for Containers status** for the cluster and the option to configure its coverage

### Remediation of vulnerabilities and misconfigurations

In both the **Vulnerabilities** and **Misconfiguration** tabs, selecting one of the recommendations opens a pane showing the full details of the recommendation. In the details pane, the user can:

- View the full details of the recommendation and the steps for remediation.
- Remediate the issue by selecting the **Quick Fix** option. Some recommendations might require the user to remediate the issue by selecting **Additional Details**.
- Assign an owner that is responsible for remediation of the issue. Selecting **Assign Owner** opens a pane where the owner name, remediation time frame, periodic email reminders can be set.

The user can select multiple recommendations using the checkbox beside each recommendation and then select **Assign owner** in the dashboard ruler, to assign a single owner to all of them.

### Setting the Defender for Containers plan

Selecting **Settings** of **Microsoft Defender for Containers status** opens a pane for the user to enable or disable the Defender for Containers plan **for the cluster only**. After the user toggles the Defender for Containers plan to **on**, the following extensions can then be toggled:

- **K8S API access** - Enable agentless Container Security Posture Management, runtime vulnerability assessment and response actions.
- **Registry access** - Enable agentless vulnerability assessment for registry images.
- **Azure policy** - Enable the deployment of an agent on the cluster to harden the data plane.

The Defender for Containers plan for the cluster can also be set using the [REST API commands](/rest/api/defenderforcloud-composite/pricings/update).
