---
title: Hunt for threats in app activities | Microsoft Defender for Cloud Apps
ms.date: 05/28/2023
ms.topic: how-to
description: Learn how app governance in Microsoft Defender for Cloud Apps helps you hunt for resources accessed and activities carried out by apps in your environment.
---

# Hunt for threats in app activities

Apps can be a valuable entry point for attackers, so we recommend monitoring anomalies and suspicious behaviors that use apps. While investigating an app governance alert or reviewing the app behavior in the environment, it becomes important to quickly get visibility into details of activities done by such suspicious apps and take remediation actions to protect assets in your organization.

Using app governance and advanced hunting capabilities, you can get complete visibility into activities done by the apps and the resources it has accessed.

This article describes how you can simplify app-based threat hunting using app governance in Microsoft Defender for Cloud Apps.

## Step 1: Find the app in app governance

The Defender for Cloud Apps **App governance** page lists [all Microsoft Entra ID OAuth apps](https://security.microsoft.com/cloudapps/app-governance?viewid=allApps).

If you're looking to get more details on the data accessed by a specific app, search for that app on the app list in app governance. Alternatively, use the **Data usage** or **Services accessed** filters to view apps that have accessed data on one or more of the supported Microsoft 365 services.

## Step 2: View data accessed by apps

1. Once you’ve identified an app, select the app to open the app details pane.
1. Select the __Data usage__ tab on the app details pane to view information on the size and count of resources accessed by the app in the last 30 days.

For example:

:::image type="content" source="media/app-governance-secure-apps-app-hygiene-features/data-usage.png" alt-text="Screenshot of the app details pane with data usage details.":::

App governance provides data usage-based insights for resources such as emails, files, and chat and channel messages across Exchange Online, OneDrive, SharePoint and Teams.

## Step 3: Hunt for related activities and resources accessed

Once you have a high-level overview of the data used by the app across services and resources, you may want to know the details of the app activities and the resources it accessed while performing these activities.

1. Select the __go-hunt__ icon next to each resource to view details of the resources accessed by the app in the last 30 days. A new tab is opened, redirecting you to the **Advanced hunting** page with a prepopulated KQL query.
1. Once the page loads, select the __Run query__ button to run the KQL query and view the results.

After the query runs, the query results display in tabular form. Each row in the table corresponds to an activity done by the app to access the specific resource type. Each column in the table provides comprehensive context about the app itself, the resource, the user, and the activity.

For example, when you select the **go-hunt** icon beside the **Email** resource, app governance enables you to view the following information for all the emails accessed by the app in the last 30 days in Advanced hunting:

- __Details of the email:__ InternetMessageId, NetworkMessageId, Subject, Sender name and address, Recipient address, AttachmentCount and UrlCount
- __App details__: OAuthApplicationId of the app used to send or access the email
- __User context__: ObjectId, AccountDisplayName,  IPAddress, and UserAgent
- __App activity context__: OperationType, Timestamp of the activity, Workload

For example:

:::image type="content" source="media/app-governance-secure-apps-app-hygiene-features/advanced-hunting-for-emails.png" alt-text="Screenshot of an Advanced Hunting page for emails.":::

Similarly, use the **go-hunt** icon in app governance to get details for other supported resources such as files, chat messages and channel messages. Use the **go-hunt** icon beside any user in the **Users** tab in the app details pane to get details on all the activities done by the app in the context of a specific user.

For example:

:::image type="content" source="media/app-governance-secure-apps-app-hygiene-features/advanced-hunting-for-users.png" alt-text="Screenshot of an Advanced Hunting page for users.":::

## Step 4: Apply advanced hunting capabilities

Use the **Advanced hunting** page to modify or adjust a KQL query to fetch results based on your specific requirements. You might choose to save the query for future users or share a link with others in your organization, or export the results to a CSV file.

For more information, see [Proactively hunt for threats with advanced hunting in Microsoft Defender XDR](/microsoft-365/security/defender/advanced-hunting-overview).

## Known limitations

When using the **Advanced hunting** page to investigate data from app governance, you might notice discrepancies in the data. These discrepancies can be due to one of the below reasons:

- App governance and advanced hunting process data separately. Any problems encountered by either solution during processing can result in a discrepancy.

- App governance data processing can take several hours longer to complete. Because of this delay, it might not cover recent app activity that is available on Advanced Hunting.

- The provided Advanced hunting queries are set to show only 1k results. While you can edit a query to show more results, Advanced Hunting will still apply a maximum limit of 10k results. App governance doesn't have this limit.

## Next steps

[Investigate and remediate risky OAuth apps](investigate-risky-oauth.md)
