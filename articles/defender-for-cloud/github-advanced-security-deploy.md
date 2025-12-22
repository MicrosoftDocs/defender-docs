---
title: Deploy GitHub Advanced Security Integration with Microsoft Defender for Cloud
description: Use this step-by-step guide to set up GitHub Advanced Security integration with Microsoft Defender for Cloud for code-to-cloud security.
ms.date: 12/08/2025
ms.topic: how-to
ms.author: dlanger
author: DebLanger
#customer intent: As a security administrator, I want to deploy and configure GitHub Advanced Security integration with Microsoft Defender for Cloud to protect applications from code to production.
---

# Deploy GitHub Advanced Security integration with Microsoft Defender for Cloud

This guide walks you through setup steps and other actions to help you integrate GitHub Advanced Security (GHAS) and Microsoft Defender for Cloud. This integration helps you maximize Microsoft's cloud-native application security.

By following this guide, you:

- Set up your GitHub repository for Defender for Cloud coverage.
- Create a runtime risk factor.
- Test real use cases in Defender for Cloud.
- Link code to cloud resources.
- Start a security campaign on GitHub. This campaign uses runtime context to prioritize GHAS security alerts based on runtime context.
- Create GitHub issues from Defender for Cloud to start remediation.
- Close the loop between engineering and security teams.

## Prerequisites

| Aspect | Details |
| ------ | ------- |
| Environmental requirements | - GitHub account with a connector created in Defender for Cloud<br>- GHAS license<br>- Defender Cloud Security Posture Management (CSPM) enabled on the subscription<br>- Microsoft Security Copilot (optional for automated remediation) |
| Roles and permissions | - Security Admin permissions<br>- Security Reader on the Azure subscription (to view findings in Defender for Cloud)<br>- GitHub organization owner |
| Cloud environments | - Available in commercial clouds only (not in Azure Government, Azure operated by 21Vianet, or other sovereign clouds) |

## Prepare your environment

### Step 1: Set up the GitHub repository and run the workflow

To test the integration, use your own repositories or an example GitHub repository that already has all the contents to build a vulnerable container image. Before you set up a repository, make sure that:

- You define a connector for the GitHub organization that you plan to use in the Defender for Cloud portal. Follow the steps in [Connect your GitHub environment to Microsoft Defender for Cloud](quickstart-onboard-github.md).

- You configure agentless code scanning for your GitHub connector. Follow the steps in [Configure agentless code scanning (preview)](agentless-code-scanning.md).

- The repository that you use for the integration is private.

If you want to use an example repository, clone the following repository to your GitHub organization: [build25-woodgrove/mdc-customer-playbook](https://github.com/build25-woodgrove/mdc-customer-playbook). This repository is for customers to test integration of Defender for Cloud and GHAS. It has GHAS enabled and is onboarded to an Azure tenant that has Defender CSPM enabled.

In the repository, follow these steps:

1. Go to **Settings**.

1. On the left pane, select **Secrets and variables** > **Actions**. Then select **New repository secret**.

   :::image type="content" source="media/github-advanced-security/new-repository-secret-button.jpg" alt-text="Screenshot of selections for creating a new repository secret in GitHub." lightbox="media/github-advanced-security/new-repository-secret-button.jpg":::

1. Add the following secrets at the repository or organization level:

    | Variable | Description |
    | -------- | ----------- |
    | `ACR_ENDPOINT` | The login server of the container registry |
    | `ACR_USERNAME` | The username for the container registry |
    | `ACR_PASSWORD` | The password for the container registry |

   > [!NOTE]
   > The names can be chosen freely and don't need to follow a specific pattern.

   You can find this information in the Azure portal by following these steps:

   1. Select the container registry that you want to deploy to.

   1. Under **Settings**, select **Access keys**. The **Access keys** pane shows the keys for the login server, username, and password.

      :::image type="content" source="media/github-advanced-security/acr-access-keys-panel.jpg" alt-text="Screenshot of the pane that lists access keys for a container registry in the Azure portal." lightbox="media/github-advanced-security/acr-access-keys-panel.jpg":::

1. In your repository, select **Actions**.

1. Select the **Build and Push to ACR** workflow, and then select **Run workflow**.

   :::image type="content" source="media/github-advanced-security/build-push-acr-workflow.jpg" alt-text="Screenshot of a GitHub repository's Actions section that shows workflow history and the button for running a workflow." lightbox="media/github-advanced-security/build-push-acr-workflow.jpg":::

1. Check that the image was deployed to your container registry.

   For the example repository, the image should be in a registry called **mdc-mock-0001** with the tag **mdc-ghas-integration**.

1. Deploy the same image as a running container on your cluster.
One way to complete this step is by connecting to the cluster and using the `kubectl run` command. Here's an example for Azure Kubernetes Service (AKS):

    1. Set the cluster subscription:

       ```bash
       az account set --subscription $subscriptionID
       ```

    1. Set the credentials for the cluster:

       ```bash
       az aks get-credentials --resource-group $resourceGroupName --name $kubernetesClusterName --overwrite-existing
       ```

    1. Deploy the image:

       ```bash
       kubectl run $containerName --image=$registryName.azurecr.io/mdc-mock-0001:mdc-ghas-integration
       ```

### Step 2: Create the first risk factor (business-critical rule)

One of the risk factors that Defender for Cloud detects for this integration is business criticality. Organizations can create rules to label resources as business critical.

1. In the Defender for Cloud portal, go to **Environment Settings** > **Resource Criticality**.

1. On the right pane, select the link to open Microsoft Defender.

   :::image type="content" source="media/github-advanced-security/microsoft-defender-resource-criticality.jpg" alt-text="Screenshot of the Defender for Cloud interface that shows selections for opening the Microsoft Defender portal." lightbox="media/github-advanced-security/microsoft-defender-resource-criticality.jpg":::

1. Select **Create a new classification**.

   :::image type="content" source="media/github-advanced-security/microsoft-defender-create-classification.jpg" alt-text="Screenshot of the button for creating a new classification." lightbox="media/github-advanced-security/microsoft-defender-create-classification.jpg":::

1. Enter a name and description.

1. In the query builder, select **Cloud resource**.

1. Write a query to set **Resource Name** equal to the name of the container that you deployed to your cluster for validation. Then select **Next**.

   :::image type="content" source="media/github-advanced-security/query-builder-cloud-resource.jpg" alt-text="Screenshot of the Microsoft Defender query builder with a resource name filter applied for a cloud resource." lightbox="media/github-advanced-security/query-builder-cloud-resource.jpg":::

1. On the **Preview Assets** page, if Microsoft Defender already detected your resource, the name of the container appears with an asset type of **K8s-container** or **K8s-pod**.

   Even if the name isn't yet visible, continue with the next step. Microsoft Defender applies the criticality label to the container after it detects the container. This process can take up to 24 hours.

1. Choose a criticality level, and then review and submit your classification rule.

### Step 3: Validate that your environment is ready

> [!NOTE]
> It can take up to 24 hours after the previous steps are applied to see the following results.

1. Test that [GitHub agentless scanning](agentless-code-scanning.md) picks up the repository.

1. Go to Cloud Security Explorer and perform the query.

   :::image type="content" source="media/github-advanced-security/validate-mdc-container-scan-results.jpg" alt-text="Screenshot of search results in the Cloud Security Explorer query builder, with filters set to GitHub repositories and container images." lightbox="media/github-advanced-security/validate-mdc-container-scan-results.jpg":::

1. Validate that Defender for Cloud (in Azure Container Registry) scanned the container image and used it to create a container. In your query, add the conditions for your specific deployment.

   :::image type="content" source="media/github-advanced-security/github-repo-container-vulnerabilities.jpg" alt-text="Screenshot of Cloud Security Explorer that shows scan results for a query with filters for GitHub repositories and container images." lightbox="media/github-advanced-security/github-repo-container-vulnerabilities.jpg":::

1. Validate that the container is running and that Defender for Cloud scanned the AKS cluster.

   :::image type="content" source="media/github-advanced-security/github-repo-container-scan-aks.jpg" alt-text="Screenshot of Cloud Security Explorer query results with filters for GitHub repositories and container images." lightbox="media/github-advanced-security/github-repo-container-scan-aks.jpg":::

1. Validate that the risk factors are configured correctly on the Defender for Cloud side. Search for your container name on the Defender for Cloud inventory page, and you should see it marked as critical.

### Step 4: Create a GitHub campaign

Because the workflow deploys an image that creates a running container with one of the risk factors (business critical), developers can see risk factors in GitHub.

> [!NOTE]
> After you classify your resource as critical, it can take up to 12 hours for Defender for Cloud to send the data to GitHub. [Learn more](https://docs.github.com/en/code-security/securing-your-organization/understanding-your-organizations-exposure-to-vulnerabilities/alerts-in-production-code).

1. In GitHub, go to the GitHub organization that you used for the setup testing.

1. Select **Security** > **Campaigns** > **Create a campaign from code scanning filters**.

   :::image type="content" source="media/github-advanced-security/security-campaigns-code-scanning.jpg" alt-text="Screenshot of options in GitHub to create a campaign from code or secret scanning filters." lightbox="media/github-advanced-security/security-campaigns-code-scanning.jpg":::

1. Create the following campaign. This campaign shows open alerts with medium severity where the image deployed from the repository is tied to a critical resource. Your test repository should be detected with this campaign.

   :::image type="content" source="media/github-advanced-security/campaigns-creation-filters.jpg" alt-text="Screenshot of a GitHub campaign with filters for open alerts, severity, and runtime risk." lightbox="media/github-advanced-security/campaigns-creation-filters.jpg":::

1. Select **Save** > **Publish as campaign**.

1. Enter the required information, and then publish the campaign.

### Step 5: Evaluate code-to-cloud recommendations

Use code-to-cloud recommendations and security alerts to understand the status of security issues. You can then assign the recommendation for resolution to the relevant engineering team with the help of the connection between Dependabot security alerts and matching common vulnerabilities and exposures (CVE) IDs in Defender for Cloud.

To view the code-to-cloud recommendations:

1. In the Defender for Cloud portal, go to the **Recommendations** tab.

1. Search for the name of the container that you created. Then, open one of the recommendations that includes the word **Update**.

   If you used the example repository, look for **Update brace-expansion recommendation**.

1. Go to the **Remediation Insights** tab and view the code-to-cloud diagram. The diagram maps your running container to the container image in the code repository and to the code repository of the origin in GitHub.

   :::image type="content" source="media/github-advanced-security/github-issue-creation-panel.jpg" alt-text="Screenshot of the Remediation Insights tab that shows a diagram of linked development phases." lightbox="media/github-advanced-security/github-issue-creation-panel.jpg":::

## View security alerts

1. Select the **Associated CVEs** tab. Notice that some CVE IDs have a **View on GitHub** link in the **Related GitHub Alerts** column.

1. Select the link to open the relevant GHAS security alert.

:::image type="content" source="media/github-advanced-security/associated-cves-tab-view.jpg" alt-text="Screenshot of the Associated CVEs tab that shows a link to a related GitHub alert." lightbox="media/github-advanced-security/associated-cves-tab-view.jpg":::

## Create a GitHub issue

To close the loop between security and engineering teams, you can create a GitHub issue that prioritizes the security issues that the engineering team should focus on. This prioritization can include passing findings that GHAS didn't pick up but that Defender for Cloud detected for CVE IDs that aren't part of direct dependencies. These findings can include vulnerabilities in the base image, operating system, or software like NGINX.

The GitHub issue is automatically generated with all the CVE IDs found in the scope of the recommendation. The recommendation is with and without Dependabot alert matches, including other runtime contexts on the repository of origin.

:::image type="content" source="media/github-advanced-security/github-issue-security-alert.jpg" alt-text="Screenshot of a GitHub issues list that shows three entries marked with security and vulnerability tags." lightbox="media/github-advanced-security/github-issue-security-alert.jpg":::

When you assign the issue, the issue status is updated in the Defender for Cloud portal.

:::image type="content" source="media/github-advanced-security/github-issue-security-details.jpg" alt-text="Screenshot of a GitHub issue with security and vulnerability tags, including details like CVE IDs, runtime risk factors, and deployment info." lightbox="media/github-advanced-security/github-issue-security-details.jpg":::

## Make agentic fixes

On the GitHub side, if you have a GitHub Copilot license, you can resolve the issue with the help of the GitHub coding agent:

1. Assign a GitHub coding agent to the issue.
1. Review the generated fix.
1. If the fix seems reasonable, apply it.
1. Observe as Defender for Cloud updates the issue status to **Closed**.

## Related content

- [What is GitHub Advanced Security integration with Microsoft Defender for Cloud (preview)?](github-advanced-security-overview.md)
- [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)
- [Quickstart: Connect your GitHub environment to Microsoft Defender for Cloud](quickstart-onboard-github.md)
- [Configure agentless code scanning (preview)](agentless-code-scanning.md)
