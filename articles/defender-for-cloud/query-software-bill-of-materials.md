---
title: Query software bill of materials (SBOM)
description: Learn how to query Software Bill of Materials (SBOM) results in Microsoft Defender for Cloud's Cloud Security Explorer.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 01/18/2026
---

# Query software bill of materials (SBOM)

Microsoft Defender for Cloud's DevOps Security agentless scanning capabilities automatically generate a Software Bill of Materials (SBOM) for connected code repositories. When a scan finishes, the process publishes the repository and identified packages to the [cloud security graph](concept-attack-path.md#what-is-cloud-security-graph).

You can use Defender for Cloud's [cloud security explorer](concept-attack-path.md#what-is-cloud-security-explorer) to query this data. By using the cloud security explorer, you can locate specific packages (dependencies) and identify exactly which repositories use them. Use this information to identify the impact radius of a vulnerable package version across your organization.

## Prerequisites

* [Enable agentless scanning](agentless-code-scanning.md#enable-agentless-code-scanning-on-your-azure-devops-and-github-organizations) in your DevOps connector.
* Wait for the initial scan to complete so the Software Bill of Materials (SBOM) data is populated in the Cloud Map.

## Build a package query

By using the cloud security explorer, you can build a query to find repositories that include specific packages (dependencies) and versions.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Cloud Security Explorer**.

1. Select **Resource Type** > **DevOps**.

    :::image type="content" source="media/query-software-bill-of-materials/code-repository.png" alt-text="Screenshot that shows the cloud security explorer and where to select code repositories." lightbox="media/query-software-bill-of-materials/code-repository.png":::

1. Select the specific code repository type you want to filter for. For example, GitHub repositories.

1. Select **Done**.

1. Select **Search**. 

The query runs and returns all code repositories. Select a repository from the results to view more details about the installed software and its security posture.

### Add a dependency filter

To add a filter that searches for repositories containing specific packages (dependencies), continue building the query as follows. 

1. Select **(+)**.

1. Select **Application** > **Has installed software**.

    :::image type="content" source="media/query-software-bill-of-materials/has-installed-software.png" alt-text="Screenshot that shows how to apply the dependency, has installed software." lightbox="media/query-software-bill-of-materials/has-installed-software.png":::

1. Select **(+)** next to `Has installed software`.

1. Select **Name** > **Equals**.

1. Enter the package name. For example, `log4j`, `express`, or `newtonsoft.json`.

1. Select **Search**. 

The query runs and all repositories containing the specified package are presented. Select a repository from the results to view further details about the installed software and its security posture.

### Specify a version

To add a filter that searches for a specific package version, continue building the query as follows.

1. Select **(+)** next to `Has installed software`.

1. Select **Version**.

    :::image type="content" source="media/query-software-bill-of-materials/version.png" alt-text="A screenshot that shows where to navigate to, to select version." lightbox="media/query-software-bill-of-materials/version.png":::

1. Enter a version number. For example, `2.14.1`.

1. Select **Search** to run the query.

The query runs and all repositories containing the specified package and version are presented. Select a repository from the results to view further details about the installed software and its security posture.

## Next step

> [!div class="nextstepaction"]
> [Common questions about DevOps Security](faq-defender-for-devops.yml)
