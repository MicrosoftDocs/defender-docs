---
title: Delete installed Microsoft Sentinel out-of-the-box content and solutions
description: Remove solutions and content you deployed in Microsoft Sentinel.
author: EdB-MSFT
ms.topic: how-to
ms.date: 07/01/2026
ms.author: edbaynash
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016


#Customer intent: As a security operations center (SOC) analyst, I want to delete Microsoft Sentinel out-of-the-box content and solutions so that I can manage and customize my security monitoring environment effectively.

---

# Delete installed Microsoft Sentinel out-of-the-box content and solutions

If you installed an out-of-the-box solution, you can remove content items or delete the solution. To restore deleted content items, select **Reinstall** on the solution. You can also restore the solution by reinstalling it.
 
[!INCLUDE [unified-soc-preview](includes/unified-soc-preview.md)]

## Delete content items

Delete content items from a solution you installed from the content hub.

1. Open the content hub.
    - **Defender portal**: Select **Microsoft Sentinel** > **Content management** > **Content hub**.
    - **Azure portal**: Under **Content management**, select **Content hub**.
1. Select an installed solution with version 2.0.0 or higher.
1. On the solutions details page, select **Manage**.
1. Select the content item or items you want to delete.
1. Select **Delete**.

    :::image type="content" source="media/sentinel-solutions-delete/manage-solution-delete-item.png" alt-text="Screenshot of solution with content items selected for deletion.":::

To restore deleted content items, select **Reinstall** on the solution.

## Delete the solution

Delete a solution and its content templates from the content hub or the manage solution view. Deleting a solution doesn't delete active, cloned, saved, or custom items.

1. In the content hub, select an installed solution.
1. On the solutions details page, select **Delete**.
1. Select **Yes** to delete the solution and the templates.

    :::image type="content" source="media/sentinel-solutions-delete/manage-solution-delete.png" alt-text="Screenshot of the confirmation prompt to delete the solution.":::

To restore an out-of-the-box solution from the content hub, select the solution and **Install**.

## Related articles

- [Centrally discover and deploy Microsoft Sentinel out-of-the-box content and solutions](sentinel-solutions-deploy.md)
- [About Microsoft Sentinel content and solutions](sentinel-solutions.md)
- Microsoft Sentinel solutions catalog in the [Azure Marketplace](https://azuremarketplace.microsoft.com/marketplace/apps?filters=solution-templates&page=1&search=sentinel)
- [Microsoft Sentinel catalog](sentinel-solutions-catalog.md)
