---
title: View your app details with app governance | Microsoft Defender for Cloud Apps
ms.date: 05/28/2023
ms.topic: how-to
description: Learn how to view app details with app governance in Microsoft Defender XDR with Microsoft Defender for Cloud Apps.
---

# View your app details with app governance

Use app governance to gain visibility and meaningful insights on your app ecosystem.

For example, view a list of apps in your tenant, together with relevant app metadata and usage data. Select a specific app to rill down for more data and insights.

## View the apps in your tenant

For a summary of apps in your tenant, in Microsoft 365, go to **Cloud app > App governance** and select any of the apps tabs.

For example:

:::image type="content" source="media/app-governance-visibility-insights-view-apps/app-governance-app-list-view-new.png" alt-text="Screenshot of the Azure AD apps tab on the App governance page.":::

>[!NOTE]
> Your sign-in account must have one of [these roles](app-governance-get-started.md#roles) to view any app governance data.
>

On the **Microsoft 365** tab, the apps in your tenant are listed with the following details:

|Column name  |Description  |
|---------|---------|
| **App name** | The display name of the app as registered on Microsoft Entra ID |
| **App status** | Shows whether the app is enabled or disabled, and if disabled by whom |
| **Graph API access**| Shows whether the app has at least one Graph API permission |
| **Permission type**| Shows whether the app has application (app only), delegated, or mixed permissions |
| **App origin** (Preview)| Shows whether the app originated within the tenant or was registered in an external tenant |
| **Consent type**| Shows whether the app consent has been given at the user or the admin level, and the number of users whose data is accessible to the app |
| **Publisher**| Publisher of the app and their verification status |
| **Last modified**| Date and time when registration information was last updated on Microsoft Entra ID |
| **Added on**| Shows the date and time when the app was registered to Microsoft Entra ID and assigned a service principal |
| **Permission usage**| Shows whether the app has any unused Graph API permissions in the last 90 days |
| **Data usage**| Total data downloaded or uploaded by the app in the last 30 days |
| **Privilege level**  | The app's privilege level |
| **Certification**| Indicates if an app meets stringent security and compliance standards set by Microsoft 365 or if its publisher has publicly attested to its safety  |
| **App ID**  | The app ID |
| **Sensitivity label accessed**| Sensitivity labels on content accessed by the app  |
| **Service accessed**| Microsoft 365 services accessed by the app  |
| **Community use**| Shows you how popular the app is across all your users (*common*, *uncommon*, *rare*)  |
| **Consent grants**| Shows you all app consent grants in the last 30 days  |
| **App activities**| Shows you all app activities in the last 30 days  |

By default, the app governance page sorts the grid alphabetically, by **App name**. To sort the list by another attribute, select the column name.

You can also select **Search** to search for an app by name.

## Getting detailed information on an app

Select a specific app in the grid to view more details on an apps details pane on the right. For example:

:::image type="content" source="media/app-governance-visibility-insights-view-apps/app-governance-app-list-view.png" alt-text="Screenshot of an app details pane on the Azure AD tab.":::

The **Summary** tab also shows more data about the app, such as the date first consented and the App ID. To see the properties of the app as registered in Microsoft Entra ID, select **View in Microsoft Entra ID**.

In the details pane, select any of the following tabs to view more details:

- Select the **Data usage** tab to view a graph of data usage over time, for Exchange, SharePoint, OneDrive, and Teams resources via Microsoft Graph and EWS APIs. For example:

    :::image type="content" source="media/app-governance-visibility-insights-view-apps/data-usage.png" alt-text="Screenshot of the Data usage tab.":::

    The **Data usage** tab supports filtering usage insights by priority accounts only. 

- Select the **Users** tab to see a list of users who are using the app, whether they're a priority account, and the amount of data downloaded and uploaded. For example:

    :::image type="content" source="media/app-governance-visibility-insights-view-apps/users.png" alt-text="Screenshot of the Users tab.":::

    If an app is *admin consented*, the **Total consented users** are all users in the tenant.

- Select the **Permissions** tab to see a summary and list of the Graph API and legacy permissions granted to the app, consent type, privilege level and whether they are in use. For example:

    :::image type="content" source="media/app-governance-visibility-insights-view-apps/permissions.png" alt-text="Screenshot of the Permissions tab.":::

    For more information, see the [Microsoft Graph permissions reference](/graph/permissions-reference).

- Select the **Sensitivity labels** tab to see how frequently items with certain sensitivity labels were accessed by the app on Microsoft 365. For example:

    :::image type="content" source="media/app-governance-visibility-insights-view-apps/sensitive-labels-details.png" alt-text="Screenshot of the Sensitivity labels tab.":::

For an enabled app, there's also a **Disable app** control to disable the use of the selected app and an **Enable app** control to enable the use of the disabled app. These actions require a *Company Administrator* administrator role.


## Managing Google Workspace and Salesforce OAuth apps

If you have enabled the [Google Workspace](connect-google-workspace.md) or [Salesforce](connect-salesforce.md) connector, you can also use the **App governance** page to view information about app permissions in apps connected to Google Workspace and/or Salesforce. View the permissions granted to each app and revoke or ban apps as needed.

On the **App governance** page, select the **Google apps** or **Salesforce apps** tabs to view your apps. For example:

:::image type="content" source="media/app-governance-visibility-insights-view-apps/google-apps.png" alt-text="Screenshot of the Google apps tab":::

Do any of the following to manage your Google Workspace or Salesforce apps on the **App governance** page:

|Option  |Description |
|---------|---------|
|**Queries**     |     Use the filtering options at the top of the page to define or load a saved query. <br><br>By default, the **App governance** page has a set of saved, basic queries, with one applied as a default filter. Do any of the following actions to change the filter applied as needed: <br><br>- Select **Save as** to save your updated filter.  <br><br>- Select **Select a query** to select a different saved query, such as **Apps authorized by admins** or **Apps authorized by external users** <br><br>- Select the **Advanced filters** toggle on the right to add more filtering options. Select a filter, an operator, and the value you want to filter by.   |
|**Bulk selection**     |  Select to either select all listed apps, or clear the selection on all selected apps.       |
|**New policy from search**     |  Select to create a new OAuth app policy based on the current query results,  For more information, see [Create app policies in app governance](app-governance-app-policies-create.md).       |
|**Export**     |  Select to export the currently listed apps to a CSV file.|

### View Google Workforce and Salesforce OAuth app details

The **Google** and **Salesforce** pages provide the following information about each OAuth app that was granted permissions:

|Column name  |Description  |
|---------|---------|
|**Name**     | The app's name. Select to show or hide more details about the app.       |
|**Authorized by**     | The number of users who authorized this app to access their app's account, and granted the app permissions. <br><br>Select to view more information, including a list of user emails and whether an admin has consented the app previously. <br><br>On the **Users who added...** pane, select **Export** to export the listed users to a CSV file. |
|**Permission level**     |  *High*, *Medium*, or *Low*.   <br><br>The level indicates how much access this app has to app's data. For example, *Low* might indicate that the app only accesses user profile and name. <br><br>Select the level to view more information, including permissions granted to the app, community use, or related activity in the [Governance log](/defender-cloud-apps/governance-actions).     |
|**Last authorized**     | The most recent date on which a user granted permissions to this app.    This information is available for Salesforce only.|
|**Actions**  |   Select an option to mark an app as approved or banned.       |

Select **Show details** at the top right to view more information about all of the apps displayed, including:

|Column name  |Description  |
|---------|---------|
|**Permissions**     |  A list of all permissions currently granted to the app. This information is available for Google Workspace only.     |
|**Community use**     | Common, Uncommon, Rare. Indicates how popular the app is across all your users.      |
|**App ID**     |  The app's ID      |
|**App activities**     |  A link to the app's activity log, which you can use to understand the app's recent usage.      |
| **Last used** | The most recent date on which this app was used by anyone in your organization. This information is available for Salesforce only. |

## Next steps

[Determine your overall app compliance posture](app-governance-visibility-insights-compliance-posture.md)
