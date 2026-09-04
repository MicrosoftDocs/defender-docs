---
title: Transition from disable rules to exemptions
description: Learn how to migrate from disable rules to exemptions in Microsoft Defender for Cloud as grouped recommendations are deprecated in favor of individual recommendations.
ms.topic: how-to
author: dlanger
ms.author: dlanger
ms.date: 07/03/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1013
---

# Transition from disable rules to exemptions

Microsoft Defender for Cloud is transitioning its recommendation model from grouped recommendations to individual recommendations. This article explains how to migrate your existing disable rules to the new exemption model, including how to map each disable rule type to its exemption equivalent and the steps to complete the migration before grouped recommendations are deprecated. As part of this change:

> [!IMPORTANT]
> Grouped recommendations are deprecated on **July 31, 2026**. We recommend completing your migration to exemptions before that date.

- Grouped recommendations are being deprecated and replaced with individual recommendations. Learn more about the [transition from grouped to individual recommendations](transition-grouped-individual-recommendations.md).
- Disable rules, which are used with grouped recommendations, are being deprecated.
- Exemption rules are the new approach for individual and risk-based recommendations.

## What's changing

In the old model, which is deprecated on **July 31, 2026**, grouped recommendations use **disable rules** to suppress findings.

:::image type="content" source="./media/transition-disable-rules-exemptions/disable-rules.png" alt-text="Screenshot showing the disable rules interface for sub-assessment recommendations." lightbox="./media/transition-disable-rules-exemptions/disable-rules.png":::

In the new model, individual and risk-based recommendations use **exemption rules**. Learn more in [Exempt resources at scale](exempt-resources-at-scale.md) and [Exempt resources from recommendations](exempt-resource.md).

Disable rules that you created for grouped recommendations aren't supported in the new model.

## Why use exemptions?

Exemptions give you a more scalable, flexible, and centralized way to manage exceptions.

1. **Centralized management across recommendations**: Disable rules apply per recommendation. If you wanted to disable the same Common Vulnerabilities and Exposures (CVE) across multiple recommendations, you had to create a separate rule for each one. With exemptions, you apply a rule once and it affects all relevant recommendations.
1. **Resource-level granularity**: Disable rules don't support fine-grained control for a specific resource. Exemptions let you apply rules at the individual resource level, such as a VM or container.
1. **Central visibility and tracking**: With disable rules, you had to open each recommendation to view its rules. With exemptions, you can view and manage all rules in one centralized experience.
1. **Exemption lifecycle with expiry dates**: Disable rules remain in effect until you remove them manually. Exemptions support expiry dates, which helps you reduce long-lived risk and review accepted vulnerabilities regularly.

## Migration guidance

There's no automatic migration from disable rules to exemptions. However, you can recreate your existing rules by using exemption conditions.

### Map disable rules to exemption conditions

Use this table to translate your existing disable rules into exemption conditions.

| Disable rule action | Exemption condition |
|---|---|
| IDs | Use the **Selected recommendations** condition and search for the relevant recommendation. |
| Categories | Use **Recommendation category**. For example, use categories such as *System updates* or *Service upgrade*. |
| Security checks | Use the **Selected recommendations** condition and search for the relevant recommendation. |
| CVEs | Use the **Vulnerabilities** condition and enter the CVE value in the **CVE** property. |
| CVSS | Use the **Vulnerabilities** condition and enter the CVSS value in the **CVSS** property. |
| Minimum severity | Use the **Vulnerabilities** condition and enter the severity value in the **Minimum severity** property. |
| Non-patchable | Use the **Vulnerabilities** condition and select **Non-patchable**. |

:::image type="content" source="./media/transition-disable-rules-exemptions/exemption-conditions.png" alt-text="Screenshot showing the exemption conditions available when creating an exemption rule." lightbox="./media/transition-disable-rules-exemptions/exemption-conditions.png":::

### Recommended migration steps

Use the following steps to migrate your existing disable rules to exemptions.

1. **Identify existing disable rules**: Review the rules configured for each recommendation and note the conditions you use, such as CVE and severity. Alternatively, you can use the following Azure Resource Graph (ARG) query to retrieve all existing disabled rules:

    ```kusto
    policyresources
    | where type =~ "microsoft.authorization/policyassignments"
    | extend filters = todynamic(properties).metadata.subAssessmentSettings.filters
    | where filters != ""
    ```

1. **Translate to exemption conditions**: Use the preceding mapping table to convert each rule to its exemption equivalent.
1. **Create the exemptions**: To create and manage exemptions, see [Exempt resources at scale](exempt-resources-at-scale.md) and [Exempt resources from recommendations](exempt-resource.md).

    :::image type="content" source="./media/transition-disable-rules-exemptions/create-new-exemption.png" alt-text="Screenshot showing how to create a new exemption in Defender for Cloud." lightbox="./media/transition-disable-rules-exemptions/create-new-exemption.png":::
1. **Prefer reusable rules**: Where possible, use broader exemption conditions that apply across multiple recommendations to reduce duplication.

#### Recreate a vulnerability-based exemption by using the REST API

When you migrate vulnerability assessment disable rules, you can use the Standard Assignments REST API to create an equivalent vulnerability-based exemption.

The following example exempts vulnerability findings that match all the specified conditions: CVE ID, severity, and CVSS score.

Replace `{subscriptionId}` with your Azure subscription ID and `{standardAssignmentName}` with a unique GUID for the exemption.

```http
PUT https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Security/standardAssignments/{standardAssignmentName}?api-version=2024-08-01
```

Use the following request body:

```json
{
  "properties": {
    "description": "Exempts vulnerability findings that match the specified conditions.",
    "displayName": "Vulnerability assessment exemption",
    "excludedScopes": [],
    "effect": "Exempt",
    "assignedStandard": null,
    "exemptionData": {
      "exemptionCategory": "Waiver",
      "assignedAssessment": {
        "assessmentKey": "122e0164-4019-4126-8c64-b0816b49505f"
      },
      "subAssessmentExemptionRule": {
        "if": {
          "allOf": [
            {
              "field": "va.cve.cveId",
              "operationType": "ContainedInOperation",
              "operation": {
                "values": [
                  {
                    "title": "CVE-2020-1347"
                  }
                ]
              }
            },
            {
              "field": "va.cve.severity",
              "operationType": "LessThanFilterOperation",
              "operation": {
                "value": "Low"
              }
            },
            {
              "field": "va.cve.cvss",
              "operationType": "LessThanFilterOperation",
              "operation": {
                "value": "8.0"
              }
            }
          ]
        }
      }
    }
  }
}
```

The `allOf` operator applies the exemption only to vulnerability findings that match all three conditions. Change the assessment key and condition values to match the disable rule that you're recreating.

For more information, see [Standard Assignments - Create](/rest/api/defenderforcloud/standard-assignments/create).

## Next steps

- [Transition from grouped to individual recommendations](transition-grouped-individual-recommendations.md) — Learn about the broader recommendation model change that this transition is part of.
- [Exempt resources from recommendations](exempt-resource.md) — Create an exemption for a specific resource or subscription.
- [Exempt resources at scale](exempt-resources-at-scale.md) — Manage exemptions centrally across multiple scopes.
- [Review exemptions](review-exemptions.md) — View and audit all active exemption rules.
- [Disable vulnerability findings on images (risk-based)](disable-vulnerability-findings-containers.md) — Learn about the disable rules feature that's being deprecated.
- [Security recommendations in Defender for Cloud](security-recommendations.md) — Understand how recommendations work in the new individual recommendations model.
