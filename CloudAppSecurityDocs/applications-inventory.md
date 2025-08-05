---
title: Application inventory
ms.date: 03/20/2025
ms.topic: overview
description: The new Applications page located under Assets in Microsoft Defender XDR portal provides a centralized location for users to view and manage SaaS and SaaS connected OAuth apps information across their environment, ensuring optimal visibility and a comprehensive experience
#customer intent: As a security administrator, I want to discover, monitor, and manage all SaaS and OAuth connected apps in my organization so that I can ensure security and compliance.
---
# Applications inventory 

Protecting your SaaS ecosystem requires taking inventory of all SaaS and connected OAuth apps that are in your environment. With the increasing number of applications, having a comprehensive inventory is crucial to ensure security and compliance. The Applications page provides a centralized view of all SaaS and connected OAuth apps in your organization, enabling efficient monitoring and management.
At a glance you can see information such as app name, risk score, privilege level, publisher information, and other details for easy identification of SaaS and OAuth apps most at risk.

The Applications page includes the following tabs:

* SaaS apps: A consolidated view of all SaaS applications in your network. This tab highlights key details, including app name, status (unprotected/protected app) and whether the app is marked as sanctioned or unsanctioned.
* OAuth apps: A comprehensive view of OAuth apps registered on Microsoft Entra ID, Google workspace and Salesforce. This tab highlights OAuth apps metadata, publisher info and app origin, permissions used, data accessed and other insights.

## Navigate to the Applications page

In the Defender portal at <https://security.microsoft.com>, go to **Assets** > **Applications**. Or, go directly to the **Applications** page, by clicking on the banner links on the existing Cloud discovery and App governance pages.

:::image type="content" source="media/banner-on-cloud-discovery-pages.png" alt-text="Screenshot of the Cloud Discovery page with a banner about the new unified application inventory experience." lightbox="media/banner-on-cloud-discovery-pages.png":::

:::image type="content" source="media/banner-message-on-app-governance-pages.png" alt-text="Screenshot of the App Governance page with a banner about the new unified application inventory experience for managing OAuth and SaaS apps" lightbox="media/banner-message-on-app-governance-pages.png":::

There are several options you can choose from to customize the SaaS apps and OAuth apps list view. In the top navigation panel you can:

* Add or remove columns.
* Export the entire list in CSV format.
* Select the number of items to show per page.
* Apply filters

> [!NOTE]
> When exporting the applications list to a CSV file, a maximum of 1000 SaaS or OAuth apps are displayed.

The following image depicts the SaaS apps list:
:::image type="content" source="media/applications-tab-in-the-defender-portal.png" alt-text="Screenshot of the applications tab in the Defender portal" lightbox="media/applications-tab-in-the-defender-portal.png"


## SaaS app details

At the top of Saas app tab, you can find actionable insights that allow you to quickly identify apps that need your attention and focus. The following details are displayed:

* **Untagged high risk apps** – Shows apps that aren't tagged and have a high-risk.
* **Untagged high traffic apps** – Shows apps that aren't tagged and have a high usage traffic (greater than 1 GB of data traffic).
* **Untagged GenAI apps** – Shows apps that aren't tagged and are Gen-AI based.

## Sort and filter the SaaS apps list

You can use the sort and filter functionality to get a more focused view. These controls also help you assess and manage the SaaS applications in your organization.

|Filter  |Description  |
|---------|---------|
|**App tags**     |    Select **Sanctioned**, **Unsanctioned**, or create custom tags to use in a customized filter.  |
|**App**     |    Filter for specific SaaS apps.     |
|**Categories**     |  Filter according to app categories.       |
|**Compliance risk factor**     |   Filter for specific standards, certifications, and compliance your app might comply with. For example: HIPAA, ISO 27001, SOC 2, and PCI-DSS.      |
| **Risk score**     |  Filter by a specific risk score, such as to view only risky apps.       |
|**Security risk factor**     |   Filter based on specific security measures, such as encryption at rest, multifactor authentication, and others.
|

### OAuth Apps

The OAuth apps tab provides visibility into Microsoft 365, Google workspace and Salesforce. Admins can review applications and decide to disable the apps or apply policies to monitor their behavior in their environment.

* **New apps** – Shows apps added in the last 30 days (Available for Microsoft 365)

* **Highly privileged apps** – Shows apps with powerful permissions that allow them to access data or change important settings. (Available for Microsoft 365 and Google)

* **Overprivileged apps** – Shows apps with unused permissions. (Available for Microsoft 365)

* **Apps from external unverified publishers** – Shows apps that originated from an external unverified publisher tenant. (Available for Microsoft 365)

For more information on how to create app policies, see [Create app policies in app governance](app-governance-app-policies-create.md).

The following image depicts the OAuth apps list:

:::image type="content" source="media/oauth-tab-in-the-applications-page.png" alt-text="Screenshot of a list of OAuth apps in the applications page in the Defender portal" lightbox="media/oauth-tab-in-the-applications-page.png":::

## Sort and filter the OAuth apps list

You can apply the following filters to get a more focused view:

|Column name  |Description  |
|---------|---------|
| **App name** | The display name of the app as registered on Microsoft Entra ID. |
| **App status** | Shows whether the app is enabled or disabled, and if disabled by whom. |
| **Graph API access**| Shows whether the app has at least one Graph API permission. |
| **Permission type**| Shows whether the app has application (app only), delegated, or mixed permissions. |
| **App origin**| Shows whether the app originated within the tenant or was registered in an external tenant. |
| **Consent type**| Shows whether the app consent has been given at the user or the admin level, and the number of users whose data is accessible to the app. |
| **Publisher**| Publisher of the app and their verification status. |
| **Last modified**| Date and time when registration information was last updated on Microsoft Entra ID |
| **Added on**| Shows the date and time when the app was registered to Microsoft Entra ID and assigned a service principal. |
| **Permission usage**| Shows whether the app has any unused Graph API permissions in the last 90 days. |
| **Data usage**| Total data downloaded or uploaded by the app in the last 30 days. |
| **Privilege level**  | The app's privilege level. |
| **Certification**| Indicates if an app meets stringent security and compliance standards set by Microsoft 365 or if its publisher has publicly attested to its safety.  |
| **Sensitivity label accessed**| Sensitivity labels on content accessed by the app  |
| **Service accessed**| Microsoft 365 services accessed by the app  |


> [!TIP]
> To see all columns, you might need to do one or more of the following steps:
> * Horizontally scroll in your web browser.
> * Narrow the width of appropriate columns.
> * Zoom out in your web browser.

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]
