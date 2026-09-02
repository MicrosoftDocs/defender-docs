---
title: Container software supply chain security with Defender for Containers
description: Learn how Defender for Containers helps assess container images, associate vulnerability findings with images, and enforce deployment controls for Kubernetes workloads.
ms.topic: concept-article
ms.author: elkrieger
author: Elazark
ms.date: 05/31/2026
#customer intent: As a DevOps engineer, I want to understand how Defender for Containers helps reduce the risk of deploying vulnerable container images.
---

# Container software supply chain security with Defender for Containers

Container software supply chain security helps reduce the risk of deploying vulnerable or untrusted container images into production environments.

Microsoft Defender for Containers supports the [Microsoft Containers Secure Supply Chain (CSSC) framework](/azure/security/container-secure-supply-chain) with capabilities that help you assess container images, associate vulnerability findings with images, and enforce deployment controls for Kubernetes workloads.

Defender for Containers helps you:

- Scan supported container images for vulnerabilities.
- Scan container images in CI/CD pipelines or local development environments before images are pushed to a registry.
- Associate vulnerability findings with container images by signing the vulnerability findings artifact with a Microsoft certificate.
- Create gated deployment security rules that evaluate container images before they're admitted into a Kubernetes cluster.
- Audit or block deployments when container images don't meet the vulnerability conditions defined in your security rules.
- Review container vulnerability findings and security posture recommendations in Defender for Cloud.

## Scan images earlier in the development lifecycle

You can use the [Microsoft Defender for Cloud CLI](/azure/defender-for-cloud/defender-cli-overview) to scan container images for vulnerabilities and misconfigurations in CI/CD pipelines or local development environments.

Scanning images before they're pushed to a registry helps developers identify and remediate issues earlier in the development lifecycle.

## Validate vulnerability findings

Defender for Containers signs the vulnerability findings artifact with a Microsoft certificate for integrity and authenticity. The signed artifact is associated with the container image in the registry for validation.

The signed artifact doesn't sign the container image itself. It signs the vulnerability findings associated with the image, so the findings can be validated and used by other Defender for Containers capabilities.

## Enforce deployment controls

Gated deployment uses vulnerability scan results to evaluate container images before they're admitted into a Kubernetes cluster.

You can create security rules that audit or deny deployments when images don't meet your organization's vulnerability policy. Use audit mode to monitor the effect of rules before enforcement. Use deny mode when you're ready to block deployments that violate configured rules.

Learn more about [gated deployment for Kubernetes container images](runtime-gated-overview.md).

## Related content

- [Introduction to Microsoft Defender for Containers](defender-for-containers-introduction.md)
- [Vulnerability assessments for supported environments](agentless-vulnerability-assessment-azure.md)
- [Configure gated deployment](enablement-guide-runtime-gated.md)
- [Microsoft Containers Secure Supply Chain framework](/azure/security/container-secure-supply-chain)