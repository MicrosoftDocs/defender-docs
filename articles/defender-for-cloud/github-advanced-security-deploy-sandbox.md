---
title: Deploy GitHub Advanced Security integration with Microsoft Defender for Cloud (Sandbox project)
description: Set up and validate a sandbox environment to evaluate GitHub Advanced Security and Microsoft Defender for Cloud integration end to end.
author: DeborahLanger
ms.author: delanger
ms.topic: how-to
ms.date: 03/03/2026
ms.service: defender-for-cloud
ms.subservice: devops-security
ms.custom: ignite-2025, github-advanced-security
---

# GitHub Advanced Security Integration with Microsoft Defender for Cloud – Sandbox Project

_Source:_ <https://learn.microsoft.com/en-us/azure/defender-for-cloud/github-advanced-security-deploy>

This guide provides setup steps for a sandbox project that helps you evaluate GitHub Advanced Security (GHAS) and Microsoft Defender for Cloud integration end to end with a simple use case.

This integration helps maximize Microsoft's cloud-native application security by correlating runtime risks and context with the originated code for faster AI-powered remediation.

By following this guide, you:

- Set up your GitHub repository for Defender for Cloud coverage.
- Create a runtime risk factor.
- Link code to runtime resources.
- Test real use cases in Defender for Cloud.

## Prerequisites

| **Aspect** | **Details** |
|-----------|-------------|
| Environmental requirements | - GitHub account with a connector created in Defender for Cloud<br>- GHAS license<br>- Defender Cloud Security Posture Management (DCSPM) enabled on the subscription<br>- Microsoft Security Copilot (optional for automated remediation) |
| Roles and permissions | - Security Admin permissions<br>- Security Admin on the Azure subscription (to view findings in Defender for Cloud)<br>- GitHub organization owner |
| Cloud environments | Available in commercial clouds only (not in Azure Government, Azure operated by 21Vianet, or other sovereign clouds). |

## Prepare your environment

### Step 1: Set up the GitHub repository and run the workflow

To test the integration, use the Sandbox example GitHub repository that already has all the contents to build a vulnerable container image.

Before you set up a repository, make sure that:

- Define a connector for the GitHub organization that you plan to use in the Defender for Cloud portal. Follow the steps in [Connect your GitHub environment to Microsoft Defender for Cloud](quickstart-onboard-github.md).
- Configure agentless code scanning for your GitHub connector. Follow the steps in [Configure agentless code scanning (preview)](agentless-code-scanning.md).
- Use a private repository for the integration.

1. Clone the following repository to your GitHub organization:

- <https://github.com/build25-woodgrove/mdc-customer-playbook> This repo has GHAS enabled and is onboarded to an Azure tenant that has Defender CSPM enabled.

1. In the repository, follow these steps:

    1. Go to **Settings**.
    1. On the left pane, select **Secrets and variables > Actions**. Then select **New repository secret**.
    1. Add the following secrets at the repository or organization level:

| **Variable** | **Description** |
|-------------|-----------------|
| ACR_ENDPOINT | The authentication server of the container registry. |
| ACR_USERNAME | The username for the container registry. |
| ACR_PASSWORD | The password for the container registry. |

> [!NOTE]
> You can choose any names for these variables. They don't need to follow a specific pattern.

You can find this information in the Azure portal by following these steps:

    1. Select the container registry that you want to deploy to.
    1. Under **Settings**, select **Access keys**.
    1. The **Access keys** pane shows the keys for the authentication server, username, and password.

In your repository, select **Actions**, select the **Build and Push to ACR** workflow, and then select **Run workflow**.

Check that the image was deployed to your container registry. For the example repository, the image should be in a registry called `mdc-mock-0001` with the tag `mdc-ghas-integration`.

Deploy the same image as a running container on your cluster. One way to complete this step is by connecting to the cluster and using the `kubectl run` command. Here's an example for Azure Kubernetes Service (AKS):

Set the cluster subscription:

   `az account set --subscription $subscriptionID`

Set the credentials for the cluster:

   `az aks get-credentials --resource-group $resourceGroupName --name $kubernetesClusterName --overwrite-existing`

Deploy the image:

   `kubectl run $containerName --image=$registryName.azurecr.io/mdc-mock-0001:mdc-ghas-integration`

### Step 2: Create the example risk factor (business-critical rule)

One of the risk factors that Defender for Cloud detects for this integration is business criticality. Organizations can create rules to label resources as business critical.

1. In the Defender for Cloud portal, go to **Environment settings** > **Resource criticality**.
1. On the right pane, select the link to open Microsoft Defender.
1. Select **Create a new classification**.
1. Enter a name and description.
1. In the query builder, select **Cloud resource**. Write a query to set **Resource Name** equal to the name of the container that you deployed to your cluster for validation. Then select **Next**.
1. On the **Preview Assets** page, if Microsoft Defender already detected your resource, the name of the container appears with an asset type of **K8s-container** or **K8s-pod**. Even if the name isn't yet visible, continue with the next step.
1. Choose a criticality level, and then review and submit your classification rule.

> [!NOTE]
> Microsoft Defender applies the criticality label to the container after it detects the container. This process can take up to 24 hours.

### Step 3: Validate that your environment is ready

Validation confirms that your environment is correctly configured to surface code to runtime recommendations and generate actionable results.

During this step, Defender verifies full code to runtime visibility.

- Microsoft Defender for Cloud continuously monitors source code repositories for security vulnerabilities.
- Build artifacts, such as container images, are scanned in container registries before deployment.
- Runtime workloads deployed to Kubernetes clusters are monitored for security risks.
- Defender for Cloud correlates and traces each artifact from code, through build and deployment, to runtime, and back.

> [!NOTE]
> It can take up to 24 hours after the previous steps are applied to see the following results.

Test that GitHub agentless scanning picks up the repository.

Go to Cloud Security Explorer and perform the query. The validation queries test whether Defender can identify artifacts produced by your pipelines and workloads. If the queries return results, it indicates that scanning and correlation are working as expected.

> [!NOTE]
> If no results are returned, it might indicate that artifacts aren't yet generated, scanning isn't configured, or permissions are missing.

- Validate that Defender for Cloud (in Azure Container Registry) scanned the container image and used it to create a container.
- In your query, add the conditions for your specific deployment.
- Validate that the container is running and that Defender for Cloud scanned the AKS cluster.
- Validate that the risk factors are configured correctly on the Defender for Cloud side. Search for your container name on the Defender for Cloud inventory page, and you should see it marked as critical.

> [!NOTE]
> This step is required only if risk factors aren't already configured in your environment.

Successful validation ensures that subsequent steps, such as recommendations, campaigns, and GitHub issue generation, produce meaningful results.

## Next steps

- [Set up GitHub Advanced Security native integration with Microsoft Defender for Cloud](github-advanced-security-deploy.md)
- [What is GitHub Advanced Security integration with Microsoft Defender for Cloud?](github-advanced-security-overview.md)
- [Quickstart: Connect your GitHub environment to Microsoft Defender for Cloud](quickstart-onboard-github.md)