---
title: Build Cloud Security Explorer queries for container vulnerabilities
description: Learn how to build Cloud Security Explorer queries in Microsoft Defender for Cloud to identify vulnerabilities in registry images and running containers.
ms.topic: how-to
ms.date: 04/23/2026
ms.author: elkrieger
author: Elazark
---

# Build Cloud Security Explorer queries for container vulnerabilities

Use Cloud Security Explorer to identify vulnerabilities in registry images and running containers.

For an introduction to Cloud Security Explorer, see [Build queries with Cloud Security Explorer](how-to-manage-cloud-security-explorer.md).

## Create a query to identify vulnerabilities in registry images

Use this query to find container images stored in registries that have known vulnerabilities.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Cloud Security Explorer**.

1. In **Query builder**, select **Select resource types**.

1. Select **Container Images**.

1. Select **Done**.

1. Select **+**.

1. Select **Select condition**.

1. In **Vulnerabilities**, select **All vulnerabilities**.

   :::image type="content" source="./media/cloud-security-explorer-container-vulnerabilities/registry-images-query.png" alt-text="Screenshot showing a Cloud Security Explorer query to identify vulnerabilities in container images stored in registries." lightbox="./media/cloud-security-explorer-container-vulnerabilities/registry-images-query.png":::

1. Select **Search**.

1. Select **View details >** for a container image.

1. In the **Result details** pane, review vulnerability information such as affected packages and severity.

1. Select **Open the vulnerability page** to review the vulnerability details.

## Create a query to identify vulnerabilities in running containers

Use this query to find container images that are currently used by workloads running in Kubernetes clusters and have known vulnerabilities.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Cloud Security Explorer**.

1. In **Query builder**, select **Select resource types**.

1. In **Containers**, select **Containers**.

1. Select **Done**.

1. Select **+**.

1. Select **Select condition**.

1. In **Application**, select **Created by**.

1. Select **Select resource types**.

1. Select **Container Images**.

1. Select **+**.

1. Select **Select condition**.

1. In **Vulnerabilities**, select **Has vulnerabilities**.

   :::image type="content" source="./media/cloud-security-explorer-container-vulnerabilities/running-containers-query.png" alt-text="Screenshot showing a Cloud Security Explorer query to identify vulnerabilities in container images used by running containers in Kubernetes clusters." lightbox="./media/cloud-security-explorer-container-vulnerabilities/running-containers-query.png":::

1. Select **Search**.

1. Select **View details >** for a container.

1. In the **Result details** pane, review vulnerability information such as affected images, severity, and related resources.

1. Select **Open the vulnerability page** to review the vulnerability details.

## Related content

- Learn how to [view and remediate vulnerabilities for registry images](view-and-remediate-vulnerability-registry-images.md)

- Learn how to [view and remediate vulnerabilities for running containers](view-and-remediate-vulnerabilities-containers.md)

- [Build queries with Cloud Security Explorer](how-to-manage-cloud-security-explorer.md)