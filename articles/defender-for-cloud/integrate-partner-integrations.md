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

## Enable a partner integration

Depending on which integration you want to enable, after you finish the steps presented below, you might need to follow additional steps to complete the integration on the partners' side.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Entra ID**.

1. Select **+ Add** > **App registration** > **New registration**.

    :::image type="content" source="media/integrate-partner-integrations/app-registration.png" alt-text="Screenshot that shows  how to navigate to the app registration button." lightbox="media/integrate-partner-integrations/app-registration.png":::

1. Enter a name.

1. Select **Accounts in this organizational directory only (Microsoft only - Single tenant)**.

1. Select **Register**.

1. Navigate to the **Manage** > **Certificates & secrets**.

    :::image type="content" source="media/integrate-partner-integrations/secrets.png" alt-text="Screenshot that shows you where to navigate to to get to the Certificates and Secrets screen." lightbox="media/integrate-partner-integrations/secrets.png":::

1. 