---
title: Build Cloud Security Explorer queries to identify vulnerabilities in Kubernetes clusters
description: Learn how to build queries with Cloud Security Explorer in Microsoft Defender for Cloud to investigate vulnerabilities in Kubernetes clusters.
ms.topic: how-to
ms.date: 03/02/2026
ms.author: elkrieger
author: Elazark
# Customer Intent: As a security professional, I want to learn how to build queries with Cloud Security Explorer in Microsoft Defender for Cloud to show vulnerabilities in Kubernetes clusters.
---

# Build Cloud Security Explorer queries to identify vulnerabilities in Kubernetes clusters

Use Cloud Security Explorer to identify vulnerabilities in your Kubernetes clusters. The following examples show how to build queries to investigate container images and cluster nodes, and can be adapted to filter results based on your requirements.

For an introduction to Cloud Security Explorer queries, see [Build queries with Cloud Security Explorer](how-to-manage-cloud-security-explorer.md).

## Create a query to identify software vulnerabilities in container images

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Cloud Security Explorer**.

1. In **Query builder**, select **Select resource types**.

1. Select **Container Images**.

1. Search for and select **Has installed software**.

   :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/query-search-has-installed-software.png" alt-text="Screenshot of search box in Select resource types showing 'Has installed software' under Insights." lightbox="./media/cloud-security-explorer-kubernetes-clusters/query-search-has-installed-software.png":::
   
1. Select **Search**.

1. Select **View details >** for the relevant container image.

1. In the **Result details** pane, review **Insights - Has installed software**.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query-result-details.png" alt-text="Screenshot shows results of Cloud Security Explorer query to retrieve container images with software installed." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query-result-details.png":::

## Create a query to identify vulnerabilities in cluster nodes

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Cloud Security Explorer**.

1. In **Query builder**, select **Select resource types**.

1. Under **Kubernetes clusters**, select **Azure Kubernetes Service**.

1. Select **Done**.

1. Select **+** > **Select condition**.

1. In **Application**, select **Maintains**.

1. Select **Select resource types** > **Kubernetes Node Pools**.

1. Select **Done**.

1. Select **+** > **Select condition**.

1. Select **Maintains**.

1. Select **Select resource types** > **Virtual machines clusters**.

1. Select **Done**.

1. Select **+** > **Select condition**.

1. In **Vulnerabilities**, select **All vulnerabilities**.

1. Select **Search**.

1. Select **View details >** for the relevant Kubernetes node pool.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-results.png" alt-text="Screenshot of Cloud Security Explorer query options to retrieve list of cluster nodes with vulnerabilities." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-results.png":::

1. In the **Result details** pane, select the **Virtual machine scale set** icon to view vulnerabilities.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-results-details.png" alt-text="Screenshot shows results of Cloud Security Explorer query to retrieve vulnerabilities in cluster nodes." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-results-details.png":::