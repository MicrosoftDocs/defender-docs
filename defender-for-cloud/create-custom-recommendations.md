---
title: Create custom standards and recommendations in Microsoft Defender for Cloud
description: Learn how to create custom security standards and recommendations in Microsoft Defender for Cloud across Azure, AWS, and GCP with KQL queries and Azure Policy.
ms.topic: how-to
ms.date: 05/24/2026
#customer intent: As a user, I want to learn how to create custom security standards and recommendations in Microsoft Defender for Cloud.
---

# Create custom standards and recommendations in Microsoft Defender for Cloud

[Security recommendations](security-policy-concept.md) in Microsoft Defender for Cloud help you improve and harden your security posture. Recommendations are based on assessments against [security standards](security-policy-concept.md) defined for Azure subscriptions, Amazon Web Services (AWS) accounts, and Google Cloud Platform (GCP) projects that have Defender for Cloud enabled.

This article describes how to:

- Create custom recommendations for all clouds (Azure, AWS, and GCP) with a Kusto Query Language (KQL) query.
- Assign custom recommendations to a custom security standard.

## Before you start

- You need Owner permissions on the subscription to create a new security standard.
- You need Security Admin permissions to create custom recommendations.
- To create custom recommendations based on Kusto Query Language (KQL), you must have the [Defender Cloud Security Posture Management (CSPM) plan](concept-cloud-security-posture-management.md) enabled. All customers can create custom recommendations based on Azure Policy.
- [Review support in Azure clouds](support-matrix-defender-for-cloud.md) for custom recommendations.

We recommend watching this episode of [Defender for Cloud in the field](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/creating-custom-recommendations-amp-standards-for-aws-gcp/ba-p/3810248) to learn more about custom recommendations and how to write KQL queries.

## Create a custom recommendation

Create custom recommendations, including steps for remediation, severity, and the standards to which the recommendation should be assigned. You add recommendation logic with KQL. You can use a simple query editor with built-in query templates that you can tweak as needed, or you can write your KQL query from scratch.

To create a custom recommendation:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > the relevant subscription.

1. Select **Security policies** > **+ Create custom recommendation**.

    :::image type="content" source="media/create-custom-recommendations/create-custom-recommendation.png" alt-text="Screenshot of Microsoft Defender for Cloud Security policies page with the Create custom recommendation action highlighted." lightbox="media/create-custom-recommendations/create-custom-recommendation.png":::

1. Enter the details: Required: Name, Scope, Severity, and Security issue. Optional: Description, Remediation.

1. Select **Next**.

1. Enter a KQL query, or select **[Open query editor](#use-the-query-editor)**.

    :::image type="content" source="media/create-custom-recommendations/open-query-editor.png" alt-text="Screenshot of the custom recommendation flow with the Open query editor action used to launch the KQL editor." lightbox="media/create-custom-recommendations/open-query-editor.png":::

1. Select **Next**.

1. Select the relevant standards for the recommendation.

    :::image type="content" source="./media/create-custom-recommendations/fill-info-recommendation.png" alt-text="Screenshot of Microsoft Defender for Cloud Recommendation details pane showing fields for name, severity, and assigned standards." lightbox="./media/create-custom-recommendations/fill-info-recommendation.png":::

1. Select **Next**.

1. Select the custom standards to assign.
1. Select **Review and create**.
1. Review the recommendation details.
1. Select **Create**.

    :::image type="content" source="./media/create-custom-recommendations/review-recommendation.png" alt-text="Screenshot of Microsoft Defender for Cloud Review and create page showing recommendation summary before submission." lightbox="./media/create-custom-recommendations/review-recommendation.png":::

### Use the query editor

We recommend using the query editor to create a recommendation query. You can also use the provided [query templates and examples](#query-templates-and-examples) to view sample queries and learn how to build your own.

- Using the editor helps you to build and test your query before you start using it.
- Select **How to** to get help on structuring the query, and additional instructions and links.
- The editor contains built-in recommendation query examples that you can use to help build your own query. The data appears in the same structure as in the API.

1. Select **New query**.

    :::image type="content" source="media/create-custom-recommendations/new-query.png" alt-text="Screenshot of the query editor with New query selected to start writing a recommendation query." lightbox="media/create-custom-recommendations/new-query.png":::

1. Use the example query template with its instructions, or select an example built-in recommendation query from the lower part of the page, to get started.

1. Select **Run query** to test the query you created.
1. When the query is ready, cut and paste it from the editor into the **Recommendation query** pane.
1. Continue with step 7 from the [Create a custom recommendation section](#create-a-custom-recommendation).

#### Query templates and examples

The query editor includes built-in examples, and the templates in this section show how to structure common security checks. Each template returns resources in scope and marks non-compliant resources as `UNHEALTHY`. In this template pattern, edit only the `condition` expression and keep the `HealthStatus` line unchanged.

> [!NOTE]
> The templates in this section use Azure resource types. For AWS and GCP resources, change `Environment == 'Azure'` to `Environment == 'AWS'` or `Environment == 'GCP'` and update `Identifiers.Type` to match the resource type in your environment.

### [VM tags](#tab/vm-tags)

Identify virtual machines missing mandatory governance tags, such as cost center or owner information.

```kql
RawEntityMetadata
| where Environment == 'Azure' and Identifiers.Type =~ 'Microsoft.Compute/virtualMachines'
| extend condition = (isnull(Record.tags["CostCenter"]) or isnull(Record.tags["Owner"]))
| extend HealthStatus = iff(condition, 'UNHEALTHY', 'HEALTHY')
| project Id, Name, Environment, Identifiers, AdditionalData, Record, HealthStatus
```

**Output columns:** `Id`, `Name`, `Environment`, `Identifiers`, `AdditionalData`, `Record`, `HealthStatus`

**Assessment logic:** Machines missing required tags have `HealthStatus` set to `UNHEALTHY` and appear as non-compliant findings. Machines with both tags set have `HealthStatus` set to `HEALTHY`.

### [Storage HTTPS](#tab/storage-https)

Detect storage accounts that allow HTTP connections, which creates potential data exposure.

```kql
RawEntityMetadata
| where Environment == 'Azure' and Identifiers.Type =~ 'Microsoft.Storage/storageAccounts'
| extend condition = (Record.properties.supportsHttpsTrafficOnly != true)
| extend HealthStatus = iff(condition, 'UNHEALTHY', 'HEALTHY')
| project Id, Name, Environment, Identifiers, AdditionalData, Record, HealthStatus
```

**Output columns:** `Id`, `Name`, `Environment`, `Identifiers`, `AdditionalData`, `Record`, `HealthStatus`

**Assessment logic:** Accounts allowing HTTP traffic have `HealthStatus` set to `UNHEALTHY`. Your recommendation enforces HTTPS-only.

### [NSG Any/Any](#tab/nsg-any-any)

Find network security groups whose rules contain wildcard source or port patterns that can indicate overly permissive access.

```kql
RawEntityMetadata
| where Environment == 'Azure' and Identifiers.Type =~ 'Microsoft.Network/networkSecurityGroups'
| extend condition = (tostring(Record.properties.securityRules) has '"*"')
| extend HealthStatus = iff(condition, 'UNHEALTHY', 'HEALTHY')
| project Id, Name, Environment, Identifiers, AdditionalData, Record, HealthStatus
```

**Output columns:** `Id`, `Name`, `Environment`, `Identifiers`, `AdditionalData`, `Record`, `HealthStatus`

**Assessment logic:** NSGs where the rules payload contains wildcard source or port patterns have `HealthStatus` set to `UNHEALTHY`. Review these rules and restrict source addresses and ports to known networks.

### [Key Vault protection](#tab/key-vault-protection)

Identify Key Vaults without purge protection enabled.

```kql
RawEntityMetadata
| where Environment == 'Azure' and Identifiers.Type =~ 'Microsoft.KeyVault/vaults'
| extend condition = (Record.properties.enablePurgeProtection != true or isnull(Record.properties.enablePurgeProtection))
| extend HealthStatus = iff(condition, 'UNHEALTHY', 'HEALTHY')
| project Id, Name, Environment, Identifiers, AdditionalData, Record, HealthStatus
```

**Output columns:** `Id`, `Name`, `Environment`, `Identifiers`, `AdditionalData`, `Record`, `HealthStatus`

**Assessment logic:** Vaults without purge protection have `HealthStatus` set to `UNHEALTHY`. Enabling this setting restores compliance.

### [App Service HTTPS](#tab/app-service-https)

Locate App Services that do not automatically redirect HTTP traffic to HTTPS, which leaves user connections unencrypted.

```kql
RawEntityMetadata
| where Environment == 'Azure' and Identifiers.Type =~ 'Microsoft.Web/sites'
| extend condition = (Record.properties.httpsOnly != true)
| extend HealthStatus = iff(condition, 'UNHEALTHY', 'HEALTHY')
| project Id, Name, Environment, Identifiers, AdditionalData, Record, HealthStatus
```

**Output columns:** `Id`, `Name`, `Environment`, `Identifiers`, `AdditionalData`, `Record`, `HealthStatus`

**Assessment logic:** Services without HTTPS-only enabled have `HealthStatus` set to `UNHEALTHY`. Your recommendation prompts users to enable this protection.

### [Database firewall](#tab/database-firewall)

Identify Azure SQL servers with public network access enabled or unconfigured, which allows connections from outside your private network.

```kql
RawEntityMetadata
| where Environment == 'Azure' and Identifiers.Type =~ 'Microsoft.Sql/servers'
| extend condition = (isnull(Record.properties.publicNetworkAccess) or Record.properties.publicNetworkAccess != 'Disabled')
| extend HealthStatus = iff(condition, 'UNHEALTHY', 'HEALTHY')
| project Id, Name, Environment, Identifiers, AdditionalData, Record, HealthStatus
```

**Output columns:** `Id`, `Name`, `Environment`, `Identifiers`, `AdditionalData`, `Record`, `HealthStatus`

**Assessment logic:** Servers with public network access enabled or unconfigured have `HealthStatus` set to `UNHEALTHY`. Restricting public network access restores compliance.

---

### KQL output schema requirements

Before you write your query, understand the required output schema. This is how Microsoft Defender for Cloud interprets your results and maps findings to resources.

**Required output columns:**

| Column | Type | Purpose |
| --- | --- | --- |
| `Id` | String (required) | Resource identifier used by Defender for Cloud to reference the resource. |
| `Name` | String (required) | Human-readable resource name displayed in findings. |
| `Environment` | String (required) | Cloud environment: `Azure`, `AWS`, or `GCP`. |
| `Identifiers` | Dynamic (required) | Resource type and identifiers passed through from the source record. |
| `AdditionalData` | Dynamic (required) | Supplementary resource metadata passed through from the source record. |
| `Record` | Dynamic (required) | Full resource record containing all properties. |
| `HealthStatus` | String (required) | Assessment result: `UNHEALTHY` (non-compliant) or `HEALTHY` (compliant). |

Always end your query with: `| project Id, Name, Environment, Identifiers, AdditionalData, Record, HealthStatus`

**Assessment mapping:**

Every query must set a `HealthStatus` value for each resource. Use the `iff()` function to evaluate your condition and assign the status:

```kql
| extend condition = (your condition here)
| extend HealthStatus = iff(condition, 'UNHEALTHY', 'HEALTHY')
```

In this pattern, edit only the `condition` expression. Keep the `HealthStatus` line unchanged:

```kql
| extend HealthStatus = iff(condition, 'UNHEALTHY', 'HEALTHY')
```

Resources where `HealthStatus` is `UNHEALTHY` appear as non-compliant findings in Defender for Cloud. Resources where `HealthStatus` is `HEALTHY` are compliant and don't appear in findings.

> [!IMPORTANT]
> Always set `HealthStatus` to either `'UNHEALTHY'` or `'HEALTHY'`. Return all resources in scope. Defender for Cloud uses the `HealthStatus` column to determine compliance. Omitting resources from the result set is treated as no data, not as healthy.

**Common errors and fixes:**

- **Missing required columns:** If any of the seven required columns are missing, the query fails. Always end with `| project Id, Name, Environment, Identifiers, AdditionalData, Record, HealthStatus`.
- **Wrong `HealthStatus` values:** Only `'UNHEALTHY'` and `'HEALTHY'` are valid values (case-sensitive). Other values or null cause parsing errors.
- **Incorrect property paths:** Properties are accessed via `Record.properties.*`, not directly. For example, use `Record.properties.httpsOnly`, not `properties.httpsOnly`.
- **Resource type case sensitivity:** Use `=~` (case-insensitive match) for `Identifiers.Type` comparisons. For example, `Identifiers.Type =~ 'Microsoft.Storage/storageAccounts'`.
- **Null properties across subscriptions:** Test your query across subscriptions with varied configurations. Use `isnull()` checks where properties may be absent.

## Use custom recommendations at scale

Creating custom recommendations in the Azure portal is best for most users. The interface provides a convenient KQL editor and built-in validation tools. A programmatic approach can also be useful when you need to deploy recommendations across many environments or subscriptions.

### Automate via the API

If you prevalidated KQL queries and want to automate creating custom recommendations, you can use the Microsoft Defender for Cloud API. This method lets you deploy recommendations quickly, ensuring they're consistent and scalable across your cloud environments.  

- **Advantages**: You can automate and scale the deployment of custom recommendations.
- **When to use**: This method is ideal for large-scale implementations where you need to apply recommendations consistently across multiple environments.

For more information about using the API to manage custom recommendations, see the [Defender for Cloud Composite API reference](/rest/api/defenderforcloud-composite/operation-groups?view=rest-defenderforcloud-composite-latest&preserve-view=true).

## Create a custom standard

Custom recommendations can be assigned to one or more custom standards.

To create a custom standard:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > the relevant subscription.

1. Select **Security policies** > **+ Create** > **Standard**.

1. Select the recommendations that you want to add to the custom standard.

1. (Optional) For Azure subscriptions, review the Source column.

    :::image type="content" source="media/custom-security-policies/select-recommendations.png" alt-text="Custom standard creation page in Microsoft Defender for Cloud, showing the list of available recommendations for selection." lightbox="media/custom-security-policies/select-recommendations.png":::

1. Select **Create**.

## Create and enhance custom recommendations with Azure Policy (legacy)

For Azure subscriptions, you can create custom recommendations and standards, and enhance them, using Azure Policy. This is a legacy feature, and we recommend using the new custom recommendations feature.

### Create a custom recommendation and standard (legacy)

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

For another securityCenter property example, see [REST API examples for assessments metadata](/rest/api/defenderforcloud-composite/assessments-metadata/create-in-subscription?view=rest-defenderforcloud-composite-latest&tabs=HTTP&preserve-view=true#examples).

## Next steps

You can use the following links to learn more about Kusto queries:

- [KQL Quick Reference](/azure/data-explorer/kql-quick-reference)
- [Kusto Query Language (KQL) overview](/azure/data-explorer/kusto/query/)
- [What are security policies, initiatives, and recommendations?](security-policy-concept.md)
