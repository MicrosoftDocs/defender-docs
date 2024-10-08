---
title: Integrate partner integrations
description: Learn how to integrate partner integrations in to Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 10/08/2024
---

# Integrate partner integrations

Microsoft Defender for Cloud integrates with both Microsoft services and partner solutions. By integrating partner integrations into your environment, you can enhance your security posture and add extra layers of protection to your resources and multicloud environments.

Each integration offers different benefits and capabilities. For example, some integrations help you to simplify deployment, while others help you to integrate detection, unify monitoring and management, and extend capabilities.

You can review the [list of available integrations](partner-integrations.md).

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

## Create the partner application

Before you can 

Depending on which integration you want to enable, after you finish the steps presented below, you might need to follow additional steps to complete the integration on the partners' side.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Entra ID**.

1. Select **+ Add** > **App registration** > **New registration**.

    :::image type="content" source="media/integrate-partner-integrations/app-registration.png" alt-text="Screenshot that shows  how to navigate to the app registration button." lightbox="media/integrate-partner-integrations/app-registration.png":::

1. Enter a name.

1. Select **Accounts in this organizational directory only (Microsoft only - Single tenant)**.

1. Select **Register**.

## Create a client secret

Once you've created the application, you need to create a client secret.

1. Select the application you created.

1. Navigate to the **Manage** > **Certificates & secrets**.

    :::image type="content" source="media/integrate-partner-integrations/secrets.png" alt-text="Screenshot that shows you where to navigate to to get to the Certificates and Secrets screen." lightbox="media/integrate-partner-integrations/secrets.png":::

1. Select **Client secrets** > **+ New client secret**.

1. Enter a name.

1. Select **Add**.

## Grant permissions

Once you've created the client secret, you need to grant permissions to the application.

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

Repeat these steps for any other relevant subscriptions.

## Next step

