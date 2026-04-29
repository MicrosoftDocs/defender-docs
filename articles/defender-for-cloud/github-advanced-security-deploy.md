---
title: Deploy GitHub Advanced Security Integration with Microsoft Defender for Cloud
description: Use this step-by-step guide to set up GitHub Advanced Security integration with Microsoft Defender for Cloud for code-to-runtime security.
ms.date: 04/29/2026
ms.topic: how-to
ms.author: dlanger
author: dlanger
#customer intent: As a security administrator, I want to deploy and configure GitHub Advanced Security integration with Microsoft Defender for Cloud to protect applications from code to production.
---

# Set up GitHub Advanced Security native integration with Microsoft Defender for Cloud

This guide provides setup steps and other actions to help you integrate GitHub Advanced Security (GHAS) and Microsoft Defender for Cloud with a use case that  helps you validate the integration end to end. This integration helps maximize Microsoft's cloud-native application security by correlating runtime risks and context with the originated code for faster AI-powered remediation.

By following this guide, you:

- Set up your GitHub repository for Defender for Cloud coverage.
- Create a runtime risk factor.
- Test real use cases in Defender for Cloud.
- Link code to runtime resources.
- Start a security campaign on GitHub. This campaign uses runtime context to prioritize GHAS security alerts.
- Create GitHub issues from Defender for Cloud to start remediation.
- Close the loop between engineering and security teams.

## Prerequisites

| Aspect | Details |
| ------ | ------- |
| Environmental requirements | - GitHub account with a connector created in Defender for Cloud<br>- GitHub Advanced Security (GHAS) license on connected repositories<br>- Defender Cloud Security Posture Management (DCSPM) plan enabled on the subscription<br>- Microsoft Security Copilot (optional for AI-powered automated remediation) |
| Roles and permissions | - Security Admin permissions<br>- Security Admin on the Azure subscription (to view findings in Defender for Cloud)<br>- GitHub organization owner (for connecting repositories and configuring security campaigns) |
| Cloud environments | - Available in commercial clouds only (not in Azure Government, Azure operated by 21Vianet, or other sovereign clouds) |

## Prepare your environment

### Step 1: Set up the GitHub repository and run the workflow

To test the integration, use your own repositories or an [example sandbox project](github-advanced-security-deploy-sandbox.md) that has a test GitHub repository with all the contents to build a vulnerable container image.

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Go to **Microsoft Defender for Cloud** > **DevOps security**.
1. Enter your code repo name in the search bar (Example: **zava-webshop**). 
1. Validate that it really belongs to org you're monitoring (Example: **zava-corporation** org)
1. Review if there are any findings for the repo
1. Ensure **Advanced security status** is **On**, indicating you have GitHub Advanced Security enabled on the monitored repo– > your onboarded repo.
1. If your repo not found, refer to Microsoft Defender for Cloud documentation for trouble shooting and [GitHub connector onboarding](quickstart-onboard-github.md).
1. Make sure that agentless scanning is turned on for your GitHub connector.
    :::image type="content" source="media/github-advanced-security-deploy/defender-cspm-agentless-code-scanning.png" alt-text="Screenshot of Plan Configuration in Defender CSPM with Agentless code scanning toggled on and all scanner options enabled." lightbox="media/github-advanced-security-deploy/defender-cspm-agentless-code-scanning.png":::

### Step 2: Validate that your environment is ready

Validation confirms that your environment is correctly configured to surface code to runtime recommendations and generate actionable results. During this step, Defender verifies that:

#### Full code to runtime visibility

- Microsoft Defender for Cloud continuously monitors source code repositories for security vulnerabilities.
- Build artifacts, such as container images, are scanned in container registries before deployment.
- Runtime workloads deployed to Kubernetes clusters are monitored for security risks.
- Defender for Cloud correlates and traces each artifact from code, through build and deployment, to runtime and back.

> [!NOTE]
> It can take up to 24 hours after the previous steps are applied to see the following results.

Test that [GitHub agentless scanning](agentless-code-scanning.md) picks up the repository.

Go to **Microsoft Defender for Cloud** > **Cloud Security Explorer** and perform the query. The validation queries test whether Defender can identify artifacts produced by your pipelines and workloads. If the queries return results, it indicates that scanning and correlation are working as expected.

:::image type="content" source="media/github-advanced-security-deploy/validate-mdc-container-scan-results.jpg" alt-text="Screenshot of Defender for Cloud’s Cloud Security Explorer showing a query for GitHub repository pushes to container images." lightbox="media/github-advanced-security-deploy/validate-mdc-container-scan-results.jpg":::

> [!NOTE]
>
> If no results are returned, it may indicate that artifacts aren't yet generated, scanning isn't configured, or permissions are missing. See [User roles and permissions](permissions.md) for more information.

1. Validate that Defender for Cloud (in Azure Container Registry) scanned the container image and used it to create a container.
1. In your query, add the conditions for your specific deployment.

    :::image type="content" source="media/github-advanced-security-deploy/github-repo-container-vulnerabilities.jpg" alt-text="Screenshot of Defender for Cloud’s Cloud Security Explorer showing a query for GitHub repository pushes to container images with vulnerabilities." lightbox="media/github-advanced-security-deploy/github-repo-container-vulnerabilities.jpg":::

1. Validate that the container is running and that Defender for Cloud scanned the AKS cluster.
    
    :::image type="content" source="media/github-advanced-security-deploy/github-repo-container-scan-aks.jpg" alt-text="Screenshot of Defender for Cloud’s Cloud Security Explorer showing a query for GitHub pushes to container images with vulnerabilities." lightbox="media/github-advanced-security-deploy/github-repo-container-scan-aks.jpg":::

1. Validate that the risk factors are configured correctly on the Defender for Cloud side. Search for your container name on the Defender for Cloud inventory page, and you should see it marked as critical.

> [!NOTE]
>
> This step is required only if risk factors aren't already configured in your environment. If you already use risk factors, you can verify their configuration under Settings > Resource criticality.

Successful validation ensures that subsequent steps, such as recommendations, campaigns, and GitHub issue generation, produce meaningful results.

> [!NOTE]
>
> After you classify your resource as critical, it can take up to 12 hours for Defender for Cloud to send the data to GitHub.  [**Learn more**](https://docs.github.com/en/code-security/securing-your-organization/understanding-your-organizations-exposure-to-vulnerabilities/alerts-in-production-code).

### Step 3: Create a GitHub campaign

To create a scanning campaign, you must work at the GitHub organization level. This experience isn't available at the individual repository level.

1. In GitHub, go to the GitHub organization that you used for the setup testing.
1. Select **Security** > **Campaigns** > **Create campaign** > **From code scanning filters**.
1. This campaign help prioritize GHAS findings that belong to code that is truly deployed and running.
1. Select **Runtime Risks** filters for the campaign.

    :::image type="content" source="media/github-advanced-security-deploy/select-filters.png" alt-text="Screenshot of GitHub code scanning campaign creation with a filter bar, Filter button, and a tooltip about filtering by artifact metadata.":::

    :::image type="content" source="media/github-advanced-security-deploy/advanced-filters.png" alt-text="Screenshot of advanced filters dialog in GitHub campaign creation with Runtime Risk filter and selectable risk factors menu open." lightbox="media/github-advanced-security-deploy/advanced-filters.png":::
1. Select **Save** > **Publish as campaign**. Enter the required information and then publish the campaign.
1. Track campaign advancement.
    :::image type="content" source="media/github-advanced-security-deploy/test-campaign.png" alt-text="Screenshot of GitHub campaign page showing overdue status, campaign progress bar, critical alerts list, and filter options.":::

### Step 4: Recommendations mobilization

Use running Containers VA recommendations code-to-runtime functionality and correlation of the identified CVEs to **Dependabot** security alerts to understand the status of security issues. You can then assign the recommendation for resolution to the relevant engineering team based on code-to-runtime mapping.

1. In the Defender for Cloud portal, go to the **Recommendations** tab.
1. Search for the name of the container that you created from your code repo.
1. Open one of the **Update software** recommendations; the recommendation name begins with Update
1. Select the **Findings** tab
   Security alerts appear as part of the recommendation evaluation flow. 
   These alerts provide indications about GitHub Advanced security findings that already known to  the engineering.
   Note that some CVE IDs have a View on GitHub link in the Related GitHub Alerts column. 

    :::image type="content" source="media/github-advanced-security-deploy/cve-findings.png" alt-text="Screenshot of Defender for Cloud Findings tab showing CVE-2024-21409 alerts, fix status, CVSS scores, and GitHub alert details popup." lightbox="media/github-advanced-security-deploy/cve-findings.png":::

#### Security alerts

Security alerts appear as part of the recommendation evaluation flow. These alerts provide additional context about active risks and help prioritize remediation, but they don't automatically create GitHub issues.

1. Select the **Associated CVEs** tab. Notice that some CVE IDs have a **View on GitHub** link in the **Related GitHub Alerts** column.

1. Select the link to open the relevant GHAS security alert. (To view the GHAS alert content in GitHub you must have access permissions to the relevant GitHub repository. Contact your GitHub administrator if you don't.)

:::image type="content" source="media/github-advanced-security/associated-cves-tab-view.jpg" alt-text="Screenshot of the Associated CVEs tab that shows a link to a related GitHub alert." lightbox="media/github-advanced-security/associated-cves-tab-view.jpg":::

Select the link to open the relevant GHAS security alert. (To view the GHAS alert content in GitHub, you must have access permissions to the relevant GitHub repository. If you don’t have access permissions, you can always copy the link for subsequent usage or contact your GitHub administrator.)
If we have an alert enrichment – meaning there's a matched Dependabot alert and it's known to the engineering, if the status is Active, meaning no one fixed it yet and we need to prioritize the fix.
If there's no finding enrichment, meaning we found in Runtime risk that's unknown to the engineering, and it need to be prioritized for a fix.
What’s next? How would I know who is the relevant team for the fix?  How would I know which context can help engineering with the fix?

#### Create a GitHub issue

To close the loop between security and engineering teams, you can create a GitHub issue that prioritizes the security issues that the engineering team should focus on. This prioritization can include passing findings that GHAS didn't pick up but that Defender for Cloud detected for CVE IDs that aren't part of direct dependencies. These findings can include vulnerabilities in the base image, operating system, or software like NGINX.

The GitHub issue is automatically generated on the code repo of origin, with all the CVE IDs found in the scope of the recommendation, including other runtime and container SDLC related contexts that can help facilitate the fix and testing.

From the recommendation view, you can explicitly generate a GitHub issue to track remediation work.

1.	Go to the **Remediation Insights** tab and view the code-to-runtime diagram. The diagram maps your running container to the container image in the code repository and to the code repository of origin in GitHub.

    :::image type="content" source="media/github-advanced-security-deploy/code-runtime-diagram.png" alt-text="Screenshot of Remediation Insights showing code-to-runtime diagram with risk levels, impacted assets, and Take Action menu open." lightbox="media/github-advanced-security-deploy/code-runtime-diagram.png":::

1. On the **Remediation Insights** tab review, the affected **Runtime** box.
1. **Validate whether a GitHub issue already exists**. If a GitHub issue already exists, a GitHub icon is displayed on the box. Hover over the icon to view issue details.
1. If no issue exists and you have the required permissions, you can generate a new GitHub issue. Select **Take action**.
1. Select the **Generate GitHub issue** option from the popup.
1. If the issue was created successfully, you'll see a popup notification with a link to the issue. The issue is created in the code repository of origin.

    :::image type="content" source="media/github-advanced-security-deploy/link-issue.png" alt-text="Screenshot of GitHub issues list showing open issues for dependencies with labels like Defender for Cloud and security." lightbox="media/github-advanced-security-deploy/link-issue.png":::

> [!NOTE]
> If the Generate GitHub issue option isn't available, required GitHub or repository permissions might be missing. Contact your GitHub or repository administrator to request access.
    :::image type="content" source="media/github-advanced-security-deploy/update-github-admin.png" alt-text="Screenshot of a GitHub issue showing security vulnerabilities for bysybox with labels like Defender for Cloud, dependencies, and security." lightbox="media/github-advanced-security-deploy/update-github-admin.png":::

1. Select **Take action**.
1. Select **Generate GitHub issue** option from the popup.
1. If the issue was created successfully you see a popup notification with a link to the issue.
1. The issue is created in the code repository of origin.
  
   > [!NOTE]
   > If the **Generate GitHub issue** option isn't available, required GitHub or repository permissions might be missing.  
   > Contact your GitHub or repository administrator to request access.

    :::image type="content" source="media/github-advanced-security/github-issue-security-alert.jpg" alt-text="Screenshot of a GitHub issues list that shows three entries marked with security and vulnerability tags." lightbox="media/github-advanced-security/github-issue-security-alert.jpg":::

1. **Track ownership and status updates** - changes to issue status or assignment made in GitHub are reflected in Microsoft Defender for Cloud, allowing you to track ownership and remediation progress from **Recommendations** view.

    :::image type="content" source="media/github-advanced-security-deploy/recommendations-page.jpg" alt-text="Screenshot of Microsoft Defender for Cloud Recommendations page showing high-risk issues with GitHub issue details popup." lightbox="media/github-advanced-security-deploy/recommendations-page.jpg":::

## Make agentic fixes

On the GitHub side, if you have a GitHub Copilot license, you can resolve the issue with the help of the GitHub coding agent:

1. Assign a GitHub coding agent to the issue.
1. Review the generated fix.
1. If the fix seems reasonable, apply it.
1. Observe as Defender for Cloud updates the issue status to **Closed**.

## Related content

- [What is GitHub Advanced Security integration with Microsoft Defender for Cloud?](github-advanced-security-overview.md)
- [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)
- [Quickstart: Connect your GitHub environment to Microsoft Defender for Cloud](quickstart-onboard-github.md)
- [Configure agentless code scanning (preview)](agentless-code-scanning.md)
