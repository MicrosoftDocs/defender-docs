---
title: Building Cloud Security Explorer software vulnerabilities query
description: Learn to build queries with cloud security explorer in Microsoft Defender for Cloud to proactively identify software vulnerabilities in VMs and container images
ms.topic: how-to
ms.date: 09/29/2024
ms.author: dacurwin
author: dcurwin
ai-usage: ai-assisted
# Customer Intent: As a security professional, I want to learn how to build queries with Cloud Security Explorer in Microsoft Defender for Cloud to show software vulnerabilities in VMs and container iamges.
---

# Build a Cloud Security Explorer query to identify software vulnerabilities in virtual machines (VMs) and container images

You can use the Cloud Security Explorer to identify software vulnerabilities. The following examples build queries to identify software vulnerabilities in Virtual Machines (VMs) and container images.

Read [Build queries Cloud Security Explorer](how-to-manage-cloud-security-explorer.md) for an introduction to Cloud Security Explorer queries.

## Create a query to identify software vulnerabilities in VMs

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to [Microsoft Defender for Cloud > Cloud Security Explorer](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/SecurityGraph)

    :::image type="content" source="./media/concept-cloud-map/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer." lightbox="./media/concept-cloud-map/cloud-security-explorer-main-page.png":::

1. Filter on the software in the VMs to query.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query.png" alt-text="Screenshot of Cloud Security Explorer query options to retrieve list of VMs with software installed." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query.png":::

1. Select the View details link of the VM of interest to see the result details. In the Insights section of the Result details pane is a drop-drown list of the software installed on the VM. Select the installed software for review.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details.png" alt-text="Screenshot shows results of Cloud Security Explorer query to retrieve VMs with software installed." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details.png":::

1. View the details of the installed software in the Insights section.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details-insights.png" alt-text="Screenshot shows Cloud Security Explorer query result details and insight results from the selected VM." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details-insights.png":::

## Create a query to identify software vulnerabilities in container images

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to [Microsoft Defender for Cloud > Cloud Security Explorer](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/SecurityGraph)

    :::image type="content" source="./media/concept-cloud-map/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer." lightbox="./media/concept-cloud-map/cloud-security-explorer-main-page.png":::

1. Filter on the software in the container images to query.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query.png" alt-text="Screenshot of Cloud Security Explorer query options to retrieve list of container images with software installed." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query.png":::

1. Select the View details link of the container image of interest to see the result details. In the Insights section of the Result details pane is a drop-drown list of the software installed on the container image. Select the installed software for review.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query-result-details.png" alt-text="Screenshot shows results of Cloud Security Explorer query to retrieve container images with software installed." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query-result-details.png":::

1. View the details of the installed software in the Insights section.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query-result-details-insights.png" alt-text="Screenshot shows Cloud Security Explorer query result details and insight results from the selected containers image." lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-containers-query-result-details-insights.png":::
