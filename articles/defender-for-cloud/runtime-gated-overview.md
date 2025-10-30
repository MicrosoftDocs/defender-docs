---
title: Secure Kubernetes Deployments with Gated Container Images
description: Enforce container image security in Kubernetes with gated deployment. Learn how to block vulnerable workloads and maintain compliance with Defender for Containers.
#customer intent: As a Kubernetes administrator, I want to enforce security policies for container images so that I can prevent the deployment of vulnerable workloads.
author: dcurwin
ms.author: dacurwin
ms.reviewer: dacurwin
ms.date: 10/29/2025
ms.topic: concept-article
---

# Defender for Containers: Gated Deployment of Container Images to a Kubernetes Cluster

Microsoft Defender for Containers supports **gated deployment**, a capability that enforces container image security policies at deployment time in Kubernetes environments, including Azure Kubernetes Service (AKS), Amazon Elastic Kubernetes Service (EKS), and Google Kubernetes Engine (GKE). This enforcement is based on vulnerability scan results from supported container registries, including Azure Container Registry (ACR), Amazon Elastic Container Registry (ECR), and Google’s Artifact Registry.

Integrated as part of the Kubernetes Admission Controller, gated deployment ensures that only container images meeting your organization’s security requirements run in your Kubernetes environment. It evaluates container images against defined security rules before they're admitted into the cluster, enabling security teams to block vulnerable workloads and maintain compliance.

## Benefits

- Prevents deployment of container images with known vulnerabilities

- Enforces security policies in real-time

- Integrates with existing vulnerability management workflows in Defender for Cloud

- Supports phased rollout: start with Audit mode, then progress to Deny mode

## Enablement Strategy

Many customers already use Defender for Container’s vulnerability scanner. Gated deployment builds on this foundation:

| **Mode** | **Description** |
|----|----|
| Audit | Allows deployment but generates admission monitoring events for vulnerable images that violate security rules |
| Deny | Blocks deployment of images that violate security rules |

Begin with Audit mode to assess impact, then transition to Deny mode for enforcement.

## How It works

- Security rules define conditions (such as CVE severity) and actions (Audit or Deny).

- The admission controller evaluates container images against these rules.

- If a rule is triggered, the defined action is taken.

- Evaluation is based on vulnerability scan results from registries including ACR, ECR, and Google Artifact Registry.

## Key capabilities

- Default Audit rule, to flag image deployment with High or Critical vulnerabilities, is automatically enabled for eligible clusters.

- Time-bound and scoped exemptions.

- Granular rule targeting (such as by cluster, namespace, pod, image).

- Monitoring admission event via Defender for Cloud.

## More resources

For more detailed guidance and support, see the following documentation:

- **Enablement Guide: Configure Gated Deployment in Defender for Containers**  
  Step-by-step instructions for onboarding, rule creation, exemptions, and monitoring.

- **FAQ: Gated Deployment in Defender for Containers**  
  Answers to common customer questions about gated deployment behavior and configuration.

- **Troubleshooting Guide: Gated Deployment and Developer Experience**  
  Help resolving onboarding issues, deployment failures, and interpreting developer-facing messages.
