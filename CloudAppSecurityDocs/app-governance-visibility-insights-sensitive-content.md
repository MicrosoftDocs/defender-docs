---
title: Get insights on and regulate access to sensitive content with app governance | Microsoft Defender for Cloud Apps
ms.date: 05/28/2023
ms.topic: how-to
description: Learn how to get insights on and regulate access to sensitive content in app governance with Microsoft Defender for Cloud Apps in Microsoft Defender XDR
---

# Get insights on and regulate access to sensitive content

App governance lets you quickly identify the Microsoft 365 services apps have accessed and if these apps have accessed content with sensitivity labels.

## View apps

To view apps that have accessed data across Microsoft 365 services, select **View apps** from the relevant card on the **Overview** tab. For example

:::image type="content" source="media/app-governance-visibility-insights-sensitive-content/image7.png" alt-text="Screenshot of the Apps that accessed Microsoft Entra services card.":::

Alternatively, select any of the labels listed under **Sensitivity labels access** on one of the apps tabs. Under each service type, app governance shows the number of times the app has accessed the corresponding label name in the last 30 days. For example:

:::image type="content" source="media/app-governance-visibility-insights-sensitive-content/sensitive-labels-details.png" alt-text="Screenshot of the Sensitivity labels tab on the Microsoft Entra apps tab.":::

For example, in the screenshot above, the app has accessed content with the sensitivity label *Highly confidential* seven times on SharePoint, 15 times on OneDrive, and 25 times on Exchange Online in the last 30 days.

## Regulate access to sensitive content

By default, the predefined **Access to sensitive data** policy triggers alerts after an app accesses sensitive content.

Customize the predefined policy by:

- Selecting **Disable app** as the policy action to automatically deactivate apps that trigger alerts.
- Modifying the policy scope to apply the policy to specific apps or exclude specific apps.

For even more customization options, create a custom policy using the condition **Sensitivity labels accessed** in combination with [other policy conditions](app-governance-app-policies-create.md#custom-policies).

## Next step

[Get detailed insights on a specific app](app-governance-visibility-insights-view-apps.md).
