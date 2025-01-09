---
title: View discovered apps on the Cloud discovery dashboard | Microsoft Defender for Cloud Apps
description: This article describes the process for identifying and remediating risky cloud discovery apps in Defender for Cloud Apps.
ms.date: 06/02/2024
ms.topic: how-to
---

# View discovered apps with the Cloud discovery dashboard

The **Cloud discovery** page provides a dashboard designed to give you more insight into how cloud apps are being used in your organization. The dashboard provides an at-a-glance view of the types of apps being used, your open alerts, and the risk levels of apps in your organization. It also shows who your top app users are, and provides an **App headquarter location** map.

Filter your **Cloud discovery** data to generate specific views, depending on what interests you most. For more information, see [Discovered app filters](discovered-app-queries.md#discovered-app-filters).

## Prerequisites

For information about roles required, see [Manage admin access](manage-admins.md).

## Review the cloud discovery dashboard

This procedure describes how to get an initial, general picture of your cloud discovery apps in the **Cloud discovery** dashboard.

1. In the Microsoft Defender portal, select **Cloud apps > Cloud discovery**.

    For example:

    :::image type="content" source="media/cloud-discovery-dashboard.png" alt-text="Screenshot of the Cloud discovery dashboard":::

    Supported apps include Windows and macOS apps, which are both listed under the **Defender - managed endpoints** stream.

1. Review the following information:

    1. Use the **High-level usage overview** to understand overall cloud app use in your organization.

    1. Dive one level deeper to understand the **top categories** that used in your org for each of the different use parameters. Note how much of this usage is by sanctioned apps.

    1. Use the **Discovered apps** tab to go even deeper and see all the apps in a specific category.

    1. Check the **top users and source IP addresses** to identify which users are the most dominant users of cloud apps in your organization.

    1. Use the **App headquarters map** to check how the discovered apps spread according to geographic location, according to their headquarter.

    1. Use the **App risk overview** to understand the risk score of discovered apps, and check the **discovery alerts status** to see how many open alerts should you investigate.

## Deep dive into discovered apps

To dive deeper in to cloud discovery data, use the filters to check for risky or commonly used apps.

For example, if you want to identify commonly used, risky cloud storage and collaboration apps, use the **Discovered apps** page to filter for the apps you want. Then, [unsanction or block](governance-discovery.md) them as follows:

1. In the Microsoft Defender portal, under **Cloud Apps**, select **Cloud discovery**. Then choose the  **Discovered apps** tab.

1. In the **Discovered apps** tab, under **Browse by category** select both **Cloud storage** and **Collaboration**.

1. Use the advanced filters to set **Compliance risk factor** to **SOC 2** = **No**.

1. For **Usage**, set **Users** to greater than 50 users and **Transactions** to greater than 100.

1. Set the **Security risk factor** for **Data at rest encryption** equals **Not supported**. Then set **Risk score** equals 6 or lower.

    ![Screenshot of sample discovered app filters.](media/discovered-app-filters.png)

After the results are filtered, [unsanction and block](governance-discovery.md) them by using the bulk action checkbox to unsanction them all in one action. Once they're unsanctioned, use a blocking script to block them from being used in your environment.

You also might want to identify specific app instances that are in use by investigating the discovered subdomains. For example, differentiate between different SharePoint sites:

:::image type="content" source="media/discovered-apps/subdomains-image.png" alt-text="Subdomain filter.":::

> [!NOTE]
> Deep dives into discovered apps are supported only only in firewalls and proxies that contain target URL data. For more information, see [Supported firewalls and proxies](set-up-cloud-discovery.md#supported-firewalls-and-proxies).
>
> If Defender for Cloud Apps can't match the subdomain detected in the traffic logs with the data stored in the app catalogue, the subdomain is tagged as **Other**.

## Discover resources and custom apps

Cloud discovery also enables you to dive into your IaaS and PaaS resources. Discover activity across your resource-hosting platforms, viewing access to data across your self-hosted apps and resources including storage accounts, infrastructure and custom apps hosted on Azure, Google Cloud Platform, and AWS. Not only can you see overall usage in your IaaS solutions, but you can get visibility into the specific resources that are hosted on each, and the overall usage of the resources, to help mitigate risk per resource.

For example, if a large amount of data is uploaded, discover what resource it's uploaded to, and drill down to see who performed the activity.

> [!NOTE]
> This is supported only in firewalls and proxies that contain target URL data. For more information, see the list of supported appliances in [Supported firewalls and proxies](set-up-cloud-discovery.md#supported-firewalls-and-proxies).

**To view discovered resources**:

1. In the Microsoft Defender portal, under **Cloud Apps**, select **Cloud discovery**. Then choose the  **Discovered resources** tab.

    ![Screenshot of the discovered resources menu.](media/discovered-resources-menu.png)

1. In the **Discovered resources** page, drill down into each resource to see what kinds of transactions occurred, who accessed it, and then drill down to investigate the users even further.

   ![Screenshot of the Discovered resources tab.](media/discovery-resources.png)

1. For custom apps, select the options menu at the end of the row and then select **Add new custom app**. This opens the **Add this app** dialog, where you can name and identify the app so it can be included in the cloud discovery dashboard.

## Generate a cloud discovery executive report

The best way to get an overview of Shadow IT use across your organization is by generating a cloud discovery executive report. This report identifies the top potential risks and helps you plan a workflow to mitigate and manage risks until they're resolved.

**To generate a cloud discovery executive report**:

1. In the Microsoft Defender portal, under **Cloud Apps**, select **Cloud discovery**.

1. From the **Cloud discovery** page, select **Actions** > **Generate Cloud Discovery executive report**.

1. Optionally, change the report name, and then select **Generate**.

## Exclude entities

If you have system users, IP addresses, or devices that are noisy but uninteresting, or entities that shouldn't be presented in the Shadow IT reports, you might want to exclude their data from the cloud discovery data that's analyzed. For example, you might want to exclude all information originating from a local host.

**To create an exclusion:**

1. In the Microsoft Defender portal, select **Settings** > **Cloud Apps** > **Cloud Discovery** > **Exclude entities**.

1. Select either the **Excluded users**, **Excluded groups**, **Excluded IP addresses**, or **Excluded devices** tab and select the **+Add** button to add your exclusion.

1. Add a user alias, IP address, or device name. We recommend adding information about why the exclusion was made.

    ![Screenshot of excluding a user.](media/exclude-user.png "exclude user")

>[!NOTE]
>All entity exclusions apply to newly received data only. Historical data of the excluded entities remains through the retention period (90 days).

## Manage continuous reports

Custom continuous reports provide you with more granularity when monitoring your organization's cloud discovery log data. Create custom reports to filter on specific geographic locations, networks, and sites, or organizational units. By default, only the following reports appear in your cloud discovery report selector:

- The **Global report** consolidates all the information in the portal from all the data sources you included in your logs.  The global report doesn't include data from Microsoft Defender for Endpoint.

- The **Data source specific report** displays only information from a specific data source.

**To create a new continuous report**:

1. In the Microsoft Defender portal, select **Settings** > **Cloud Apps** > **Cloud Discovery** > **Continuous report** > **Create report**.

1. Enter a report name.

1. Select the data sources you want to include (all or specific).

1. Set the filters you want on the data. These filters can be **User groups**, **IP address tags**, or **IP address ranges**. For more information on working with IP address tags and IP address ranges, see [Organize the data according to your needs](ip-tags.md).

    ![Screenshot of creating a custom continuous report.](media/create-custom-continuous-report.png)

> [!NOTE]
> All custom reports are limited to a maximum of 1 GB of uncompressed data. If there is more than 1 GB of data, the first 1 GB of data will be exported into the report.

## Deleting cloud discovery data

We recommend deleting cloud discovery data in the following cases:

- If you manually uploaded log files, a long time passed since you updated the system with new log files, and you don't want old data affecting your results.

- When you set a new custom data view, it applies only to new data from that point forward. In such cases, you might want to erase old data and then upload your log files again to enable the custom data view to pick up events in the log file data.

- If many users or IP addresses recently started working again after being offline for some time, their activity is identified as anomalous and might give you false positive violations.

> [!IMPORTANT]
> Make sure you want to delete data before doing so. This action is irreversbile and deletes **all** cloud discovery data in the system.
>

**To delete cloud discovery data**:

1. In the Microsoft Defender Portal, select **Settings** > **Cloud Apps** > **Cloud Discovery** > **Delete data**.

1. Select the **Delete** button.

    ![Screenshot of deleting cloud discovery data.](media/delete-data.png "delete data")

> [!NOTE]
> The deletion process takes a few minutes and is not immediate.

## Next steps

> [!div class="nextstepaction"]
> [Create snapshot cloud discovery reports](create-snapshot-cloud-discovery-reports.md)

> [!div class="nextstepaction"]
> [Configure automatic log upload for continuous reports](discovery-docker.md)

> [!div class="nextstepaction"]
> [Working with cloud discovery data](working-with-cloud-discovery-data.md)

> [!div class="nextstepaction"]
> [Discover apps using Microsoft Defender for Endpoint's integration](mde-integration.md)
