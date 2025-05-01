---
title: Enable threat protection for AI services
description: Learn how to enable threat protection for AI services on your Azure subscription for Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.date: 05/01/2025
---

# Enable threat protection for AI services

Threat protection for AI services in Microsoft Defender for Cloud protects AI services on an Azure subscription by providing insights to threats that might affect your generative AI applications.

## Prerequisites

- Read the [Overview - AI threat protection](ai-threat-protection.md).

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- [Enable Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- We recommend not opting out of prompt-based triggered alerts for [Azure OpenAI content filtering](/azure/ai-services/openai/concepts/content-filter). Opting out and removing that capability can affect Defender for Cloud's ability to monitor and detect such attacks.

## Enable threat protection for AI services

Enable threat protection for AI services.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant Azure subscription.

1. On the Defender plans page, toggle the AI services to **On**.

    :::image type="content" source="media/ai-onboarding/enable-ai-workloads-plan.png" alt-text="Screenshot that shows you how to toggle threat protection for AI services to on." lightbox="media/ai-onboarding/enable-ai-workloads-plan.png":::

## Enable user prompt evidence

With the AI services threat protection plan enabled, you can control whether alerts include suspicious segments directly from your user's prompts, or the model responses from your AI applications or resources. Enabling user prompt evidence helps you to triage and classify alerts and your user's intentions.

User prompt evidence consists of prompts and model responses. Both are considered your data. Evidence is available through the Azure portal, Defender portal, and any attached partners integrations.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant Azure subscription.

1. Locate AI services and select **Settings**.

    :::image type="content" source="media/ai-onboarding/select-settings.png" alt-text="Screenshot that shows where the settings button is located on the Plans screen." lightbox="media/ai-onboarding/select-settings.png":::

1. Toggle Enable user prompt evidence to **On**.

    :::image type="content" source="media/ai-onboarding/enable-user-prompt-evidence.png" alt-text="Screenshot that shows you how to toggle user prompt evidence to on." lightbox="media/ai-onboarding/enable-user-prompt-evidence.png":::

1. Select **Continue**.

## Next steps

- [Add user and application context to AI alerts](gain-end-user-context-ai.md)
- [Explore AI alerts](alerts-ai-workloads.md)
- [Manage and respond to the security alerts](managing-and-responding-alerts.yml)
