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

**Evaluated resource**: Azure Keyvault

**Recommendation purpose**: When using the Access Policy permission model, a user with the Contributor, Key Vault Contributor, or any other role that includes Microsoft.KeyVault/vaults/write permissions for the key vault management plane can grant themselves data plane access by setting a Key Vault access policy. To prevent unauthorized access and management of your key vaults, keys, secrets, and certificates, it's essential to limit Contributor role access to key vaults under the Access Policy permission model. To mitigate this risk, we recommend you use the Role-Based Access Control (RBAC) permission model, which restricts permission management to the 'Owner' and 'User Access Administrator' roles, allowing a clear separation between security operations and administrative duties. It is observed that recent SSIRP'S Charcoal bratwurst and Forestry Speed Bump cases keyvaults compromised are using access policies. Having this recommendation will prevent such incidents.

**Description**: To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Keyvault Service and configure relevant authorization policies.

**Remediation steps**: [Migrate from vault access policy to an Azure role-based access control permission model](../key-vault/general/rbac-migration.md)

**Quick fix type**: Azure Policy

**Recommendation logic**: Prerequisites Changing a key vault's permission model requires two permissions: The 'Microsoft.Authorization/roleAssignments/write' permission, which is included in the Owner role and User Access Administrator role. The 'Microsoft.KeyVault/vaults/write' permission, which is included in the Key Vault Contributor role. Classic subscription administrator roles like 'Service Administrator' and 'Co-Administrator' are not supported.

**MCSB control**: Privileged Access (PA)

## Related content

- [Learn about security recommendations](security-policy-concept.md)
- [Review security recommendations](review-security-recommendations.md)
