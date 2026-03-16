---
title: Building Cloud Security Explorer query to identify vulnerabilities in Kubernetes clusters
description: Learn to build queries with cloud security explorer in Microsoft Defender for Cloud to investigate vulnerabilities Kubernetes clusters
ms.topic: how-to
ms.date: 03/02/2026
ms.author: elkrieger
author: Elazark
# Customer Intent: As a security professional, I want to learn how to build queries with Cloud Security Explorer in Microsoft Defender for Cloud to show vulnerabilities in Kubernetes clusters.
---

# Build Cloud Security Explorer queries to identify vulnerabilities in Kubernetes clusters

You can use the Cloud Security Explorer to identify vulnerabilities in your Kubernetes clusters. The following examples demonstrate how to build queries that you can modify for your specific needs.

For an introduction to Cloud Security Explorer queries, see [Build queries with Cloud Security Explorer](how-to-manage-cloud-security-explorer.md).

## Create a query to identify software vulnerabilities in container images

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud > Cloud Security Explorer**.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer." lightbox="./media/cloud-security-explorer-kubernetes-clusters/cloud-security-explorer-main-page.png":::

1. Search for container images that have installed softwares.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query.png" alt-text="Screenshot of Cloud Security Explorer query options to retrieve list of container images with software installed." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query.png":::

1. Select the **View details** link to see the result details pane. 

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query-result-details.png" alt-text="Screenshot shows results of Cloud Security Explorer query to retrieve container images with software installed." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query-result-details.png":::

1. View the details of the installed software in the **Insights** section.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query-result-details-insights.png" alt-text="Screenshot shows Cloud Security Explorer query result details and insight results from the selected containers image." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query-result-details-insights.png":::

## Create a query to identify vulnerabilities in cluster nodes

1. Go to **Microsoft Defender for Cloud > Cloud Security Explorer**.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer." lightbox="./media/cloud-security-explorer-kubernetes-clusters/cloud-security-explorer-main-page.png":::

1. Create a query for cluster nodes in your Azure Kubernetes Service environment.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-results.png" alt-text="Screenshot of Cloud Security Explorer query options to retrieve list of cluster nodes with vulnerabilities." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-results.png":::

1. Select **View details** for the cluster node pool. In the **Result details** pane, select the **Virtual machine scale set** icon to view its vulnerabilities.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-results-details.png" alt-text="Screenshot shows results of Cloud Security Explorer query to retrieve vulnerabilities in cluster nodes." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-results-details.png":::