---
title: App governance in Microsoft Defender for Cloud Apps and Microsoft Defender XDR
ms.date: 01/23/2024
ms.topic: conceptual
description: Implement Microsoft app governance capabilities over Microsoft Defender for Cloud Apps and Microsoft Defender XDR to govern your apps.
---

# App governance in Microsoft Defender for Cloud Apps

Cyber attacks have become increasingly sophisticated in the ways they exploit the apps you have deployed in your on-premises and cloud infrastructure, establishing a starting point for privilege escalation, lateral movement, and data exfiltration.

To understand the potential risks and stop these types of attacks, you need to gain clear visibility into your organization’s app compliance posture. You need to be able to quickly identify when an app exhibits anomalous behaviors and respond when these behaviors present risks to your environment, data, and users. <br><br>

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=ed7ad7f7-58dc-4a09-ace3-e1d6b8f55353]

## App governance features

App governance in Defender for Cloud Apps is a set of security and policy management capabilities designed for OAuth-enabled apps registered on Microsoft Entra ID, Google, and Salesforce. App governance delivers visibility, remediation, and governance into how these apps and their users access, use, and share sensitive data in Microsoft 365 and other cloud platforms through actionable insights and automated policy alerts and actions.

App governance also enables you to see which user-installed OAuth applications have access to data on Microsoft 365, Google Workspace, and Salesforce. It tells you what permissions the apps have and which users have granted access to their accounts.

App governance insights enable you to make informed decisions around blocking or restricting apps that present significant risk to your organization. For example:

- **Insights**: See a view of all non-Microsoft apps registered to Microsoft Entra ID, Google, or Salesforce in your organization on a single dashboard. You can see the status of apps and their activities, and react or respond to them.

- **Governance**: Create proactive or reactive policies for app and user patterns and behaviors and protect your users from using noncompliant or malicious apps and limiting the access of risky apps to your data.

- **Detection**: Be alerted and notified when there are anomalies in app activity and when noncompliant, malicious, or risky apps are used.

- **Remediation**: Along with automatic remediation capabilities, use remediation controls in a timely manner to respond to anomalous app activity detections.

## Share data across Microsoft services

View app governance data together with other Defender for Cloud Apps data and Microsoft Entra data to aggregate information and jump between views.

For example:

- On the **App governance** page, view aggregated sign-in activity for each app. Select an app to view details in a side pane, and select **View in Azure AD** to view more details in the Microsoft Entra admin center.

- On other **Cloud apps** pages in Microsoft Defender XDR, view API usage levels and aggregate data transfer. From there, select links to go to the app governance **OAuth apps** page for more details.

App governance alerts show up in the Microsoft Defender XDR alerts list as alerts with the **Detection source** field set to *App Governance*.

## Next steps

View the **App governance > Overview** tab in the [Microsoft Defender Portal](https://aka.ms/appgovernance). Your sign-in account must have one of the [administrator roles](app-governance-get-started.md#roles) to view any app governance data.

For more information, see [Turn on app governance for Microsoft Defender for Cloud Apps](app-governance-get-started.md).

**Training**:

- [Defender for Cloud apps Ninja training](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/microsoft-defender-for-cloud-apps-ninja-training-june-2022/ba-p/2751518)

**Blogs**:

- [Microsoft shifts to a comprehensive SaaS security solution - Microsoft Security Blog](https://www.microsoft.com/en-us/security/blog/2023/02/15/microsoft-shifts-to-a-comprehensive-saas-security-solution/)

- [Improve your app posture and hygiene using Microsoft Defender for Cloud Apps](https://techcommunity.microsoft.com/t5/microsoft-defender-xdr-blog/improve-your-app-posture-and-hygiene-using-microsoft-defender/ba-p/3742361)

**Videos**:

- [App governance video playlist](https://youtube.com/playlist?list=PLyhj1WZ29G66k4F_OZeMkQymRGyqHwZVp)

- [Microsoft Mechanics Video on app governance](https://www.youtube.com/watch?v=KmE8LW_tJ1M).

- [App Governance is a Key Part of a Customers' Zero Trust Journey - YouTube](https://www.youtube.com/watch?v=XuGZu8ja134)
