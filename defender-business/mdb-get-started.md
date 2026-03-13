---
title: Visit the Microsoft Defender portal
description: Your security center in Defender for Business is the Microsoft Defender portal. Learn how to navigate the portal, and see your next steps.
search.appverid: MET150
author: chrisda
ms.author: chrisda
manager: bagol
audience: Admin
ms.topic: get-started
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 07/03/2024
ms.reviewer: nehabha
f1.keywords: NOCSH
ms.collection:
- SMB
- m365-security
- m365-initiative-defender-business
- tier1
- essentials-get-started
ms.custom: intro-get-started
#customer intent: As a Defender for Business admin, I need quick guidance to navigate the Microsoft Defender portal and find first steps so I can get started securing devices and email.
---

# Visit the Microsoft Defender portal

The Microsoft Defender portal at <https://security.microsoft.com> is your one-stop shop for using and managing Microsoft Defender for Business. The Defender portal includes callouts to help you get started, cards that surface relevant information, and a navigation bar to give you easy access to various features and capabilities.

:::image type="content" source="media/defender-portal-home.png" alt-text="Screenshot of the Microsoft Defender portal.":::

## The navigation bar

Use the navigation bar on the left side of the screen to access your incidents, view reports, and manage your security policies. The following table describes items you see in the navigation bar.

|Item|Description|
|---|---|
|**Home**|The home page in the Microsoft Defender portal. The home page highlights any active threats that are detected, along with recommendations to help secure your company's data and devices. Recommendations based on industry best practices are included in Defender for Business to save your security team time and effort. For more information, see [Security recommendations - Microsoft Defender Vulnerability Management](/defender-vulnerability-management/tvm-security-recommendation).|
|**Incidents & alerts** \> **Incidents**|A list of recent incidents. Incidents are created as alerts are triggered. An incident can include multiple alerts. Be sure to review your incidents regularly. For more information, see [View and manage incidents in Defender for Business](mdb-view-manage-incidents.md).|
|**Actions & submissions** \> **Action center**|A list of response actions, including completed and pending actions. <ul><li>Select the **Pending** tab to view actions that require approval to proceed.</li><li>Select the **History** tab to see the actions that were taken. Some actions are taken automatically; others are taken manually or complete after they're approved.</li.></ul> <br/><br/> For more information, see [Review remediation actions in the Action center](mdb-review-remediation-actions.md).|
|**Actions & submissions** \> **Submissions**|The **Submissions** page where you can submit files to Microsoft for analysis. For more information, see [Submit files in Microsoft Defender for Endpoint](/defender-endpoint/admin-submissions-mde) (the process is similar for Defender for Business).|
|**Learning hub**|Security training and other resources are available online at [learn.microsoft.com](https://go.microsoft.com/fwlink/p/?linkid=2273118). You can filter by product, skill level, role, and more. The Learning hub can help your security team ramp up on security features and capabilities in Defender for Business and other Microsoft offerings. For example, [Microsoft Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) and [Microsoft Defender for Office 365](/defender-office-365/mdo-about).|
|**Trials**|Try other security and compliance capabilities by adding on a trial subscription. If you don't see **Trials** in your navigation bar, and you want to add on another trial, you can take one of the following steps: <ul><li>Visit the [Small Business Solutions page](https://www.microsoft.com/store/b/business?icid=CNavBusinessStore), and select **Chat now** in the **Can we help you?** dialog to get help adding on a trial subscription.</li><li>Go to the **Purchase services** page in the Microsoft 365 admin center at <https://admin.microsoft.com/Adminportal/Home?source=applauncher#/catalog>, and the use the **Search** box to look for **Trial**. If you need help, select **Help & support**.</li></ul>|
|**Partner catalog**|Lists Microsoft partners who provide technical and professional services.|
|**Assets** \> **Devices**|Device inventory view, where you can view devices, such as computers and mobile devices that are enrolled in [Microsoft Intune](/intune/intune-service/fundamentals/what-is-intune). If no devices are onboarded yet, you can select **Onboard devices** to get started. For more information, see [Onboard devices to Microsoft Defender for Business](mdb-onboard-devices.md).|
|**Endpoints** \> **Vulnerability management**|Access your [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management) capabilities. Provides a dashboard, recommendations, remediation activities, a software inventory, and a list of potential weaknesses within your company.|
|**Endpoints** \> **Configuration management** \> **Device configuration**|Lists your security policies by operating system and by type. For more information about your security policies, see [View or edit policies in Defender for Business](mdb-view-edit-create-policies.md).|
|**Email & collaboration** \> **Policies & rules**|This section isn't available in the standalone version of Defender for Business. <br/><br/> If your subscription includes the [the built-in security features for all cloud mailboxes](/defender-office-365/eop-about) or Microsoft Defender for Office 365, this section is where you manage your threat policies and settings for email and collaboration services. [Learn more about Office 365 security](/defender-office-365/mdo-about). <br/><br/> Microsoft 365 Business Premium includes the built-in security features for all cloud mailboxes and Defender for Office 365 Plan 1.|
|**Reports**|Available security reports. These reports enable you to see your security trends, view details about threat detections and alerts, and learn more about your company's vulnerable devices.|
|**Health**|View your service health status and plan for upcoming changes. <ul><li>Select **Service health** to view the health status of the Microsoft 365 services that are included in your company's subscription.</li><li>Select **Message center** to learn about planned changes and what to expect.</li></ul>|
|**Permissions**|Assign permissions to the people in your company: <ul><li>Manage security and view incidents and reports in the Microsoft Defender portal.</li><li>Set up and manage device groups to onboard devices and assign threat protection policies.</li></ul>|
|**Settings**|Edit settings for the Microsoft Defender portal and Defender for Business. For example, you can onboard (or offboard) your company's devices (also referred to as endpoints). You can also define rules, such as alert-suppression rules, and set up indicators to block or allow certain files or processes.|
|**More resources**|Navigate to other portals, such as Microsoft Entra ID. But keep in mind that the Microsoft Defender portal should meet your needs without requiring you to navigate to other portals.|
|**Customize your navigation pane**|Select this option to hide or display options in your navigation bar.|

## Next steps

- [See the overall setup and configuration process](mdb-setup-configuration.md)
