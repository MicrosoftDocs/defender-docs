---
title: Remediate code with Microsoft Security Copilot
description: Learn how Microsoft Security Copilot in Defender for Cloud helps fix Infrastructure as Code (IaC) misconfigurations by generating pull requests in your code repositories.
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security professional, I want to understand how to use Copilot to remediate code in Defender for Cloud so that I can improve my security posture.
ai-usage: ai-assisted
---

# Remediate code with Microsoft Security Copilot

Microsoft Defender for Cloud integrates with Microsoft Security Copilot to help you fix Infrastructure as Code (IaC) issues in your code repositories. With Copilot, you can catch and fix security issues early in the development cycle. Copilot creates pull requests (PRs) that correct the problems it finds. Automatically generated PRs help ensure that code issues are fixed quickly and correctly. Before you get started, make sure you meet the prerequisites for Defender for Cloud, Security Copilot, and repository integration.

## Prerequisites

Before you begin, make sure you have the following items set up:

- [Enable Defender for Cloud on your environment](connect-azure-subscription.md).
- [Connect your Azure DevOps environment to Defender for Cloud](quickstart-onboard-devops.md).
- [Configure the Microsoft Security DevOps Azure DevOps extension](azure-devops-extension.yml).
- [Review and ensure you meet the DevOps security support and prerequisites requirements](devops-support.md).
- [Have access to Azure Copilot](/azure/copilot/overview).
- [Have Security Compute Units assigned for Microsoft Security Copilot](/copilot/security/get-started-security-copilot).

## Remediate an Infrastructure as Code scanning finding

You can use Copilot in Defender for Cloud to fix flagged issues. Follow these steps to resolve a finding:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Go to **Recommendations**.

1. Search for and select the **Azure DevOps repositories should have infrastructure as code scanning findings resolved** recommendation.

    :::image type="content" source="media/remediate-code-with-copilot/search-recommendation.png" alt-text="Screenshot that shows the recommendation that you searched for." lightbox="media/remediate-code-with-copilot/search-recommendation.png":::

1. Select **Reduce risk with Copilot**.

    :::image type="content" source="media/remediate-code-with-copilot/copilot-summarize.png" alt-text="Screenshot that shows where the Summarize with copilot button is located." lightbox="media/remediate-code-with-copilot/copilot-summarize.png":::

1. Select **Help me remediate this recommendation**.

1. Select **security check**.

1. Select the description that matches the security check finding.
 
1. Select **Select**.

    :::image type="content" source="media/remediate-code-with-copilot/select-select.png" alt-text="Screenshot that shows where the select button is located." lightbox="media/remediate-code-with-copilot/select-select.png":::

1. Review the summary of the code fix.

1. Select **Submit**.

1. Select the pull request link shown in the Copilot results.

1. Review the pull request.

After Copilot creates the pull request in your code repository, a developer should review and approve it before merging.

<a name="next-step"></a>
## Next steps

> [!div class="nextstepaction"]
> [Scan for misconfigurations in Infrastructure as Code](iac-vulnerabilities.md#view-details-and-remediation-information-for-applied-iac-rules)
