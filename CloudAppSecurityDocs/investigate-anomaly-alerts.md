---
title: How to investigate anomaly detection alerts | Microsoft Defender for Cloud Apps
description: This article explains how to investigate the Defender for Cloud Apps anomaly detection alerts issued when attacks are detected against your organization.
ms.date: 05/19/2024
ms.topic: how-to
---

# How to investigate anomaly detection alerts



Microsoft Defender for Cloud Apps provides security detections and alerts for malicious activities. The purpose of this guide is to provide you with general and practical information on each alert, to help with your investigation and remediation tasks. Included in this guide is general information about the conditions for triggering alerts. However, it's important to note that since anomaly detections are nondeterministic by nature, they're only triggered when there's behavior that deviates from the norm. Finally, some alerts might be in preview, so regularly review the official documentation for updated alert status.

## MITRE ATT\&CK

To explain and make it easier to map the relationship between Defender for Cloud Apps alerts and the familiar MITRE ATT\&CK Matrix, we've categorized the alerts by their corresponding MITRE ATT\&CK tactic. This extra reference makes it easier to understand the suspected attacks technique potentially in use when a Defender for Cloud Apps alert is triggered.

This guide provides information about investigating and remediating Defender for Cloud Apps alerts in the following categories.

> [!div class="checklist"]
>
> - [Initial Access](#initial-access-alerts)
> - [Execution](#execution-alerts)
> - [Persistence](#persistence-alerts)
> - [Privilege Escalation](#privilege-escalation-alerts)
> - [Credential Access](#credential-access-alerts)
> - [Collection](#collection-alerts)
> - [Exfiltration](#exfiltration-alerts)
> - [Impact](#impact-alerts)

## Security alert classifications

Following proper investigation, all Defender for Cloud Apps alerts can be classified as one of the following activity types:

- **True positive (TP)**: An alert on a confirmed malicious activity.
- **Benign true positive (B-TP)**: An alert on suspicious but not malicious activity, such as a penetration test or other authorized suspicious action.
- **False positive (FP)**: An alert on a nonmalicious activity.

## General investigation steps

You should use the following general guidelines when investigating any type of alert to gain a clearer understanding of the potential threat before applying the recommended action.

- If you identify a **TP**, review all the user's activities to gain an understanding of the impact.
- Review all user activity for other indicators of compromise and explore the source and scope of impact. For example, review the following user device information and compare with known device information:
  - Operating system and version
  - Browser and version
  - IP address and location

## Initial access alerts

This section describes alerts indicating that a malicious actor might be attempting to gain an initial foothold into your organization.

### Activity from anonymous IP address

**Description**

Activity from an IP address that has been identified as an anonymous proxy IP address by Microsoft Threat Intelligence or by your organization. These proxies can be used to hide a device's IP address and might be used for malicious activities.

**TP**, **B-TP**, or **FP**?

This detection uses a machine learning algorithm that reduces **B-TP** incidents, such as mis-tagged IP addresses that are widely used by users in the organization.

1. **TP**: If you're able to confirm that the activity was performed from an anonymous or TOR IP address.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.
1. **B-TP**: If a user is known to use anonymous IP addresses in the scope of their duties. For example, when a security analyst conducts security or penetration tests on behalf of the organization.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

- Review all user activity and alerts for other indicators of compromise. For example, if the alert was followed by another suspicious alert, such as a [Unusual file download (by user)](#unusual-file-download-by-user) or a [Suspicious inbox forwarding](#suspicious-inbox-forwarding) alert, that often indicates that an attacker is attempting to exfiltrate data.

### Activity from infrequent country

Activity from a country/region that could indicate malicious activity. This policy profiles your environment and triggers alerts when activity is detected from a location that wasn't recently or was never visited by any user in the organization.

The policy can be further scoped to a subset of users or can exclude users known to travel to remote locations.

**Learning period**

Detecting anomalous locations requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**:
    1. Suspend the user, reset their password, and identify the right time to safely re-enable the account.
    1. Optional: Create a playbook using Power Automate to contact users detected as connecting from infrequent locations, and their managers, to verify their activity.
1. **B-TP**: If a user is known to be at this location. For example, when a user who travels frequently and is currently in the specified location.

    **Recommended action**:
    1. Dismiss the alert and modify the policy to exclude the user.
    1. Create a user group for frequent travelers, import the group into Defender for Cloud Apps, and exclude the users from this alert
    1. Optional: Create a playbook using Power Automate to contact users detected as connecting from infrequent locations, and their managers, to verify their activity.

**Understand the scope of the breach**

- Review which resource might have been compromised, such as potential data downloads.

### Activity from suspicious IP addresses

Activity from an IP address that has been identified as risky by Microsoft Threat Intelligence or by your organization. These IP addresses were identified as being involved in malicious activities, such as performing password spray, botnet command and control (C&C), and might indicate a compromised account.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.
1. **B-TP**: If a user is known to use the IP address in the scope of their duties. For example, when a security analyst conducts security or penetration tests on behalf of the organization.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review the activity log and search for activities from the same IP address.
1. Review which resource might have been compromised, such as potential data downloads or administrative modifications.
1. Create a group for security analysts voluntarily triggering these alerts and exclude them from the policy.

### Impossible Travel

Activity from the same user in different locations within a time period that is shorter than the expected travel time between the two locations. This can indicate a credential breach, however, it's also possible that the user's actual location is masked, for example, by using a VPN.

To improve accuracy and alert only when there's a strong indication of a breach, Defender for Cloud Apps establishes a baseline on each user in the organization and will alert only when the unusual behavior is detected. The impossible travel policy can be fine-tuned to your requirements.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

This detection uses a machine learning algorithm that ignores obvious **B-TP** conditions, such as when the IP addresses on both sides of the travel are considered safe, the travel is trusted and excluded from triggering the Impossible travel detection. For example, both sides are considered safe if they're [tagged as corporate](ip-tags.md). However, if the IP address of only one side of the travel is considered safe, the detection is triggered as normal.

1. **TP**: If you're able to confirm that the location in the impossible travel alert is unlikely for the user.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.
1. **FP** (Undetected user travel): If you're able to confirm that the user recently traveled to the destination mentioned detailed in the alert. For example, if a user's phone that is in airplane mode remains connected to services such as Exchange Online on your corporate network while traveling to a different location. When the user arrives at the new location, the phone connects to Exchange Online triggering the impossible travel alert.

    **Recommended action**: Dismiss the alert.
1. **FP** (Untagged VPN): If you're able to confirm that the IP address range is from a sanctioned VPN.

    **Recommended action**: Dismiss the alert and [add the VPN's IP address range](ip-tags.md#create-an-ip-address-range) to Defender for Cloud Apps and then use it to tag the VPN's IP address range.

**Understand the scope of the breach**

1. Review the activity log to gain an understanding of similar activities in the same location and IP address.
1. If you see that the user performed other risky activities, such as downloading a large volume of files from a new location, this would be a strong indication of a possible compromise.
1. Add corporate VPN's and IP Address ranges.
1. Create a playbook using Power Automate and contact the user's manager to see if the user is legitimately traveling.
1. Consider creating a known traveler database for up to the minute organizational travel reporting and use it to cross-reference travel activity.

### Misleading OAuth app name

This detection identifies apps with characters, such as foreign letters, that resemble Latin letters. This can indicate an attempt to disguise a malicious app as a known and trusted app so that attackers can deceive users into downloading their malicious app.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the app has a misleading name.

    **Recommended action**: Review the level of permission requested by this app and which users granted access. Based on your investigation you can choose to ban access to this app.

To ban access to the app, on the **Google** or **Salesforce** tabs on the **App governance** page, on the row in which the app you want to ban appears, select the ban icon.
    - You can choose if you want to tell users the app they installed and authorized has been banned. The notification lets users know the app is disabled and they won't have access to the connected app. If you don't want them to know, unselect **Notify users who granted access to this banned app** in the dialog.
    - It's recommended that you let the app users know their app is about to be banned from use.

1. **FP**: If you're to confirm that the app has a misleading name but has a legitimate business use in the organization.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

- Follow the tutorial on how to [investigate risky OAuth apps](investigate-risky-oauth.md).

### Misleading publisher name for an OAuth app

This detection identifies apps with characters, such as foreign letters, that resemble Latin letters. This can indicate an attempt to disguise a malicious app as a known and trusted app so that attackers can deceive users into downloading their malicious app.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the app has a misleading publisher name.

    **Recommended action**: Review the level of permission requested by this app and which users granted access. Based on your investigation you can choose to ban access to this app.
1. **FP**: If you're to confirm that the app has a misleading publisher name but is a legitimate publisher.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. On the **Google** or **Salesforce** tabs on the **App governance** page, select the app to open the **App drawer**, and then select **Related activity**. This opens the **Activity log** page filtered for activities performed by the app. Keep in mind that some apps perform activities that are registered as having been performed by a user. These activities are automatically filtered out of the results in the activity log. For further investigation using the activity log, see [Activity log](activity-filters.md).
1. If you suspect that an app is suspicious, we recommended that you investigate the app's name and publisher in different app stores. When checking app stores, focus on the following types of apps:
    - Apps with a low number of downloads.
    - Apps with a low rating or score or bad comments.
    - Apps with a suspicious publisher or website.
    - Apps that haven't been recently updated. This might indicate an app that is no longer supported.
    - Apps that have irrelevant permissions. This might indicate that an app is risky.
1. If you still suspect that an app is suspicious, you can research the app name, publisher, and URL online.

## Execution alerts

This section describes alerts indicating that a malicious actor might be attempting to run malicious code in your organization.

### Multiple storage deletion activities

Activities in a single session indicating that a user performed an unusual number of cloud storage or database deletions from resources such as Azure blobs, AWS S3 buckets, or Cosmos DB when compared to the baseline learned. This can indicate an attempted breach of your organization.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're to confirm that the deletions were unauthorized.

    **Recommended action**: Suspend the user, reset their password, and scan all devices for malicious threats. Review all user activity for other indicators of compromise and explore the scope of impact.
1. **FP**: If, after your investigation, you're able to confirm that the administrator was authorized to perform these deletion activities.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Contact the user and confirm the activity.
1. Review the activity log for other indicators of compromise and see who made the change.
1. Review that user's activities for changes to other services.

### Multiple VM creation activities

Activities in a single session indicating that a user performed an unusual number of VM creation actions when compared to the baseline learned. Multiple VM creations on a breached Cloud infrastructure could indicate an attempt to run crypto mining operations from within your organization.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

To improve accuracy and alert only when there's a strong indication of a breach, this detection establishes a baseline on each environment in the organization to reduce **B-TP** incidents, such as an administrator legitimately created more VMs than the established baseline, and only alert when the unusual behavior is detected.

- **TP**: If you're able to confirm that the creation activities weren't performed by a legitimate user.

    **Recommended action**: Suspend the user, reset their password, and scan all devices for malicious threats. Review all user activity for other indicators of compromise and explore the scope of impact. In addition, contact the user, confirm their legitimate actions, and then make sure you disable or delete any compromised VMs.
- **B-TP**: If, after your investigation, you're able to confirm that the administrator was authorized to perform these creation activities.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review all user activity for other indicators of compromise.
1. Review the resources created or modified by the user and verify that they conform with your organization's policies.

### Suspicious creation activity for cloud region (preview)

Activities indicating that a user performed an unusual resource creation action in an uncommon AWS region when compared to the baseline learned. Resource creation in uncommon cloud regions could indicate an attempt to perform a malicious activity such as crypto mining operations from within your organization.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

To improve accuracy and alert only when there's a strong indication of a breach, this detection establishes a baseline on each environment in the organization to reduce **B-TP** incidents.

- **TP**: If you're able to confirm that the creation activities weren't performed by a legitimate user.

    **Recommended action**: Suspend the user, reset their password, and scan all devices for malicious threats. Review all user activity for other indicators of compromise and explore the scope of impact. In addition, contact the user, confirm their legitimate actions, and then make sure you disable or delete any compromised cloud resources.
- **B-TP**: If, after your investigation, you're able to confirm that the administrator was authorized to perform these creation activities.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review all user activity for other indicators of compromise.
1. Review the resources created and verify that they conform with your organization's policies.

## Persistence alerts

This section describes alerts indicating that a malicious actor might be attempting to maintain their foothold in your organization.

### Activity performed by terminated user

Activity performed by a terminated user can indicate that a terminated employee who still has access to corporate resources is trying to perform a malicious activity. Defender for Cloud Apps profiles users in the organization and triggers an alert when a terminated user performs an activity.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the terminated user still has access to certain corporate resources and is performing activities.

    **Recommended action**: Disable the user.
1. **B-TP**: If you're able to determine that the user was temporarily disabled or was deleted and re-registered.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Cross-reference HR records to confirm that user is terminated.
1. Validate the existence of the Microsoft Entra user account.
    > [!NOTE]
    > If using Microsoft Entra Connect, validate the on-premises Active Directory object and confirm a successful sync cycle.
1. Identify all apps that the terminated user had access to and decommission the accounts.
1. Update decommissioning procedures.

### Suspicious change of CloudTrail logging service

Activities in a single session indicating that, a user performed suspicious changes to the AWS CloudTrail logging service. This can indicate an attempted breach of your organization. When disabling CloudTrail, operational changes are no longer be logged. An attacker can perform malicious activities while avoiding a CloudTrail audit event, such as modifying an S3 bucket from private to public.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**: Suspend the user, reset their password, and reverse the CloudTrail activity.
1. **FP**: If you're able to confirm that the user legitimately disabled the CloudTrail service.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review the activity log for other indicators of compromise and see who made the change to the CloudTrail service.
1. Optional: Create a playbook using Power Automate to contact users and their managers to verify their activity.

### Suspicious email deletion activity (by user)

Activities in a single session indicating that, a user performed suspicious email deletions. The deletion type was the "hard delete" type, which makes the email item deleted and not available in the user's mailbox. The deletion was made from a connection that includes uncommon preferences such as ISP, country/region, and user agent. This can indicate an attempted breach of your organization, such as attackers attempting to mask operations by deleting emails related to spam activities.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.
1. **FP**: If you're able to confirm that the user legitimately created a rule to delete messages.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

- Review all user activity for other indicators of compromise such as the [Suspicious inbox forwarding](#suspicious-inbox-forwarding) alert followed by an [Impossible Travel](#impossible-travel) alert. Look for:

    1. New SMTP forwarding rules, as follows:
        - Check for malicious forwarding rule names. Rule names can vary from simple names, such as "Forward All Emails" and "Auto forward", or deceptive names, such as a barely visible ".". Forwarding rule names can even be empty, and the forwarding recipient can be a single email account or an entire list. Malicious rules can also be hidden from the user interface. Once detected, you can use this helpful [blog post](/archive/blogs/hkong/how-to-delete-corrupted-hidden-inbox-rules-from-a-mailbox-using-mfcmapi) on how to delete hidden rules from mailboxes.
        - If you detect an unrecognized forwarding rule to an unknown internal or external email address, you can assume that the inbox account was compromised.
    1. New inbox rules, such as "delete all", "move messages to another folder", or those with obscure naming conventions, for example "…".
    1. An increase in sent emails.

### Suspicious inbox manipulation rule

Activities indicating that an attacker gained access to a user's inbox and created a suspicious rule. Manipulation rules, such as deleting or moving messages, or folders, from a user's inbox might be an attempt to exfiltrate information from your organization. Similarly, they can indicate an attempt to manipulate information that a user sees or to use their inbox to distribute spam, phishing emails, or malware. Defender for Cloud Apps profiles your environment and triggers alerts when suspicious inbox manipulation rules are detected on a user's inbox. This might indicate that the user's account is compromised.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that a malicious inbox rule was created and the account was compromised.

    **Recommended action**: Suspend the user, reset their password, and remove the forwarding rule.
1. **FP**: If you're able to confirm that a user legitimately created the rule.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review all user activity for other indicators of compromise such as the [Suspicious inbox forwarding](#suspicious-inbox-forwarding) alert followed by an [Impossible Travel](#impossible-travel) alert. Look for:
    - New SMTP forwarding rules.
    - New inbox rules, such as "delete all", "move messages to another folder", or those with obscure naming conventions, for example "…".
1. Collect IP address and location information for the action.
1. Review activities performed from the IP address used to create the rule to detect other compromised users.

## Privilege escalation alerts

This section describes alerts indicating that a malicious actor might be attempting to gain higher-level permissions in your organization.

### Unusual administrative activity (by user)

Activities indicating that an attacker has compromised a user account and performed administrative actions that aren't common for that user. For example, an attacker can try to change a security setting for a user, an operation that is relatively rare for a common user. Defender for Cloud Apps creates a baseline based on the user's behavior and triggers an alert when the unusual behavior is detected.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate administrator.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.
1. **FP**: If you're able to confirm that an administrator legitimately performed the unusual volume of administrative activities.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review all user activity for other indicators of compromise such as [Suspicious inbox forwarding](#suspicious-inbox-forwarding) or [Impossible Travel](#impossible-travel).
1. Review other configuration changes, such as creating a user account that might be used for persistence.

## Credential access alerts

This section describes alerts indicating that a malicious actor might be attempting to steal account names and passwords from your organization.

### Multiple failed login attempts

Failed sign in attempts could indicate on an attempt to breach an account. However, failed logins can also be normal behavior. For example, when a user entered a wrong password by mistake. To achieve accuracy and alert only when there's a strong indication of an attempted breach, Defender for Cloud Apps establishes a baseline of sign in habits for each user in the organization and will only alert when the unusual behavior is detected.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

This policy is based on learning the normal sign in behavior of a user. When a deviation from the norm is detected, an alert is triggered. If the detection begins to see that the same behavior continues, the alert is only raised once.

1. **TP** (MFA fails): If you're able to confirm that MFA is working correctly, this could be a sign of an attempted brute force attack.

    **Recommended actions**:
    1. Suspend the user, mark the user as compromised, and reset their password.
    1. Find the app that performed the failed authentications and reconfigure it.
    1. Look for other users logged in around the time of the activity because they might also be compromised. Suspend the user, mark the user as compromised, and reset their password.
1. **B-TP** (MFA fails): If you're able to confirm that the alert is caused by a problem with MFA.

    **Recommended action**: Create a playbook using Power Automate to contact the user and check if they're having issues with MFA.
1. **B-TP** (Improperly configured app): If you're able to confirm that a misconfigured app is attempting to connect to a service multiple times with expired credentials.

    **Recommended action**: Dismiss the alert.
1. **B-TP** (Password changed): If you're able to confirm that a user recently changed their password, but it hasn't impacted credentials across network shares.

    **Recommended action**: Dismiss the alert.
1. **B-TP** (Security test): If you're able to confirm that a security or penetration test is being conducted by security analysts on behalf of the organization.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review all user activity for other indicators of compromise such as the alert is followed by one of the following alerts: [Impossible Travel](#impossible-travel), [Activity from anonymous IP address](#activity-from-anonymous-ip-address), or [Activity from infrequent country](#activity-from-infrequent-country).
1. Review the following user device information and compare with known device information:
    - Operating system and version
    - Browser and version
    - IP address and location
1. Identify the source IP address or location where the authentication attempt occurred.
1. Identify if the user recently changed their password and ensure all apps and devices have the updated password.

### Unusual addition of credentials to an OAuth app

This detection identifies the suspicious addition of privileged credentials to an OAuth app. This can indicate that an attacker has compromised the app, and is using it for malicious activity.

**Learning period**

Learning your organization's environment requires a period of seven days during which you might expect a high volume of alerts.

### Unusual ISP for an OAuth app

The detection identifies an OAuth app connecting to your cloud application from an ISP that is uncommon for the app. This might indicate that an attacker tried to use a legitimate compromised app to perform malicious activities on your cloud applications.

**Learning period**

The learning period for this detection is 30 days.  

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't a legitimate activity of the OAuth app or that this ISP isn't used by the legitimate OAuth app.

    **Recommended action**: Revoke all the access tokens of the OAuth app and investigate if an attacker has access to generating OAuth access tokens.

1. **FP**: If you can confirm that the activity was made legitimately by the genuine OAuth app.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review the activities performed by the OAuth app.

1. Investigate if an attacker has access to generating OAuth access tokens.

## Collection alerts

This section describes alerts indicating that a malicious actor might be attempting to gather data of interest to their goal from your organization.

### Multiple Power BI report sharing activities

Activities in a single session indicating that a user performed an unusual number of share report activities in Power BI when compared to the baseline learned. This can indicate an attempted breach of your organization.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**: Remove sharing access from Power BI. If you're able to confirm that the account is compromised, then Suspend the user, mark the user as compromised, and reset their password.
1. **FP**: If you're able confirm that the user had a business justification to share these reports.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review the activity log to gain a better understanding of other activities performed by the user. Look at the IP address they're logged in from and the device details.
1. Contact your Power BI team or Information Protection team to understand the guidelines for sharing reports internally and externally.

### Suspicious Power BI report sharing

Activities indicating that a user shared a Power BI report that might contain sensitive information identified using NLP to analyze the metadata of the report. The report was either shared with an external email address, published to the web, or a snapshot was delivered to an externally subscribed email address. This can indicate an attempted breach of your organization.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**: Remove sharing access from Power BI. If you're able to confirm that the account is compromised, then Suspend the user, mark the user as compromised, and reset their password.
1. **FP**: If you're able to confirm that the user had a business justification to share these reports.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review the activity log to gain a better understanding of other activities performed by the user. Look at the IP address they're logged in from and the device details.
1. Contact your Power BI team or Information Protection team to understand the guidelines for sharing reports internally and externally.

### Unusual impersonated activity (by user)

In some software, there are options to allow other users to impersonate other users. For example, email services allow users to authorize other users to send email on their behalf. This activity is commonly used by attackers to create phishing emails in an attempt to extract information about your organization. Defender for Cloud Apps creates a baseline based on the user's behavior and creates an activity when an unusual impersonation activity is detected.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.
1. **FP** (Unusual behavior): If you're able to confirm that the user legitimately performed the unusual activities, or more activities than the established baseline.

    **Recommended action**: Dismiss the alert.
1. **FP**: If you're able to confirm that apps, like Teams, legitimately impersonated the user.

    **Recommended action**: Review the actions and dismiss the alert if need.

**Understand the scope of the breach**

1. Review all user activity and alerts for additional indicators of compromise.
1. Review the impersonation activities to identify potential malicious activities.
1. Review delegated access configuration.

## Exfiltration alerts

This section describes alerts indicating that a malicious actor might be attempting to steal data from your organization.

### Suspicious inbox forwarding

Activities indicating that an attacker gained access to a user's inbox and created a suspicious rule. Manipulation rules, such as forward all or specific emails to another email account might be an attempt to exfiltrate information from your organization. Defender for Cloud Apps profiles your environment and triggers alerts when suspicious inbox manipulation rules are detected on a user's inbox. This might indicate that the user's account is compromised.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that a malicious inbox forwarding rule was created and the account was compromised.

    **Recommended action**: Suspend the user, reset their password, and remove the forwarding rule.
1. **FP**: If you're able to confirm that the user created a forwarding rule to a new or personal external email account for legitimate reasons.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review all user activity for additional indicators of compromise such as the alert is followed by an [Impossible Travel](#impossible-travel) alert. Look for:

    1. New SMTP forwarding rules, as follows:
        - Check for malicious forwarding rule names. Rule names can vary from simple names, such as "Forward All Emails" and "Auto forward", or deceptive names, such as a barely visible ".". Forwarding rule names can even be empty, and the forwarding recipient can be a single email account or an entire list. Malicious rules can also be hidden from the user interface. Once detected, you can use this helpful [blog post](/archive/blogs/hkong/how-to-delete-corrupted-hidden-inbox-rules-from-a-mailbox-using-mfcmapi) on how to delete hidden rules from mailboxes.
        - If you detect an unrecognized forwarding rule to an unknown internal or external email address, you can assume that the inbox account was compromised.
    1. New inbox rules, such as "delete all", "move messages to another folder", or those with obscure naming conventions, for example "…".
1. Review activities performed from the IP address used to create the rule to detect other compromised users.
1. Review the list of forwarded messages using Exchange Online message tracking.

### Unusual file download (by user)

Activities indicating that a user performed an unusual number of file downloads from a cloud storage platform when compared to the baseline learned. This can indicate an attempt to gain information about the organization. Defender for Cloud Apps creates a baseline based on the user's behavior and triggers an alert when the unusual behavior is detected.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.
1. **FP** (Unusual behavior): If you can confirm that the user legitimately performed more file download activities than the established baseline.

    **Recommended action**: Dismiss the alert.
1. **FP** (Software sync): If you're able to confirm that software, such as OneDrive, synced with an external backup that caused the alert.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review the download activities and create a list of downloaded files.
1. Review the sensitivity of the downloaded files with the resource owner and validate the access level.

### Unusual file access (by user)

Activities indicating that a user performed an unusual number of file accesses in SharePoint or OneDrive to files that contain  financial data or network data as compared to the baseline learned. This can indicate an attempt to gain information about the organization, whether for financial purposes or for credential access and lateral movement. Defender for Cloud Apps creates a baseline based on the user's behavior and triggers an alert when the unusual behavior is detected.

**Learning period**

The learning period depends on the user's activity. Generally, the learning period is between 21 and 45 days for most users.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.

1. **FP** (Unusual behavior): If you can confirm that the user legitimately performed more file access activities than the established baseline.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review the access activities and create a list of accessed files.
1. Review the sensitivity of the accessed files with the resource owner and validate the access level.

### Unusual file share activity (by user)

Activities indicating that a user performed an unusual number of file sharing actions from a cloud storage platform when compared to the baseline learned. This can indicate an attempt to gain information about the organization. Defender for Cloud Apps creates a baseline based on the user's behavior and triggers an alert when the unusual behavior is detected.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.
1. **FP** (Unusual behavior): If you're able to confirm that the user legitimately performed more file sharing activities than the established baseline.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review the sharing activities and create a list of shared files.
1. Review the sensitivity of the shared files with the resource owner and validate the access level.
1. Create a file policy for similar documents to detect future sharing of sensitive files.

## Impact alerts

This section describes alerts indicating that a malicious actor might be attempting to manipulate, interrupt, or destroy your systems and data in your organization.

### Multiple delete VM activities

Activities in a single session indicating that a user performed an unusual number of VM deletions when compared to the baseline learned. Multiple VM deletions could indicate an attempt to disrupt or destroy an environment. However, there are many normal scenarios where VMs are deleted.

**TP**, **B-TP**, or **FP**?

To improve accuracy and alert only when there's a strong indication of a breach, this detection establishes a baseline on each environment in the organization to reduce **B-TP** incidents and only alert when the unusual behavior is detected.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

- **TP**: If you're able to confirm that the deletions were unauthorized.

    **Recommended action**: Suspend the user, reset their password, and scan all devices for malicious threats. Review all user activity for other indicators of compromise and explore the scope of impact.
- **B-TP**: If, after your investigation, you're able to confirm that the administrator was authorized to perform these deletion activities.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Contact the user and confirm the activity.
1. Review all user activity for additional indicators of compromise such as the alert is followed by one of the following alerts: [Impossible Travel](#impossible-travel), [Activity from anonymous IP address](#activity-from-anonymous-ip-address), or [Activity from infrequent country](#activity-from-infrequent-country).

### Ransomware activity

Ransomware is a cyberattack in which an attacker locks victims out of their devices or blocks them from accessing their files until the victim pays a ransom. Ransomware can be spread by a malicious shared file or compromised network. Defender for Cloud Apps uses security research expertise, threat intelligence, and learned behavioral patterns to identify ransomware activity. For example, a high rate of file uploads, or files deletions, might represent an encryption process that is common among ransomware operations.

This detection establishes a baseline of the normal working patterns of each user in your organization, such as when the user accesses the cloud and what they commonly do in the cloud.

The Defender for Cloud Apps automated threat detection policies start running in the background from the moment you connect. Using our security research expertise to identify behavioral patterns that reflect ransomware activity in our organization, Defender for Cloud Apps provides comprehensive coverage against sophisticated ransomware attacks.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by the user.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.
1. **FP** (Unusual behavior): The user legitimately performed multiple deletion and upload activities of similar files in a short period of time.

    **Recommended action**: After reviewing the activity log and confirming that the file extensions aren't suspicious, dismiss the alert.
1. **FP** (Common ransomware file extension): If you're able to confirm that the extensions of the affected files are a match for a known ransomware extension.

    **Recommended action**: Contact the user and confirm the files are safe and then dismiss the alert.

**Understand the scope of the breach**

1. Review the activity log for other indicators of compromise such as mass download, or mass deletion, of files.
1. If you're using Microsoft Defender for Endpoint, review the user's computer alerts to see if malicious files were detected.
1. Search the activity log for malicious file upload and sharing activities.

### Unusual file deletion activity (by user)

Activities indicating that a user performed an unusual file deletion activity when compared to the baseline learned. This can indicate ransomware attack. For example, an attacker can encrypt a user's files and delete all the originals, leaving only the encrypted versions that can be used to coerce the victim to pay a ransom. Defender for Cloud Apps creates a baseline based on the user's normal behavior and triggers an alert when the unusual behavior is detected.

**Learning period**

Establishing a new user's activity pattern requires an initial learning period of seven days during which alerts aren't triggered for any new locations.

**TP**, **B-TP**, or **FP**?

1. **TP**: If you're able to confirm that the activity wasn't performed by a legitimate user.

    **Recommended action**: Suspend the user, mark the user as compromised, and reset their password.
1. **FP**: If you're able to confirm that the user legitimately performed more file deletion activities than the established baseline.

    **Recommended action**: Dismiss the alert.

**Understand the scope of the breach**

1. Review the deletion activities and create a list of deleted files. If needed, recover the deleted files.
1. Optionally, create a playbook using Power Automate to contact users and their managers to verify the activity.

### Investigation priority score increase (legacy)

Starting November 2024, **Investigate risky users** support for Microsoft Defender for Cloud Apps is retired. If this feature was used in your organization and is needed, we recommend using the Entra risk score feature. Please use the following resources for additional information:

- [Investigate risk Microsoft Entra ID Protection - Microsoft Entra ID Protection | Microsoft Learn](/entra/id-protection/howto-identity-protection-investigate-risk)

- [Microsoft Entra ID Protection risk-based access policies - Microsoft Entra ID Protection | Microsoft Learn](/entra/id-protection/concept-identity-protection-policies)


## See also

> [!div class="nextstepaction"]
> [Investigate risky users](tutorial-ueba.md)
