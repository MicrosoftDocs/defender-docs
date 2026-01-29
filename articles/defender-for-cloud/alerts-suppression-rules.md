---
title: Suppressing false positives or other unwanted security alerts
description: This article explains how to use Microsoft Defender for Cloud's suppression rules to hide unwanted security alerts, such as false positives.
ms.date: 01/29/2026
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.custom: sfi-image-nochange
---
# Suppress alerts from Microsoft Defender for Cloud

Microsoft Defender for Cloud generates security alerts when it detects threats in your environment. These alerts can sometimes include false positives or other unwanted alerts. You can automatically suppress any false positives or unwanted alerts by using alert suppression rules.

## Prerequisites

Required roles and permissions:
- **Security admin** and **Owner** can create and delete rules.
- **Security reader** and **Reader** can view rules.

For cloud availability, see the [Defender for Cloud support matrices for Azure commercial/other clouds](support-matrix-defender-for-cloud.md).

## Create a suppression rule

You can apply suppression rules to management groups or to subscriptions.

- To suppress alerts for a management group, use [Azure Policy](/azure/governance/policy/overview).
- To suppress alerts for subscriptions, use the Azure portal or the [REST API](#create-and-manage-suppression-rules-with-the-api).

The rule doesn't suppress alert types that never triggered on a subscription or management group before the rule was created.

Create a suppression rule for a specific alert in the Azure portal:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

    :::image type="content" source="media/alerts-suppression-rules/alerts-page.jpg" alt-text="Screenshot that shows how to navigate to the alerts page." lightbox="media/alerts-suppression-rules/alerts-page.jpg":::

1. Select an alert.

1. Select **Take action**.

    :::image type="content" source="media/alerts-suppression-rules/take-action.jpg" alt-text="Screenshot that shows the location of the take action button." lightbox="media/alerts-suppression-rules/take-action.jpg":::

1. Select **Create suppression rule**.

    :::image type="content" source="media/alerts-suppression-rules/create-suppression-rule.png" alt-text="Screenshot that shows the location of the create suppression rule button." lightbox="media/alerts-suppression-rules/create-suppression-rule.png":::

1. Enter the appropriate details:

    - **Subscription** - The subscription where you want to create the rule.
    - (Optional) **Entities** - The resources that the rule applies to. You can specify a single resource, multiple resources, or resources that contain a partial resource ID. If you don't specify any resources, the rule applies to all resources in the subscription.
    - **Rule name** - A name for the rule. Rule names must begin with a letter or a number, be between 2 and 50 characters, and contain no symbols other than dashes (-) or underscores (_).
    - **State** - Enabled or disabled.
    - **Reason** - Select one of the built-in reasons or 'other' to specify your own reason in the comment.
    - (Optional) **Expiration date** - An end date and time for the rule. Rules can run without any time limit as set in Expiration date.

1. (Optional) Select **Simulate** to test your rule.

1. Select **Apply**.

The rule is created and listed in the **Suppression rules** page.

## Edit a suppression rule

You can edit a rule that you created from the suppression rules page.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

1. Select **Suppression rules**.

    :::image type="content" source="media/alerts-suppression-rules/suppression-rules-button.png" alt-text="Screenshot that shows the suppression rule button in the Security Alerts page." lightbox="media/alerts-suppression-rules/suppression-rules-button.png":::

1. Select the relevant subscriptions.

1. Select the three dots button **...** for the rule you want to edit.

1. Select **Edit**.

1. Edit the rule details.

1. Select **Apply**.

To delete a rule, use the same three dots menu and select **Remove**.

## Create and manage suppression rules with the API

You can create, view, or delete alert suppression rules by using the Defender for Cloud REST API.

Create a suppression rule for an alert that the API already triggered. Use the [Alerts REST API](/rest/api/defenderforcloud-composite/alerts?view=rest-defenderforcloud-composite-latest&preserve-view=true) to retrieve the alert that you want to suppress. Then, use the [Alerts Suppression Rules REST API](/rest/api/defenderforcloud-composite/alerts-suppression-rules?view=rest-defenderforcloud-composite-latest&preserve-view=true) to create a suppression rule by using the retrieved alert information.

The relevant methods for suppression rules in the [Alerts Suppression Rules REST API](/rest/api/defenderforcloud-composite/alerts-suppression-rules?view=rest-defenderforcloud-composite-latest&preserve-view=true) are:

- **UPDATE**:

  - To create or update a suppression rule in a specified subscription.

- **GET**:

  - To get the details of a specific suppression rule on a specified subscription. This method returns one suppression rule.

- **LIST**:

  - To list all suppression rules configured for a specified subscription. This method returns an array of the applicable rules.

- **DELETE**:
  - To delete an existing suppression rule. This method doesn't change the status of alerts that the suppression rule already dismissed.

For details and usage examples, see the [API documentation](/rest/api/defenderforcloud-composite/operation-groups?view=rest-defenderforcloud-composite-latest&preserve-view=true).

## Next step

> [!div class="nextstep"]
> [security alerts generated by Defender for Cloud](alerts-reference.md).
