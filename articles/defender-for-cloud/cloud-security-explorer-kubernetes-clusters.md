---
title: Building Cloud Security Explorer query to identify vulnerabilities in Kubernetes clusters
description: Learn to build queries with cloud security explorer in Microsoft Defender for Cloud to investigate vulnerabilities Kubernetes clusters
ms.topic: how-to
ms.date: 09/29/2024
ms.author: dacurwin
author: dcurwin
# Customer Intent: As a security professional, I want to learn how to build queries with Cloud Security Explorer in Microsoft Defender for Cloud to show vulnerabilities in Kubernetes clusters.
---

# Build Cloud Security Explorer queries to identify vulnerabilities in Kubernetes clusters

You can use the Cloud Security Explorer to identify vulnerabilities in your Kubernetes clusters. The following examples demonstrate the building of a queries that you can modify for your specific needs.

Read [Build queries Cloud Security Explorer](how-to-manage-cloud-security-explorer.md) for an introduction to Cloud Security Explorer queries.

## Create a query to identify software vulnerabilities in container images

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to [Microsoft Defender for Cloud > Cloud Security Explorer](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/SecurityGraph)

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer." lightbox="./media/cloud-security-explorer-kubernetes-clusters/cloud-security-explorer-main-page.png":::

1. Filter on the software in the container images to query.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query.png" alt-text="Screenshot of Cloud Security Explorer query options to retrieve list of container images with software installed." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query.png":::

1. Select the View details link of the container image of interest to see the result details pane. In the Insights section of the Result details pane is a drop-drown list of the software installed on the container image. Select the installed software for review.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query-result-details.png" alt-text="Screenshot shows results of Cloud Security Explorer query to retrieve container images with software installed." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query-result-details.png":::

1. View the details of the installed software in the Insights section.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query-result-details-insights.png" alt-text="Screenshot shows Cloud Security Explorer query result details and insight results from the selected containers image." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-explorer-containers-query-result-details-insights.png":::

## Create a query to identify vulnerabilities in cluster nodes:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to [Microsoft Defender for Cloud > Cloud Security Explorer](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/SecurityGraph)

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer." lightbox="./media/cloud-security-explorer-kubernetes-clusters/cloud-security-explorer-main-page.png":::

1. Filter on the cluster nodes in the Azure Kubernetes Services environment to query.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-query.png" alt-text="Screenshot of Cloud Security Explorer query options to retrieve list of cluster nodes with vulnerabilities." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-query.png":::

2. Select the View details link of the cluster node pool of interest to see the result details pane. In the Result details pane, select the virtual machine scale set icon above, to see the vulnerabilities below.

    :::image type="content" source="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-results-details.png" alt-text="Screenshot shows results of Cloud Security Explorer query to retrieve vulnerabilities in cluster nodes." lightbox="./media/cloud-security-explorer-kubernetes-clusters/security-cloud-explorer-kubernetes-nodes-results-details.png":::