---
title: Gated Deployment FAQ for Defender for Containers
description: Find answers to common questions about gated deployment in Defender for Containers, including rule creation, exemptions, and multicloud support.
#customer intent: As a Kubernetes administrator, I want to understand gated deployment so that I can enforce container image security policies in my cluster.
author: dcurwin
ms.author: dacurwin
ms.reviewer: dacurwin
ms.date: 10/29/2025
ms.topic: concept-article
---

# Frequently asked questions about gated deployment in Defender for Containers

This FAQ addresses common questions about gated deployment in Microsoft Defender for Containers. Gated deployment enforces container image security policies at deployment time in supported Kubernetes environments, based on vulnerability scan results from integrated container registries.

## What is gated deployment?

Gated deployment is a security feature that evaluates container images against defined security rules before they're admitted into a Kubernetes cluster.

## What's the difference between audit and deny mode?

| **Mode** | **Behavior**                                                 |
|----------|--------------------------------------------------------------|
| Audit    | Allows deployment but generates monitoring events for review |
| Deny     | Blocks deployment of images that violate security rules      |

Use audit mode for the initial rollout to assess impact. Deny mode enforces policy by preventing deployment of noncompliant images.

## Is there a default rule?

Yes. If you meet all prerequisites, Defender for Containers automatically creates a default audit rule that flags container images with high or critical vulnerabilities.

## What happens if I deploy an image before scan results are available?

By default, if scan results aren't yet available in the container registry, gated deployment doesn't apply. The image deploys without enforcement. You can update this setting during rule creation to block images without scan results.

## Where can I view rule evaluations and enforcement results?

All Gated Deployment events appear in the **Admission Monitoring** view in Defender for Cloud. The view shows rule evaluations, triggered actions, and affected resources.

## Can I exempt specific CVEs or resources?

Yes, you can configure exemptions during rule creation. Supported exemption types include:

- CVE
- Deployment
- Image
- Namespace
- Pod
- Registry
- Repository

Exemptions can be scoped and time-bound.

## Can I set an expiration for exemptions?

Yes, you can. When creating an exemption, enable the **Time-bound** toggle and select an expiration date. The exemption expires automatically at the end of the selected day.

## Does Deny mode affect deployment performance?

Yes. Deny mode might introduce a 1–2 second delay during deployment due to real-time policy enforcement.

## Can I manage exemptions or rules through API or CLI?

Currently, you manage Gated Deployment through the Defender for Cloud portal. You create rules and configure exemptions through the UI.

## Is Gated Deployment supported in multicloud environments?

Yes, Gated Deployment supports Azure, AWS, and GCP cloud environments and Kubernetes platforms. It includes registry integration for vulnerability scanning.

## Related content

For more detailed guidance and support, see the following documentation:

- [Overview: Gated Deployment of Container Images to a Kubernetes Cluster](runtime-gated-overview.md)  
  Introduction to the feature, its value, and how it works.

- [Enablement Guide: Configure Gated Deployment in Defender for Containers](enablement-guide-runtime-gated.md)  
  Step-by-step instructions for onboarding, rule creation, exemptions, and monitoring.

- [Troubleshooting Guide: Gated Deployment and Developer Experience](troubleshooting-runtime-gated.md)  
  Help resolving onboarding issues, deployment failures, and interpreting developer-facing messages.
