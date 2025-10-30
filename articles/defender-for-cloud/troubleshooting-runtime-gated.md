---
title: Troubleshoot Gated Deployment in Kubernetes
description: Troubleshoot Gated Deployment in Kubernetes with this guide. Resolve onboarding, rule configuration, and exclusion issues to secure your container images.
#customer intent: As a security team member, I want to troubleshoot why Gated Deployment is not active after enabling Defender for Containers so that I can ensure container image security policies are enforced.
author: dcurwin
ms.author: dacurwin
ms.reviewer: dacurwin
ms.date: 10/29/2025
ms.topic: concept-article
---

# Troubleshooting Guide: Gated Deployment and Developer Experience

This guide helps security teams and developers resolve common issues encountered when configuring or using Gated Deployment in Kubernetes with Microsoft Defender for Containers.

Gated Deployment enforces container image security policies at deployment time, based on vulnerability scan results from supported container registry services. It integrates with the Kubernetes admission controller to evaluate container images before they're admitted into the cluster.

## Onboarding and Configuration Issues

### Issue: Gated deployment isn't active after enabling Defender for Containers

**Possible causes:**

- Required plan extensions are disabled

- Defender Sensor is disabled or not provisioned to the cluster

- AKS version is earlier than 1.31

- Registry access or security findings are disabled

**Resolution:**

- Confirm the following toggles are enabled in the Defender for Containers plan:

  - Defender Sensor

  - Registry Access

  - Security Findings

- Ensure your AKS cluster is running version 1.31 or higher

- Verify that the cluster has access to the container registry (ACR) and that Microsoft Entra ID authentication is configured. For AKS clusters, ensure that the cluster has a *kubelet* identity, and that the admission controller pod's service account is included in the *kubelet* identity’s federated credentials.

### Issue: Security rule not triggering

**Possible causes:**

- Rule scope doesn't match the deployed resource.

- CVE conditions aren't met.

- Image deployed before scan results were available.

**Resolution:**

- Review the rule’s scope and matching criteria.

- Confirm that the image has vulnerabilities that match the rule’s conditions.

- Make sure the image resides in a supported container registry that's located within a subscription, account, or project where registry access and security findings are enabled.

- Ensure Defender for Cloud scans the image before deployment. If not, gating doesn't apply.  
  > [!NOTE]
  > Defender for Containers scans an image residing in a supported container registry within a few hours following the initial push event. For more information about scanning triggers, see [Vulnerability assessments for Defender for Container supported environments](/azure/defender-for-cloud/agentless-vulnerability-assessment-azure?tabs=azure-new%2Cazure-old#scanning-images-in-defender-for-containers-supported-registries).

## Deny mode deployment failures

## Exclusion issues

### Issue: Exclusion not applied

**Possible causes:**

- Exclusion scope doesn't match the resource

- Exclusion expired

- Matching criteria misconfigured

**Resolution:**

- Review the Exclusion configuration during rule creation

- Confirm the Exclusion is still active

- Check that the resource (for example, image, pod, namespace) matches the Exclusion criteria

**\[Insert screenshot: Exclusion configuration panel with time-bound toggle\]**

## Developer experience and CI/CD integration

Gated deployment introduces enforcement at deployment time. Developers might encounter specific messages or behaviors when deploying container images.

### Common developer messages

| **Scenario** | **Message** |
|----|----|
| Image blocked due to CVE | @ENG to provide detail |
| Image blocked due to missing scan results | @ENG to provide detail |
| Image allowed but monitored (Audit mode) | Admission request Allowed. A Security scan is running in the background (audit mode). Learn more: aka.ms/KubernetesDefenderAuditRule |
| Image allowed before scan completed but monitored (Audit mode) | @ENG to provide detail |

**\[Insert screenshot: Admission Monitoring view showing developer-facing results\]**

## Best practices for developers

- Ensure images are scanned before deployment to avoid bypassing gating

- Use Audit mode during initial rollout to monitor impact without blocking

- Coordinate with security teams to request Exclusions when needed

- Monitor the Admission Monitoring view to understand rule evaluations and enforcement

## More resources

For more detailed guidance and support, see the following documentation:

- **Overview: Gated Deployment of Container Images to a Kubernetes Cluster**  
  Introduction to the feature, its value, and how it works

- **Enablement Guide: Configure Gated Deployment in Defender for Containers**  
  Step-by-step instructions for onboarding, rule creation, Exclusions, and monitoring

- **FAQ: Gated Deployment in Defender for Containers**  
  Answers to common customer questions about gated deployment behavior and configuration
