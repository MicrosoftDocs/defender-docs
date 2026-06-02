---
title: Edit DevOps connectors
description: Update authorization, organization scope, and connector settings for Azure DevOps, GitHub, and GitLab environments onboarded to Defender for Cloud.
ms.date: 06/02/2026
ms.topic: how-to
ms.custom: ignite-2023
author: ElazarK
ms.author: elkrieger
---

# Edit DevOps connectors

After onboarding your Azure DevOps, GitHub, or GitLab environments to Microsoft Defender for Cloud, you might need to change the authorization token for a connector. You might also need to add or remove onboarded organizations or groups, or install the GitHub application to another scope. This article shows how to update those connector settings.

## Prerequisites

Before you edit a DevOps connector, make sure you have the following:

- An Azure account with Defender for Cloud onboarded. If you don't already have an Azure account, [create one for free](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).
- An onboarded DevOps environment. For onboarding guidance, see [Onboard Azure DevOps](quickstart-onboard-devops.md), [Onboard GitHub](quickstart-onboard-github.md), or [Onboard GitLab](quickstart-onboard-gitlab.md).

## Make edits to your DevOps connector

To edit a DevOps connector in Defender for Cloud:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Identify the connector you want to change.

1. Select **Edit settings** for the connector.

    :::image type="content" source="media/edit-devops-connector/edit-connector-1.png" alt-text="Screenshot of the connector page that shows where to select Edit settings." lightbox="media/edit-devops-connector/edit-connector-1.png":::

1. Go to **Configure access**. Here you can exchange tokens, change onboarded organizations or groups, or toggle autodiscovery.

    > [!NOTE]
    > If you're the owner of the connector, reauthorizing your environment to make changes is **optional**.
    > If you're trying to take ownership of the connector, you must reauthorize by using your access token. This change is irreversible as soon as you select **Reauthorize**.

1. Use **Edit connector account** to update onboarded inventory. If an organization or group is grayed out, verify that you have permissions to that environment and that the scope isn't onboarded elsewhere in the tenant.

    :::image type="content" source="media/edit-devops-connector/edit-connector-2.png" alt-text="Screenshot of the Edit connector account page that shows account selection options." lightbox="media/edit-devops-connector/edit-connector-2.png":::

1. To save inventory changes, select **Next: Review and generate >** and then select **Update**. If you skip **Update**, Defender for Cloud doesn't save your inventory changes.

## Next step

> [!div class="nextstepaction"]
> [Learn about DevOps security in Defender for Cloud](defender-for-devops-introduction.md)
