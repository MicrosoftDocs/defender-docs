---
title: Query software bill of materials
description: Learn how to query Software Bill of Materials (SBOM) results in Microsoft Defender for Cloud's Cloud Security Explorer.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 01/11/2026
---

# Query software bill of materials

Microsoft Defender for Cloud’s DevOps Security agentless scanning capabilities automatically generate a Software Bill of Materials (SBOM) for your connected code repositories. After a scan completes, the repository and identified packages are published to the Cloud Security Graph.

You can use the **Cloud Security Explorer** to query this data, allowing you to locate specific packages (dependencies) and identify exactly which repositories are using them. This is critical for identifying the impact radius of a vulnerable package version across your organization.

## Prerequisites

* [Enable agentless scanning](agentless-code-scanning.md#enable-agentless-code-scanning-on-your-azure-devops-and-github-organizations) in your DevOps connector.
* Wait for the initial scan to complete so the Software Bill of Materials (SBOM) data is populated in the Cloud Map.

## Build a package query

Use the following steps to filter for specific installed software across your DevOps environment.

1. In the Microsoft Defender for Cloud portal, navigate to **Cloud Security Explorer**.
2. In the query builder, select the drop-down for **Resource Type** and choose **DevOps**.
3. Select the specific **Code Repository** type you wish to filter on (for example, **GitHub repositories**).
4. To define the dependency, select the **(+)** button to add a condition.
5. Navigate to **Application** and select **Has Installed Software**.
6. To specify the package name:
   * Click the **(+)** button next to "Has Installed Software."
   * Select **Name**.
   * Choose the operator (e.g., **equals**) and enter the package name (e.g., `log4j`, `express`, `newtonsoft.json`).
7. *(Optional)* To specify a version:
   * Click the **(+)** button again to add another sub-condition.
   * Select **Version**.
   * Enter the specific version number you are hunting for.
8. Select **Search** to run the query.

### Example Query

The following configuration finds all GitHub repositories containing the package `log4j` with version `2.14.1`:

![Example Query](example.png)

> **Graph query:**
> `GitHub repositories` **where** `Has Installed Software` (**where** `Name` == 'log4j' **and** `Version` == '2.14.1')

## Analyze the results

Once the search completes, the results list will display all repositories matching your criteria. You can select a specific repository to view further details about the installed software and its security posture.

For more general information on building queries, see [Manage the Cloud Security Explorer](https://learn.microsoft.com/en-us/azure/defender-for-cloud/how-to-manage-cloud-security-explorer).