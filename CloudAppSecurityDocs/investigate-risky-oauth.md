---
title: Investigate and remediate risky OAuth apps | Microsoft Defender for Cloud Apps
description: This tutorial provides information on how to investigate and remediate risky OAuth apps in Defender for Cloud Apps.
ms.date: 01/23/2024
ms.topic: tutorial
---
# Investigate and remediate risky OAuth apps

OAuth is an open standard for token-based authentication and authorization. OAuth enables a user's account information to be used by third-party services, without exposing the user's password. OAuth acts as an intermediary on behalf of the user, providing the service with an access token that authorizes specific account information to be shared.

For example, an app that analyses the user's calendar and gives advice on how to become more productive, needs access to the user's calendar. Instead of providing the user's credentials, OAuth enables the app to get access to the data based only on a token, which is generated when the user provides consent to a page as can be seen in the picture below.

![OAuth app permission.](media/oauth-permission.png)

Many third-party apps that might be installed by business users in your organization, request permission to access user information and data and sign in on behalf of the user in other cloud apps. When users install these apps, they often click **accept** without closely reviewing the details in the prompt, including granting permissions to the app. Accepting third-party app permissions is a potential security risk to your organization.

For example, the following OAuth app consent page might look legitimate to the average user, however, "Google APIs Explorer" shouldn't need to request permissions from Google itself. So this indicates that the app might be a phishing attempt, not related to Google at all.

![OAuth phishing google.](media/oauth-phishing.png)

As a security admin, you need visibility and control over the apps in your environment and that includes the permissions they have. You need the ability to prevent use of apps that require permission to resources you wish to revoke. Therefore, Microsoft Defender for Cloud Apps provides you with the ability to investigate and monitor the app permissions your users granted. This article is dedicated to helping you investigate the OAuth apps in your organization, and focus on the apps that are more likely to be suspicious.

Our recommended approach is to investigate the apps by using the abilities and information provided in the Defender for Cloud Apps portal to filter out apps with a low chance of being risky, and focus on the suspicious apps.

In this tutorial, you'll learn how to:

> [!div class="checklist"]
>
> - [Detect risky OAuth apps](#how-to-detect-risky-oauth-apps)
> - [Investigate risky OAuth apps](#how-to-investigate-suspicious-oauth-apps)
> - [Remediate risky OAuth apps](#how-to-remediate-suspicious-oauth-apps)

> [!NOTE]
> This article uses samples and screenshots from the **OAuth apps** page, which is used when you don't have app governance turned on.
>
> If you are using [preview features](/microsoft-365/security/defender/preview) and have app governance turned on, the same functionality is available from the **App governance** page instead.
> 
> For more information, see [App governance in Microsoft Defender for Cloud Apps](app-governance-manage-app-governance.md).
>

## How to detect risky OAuth apps

Detecting a risky OAuth app can be accomplished using:

- **Alerts**: React to an alert triggered by an existing policy.
- **Hunting**: Search for a risky app among all the available apps, without concrete suspicion of a risk.

### Detect risky apps using alerts

You can set policies to automatically send you notifications when an OAuth app meets certain criteria. For example, you can set a policy to automatically notify you when an app is detected that requires high permissions and was authorized by more than 50 users. For more information on creating OAuth policies, see [OAuth app policies](app-permission-policy.md).

### Detect risky apps by hunting

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **OAuth apps**. Use the filters and queries to review what's happening in your environment:

    - Set the filter to **Permission level high severity** and **Community use not common**. Using this filter, you can focus on apps that are potentially very risky, where users may have underestimated the risk.
    - Under **Permissions** select all the options that are particularly risky in a specific context. For example, you can select all the filters that provide permission to email access, such as **Full access to all mailboxes** and then review the list of apps to make sure that they all really need mail-related access. This can help you investigate within a specific context, and find apps that seem legitimate, but contain unnecessary permissions. These apps are more likely to be risky.

        ![OAuth phishing risky.](media/oauth-filters.png)

    - Select the saved query **Apps authorized by external users**. Using this filter, you can find apps that might not be aligned with your company's security standards.
1. After you review your apps, you can focus on the apps in the queries that seem legitimate but might actually be risky. Use the filters to find them:
    - Filter for apps that are **Authorized by a small number of users**. If you focus on these apps, you can look for risky apps that were authorized by a compromised user.
    - Apps that have permissions that don't match the app's purpose, for example, a clock app with full access to all mailboxes.
1. Select each app to open the app drawer, and check to see if the app has a suspicious name, publisher, or website.
1. Look at the list of apps and target apps that have a date under **Last authorized** that isn't recent. These apps may no longer be required.

    ![OAuth app drawer.](media/oauth-drawer.png)

## How to investigate suspicious OAuth apps

After you determine that an app is suspicious and you want to investigate it, we recommend the following key principles for efficient investigation:

- The more common and used an app is, either by your organization or online, the more likely it is to be safe.
- An app should require only permissions that are related to the app's purpose. If that's not the case, the app might be risky.
- Apps that require high privileges or admin consent are more likely to be risky.

1. Select the app to open the app drawer and select the link under **Related activities**. This opens the Activity log page filtered for activities performed by the app. Keep in mind that some apps perform activities that are registered as having been performed by a user. These activities are automatically filtered out of the results in the Activity log. For further investigation using the activity log, see [Activity log](activity-filters.md).
1. In the drawer, select **Consent activities** to investigate user consents to the app in the activity log.
1. If an app seems suspicious, we recommended that you investigate the app's name and publisher in different app stores. Focus on following apps, which might be suspicions:
    - Apps with a low number of downloads.
    - Apps with a low rating or score or bad comments.
    - Apps with a suspicious publisher or website.
    - Apps whose last update isn't recent. This might indicate an app that is no longer supported.
    - Apps that have irrelevant permissions. This might indicate that an app is risky.
1. If the app is still suspicious, you can research the app name, publisher, and URL online.
1. You can export the OAuth app audit for further analysis of the users who authorized an app. For more information, see [OAuth app auditing](manage-app-permissions.md#oauth-app-auditing).

## How to remediate suspicious OAuth apps

After you determine that an OAuth app is risky, Defender for Cloud Apps provides the following remediation options:

- **Manual remediation**:
You can easily [ban revoke an app from the OAuth apps page](manage-app-permissions.md#ban-or-approve-an-app)

- **Automatic remediation**: You can create a policy that [automatically revokes an app or revokes a specific user from an app](app-permission-policy.md).

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]
