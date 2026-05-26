---
title: Building Cloud Security Explorer software vulnerabilities query
description: Learn to build queries with cloud security explorer in Microsoft Defender for Cloud to proactively identify software vulnerabilities in VMs and container images
ms.topic: how-to
ms.date: 05/26/2026
ms.author: elkrieger
author: ElazarK
ms.custom: sfi-image-nochange
#customer intent: As a security professional, I want to build Cloud Security Explorer queries in Microsoft Defender for Cloud to identify software vulnerabilities in virtual machines and container images.
---

# Build a Cloud Security Explorer query to identify software vulnerabilities in virtual machines (VMs) and container images

You can use Cloud Security Explorer to identify software vulnerabilities. The following examples show how to build queries for virtual machines (VMs) and container images.

For an introduction to Cloud Security Explorer queries, see [Build queries with Cloud Security Explorer](how-to-manage-cloud-security-explorer.md).

## Create a query to identify software vulnerabilities in VMs

To create a query that finds software vulnerabilities in VMs:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to [Microsoft Defender for Cloud > Cloud Security Explorer](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/SecurityGraph).

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer." lightbox="./media/concept-cloud-map/cloud-security-explorer-main-page.png":::

1. Filter for the software installed on VMs.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query.png" alt-text="Screenshot of Cloud Security Explorer query options to retrieve list of VMs with software installed." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query.png":::

1. Select **View details** for the VM you want to investigate.

1. In the **Result details** pane, go to **Insights** and select the software from the drop-down list for review.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details.png" alt-text="Screenshot shows results of Cloud Security Explorer query to retrieve VMs with software installed." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details.png":::

1. View the details of the installed software in the Insights section.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details-insights.png" alt-text="Screenshot shows Cloud Security Explorer query result details and insight results from the selected VM." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details-insights.png":::

## Create a query to identify software vulnerabilities in container images

To create a query that finds software vulnerabilities in container images:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to [Microsoft Defender for Cloud > Cloud Security Explorer](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/SecurityGraph).

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer." lightbox="./media/concept-cloud-map/cloud-security-explorer-main-page.png":::

1. Filter for the software installed in container images.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query.png" alt-text="Screenshot of Cloud Security Explorer query options to retrieve list of container images with software installed." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query.png":::

1. Select **View details** for the container image you want to investigate.

1. In the **Result details** pane, go to **Insights** and select the software from the drop-down list for review.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query-result-details.png" alt-text="Screenshot shows results of Cloud Security Explorer query to retrieve container images with software installed." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query-result-details.png":::

1. View the details of the installed software in the Insights section.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query-result-details-insights.png" alt-text="Screenshot shows Cloud Security Explorer query result details and insight results from the selected containers image." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query-result-details-insights.png":::

