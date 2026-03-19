---
title: Exclude Kubernetes clusters from automatic Defender sensor deployment
description: Learn how to exclude specific Kubernetes clusters from automatic Defender for Containers sensor deployment by using resource tags.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 03/18/2026
---

# Exclude Kubernetes clusters from automatic Defender sensor deployment

When automatic provisioning is enabled in the Defender for Containers plan, Microsoft Defender for Cloud deploys the Defender sensor to supported Kubernetes clusters.

You can exclude specific clusters from automatic sensor deployment if you want to manage deployment for those clusters manually.

## Prerequisites

- [Defender for Containers is enabled](defender-for-containers-enable-portal.md) with automatic provisioning turned on on.

# [AKS](#tab/aks)

For Azure Kubernetes Service (AKS), apply the tag directly to the AKS resource.

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Go to **Kubernetes services**.

3. Select your AKS cluster.

4. Select **Tags**.

5. Add the following tag:
   - **Name**: `ms_defender_container_exclude_sensors`
   - **Value**: `true`

6. Select **Save**.

# [Arc-enabled Kubernetes](#tab/arc)

For Amazon EKS, Google Kubernetes Engine (GKE), and other non-Azure clusters connected through Azure Arc, apply the tag to the Azure Arc-enabled Kubernetes resource.

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Go to **Azure Arc** > **Kubernetes clusters**.

3. Select your Arc-enabled Kubernetes cluster.

4. Select **Tags**.

5. Add the following tag:
   - **Name**: `ms_defender_container_exclude_sensors`
   - **Value**: `true`

6. Select **Save**.

---

## Next steps

- Learn how to [install the Defender sensor using Helm](deploy-helm.md).

- Learn how to [deploy Defender components using Azure CLI](defender-for-containers-deploy-azure-cli.md).