---
title: Connect an integration
description: Learn how to connect partner integrations into Microsoft Defender for Cloud to enhance security and gain insights for your multicloud environment.
author: ElazarK
ms.author: elkrieger
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 05/24/2026
#customer intent: As a cloud administrator, I want to connect partner integrations so that I can enhance security and gain insights.
---

# Connect an integration

Microsoft Defender for Cloud connects with partner integrations. Your selected integration lets Defender for Cloud receive or share information that helps secure your multicloud environment.

For the full list of available integrations, see [Overview of partner integrations](partner-integrations.md).

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- Connect your [non-Azure machines](quickstart-onboard-machines.md), [Amazon Web Service accounts](quickstart-onboard-aws.md), or [Google Cloud Platform](quickstart-onboard-gcp.md).

- Have a subscription or an account with your partner integration.

## Connect the integration

To connect a partner integration:

1. Sign in to the Azure portal at [portal.azure.com](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Integrations**.

    :::image type="content" border="true" source="./media/connect-an-integration/integrations.png" alt-text="Microsoft Defender for Cloud Environment settings page with the Integrations tab selected.":::

1. Select **+ Add integration**.

    :::image type="content" source="media/connect-an-integration/add-integration.png" alt-text="Integrations page showing the + Add integration button above the connector list." lightbox="media/connect-an-integration/add-integration.png":::

1. Select **the relevant partner integration**.

1. Enter the required information for the integration.

1. Select **Save**.

The integration now appears in the list of connected integrations.

## Next step

> [!div class="nextstepaction"]
> [Connect Endor Labs to Defender for Cloud](connect-endor-labs.md)

