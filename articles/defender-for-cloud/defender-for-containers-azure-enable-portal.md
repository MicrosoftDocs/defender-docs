---
title: Enable Defender for Containers on AKS via portal
description: Learn how to enable Microsoft Defender for Containers on your Azure Kubernetes Service (AKS) clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Enable Defender for Containers on AKS via portal

This article explains how to enable Microsoft Defender for Containers for Azure Kubernetes Service (AKS) clusters by using the Azure portal. You can enable all supported components or selectively enable specific components based on your requirements.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-aks](includes/defender-for-container-prerequisites-aks.md)]

## Enable Defender for Containers plan

First, enable the Defender for Containers plan on your subscription:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud**.

1. In the left menu, select **Environment settings**.

1. Select the subscription where your AKS clusters are located.

1. On the Defender plans page, find the **Containers** row and toggle the status to **On**.

1. Select **Settings** in the Containers plan row.

1. Toggle **On** or **Off** the relevant Defender for Containers components:

   - **Agentless scanning for machines** - Scans your machines for installed software, vulnerabilities, and secret scanning without relying on agents or impacting machine performance
   - **Defender sensor** - Deployed on each worker node, collects security related data, required for runtime threat protection
   - **Azure Policy** - Deployed as an agent on your Kubernetes cluster. Provides Kubernetes data plane hardening
   - **Kubernetes API access** - Required for agentless container posture, runtime vulnerability assessment and response actions
   - **Registry access** - Enables agentless vulnerability assessment for registry images

1. Select **Continue**.

1. Review the monitoring coverage page to see what resources are protected.

1. Select **Continue**.

1. Review the configuration summary and select **Save**.

## Next steps

- [Verify deployment](defender-for-containers-azure-verify.md)
- [Configure advanced settings for Defender for Containers](defender-for-containers-azure-configure.md)
- [Investigate and respond to runtime security alerts](defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters)
- [Review and remediate vulnerability findings](view-and-remediate-vulnerabilities-containers.md)

