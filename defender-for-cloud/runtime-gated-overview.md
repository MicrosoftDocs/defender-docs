---
title: Gated deployment for Kubernetes container images
description: Learn how gated deployment in Microsoft Defender for Containers uses vulnerability findings to audit or deny Kubernetes deployments.
#customer intent: As a Kubernetes administrator, I want to understand how gated deployment evaluates container images before they're admitted into a cluster.
author: Elazark
ms.author: elkrieger
ms.date: 06/01/2026
ms.topic: overview
ai-usage: ai-assisted
---

# Gated deployment for Kubernetes container images

Gated deployment is a Microsoft Defender for Containers capability that uses an admission controller to evaluate container images before they're admitted into a Kubernetes cluster. It uses vulnerability assessment findings from supported container registries to audit or deny deployments when container images don't meet your organization's vulnerability policy.

Use gated deployment to enforce vulnerability-based controls during Kubernetes deployment. For example, you can audit image deployments with high or critical vulnerabilities, deny deployments that match configured vulnerability conditions, apply rules to specific scopes such as clusters or namespaces, and create exemptions for specific vulnerabilities or resources.

## How gated deployment works

1. Defender for Containers scans supported container images.

1. Vulnerability findings are associated with the image.

1. A user or pipeline requests to deploy the image to a Kubernetes cluster.

1. The admission controller evaluates the image against gated deployment rules.

1. If a rule matches, gated deployment applies the configured action.

The rule action determines what happens to the deployment:

- **Audit** allows the deployment and creates an admission event for review.
- **Deny** blocks deployments that match the rule conditions.

If vulnerability findings artifacts aren't available for an image, gated deployment behavior depends on the rule configuration.

## Default and custom rules

After the required prerequisites are met, Defender for Containers creates a default audit rule that flags image deployments with high or critical vulnerabilities.

You can create custom rules to define:

- The cloud and resource scope of the rule.
- The vulnerability conditions that trigger the rule.
- Exemptions for specific vulnerabilities or resources.

## Monitoring

You can monitor gated deployment events to review rule evaluations, triggered actions, affected resources, and rule configuration details. Use these events to help refine rule scope, conditions, and exemptions.

Learn how to [monitor gated deployment events](enablement-guide-runtime-gated.md#monitor-gated-deployment-events).

## Supported environments and registries

Gated deployment is available for supported Kubernetes environments and container registries. For current support details, see the [Defender for Containers support matrix](support-matrix-defender-for-containers.md#containers-software-supply-chain-protection-features).

## Related content

- [Configure gated deployment rules for Kubernetes container images](enablement-guide-runtime-gated.md)

- [Configure gated deployment for AKS using Infrastructure as Code](gated-deployment-infrastructure-as-code.md)

- [Troubleshoot gated deployment in Kubernetes](troubleshooting-runtime-gated.md)

- [Vulnerability assessments for supported environments](agentless-vulnerability-assessment-azure.md)