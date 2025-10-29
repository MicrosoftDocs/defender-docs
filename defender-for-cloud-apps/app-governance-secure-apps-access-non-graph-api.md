---
title: Secure apps accessing other APIs using app governance
ms.date: 10/23/2025
ms.topic: how-to
description: Learn how to secure apps accessing other APIs using app governance in the Microsoft Defender portal.
ms.reviewer: shragar
---

# Secure apps accessing other APIs using app governance

Many apps use APIs other than Microsoft Graph to access Microsoft 365 and other resources. With visibility over such apps, you can identify and defend against risks inherent to these apps including APIs that they access, some of which might receive limited support and updates.

App governance provides visibility over OAuth apps registered on Microsoft Entra ID, regardless of whether they access Graph API or other APIs. Additionally, you can monitor these apps and automatically take action if they're noncompliant or exhibit suspicious behavior.

You can better protect your organization with the new functionalities and enhancements in the following ways:

- Get improved coverage of OAuth apps with powerful app governance insights and monitoring capabilities.
- Automatically get alerted for threats or anomalies from apps using other APIs.
- Get an enhanced experience for investigation of apps with more filters, columns, and properties.

## View Other APIs used by Microsoft 365 apps

To view Microsoft 365 apps that access APIs other than Microsoft Graph, Office 365 Exchange Online, Office 365 SharePoint Online, or Windows Azure Active Directory:

1. Go to **Settings** > **Cloud apps** > **[Apps governance](https://security.microsoft.com/cloudapps/app-governance?viewid=allApps)** in the [Microsoft Defender portal](https://security.microsoft.com).
1. Select the **Microsoft 365** tab
1. Open the **API access** filter
1. Choose **Other APIs**
1. Select **Apply**.


:::image type="content" source="media/app-governance-secure-apps-access-non-graph-api/other-apis-app-governance.png" alt-text="Screenshot that shows the list of APIs plus the option to view other APIs." lightbox="media/app-governance-secure-apps-access-non-graph-api/other-apis-app-governance.png":::


## Create policies for apps accessing other APIs

You can create app governance policies that specifically target apps accessing APIs other than Microsoft Graph, Office 365 Exchange Online, Office 365 SharePoint Online, or Windows Azure Active Directory. This allows you to monitor and manage these apps effectively, ensuring they comply with your organization's security standards.

1. In the App governance page, select the **Policies** tab.
1. Select **+ Create policy**.
1. Select the category **usage** and then the template **New app with Non-Graph API permissions**.
1. Configure the policy settings as needed:
    - Give the policy a name and description
    - Set the severity level to low, medium or high.
    - Set policy scope and conditions, you can choose to apply the default settings or customize the policy.
    - Choose an action you'd like to take on apps that match the conditions in this policy. For example, disabling the app.
    - Set the policy actions to active or disabled.

:::image type="content" source="media/app-governance-secure-apps-access-non-graph-api/new-policy-non-graph-api.png" alt-text="Screenshot that shows the new policy creation page for non-Graph API apps." lightbox="media/app-governance-secure-apps-access-non-graph-api/new-policy-non-graph-api.png":::


## View APIs used by an app

To view the APIs that an app uses:

1. In the App governance page, select the app you want to investigate.

1. In the app details pane, select the **Permissions** tab.

The Permissions tab lists all permissions granted to the app, including those that access other APIs. You can see each permission’s privilege level, whether it’s in use, and the permission type. This information helps you assess whether the app has appropriate access and determine if you need to take further action, such as reviewing policies or disabling the app.

:::image type="content" source="media/app-governance-secure-apps-access-non-graph-api/other-apis-permissions.png" alt-text="Screenshot that shows the list of APIs and their assigned permissions." lightbox="media/app-governance-secure-apps-access-non-graph-api/other-apis-permissions.png":::

## Next steps

[Secure apps with app hygiene features](app-governance-secure-apps-app-hygiene-features.md)
[View your app details with app governance](app-governance-visibility-insights-view-apps.md#getting-detailed-information-on-an-app)
