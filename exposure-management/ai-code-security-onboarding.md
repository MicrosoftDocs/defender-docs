---
title: Getting Started with Codename MDASH
description: Onboard agentic code security in the Microsoft Defender portal by accepting terms, connecting your Microsoft Foundry resource, and completing agentic code scanning setup.
ms.topic: how-to
ms.date: 08/18/2026
ai-usage: ai-assisted
---

# Getting Started with Codename MDASH

Confirm you have everything in place before you begin, then follow the steps to connect your organization to agentic code security, codename MDASH, and start running scans on your code.

## Prerequisites checklist

To complete this setup, you need:

- **Global Administrator** or **Security Administrator** role in Microsoft Entra ID to complete the agentic code security onboarding process in the Microsoft Defender portal.
- Authority to accept the codename MDASH terms and conditions on behalf of your organization during onboarding.
- An Azure subscription and resource group in which to create a dedicated Microsoft Foundry resource used exclusively for codename MDASH. For full details, see [Connect Microsoft Foundry](mdash-foundry-integration.md).
- Permission to deploy the models required. For list of models, see [Deploy the required models](mdash-foundry-integration.md#deploy-the-required-models).
- If the Foundry resource's networking is set to **Selected networks and private endpoints**, action is required to allow codename MDASH access. For more information, see [Allow Codename MDASH to access your Microsoft Foundry resource](mdash-foundry-integration.md#allow-codename-mdash-to-access-your-microsoft-foundry-resource).
- At least one of the following AI scanning paths:
  - **Option 1 — Remote scan (recommended).** For full details, see either [Create a GitHub connector](create-github-connector.md) or [Create Azure DevOps connector](create-azure-devops-connector.md).
  - **Option 2 — Defender CLI.** For full details, see [Defender CLI setup](defender-cli-authentication.md). 
- If outbound traffic is restricted, allow the required domains. For more information, see [Allow list](ai-code-security-overview.md#allow-list).
- Access to the [Microsoft Defender portal](https://security.microsoft.com) with permission to open **Exposure Management** and **Initiatives**.
- The Foundry project endpoint. MDASH supports two authentication methods for the Foundry connection.

For details about the available authentication methods, see Authentication methods.

- Defender unified RBAC permissions assigned. For the required permissions and how to assign them, see [Assign permissions to users using Defender RBAC](#assign-permissions-to-users-using-defender-rbac).

## Assign permissions to users using Defender RBAC

Use Microsoft Defender unified role-based access control (RBAC) to grant users and groups the agentic code security permissions required to run scans, upload results, and review or manage findings. In this step, you create a custom, feature-scoped role in Microsoft Defender for these specific capabilities, and then assign the role to the users who need access.

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).
1. In the navigation pane, select **System** > **Permissions**.
1. Under **Microsoft Defender XDR**, select **Roles** > **Create custom role**.
1. On the **Basics** tab, enter a role name and description.
1. On **Choose permissions**, expand **Agentic code security**.
1. Under **AI Scan Security**, set the permission levels you need (for more information, see [Security posture – AI code scan](/defender-xdr/custom-permissions-details#security-posture--ai-code-scan):
   - **Run scan (Manage)** — required to trigger on-demand or CLI scans.
   - **Upload results (Manage)** — required to upload CLI scan results to Defender.
   - **Scan results (Manage)** — required to triage, dismiss, or otherwise manage findings.
   - **Scan results (Read)** — required to view findings in the Defender portal and the initiative. This permission does not grant access to the Defender portal. To enable portal access, assign additional permissions, such as [Exposure Management (Read)](/defender-xdr/create-custom-rbac-roles#microsoft-defender-for-cloud). These permissions may also provide access to other data within the assigned scope, beyond codename MDASH data.


1. Review the permissions, and select **Apply**.
1. Select **Next** to go to **Assign users and data sources**. Assign the users who should receive this role.
1. Select **Add assignment**, and configure users, groups, and data sources.
1. Under **Data sources**, keep both **Microsoft Defender for Cloud** and **Microsoft Security Exposure Management** selected.
1. Select **Add**, review the assignments, and select **Next**.
1. Review the role details and select **Submit**.

For more information, see [Create custom roles with Microsoft Defender unified RBAC](/defender-xdr/create-custom-rbac-roles).

## Entry points

Start the onboarding flow from either of these locations in the [Microsoft Defender portal](https://security.microsoft.com):

- **Exposure Management** > **Overview**: Select **Agentic code security**.
- **Exposure Management** > **Initiatives**: Select the **Codename MDASH - Agentic code scanner** initiative.

## Step 1: Accept terms and conditions

Review and accept the terms and conditions before you proceed.

1. Review the terms and conditions in the onboarding flow.
1. Select the checkbox to confirm acceptance.
1. You must accept the terms and conditions before you can select **Save**.

## Step 2: Connect a Microsoft Foundry resource

For step-by-step instructions on creating an Microsoft Foundry resource and deploying the required models, see [Connect Microsoft Foundry](mdash-foundry-integration.md).

## Step 3: Defender portal onboarding

Provide the required details to connect your Microsoft Foundry resource and validate the connection.

1. Enter the **Project endpoint** (for example: `https://your-foundry.azure.com`) and **API key**.
1. Choose an authentication method: **Keyless** (recommended) or API key. For details, see Authentication methods.

1. Select Validate to verify the connection.

1.  Select **Save** to finish onboarding.

Note: You must successfully validate the resource before you can select Save.

## Step 4: Set up AI scanning

### Remote scan (recommended)
> [!NOTE]
> You can create the GitHub or Azure DevOps connector either before or after codename MDASH onboarding.

Create a GitHub or Azure DevOps connector to connect your SCM organization and trigger on-demand scans through the Defender portal without installing anything locally.

To create an SCM connector, you need access to the Microsoft Defender portal with permission to manage connectors, and you must have either the **Global Administrator** or **Security Administrator** role in Microsoft Entra ID. You must also have the **Organization Owner** role in the GitHub organization or **Project Collection Administrator** role in the Azure DevOps organization that you want to connect.

1. [Create a GitHub connector](create-github-connector.md) to connect your GitHub organization or [Create an Azure DevOps connector](create-azure-devops-connector.md) to connect your Azure DevOps organization.
1. [Trigger an on-demand agentic scan](trigger-on-demand-scan.md) for any onboarded repository.

### Defender CLI

To onboard agentic code security with Defender CLI, you need the **Global Administrator** or **Security Administrator** role in Microsoft Entra ID.

1. [Defender CLI setup](defender-cli-authentication.md)
1. [Install and run Defender CLI](defender-cli.md).

## Step 5: Review security findings

After scans run, view security findings in the [Microsoft Defender portal](https://security.microsoft.com).

For details, see [Codename MDASH - Agentic code scanner initiative](mdash-initiative.md).

## Related content

- [Agentic code security overview](ai-code-security-overview.md)
- [Connect Microsoft Foundry](mdash-foundry-integration.md)
- [Create a GitHub connector](create-github-connector.md)
- [Create an Azure DevOps connector](create-azure-devops-connector.md)
- [Trigger an on-demand agentic scan](trigger-on-demand-scan.md)
- [Defender CLI setup](defender-cli-authentication.md)
- [Install and run Defender CLI](defender-cli.md)
- [Codename MDASH - Agentic code scanner initiative](mdash-initiative.md)

