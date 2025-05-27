---
title: Review pull request annotations in GitHub and Azure DevOps
description: Review pull request annotations in GitHub or in Azure DevOps.
ms.topic: how-to
ms.date: 05/25/2025
---

# Review pull request annotations in GitHub and Azure DevOps

Reviewing pull request annotations in GitHub and Azure DevOps is crucial for maintaining code quality and security. This process helps identify and resolve potential issues early in the development cycle, ensuring that the codebase remains robust and secure.

## Resolve security issues in GitHub

**To resolve security issues in GitHub**:

1. Navigate through the page and locate an affected file with an annotation.

1. Follow the remediation steps in the annotation. If you choose not to remediate the annotation, select **Dismiss alert**.

1. Select a reason to dismiss:

    - **Won't fix** - The alert is noted but won't be fixed.
    - **False positive** - The alert isn't valid.
    - **Used in tests** - The alert isn't in the production code.
  
## Resolve security issues in Azure DevOps

After configuring the scanner, you can view all detected issues.

**To resolve security issues in Azure DevOps**:

1. Sign in to the [Azure DevOps](https://azure.microsoft.com/products/devops).

1. Navigate to **Pull requests**.

    :::image type="content" source="media/tutorial-enable-pr-annotations/pull-requests.png" alt-text="Screenshot showing where to go to navigate to pull requests.":::

1. On the Overview, or files page, locate an affected line with an annotation.

1. Follow the remediation steps in the annotation.

1. Select **Active** to change the status of the annotation and access the dropdown menu.

1. Select an action to take:

    - **Active** - The default status for new annotations.
    - **Pending** - The finding is being worked on.
    - **Resolved** - The finding is addressed.
    - **Won't fix** - The finding is noted but won't be fixed.
    - **Closed** - The discussion in this annotation is closed.

DevOps security in Defender for Cloud reactivates an annotation if the security issue isn't fixed in a new iteration.

## Learn more

Learn more about [DevOps security in Defender for Cloud](defender-for-devops-introduction.md).

Learn how to [Discover misconfigurations in Infrastructure as Code](iac-vulnerabilities.md).

## Next steps

> [!div class="nextstepaction"]
> [DevOps security in Defender for Cloud](defender-for-devops-introduction.md).
