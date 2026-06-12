---
title: Suppress alerts from Microsoft Defender for Cloud
description: Learn how to create alert suppression rules in Microsoft Defender for Cloud to automatically dismiss false positives and reduce alert noise.
ms.date: 05/28/2026
ms.topic: how-to
ms.custom: sfi-image-nochange, msecd-doc-authoring-1012
#customer intent: As a security admin, I want to suppress false positive security alerts so that I can focus on genuine threats.
---

# Suppress alerts from Microsoft Defender for Cloud

Microsoft Defender for Cloud generates security alerts when it detects threats in your environment. Some alerts might be expected or not relevant for your environment. You can create suppression rules to automatically dismiss alerts that match predefined conditions.

When an alert matches an active suppression rule, its status changes to **Dismissed**. The alert still appears in the security alerts list, but it no longer triggers notifications or appears in active alert views.

## Prerequisites

Required roles and permissions:

- **Security admin** or **Owner** can create and delete suppression rules.
- **Security reader** or **Reader** can view suppression rules.

For cloud availability, see the [Defender for Cloud support matrices for Azure commercial/other clouds](support-matrix-defender-for-cloud.md).

## Create a suppression rule

You can create a suppression rule for one or more alert types, or start from an existing alert to suppress similar alerts.

You can apply suppression rules to management groups or to subscriptions.

- To suppress alerts for a management group, use [Azure Policy](/azure/governance/policy/overview).
- To suppress alerts for subscriptions, use the Azure portal or the [REST API](#create-and-manage-suppression-rules-with-the-api).

A suppression rule applies only to alert types that have already been triggered at least once.

### Create a suppression rule for one or more alert types

To create a suppression rule for one or more alert types:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

1. Select **Suppression rules**.

   :::image type="content" source="media/alerts-suppression-rules/security-alerts-suppression-rules-button.png" alt-text="Screenshot of the Security alerts page with the Suppression rules button highlighted." lightbox="media/alerts-suppression-rules/security-alerts-suppression-rules-button.png":::

1. Select **Create new suppression rule**.

   :::image type="content" source="media/alerts-suppression-rules/create-new-suppression-rule-all-alerts.png" alt-text="Screenshot of the Suppression rules page with the Create new suppression rule button highlighted." lightbox="media/alerts-suppression-rules/create-new-suppression-rule-all-alerts.png":::

1. Select the subscriptions that the rule applies to.

1. Under **Alerts**, select **Custom** to choose specific alert types, or select **All** to apply the rule to all alert types.

1. If you selected **Custom**, select the alert types that the rule applies to.

1. If needed, add entity conditions to limit the rule to specific resources or entity values.

1. Enter a rule name.

    Rule names must begin with a letter or a number, be between 2 and 50 characters, and contain no symbols other than dashes (-) or underscores (_).

1. Select whether the rule is enabled or disabled.

1. Select a reason for suppressing the alert.

1. If needed, add a comment.

1. Select when the rule expires:

    - Select **Custom** to set an end date and time.
    - Select **None** to run the rule indefinitely.

1. If needed, select **Simulate** to test the rule.

1. Select **Apply**.

The rule is created and listed on the **Suppression rules** page.

### Create a suppression rule from a specific alert

To create a suppression rule from an alert that already exists:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

1. Select an alert.

1. Select **Take action**.

1. In the **Take action** tab, expand **Suppress similar alerts**.

1. Select **Create suppression rule**.

    :::image type="content" source="media/alerts-suppression-rules/create-suppression-rule-one-alert.png" alt-text="Screenshot of an alert details page with the Create suppression rule button highlighted under Suppress similar alerts." lightbox="media/alerts-suppression-rules/create-suppression-rule-one-alert.png":::

1. Review the selected alert type.

1. If needed, add entity conditions to limit the rule to specific resources or entity values.

1. Enter a rule name.

    Rule names must begin with a letter or a number, be between 2 and 50 characters, and contain no symbols other than dashes (-) or underscores (_).

1. Select whether the rule is enabled or disabled.

1. Select a reason for suppressing the alert.

1. If needed, add a comment.

1. Select when the rule expires:

    - Select **Custom** to set an end date and time.
    - Select **None** to run the rule indefinitely.

1. If needed, select **Simulate** to test the rule.

1. Select **Apply**.

The rule is created and listed on the **Suppression rules** page.

## Edit or delete a suppression rule

To edit or delete a suppression rule:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

1. Select **Suppression rules**.

1. Select the rule that you want to update.

1. To edit the rule, select **Edit**, update the rule details, and then select **Apply**.

1. To delete the rule, select **Remove**.

Deleting a suppression rule doesn't change the status of alerts that the rule already dismissed.

## Create and manage suppression rules with the API

You can create, view, and delete alert suppression rules by using the Defender for Cloud REST API.

To create a suppression rule for a specific alert type, first use the [Alerts REST API](/rest/api/defenderforcloud-composite/alerts?view=rest-defenderforcloud-composite-latest&preserve-view=true) to retrieve the alert that you want to suppress. Then use the [Alerts Suppression Rules REST API](/rest/api/defenderforcloud-composite/alerts-suppression-rules?view=rest-defenderforcloud-composite-latest&preserve-view=true) to create the rule.

The relevant methods for suppression rules in the [Alerts Suppression Rules REST API](/rest/api/defenderforcloud-composite/alerts-suppression-rules?view=rest-defenderforcloud-composite-latest&preserve-view=true) are:

- **UPDATE** - Create or update a suppression rule in a specified subscription.
- **GET** - Get the details of a specific suppression rule in a specified subscription.
- **LIST** - List all suppression rules configured for a specified subscription.
- **DELETE** - Delete an existing suppression rule. This method doesn't change the status of alerts that the suppression rule already dismissed.

For details and usage examples, see the [Defender for Cloud operation groups API reference](/rest/api/defenderforcloud-composite/operation-groups?view=rest-defenderforcloud-composite-latest&preserve-view=true).

## Related content

- Review [security alerts generated by Defender for Cloud](alerts-reference.md)
