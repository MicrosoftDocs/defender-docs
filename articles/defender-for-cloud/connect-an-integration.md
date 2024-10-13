---
title: Connect an integration
description: Learn how to connect partner integrations into Microsoft Defender for Cloud to enhance security and gain insights for your multicloud environment.
author: dcurwin
ms.author: dacurwin
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 10/13/2024
#customer intent: As a cloud administrator, I want to connect partner integrations so that I can enhance security and gain insights.
---

# Connect an integration

Microsoft Defender for Cloud has many partner integrations that it can connect to. Depending on the which partner integration you connect, Defender for Cloud can either obtain or provide valuable insights to to secure your multicloud environment.

For the full list of available integrations, see the [overview of partner integrations](partner-integrations.md).

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- Connect your [non-Azure machines](quickstart-onboard-machines.md), [AWS accounts](quickstart-onboard-aws.md) or [GCP projects](quickstart-onboard-gcp.md).

- Have a subscription or an account with your partner integration.

## Connect the integration


1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Integrations**.

    :::image type="content" border="true" source="./media/connect-an-integration/integrations.png" alt-text="Screenshot of environment settings page that shows where to select the partner integration option.":::

1. Select **+ Add integration**.

1. Select the relevant partner integration.

1. Enter the required information for the integration.

1. Select **Save**.

The integration is now connected to Defender for Cloud and will appear in the list of connected integrations.

## Next step

> [!div class="nextstepaction"]
> 
