---
title: Secure Kubernetes Deployments with Gated Container Images
description: Enforce container image security in Kubernetes with gated deployment. Learn how to block vulnerable workloads and maintain compliance with Defender for Containers.
#customer intent: As a Kubernetes administrator, I want to enforce security policies for container images so that I can prevent the deployment of vulnerable workloads.
author: dcurwin
ms.author: dacurwin
ms.reviewer: dacurwin
ms.date: 10/29/2025
ms.topic: overview
---

# Gated deployment for Kubernetes container images

Microsoft Defender for Containers supports **gated deployment**, which enforces container image security policies at deployment time in Kubernetes environments, including Azure Kubernetes Service (AKS), Amazon Elastic Kubernetes Service (EKS), and Google Kubernetes Engine (GKE). Enforcement uses vulnerability scan results from supported container registries, including Azure Container Registry (ACR), Amazon Elastic Container Registry (ECR), and Google Artifact Registry.

Gated deployment integrates with the Kubernetes admission controller to ensure that only container images that meet your organization's security requirements run in your Kubernetes environment. It evaluates container images against defined security rules before they're admitted into the cluster, enabling security teams to block vulnerable workloads and maintain compliance.

## Benefits

- Prevents deployment of container images with known vulnerabilities
- Enforces security policies in real time
- Integrates with Defender for Cloud vulnerability management workflows
- Supports phased rollout: start in audit mode, then move to deny mode

## Enablement strategy

Many customers already use Microsoft Defender for Containers vulnerability scanner. Gated deployment builds on this foundation:

| **Mode** | **Description** |
|----|----|
| Audit | Lets deployment continue and generates admission events for vulnerable images that violate security rules |
| Deny | Blocks deployment of images that violate security rules |

Start in Audit mode to assess impact, then move to Deny mode to enforce rules.

## How it works

- Security rules define conditions like CVE severity and actions such as audit or deny.
- Admission controller evaluates container images against these rules.
- When a rule matches, the system takes its defined action.
- The admission controller uses vulnerability scan results from registries like ACR, ECR, and Google Artifact Registry.

## Key features

- Use the default Audit rule that automatically flags image deployments with High or Critical vulnerabilities on eligible clusters
- Set time-bound, scoped exemptions.
- Target rules granularly by cluster, namespace, pod, or image.
- Monitor admission events via Defender for Cloud.

## Related content

Get detailed guidance in the following articles:

- [Enablement Guide: Configure Gated Deployment in Defender for Containers](enablement-guide-runtime-gated.md) 
  Step-by-step instructions for onboarding, rule creation, exemptions, and monitoring.

- [FAQ: Gated deployment in Defender for Containers](faq-runtime-gated.md)  
  Answers to common customer questions about gated deployment behavior and configuration.

- [Troubleshooting Guide: Gated Deployment and Developer Experience](troubleshooting-runtime-gated.md)  
  Help resolving onboarding issues, deployment failures, and interpreting developer-facing messages.
