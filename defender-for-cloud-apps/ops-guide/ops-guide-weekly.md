---
title: Weekly operational guide - Microsoft Defender for Cloud Apps
description: This article provides weekly operational recommendations to help security operations teams to plan and run security activities.
ms.date: 11/28/2023
ms.topic: reference
---

# Weekly operational guide - Microsoft Defender for Cloud Apps

This article lists weekly operational activities that we recommend you perform with Microsoft Defender for Cloud Apps.

## Review SaaS security posture management

**Where**: In the Microsoft Defender XDR Portal, select **Secure Score**.

**Persona**: Security and Compliance administrators, SOC analysts

SaaS Security Posture Management (SSPM) capabilities in Microsoft Defender for Cloud Apps enable you to get deeper visibility, automatically identify SaaS app misconfigurations, and help you remediate those misconfigurations to improve your organizational security. 

Defender for Cloud Apps SSPM features are integrated into Microsoft Defender XDR so that security teams can see their holistic security posture across the enterprise with Microsoft Secure Score.

To view Secure Score recommendations per product, in Microsoft Defender XDR, select **Secure Score** > **Recommended actions**, and group the list by **Product**.

## Check app connectors, log collectors, and SIEM agent health

**Where**: In the Microsoft Defender XDR Portal, select **Settings > Cloud apps**.

**Persona**: Security and Compliance administrators, SOC analysts

System alerts are raised when a connector, agent, or log collector fails and it's impossible to send a notification to a Defender for Cloud Apps administrator. We recommend checking for system alerts regularly to monitor the health of your app connectors, log collectors, and SIEM agents.

If you're using a SIEM agent, system alerts can be sent directly to your SIEM system. In Microsoft Defender XDR, select **Settings > Cloud apps > System > SIEM Agents**, and [configure your SIEM agent](../siem.md). In the **Data Types** section, select **Alerts**, and make sure the **Alert type filter** contains system alerts.

We also recommend reviewing the following settings to ensure that they're correct and up to date:

|Status to check  |Where to check in Microsoft Defender XDR  |
|---------|---------|
|**App connectors**     |  **Settings > Cloud apps > Connected apps > App Connectors**       |
|**Conditional Access App Control apps**     |  **Settings > Cloud apps > Connected apps > Conditional Access App Control apps**       |
|**Automatic log upload**     | **Settings > Cloud apps > Cloud Discovery > Automatic log upload**        |
|**API tokens**     |  **Settings > Cloud apps > System > API tokens**       |

For more information, see:

- [Connect apps to get visibility and control with Microsoft Defender for Cloud Apps](../enable-instant-visibility-protection-and-governance-actions-for-your-apps.md)
- [Protect apps with Microsoft Defender for Cloud Apps conditional access app control](../proxy-intro-aad.md)
- [Configure automatic log upload for continuous reports](../discovery-docker.md)
- [Managing API tokens](../api-authentication.md)

## Track new changes in Microsoft Defender XDR

**Where**: In the Microsoft 365 admin center, select **Health > Message center**

**Persona**: Security administrators

The Microsoft 365 **Message center** helps you to keep track of upcoming changes, including new features, planned maintenance, or other important announcements that might affect your Defender for Cloud Apps environment.

For more information, see [Track new and changed features in the Microsoft 365 Message center](/microsoft-365/admin/manage/message-center).

## Review the governance log

**Where**: In the Microsoft Defender XDR Portal, under **Cloud apps**, select **Governance log**.

**Persona**: Security and Compliance administrators

The Governance log provides a status record of each task that you configure Defender for Cloud Apps to run, including both manual and automatic tasks. These tasks include tasks configured in policies, governance actions that you set on files and users, and any other action you set Defender for Cloud Apps to take.

For more information, see [Governing connected apps](../governance-actions.md).

## Related content

[Microsoft Defender for Cloud Apps operational guide](ops-guide.md)
