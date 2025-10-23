---
title: Secure apps accessing other APIs using app governance
ms.date: 10/23/2025
ms.topic: how-to
description: Learn how to secure apps accessing other APIs using app governance in the Microsoft Defender portal.
---

# Secure apps accessing other APIs using app governance

Many apps use APIs other than Microsoft Graph to access Microsoft 365 and other resources. With visibility over such apps, you can identify and defend against risks inherent to these apps including APIs that they access, some of which might receive limited support and updates.

App governance provides visibility over OAuth apps registered on Microsoft Entra ID, regardless of whether they access Graph API or other APIs. Additionally, you can monitor these apps and automatically take action if they're noncompliant or exhibit suspicious behavior.


You can better protect your organization with the new functionalities and enhancements in the following ways:

- Get improved coverage of OAuth apps with powerful app governance insights and monitoring capabilities.
- Automatically get alerted for threats or anomalies from apps using other APIs.
- Get an enhanced experience for investigation of apps with more filters, columns, and properties.

## Identify apps that use other APIs

App governance lists all Microsoft Entra ID OAuth apps on the [Apps governance](https://security.microsoft.com/cloudapps/app-governance?viewid=allApps) page. 

To view Microsoft 365 apps that access APIs other than Microsoft Graph, Exchange Online, SharePoint Online, or Windows Azure Active Directory, select the **Microsoft 365** tab, open the **API access** filter, choose **Other APIs**, and then select **Apply**.

The Other APIs filter shows apps that have at least one API permission outside those four standard Microsoft APIs.

For example:

:::image type="content" source="media/app-governance-secure-apps-access-non-graph-api/other-apis-app-governance.png" alt-text="Screenshot that shows the list of APIs plus the option to view other APIs." lightbox="media/app-governance-secure-apps-access-non-graph-api/other-apis-app-governance.png":::


## View Other APIs used by Microsoft 365 apps

To view the APIs used by an app, go to the **Permissions** tab on an app details pane. You can find the names of the consented permissions and the APIs accessed by the app.

For example:

Insert : Screenshot of the Permissions tab on an app details pane. 

## Track API access

With visibility over apps that access other APIs, you can use the policy template to find and monitor such apps.

For example:

:::image type="content" source="media/app-governance-secure-apps-access-non-graph-api/choose-policy-template.png" alt-text="Screenshot of the policy template page.":::


## Next steps

[Secure apps with app hygiene features](app-governance-secure-apps-app-hygiene-features.md)
