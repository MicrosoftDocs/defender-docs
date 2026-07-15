---
title: Create a GitHub connector for agentic code security
description: Connect your GitHub organization to Microsoft Defender to enable remote on-demand agentic code scans across your repositories.
ms.topic: how-to
ms.date: 07/06/2026
ai-usage: ai-assisted
---

# Create a GitHub connector (private preview)

The GitHub connector is the recommended onboarding path for agentic code security. It lets you connect your GitHub organization and onboard its repositories through a simple flow. After onboarding your repositories, you can trigger a remote on-demand agentic scan for any onboarded repository.

## Prerequisites

- Access to the Microsoft Defender portal with at least the **Security Administrator** role in Microsoft Entra ID to create and manage connectors.
- The **Organization Owner** role in the GitHub organization that you want to connect.

> [!NOTE]
> If the same GitHub organization is already connected through the Azure portal's GitHub connector and you want to connect it through the Defender portal, disconnect the Azure portal connector first.
>
> After the Azure portal's GitHub connector is disconnected, the Microsoft Defender for Cloud DevOps Security capabilities associated with that connector are no longer available.
>
> For information about Defender for DevOps Security support and prerequisites, see [Support and prerequisites](/azure/defender-for-cloud/devops-support).

## Step 1: Prepare your tenant

Cloud Security must be prepared in the tenant before you can access the GitHub connector creation flow.

If Cloud Security has already been activated in your Defender tenant, no action is required. The **Prepare my tenant** option won't be displayed, and you can proceed directly to creating the GitHub connector.

If the tenant hasn't used Cloud Security in the Defender portal:

1. Go to **Cloud security** > **Overview**.
1. Select **Prepare my tenant**.
1. Confirm tenant preparation.

## Step 2: Open the connector wizard

1. In the Defender portal, go to MDASH Initiative > **Settings**. For information about accessing the MDASH Initiative, see [Entry points](/security-exposure-management/ai-code-security-onboarding).

   Click the button to Create Connector. You will be redirected to the Cloud Security Connectors page.
   
1. On the **Connectors** tab, select the GitHub connector from the list.
1. Optionally, enter a connector name. If you leave it blank, a default name is assigned automatically.
1. Select **Next**.

## Step 3: Configure access and permissions

The connector exposes two permission tiers:

- **Read** — Selected by default and can't be removed. Allows Defender for DevOps to scan your repositories and identify security issues without making any changes.
- **Write** — Selected by default and optional. Enables GitHub issue creation and pull request creation.

### Read access

Read access includes:

- Source code and repository metadata
- Actions, environments, and deployments
- Commit statuses and merge queues
- Packages, Pages, and repository projects
- Security-related data, including advisories and secrets

### Write access (optional)

Write access enables Defender for DevOps to take actions in your repositories and integrate findings into developer workflows. This access includes the ability to:

- Create and update issues and pull requests
- Post checks and security findings
- Manage Dependabot and secret scanning alerts
- Update repository metadata and properties
- Write security events and artifacts

> [!NOTE]
> Write access is optional and is only required for scenarios where Defender needs to create, update, or post information back to GitHub repositories. Read access is sufficient for security scanning and discovery scenarios.

Review the permission selection and select **Next**.

## Step 4: Authorize and install the GitHub App

1. Select **Install**. The GitHub OAuth dialog opens.
1. Sign in to GitHub and select the organization to onboard.
1. On the GitHub App install screen, confirm the installation. The dialog closes.
1. When you see the success confirmation, select **Next**.

> [!NOTE]
> The GitHub App can't be installed on a GitHub organization that's already connected via the Azure portal's GitHub connector. Selecting such an organization results in an error. To connect the same GitHub organization in the Defender portal, you must first delete the existing connector in the Azure portal.

## Step 5: Review and activate

The **Review and finish** page shows a summary of your flow:

- Name of the connector
- Permission scope
- Name of the GitHub organization being onboarded
- Number of repositories that will be onboarded

Select **Activate** to activate the connector.

After activating the GitHub connector, the ability to trigger an on-demand agentic scan for onboarded repositories becomes available within up to one hour.

## Related content

- [Set up agentic code security](ai-code-security-onboarding.md)
- [Trigger an on-demand agentic scan](trigger-on-demand-scan.md)
- [Agentic code security overview](ai-code-security-overview.md)
