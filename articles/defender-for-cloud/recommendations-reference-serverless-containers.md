---
title: Reference table for serverless containers security recommendations
description: This article lists Microsoft Defender for Cloud security recommendations for serverless containers.
ms.service: defender-for-cloud
ms.topic: reference
ms.date: 05/27/2026
author: ElazarK
ms.author: elkrieger
ms.custom: generated
ai-usage: ai-assisted
---

# Serverless containers security recommendations

This article lists all serverless containers security recommendations you might see in Microsoft Defender for Cloud.

The recommendations that appear in your environment are based on the resources that you're protecting and on your customized configuration. You can [see the recommendations in the portal](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/5) that apply to your resources.

To learn about actions that you can take in response to these recommendations, see [Remediate recommendations in Defender for Cloud](implement-security-recommendations.md).

These recommendations cover Azure Container Apps, Azure Container Instances, and AWS - Amazon Elastic Container Service (ECS) Fargate workloads. They also include Identity and Access Management (IAM) permissions guidance.

> [!TIP]
> If a recommendation description says *No related policy*, it usually depends on another recommendation that has the policy.
>
> Defender for Cloud maps policy links to foundational recommendations. This approach helps keep policy management simpler.

## Serverless containers recommendations

### Authentication should be enabled on Azure Container Apps

**Description**: Defender for Cloud identified Azure Container Apps with ingress enabled where platform-managed authentication isn't configured. Enabling authentication ensures that only authorized users and services can access application endpoints.
(No related policy)

**Severity**: Not specified

### Azure Container Apps should not be exposed to the public internet unless required

**Description**: Defender for Cloud identified one or more Azure Container Apps configured with external ingress, which makes the application publicly accessible from the internet.
(No related policy)

**Severity**: Not specified

### Managed identities assigned to Azure Container Apps should follow least privilege

**Description**: Defender for Cloud identified that the Azure Container App managed identity or service principal has overly permissive access policies (privileged administrator roles with wide scope) to other resources.
(No related policy)

**Severity**: Not specified

### Azure Container Instances should not be publicly exposed

**Description**: Defender for Cloud detected an Azure Container Instance configured with a public IP address, which makes the application publicly accessible from the internet on the configured ports.
(No related policy)

**Severity**: Not specified

### Managed identities assigned to Azure Container Instances should follow least privilege

**Description**: Defender for Cloud identified that the Azure Container Instance managed identity or service principal has overly permissive access policies (privileged administrator roles with wide scope).
(No related policy)

**Severity**: Not specified

### IAM task roles assigned to ECS Fargate tasks should follow least privilege

**Description**: Defender for Cloud identified IAM task roles with excessive permissions (for example, AdministratorAccess, wildcard actions, or permissive custom policies). Over-privileged IAM task roles increase the impact of a compromised container.
(No related policy)

**Severity**: Not specified

### ECS Fargate tasks should not run containers with elevated privileges

**Description**: Defender for Cloud detected ECS Fargate task definitions where containers run as the root user or request extra Linux capabilities. Running containers with elevated privileges increases the risk of unauthorized file access and privilege escalation.
(No related policy)

**Severity**: Not specified

### Read-only root filesystem should be enabled for ECS Containers

**Description**: Defender for Cloud identified ECS task definitions with writable root filesystems. This configuration poses a risk by allowing runtime modifications to critical system paths, potentially enabling tampering, persistence of unauthorized changes, and exploitation of mutable directories.
(No related policy)

**Severity**: Not specified

### ECS Fargate tasks should not be publicly exposed

**Description**: Defender for Cloud identified one or more ECS Fargate tasks that are publicly accessible from the internet due to their network configuration. Public exposure increases the likelihood of unauthorized access and exploitation of application-level vulnerabilities.
(No related policy)

**Severity**: Not specified

### Logging should be configured for ECS Exec on ECS clusters

**Description**: Defender for Cloud identified that an ECS cluster associated with services using ECS Exec doesn't have audit logging properly configured. Without explicit logging, command activity might go unrecorded, posing a risk of undetected unauthorized access.
(No related policy)

**Severity**: Not specified

### ECS Exec should be disabled on Fargate ECS services

**Description**: Defender for Cloud identified that ECS Exec is enabled on an Amazon ECS Fargate service. ECS Exec allows command execution inside running containers via AWS Systems Manager, exposing an interactive access path. Unless explicitly required for approved debugging scenarios, ECS Exec should remain disabled.
(No related policy)

**Severity**: Not specified

## Related content

- [Learn about security recommendations](security-policy-concept.md)
- [Review security recommendations](review-security-recommendations.md)