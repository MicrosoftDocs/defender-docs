---
title: Secure apps with app governance hygiene features | Microsoft Defender for Cloud Apps
ms.date: 05/28/2023
ms.topic: how-to
description: Learn how to secure apps with app hygiene features
---


# Secure apps with app hygiene features

> [!NOTE]
> Management of unused apps, unused credentials, and expiring credentials will only be available to app governance customers with Microsoft Entra Workload ID Premium. For more information, see [What are workload identities?](/azure/active-directory/workload-identities/workload-identities-overview)

Have you ever wanted to see the apps that your organization owns but isn't using, but didn't know how to? Or clean up unused or expiring credentials more easily? Microsoft Entra ID includes recommendations to help you identify such apps, and the **App governance** page in Microsoft Defender provides an app hygiene feature suite that includes controls and insights on unused apps, unused credentials, and expiring credentials. 

These features enable automatic control over these apps and provide extra app behavior context to help you determine the risk these apps pose in your environment.

Watch this video for a brief explanation of these features:

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RWWYEm]

## App insights

App governance allows you to sort and filter on app last used date, credential unused since, and credential expiration date. You can export this custom list for easy reporting and triage across your organization.

- Due to data history or app scope constraints, some apps show *Over 30 days ago* in the **Last used** or **Credential unused since** column. These apps haven't signed in the last 30 days, but we don't currently have an exact last sign-in date.

- Apps that don't have a last sign-in date or credential expiration date available have *Not available* in the respective column.

- Apps with *No credentials* in the **Credential unused since** or **Credential expiration** column don’t have any credentials assigned to the app.

## App hygiene policies

App governance provides customizable policies for unused apps, apps with unused credentials, and apps with expiring credentials. 

For example, create a policy to automatically disable any app that hasn’t been used in the past 90 days, has high privilege permissions, and can access [priority account information](/microsoft-365/admin/setup/priority-accounts). Like all app governance alerts, these alerts are aggregated into incidents in your Microsoft Defender XDR alerts queue and flow to Advanced hunting and Microsoft Sentinel.

For example:

:::image type="content" source="media/app-governance/edit-policy-conditions.png" alt-text="Screenshot of the Edit policy conditions page.":::

By staying on top of unused apps and expiring or unused app credentials and cleaning up your SaaS app inventory, you aren't only optimizing app usage and SaaS spend, but also, more importantly, keeping your app attack surface in check.


## Next steps

[Hunt for threats in app activities](app-activity-threat-hunting.md)
