---
title: Create custom standards and recommendations
description: Learn how to create custom security standards and recommendations for all clouds in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 05/11/2026
#customer intent: As a user, I want to learn how to create custom security standards and recommendations in Microsoft Defender for Cloud.
---

<!-- markdownlint-disable-next-line MD025 -->
# Create custom standards and recommendations

[Security recommendations](security-policy-concept.md) in Microsoft Defender for Cloud help you to improve and harden your security posture. Recommendations are based on assessments against [security standards](security-policy-concept.md) defined for Azure subscriptions, AWS accounts, and GCP projects that have Defender for Cloud enabled.

This article describes how to:

- Create custom recommendations for all clouds (Azure, AWS, and GCP) with a Kusto Query Language (KQL) query.
- Assign custom recommendations to a custom security standard.

## Before you start

- You need Owner permissions on the subscription to create a new security standard.
- You need Security Admin permissions to create custom recommendations.
- To create custom recommendations based on KQL, you must have the [Defender CSPM plan](concept-cloud-security-posture-management.md) enabled. All customers can create custom recommendations based on Azure Policy.
- [Review support in Azure clouds](support-matrix-defender-for-cloud.md) for custom recommendations.

We recommend watching this episode of [Defender for Cloud in the field](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/creating-custom-recommendations-amp-standards-for-aws-gcp/ba-p/3810248) to learn more about the feature, and dig into creating KQL queries.

## Create a custom recommendation

Create custom recommendations, including steps for remediation, severity, and the standards to which the recommendation should be assigned. You add recommendation logic with KQL. You can use a simple query editor with built-in query templates that you can tweak as needed, or you can write your KQL query from scratch.

To create a custom recommendation:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > the relevant subscription.

1. Select **Security policies** > **+ Create** > **Custom recommendation**.

1. Fill in the recommendation details (for example: name, severity).

1. Select the relevant standards.

    :::image type="content" source="./media/create-custom-recommendations/fill-info-recommendation.png" alt-text="Screenshot of Microsoft Defender for Cloud Recommendation details pane showing fields for name, severity, and assigned standards." lightbox="./media/create-custom-recommendations/fill-info-recommendation.png":::

1. Select **Next**.
1. Enter a KQL query, or select **[Open query editor](#use-the-query-editor)**.
1. Select **Next**.
1. Select the custom standards.
1. Select **Review and create**.
1. Review the recommendation details.
1. Select **Create**.

    :::image type="content" source="./media/create-custom-recommendations/review-recommendation.png" alt-text="Screenshot of Microsoft Defender for Cloud Review and create page showing recommendation summary before submission." lightbox="./media/create-custom-recommendations/review-recommendation.png":::

### Use the query editor

We recommend using the query editor to create a recommendation query.

- Using the editor helps you to build and test your query before you start using it.
- Select **How to** to get help on structuring the query, and additional instructions and links.
- The editor contains built-in recommendation query examples that you can use to help build your own query. The data appears in the same structure as in the API.

1. Select **New query**.
1. Use the example query template with its instructions, or select an example built-in recommendation query to get started.

    :::image type="content" source="./media/create-custom-recommendations/query-editor.png" alt-text="Screenshot of query editor in Microsoft Defender for Cloud showing New query and Run query controls." lightbox="./media/create-custom-recommendations/query-editor.png":::

1. Select **Run query** to test the query you created.
1. When the query is ready, cut and paste it from the editor into the **Recommendation query** pane.

#### Query templates and examples

The query editor includes built-in examples, and the templates in this section show how to structure common security checks. Each template returns only unhealthy (non-compliant) resources.

> [!NOTE]
> The templates in this section use Azure resource types and Azure Resource Graph fields. For AWS and GCP resources, use the same unhealthy-only pattern and adapt fields to the resource schema returned in your environment.

### [VM tags](#tab/vm-tags)

Identify virtual machines missing mandatory governance tags, such as cost center or owner information.

```kql
Resources
| where type == "microsoft.compute/virtualmachines"
| where isnull(tags["CostCenter"]) or isnull(tags["Owner"])
| project id, name, resourceGroup, tags
```

**Output columns:** `id` (Azure Resource Manager (ARM) resource ID), `name`, `resourceGroup`, `tags`

**Assessment logic:** Machines in query results lack required tags and are unhealthy. Machines not returned are compliant.

### [Storage HTTPS](#tab/storage-https)

Detect storage accounts that allow HTTP connections, which creates potential data exposure.

```kql
Resources
| where type == "microsoft.storage/storageaccounts"
| where properties.supportsHttpsTrafficOnly != true
| project id, name, resourceGroup, properties.supportsHttpsTrafficOnly
```

**Output columns:** `id` (ARM resource ID), `name`, `resourceGroup`, `supportsHttpsTrafficOnly`

**Assessment logic:** Accounts allowing HTTP traffic are non-compliant. Your recommendation enforces HTTPS-only.

### [NSG Any/Any](#tab/nsg-any-any)

Find network security groups with inbound rules that allow traffic from any source on any port.

```kql
Resources
| where type == "microsoft.network/networksecuritygroups"
| mv-expand rules = properties.securityRules  // Expand array to evaluate each rule
| where rules.properties.access == "Allow"
  and rules.properties.direction == "Inbound"
  and (
    tostring(rules.properties.sourceAddressPrefix) == "*"
    or tostring(rules.properties.sourceAddressPrefixes) has '"*"'
  )
  and (
    tostring(rules.properties.destinationPortRange) == "*"
    or tostring(rules.properties.destinationPortRanges) has '"*"'
  )
| project id, name, resourceGroup, rules.name
```

**Output columns:** `id` (ARM resource ID), `name`, `resourceGroup`, `rules.name`

**Assessment logic:** NSGs containing overly permissive rules are unhealthy. Restricting source addresses and ports to known networks restores compliance.

### [Key Vault protection](#tab/key-vault-protection)

Identify Key Vaults without purge protection enabled.

```kql
Resources
| where type == "microsoft.keyvault/vaults"
| where properties.enablePurgeProtection != true or isnull(properties.enablePurgeProtection)
| project id, name, resourceGroup, properties.enablePurgeProtection
```

**Output columns:** `id` (ARM resource ID), `name`, `resourceGroup`, `enablePurgeProtection`

**Assessment logic:** Vaults without purge protection are unhealthy. Enabling this setting restores compliance.

### [App Service HTTPS](#tab/app-service-https)

Locate App Services that do not automatically redirect HTTP traffic to HTTPS, which leaves user connections unencrypted.

```kql
Resources
| where type == "microsoft.web/sites"
| where properties.httpsOnly != true
| project id, name, resourceGroup, properties.httpsOnly
```

**Output columns:** `id` (ARM resource ID), `name`, `resourceGroup`, `httpsOnly`

**Assessment logic:** Services without HTTPS-only enabled are non-compliant. Your recommendation prompts users to enable this protection.

### [Database firewall](#tab/database-firewall)

Find SQL or PostgreSQL servers with firewall rules that allow connections from any IP address (0.0.0.0 to 255.255.255.255), which exposes databases to the internet.

```kql
Resources
| where type in~ (
    "microsoft.sql/servers/firewallrules",
    "microsoft.dbforpostgresql/servers/firewallrules",
    "microsoft.dbforpostgresql/flexibleservers/firewallrules"
  )
| where properties.startIpAddress == "0.0.0.0"
  and properties.endIpAddress == "255.255.255.255"
| extend serverId = tostring(split(id, "/firewallrules/")[0])
| extend firewallRuleName = name
| extend serverName = tostring(split(serverId, "/")[-1])
| extend resourceGroup = extract(@"(?i)/resourceGroups/([^/]+)/", 1, serverId)
| project id = serverId, name = serverName, resourceGroup, firewallRule = firewallRuleName
```

**Output columns:** `id` (ARM resource ID), `name`, `resourceGroup`, `firewallRule`

**Assessment logic:** Servers with unrestricted firewall access are unhealthy. Restricting to known source IPs restores compliance.

---

### KQL output schema requirements

Before you write your query, understand the required output schema. This is how Microsoft Defender for Cloud interprets your results and maps findings to resources.

**Required and recommended output columns:**

| Column | Type | Purpose |
| --- | --- | --- |
| `id` | String (required) | Full ARM resource ID for Azure resources. Example: `/subscriptions/{subId}/resourceGroups/{rg}/providers/microsoft.storage/storageaccounts/{name}` |
| `name` | String (recommended) | Human-readable resource name displayed in findings |
| `resourceGroup` | String (optional) | Resource group for organizing findings by location. This value can be empty for non-Azure resources. |

You can include additional columns relevant to your finding (such as `properties.httpsOnly` or `tags`). Defender for Cloud displays these in the recommendation details.

**Resource ID format guidance:**

The `id` column must contain the complete ARM resource ID; nothing abbreviated or custom. Defender for Cloud uses this ID to reference the exact resource in the portal and link remediation actions.

**Valid format:**

```text
/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/my-rg/providers/microsoft.storage/storageaccounts/mystorageacct
```

**Invalid formats (won't work):**

```text
mystorageacct
storage-rg/mystorageacct
/providers/microsoft.storage/storageaccounts/mystorageacct
```

**Assessment mapping:**

Your query defines what "unhealthy" means. Resources that appear in results are unhealthy (non-compliant). Resources that don't appear are healthy (compliant). It's binary—no status column needed.

> [!IMPORTANT]
> **Return ONLY unhealthy resources.** Never return all resources with a status column. Defender for Cloud interprets every row as "this resource failed the check." Returning all resources would flag everything as unhealthy.

**Common errors and fixes:**

- **Missing `id` column:** Query fails silently. Always include `project id, ...` in your final output.
- **Incomplete resource ID:** Verify the `id` column contains the full ARM path. In the portal, click a finding to confirm the URL matches your `id` value.
- **Returning compliant resources:** If you forget the `where` filter, you'll return all resources as unhealthy. Always filter by condition (e.g., `where properties.httpsOnly != true`).
- **Null properties on different subscriptions:** Test your query across subscriptions with varied configurations. A query working on one subscription might fail elsewhere if properties are null or missing. Use `isnull()` checks where appropriate.

## Use custom recommendations at scale

Creating custom recommendations through the Azure portal user interface is best for most users. The interface provides a convenient Kusto Query Language (KQL) editor and built-in validation tools. However, automating the creation of recommendations with a programmatic approach can be helpful. This method is especially useful when you need to deploy recommendations across many environments or subscriptions.  

### Automate via the API  

If you prevalidated KQL queries and want to automate creating custom recommendations, you can use the Microsoft Defender for Cloud API. This method lets you deploy recommendations quickly, ensuring they're consistent and scalable across your cloud environments.  

- **Advantages**: You can automate and scale the deployment of custom recommendations.  
- **When to use**: This method is ideal for large-scale implementations where you need to apply recommendations consistently across multiple environments.  

For more information about using the API to manage custom recommendations, see the [API documentation](/rest/api/defenderforcloud-composite/operation-groups?view=rest-defenderforcloud-composite-latest&preserve-view=true).

## Create a custom standard

Custom recommendations can be assigned to one or more custom standards.

To create a custom standard:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > the relevant subscription.

1. Select **Security policies** > **+ Create** > **Standard**.

1. Select the recommendations that you want to add to the custom standard.

1. (Optional) For Azure subscriptions, review the Source column.

    :::image type="content" source="media/custom-security-policies/select-recommendations.png" alt-text="Screenshot that shows the list of all of the recommendations that are available to select for the custom standard." lightbox="media/custom-security-policies/select-recommendations.png":::

1. Select **Create**.

## Create and enhance custom recommendations with Azure Policy (legacy)

For Azure subscriptions, you can create custom recommendations and standards, and enhance them, using Azure Policy. This is a legacy feature, and we recommend using the new custom recommendations feature.

### Create a custom recommendation/standard (legacy)

You can create custom recommendations and standards in Defender for Cloud by creating policy definitions and initiatives in Azure Policy, and onboarding them in Defender for Cloud.

To create a custom recommendation or standard with Azure Policy (legacy):

1. Create one or more policy definitions in the [Azure Policy portal](/azure/governance/policy/tutorials/create-custom-policy-definition), or [programmatically](/azure/governance/policy/how-to/programmatically-create).
1. [Create a policy initiative](/azure/governance/policy/concepts/initiative-definition-structure) that contains the custom policy definitions.

### Onboard the initiative as a custom standard (legacy)

[Policy assignments](/azure/governance/policy/concepts/assignment-structure) are used by Azure Policy to assign Azure resources to a policy or initiative.

To onboard an initiative to a custom security standard in Defender for Cloud, you need to include `"ASC":"true"` in the request body as shown here. The `ASC` field onboards the initiative to Microsoft Defender for Cloud.

To onboard a custom initiative:

#### Example to onboard a custom initiative

```http
PUT https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Authorization/policySetDefinitions/{policySetDefinitionName}?api-version=2021-06-01
```

Request body (JSON):

```json
{
    "properties": {
      "displayName": "Cost Management",
      "description": "Policies to enforce low cost storage SKUs",
      "metadata": {
        "category": "Cost Management",
        "ASC":"true"
      },
      "parameters": {
        "namePrefix": {
          "type": "String",
          "defaultValue": "myPrefix",
          "metadata": {
            "displayName": "Prefix to enforce on resource names"
          }
        }
      },
      "policyDefinitions": [
        {
          "policyDefinitionId": "/subscriptions/<Subscription ID>/providers/Microsoft.Authorization/policyDefinitions/7433c107-6db4-4ad1-b57a-a76dce0154a1",
          "policyDefinitionReferenceId": "Limit_Skus",
          "parameters": {
            "listOfAllowedSKUs": {
              "value": [
                "Standard_GRS",
                "Standard_LRS"
              ]
            }
          }
        },
        {
          "policyDefinitionId": "/subscriptions/<Subscription ID>/providers/Microsoft.Authorization/policyDefinitions/ResourceNaming",
          "policyDefinitionReferenceId": "Resource_Naming",
          "parameters": {
            "prefix": {
              "value": "[parameters('namePrefix')]"
            },
            "suffix": {
              "value": "-LC"
            }
          }
        }
      ]
    }
  }
```

#### Example to remove an assignment

This example shows you how to remove an assignment:

```http
DELETE https://management.azure.com/{subscription}/providers/Microsoft.Authorization/policyAssignments/{policyAssignmentName}?api-version=2018-05-01
```

### Enhance custom recommendations (legacy)

The built-in recommendations supplied with Microsoft Defender for Cloud include details such as severity levels and remediation instructions. If you want to add this type of information to custom recommendations for Azure, use the REST API.

The two types of information you can add are:

- **RemediationDescription** – String
- **Severity** – Enum [Low, Medium, High]

The metadata should be added to the policy definition for a policy that is part of the custom initiative. It should be in the 'securityCenter' property, as shown:

```json
{
  "metadata": {
    "securityCenter": {
      "RemediationDescription": "Custom description goes here",
      "Severity": "High"
    }
  }
}
```

Here's another example of a custom policy including the metadata/securityCenter property:

  ```json
  {
"properties": {
  "displayName": "Security - ERvNet - AuditRGLock",
  "policyType": "Custom",
  "mode": "All",
  "description": "Audit required resource groups lock",
  "metadata": {
    "securityCenter": {
      "RemediationDescription": "Resource Group locks can be set via Azure Portal -> Resource Group -> Locks",
      "Severity": "High"
   }
  },
 "parameters": {
    "expressRouteLockLevel": {
      "type": "String",
      "metadata": {
        "displayName": "Lock level",
        "description": "Required lock level for ExpressRoute resource groups."
      },
      "allowedValues": [
        "CanNotDelete",
        "ReadOnly"
      ]
    }
  },
  "policyRule": {
    "if": {
      "field": "type",
      "equals": "Microsoft.Resources/subscriptions/resourceGroups"
    },
    "then": {
      "effect": "auditIfNotExists",
      "details": {
        "type": "Microsoft.Authorization/locks",
        "existenceCondition": {
          "field": "Microsoft.Authorization/locks/level",
          "equals": "[parameters('expressRouteLockLevel')]"
        }
      }
    }
 }
}
}
  ```

For another example for using the securityCenter property, see [this section of the REST API documentation](/rest/api/defenderforcloud-composite/assessments-metadata/create-in-subscription?view=rest-defenderforcloud-composite-latest&tabs=HTTP&preserve-view=true#examples).

## Related content

You can use the following links to learn more about Kusto queries:

- [KQL Quick Reference](/azure/data-explorer/kql-quick-reference)
- [Kusto Query Language (KQL) overview](/azure/data-explorer/kusto/query/)
- [Must Learn KQL Part 1: Tools and Resources](https://rodtrent.substack.com/p/must-learn-kql-part-1-tools-and-resources)
- [What are security policies, initiatives, and recommendations?](security-policy-concept.md)
