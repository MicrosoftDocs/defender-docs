---
title: Secure OAuth apps with app governance hygiene features | Microsoft Defender for Cloud Apps
ms.date: 07/03/2026
ms.topic: how-to
description: Use app governance hygiene features to identify unused apps, manage unused credentials, and review expiring credentials in Microsoft Defender.
ms.reviewer: anandd512
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---


# Secure OAuth apps with app hygiene features

> [!NOTE]
> Management of unused credentials and expiring credentials is available to app governance customers with a Microsoft Entra Workload ID Premium license. For more information, see [What are workload identities?](/azure/active-directory/workload-identities/workload-identities-overview)

Have you ever wanted to find apps that your organization owns but doesn't use? Or clean up unused or expiring credentials more easily? Microsoft Entra ID includes recommendations to help you identify such apps. The **App governance** page in Microsoft Defender provides an app hygiene feature suite with controls and insights on unused apps, unused credentials, and expiring credentials. 

App hygiene features enable automatic control over flagged apps and provide extra behavior context to help you determine the risk each app poses in your environment.

Watch this video for a brief explanation of the app hygiene features for unused apps, unused credentials, and expiring credentials:

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=d22073a4-555a-413a-8e01-fc0f42d97f6f]

<a name="app-insights"></a>
## Review app insights

App governance allows you to sort and filter on app last used date, credential unused since, and credential expiration date. You can export the filtered app list for easy reporting and triage across your organization.

- Due to data history or app scope constraints, some apps show *Over 30 days ago* in the **Last used** or **Credential unused since** column. These apps haven't signed in the last 30 days, but we don't currently have an exact last sign-in date.

- Apps that don't have a last sign-in date or credential expiration date available have *Not available* in the respective column.

- Apps with *No credentials* in the **Credential unused since** or **Credential expiration** column don’t have any credentials assigned to the app.

<a name="app-hygiene-policies"></a>
## Create app hygiene policies

App governance provides customizable policies for unused apps, apps with unused credentials, and apps with expiring credentials. 

For example, create a policy to automatically disable any app that hasn’t been used in the past 90 days, has high privilege permissions, and can access [priority accounts in Microsoft 365](/microsoft-365/admin/setup/priority-accounts). Like all app governance alerts, these alerts are aggregated into incidents in your Defender alerts queue and flow to Advanced hunting and Microsoft Sentinel.

The following image shows an example of policy conditions for an app hygiene policy:

:::image type="content" source="media/app-governance/edit-policy-conditions.png" alt-text="Screenshot of the Edit policy conditions page.":::

Clean up unused apps and expiring credentials to keep your SaaS app inventory lean. This helps you cut SaaS spend and reduce your app attack surface.


## Next steps

[Hunt for threats in app activities](app-activity-threat-hunting.md)
