---
title: Non-human identities in Microsoft Defender (Preview)
description: Learn about non-human identities in Microsoft Defender, including OAuth apps and service accounts. Review inventory fields, risk scores, and identity graphs.
#customer intent: As a security analyst using Microsoft Defender, I want to understand how to investigate non-human identities so that I can assess risk, understand permissions, and identify potential security issues with OAuth apps and service accounts.
author: AbbyMSFT
ms.author: abbyweisberg
ms.date: 03/17/2026
ms.topic: concept-article
ms.service: microsoft-defender-for-identity
ms.custom: msecd-doc-authoring-106
ai-usage: ai-assisted
---

# Non-human identities in Microsoft Defender (Preview)

Non-human identities are accounts and applications that operate without direct human interaction. In Microsoft Defender, non-human identities include OAuth apps, service accounts, and SaaS apps. These identities often have elevated privileges and access to sensitive resources, which makes them a priority for security monitoring.

You can view and investigate non-human identities from the [Identity inventory](/defender-for-identity/identity-inventory) in the Microsoft Defender portal.

## Types of non-human identities

Microsoft Defender organizes non-human identities into the following categories, each shown as a tab in the identity inventory:

- **Entra ID** — OAuth apps registered in Microsoft Entra ID. These apps authenticate using OAuth and access resources through Microsoft Graph and other APIs.
- **Active Directory** — Service accounts from on-premises Active Directory. These specialized accounts run applications, services, and automated tasks, and often have elevated privileges.
- **Google Workspace** — OAuth apps connected through Google Workspace. These apps are authorized by users and have varying levels of access to Google Workspace resources.
- **Salesforce** — OAuth apps connected through Salesforce. These apps are authorized by users and access Salesforce data and resources.

Each identity type shows different columns and filters in the inventory. The following sections describe the fields available for each type.

## Entra ID inventory

The **Entra ID** tab shows OAuth apps registered in Microsoft Entra ID. Summary cards at the top of the page highlight key categories: **Risky**, **Highly privileged**, **Overprivileged**, **Unused**, **External unverified publishers**, and **New**.

| Column | Description |
|---|---|
| **Display name** | The name of the OAuth app as registered in Entra ID. |
| **Status** | The current status of the app (enabled or disabled). |
| **Risk score** | A 1-100 score indicating the risk level of the app. |
| **Graph API access** | Whether the app has access to Microsoft Graph API. |
| **Permission type** | The type of permissions granted: application-only, delegated, or both. |
| **Origin** | Whether the app originates from within your tenant or externally. |
| **Consent type** | Whether the app was consented to by an admin or a user. |
| **Publisher** | The publisher of the app. |
| **Last used** | The date when the app was last used. |

You can filter by API access, risk score, privilege level, permission, permission usage, origin, and permission type.

## Active Directory inventory

The **Active Directory** tab shows service accounts discovered from on-premises Active Directory environments.

| Column | Description |
|---|---|
| **Display name** | The full name of the service account as shown in Active Directory. |
| **Domain** | The Active Directory domain the account belongs to. |
| **Object ID** | The unique object identifier for the account in Active Directory. |
| **UPN** | The User Principal Name of the service account. |
| **Identity environment** | The environment where the identity exists (on-premises). |
| **Identity provider** | The identity provider (Active Directory). |
| **Criticality level** | The criticality level of the account, ranging from low to very high. |
| **Tags** | Tags assigned to the account, such as Sensitive or Honey Token. |
| **SID** | The Security Identifier, a unique value used to identify the account in Active Directory. |
| **Account status** | Whether the account is enabled or disabled. |
| **Type** | The type of service account (for example, Service). |
| **Created date** | The date when the account was first created. |
| **Defender risk score** | The risk score assigned by Microsoft Defender. |
| **Last updated** | The date of the most recent update to the account. |

You can filter by domain, tags, criticality level, Defender risk score, and account status.

## Google Workspace inventory

The **Google Workspace** tab shows OAuth apps connected through Google Workspace. A summary card at the top of the page shows the count of highly privileged apps.

| Column | Description |
|---|---|
| **Name** | The name of the app. |
| **Authorized by** | The user who authorized the app. |
| **Instance** | The Google Workspace instance the app is connected to. |
| **Permission level** | The level of permissions granted to the app. |
| **Actions** | Available actions you can take on the app. |

You can filter by app, user name, app state, instance, permissions, and permission level.

## Salesforce inventory

The **Salesforce** tab shows OAuth apps connected through Salesforce.

| Column | Description |
|---|---|
| **Name** | The name of the app. |
| **Authorized by** | The user who authorized the app. |
| **Instance** | The Salesforce instance the app is connected to. |
| **Permission level** | The level of permissions granted to the app. |
| **Actions** | Available actions you can take on the app. |

You can filter by app, user name, app state, instance, and community use.

## Non-human identity details

When you select a non-human identity from the inventory, a details pane opens with tabs that provide context about the identity. The following tabs are available across non-human identity types. The following screenshot shows an example of the Entra ID details pane:

:::image type="content" source="media/investigate-non-human-identities/non-human-identities.png" alt-text="Screenshot of the Identity Inventory page showing the Non-Human Identities tab with the Entra ID list and a details pane for an OAuth app.":::

### Summary

The **Summary** tab gives a high-level overview of the selected non-human identity, including its basic profile and key attributes. Use this tab to quickly assess the identity.

:::image type="content" source="media/investigate-non-human-identities/non-human-identities-summary.png" alt-text="Screenshot of the Summary tab showing the app profile, including display name, app ID, consent type, origin, and risk score.":::

### Risk score

The **Risk score** tab shows a 1-100 risk score for the identity, where higher values mean greater risk. The risk score helps you quickly prioritize which non-human identities need attention first. The tab also shows the factors behind the identity's risk score, so you can understand why it's flagged and make informed decisions about next steps.

> [!NOTE]
> The risk score currently applies only to OAuth apps registered in Microsoft Entra ID.

:::image type="content" source="media/investigate-non-human-identities/non-human-identities-risk-score.png" alt-text="Screenshot of the Risk score tab showing a score of 43 with risk factors like inactive app, high privilege, and external origin.":::

### Graph

The **Graph** tab shows a visual identity graph of how the selected non-human identity connects to other entities in your organization, like users, resources, SaaS workloads, and critical assets.

Use the identity graph to:

- Understand what the non-human identity can access and how it's connected.
- Identify risky or unexpected relationships, like high-privilege access paths or sensitive resource exposure.
- Make faster, more confident decisions about review, remediation, or deeper investigation.

Select any node or edge in the graph to open a details panel with deeper context. When applicable, the details panel also shows attack paths involving the selected nodes or edges. To explore further, select **View in map** below the graph to open the full Attack Map experience in a new window.

> [!NOTE]
> The identity graph is currently available only for OAuth apps registered in Microsoft Entra ID.

:::image type="content" source="media/investigate-non-human-identities/non-human-identities-graph.png" alt-text="Screenshot of the Graph tab showing a visual identity graph with connections between an OAuth app, Microsoft Entra, and a user entity.":::

## Additional detail tabs

Depending on the type of non-human identity you select, additional tabs are available in the details pane:

- **Entra ID, Google Workspace, and Salesforce apps** — Additional tabs include Permissions, Data usage, Users, and Sensitivity labels. For details about these tabs, see [View your app details with app governance](/defender-cloud-apps/app-governance-visibility-insights-view-apps#getting-detailed-information-on-an-app).
- **Active Directory service accounts** — Additional details include connections, authentication protocols, and sources and destinations. For details, see [Investigate and protect Service Accounts](/defender-for-identity/service-account-discovery#service-account-details).

## Related content

- [View the identity inventory](/defender-for-identity/identity-inventory)
- [Investigate a human identity](/defender-xdr/investigate-users)
- [Investigate and protect Service Accounts](/defender-for-identity/service-account-discovery)
- [View your app details with app governance](/defender-cloud-apps/app-governance-visibility-insights-view-apps)
