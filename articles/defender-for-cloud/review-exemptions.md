---
title: Review and troubleshoot recommendation exemptions
description: Learn how to review exempted resources and troubleshoot common exemption issues in Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 04/14/2026
#customer intent: As a user, I want to review exempted resources and troubleshoot exemption issues in Microsoft Defender for Cloud so that I can manage security recommendations effectively.
---

# Review and troubleshoot recommendation exemptions

In Microsoft Defender for Cloud, you can [exempt protected resources from Defender for Cloud security recommendations](exempt-resource.md). This article describes how to review exempted resources and troubleshoot common exemption issues.

## Review exempted resources in the portal

When you exempt a resource, it doesn't prompt security recommendations. You can review and manage exempted resources in the Defender for Cloud portal.

### Review exempted resources on the Recommendations page

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Recommendations**.

1. Select **Recommendation status**.

1. Select **Exempted**.

1. Select **Apply**.

    :::image type="content" source="media/review-exemptions/exempted-resources.png" alt-text="Screenshot of the recommendations page that shows Recommendation status, Exempted, and Apply." lightbox="media/review-exemptions/exempted-resources.png":::

1. Select a resource to review it.

### Review exempted resources on the Inventory page

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Inventory**.

1. Select **Add filter**.

    :::image type="content" source="media/review-exemptions/inventory-exemptions.png" alt-text="Screenshot that shows the Defender for Cloud asset inventory page and the filter to find resources with exemptions."  lightbox="media/review-exemptions/inventory-exemptions.png":::

1. Select **Contains exemptions**.

1. Select **Yes**.

1. Select **OK**.

## Review exempted resources with Azure Resource Graph

[Azure Resource Graph (ARG)](/azure/governance/resource-graph/) provides instant access to resource information across your cloud environments with robust filtering, grouping, and sorting capabilities. You can quickly and easily [query information](/azure/governance/resource-graph/first-query-portal) by using [Kusto Query Language (KQL)](/azure/data-explorer/kusto/query/).

To view all recommendations that have exemption rules:

1. In the **Recommendations** page, select **Open query**.
1. Enter the following query and select **Run query**.

    ```kusto
    securityresources
    | where type == "microsoft.security/assessments"
    // Get recommendations in useful format
    | project
    ['TenantID'] = tenantId,
    ['SubscriptionID'] = subscriptionId,
    ['AssessmentID'] = name,
    ['DisplayName'] = properties.displayName,
    ['ResourceType'] = tolower(split(properties.resourceDetails.Id,"/").[7]),
    ['ResourceName'] = tolower(split(properties.resourceDetails.Id,"/").[8]),
    ['ResourceGroup'] = resourceGroup,
    ['ContainsNestedRecom'] = tostring(properties.additionalData.subAssessmentsLink),
    ['StatusCode'] = properties.status.code,
    ['StatusDescription'] = properties.status.description,
    ['PolicyDefID'] = properties.metadata.policyDefinitionId,
    ['Description'] = properties.metadata.description,
    ['RecomType'] = properties.metadata.assessmentType,
    ['Remediation'] = properties.metadata.remediationDescription,
    ['Severity'] = properties.metadata.severity,
    ['Link'] = properties.links.azurePortal
    | where StatusDescription contains "Exempt"    
    ```

## Get a notification when users create exemptions

To keep track of how users exempt resources from recommendations, we created an Azure Resource Manager template (ARM template). The template deploys a logic app playbook and all necessary API connections to notify you when an exemption is created.

- Learn more about the playbook by reading the blog post [How to keep track of Resource Exemptions in Microsoft Defender for Cloud](https://techcommunity.microsoft.com/t5/azure-security-center/how-to-keep-track-of-resource-exemptions-in-azure-security/ba-p/1770580).
- Locate the ARM template in the [Microsoft Defender for Cloud GitHub repository](https://github.com/Azure/Azure-Security-Center/tree/master/Workflow%20automation/Notify-ResourceExemption).
- [Use this automated process](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Security-Center%2Fmaster%2FWorkflow%2520automation%2FNotify-ResourceExemption%2Fazuredeploy.json) to deploy all components.

## Troubleshoot exemptions

Use the following sections to troubleshoot common exemption issues in Defender for Cloud.

### Unable to create an exemption or exemption option not available

**Symptom:** You receive an error when you try to create an exemption, or the exemption option appears grayed out.

**Solutions:**

#### Verify your permissions at the correct scope

1. Go to the subscription or management group where you want to create the exemption.
1. Select **Access control (IAM)** > **Check access**.
1. Verify that you have the **Security Admin** role or an equivalent role.

#### Verify that you have the required RBAC actions

You need the following permissions:

| Action | Description |
|--------|-------------|
| `Microsoft.Authorization/policyExemptions/write` | Create an exemption |
| `Microsoft.Authorization/policyExemptions/delete` | Delete an exemption |
| `Microsoft.Authorization/policyExemptions/read` | View an exemption |
| `Microsoft.Authorization/policyAssignments/exempt/action` | Perform an exemption operation on a linked scope |

If any of these actions are missing, the **Exempt** button might be hidden.

#### Refresh your credentials

If permissions were recently granted, sign out and sign back in. Clear the browser cache or try a different browser.

#### Check scope hierarchy

Subscription-level permissions don't inherit upward to management groups. If the policy assignment is at the management group level, you need the role at that level.

#### Use the correct exemption workflow

1. Go to **Defender for Cloud** > **Recommendations**.
1. Select the recommendation that you want to exempt.
1. Select **Exempt** in the command bar. Don't create the exemption from the affected resources list.
1. Select the scope and provide a justification.

#### Verify that the recommendation supports exemptions

- Preview recommendations might not support exemptions. Check whether the recommendation shows a **Preview** tag.
- Some built-in recommendations don't support exemptions. Consider using a disable rule instead.
- Custom recommendations don't support exemptions.

You can find a list of recommendations that don't support exemptions in [the exemptions FAQ](faq-general.yml).

#### Verify that Microsoft Cloud Security Benchmark is assigned

If Microsoft Cloud Security Benchmark (MCSB) isn't assigned to the subscription, exemption behavior might fail or appear inconsistent.

#### Verify that you use a built-in role

Custom roles have limited support for exemption operations. Only built-in roles can perform certain exemption-related actions. You need one of the following built-in roles to manage exemptions:

- **Security Admin** (recommended)
- **Owner**
- **Contributor** at the subscription level
- **Resource Policy Contributor**

### Unable to delete an exemption

**Symptom:** You receive a "Failed to delete the exemption(s)" error, or deleted exemptions reappear.

**Common causes:** Missing delete permission, orphaned exemption without a valid policy assignment, or backend synchronization issues.

**Solutions:**

#### Verify delete permissions

- Ensure you have the `Microsoft.Authorization/policyExemptions/delete` permission.
- Check permissions at the scope where the exemption was created.

#### Check exemption state

Run the following query in Azure Resource Graph Explorer to find exemptions:

```kusto
policyresources
| where type == "microsoft.authorization/policyexemptions"
| where subscriptionId == "<your-subscription-id>"
```

#### Handle orphaned exemptions

If an exemption has no policy assignment, try adding an assignment first, then delete the exemption. You can also use Azure PowerShell to delete the exemption:

```azurepowershell-interactive
Remove-AzPolicyExemption -Name "<exemption-name>" -Scope "<scope>"
```

#### Wait for synchronization

Portal changes can take up to 30 minutes to reflect. If the exemption reappears, the issue might be related to backend synchronization. Contact support if the problem persists.

### Exemption created but recommendation still shows unhealthy

**Symptom:** After you create an exemption, the recommendation status doesn't update or still shows unhealthy.

**Solutions:**

#### Wait for the evaluation cycle

Defender for Cloud evaluates resources periodically, typically every 12-24 hours. Allow up to 24 hours for the exemption to take effect.

#### Verify exemption scope

- Ensure the exemption covers the specific resources that show as unhealthy.
- Check whether the exemption is at the correct scope level (management group, subscription, or resource).

#### Check exemption type

- **Waiver** exemptions: Resources don't count toward secure score but might still show in recommendations.
- **Mitigated** exemptions: Resources should show as healthy.

#### Verify the recommendation evaluates the exempted policy

Some recommendations are based on multiple policies. Ensure you exempted the correct underlying policy.

#### Ensure the exemption was created from Defender for Cloud

Exemptions created in Azure Policy instead of Defender for Cloud might not fully integrate. Always use **Defender for Cloud** > **Recommendations** > **Exempt**.

#### Check for initiative conflicts

If the same recommendation exists in multiple initiatives:

- You might need an exemption for each initiative.
- Newly assigned initiatives might override existing exemptions.

#### Recreate the exemption

Delete and recreate the exemption by using Defender for Cloud. Allow up to 24 hours for reevaluation.

### Permission errors at management group level

**Symptom:** You can create exemptions at the subscription level but receive permission errors at the management group level.

**Common error messages:** "...does not have permission to perform action(s) on the linked scope(s) or the linked scope(s) are invalid"

**Solutions:**

#### Assign permissions at the management group level

Subscription-level permissions don't inherit upward. Go to **Management group** > **Access control (IAM)** and assign **Security Admin** or the appropriate role at the management group level.

#### Verify role assignment scope

Custom roles must be assigned at the management group level, not only at the subscription level. Use Azure CLI to verify:

```azurecli-interactive
az role assignment list --scope "/providers/Microsoft.Management/managementGroups/<mg-name>"
```

#### Check policy assignment scope

If the policy is assigned at the management group level, the exemption must be created there. Verify the policy assignment location in Azure Policy.

### Exemptions not visible in the portal

**Symptom:** Previously visible exemptions no longer show, or you can't find where exemptions are listed.

**Solutions:**

#### Check the centralized exemptions view

As of January 2026, exemptions are managed from a central location. Go to **Defender for Cloud** > **Environment settings** > **Exemptions box**, or go to **Azure Policy** > **Exemptions**.

#### Verify scope and filters

Exemptions are visible at the scope where they were created. Check whether you're viewing the correct subscription or management group.

#### Check permissions

Ensure you have read permissions for policy exemptions. Verify access at the correct scope level.

### Understand secure score impact

| Scenario | Secure score impact |
|----------|---------------------|
| Exemption type: **Mitigated** | Exempt resources count as healthy. Score increases. |
| Exemption type: **Waiver** | Exempt resources are excluded from the calculation. Neutral impact. |
| Preview recommendations | No impact on secure score regardless of status. |
| Disable rule applied | The finding is excluded from evaluation. Score might increase. |

## Next step

> [!div class="nextstep"]
> [Review security recommendations](review-security-recommendations.md)
