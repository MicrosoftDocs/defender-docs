---
title: Query software bill of materials
description: Learn how to query Software Bill of Materials (SBOM) results in Microsoft Defender for Cloud's Cloud Security Explorer.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 01/11/2026
---

# Query software bill of materials

Microsoft Defender for Cloud’s DevOps Security agentless scanning capabilities automatically generate a Software Bill of Materials (SBOM) for connected code repositories. Once a scan completes, the repository and identified packages are published to the [cloud security graph](concept-attack-path.md#what-is-cloud-security-graph).

Defender for Cloud's [cloud security explorer](concept-attack-path.md#what-is-cloud-security-explorer) can be used to query this data. The cloud security explorer can be used to locate specific packages (dependencies) and identify exactly which repositories use them. This information can be used to identify the impact radius of a vulnerable package version across your organization.

## Prerequisites

* [Enable agentless scanning](agentless-code-scanning.md#enable-agentless-code-scanning-on-your-azure-devops-and-github-organizations) in your DevOps connector.
* Wait for the initial scan to complete so the Software Bill of Materials (SBOM) data is populated in the Cloud Map.

## Build a package query

Using the cloud security explorer, you can build a query to find repositories that include specific packages (dependencies) and versions.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Cloud Security Explorer**.

1. Select **Resource Type** > **DevOps**.

    :::image type="content" source="media/query-software-bill-of-materials/code-repository.png" alt-text="Screenshot that shows the cloud security explorer and where to select code repositories." lightbox="media/query-software-bill-of-materials/code-repository.png":::

1. Select the specific code repository type you wish to filter on (for example, GitHub repositories).

1. Select **Done**.

1. Select **Search**. 

The query runs and all code repositories are presented. Select a repository from the findings to view further details about the installed software and its security posture.

### Add a dependency filter

To add a filter that searches for repositories containing specific packages (dependencies), continue building the query as follows. 

1. Select **(+)**.

1. Select **Application** > **Has installed software**.

    :::image type="content" source="media/query-software-bill-of-materials/has-installed-software.png" alt-text="Screenshot that shows how to apply the dependency, has installed software." lightbox="media/query-software-bill-of-materials/has-installed-software.png":::

1. Select **(+)** next to `Has installed software`.

1. Select **Name** > **Equals**.

1. Enter the package name. For example, `log4j`, `express` or `newtonsoft.json`.

1. Select **Search**. 

The query runs and all repositories containing the specified package are presented. Select a repository from the findings to view further details about the installed software and its security posture.

### Specify a version

To add a filter that searches for a specific package version, continue building the query as follows.

1. Select **(+)** next to `Has installed software`.

1. Select **Version**.

    :::image type="content" source="media/query-software-bill-of-materials/version.png" alt-text="A screenshot that shows where to navigate to, to select version." lightbox="media/query-software-bill-of-materials/version.png":::

1. Enter a version number. For example, `2.14.1`.

1. Select **Search** to run the query.

The query runs and all repositories containing the specified package and version are presented. Select a repository from the findings to view further details about the installed software and its security posture.

### Example Query

The following configuration finds all GitHub repositories containing the package `log4j` with version `2.14.1`:

![Example Query](example.png)

> **Graph query:**
> `GitHub repositories` **where** `Has Installed Software` (**where** `Name` == 'log4j' **and** `Version` == '2.14.1')

## Analyze the results

Once the search completes, the results list will display all repositories matching your criteria. You can select a specific repository to view further details about the installed software and its security posture.

For more general information on building queries, see [Manage the Cloud Security Explorer](https://learn.microsoft.com/en-us/azure/defender-for-cloud/how-to-manage-cloud-security-explorer).