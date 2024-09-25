---
title: Build a Cloud Security Explorer query to identify software vulnerabilities
description: Learn how to build queries with cloud security explorer in Microsoft Defender for Cloud to proactively identify software vulnerabilities in VMs
ms.topic: how-to
ms.date: 09/29/2024
ms.author: dacurwin
author: dcurwin
ai-usage: ai-assisted
# Customer Intent: As a security professional, I want to learn how to build queries with Cloud Security Explorer in Microsoft Defender for Cloud to show software vulnerabilities in VMs.
---

# Build a Cloud Security Explorer query to identify software vulnerabilities in virtual machines (VMs)

You can use the Cloud Security Explorer to identify software vulnerabilities. The following example builds a query to identify software vulnerabilities in Virtual Machines (VMs).

You can also read [the introduction on how to use Cloud Security Explorer](how-to-manage-cloud-security-explorer.md).

## Create a query to identify software vulnerabilities in VMs

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to [Microsoft Defender for Cloud > Cloud Security Explorer](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/SecurityGraph)

    :::image type="content" source="./media/concept-cloud-map/cloud-security-explorer-main-page.png" alt-text="Screenshot of main page of Cloud Security Explorer" lightbox="./media/concept-cloud-map/cloud-security-explorer-main-page.png":::

1. Filter on the software in the VMs to query.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query.png" alt-text="Screenshot of query to retrieve VMs with software installed" lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query.png":::

1. Select the View details link on the line of the VM of interest to see the Result details pane. In the Insights section of the Result details pane is a drop-drown list of the software installed on the VM. Select the installed software for review.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details.png" alt-text="Screenshot shows results of query to retrieve VMs with software installed" lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details.png":::

1. The details of the installed software are presented.

    :::image type="content" source="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details-insights.png" alt-text="Screenshot shows result details and insight results from the selected VM" lightbox="./media/cloud-security-explorer-software-vulnerabilities/security-explorer-vm-query-result-details-insights.png":::
