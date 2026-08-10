---
title: Connect partner integrations in Microsoft Defender for Cloud
description: Connect third-party partner solutions to Microsoft Defender for Cloud to enhance detection, simplify deployment, and extend multicloud protection.
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: sfi-image-nochange, msecd-doc-authoring-1013
#customer intent: As a security administrator, I want to connect partner integrations in Microsoft Defender for Cloud so that I can extend detection and protection across my environment.
ai-usage: ai-assisted
---

# Connect partner integrations in Microsoft Defender for Cloud

Microsoft Defender for Cloud works with Microsoft services and partner solutions. You can add partner solutions to improve your security posture. These solutions help protect your resources across multicloud setups.

Each integration offers different benefits. Some help simplify deployment. Others extend detection, monitoring, or management.

You can review the [list of available integrations](partner-integrations.md).

## Prerequisites

Before you begin, ensure you have the following:

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

## Create the partner application

Complete the following steps to create the app. Some partners might require extra setup on their side.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Entra ID**.

1. Select **+ Add** > **App registration** > **New registration**.

    :::image type="content" source="media/integrate-partner-integrations/app-registration.png" alt-text="Screenshot that shows  how to navigate to the app registration button." lightbox="media/integrate-partner-integrations/app-registration.png":::

1. Enter a name.

1. Select **Accounts in this organizational directory only (Microsoft only - Single tenant)**.

1. Select **Register**.

## Create a client secret

After you create the app, add a client secret.

1. Select the application you created.

1. Navigate to the **Manage** > **Certificates & secrets**.

    :::image type="content" source="media/integrate-partner-integrations/secrets.png" alt-text="Screenshot that shows you where to navigate to get to the Certificates and Secrets screen." lightbox="media/integrate-partner-integrations/secrets.png":::

1. Select **Client secrets** > **+ New client secret**.

1. Enter a name.

1. Select **Add**.

## Grant subscription permissions to the application

Next, give the app access to your subscription.

1. Search for and navigate to **Subscriptions**.

1. Select the relevant subscription.

1. Select **Access control (IAM)** > **+ Add** > **Add role assignment**.

    :::image type="content" source="media/integrate-partner-integrations/add-role-assignment.png" alt-text="Screenshot that shows how to navigate to the add role assignment button." lightbox="media/integrate-partner-integrations/add-role-assignment.png":::

1. Select **Security Reader**.

1. Select **Next**.

1. Select **+ Select members**.

1. Search for and select the application you created.

    :::image type="content" source="media/integrate-partner-integrations/demo-application.png" alt-text="Screenshot that shows how to search for and select the demo application." lightbox="media/integrate-partner-integrations/demo-application.png":::

1. Select **Select**.

1. Select **Review + assign**.

1. Follow the steps again to add the **Reader** role.

Repeat the role-assignment steps to assign the **Security Reader** and **Reader** roles for any other relevant subscriptions.

## Next step

> [!div class="nextstepaction"]
> [Review available partner integrations](partner-integrations.md)

