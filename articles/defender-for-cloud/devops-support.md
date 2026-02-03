---
title: Support and prerequisites 
description: Understand support and prerequisites for DevOps security in Microsoft Defender for Cloud
ms.date: 01/04/2025
ms.topic: article
ms.custom: ignite-2023, references_regions
---

# Support and prerequisites: DevOps security

This article summarizes support information for DevOps security capabilities in Microsoft Defender for Cloud.

DevOps security provides visibility into your DevOps environments, helping security teams discover misconfigurations, exposed secrets, and code vulnerabilities across repositories and CI/CD pipelines in Azure DevOps, GitHub, and GitLab.

## Cloud and region support

DevOps security is available in the Azure commercial cloud, in these regions:

* Asia (East Asia)
* Australia (Australia East)
* Canada (Canada Central)
* Europe (West Europe, North Europe, Sweden Central)
* UK (UK South)
* US (East US, Central US)

## DevOps platform support

DevOps security currently supports the following DevOps platforms:

* [Azure DevOps Services](https://azure.microsoft.com/products/devops/)
* [GitHub Enterprise Cloud](https://docs.github.com/en/enterprise-cloud@latest/admin/overview/about-github-enterprise-cloud)
* [GitLab SaaS](https://docs.gitlab.com/ee/subscriptions/gitlab_com/)

> [!NOTE]
> Defender for DevOps currently doesn't support GitHub Enterprise Cloud instances configured with data residency.

## Required permissions

DevOps security requires the following permissions:

| Feature                          | Permissions                      |
|----------------------------------|----------------------------------|
| Connect DevOps environments to Defender for Cloud | <ul><li>Azure: Subscription Contributor or Security Admin</li><li>Azure DevOps: Project Collection Administrator on target Organization</li><li>GitHub: Organization Owner</li><li>GitLab: Group Owner on target Group</li></ul> |
| Review security insights and findings | Security Reader |
| Configure pull request annotations | Subscription Contributor or Owner |
| Install the Microsoft Security DevOps extension in Azure DevOps | Azure DevOps Project Collection Administrator |
| Install the Microsoft Security DevOps action in GitHub | GitHub Write |

> [!NOTE]
> To avoid setting highly privileged permissions on a subscription for read access to DevOps security insights and findings, apply the **Security Reader** role on the resource group or connector scope.

## Feature availability

DevOps security capabilities, such as code-to-cloud contextualization, security explorer, attack path analysis, and pull request annotations for Infrastructure-as-Code security findings, are available when you enable the paid Defender Cloud Security Posture Management (Defender CSPM) plan.

The following tables summarize the availability and prerequisites for each feature within the supported DevOps platforms:

### Azure DevOps

| Feature                          | Foundational CSPM                         | Defender CSPM                             | Prerequisites |
|----------------------------------|:-----------------------------------------:|:-----------------------------------------:|---------------|
| [Connect Azure DevOps repositories](quickstart-onboard-devops.md) | Yes | Yes | See [Azure DevOps onboarding prerequisites](quickstart-onboard-devops.md#prerequisites) |
| [Inventory of Azure DevOps resources](quickstart-onboard-devops.md) | Yes | Yes | [Azure DevOps connector](quickstart-onboard-devops.md#prerequisites) |
| [Security recommendations to fix DevOps environment misconfigurations](concept-devops-posture-management-overview.md) | Yes | Yes | [Azure DevOps connector](quickstart-onboard-devops.md#prerequisites) |
| [Security recommendations to fix code vulnerabilities](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud)| Yes | Yes | [Agentless code scanning (preview)](agentless-code-scanning.md) for agentless scans, or [Microsoft Security DevOps extension](configure-azure-devops-extension.md) for in-pipeline scans, or [GitHub Advanced Security for Azure DevOps](/azure/devops/repos/security/configure-github-advanced-security-features?view=azure-devops&tabs=yaml&preserve-view=true) for CodeQL scans |
| [Security recommendations to fix Infrastructure as Code (IaC) misconfigurations](iac-vulnerabilities.md) | Yes | Yes | [Agentless code scanning (preview)](agentless-code-scanning.md) for agentless scans, or [Microsoft Security DevOps extension](configure-azure-devops-extension.md) for in-pipeline scans |
| [Security recommendations to discover exposed secrets](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud) | Yes | Yes | [GitHub Advanced Security for Azure DevOps](/azure/devops/repos/security/configure-github-advanced-security-features?view=azure-devops&tabs=yaml&preserve-view=true) |
| [Security recommendations to fix open source vulnerabilities](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud) | Yes | Yes | [GitHub Advanced Security for Azure DevOps](/azure/devops/repos/security/configure-github-advanced-security-features?view=azure-devops&tabs=yaml&preserve-view=true) |
| [Pull request annotations](review-pull-request-annotations.md) | No | Yes | See [pull request annotations prerequisites](enable-pull-request-annotations.md) |
| [Code to cloud mapping for Containers](container-image-mapping.md) | No | Yes | [Microsoft Security DevOps extension](configure-azure-devops-extension.md#configure-the-microsoft-security-devops-azure-devops-extension) |
| [Code to cloud mapping for Infrastructure as Code (IaC) templates](iac-template-mapping.md) | No | Yes | [Microsoft Security DevOps extension](configure-azure-devops-extension.md) |
| [Attack path analysis](how-to-manage-attack-path.md) | No | Yes | Enable Defender CSPM on an Azure Subscription, AWS Connector, or GCP Connector in the same tenant as the DevOps Connector |
| [Cloud security explorer](how-to-manage-cloud-security-explorer.md) | No | Yes | Enable Defender CSPM on an Azure Subscription, AWS Connector, or GCP connector in the same tenant as the DevOps Connector |

### GitHub

| Feature                          | Foundational CSPM                         | Defender CSPM                             | Prerequisites |
|----------------------------------|:-----------------------------------------:|:-----------------------------------------:|---------------|
| [Connect GitHub repositories](quickstart-onboard-github.md) | Yes | Yes | See [GitHub onboarding prerequisites](quickstart-onboard-github.md#prerequisites) |
| [Inventory of GitHub DevOps resources](quickstart-onboard-github.md) | Yes | Yes | [GitHub connector](quickstart-onboard-github.md#prerequisites) |
| [Security recommendations to fix DevOps environment misconfigurations](concept-devops-posture-management-overview.md) | Yes | Yes | [GitHub connector](quickstart-onboard-github.md#prerequisites) |
| [Security recommendations to fix code vulnerabilities](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud)| Yes | Yes | [Agentless code scanning (preview)](agentless-code-scanning.md) for agentless scans, [Microsoft Security DevOps action](github-action.md) for in-pipeline scans, or [GitHub Advanced Security](https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security) for CodeQL scans |
| [Security recommendations to fix Infrastructure as Code (IaC) misconfigurations](iac-vulnerabilities.md) | Yes | Yes | [Agentless code scanning (preview)](agentless-code-scanning.md) for agentless scans, or [Microsoft Security DevOps action](github-action.md) for in-pipeline scans |
| [Security recommendations to discover exposed secrets](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud) | Yes | Yes | [GitHub Advanced Security](https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security) |
| [Security recommendations to fix open source vulnerabilities](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud) | Yes | Yes | [GitHub Advanced Security](https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security) |
| [Code to cloud mapping for Containers](container-image-mapping.md) | No | Yes | [Microsoft Security DevOps action](github-action.md) |
| [Attack path analysis](how-to-manage-attack-path.md) | No | Yes | Enable Defender CSPM on an Azure Subscription, AWS Connector, or GCP connector in the same tenant as the DevOps Connector |
| [Cloud security explorer](how-to-manage-cloud-security-explorer.md) | No | Yes | Enable Defender CSPM on an Azure Subscription, AWS Connector, or GCP connector in the same tenant as the DevOps Connector |

### GitLab

| Feature                          | Foundational CSPM                         | Defender CSPM                             | Prerequisites |
|----------------------------------|:-----------------------------------------:|:-----------------------------------------:|---------------|
| [Connect GitLab projects](quickstart-onboard-gitlab.md) | Yes | Yes | See [GitLab onboarding prerequisites](quickstart-onboard-gitlab.md#prerequisites) |
| [Security recommendations to fix code vulnerabilities](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud)| Yes | Yes | [GitLab Ultimate](https://about.gitlab.com/pricing/ultimate/) |
| [Security recommendations to fix infrastructure as code (IaC) misconfigurations](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud) | Yes | Yes | [GitLab Ultimate](https://about.gitlab.com/pricing/ultimate/) |
| [Security recommendations to discover exposed secrets](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud) | Yes | Yes | [GitLab Ultimate](https://about.gitlab.com/pricing/ultimate/) |
| [Security recommendations to fix open source vulnerabilities](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud) | Yes | Yes | [GitLab Ultimate](https://about.gitlab.com/pricing/ultimate/) |
| [Cloud security explorer](how-to-manage-cloud-security-explorer.md) | No | Yes | Enable Defender CSPM on an Azure Subscription, AWS Connector, or GCP connector in the same tenant as the DevOps Connector |
