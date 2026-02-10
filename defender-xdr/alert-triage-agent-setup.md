---
title: Set up the Alert Triage Agent
description: Learn how to set up and configure the Alert Triage Agent in Microsoft Defender, including identity assignment and permissions configuration.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier1
- security-copilot
- magic-ai-copilot 
ms.topic: how-to
search.appverid:
- MOE150
- MET150
ms.date: 01/25/2026
appliesto:
- Microsoft Defender XDR
#customer intent: As a security administrator, I want to set up the Alert Triage Agent in Microsoft Defender so that it can automatically triage security alerts in my environment.
---

# Set up the Alert Triage Agent

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article walks you through the complete setup process for the Alert Triage Agent, including assigning an identity, configuring permissions, and getting the agent operational in your Microsoft Defender environment.

## Before you begin

Make sure you have the [permissions required](alert-triage-agent-prerequisites.md#permissions-required) and all [prerequisites](alert-triage-agent-prerequisites.md#prerequisites) are met before setting up the agent.

## Launch the setup wizard

Open the Alert Triage Agent setup wizard in one of two ways:

- From the Security Store in the Microsoft Defender portal, as explained in [Deploy AI agents in Microsoft Defender](../defender-xdr/security-copilot-agents-defender.md#discover-and-deploy-agents-in-the-microsoft-defender-portal).
- From the **Incidents** queue in the Microsoft Defender portal, select **Set up agent**.

   :::image type="content" source="media/phishing-triage-agent/phishing-triage-setup-incident.png" alt-text="Screenshot of the incident queue with the Phishing Triage card where Set up agent is highlighted." lightbox="media/phishing-triage-agent/phishing-triage-setup-incident.png":::

Follow the steps in the setup wizard, as described in the sections below.

## Assign the agent's identity and permissions

The setup wizard walks you through assigning the agent an identity and the permissions required to do its work. 

### Assign an identity

The agent requires an identity to operate. The wizard prompts you to select one of two identity types.

:::image type="content" source="media/phishing-triage-agent/setup-assign-identity.png" alt-text="Screenshot of the Select a new identity screen in the Phishing Triage Agent setup wizard." lightbox="media/phishing-triage-agent/setup-assign-identity.png":::   

Select:

- **Create a new agent identity (recommended)** - Automatically create a new Microsoft Entra Agent ID. Microsoft Entra creates Agent IDs specifically for AI agents. Using Agent IDs keeps access scoped, secure, and easier to manage. For more information, see [What are agent identities?](/entra/agent-id/identity-platform/what-is-agent-id). 
   
   OR

- **Connect an existing user account** - Assign an existing user account as the agent identity. The agent inherits the user account's access and permissions. To use this identity option, you need to create the identity yourself and assign it the [permissions the agent requires](alert-triage-agent-prerequisites.md#phishing-triage-agent-required-permissions) before setup. For information on creating a user account, see [Create a new user](/entra/fundamentals/how-to-create-delete-users#create-a-new-user).

   When you connect the agent to an account, we recommend setting a long account expiration date and closely monitoring its authentication status to ensure continuous operation of the agent. If authentication expires, the agent stops functioning until it's renewed.
   
   The agent's specified user identity isn't compatible with PIM or TAP because they don't support long-term background operations.

   > [!TIP]
   > Use a dedicated identity account with the minimum required permissions for the agent. When creating the account, assign a distinct display name like *Phishing Triage Agent* to easily identify it in the Microsoft Defender portal.

   **Set conditional access policies for Security Copilot** to enable the agent to function based on the user account created for it. For more information, see [Troubleshoot Conditional Access policies for Microsoft Security Copilot](/entra/identity/conditional-access/troubleshoot-security-copilot-policies).

> [!NOTE]
> You can change the agent identity after setup as described in [Change the agent's identity and role](alert-triage-agent-management.md#change-the-agents-identity-and-role). 

### Assign permissions

In alignment with [the principle of least privileges](/entra/identity-platform/secure-least-privileged-access), we recommend assigning the agent identity only the [permissions the Phishing Triage Agent requires to perform its tasks](alert-triage-agent-prerequisites.md#phishing-triage-agent-required-permissions).

- If you use an Agent ID, the dropdown only displays roles in your organization that have the permissions the agent needs. Select an existing role in your organization or automatically create a new role with the required permissions if you don't already have a suitable role set up.

   :::image type="content" source="media/phishing-triage-agent/setup-assign-entra-agent-id.PNG" alt-text="Screenshot of the Create a new agent identity screen in the Phishing Triage Agent setup wizard." lightbox="media/phishing-triage-agent/setup-assign-entra-agent-id.PNG":::   

- If you use an existing user account, you need to [assign the required permissions](alert-triage-agent-prerequisites.md#phishing-triage-agent-required-permissions) to that identity before assigning the agent identity during setup - you can't do this from the setup wizard.

   :::image type="content" source="media/phishing-triage-agent/setup-assign-user.PNG" alt-text="Screenshot of the Connect with an existing user accout screen in the Phishing Triage Agent setup wizard" lightbox="media/phishing-triage-agent/setup-assign-user.PNG":::

##### Alert Triage Agent required permissions

The Alert Triage Agent requires specific permissions to access the necessary data and perform its triage functions. The required permissions depend on the alert types and associated products you want the agent to work with.

This table summarizes the required permissions and data scopes for each alert type:

| Alert type | Permissions | Data scopes |
|:---|:---|:---|
| **Phishing** | Security Copilot (read), Security data basics (read), Alerts (manage), Email & collaboration metadata (read), Email & collaboration content (read) | Microsoft Defender for Office 365 |
| **Container (Preview)** | Security Copilot (read), Security data basics (read), Alerts (manage) | Microsoft Defender for Cloud |

These permissions are under the **Security operations** permissions group:

:::image type="content" source="media/phishing-triage-agent/agent-permissions.png" alt-text="Screenshot of required permissions for Alert Triage" lightbox="media/phishing-triage-agent/agent-permissions.png":::

To create a role:

1. Ensure that the relevant Defender workloads are activated to allow the agent to effectively analyze alerts with comprehensive context. Follow the steps in [Activate URBAC settings](activate-defender-rbac.md).
1. [Create a role](../defender-xdr/create-custom-rbac-roles.md#create-a-custom-role) with the required permissions or assign an existing role with these permissions to the agent.

    Make sure to grant the agent access to all the [supported products](#supported-workloads-and-alert-types) you want to associate with the Alert Triage Agent.

        :::image type="content" source="/defender-xdr/media/phishing-triage-agent/agent-permissions-sources.png" alt-text="Screenshot of required data sources for Phishing Triage" lightbox="/defender-xdr/media/phishing-triage-agent/agent-permissions-sources.png":::

1. Assign the role to the agent. 

> [!IMPORTANT]
> After assigning the agent its permissions, ensure the user group monitoring the agent has equal or higher permissions to oversee its activity and output. To do this, compare the permissions of the user group to the agent in the Permissions page in the Microsoft Defender portal.

## Complete setup

After assigning the identity and permissions, the setup wizard will guide you through the final configuration steps. Once complete, the Alert Triage Agent will be active and ready to begin triaging alerts automatically.

The agent will:
- Automatically activate the required Security Copilot plugins
- Begin monitoring for relevant alerts
- Start processing alerts according to its triage model

## Verify setup

After setup is complete, you can verify the agent is working correctly by:

1. Checking the agent status in the **Security Copilot > Agents** section
2. Monitoring the incident queue for agent activity
3. Reviewing agent metrics on the Alert Triage Agent dashboard

## Next steps

- [Learn how to use the agent](alert-triage-agent-usage.md)
- [Monitor and manage the agent](alert-triage-agent-management.md)

## Related content

- [Alert Triage Agent overview](alert-triage-agent-overview.md)
- [Alert Triage Agent permissions and prerequisites](alert-triage-agent-prerequisites.md)
- [Deploy AI agents in Microsoft Defender](security-copilot-agents-defender.md)