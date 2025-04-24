---
title: Defender for Containers gated deployment of container images to a Kubernetes cluster
description: Understand Defender for Containers gated deployment of container images to a Kubernetes cluster.
ms.topic: concept-article
ms.author: dacurwin
author: dcurwin
ms.date: 3/12/2025
#customer intent: As a devops person, I want to understand how Defender for Containers gated deployment helps secure a Kubernetes cluster.
---

# Defender for Containers gated deployment of container images to a Kubernetes cluster

Gated deployment is an important practice to assess container image's eligibility against security rules before deployment to a Kubernetes environment.

A security rule defines an action to take if certain conditions are met within a defined resource scope. The gated deployment admissions controller examines a container image and its vulnerability findings artifact against the security rules relevant to the resource scope. The action to be taken by the admissions controller is defined by the security rule and can either be **audit** (deploy and create a security alert for review), or **deny** (no deployment and create a security alert for review).

Multiple security rules may affect the deployment of a container image. The conditions of all of the security rules are evaluated from the most severe to the least severe vulnerability. The evaluation stops at the first condition fulfilled by a vulnerability and the action specified by that security rule is taken.
Next steps

- Learn more about the Defender for Cloud [Defender plans](https://github.com/MicrosoftDocs/azure-security-docs/blob/main/articles/defender-for-cloud/defender-for-cloud-introduction.md#protect-cloud-workloads).

- Check out [common questions](https://github.com/MicrosoftDocs/azure-security-docs/blob/main/articles/defender-for-cloud/faq-defender-for-containers.yml) about Defender for Containers.


## Prerequisites

| Aspect   | Details |
| -------- | -------- |
| **Required Environmental Requirements** | Defender for Containers plan should be enabled. Defender sensor in Azure toggle under the Defender for Containers plan must be activated.  This feature currently works on Azure AKS and Azure ACR only.   AKS must be on version 1.31 or higher to use this feature.
| **Required Roles & Permissions**| Subscription owner permissions.   Cluster owner permissions
| **Supported Clouds**| Available on Azure, Commercial Cloud only| 

The following new preview recommendations report on runtime container vulnerabilities and registry image vulnerabilities, and don't count toward secure score while in preview.  The scan engine for the new recommendations is the same as the current GA recommendations, and provides the same findings. The new recommendations are best suited for customers that use the new risk-based view for recommendations and have the Defender CSPM plan enabled.

> [!NOTE] Limitations
> Current release available under the following limitations 
>
| Header 1 | Header 2 |
| -------- | -------- |
| Cell 1   | Cell 2   |
| Cell 3   | Cell 4   |

