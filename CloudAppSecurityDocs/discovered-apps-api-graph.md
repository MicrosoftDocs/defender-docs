---
title: Work with discovered apps via Graph API | Microsoft Defender for Cloud Apps
description: Learn how to work with apps discovered by Microsoft Defender for Cloud Apps via Graph API.
ms.topic: how-to #Don't change
ms.date: 06/24/2024

#customer intent: As a security engineer, I want to work with discovered apps via API so that I can customize and automate the Microsoft Defender for Cloud Apps **Discovered apps** page functionality.

---

# Work with discovered apps via Graph API (Preview)

Microsoft Defender for Cloud Apps supports a Microsoft Graph API that you can use to work with discovered cloud apps, to customize and automate the **Discovered apps** page functionality in the Microsoft Defender portal.

This article provides sample procedures for using the [uploadedStreams API](/graph/api/security-datadiscoveryreport-list-uploadedstreams?view=graph-rest-beta) for common purposes.

## Prerequisites

Before you start using the Graph API, make sure to create an app and get an access token to use the application. Then, use the token to access the Defender for Cloud Apps API.

- Make sure to give the app permissions to access Defender for Cloud Apps, by granting it with `CloudApp-Discovery.Read.All` permissions and admin consent.

- Take note of your app secret and copy its value to use later on in your scripts.

You'll also need cloud app data streaming into Microsoft Defender for Cloud Apps.

For more information, see:

- [Manage admin access](manage-admins.md)
- [Graph API authentication and authorization basics](/graph/auth/auth-concepts)
- [Use the Microsoft Graph API](/graph/use-the-api)
- [Set up Cloud Discovery](set-up-cloud-discovery.md)

## Get data about discovered apps

To get a high level summary of all the data available on your **Discovered apps** page, run the following GET command:

```http
GET https://graph.microsoft.com/beta/dataDiscovery/cloudAppDiscovery/uploadedStreams
```

To drill down to data for a specific stream:

1. Copy the relevant `<streamID>` value from the previous command's output.
1. Run the following GET command using the `<streamID>` value:

    ```http
    GET https://graph.microsoft.com/beta/security/dataDiscovery/cloudAppDiscovery/uploadedStreams/<streamId>/aggregatedAppsDetails(period=duration'P90D')
    ```

## Filter for a specific time period and risk score

Filter your API commands using `$select` and `$filter` to get data for a specific time period and risk score. For example, to view the names of all apps discovered in the last 30 days with a risk score lower or equal to 4, run:

```http
GET https://graph.microsoft.com/beta/security/dataDiscovery/cloudAppDiscovery/uploadedStreams/<streamId>/aggregatedAppsDetails (period=duration'P30D')?$filter=riskRating  le 4 &$select=displayName
```

## Get the userIdentifier of all users, devices, or IP addresses using a specific app

Identify the users, devices, or IP addresses that are currently using a specific app, run one of the following commands:

- **To return users**:

    ```http
    GET  https://graph.microsoft.com/beta/security/dataDiscovery/cloudAppDiscovery/uploadedStreams/<streamId>/aggregatedAppsDetails (period=duration'P30D')/ <id>/users  
    ```

- **To return IP addresses**:

    ```http
    GET  https://graph.microsoft.com/beta/security/dataDiscovery/cloudAppDiscovery/uploadedStreams/<streamId>/aggregatedAppsDetails (period=duration'P30D')/ <id>/ipAddress  
    ```

- **To return devices**:

    ```http
    GET  https://graph.microsoft.com/beta/security/dataDiscovery/cloudAppDiscovery/uploadedStreams/<streamId>/aggregatedAppsDetails (period=duration'P30D')/ <id>/name  
    ```

## Use filters to see apps by category

Use filters to see apps of a specific category, such as apps that are categorized as *Marketing*, and are also not HIPPA compliant. For example, run:

```http
GET  https://graph.microsoft.com/beta/security/dataDiscovery/cloudAppDiscovery/uploadedStreams/<MDEstreamId>/aggregatedAppsDetails (period=duration 'P30D')?$filter= (appInfo/Hippa eq 'false') and category eq 'Marketing'  
```

## Related content

For more information, see [Working with discovered apps](discovered-apps.md) and the [Microsoft Graph API reference](/graph/api/resources/security-cloudappdiscovery-overview?view=graph-rest-beta).
