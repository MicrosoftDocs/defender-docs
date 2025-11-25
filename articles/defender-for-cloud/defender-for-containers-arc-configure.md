---
title: Configure Defender for Containers on Arc-enabled Kubernetes
description: Learn how to configure Microsoft Defender for Containers settings and components for your Arc-enabled Kubernetes clusters after deployment.
ms.topic: how-to
ms.date: 06/04/2025
ai-usage: ai-assisted
---

# Configure Defender for Containers on Arc-enabled Kubernetes

This article explains how to configure Microsoft Defender for Containers on your Arc-enabled Kubernetes clusters.

## Prerequisites

- [Connect the Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).
- Complete the [prerequisites listed in the documentation for generic cluster extensions](/azure/azure-arc/kubernetes/extensions#prerequisites).

## Enable the plan

1. In Defender for Cloud, select **Settings**, then select the subscription you want.
1. On **Defender plans**, select **Containers** > **Settings**.
1. Turn on the component you want.

   :::image type="content" source="media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="media/defender-for-containers-enable-plan-gke/container-components-on.png":::

   > [!NOTE]
   > When you turn off Defender for Containers, the components are set to **Off**. They're not deployed to any more containers, but they're not removed from containers where they're already installed.

By default, when you enable the plan through the Azure portal, [Microsoft Defender for Containers](defender-for-containers-introduction.md) automatically installs the required components to provide the protections that the plan offers. This configuration includes the assignment of a default workspace.

If you want to disable automatic installation of components during the onboarding process, select **Edit configuration** for the **Containers** plan. The advanced options appear, and you can disable automatic installation for each component.

You can also modify this configuration from the **Defender plans** page.

> [!NOTE]
> If you disable the plan after enabling it through the portal, you need to manually remove Defender for Containers components deployed on your clusters.

You can [assign a custom workspace](#assign-a-custom-workspace) through Azure Policy.

If you disable the automatic installation of any component, you can deploy the component to one or more clusters by using the appropriate recommendation:

- Azure Policy add-on for Kubernetes: [Azure Kubernetes Service clusters should have the Azure Policy add-on for Kubernetes installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/08e628db-e2ed-4793-bc91-d13e684401c3)
- Azure Kubernetes Service profile: [Azure Kubernetes Service clusters should have Defender profile enabled](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/56a83a6e-c417-42ec-b567-1e6fcb3d09a9)
- Defender extension for Azure Arc-enabled Kubernetes: [Azure Arc-enabled Kubernetes clusters should have the Defender extension installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/3ef9848c-c2c8-4ff3-8b9c-4c8eb8ddfce6)
- Azure Policy extension for Azure Arc-enabled Kubernetes: [Azure Arc-enabled Kubernetes clusters should have the Azure Policy extension installed](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/0642d770-b189-42ef-a2ce-9dcc3ec6c169)

Learn more about the [roles for provisioning Defender for Containers extensions](permissions.md#roles-used-to-automatically-configure-agents-and-extensions).

## Assign a custom workspace

When you enable automatic provisioning, the system automatically assigns a default workspace. You can assign a custom workspace through Azure Policy.

To check if you have a workspace assigned:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Policy**.

   :::image type="content" source="media/defender-for-containers/find-policy.png" alt-text="Screenshot that shows how to locate the policy page for Azure Arc." lightbox="media/defender-for-containers/find-policy.png":::

1. Select **Definitions**.

1. Search for policy ID `708b60a6-d253-4fe0-9114-4be4c00f012c`.

   :::image type="content" source="media/defender-for-containers/policy-search-arc.png" alt-text="Screenshot that shows where to search for the policy by ID for Azure Arc." lightbox="media/defender-for-containers/policy-search-arc.png":::

1. Select **Configure Azure Arc enabled Kubernetes clusters to install Microsoft Defender for Cloud extension**.

1. Select **Assignments**.

   :::image type="content" source="media/defender-for-containers/assignments-tab-arc.png" alt-text="Screenshot that shows the Assignments tab for Azure Arc." lightbox="media/defender-for-containers/assignments-tab-arc.png":::

1. Use one of the next sections in this article as follows:
   - If you didn't assign the policy to the relevant scope, follow the [Create a new assignment with a custom workspace](#create-a-new-assignment-with-a-custom-workspace) steps.
   - If you already assigned the policy and want to change it to use a custom workspace, follow the [Update an assignment with a custom workspace](#update-an-assignment-with-a-custom-workspace) steps.

### Create a new assignment with a custom workspace

If you don't assign the policy, the **Assignments** tab shows the number **0**.

:::image type="content" source="media/defender-for-containers/no-assignment-arc.png" alt-text="Screenshot that shows that no workspace is assigned for Azure Arc." lightbox="media/defender-for-containers/no-assignment-arc.png":::

To assign a custom workspace:

1. Select **Assign**.

1. On the **Parameters** tab, clear the **Only show parameters that need input or review** option.

1. Select a **LogAnalyticsWorkspaceResourceId** value from the dropdown menu.

   :::image type="content" source="media/defender-for-containers/drop-down-menu-arc.png" alt-text="Screenshot that shows the dropdown menu for a Log Analytics workspace resource ID related to Azure Arc." lightbox="media/defender-for-containers/drop-down-menu-arc.png":::

1. Select **Review + create**.

1. Select **Create**.

### Update an assignment with a custom workspace

If you assign the policy to a workspace, the **Assignments** tab shows the number **1**.

> [!NOTE]
> If you have more than one subscription, the number might be higher. If you see a number **1** or higher but the assignment isn't on the relevant scope, follow the [Create a new assignment with a custom workspace](#create-a-new-assignment-with-a-custom-workspace) steps.

:::image type="content" source="media/defender-for-containers/already-assigned-arc.png" alt-text="Screenshot of the tab that shows an assigned workspace for Azure Arc." lightbox="media/defender-for-containers/already-assigned-arc.png":::

To assign a custom workspace:

1. Select the relevant assignment.

   :::image type="content" source="media/defender-for-containers/relevant-assignment-arc.png" alt-text="Screenshot that shows the selection of an assignment for Azure Arc." lightbox="media/defender-for-containers/relevant-assignment-arc.png":::

1. Select **Edit assignment**.

1. On the **Parameters** tab, clear the **Only show parameters that need input or review** option.

1. Select a **LogAnalyticsWorkspaceResourceId** value from the dropdown menu.

   :::image type="content" source="media/defender-for-containers/drop-down-menu-arc.png" alt-text="Screenshot that shows the dropdown menu for a Log Analytics workspace resource ID for Azure Arc." lightbox="media/defender-for-containers/drop-down-menu-arc.png":::

1. Select **Review + save**.

1. Select **Save**.

## Next steps

- [Verify your deployment](defender-for-containers-arc-verify.md)
- [Remove Defender for Containers](defender-for-containers-arc-remove.md)
