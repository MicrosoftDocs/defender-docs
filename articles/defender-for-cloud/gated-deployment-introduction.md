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

## Prerequisites

| Aspect   | Details |
| -------- | -------- |
| **Required Environmental Requirements** | <br> * **Defender for Containers plan** should be enabled. <br> * **Defender sensor** in Azure toggle under the Defender for Containers plan must be activated. <br> *  This feature currently works on **Azure AKS** and **Azure ACR** only.  <br> *  **AKS** must be on version **1.31** or higher to use this feature.
| **Required Roles & Permissions**| <br> *  Subscription owner permissions. <br> *  Cluster owner permissions
| **Supported Clouds**| <br> * Available on **Azure**, **Commercial Cloud** only| 

## Limitations
- If the image is deployed before the MDVM scan for vulnerability assessment, no gating is applied, and the image gets deployed
- **Kubelet Identity Requirement:** Automatic installation can't be applied to clusters without a kubelet identity. Clusters using service principals instead of identities aren't supported due to the lack of pod identity support.
- **Registry Support:** Initially, only registries with Azure Active Directory (AAD) authentication are supported. Customers need to enable secret access. This feature will be added in the future when CLI support is available. In the meantime, ARM configuration can be used)
- **OIDC and Workload Identity:** During installation, we enable OpenID Connect (OIDC) and workload identity on the cluster, and add federated credentials to the kubelet identity. 
- **Agent Deletion:** Automatic deletion of agents (Tivan and Gating) isn't supported.Tivan indicates that we can't determine if we installed the agents or if they were installed via CLI/ARM, so we don't delete them
- **Multi-Arch Image Support:** Currently, there isn't support for multi-architecture images.

## Next steps
- Learn how to enable your [Gated Deployment functionality](https://github.com/MicrosoftDocs/azure-security-docs/blob/main/articles/defender-for-cloud/enable-gated-deployment.md).
- Learn more about the Defender for Cloud [Defender plans](https://github.com/MicrosoftDocs/azure-security-docs/blob/main/articles/defender-for-cloud/defender-for-cloud-introduction.md#protect-cloud-workloads).
- Check out [common questions](https://github.com/MicrosoftDocs/azure-security-docs/blob/main/articles/defender-for-cloud/faq-defender-for-containers.yml) about Defender for Containers.


