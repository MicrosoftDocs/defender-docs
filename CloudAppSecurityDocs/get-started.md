---
title: Get started | Microsoft Defender for Cloud Apps
description: This quickstart outlines the process for getting Defender for Cloud Apps up and running so you have cloud app use, insight, and control.
ms.date: 11/28/2024
ms.topic: quickstart
---

# Get started with Microsoft Defender for Cloud Apps

This quickstart describes how to start working with Microsoft Defender for Cloud Apps on the Microsoft Defender Portal. 

Defender for Cloud Apps can help you use the benefits of cloud applications while maintaining control of your corporate resources. Defender for Cloud Apps improves your visibility into cloud activity and helps increase protection over your corporate data.

> [!TIP]
> As a companion to this article, we recommend using the [Microsoft Defender for Cloud Apps automated setup guide](https://go.microsoft.com/fwlink/?linkid=2251562) when signed in to the Microsoft 365 admin center. This guide will customize your experience based on your environment. To review best practices without signing in and activating automated setup features, go to the [Microsoft 365 setup portal]( https://go.microsoft.com/fwlink/?linkid=2251561).

## Prerequisites

To set up Defender for Cloud Apps, you must at least be a Security Administrator in Microsoft Entra ID or Microsoft 365.  

Users with admin roles have the same admin permissions across any cloud apps your organization is subscribed to, regardless of where you've assigned the role. For more information, see [Assign admin roles](/microsoft-365/admin/add-users/assign-admin-roles) and [Assigning administrator roles in Microsoft Entra ID](/azure/active-directory/roles/permissions-reference).


Microsoft Defender for Cloud Apps is a security tool and therefore doesn't require Microsoft 365 productivity suite licenses. For Microsoft 365 Cloud App Security (Microsoft Defender for Cloud Apps only for Microsoft 365), see [What are the differences between Microsoft Defender for Cloud Apps and Microsoft 365 Cloud App Security?](editions-cloud-app-security-o365.md).

Microsoft Defender for Cloud Apps depends on the following Microsoft Entra ID applications to function properly. Do not disable these applications in Microsoft Entra ID:

- Microsoft Defender for Cloud Apps - APIs
- Microsoft Defender for Cloud Apps - Customer Experience
- Microsoft Defender for Cloud Apps - Information Protection
- Microsoft Defender for Cloud Apps - MIP Server

## Access Defender for Cloud Apps

1. Obtain a Defender for Cloud Apps license for each user you want protected by Defender for Cloud Apps. For more information, see the [Microsoft 365 licensing datasheet](https://aka.ms/M365EnterprisePlans).

     A Defender for Cloud Apps trial is available as part of a Microsoft 365 E5 trial, and you can purchase licenses from the Microsoft 365 admin center > **Marketplace**. For more information, see [Try or buy Microsoft 365](/microsoft-365/commerce/try-or-buy-microsoft-365) or [Get support for Microsoft 365 for business](/microsoft-365/admin/get-help-support).

    >[!NOTE]
    > Microsoft Defender for Cloud Apps is a security tool and therefore doesn't require Microsoft 365 productivity suite licenses. For more information, see [What are the differences between Microsoft Defender for Cloud Apps and Microsoft 365 Cloud App Security?](editions-cloud-app-security-o365.md).

1. Access Defender for Cloud Apps on the **[Microsoft Defender Portal](https://security.microsoft.com)** under **Cloud Apps**. For example:

    :::image type="content" source="media/get-started/defender-for-cloud-apps-intro.png" alt-text="Screenshot of the Defender for Cloud Apps Cloud Discovery page." lightbox="media/get-started/defender-for-cloud-apps-intro.png":::

## Step 1: Set instant visibility, protection, and governance actions for your apps

**How to page**: [Set instant visibility, protection, and governance actions for your apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md)

**Required task**: Connect apps

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
1. Under **Connected Apps**, select **App Connectors**.
1. Select the **+Connect an app** to add an app and then select an app.
1. Follow the configuration steps to connect the app.

**Why connect an app?**
After you connect an app, you can gain deeper visibility so you can investigate activities, files, and accounts for the apps in your cloud environment.

## Step 2: Protect sensitive information with DLP policies

**How to page**: [Protect sensitive information with DLP policies](policies-information-protection.md)

**Recommended task**: Enable file monitoring and create file policies

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
1. Under **Information Protection**, select **Files**.
1. Select **Enable file monitoring** and then select **Save**.
1. If you use sensitivity labels from Microsoft Purview Information Protection, under **Information Protection**, select **Microsoft Information Protection**.
1. Select the required settings and then select **Save**.
1. In [Step 3](#step-3-control-cloud-apps-with-policies), create [File policies](data-protection-policies.md) to meet your organizational requirements.

> [!TIP]
> You can view files from your connected apps by browsing to **Cloud Apps** > **Files** in the Microsoft Defender Portal.

**Migration recommendation**  
We recommend using Defender for Cloud Apps sensitive information protection in parallel with your current Cloud Access Security Broker (CASB) solution. Start by [connecting the apps you want to protect](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md) to Microsoft Defender for Cloud Apps. Since API connectors use out-of-band connectivity, no conflict will occur. Then progressively migrate your [policies](control-cloud-apps-with-policies.md) from your current CASB solution to Defender for Cloud Apps.

> [!NOTE]
> For third-party apps, verify that the current load does not exceed the app's maximum number of allowed API calls.

## Step 3: Control cloud apps with policies

**How to page**: [Control cloud apps with policies](control-cloud-apps-with-policies.md)

**Required task**: Create policies

### To create policies

1. In the Microsoft Defender Portal, under **Cloud Apps**, choose **Policies** -> **Policy templates**.
1. Choose a policy template from the list, and then select the **+** icon to create the policy.
1. Customize the policy (select filters, actions, and other settings), and then choose **Create**.
1. Under **Cloud Apps**, choose **Policies** -> **Policy management**, to choose the policy and see the relevant matches (activities, files, alerts).

> [!TIP]
> To cover all your cloud environment security scenarios, create a policy for each **risk category**.

### How can policies help your organization?

You can use policies to help you monitor trends, see security threats, and generate customized reports and alerts. With policies, you can create governance actions, and set data loss prevention and file-sharing controls.

## Step 4: Set up cloud discovery

**How to page**: [Set up cloud discovery](set-up-cloud-discovery.md)

**Required task**: Enable Defender for Cloud Apps to view your cloud app use

1. [Integrate with Microsoft Defender for Endpoint](mde-integration.md) to automatically enable Defender for Cloud Apps to monitor your Windows 10 and Windows 11 devices inside and outside your corporation.
1. If you use [Zscaler, integrate](zscaler-integration.md) it with Defender for Cloud Apps.
1. To achieve full coverage, create a continuous cloud discovery report

    1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
    1. Under **Cloud Discovery**, choose **Automatic log upload**.
    1. On the **Data sources** tab, add your sources.
    1. On the **Log collectors** tab, configure the log collector.

**Migration recommendation**  
We recommend using Defender for Cloud Apps discovery in parallel with your current CASB solution. Start by configuring automatic firewall log upload to Defender for Cloud Apps [log collectors](discovery-docker.md). If you use Defender for Endpoint, in Microsoft Defender XDR, make sure you [turn on the option](mde-integration.md#how-to-integrate-microsoft-defender-for-endpoint-with-defender-for-cloud-apps) to forward signals to Defender for Cloud Apps. Configuring cloud discovery won't conflict with the log collection of your current CASB solution.

### To create a snapshot cloud discovery report

1. In the Microsoft Defender Portal, under **Cloud Apps**, choose **Cloud discovery**.
1. In the top right-hand corner, select **Actions** -> **Create Cloud Discovery snapshot report**.

### Why should you configure cloud discovery reports?

Having visibility into shadow IT in your organization is critical.
After your logs are analyzed, you can easily find which cloud apps are being used, by which people, and on which devices.

## Step 5: Personalize your experience

**How to page**: [Personalize your experience](mail-settings.md)

**Recommended task**: Add your organization details

### To enter email settings

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
1. Under **System**, select **Mail settings**.
1. Under **Email sender identity**, enter your email addresses and display name.
1. Under **Email design**, upload your organization's email template.

### To set admin notifications

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Microsoft Defender XDR**.
1. Select **Email notifications**.
1. Configure the methods you want to set for system notifications.

### To customize the score metrics

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
1. Under **Cloud Discovery**, choose **Score metrics**.
1. Configure the importance of various risk values.
1. Choose **Save**.

Now the risk scores given to discovered apps are configured precisely according to your organization needs and priorities.

### Why personalize your environment?

Some features work best when they're customized to your needs.
Provide a better experience for your users with your own email templates. Decide what notifications you receive and customize your risk score metric to fit your organization's preferences.

## Step 7: Organize the data according to your needs

**How to page**: [Working with IP ranges and tags](ip-tags.md)

**Recommended task**: Configure important settings

### To create IP address tags

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
1. Under **System**, select **IP address ranges**.
1. Select **+ Add IP address range**  to add an IP address range.
1. Enter the IP range **Name**, **IP address ranges**, **Category**, and **Tags**.
1. Choose **Create**.

    Now you can use IP tags when you create policies, and when you filter and create continuous reports.

### To create continuous reports

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
1. Under **Cloud Discovery**, choose **Continuous reports**.
1. Choose **Create report**.
1. Follow the configuration steps.
1. Choose **Create**.

Now you can view discovered data based on your own preferences, such as business units or IP ranges.

### To add domains

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
1. Under **System**, choose **Organization details**.
1. Add your organization's internal domains.
1. Choose **Save**.

### Why should you configure these settings?

These settings help give you better control of features in the console. With IP tags, it's easier to create policies that fit your needs, to accurately filter data, and more. Use Data views to group your data into logical categories.

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md).

[!INCLUDE [Open support ticket](includes/support.md)].
