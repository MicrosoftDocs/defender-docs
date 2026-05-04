---
title: Enable Defender for Containers for a container registry
description: Learn how to enable Defender for Containers for a specific Azure Container Registry (ACR) in Microsoft Defender for Cloud.
ms.author: elkrieger
ms.topic: how-to
ms.date: 05/01/2026
ms.service: defender-for-cloud
---

# Enable Defender for Containers for a container registry

Use the Microsoft Defender for Cloud experience for Azure Container Registry (ACR) to enable Defender for Containers for a specific registry.

> [!IMPORTANT]
> This flow doesn't enable Defender for Containers at the [subscription level](defender-for-containers-deployment-overview.md). If Defender for Containers is already enabled at the subscription level, subscription-level settings override resource-level settings.

## Prerequisites

Before you begin, make sure you have:

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- An Azure Container Registry (ACR).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) enabled.

## Enable Defender for Containers for a container registry

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Container registries**.

1. Select the relevant registry.

1. Go to **Settings** > **Microsoft Defender for Cloud**.

1. Select **Settings**.

   :::image type="content" source="media/enable-defender-for-containers-container-registry/container-registries-settings-button.png" alt-text="Screenshot of the Microsoft Defender for Cloud page for a container registry, with the Settings button highlighted." lightbox="media/enable-defender-for-containers-container-registry/container-registries-settings-button.png":::

1. Turn on **Microsoft Defender for Containers**.

1. Under **Plan configuration**, turn on the settings you want for the registry:
   - **Registry access**
   - **Security findings**

   :::image type="content" source="media/enable-defender-for-containers-container-registry/container-registry-settings-pane.png" alt-text="Screenshot of the Settings pane for Microsoft Defender for Containers at the registry level, showing the Microsoft Defender for Containers, Registry access, and Security findings options turned on." lightbox="media/enable-defender-for-containers-container-registry/container-registry-settings-pane.png":::
   
1. Select **Save**.

## Next step

- [Review security findings for container registries](container-registry-findings.md)