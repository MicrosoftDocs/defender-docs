---
title: Build Cloud Security Explorer queries for container vulnerabilities
description: Learn how to build Cloud Security Explorer queries in Microsoft Defender for Cloud to identify vulnerabilities in registry images and running containers.
ms.topic: how-to
ms.date: 07/03/2026
ms.author: elkrieger
author: Elazark
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1013
---

# Build Cloud Security Explorer queries for container vulnerabilities

Use Cloud Security Explorer to identify vulnerabilities in registry images and running containers. This article shows you how to build queries that find vulnerable container images in registries and in running Kubernetes workloads, and how to review the results.

For an introduction to Cloud Security Explorer, see [Build queries with Cloud Security Explorer](how-to-manage-cloud-security-explorer.md).

## Create a query to identify vulnerabilities in registry images

Find registry container images that have known vulnerabilities.

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

1. In **Result details**, review the affected packages and severity.

1. Select **Open the vulnerability page** for more details.

## Create a query to identify vulnerabilities in running containers

Find running containers in Kubernetes clusters that have known vulnerabilities.

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

1. In **Result details**, review the affected images, severity, and related resources.

1. Select **Open the vulnerability page** for more details.

## Related content

- Learn how to [view and remediate vulnerabilities for registry images](view-and-remediate-vulnerability-registry-images.md)

- Learn how to [view and remediate vulnerabilities for running containers](view-and-remediate-vulnerabilities-containers.md)

- [Build queries with Cloud Security Explorer](how-to-manage-cloud-security-explorer.md)