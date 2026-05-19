---
title: Suppress alerts from Microsoft Defender for Cloud
description: Learn how to create alert suppression rules in Microsoft Defender for Cloud to automatically dismiss false positives and reduce alert noise.
ms.date: 05/18/2026
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.custom: sfi-image-nochange, msecd-doc-authoring-1012
#customer intent: As a security admin, I want to suppress false positive security alerts so that I can focus on genuine threats.
---
# Suppress alerts from Microsoft Defender for Cloud

Microsoft Defender for Cloud generates security alerts when it detects threats in your environment. These alerts can include false positives or other unwanted results. You can automatically suppress false positives or unwanted alerts by using alert suppression rules.

When an alert matches the conditions of an active suppression rule, the alert status is automatically changed to **Dismissed**. The alert still appears in the security alerts list with a Dismissed status, but it no longer triggers notifications or appears in active alert views.

## Prerequisites

Required roles and permissions:
- **Security admin** and **Owner** can create and delete rules.
- **Security reader** and **Reader** can view rules.

For cloud availability, see the [Defender for Cloud support matrices for Azure commercial/other clouds](support-matrix-defender-for-cloud.md).

## Create a suppression rule

You can apply suppression rules to management groups or to subscriptions.

- To suppress alerts for a management group, use [Azure Policy](/azure/governance/policy/overview).
- To suppress alerts for subscriptions, use the Azure portal or the [REST API](#create-and-manage-suppression-rules-with-the-api).

A suppression rule applies only to alert types that have already been triggered at least once.

To create a suppression rule for a specific alert in the Azure portal:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

    :::image type="content" source="media/alerts-suppression-rules/alerts-page.jpg" alt-text="Screenshot of Microsoft Defender for Cloud Security alerts page showing the alerts list." lightbox="media/alerts-suppression-rules/alerts-page.jpg":::

1. Select an alert.

1. Select **Take action**.

    :::image type="content" source="media/alerts-suppression-rules/take-action.jpg" alt-text="Screenshot of an alert details pane showing the Take action button." lightbox="media/alerts-suppression-rules/take-action.jpg":::

1. Select **Create suppression rule**.

    :::image type="content" source="media/alerts-suppression-rules/create-suppression-rule.png" alt-text="Screenshot of the Take action menu showing Create suppression rule." lightbox="media/alerts-suppression-rules/create-suppression-rule.png":::

1. Enter the appropriate details:

    - **Subscription** - The subscription where you want to create the rule.
    - (Optional) **Entities** - The resources that the rule applies to. You can specify a single resource, multiple resources, or resources that contain a partial resource ID. If you don't specify any resources, the rule applies to all resources in the subscription.
    - **Rule name** - A name for the rule. Rule names must begin with a letter or a number, be between 2 and 50 characters, and contain no symbols other than dashes (-) or underscores (_).
    - **State** - Whether the rule is enabled or disabled.
    - **Reason** - Select one of the built-in reasons or 'other' to specify your own reason in the comment.
    - (Optional) **Expiration date** - An end date and time for the rule. If you don't set an expiration date, the rule runs indefinitely.

1. (Optional) Select **Simulate** to test your rule.

1. Select **Apply**.

The rule is created and listed in the **Suppression rules** page.

## Edit or delete a suppression rule

To edit a rule that you created from the suppression rules page:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

1. Select **Suppression rules**.

    :::image type="content" source="media/alerts-suppression-rules/suppression-rules-button.png" alt-text="Screenshot of the Security alerts page showing the Suppression rules button." lightbox="media/alerts-suppression-rules/suppression-rules-button.png":::

1. Select the relevant subscriptions.

1. Select the three dots button **...** for the rule you want to edit.

1. Select **Edit**.

1. Edit the rule details.

1. Select **Apply**.

To delete a rule, use the same three dots menu and select **Remove**.

## Create and manage suppression rules with the API

You can create, view, or delete alert suppression rules by using the Defender for Cloud REST API.

Create a suppression rule for an alert that the API already triggered. First, use the [Alerts REST API](/rest/api/defenderforcloud-composite/alerts?view=rest-defenderforcloud-composite-latest&preserve-view=true) to retrieve the alert you want to suppress. Then, use the [Alerts Suppression Rules REST API](/rest/api/defenderforcloud-composite/alerts-suppression-rules?view=rest-defenderforcloud-composite-latest&preserve-view=true) to create a suppression rule with the retrieved alert information.

The relevant methods for suppression rules in the [Alerts Suppression Rules REST API](/rest/api/defenderforcloud-composite/alerts-suppression-rules?view=rest-defenderforcloud-composite-latest&preserve-view=true) are:

- **UPDATE**:

  - To create or update a suppression rule in a specified subscription.

- **GET**:

  - To get the details of a specific suppression rule on a specified subscription. This method returns one suppression rule.

- **LIST**:

  - To list all suppression rules configured for a specified subscription. This method returns an array of the applicable rules.

- **DELETE**:
  - To delete an existing suppression rule. This method doesn't change the status of alerts that the suppression rule already dismissed.

For details and usage examples, see the [Alerts suppression rules REST API reference](/rest/api/defenderforcloud-composite/operation-groups?view=rest-defenderforcloud-composite-latest&preserve-view=true).

## Next steps

> [!div class="nextstepaction"]
> [Review security alerts generated by Defender for Cloud](alerts-reference.md)
