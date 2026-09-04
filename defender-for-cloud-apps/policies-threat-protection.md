---
title: Common threat protection policies | Microsoft Defender for Cloud Apps
description: This topic outlines the steps to configure many threat protection policies in Defender for Cloud Apps.
ms.date: 07/03/2026
ms.topic: how-to
ms.reviewer: Ronen-Refaeli
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---
# Common Defender for Cloud Apps threat protection policies



This article describes common threat protection policies in Defender for Cloud Apps and explains how to configure them. Use these policies to identify high-risk use, detect abnormal user behavior, and prevent threats in your sanctioned cloud apps. Each section covers the prerequisites and steps to set up a specific policy, including both built-in anomaly detections and custom activity policies.

> [!NOTE]
> When integrating Defender for Cloud Apps with Microsoft Defender for Identity, policies from Defender for Identity also appear on the policies page. For a list of Defender for Identity policies, see [Security Alerts](/defender-for-identity/suspicious-activity-guide).

## Detect and control user activity from unfamiliar locations

The activity from unfamiliar locations detection identifies user access or activity from locations that no one in your organization has visited before.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

The unfamiliar locations detection is set up by default to alert you when access comes from new locations. No action is needed to turn on this policy. For more information, see [Anomaly detection policies](anomaly-detection-policy.md).

## Detect compromised account by impossible location (impossible travel)

The impossible travel detection identifies user access or activity from two different locations within a time period that is shorter than the time it takes to travel between them.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. This detection is automatically configured out-of-the-box to alert you when there's access from impossible locations. You don't need to take any action to configure this policy. For more information, see [Anomaly detection policies](anomaly-detection-policy.md).
1. Optional: you can [customize anomaly detection policies](anomaly-detection-policy.md#scope-anomaly-detection-policies):

    - Customize the detection scope in terms of users and groups

    - Choose the types of sign-ins to consider

    - Set your sensitivity preference for alerting

1. Create the impossible travel anomaly detection policy.

## Detect suspicious activity from an "on-leave" employee

Detect when a user, who is on unpaid leave and shouldn't be active on any organizational resource, is accessing any of your organization's cloud resources.

### Prerequisites

- You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

- Create a security group in Microsoft Entra ID for the users on unpaid leave and add all the users you want to monitor.

### Steps

1. On the [User groups](user-groups.md) screen, select **Create user group** and import the relevant Microsoft Entra group.

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **Activity policy**.

1. Set the filter **User group** equals to the name of the user groups you created in Microsoft Entra ID for the unpaid leave users.

1. Optional: Set the **Governance** actions to be taken when a violation is detected. Governance actions are automated responses—such as notifying a user, suspending an account, or revoking access—that vary between services. You can choose **Suspend user**.

1. Create the activity policy.

## Detect and notify when outdated browser OS is used

Detect when a user is using a browser with an outdated client version that might pose compliance or security risks to your organization.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new  **Activity policy**.

1. Set the filter **User agent tag** equals to **Outdated browser** and **Outdated operating system**.

1. Set the **Governance** actions to be taken on files when a violation is detected. The governance actions available vary between services. Under **All apps**, select **Notify user**, so that your users can act upon the alert and update the necessary components.

1. Create the Activity policy.

## Detect and alert when Admin activity is detected on risky IP addresses

A risky IP address is one that Defender for Cloud Apps identifies as suspicious based on threat intelligence. Detect admin activities performed from a risky IP address, and notify the system admin for further investigation or set a governance action on the acting administrator's account. Learn more [how to work with IP ranges and Risky IP](/defender-cloud-apps/ip-tags).

### Prerequisites

- You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

- From the Settings cog, select **IP address ranges** and select the + to add IP address ranges for your internal subnets and their egress public IP addresses. Set the **Category** to **Internal**.

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new  **Activity policy**.

1. Set **Act on** to **Single activity**.

1. Set the filter **IP address** to **Category** equals **Risky**

1. Set the filter **Administrative activity** to **True**

1. Set the **Governance** actions to be taken on files when a violation is detected. The governance actions available vary between services. Under **All apps**, select **Notify user**, so that your users can act upon the alert and update the necessary components **CC the user's manager**.

1. Create the activity policy.

## Detect activities by service account from external IP addresses

Detect service account activities originating from non-internal IP addresses. Activity from non-internal IP addresses could indicate suspicious behavior or a compromised account.

### Prerequisites

- You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).
- From the Settings cog, select **IP address ranges** and select the + to add IP address ranges for your internal subnets and their egress public IP addresses. Set the **Category** to **Internal**.

- Standardize a naming conventions for service accounts in your environment, for example, set all account names to start with "svc".

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **Activity policy**.

1. Set the filter **User** to **Name** and then **Starts with** and enter your naming convention, such as svc.

1. Set the filter **IP address** to **Category** does not equal **Other** and **Corporate**.

1. Set the **Governance** actions to be taken on files when a violation is detected. The governance actions available vary between services.

1. Create the policy.

## Detect mass download (data exfiltration)

Detect when a certain user accesses or downloads a massive number of files in a short period of time.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **Activity policy**.

1. Set the filter **IP addresses** to **Tag** does not equal **Microsoft Azure**. This will exclude non-interactive device-based activities.

1. Set the filter **Activity types** equals to and then select all relevant download activities.

1. Set the **Governance** actions to be taken on files when a violation is detected. The governance actions available vary between services.
1. Create the policy.

## Detect potential Ransomware activity

Automatic detection of potential Ransomware activity.

### Prerequisites

- Ransomware detection applies only to Microsoft 365, Google Workspace, Box, and Dropbox.
- You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. This detection is set up by default to alert you when a ransomware risk is found. No action is needed to turn on this policy. For more information, see [Anomaly detection policies](anomaly-detection-policy.md).

2. You can configure the **Scope** of the ransomware detection and choose which governance actions to take when an alert fires. To learn how Defender for Cloud Apps spots ransomware, see [Protecting your organization from ransomware](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware).

## Detect malware in the cloud

Detect files containing malware in your cloud environments by utilizing the Defender for Cloud Apps integration with Microsoft Threat Intelligence, Microsoft's security analysis capability that identifies known malicious indicators such as malware signatures and suspicious IP addresses.

### Prerequisites

- For Microsoft 365 malware detection, you must have a valid license for Microsoft Defender for Microsoft 365 P1.
- You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

- The malware detection is automatically configured out-of-the-box to alert you when there's a file that may contain malware. You don't need to take any action to configure this policy. For more information, see [Anomaly detection policies](anomaly-detection-policy.md).

## Detect rogue admin takeover

Detect repeated admin activity that might indicate malicious intentions.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **Activity policy**.

1. Set **Act on** to **Repeated activity** and customize the **Minimum repeated activities** and set a **Timeframe** to comply with your organization's policy..

1. Set the filter **User** to **From group** equals and select all the related admin group as **Actor only**.

1. Set the filter **Activity type** equals to all activities that relate to password updates, changes, and resets.

1. Set the **Governance** actions to be taken on files when a violation is detected. The governance actions available vary between services.
1. Create the policy.

## Detect suspicious inbox manipulation rules

If a suspicious inbox rule was set on a user's inbox, it may indicate that the user account is compromised, and that the mailbox is being used to distribute spam and malware in your organization.

### Prerequisites

- Use of Microsoft Exchange for email.

### Steps

- The suspicious inbox rule detection is automatically configured out-of-the-box to alert you when there's a suspicious inbox rule set. You don't need to take any action to configure this policy. For more information, see [Anomaly detection policies](anomaly-detection-policy.md).

## Detect leaked credentials

When cyber criminals compromise valid passwords of legitimate users, they often share those credentials. This is usually done by posting them publicly on the dark web or paste sites or by trading or selling the credentials on the black market.

Defender for Cloud Apps utilizes Microsoft's Threat intelligence to match such credentials to the ones used inside your organization.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

The leaked credentials detection is automatically configured out-of-the-box to alert you when a possible credential leak is detected. You don't need to take any action to configure this policy. For more information, see [Anomaly detection policies](anomaly-detection-policy.md).

## Detect anomalous file downloads

Detect when users perform multiple file download activities in a single session, relative to the baseline learned. This could indicate an attempted breach.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. This detection is automatically configured out-of-the-box to alert you when an anomalous download occurs. You don't need to take any action to configure this policy. For more information, see [Anomaly detection policies](anomaly-detection-policy.md).

1. It's possible to configure the scope of the detection and to customize the action to be taken when an alert is triggered.

## Detect anomalous file shares by a user

Detect when users perform multiple file-sharing activities in a single session with respect to the baseline learned, which could indicate an attempted breach.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. This detection is automatically configured out-of-the-box to alert you when users perform multiple file sharing. You don't need to take any action to configure this policy. For more information, see [Anomaly detection policies](anomaly-detection-policy.md).

1. It's possible to configure the scope of the detection and to customize the action to be taken when an alert is triggered.

## Detect anomalous activities from infrequent country/region

Detect activities from a location that wasn't recently or was never visited by the user or by any user in your organization.

> [!NOTE]
> This detection requires an initial learning period of 7 days. During the learning period, Defender for Cloud Apps does not generate alerts for new locations.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. This detection is automatically configured out-of-the-box to alert you when an anomalous activity occurs from an infrequent country/region. You don't need to take any action to configure this policy. For more information, see [Anomaly detection policies](anomaly-detection-policy.md).

1. It's possible to configure the scope of the detection and to customize the action to be taken when an alert is triggered.

## Detect activity performed by a terminated user

Detect when a user who is no longer an employee of your organization performs an activity in a sanctioned app. This may indicate malicious activity by a terminated employee who still has access to corporate resources.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. This detection is automatically configured out-of-the-box to alert you when an activity is performed by a terminated employee. You don't need to take any action to configure this policy. For more information, see [Anomaly detection policies](anomaly-detection-policy.md).

1. It's possible to configure the scope of the detection and to customize the action to be taken when an alert is triggered.

<a name="next-steps"></a>
## Related content

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]
