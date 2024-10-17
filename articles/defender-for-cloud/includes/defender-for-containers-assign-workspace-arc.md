---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 07/14/2022
ms.author: dacurwin
author: dcurwin
---

## Default Log Analytics workspace for Arc

The Defender sensor uses the Log Analytics workspace as a data pipeline to send data from the cluster to Defender for Cloud. The workspace doesn't retain any of the data. As a result, users aren't billed in this use case.

The Defender sensor uses a default Log Analytics workspace. If you don't have a default Log Analytics workspace, Defender for Cloud creates a new resource group and default workspace when you install the Defender sensor. The default workspace is based on your [region](../faq-data-collection-agents.yml).

The naming convention for the default Log Analytics workspace and resource group is:

- **Workspace**: DefaultWorkspace-\[subscription-ID]-\[geo]
- **Resource group**: DefaultResourceGroup-\[geo]

### Assign a custom workspace

When you enable automatic provisioning, a default workspace is automatically assigned. You can assign a custom workspace through Azure Policy.

To check if you have a workspace assigned:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Policy**.

    :::image type="content" source="../media/defender-for-containers/find-policy.png" alt-text="Screenshot that shows how to locate the policy page for Azure Arc." lightbox="../media/defender-for-containers/find-policy.png":::

1. Select **Definitions**.

1. Search for policy ID `708b60a6-d253-4fe0-9114-4be4c00f012c`.

    :::image type="content" source="../media/defender-for-containers/policy-search-arc.png" alt-text="Screenshot that shows where to search for the policy by ID for Azure Arc." lightbox="../media/defender-for-containers/policy-search-arc.png":::

1. Select **Configure Azure Arc enabled Kubernetes clusters to install Microsoft Defender for Cloud extension**.

1. Select **Assignments**.

    :::image type="content" source="../media/defender-for-containers/assignments-tab-arc.png" alt-text="Screenshot that shows the Assignments tab for Azure Arc." lightbox="../media/defender-for-containers/assignments-tab-arc.png":::

1. Use one of the next sections in this article as follows:

   - If the policy isn't yet assigned to the relevant scope, follow the [Create a new assignment with a custom workspace](#create-a-new-assignment-with-a-custom-workspace) steps.
   - If the policy is already assigned and you want to change it to use a custom workspace, follow the [Update an assignment with a custom workspace](#update-an-assignment-with-a-custom-workspace) steps.

#### Create a new assignment with a custom workspace

If the policy isn't yet assigned, the **Assignments** tab shows the number **0**.

:::image type="content" source="../media/defender-for-containers/no-assignment-arc.png" alt-text="Screenshot that shows that no workspace is assigned for Azure Arc." lightbox="../media/defender-for-containers/no-assignment-arc.png":::

To assign a custom workspace:

1. Select **Assign**.

1. On the **Parameters** tab, clear the **Only show parameters that need input or review** option.

1. Select a **LogAnalyticsWorkspaceResource** ID from the dropdown menu.

   :::image type="content" source="../media/defender-for-containers/drop-down-menu-arc.png" alt-text="Screenshot that shows the dropdown menu for a Log Analytics workspace resource ID related to Azure Arc." lightbox="../media/defender-for-containers/drop-down-menu-arc.png":::

1. Select **Review + create**.

1. Select **Create**.

#### Update an assignment with a custom workspace

If the policy is assigned to a workspace, the **Assignments** tab shows the number **1**.

> [!NOTE]
> If you have more than one subscription, the number might be higher. If you have a number **1** or higher but the assignment isn't on the relevant scope, follow the [Create a new assignment with a custom workspace](#create-a-new-assignment-with-a-custom-workspace) steps.

:::image type="content" source="../media/defender-for-containers/already-assigned-arc.png" alt-text="Screenshot of the tab that shows an assigned workspace for Azure Arc." lightbox="../media/defender-for-containers/already-assigned-arc.png":::

To assign a custom workspace:

1. Select the relevant assignment.

    :::image type="content" source="../media/defender-for-containers/relevant-assignment-arc.png" alt-text="Screenshot that shows the selection of an assignment for Azure Arc." lightbox="../media/defender-for-containers/relevant-assignment-arc.png":::

1. Select **Edit assignment**.

1. On the **Parameters** tab, clear the **Only show parameters that need input or review** option.

1. Select a **LogAnalyticsWorkspaceResource** ID from the dropdown menu.

   :::image type="content" source="../media/defender-for-containers/drop-down-menu-arc.png" alt-text="Screenshot that shows the dropdown menu for a Log Analytics workspace resource ID for Azure Arc." lightbox="../media/defender-for-containers/drop-down-menu-arc.png":::

1. Select **Review + save**.

1. Select **Save**.
