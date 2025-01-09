---
title: Best practices for protecting your organization 
description: This article provides a set of best practices for protecting your organization.
ms.date: 02/19/2023
ms.topic: quickstart
---
# Best practices for protecting your organization with Defender for Cloud Apps



This article provides best practices for protecting your organization by using Microsoft Defender for Cloud Apps. These best practices come from our experience with Defender for Cloud Apps and the experiences of customers like you.

The best practices discussed in this article include:

> [!div class="checklist"]
>
> * [Discover and assess cloud apps](#discover-and-assess-cloud-apps)
> * [Apply cloud governance policies](#apply-cloud-governance-policies)
> * [Limit exposure of shared data and enforce collaboration policies](#limit-exposure-of-shared-data-and-enforce-collaboration-policies)
> * [Discover, classify, label, and protect regulated and sensitive data stored in the cloud](#discover-classify-label-and-protect-regulated-and-sensitive-data-stored-in-the-cloud)
> * [Enforce DLP and compliance policies for data stored in the cloud](#enforce-dlp-and-compliance-policies-for-data-stored-in-the-cloud)
> * [Block and protect download of sensitive data to unmanaged or risky devices](#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices)
> * [Secure collaboration with external users by enforcing real-time session controls](#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls)
> * [Detect cloud threats, compromised accounts, malicious insiders, and ransomware](#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
> * [Use the audit trail of activities for forensic investigations](#use-the-audit-trail-of-activities-for-forensic-investigations)
> * [Secure IaaS services and custom apps](#secure-iaas-services-and-custom-apps)

## Discover and assess cloud apps

Integrating Defender for Cloud Apps with Microsoft Defender for Endpoint gives you the ability to use cloud discovery beyond your corporate network or secure web gateways. With the combined user and device information, you can identify risky users or devices, see what apps they are using, and investigate further in the Defender for Endpoint portal.

**Best practice**: Enable Shadow IT Discovery using Defender for Endpoint  
**Detail**: Cloud discovery analyzes traffic logs collected by Defender for Endpoint and assesses identified apps against the cloud app catalog to provide compliance and security information. By configuring cloud discovery, you gain visibility into cloud use, Shadow IT, and continuous monitoring of the unsanctioned apps being used by your users.  
**For more information**:

* [Microsoft Defender for Endpoint integration with Defender for Cloud Apps](mde-integration.md)
* [Set up cloud discovery](set-up-cloud-discovery.md)
* [Discover and manage shadow IT in your network](tutorial-shadow-it.md)

---

**Best practice**: Configure App Discovery policies to proactively identify risky, non-compliant, and trending apps  
**Details**: App Discovery policies make it easier to track of the significant discovered applications in your organization to help you manage these applications efficiently. Create policies to receive alerts when detecting new apps that are identified as either risky, non-compliant, trending, or high-volume.  
**For more information**:

* [Cloud discovery policies](cloud-discovery-policies.md)
* [Cloud discovery anomaly detection policy](cloud-discovery-anomaly-detection-policy.md)
* [Get instantaneous behavioral analytics and anomaly detection](anomaly-detection-policy.md)

---

**Best practice**: Manage OAuth apps that are authorized by your users  
**Detail**: Many users casually grant OAuth permissions to third-party apps to access their account information and, in doing so, inadvertently also give access to their data in other cloud apps. Usually, IT has no visibility into these apps making it difficult to weigh the security risk of an app against the productivity benefit that it provides.

Defender for Cloud Apps provides you with the ability to investigate and monitor the app permissions your users granted. You can use this information to identify a potentially suspicious app and, if you determine that it is risky, you can ban access to it.  
**For more information**:

* [Manage OAuth apps](manage-app-permissions.md)
* [OAuth app policies](app-permission-policy.md)

---
---
---
---

## Apply cloud governance policies

**Best practice**: Tag apps and export block scripts  
**Detail**: After you've reviewed the list of discovered apps in your organization, you can secure your environment against unwanted app use. You can apply the **Sanctioned** tag to apps that are approved by your organization and the **Unsanctioned** tag to apps that are not. You can monitor unsanctioned apps using discovery filters or export a script to block unsanctioned apps using your on-premises security appliances. Using tags and export scripts allows you to organize your apps and protect your environment by only allow safe apps to be accessed.  
**For more information**:

* [Govern discovered apps](governance-discovery.md)

---

## Limit exposure of shared data and enforce collaboration policies

**Best practice**: Connect Microsoft 365  
**Detail**: Connecting Microsoft 365 to Defender for Cloud Apps gives you immediate visibility into your users' activities, files they are accessing, and provides governance actions for Microsoft 365, SharePoint, OneDrive, Teams, Power BI, Exchange, and Dynamics.  
**For more information**:

* [Connect apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md)
* [Connect Microsoft 365 to Microsoft Defender for Cloud Apps](./connect-office-365.md)

---

**Best practice**: Connect your apps  
**Detail**: Connecting your apps to Defender for Cloud Apps gives you improved insights into your users' activities, threat detection, and governance capabilities. To see which  third-party app APIs are supported, go to [Connect apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

**For more information**:

* [Connect apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md)

---

**Best practice**: Create policies to remove sharing with personal accounts  
**Detail**: Connecting Microsoft 365 to Defender for Cloud Apps gives you immediate visibility into your users' activities, files they are accessing, and provides governance actions for Microsoft 365, SharePoint, OneDrive, Teams, Power BI, Exchange, and Dynamics.  
**For more information**:

* [Governing connected apps](governance-actions.md)

---

## Discover, classify, label, and protect regulated and sensitive data stored in the cloud

**Best practice**: Integrate with Microsoft Purview Information Protection  
**Detail**: Integrating with Microsoft Purview Information Protection gives you the capability to automatically apply sensitivity labels and optionally add encryption protection. Once the integration is turned on, you can apply labels as a governance action, view files by classification, investigate files by classification level, and create granular policies to make sure classified files are being handled properly. If you do not turn on the integration, you cannot benefit from the ability to automatically scan, label, and encrypt files in the cloud.  
**For more information**:

* [Microsoft Purview Information Protection integration](azip-integration.md)
* [Tutorial: Automatically apply sensitivity labels from Microsoft Purview Information Protection](use-case-information-protection.md)

---

**Best practice**: Create data exposure policies  
**Detail**: Use file policies to detect information sharing and scan for confidential information in your cloud apps. Create the following file policies to alert you when data exposures are detected:

* Files shared externally containing sensitive data
* Files shared externally and labeled as **Confidential**
* Files shared with unauthorized domains
* Protect sensitive files on SaaS apps

**For more information**:

* [Content inspection](content-inspection.md)
* [File policies](data-protection-policies.md)
* [Information protection policies](policies-information-protection.md)

---

**Best practice**: Review reports in the **Files** page  
**Detail**: Once you've connected various SaaS apps using app connectors, Defender for Cloud Apps scans files stored by these apps. In addition, each time a file is modified it is scanned again. You can use the **Files** page to understand and investigate the types of data being stored in your cloud apps. To help you investigate, you can filter by domains, groups, users, creation date, extension, file name and type, file ID, sensitivity label, and more. Using these filters puts you in control of how you choose to investigate files to make sure none of your data is at risk. Once you have a better understanding of how your data is being used, you can create policies to scan for sensitive content in these files.  
**For more information**:

* [Connect apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md)
* [File filters](file-filters.md)
* [Content inspection](content-inspection.md)

---
---
---
---

## Enforce DLP and compliance policies for data stored in the cloud

**Best practice**: Protect confidential data from being shared with external users  
**Detail**: Create a file policy that detects when a user tries to share a file with the **Confidential** sensitivity label with someone external to your organization, and configure its governance action to remove external users. This policy ensures your confidential data doesn't leave your organization and external users cannot gain access to it.  
**For more information**:

* [Governing connected apps](governance-actions.md)

---
---
---
---

## Block and protect download of sensitive data to unmanaged or risky devices

**Best practice**: Manage and control access to high risk devices  
**Detail**: Use conditional access app control to set controls on your SaaS apps. You can create session policies to monitor your high risk, low trust sessions. Similarly, you can create session policies to block and protect downloads by users trying to access sensitive data from unmanaged or risky devices. If you don't create session policies to monitor high-risk sessions, you'll lose the ability to block and protect downloads in the web client, as well as the ability to monitor low-trust session both in Microsoft and third-party apps.  
**For more information**:

* [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md)
* [Session policies](session-policy-aad.md)

---
---
---
---

## Secure collaboration with external users by enforcing real-time session controls

**Best practice**: Monitor sessions with external users using conditional access app control  
**Detail**: To secure collaboration in your environment, you can create a session policy to monitor sessions between your internal and external users. This not only gives you the ability to monitor the session between your users (and notify them that their session activities are being monitored), but it also enables you to limit specific activities as well. When creating session policies to monitor activity, you can choose the apps and users you'd like to monitor.  
**For more information**:

* [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md)
* [Session policies](session-policy-aad.md)

---
---
---
---

## Detect cloud threats, compromised accounts, malicious insiders, and ransomware

**Best practice**: Tune Anomaly policies, set IP ranges, send feedback for alerts  
**Detail**: Anomaly detection policies provide out-of-the-box user and entity behavioral analytics (UEBA) and machine learning (ML) so that you can immediately run advanced threat detection across your cloud environment.

Anomaly detection policies are triggered when there are unusual activities performed by the users in your environment. Defender for Cloud Apps continually monitors your users' activities and uses UEBA and ML to learn and understand the *normal* behavior of your users. You can tune policy settings to fit your organizations requirements, for example, you can set the sensitivity of a policy, as well as scope a policy to a specific group.

* **Tune and Scope Anomaly Detection Policies**: As an example, to reduce the number of false positives within the impossible travel alert, you can set the policy's sensitivity slider to low. If you have users in your organization that are frequent corporate travelers, you can add them to a user group and select that group in the scope of the policy.

* **Set IP Ranges**: Defender for Cloud Apps can identify known IP addresses once IP address ranges are set. With IP address ranges configured, you can tag, categorize, and customize the way logs and alerts are displayed and investigated. Adding IP address ranges helps to reduce false positive detections and improve the accuracy of alerts. If you choose not to add your IP addresses, you may see an increased number of possible false positives and alerts to investigate.

* **Send Feedback for alerts**

    When dismissing or resolving alerts, make sure to send feedback with the reason you dismissed the alert or how it's been resolved. This information assists Defender for Cloud Apps to improve our alerts and reduce false positives.

**For more information**:

* [Get instantaneous behavioral analytics and anomaly detection](anomaly-detection-policy.md)
* [Working with IP ranges and tags](ip-tags.md)


---

**Best practice**: Detect activity from unexpected locations or countries/regions  
**Detail**: Create an activity policy to notify you when users sign in from unexpected locations or countries/regions. These notifications can alert you to possibly compromised sessions in your environment so that you can detect and remediate threats before they occur.  
**For more information**:

* [Threat protection policies](policies-threat-protection.md)

---

**Best practice**: Create OAuth app policies  
**Detail**: Create an OAuth app policy to notify you when an OAuth app meets certain criteria. For example, you can choose to be notified when a specific app that requires a high permission level was accessed by more than 100 users.  
**For more information**:

* [OAuth app policies](app-permission-policy.md)

---
---
---
---

## Use the audit trail of activities for forensic investigations

**Best practice**: Use the audit trail of activities when investigating alerts  
**Detail**: Alerts are triggered when user, admin, or sign-in activities don't comply with your policies. It is important to investigate alerts to understand if there is a possible threat in your environment.

You can investigate an alert by selecting it on the **Alerts** page and reviewing the audit trail of activities relating to that alert. The audit trail gives you visibility into activities of the same type, same user, same IP address and location, to provide you with the overall story of an alert. If an alert warrants further investigation, create a plan to resolve these alerts in your organization.

When dismissing alerts, it's important to investigate and understand why they are of no importance or if they are false positives. If there is a high volume of such activities, you may also want to consider reviewing and tuning the policy triggering the alert.  
**For more information**:

* [Activities](activity-filters.md)

---
---
---
---

## Secure IaaS services and custom apps

**Best practice**: Connect Azure, AWS and GCP  
**Detail**: Connecting each of these cloud platforms to Defender for Cloud Apps helps you improve your threat detections capabilities. By monitoring administrative and sign-in activities for these services, you can detect and be notified about possible brute force attack, malicious use of a privileged user account, and other threats in your environment. For example, you can identify risks such as unusual deletions of VMs, or even impersonation activities in these apps.  
**For more information**:

- [Connect Azure to Microsoft Defender for Cloud Apps](protect-azure.md#connect-azure-to-microsoft-defender-for-cloud-apps)
- [Connect Amazon Web Services to Microsoft Defender for Cloud Apps](protect-aws.md#connect-amazon-web-services-to-microsoft-defender-for-cloud-apps)
- [Connect Google Workspace to Microsoft Defender for Cloud Apps](protect-google-workspace.md#connect-google-workspace-to-microsoft-defender-for-cloud-apps)

---

**Best practice**: Onboard custom apps  
**Detail**: To gain additional visibility into activities from your line-of-business apps, you can onboard custom apps to Defender for Cloud Apps. Once custom apps are configured, you see information about who's using them, the IP addresses they are being used from, and how much traffic is coming into and out of the app.

Additionally, you can onboard a custom app as a conditional access app control app to monitor their low-trust sessions. Microsoft Entra ID apps are automatically onboarded.

**For more information**:

- [Add custom apps to cloud discovery](cloud-discovery-custom-apps.md)
- [Onboard non-Microsoft IdP catalog apps for Conditional Access app control](proxy-deployment-featured-idp.md)
- [Onboard non-Microsoft IdP custom apps for Conditional Access app control](proxy-deployment-any-app-idp.md)