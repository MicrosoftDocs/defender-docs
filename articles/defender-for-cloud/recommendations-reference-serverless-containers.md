---
title: Reference table for serverless containers security recommendations
description: This article lists Microsoft Defender for Cloud security recommendations for serverless containers.
ms.service: defender-for-cloud
ms.topic: reference
ms.date: 06/03/2026
author: ElazarK
ms.author: elkrieger
ms.custom: generated
ai-usage: ai-assisted
---

# Serverless containers security recommendations

This article lists all serverless containers security recommendations you might see in Microsoft Defender for Cloud.

The recommendations that appear in your environment are based on the resources that you're protecting and on your customized configuration. You can [see the recommendations in the portal](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/5) that apply to your resources.

To learn about actions that you can take in response to these recommendations, see [Remediate recommendations in Defender for Cloud](implement-security-recommendations.md).

These recommendations cover Azure Container Apps and Azure Container Instances workloads.

> [!TIP]
> If a recommendation description says *No related policy*, it usually depends on another recommendation that has the policy.
>
> Defender for Cloud maps policy links to foundational recommendations. This approach helps keep policy management simpler.

## Serverless containers recommendations

### Authentication should be enabled on Azure Container Apps

**Description**: Defender for Cloud identified Azure Container Apps with ingress enabled where platform-managed authentication isn't configured. Enabling authentication ensures that only authorized users and services can access application endpoints.
(No related policy)

**Severity**: High

### Azure Container Apps should not be exposed to the public internet unless required

**Description**: Defender for Cloud identified one or more Azure Container Apps configured with external ingress, which makes the application publicly accessible from the internet.
(No related policy)

**Severity**: High

### Managed identities assigned to Azure Container Apps should follow least privilege

**Description**: Defender for Cloud identified that the Azure Container App managed identity or service principal has overly permissive access policies (privileged administrator roles with wide scope) to other resources.
(No related policy)

**Severity**: High

### Azure Container Instances should not be publicly exposed

**Description**: Defender for Cloud detected an Azure Container Instance configured with a public IP address, which makes the application publicly accessible from the internet on the configured ports.
(No related policy)

**Severity**: High

### Managed identities assigned to Azure Container Instances should follow least privilege

**Description**: Defender for Cloud identified that the Azure Container Instance managed identity or service principal has overly permissive access policies (privileged administrator roles with wide scope).
(No related policy)

**Severity**: High

## Related content

- [Learn about security recommendations](security-policy-concept.md)
- [Review security recommendations](review-security-recommendations.md)