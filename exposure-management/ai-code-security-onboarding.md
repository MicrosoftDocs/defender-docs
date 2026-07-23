---
title: Getting Started with Codename MDASH
description: Onboard agentic code security in the Microsoft Defender portal by accepting terms, connecting your Microsoft Foundry resource, and completing agentic code scanning setup.
ms.topic: how-to
ms.date: 05/26/2026
ai-usage: ai-assisted
---

# Getting Started with Codename MDASH

Confirm you have everything in place before you begin, then follow the steps to connect your organization to agentic code security, codename MDASH, and start running scans on your code.

## Prerequisites checklist

To complete this setup, you need:

- **Global Administrator** or **Security Administrator** role in Microsoft Entra ID to complete the agentic code security onboarding process in the Microsoft Defender portal.

- Authority to accept the codename MDASH terms and conditions on behalf of your organization during onboarding.

- An Azure subscription and resource group in which to create a dedicated Microsoft Foundry resource for codename MDASH. For full details, see [Connect Microsoft Foundry](mdash-foundry-integration.md).

- Permission to deploy the following models (all three are required):
  - `gpt-5.4`
  - `gpt-5.3-codex`
  - `gpt-5.4-mini`

- A dedicated Foundry endpoint used exclusively for codename MDASH.

- If the Foundry resource's networking is set to **Selected networks and private endpoints**, action is required to allow Codename MDASH access. For more information, see [Allow Codename MDASH to access your Microsoft Foundry resource](mdash-foundry-integration.md#allow-codename-mdash-to-access-your-microsoft-foundry-resource).

- At least one of the following AI scanning paths. You can add the other later:

  **Option 1 — Remote scan (GitHub connector, recommended).** For full details, see [Create a GitHub connector](create-github-connector.md). You need:
  - Access to the Microsoft Defender portal with permission to create and manage connectors.
    - To create and manage connectors, you need the **Global Administrator** or **Security Administrator** role in Microsoft Entra ID.
  - **Owner** of the GitHub organization you want to connect.
  - Cloud Security prepared in the tenant (**Cloud security** > **Overview** > **Prepare my tenant**).
- If the target GitHub organization is already connected through the Azure portal's GitHub connector, see the note in [Create a GitHub connector](create-github-connector.md).  

  **Option 2 — Defender CLI.** For full details, see [Defender CLI setup](defender-cli-authentication.md). You need:
  - Azure CLI installed.
  - The Microsoft Defender Code enterprise application installed in your tenant (automatic on E5 tenants; otherwise run the provided consent script).
  - The Defender CLI binary for your platform (Windows, macOS, or Linux). For more information, see [Install Defender CLI](defender-cli.md).
  - To handle onboarding for app-based (client secret) authentication: **Application Administrator** in Microsoft Entra ID and a **Global Administrator** available to grant admin consent.
  - To handle onboarding for interactive authentication: **Security Administrator** in Microsoft Entra ID.
  - Users who perform local interactive scans require the **Run scan (Manage)** permission.
  - The **Upload results (Manage)** permission is required only for scenarios that involve uploading scan results.

- If outbound traffic is restricted, allow the required domains. For more information, see [Allow list](ai-code-security-overview.md#allow-list).

- Access to the [Microsoft Defender portal](https://security.microsoft.com) with permission to open **Exposure Management** and **Initiatives**.

- The Foundry project endpoint and API key from the Foundry setup step.

- Defender unified RBAC permissions assigned. Grant each user only the permissions they need:
  - **Run scan (Manage)** — required to trigger on-demand or CLI scans.
  - **Upload results (Manage)** — required to upload CLI scan results to Defender.
  - **Scan results (Read)** — required to view findings in the Defender portal and the initiative.
  - **Scan results (Manage)** — required to triage, dismiss, or otherwise manage findings.

  For more information, see [Assign permissions to users using Defender RBAC](#assign-permissions-to-users-using-defender-rbac).

## Assign permissions to users using Defender RBAC

Use Microsoft Defender unified role-based access control (RBAC) to grant users the agentic code security permissions they need.

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).
1. In the navigation pane, select **System** > **Permissions**.
1. Under **Microsoft Defender XDR**, select **Roles** > **Create custom role**.
1. On the **Basics** tab, enter a role name and description.
1. On **Choose permissions**, expand **Agentic code security**.
1. Under **AI Scan Security**, set the permission levels you need:
   - To allow users to run AI scans, select **Run scan (Manage)**.
   - To allow users to upload AI scan results to Defender, select **Upload results (Manage)**.
   - To allow users to read scan results, select **Scan results (Read)**.
   - To allow users to manage scan results, select **Scan results (Manage)**.

   For more information, see [Security posture – AI code scan](/defender-xdr/custom-permissions-details#security-posture--ai-code-scan).

1. Review the permissions, and select **Apply**.
1. Select **Next** to go to **Assign users and data sources**. Assign the users who should receive this role.
1. Select **Add assignment**, and configure users, groups, and data sources.
1. Select **Add**, review the assignments, and select **Next**.
1. Review the role details, and select **Submit**.

For more information, see [Create custom roles with Microsoft Defender unified RBAC](/defender-xdr/create-custom-rbac-roles).

## Entry points

Start the onboarding flow from either of these locations in the Microsoft Defender portal:

- **Exposure Management** > **Overview**: Select **Agentic code security**.
- **Exposure Management** > **Initiatives**: Select the **Codename MDASH - Agentic code scanner** initiative.

## Step 1: Accept terms and conditions

Review and accept the terms and conditions before you proceed.

1. Review the terms and conditions in the onboarding flow.
1. Select the checkbox to confirm acceptance.

> [!NOTE]
> You must accept the terms and conditions before you can select **Save**.

## Step 2: Connect a Microsoft Foundry resource

For step-by-step instructions on creating an Microsoft Foundry resource and deploying the required models, see [Connect Microsoft Foundry](mdash-foundry-integration.md).

## Step 3: Defender portal onboarding

Provide the required details to connect your Microsoft Foundry resource and validate the connection.

1. Enter the **Project endpoint** (for example: `https://your-foundry.azure.com`) and **API key**.
1. Select **Validate** to verify the connection.
1. Select **Save** to finish onboarding.

> [!NOTE]
> You must successfully validate the resource before you can select **Save**.

> [!NOTE]
> You can create the GitHub connector either before or after Codename MDASH onboarding. For more information, see [Create a GitHub connector](create-github-connector.md).

## Step 4: Set up AI scanning

### Remote scan (recommended)

Create a GitHub connector to connect your GitHub organization and trigger on-demand scans through the Defender portal without installing anything locally.

To create a GitHub connector, you need access to the Microsoft Defender portal with permission to manage connectors, and you must have either the **Global Administrator** or **Security Administrator** role in Microsoft Entra ID. You must also have the **Organization Owner** role in the GitHub organization that you want to connect.

1. [Create a GitHub connector](create-github-connector.md) to connect your GitHub organization.
1. [Trigger an on-demand agentic scan](trigger-on-demand-scan.md) for any onboarded repository.

### Defender CLI

To onboard agentic code security with Defender CLI, you need the **Global Administrator** or **Security Administrator** role in Microsoft Entra ID.

For step-by-step instructions, see [Defender CLI setup](defender-cli-authentication.md) and [Install and run Defender CLI](defender-cli.md).

> [!NOTE]
> You can select **Save** before finishing this step and complete it later. However, scans can't run successfully until you complete this step.

## Step 5: Review recommendations

After scans run, view findings in the Microsoft Defender portal.

For details, see [Codename MDASH - Agentic code scanner initiative](mdash-initiative.md).


## Related content

- [Agentic code security overview](ai-code-security-overview.md)
- [Connect Microsoft Foundry](mdash-foundry-integration.md)
- [Create a GitHub connector](create-github-connector.md)
- [Trigger an on-demand agentic scan](trigger-on-demand-scan.md)
- [Defender CLI setup](defender-cli-authentication.md)
- [Install and run Defender CLI](defender-cli.md)
- [Codename MDASH - Agentic code scanner initiative](mdash-initiative.md)
