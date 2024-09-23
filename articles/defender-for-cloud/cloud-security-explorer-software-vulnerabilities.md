---
title: Build Cloud Security Explorer queries to identify software vulnerabilities
description: Learn how to build queries with cloud security explorer in Microsoft Defender for Cloud to proactively identify software vulnerabilities in VM and container image software
ms.topic: how-to
ms.date: 09/29/2024
ms.author: dacurwin
author: dcurwin
ai-usage: ai-assisted
# Customer Intent: As a security professional, I want to learn how to build queries with Cloud Security Explorer in Microsoft Defender for Cloud to show software vulnerabilities in VMs and container images.
---

# Build Cloud Security Explorer queries to identify software vulneratbilities in virtual machines (VMs) and container images

You can use the Cloud Security Explorer to identify software vulnerabilities. The two following examples build queries to identify software vulnerabilities in VMs or in container images. [Read the documentation on how to use Cloud Security Explorer](how-to-manage-cloud-security-explorer) to understand the basics.

## Creating a query to identify software vulnerabilities in VMs

1. Sign in to the [Azure portal](https://portal.azure.com)

1. Navigate to Microsoft Defender for Cloud > Cloud Security Explorer

:::image type="content" source="media/concept-cloud-map/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer" lightbox="media/concept-cloud-map/cloud-security-explorer-main-page.png":::

1. Filter on the software in the VMs to query

:::image type="content" source="media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query.png" alt-text="Screenshot of query to retrieve VMs with software installed" lightbox="media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query.png":::

1. The results are shown. Then select the View details link on the line of VM of interest to see the Results details blade. In the Insights section of the Results details blade is a drop-drown list of the software installed on the VM. Select the installed software for review.

:::image type="content" source="media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details.png" alt-text="Screenshot of query to retrieve VMs with software installed" lightbox="media/security-explorer-vm-query-result-details.md":::

1. The details of the installed software will then be presented.

:::image type="content" source="media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details-insights.png" alt-text="Screenshot of query to retrieve VMs with software installed" lightbox="media/security-explorer-vm-query-result-details-insights.md":::

## Creating a query to identify software vulnerabilities in container images

1. Sign in to the [Azure portal](https://portal.azure.com)

1. Navigate to Microsoft Defender for Cloud > Cloud Security Explorer

:::image type="content" source="media/concept-cloud-map/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer" lightbox="media/concept-cloud-map/cloud-security-explorer-main-page.png":::

1. Filter on the software in the VMs to query

:::image type="content" source="media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query.png" alt-text="Screenshot of query to retrieve VMs with software installed" lightbox="media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query.png":::

1. The results are shown. Then select the View details link on the line of VM of interest to see the Results details blade.

:::image type="content" source="media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details.png" alt-text="Screenshot of query to retrieve VMs with software installed" lightbox="media/security-explorer-vm-query-result-details.md":::

1. View the results insights

:::image type="content" source="media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details-insights.png" alt-text="Screenshot of query to retrieve VMs with software installed" lightbox="media/security-explorer-vm-query-result-details-insights.md":::
