---
title: Deploy GitHub Advanced Security integration with Microsoft Defender for Cloud
description: Step-by-step guide to set up GitHub Advanced Security integration with Microsoft Defender for Cloud for code-to-cloud security.
ms.date: 12/08/2025
ms.topic: how-to
ms.author: dlanger
author: DebLanger
#customer intent: As a security administrator, I want to deploy and configure GitHub Advanced Security integration with Microsoft Defender for Cloud to protect applications from code to production.
---

# Deploy GitHub Advanced Security integration with Microsoft Defender for Cloud

This guide walks you through all the setup steps to help you get the most out of Microsoft's cloud-native application security by integrating GitHub Advanced Security (GHAS) and Microsoft Defender for Cloud (MDC).

By following this guide, you:

- Set up your GitHub repo for Microsoft Defender for Cloud (MDC) coverage
- Create a runtime risk factor
- Test real use cases in MDC
- Link code to cloud resources
- Start a security campaign on GitHub, leveraging runtime context to prioritize the GHAS security alerts based on runtime context
- Create GitHub issues from MDC to start remediation
- Close the loop between Engineering & Security teams

## Prerequisites

| Aspect | Details |
|--------|---------|
| Environmental Requirements | - GitHub account with a connector created in Microsoft Defender for Cloud (MDC)<br>- GitHub Advanced Security (GHAS) license<br>- Defender CSPM enabled on the subscription<br>- GitHub Security Copilot (optional for automated remediation) |
| Roles & Permissions | - Security Admin permissions<br>- Security Reader on the Azure Subscription (to view findings in MDC)<br>- GitHub organization owner |
| Cloud Environments | - Available in Commercial Clouds only (not in US Gov, China Gov, or other sovereign clouds) |

## Prepare your environment

### Step 1: Set up the GitHub repository and run the workflow

To test the integration, use your own repositories or an example GitHub repository that already has all the contents to build a vulnerable container image.

- Ensure that you define a connector for the GitHub organization you plan to use in Microsoft Defender for Cloud portal. For connector definition, follow the steps on [Connect your GitHub organizations](quickstart-onboard-github.md).

- Make sure you have agentless code scanning configured for your GitHub connector. If not, follow the steps on: [Configure agentless code scanning (Preview)](agentless-code-scanning.md).

> [!NOTE]
> Make sure the repo you use for the integration is private.

If you want to use an example repository, clone the following repository to your GitHub organization. This repository has GHAS enabled and is onboarded to an Azure tenant with DCSPM enabled:[build25-woodgrove/mdc-customer-playbook](https://github.com/build25-woodgrove/mdc-customer-playbook). This repo is for customers to test Microsoft Defender for Cloud and GHAS integration.

In the repository, follow these steps:

1. Go to **Settings**.
1. On the left panel, select **Secrets and Variables** > **Actions**.
1. Add the following repository secrets:

| Variable | Description |
|----------|-------------|
| ACR_ENDPOINT | The login server of the Azure Container Registry |
| ACR_PASSWORD | The password for the Azure Container Registry |
| ACR_USERNAME | The username for the Azure Container Registry |

:::image type="content" source="media/ghas/new-repository-secret-button.jpg" alt-text="Screenshot of GitHub interface with 'Secrets and variables' menu selected and 'New repository secret' button visible." lightbox="media/ghas/new-repository-secret-button.jpg":::

You can find this information in the Azure portal by following these steps:

1. Select the **ACR** you want to deploy to.
1. Select **Access Keys** under **Settings**.
:::image type="content" source="media/ghas/acr-access-keys-panel.jpg" alt-text="Screenshot of Azure portal showing Access Keys page for a container registry with login server, username, and password fields visible." lightbox="media/ghas/acr-access-keys-panel.jpg":::
1. In your repository, select **Actions**.
1. Select the **Build and Push to ACR** workflow and run the workflow.
:::image type="content" source="media/ghas/build-push-acr-workflow.jpg" alt-text="Screenshot of GitHub repository Actions section showing workflow history and options to manually trigger the workflow." lightbox="media/ghas/build-push-acr-workflow.jpg":::
1. Check that the image was deployed to your Azure Container Registry.
1. For the example repo provided: The image should be in a registry called **mdc-mock-0001** with the tag **mdc-ghas-integration**.
1. Deploy the same image as a running container on your cluster.
One way to complete this step is by connecting to the cluster and using the `kubectl run` command. Here's an example for AKS:
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

### Step 2: Create the first risk factor - Business Critical Rule

One of the risk factors that Defender for Cloud detects for this integration is business criticality. Organizations can create rules to label different resources as business critical.

1. In the Microsoft Defender for Cloud portal (Azure portal), go to **Environment Settings**, choose **Resource Criticality**.
1. In the right pane, select the link to open Microsoft Defender.
:::image type="content" source="media/ghas/microsoft-defender-resource-criticality.jpg" alt-text="Screenshot of Microsoft Defender for Cloud interface showing Resource Criticality tile and Open Microsoft Defender portal link in the right pane." lightbox="media/ghas/microsoft-defender-resource-criticality.jpg":::
1. Select **Create a new classification**.
:::image type="content" source="media/ghas/microsoft-defender-create-classification.jpg" alt-text="Screenshot of Microsoft Defender XDR settings page with 'Create a new classification' link highlighted in red." lightbox="media/ghas/microsoft-defender-create-classification.jpg":::
1. Enter a name and description.
1. Choose **Cloud resource** in the query builder.
1. Write a query to set **Resource Name** equal to the name of the container you deployed to your cluster for validation and select **Next**.
:::image type="content" source="media/ghas/query-builder-cloud-resource.jpg" alt-text="Screenshot of Microsoft Defender query builder with Resource Name equals 'mdc-ghas-container' filter applied under Cloud resource." lightbox="media/ghas/query-builder-cloud-resource.jpg":::
1. In the **Preview Assets** page, if Microsoft Defender already detected your resource, the name of the container shows with the asset type being K8s-container or K8s-pod. Even if it's not yet visible in the preview assets page, continue with the next step. Microsoft Defender applies the criticality label to the container once detected. This process can take up to 24 hours.
:::image type="content" source="media/ghas/preview-assets-page.jpg" alt-text="Screenshot of Microsoft Defender Preview Assets page showing a container named 'mdc-ghas-container' with asset type 'K8s-container' and an Export option." lightbox="media/ghas/preview-assets-page.jpg":::
1. Choose a criticality level, then review and submit your classification rule.

### Step 3: Validate that your environment is ready

> [!NOTE]
> It can take up to 24 hours after the previous steps are applied to see the following results.

1. Test that [GitHub agentless scanning](agentless-code-scanning.md) picks up the repo.

1. Go to Cloud Security Explorer and perform the query.
:::image type="content" source="media/ghas/validat:::image type="content" source="media/ghas/query_validating_image_been_scanned_in_acr_vulnerabilities.jpg" alt-text="" lightbox="media/ghas/query_validating_image_been_scanned_in_acr_vulnerabilities.jpg":::e-mdc-container-scan-results.jpg" alt-text="Screenshot of query builder in Cloud Security Explorer with filters set to GitHub repositories and container images, showing search results." lightbox="media/ghas/validate-mdc-container-scan-results.jpg":::

1. Validate that the MDC (in ACR) scanned the container image and used it to create a container. In your query, add the conditions for your specific deployment.
:::image type="content" source="media/ghas/github-repo-container-vulnerabilities.jpg" alt-text="Screenshot of Cloud Security Explorer showing a query with filters for GitHub repositories and container images, displaying scan results." lightbox="media/ghas/github-repo-container-vulnerabilities.jpg":::

1. Validate that the container is running and MDC scanned the AKS cluster.
:::image type="content" source="media/ghas/github-repo-container-scan-aks.jpg" alt-text="Screenshot of Cloud Security Explorer query builder with filters for GitHub repositories and container images, showing results with vulnerabilities and container usage." lightbox="media/ghas/github-repo-container-scan-aks.jpg":::
1. Validate that the risk factors are configured correctly on MDC side. Search for your container name in the MDC inventory page and you should see it marked as critical.

### Step 4: Create a GitHub Campaign

Since the workflow deploys an image that creates a running container with one of the risk factors (business critical), developers can see risk factors in GitHub.

> [!NOTE]
> After you classify your resource as critical, it can take up to 12 hours for GitHub to reflect the change.

1. In GitHub, go to the GitHub organization you used for the setup testing.
1. Select **Security** > **Campaigns** > **Create a campaign from code scanning filters**.
:::image type="content" source="media/ghas/security-campaigns-code-scanning.jpg" alt-text="Screenshot of GitHub interface showing Security > Campaigns tab with options to create a campaign from code or secret scanning filters." lightbox="media/ghas/security-campaigns-code-scanning.jpg":::
1. Create the following campaign. This campaign shows open alerts with medium severity where the image deployed from the repository is tied to a critical resource. Your test repository should be detected with this campaign.
:::image type="content" source="media/ghas/campaigns-creation-filters.jpg" alt-text="Screenshot of GitHub Campaigns interface showing filters for open alerts, severity set to critical and medium, and runtime risk as critical resource." lightbox="media/ghas/campaigns-creation-filters.jpg":::
1. Select **Save** and then **Publish as campaign**.
1. Enter the required information, then publish the campaign.

### Step 5: Evaluate Code to Cloud Recommendations

Use the C2C Recommendation SDLC experience and security alerts enrichment to understand the security issues status and assign the recommendation for resolution to the relevant engineering team with the help of connection between Dependabot security alerts and matching CVEs in the **Runtime recommendation Associated CVE** tab.

#### View the C2C Recommendations

1. In the MDC portal, go to the **Recommendations** tab.
1. Search for the name of the container you created and open one of the recommendations that says, **Update ***.
1. If you used the example repo, look for: **Update brace-expansion recommendation**.
1. Go to the Remediation Insights tab and view the code to the cloud diagram.
1. The diagram maps your running container, to the container image in the code repository, to the code repository of origin in GitHub.
:::image type="content" source="media/ghas/github-issue-creation-panel.jpg" alt-text="Screenshot of Remediation Insights tab showing a development phases diagram with Code, Build, Ship, and Runtime phases linked by dashed lines." lightbox="media/ghas/github-issue-creation-panel.jpg":::

#### Bi-directional enrichment

1. Select the **Associated CVEs** tab. Notice that some CVEs have a link in the column **Related GitHub Alerts**.
:::image type="content" source="media/ghas/associated-cves-tab-view.jpg" alt-text="Screenshot of Associated CVEs tab showing CVE-2025-5889 with CVSS score 3.1, fix version 2.0.2, and a View on GitHub link under Related GitHub Alerts." lightbox="media/ghas/associated-cves-tab-view.jpg":::
1. Select the View on GitHub link to open the relevant GHAS security alert.

#### Engineering mobilization

To close the loop between Security and Engineering teams, you can create a GitHub issue for a containerized application prioritizing for the engineering team the security issues they should focus on. This prioritization can include passing findings that GHAS didn't pick up but MDC detected for CVEs that aren't part of direct dependencies (for example, vulnerabilities in the base image, OS, or third-party software like NGINX).

The GitHub issue is autogenerated with all the CVEs found in the scope of the recommendation, the one with and without Dependabot alerts matches including other runtime context on the repo of origin.

:::image type="content" source="media/ghas/github-issue-security-alert.jpg" alt-text="Screenshot of GitHub issues list showing three entries, including 'Update brace-expansion' and 'Update openssl' marked with security and vulnerability tags." lightbox="media/ghas/github-issue-security-alert.jpg":::

When you assign the issue, the issue status updates in the MDC portal.

:::image type="content" source="media/ghas/github-issue-security-details.jpg" alt-text="Screenshot of a GitHub issue titled 'Update lodash' with security and vulnerability tags, showing details like CVEs, runtime risk factors, and deployment info." lightbox="media/ghas/github-issue-security-details.jpg":::

#### Agentic fixes

On the GitHub side, if you have a GitHub Copilot license, you can resolve the issue with the help of GitHub Coding Agent:

1. Assign GitHub Coding Agent to the issue.
1. Review the generated fix.
1. If it seems reasonable, apply the fix.
1. Observe the issue status update in MDC to **Closed**.

## Related content

- [GitHub Advanced Security integration overview](github-advanced-security-overview.md)
- [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)
- [Connect your GitHub organizations](quickstart-onboard-github.md)
- [Configure agentless code scanning (Preview)](agentless-code-scanning.md)
