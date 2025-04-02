---
title: Reference table for all Keyvault security recommendations in Microsoft Defender for Cloud
description: This article lists all Microsoft Defender for Cloud Keyvault security recommendations that help you harden and protect your resources.
ms.service: defender-for-cloud
ms.topic: reference
ms.date: 04/02/2025
ms.custom: generated
ai-usage: ai-assisted
---

# Keyvault security recommendations

This article lists all the Keyvault security recommendations you might see in Microsoft Defender for Cloud. 

The recommendations that appear in your environment are based on the resources that you're protecting and on your customized configuration. You can [see the recommendations in the portal](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/5) that apply to your resources.

To learn about actions that you can take in response to these recommendations, see [Remediate recommendations in Defender for Cloud](implement-security-recommendations.md).

> [!TIP]
> If a recommendation description says *No related policy*, usually it's because that recommendation is dependent on a different recommendation.
>
> For example, the recommendation *Endpoint protection health failures should be remediated* relies on the recommendation that checks whether an endpoint protection solution is installed (*Endpoint protection solution should be installed*). The underlying recommendation *does* have a policy.
> Limiting policies to only foundational recommendations simplifies policy management.

## Azure Keyvault recommendations

### Role-Based Access Control should be used on Keyvault Services

**Description**: To provide granular filtering on the actions that users can perform, use [Role-Based Access Control (RBAC)](/azure/key-vault/general/rbac-guide?branch=main&tabs=azure-cli) to manage permissions in Keyvault Service and configure relevant authorization policies. (Related policy: Azure Key Vault should use RBAC permission model - Microsoft Azure).

**Severity**: High

**Type**: Control plane

## Related content

- [Learn about security recommendations](security-policy-concept.md)
- [Review security recommendations](review-security-recommendations.md)
