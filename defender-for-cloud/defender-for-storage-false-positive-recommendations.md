---
title: Manage false-positive security recommendations for Defender for Storage
description: Learn how to identify and manage false-positive security recommendations for specialized storage accounts, including Databricks DBFS storage, in Microsoft Defender for Storage.
ms.date: 06/21/2026
ms.topic: how-to
#customer intent: As a security administrator, I want to identify and manage false-positive security recommendations for Databricks and other specialized storage accounts so that my secure score remains accurate and my workloads aren't disrupted.
ai-usage: ai-assisted
---

# Manage false-positive security recommendations for Defender for Storage

When you enable Microsoft Defender for Storage at the subscription level, security recommendations appear for all protected storage accounts. For specialized storage accounts—such as Azure Databricks File System (DBFS) root storage—some recommendations represent false positives. Implementing these recommendations can conflict with normal operations, increase costs unnecessarily, or break workload connectivity.

This article explains how to identify false-positive recommendations, decide when to exempt versus remediate, and create exemptions using the Azure portal, Azure CLI, or Azure Policy.

## Prerequisites

- **Owner** or **Security Admin** role on the scope where you create exemptions.
- The [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction) initiative assigned on the subscription. See [Exempt resources from recommendations](exempt-resource.md#prerequisites) for details.

## Defender for Storage and Databricks storage accounts

> [!IMPORTANT]
> Defender for Storage isn't supported on Databricks-managed storage accounts (DBFS root storage). Databricks enforces deny policies that prevent Defender for Storage from operating on these accounts. If Defender for Cloud recommends enabling Defender for Storage on a Databricks storage account, exempt that recommendation entirely rather than attempting to enable the plan.

When you enable Defender for Storage at the subscription level, Defender for Cloud generates a recommendation to enable it on any unprotected storage accounts in the subscription—including Databricks-managed accounts. Because Databricks deny policies block the plan from functioning, this recommendation is a false positive for those accounts.

The correct action is to exempt the **Enable Microsoft Defender for Storage** recommendation for all Databricks-managed storage accounts. For other storage-specific recommendations that appear on Databricks accounts, use the decision matrix below to determine the right action.

## Decide when to exempt versus remediate

Use the following matrix to determine the right action for each recommendation based on your storage account type.

| Recommendation | Standard storage | Databricks DBFS | Action for Databricks DBFS |
|---|---|---|---|
| Enable Microsoft Defender for Storage | Remediate | Exempt | Not supported on Databricks-managed storage due to Databricks deny policies. |
| Enable soft delete for blobs | Remediate | Exempt | Conflicts with Databricks cleanup operations. |
| Enable malware scanning | Remediate | Exempt | Not supported; Databricks deny policies prevent operation. |
| Storage accounts should restrict network access | Remediate | Exempt | Breaks Databricks cluster connectivity. |
| Enable logging | Remediate | Remediate | Useful for audit trails; no operational conflict. |
| Secure transfer required | Remediate | Remediate | No conflict with Databricks operations. |
| Enable blob versioning | Remediate | Exempt | Increases costs for temporary data Databricks manages internally. |

## Create an exemption for a Databricks storage account

You can create exemptions using the Azure portal, the Azure CLI, or Azure Policy for automated, at-scale exemptions.

### Azure portal

1. In the Azure portal, go to **Microsoft Defender for Cloud** > **Recommendations**.
1. Find and open the recommendation you want to exempt.
1. In the **Affected resources** tab, select the Databricks storage account.
1. Select **Exempt**.
1. In the **Exemption** pane, enter a **Name** and select a **Category**:
   - **Risk accepted** – your organization has reviewed and accepted the risk.
   - **Mitigated** – you've addressed the risk through another control.
1. Optionally set an expiry date.
1. In the **Justification** field, describe why this recommendation doesn't apply. For example: *Databricks DBFS root storage requires open network access for cluster connectivity.*
1. Select **Save**.

### Azure CLI

Use the following command to create an exemption with the Azure CLI:

```azurecli
az policy exemption create \
  --name "DatabricksStorageExemption" \
  --resource-group "<resource-group>" \
  --scope "/subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage-account-name>" \
  --policy-assignment "/subscriptions/<subscription-id>/providers/Microsoft.Authorization/policyAssignments/<assignment-id>" \
  --exemption-category "Waiver" \
  --description "Databricks DBFS root storage - network access restriction conflicts with cluster connectivity."
```

Replace `<resource-group>`, `<subscription-id>`, `<storage-account-name>`, and `<assignment-id>` with your values. Use `"Mitigated"` instead of `"Waiver"` if you've addressed the risk through another control.

To find the policy assignment ID for a specific recommendation, run:

```azurecli
az policy assignment list --scope "/subscriptions/<subscription-id>" --query "[].{Name:name, DisplayName:displayName, Id:id}" -o table
```

### Azure Policy for automated, at-scale exemptions

For environments with many Databricks storage accounts, use Azure Policy to create exemptions automatically based on resource tags.

**Step 1: Tag your Databricks storage accounts**

Apply a consistent tag to all Databricks-managed storage accounts:

```azurecli
az resource tag \
  --resource-group "<resource-group>" \
  --name "<storage-account-name>" \
  --resource-type "Microsoft.Storage/storageAccounts" \
  --tags workload=Databricks
```

**Step 2: Create a policy exemption assignment**

Create a policy definition that targets storage accounts with the `workload=Databricks` tag and exempts them from the relevant recommendations. Deploy the exemption using an ARM template or Bicep file.

The following ARM template snippet creates an exemption for storage accounts tagged `workload=Databricks`:

```json
{
  "type": "Microsoft.Authorization/policyExemptions",
  "apiVersion": "2022-07-01-preview",
  "name": "DatabricksStorageSoftDeleteExemption",
  "properties": {
    "policyAssignmentId": "/subscriptions/<subscription-id>/providers/Microsoft.Authorization/policyAssignments/<assignment-id>",
    "exemptionCategory": "Waiver",
    "displayName": "Databricks DBFS - Soft delete exemption",
    "description": "Soft delete conflicts with Databricks DBFS cleanup operations.",
    "metadata": {
      "requestedBy": "Security team",
      "approvedBy": "Storage team"
    }
  }
}
```

Deploy at the management group or subscription scope to cover all existing and future Databricks storage accounts.

## Monitor and review exemptions

Exemptions affect your secure score. Review exemptions regularly to make sure they remain valid:

1. In the Azure portal, go to **Microsoft Defender for Cloud** > **Recommendations**.
1. Select **Exemptions** to view all active exemptions.
1. Review the justification and expiry date for each exemption.
1. Remove exemptions that no longer apply.

You can also query exemptions across subscriptions using Azure Resource Graph:

```kusto
PolicyResources
| where type == "microsoft.authorization/policyexemptions"
| project name, properties.exemptionCategory, properties.description, properties.expiresOn
```

## Related content

- [Exempt resources from recommendations](exempt-resource.md)
- [Exempt resources from recommendations at scale](exempt-resources-at-scale.md)
- [What is Microsoft Defender for Storage](defender-for-storage-introduction.md)
- [Common questions about Defender for Storage](faq-defender-for-storage.yml)
