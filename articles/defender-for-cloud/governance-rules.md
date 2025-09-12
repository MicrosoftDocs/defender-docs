---
title: Drive Recommendation Remediation by Using Governance Rules
description: Learn how to drive remediation of security recommendations by using governance rules in Microsoft Defender for Cloud.
services: defender-for-cloud
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 05/18/2025
---

# Drive recommendation remediation by using governance rules

Security teams are responsible for improving their organization's security posture, but team members might not always follow through to implement security recommendations. Security teams can set governance rules to help drive accountability and a service level agreement (SLA) around the remediation process.

For an in-depth discussion around why governance rules are helpful, watch [this episode](episode-fifteen.md) of the Defender for Cloud in the field video series.

## Governance rules

You can define rules that automatically assign an owner and a due date to address recommendations for specific resources. This feature provides resource owners with a clear set of tasks and deadlines to remediate recommendations.

Learn how governance rules work in the following sections.

### Tracking

Track the progress of remediation tasks by sorting by subscription, recommendation, or owner. You can easily find tasks that need more attention so that you can follow up.

### Assignments

Governance rules can identify resources that require remediation according to specific recommendations or severities. The rule assigns an owner and due date to ensure the recommendations are handled. Many governance rules can apply to the same recommendations, so the rule with highest priority is the one that assigns the owner and due date.

### Due dates

The due date for remediation of a recommendation is based on a time frame of 7, 14, 30, or 90 days after the rule triggers the recommendation. For example, if the rule identifies the resource on March 1 and the remediation time frame is 14 days, March 15 is the due date. You can apply a grace period so that resources that need remediation don't affect your Microsoft Secure Score.

### Owners

You can also set owners of resources that recommendations relate to.

In organizations that use resource tags to associate resources with an owner, you can specify the tag key. The governance rule reads the name of the resource owner from the tag.

When an owner isn't found on a resource, associated resource group, or associated subscription based on the tag, the owner is shown as unspecified.

### Notifications

By default, email notifications are sent weekly to resource owners. Emails include a list of on-time and overdue tasks.

By default, the resource owner's manager receives an email that shows overdue recommendations, if the manager's email is found in the organizational Microsoft Entra ID.

### Conflicts

Conflicting rules are applied in scope order. For example, rules on a management scope for Azure management groups, Amazon Web Services (AWS) accounts, and Google Cloud Platform (GCP) organizations take effect before rules on scopes, like Azure subscriptions, AWS accounts, or GCP projects.

## Prerequisites

- The [Defender Cloud Security Posture Management (Defender CSPM) plan](concept-cloud-security-posture-management.md) must be enabled.
- You need **Contributor**, **Security Admin**, or **Owner** permissions on the Azure subscriptions.
- For AWS accounts and GCP projects, you need **Contributor**, **Security Admin**, or **Owner** permissions on the Defender for Cloud AWS or GCP connectors.

## Define a governance rule

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > **Governance rules**.

1. Select **Create governance rule**.

    :::image type="content" source="./media/governance-rules/add-rule.png" alt-text="Screenshot that shows the page where you add a governance rule." lightbox="media/governance-rules/add-rule.png":::

1. Specify a rule name and scope in which to apply the rule. Rules for management scope (Azure management groups, AWS master accounts, GCP organizations) are applied before the rules on a single scope.

   > [!NOTE]
   > Exclusions can't be created by using the portal wizard. To define exclusions, use the API.

1. Set a priority level. Rules are run in priority order from the highest (1) to the lowest (1000).

1. Specify a description to help you identify the rule.

1. Select **Next**.

1. Specify how the rule affects recommendations.

   - **By severity**: The rule assigns the owner and due date to any recommendation in the subscription that has no owner or due date.
   - **By specific recommendations**: Select the specific built-in or custom recommendations that the rule applies to.

     :::image type="content" source="./media/governance-rules/create-rule-conditions.png" alt-text="Screenshot that shows the page where you add conditions for a governance rule." lightbox="media/governance-rules/create-rule-conditions.png":::

1. To specify who's responsible for fixing recommendations covered by the rule, set the owner.

   - **By resource tag**: On your resources, enter the resource tag for the resource owner.
   - **By email address**: Enter the owner's email address.

1. Specify a remediation time frame that spans from when remediation recommendations are identified to when the remediation is due. If recommendations were issued according to the Microsoft cloud security benchmark, and you don't want the resources to affect your Secure Score until they're overdue, select **Apply grace period**.

1. (Optional) By default, owners and their managers are notified weekly about open and overdue tasks. If you don't want them to receive these weekly emails, clear the notification options.

1. Select **Create**.

If there are existing recommendations that match the definition of the governance rule, you can either:

- Assign an owner and due date to recommendations that don't already have an owner or due date.
- Overwrite the owner and due date of existing recommendations.

When you delete or disable a rule, all existing assignments and notifications remain.

## See the effects of rules

You can view the effect of governance rules in your environment.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > **Governance rules**.

1. Review governance rules. The default list shows all the governance rules applicable in your environment.

1. You can search for rules, or filter rules. There are several different ways to filter rules.

   - Filter on **Environment** to identify rules for Azure, AWS, and GCP.
   - Filter on rule name, owner, or time between the recommendation being issued and due date.
   - Filter on **Grace period** to find Microsoft cloud security benchmark recommendations that don't affect your Secure Score.
   - Identify by status.

    :::image type="content" source="./media/governance-rules/view-filter-rules.png" alt-text="Screenshot that shows the page where you can view and filter rules." lightbox="media/governance-rules/view-filter-rules.png":::

## Review the Governance report

You can use a Governance report to see recommendations by rule and owner that are completed on time, overdue, or unassigned. You can use this feature for any subscription that has governance rules.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > **Governance rules** > **Governance report**.

    :::image type="content" source="media/governance-rules/governance-report.png" alt-text="Screenshot that shows the Governance rules page where the Governance report button is located." lightbox="media/governance-rules/governance-report.png":::

1. Select a subscription.

     :::image type="content" source="./media/governance-rules/governance-in-workbook.png" alt-text="Screenshot that shows governance status by rule and owner in the governance workbook." lightbox="media/governance-rules/governance-in-workbook.png":::

From the Governance report, you can drill down into recommendations by the following categories:

- Scope
- Display name
- Priority
- Remediation time frame
- Owner type
- Owner details
- Grace period
- Cloud

## Next step

> [!div class="nextstep"]
> [Implement security recommendations](implement-security-recommendations.md)
