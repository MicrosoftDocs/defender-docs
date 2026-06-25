---
title: Get insights on and regulate access to sensitive content with app governance
ms.date: 06/16/2026
ms.topic: how-to
description: Identify which Microsoft 365 services apps access and determine whether they have accessed content protected with sensitivity labels.
ms.reviewer: anandd512
ms.custom: sfi-image-nochange, msecd-doc-authoring-1014
ai-usage: ai-assisted
---

# Get insights on and regulate access to sensitive content

App governance lets you quickly identify the Microsoft 365 services apps have accessed and if these apps have accessed content with sensitivity labels.

<a name="view-apps"></a>
## View apps that access sensitive content

To view apps that have accessed data across Microsoft 365 services, select **View apps** from the relevant card on the **Overview** tab. For example

:::image type="content" source="media/app-governance-visibility-insights-sensitive-content/image7.png" alt-text="Screenshot of the Apps that accessed Microsoft Entra services card.":::

Alternatively, select any of the labels listed under **Sensitivity labels access** on one of the apps tabs. Under each service type, app governance shows the number of times the app has accessed the corresponding label name in the last 30 days. For example:

:::image type="content" source="media/app-governance-visibility-insights-sensitive-content/sensitive-labels-details.png" alt-text="Screenshot of the Sensitivity labels tab on the Microsoft Entra apps tab.":::

For example, the screenshot of the Sensitivity labels tab shows that the app accessed content with the sensitivity label *Highly confidential* seven times on SharePoint, 15 times on OneDrive, and 25 times on Exchange Online in the last 30 days.

## Regulate access to sensitive content

By default, the predefined **Access to sensitive data** policy triggers alerts after an app accesses sensitive content.

Customize the predefined policy by:

- Selecting **Disable app** as the policy action to automatically deactivate apps that trigger alerts.
- Modifying the policy scope to apply the policy to specific apps or exclude specific apps.

For even more customization options, create a custom policy using the condition **Sensitivity labels accessed** in combination with [custom policy conditions](app-governance-app-policies-create.md#custom-policies).

## Next step

[Get detailed insights on a specific app](app-governance-visibility-insights-view-apps.md).
