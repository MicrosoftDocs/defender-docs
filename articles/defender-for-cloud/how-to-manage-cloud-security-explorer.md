---
title: Build queries with cloud security explorer
description: Learn how to build queries with cloud security explorer in Microsoft Defender for Cloud to proactively identify security risks in your cloud environment.
ms.topic: how-to
ms.date: 03/31/2025
ms.author: dacurwin
author: dcurwin
ai-usage: ai-assisted
# Customer Intent: As a security professional, I want to learn how to build queries with cloud security explorer in Microsoft Defender for Cloud so that I can proactively identify security risks in my cloud environment and improve my security posture.
---

# Build queries with cloud security explorer

Defender for Cloud's contextual security capabilities help security teams reduce the risk of significant breaches. Defender for Cloud uses environmental context to assess security issues, identify the biggest risks, and distinguish them from less risky issues. The cloud security explorer uses snapshot publishing, a method of publishing data at regular intervals known as snapshots. This ensures that the workload configuration data is refreshed daily, keeping it fresh and accurate.

Use the cloud security explorer to identify security risks in your cloud environment by running graph-based queries on the cloud security graph, Defender for Cloud's context engine. Prioritize your security team's concerns while considering your organization's specific context and conventions.

With the cloud security explorer, query all security issues and environment context such as asset inventory, internet exposure, permissions, and lateral movement between resources across Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP).

## Prerequisites

- You must [enable Defender CSPM](enable-enhanced-security.md)
  - You must [enable agentless scanning](enable-vulnerability-assessment-agentless.md).
  
  For agentless container posture, you must enable the following extensions:
  - [K8S API access](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan)
  - [Registry access](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan)

  > [!NOTE]
  > If you only have [Defender for Servers P2](tutorial-enable-servers-plan.md) plan 2 enabled, you can use the cloud security explorer to query for keys and secrets, but you must have Defender CSPM enabled to get the full value of the explorer.

- Required roles and permissions:
  - Security Reader
  - Security Admin
  - Reader
  - Contributor
  - Owner

Check the [cloud availability tables](supported-machines-endpoint-solutions-clouds-servers.md) to see which government and cloud environments are supported.

## Build a query

The cloud security explorer lets you build queries to proactively hunt for security risks in your environments with dynamic and efficient features such as:

- **Multi-cloud and multi-resource queries** - The entity selection control filters are grouped and combined into logical control categories to help you build queries across cloud environments and resources simultaneously.

- **Custom Search** - Use the dropdown menus to apply filters and build your query.

- **Query templates** - Use any of the available prebuilt query templates to build your query more efficiently.

- **Share query link** - Copy and share a link to your query with others.

**To build a query**:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Cloud Security Explorer**.

    :::image type="content" source="media/concept-cloud-map/cloud-security-explorer-main-page.png" alt-text="Screenshot of the cloud security explorer page." lightbox="media/concept-cloud-map/cloud-security-explorer-main-page.png":::

1. Find and select a resource from the drop-down menu.

    :::image type="content" source="media/how-to-manage-cloud-security/cloud-security-explorer-select-resource.png" alt-text="Screenshot of the resource drop-down menu." lightbox="media/how-to-manage-cloud-security/cloud-security-explorer-select-resource.png":::

1. Click **+** to add more filters to your query.

    :::image type="content" source="media/how-to-manage-cloud-security/cloud-security-explorer-query-search.png" alt-text="Screenshot that shows a full query and where to select on the screen to perform the search." lightbox="media/how-to-manage-cloud-security/cloud-security-explorer-query-search.png":::

1. Add subfilters if necessary.

1. After building your query, click **Search** to run it.

    :::image type="content" source="media/how-to-manage-cloud-security/cloud-security-explorer-query-search-populated.png" alt-text="Screenshot that shows where to select search to run the query and results populated." lightbox="media/how-to-manage-cloud-security/cloud-security-explorer-query-search-populated.png":::

1. To save a copy of your results locally, click the **Download CSV report** button to save your search results as a CSV file.

    :::image type="content" source="media/how-to-manage-cloud-security/download-csv-report.png" alt-text="Screenshot that shows where the download CSV report button is located on the screen.":::

## Query templates

Query templates are preformatted searches using common filters. Use one of the existing query templates at the bottom of the page by selecting **Open query**.

:::image type="content" source="media/how-to-manage-cloud-security/cloud-security-explorer-query-templates.png" alt-text="Screenshot that shows you the location of the query templates." lightbox="media/how-to-manage-cloud-security/cloud-security-explorer-query-templates.png":::

Modify any template to search for specific results by changing the query and selecting **Search**.

## Share a query

Use the query link to share a query with others. After creating a query, select **Share query link**. The link is copied to your clipboard.

:::image type="content" source="media/how-to-manage-cloud-security/cloud-security-explorer-share-query.png" alt-text="Screenshot showing the Share Query Link icon." lightbox="media/how-to-manage-cloud-security/cloud-security-explorer-share-query.png":::

## Next step

> [!div class="nextstepaction"]
> [Learn about the cloud security graph, attack path analysis, and the cloud security explorer](concept-attack-path.md)
