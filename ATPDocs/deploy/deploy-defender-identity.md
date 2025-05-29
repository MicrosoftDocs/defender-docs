---
title: Microsoft Defender for Identity Deployment Overview
description: Learn how to deploy Microsoft Defender for Identity from the Microsoft Defender portal.
ms.date: 05/13/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity deployment overview

This article provides an overview of the deployment process for Microsoft Defender for Identity.

Defender for Identity is a primary component of a [Zero Trust](/security/zero-trust/zero-trust-overview) strategy. It's part of your Identity Threat Detection and Response (ITDR) or extended detection and response (XDR) deployment with Microsoft Defender XDR. Defender for Identity uses signals from your Identity Infrastructure servers such as:
- Domain controllers
- Active Directory
- Active Directory Federation Services (AD FS)
- Active Directory Certification Services (AD CS)
- Microsoft Entra Connects servers.

Defender for Identity uses these signals to detect threats like privilege escalation or high-risk lateral movement, and reports on easily exploited identity issues like unconstrained Kerberos delegation, for correction by the security team.

We recommend that you install Defender for Identity sensors on all domain controllers, including read-only domain controllers (RODC). If you're installing on an AD FS / AD CS / Microsoft Entra connect farm or cluster, we recommend installing the sensor on each AD FS / AD CS / Microsoft Entra Connect server.

> [!IMPORTANT]
> Defenders for Identity data centers are deployed in Europe, UK, Switzerland, North America/Central America/Caribbean, Australia East, Asia, and India. Your workspace (instance) is created automatically in the Azure region closest to the geographical location of your Microsoft Entra tenant. Once created, Defender for Identity workspaces aren't moveable.

## Microsoft Defender for Identity sensors
Defender for Identity uses two types of sensors to collect data from your identity infrastructure:

- **Defender for Identity sensor**: This is the original Defender for Identity sensor. It's designed to be installed on domain controllers, AD FS, AD CS, and Microsoft Entra Connect servers. The Defender for Identity sensor collects data from the network and Windows events.
- **Defender for XDR sensor (Preview)**: The Defender for XDR sensor is designed to be installed on domain controllers running Windows Server 2019 or later. This sensor is integrated directly into the Windows operating system, without the need for another agent. The sensor doesn't require a .NET framework to be installed on the Operating System. This sensor enables new onboarding and activation capabilities and closer integration between Defender for Identity and Defender for Endpoint. 
 
> [!IMPORTANT]
> The Defender for XDR sensor (preview) is recommended for customers who want to deploy core identity protections to new domain controllers running Windows Server 2019 or later. For all other identity infrastructure, or for customers who want to deploy the most robust identity protections available from Microsoft Defender for Identity today, we recommend deploying the Defender for Identity sensor. [Learn more about the Defender for XDR sensor](/defender-for-identity/deploy/activate-capabilities).

## Deployment process

Watch the following video for a step-by-step demo and to learn about:

- How Defender for Identity sensors protect your organization against identity-based attacks.
- How to download and install the sensor.
- How to find potential sensor and configuration health issues.
- How to view identity-related posture assessments in a Microsoft Secure Score.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=de930a92-f552-4c09-92dc-1ab03c2e1131]

The following procedures help you complete the deployment process:

1. [**Prepare your environment**](prerequisites.md).
1. [**Plan your capacity**](capacity-planning.md).
1. [**Set up roles and permissions**](../role-groups.md) on the [Groups management page](https://aad.portal.azure.com/#blade/Microsoft_AAD_IAM/GroupsManagementMenuBlade/AllGroups) in the Azure portal.
1. **Install a sensor on a domain controller.** Depending on your environment, either install the Microsoft Defender for Identity sensor or use the Microsoft XDR sensor. For more information, see:
   - [Install a Microsoft Defender for Identity sensor on a domain controller](configure-proxy.md).
   - [Install a Microsoft XDR sensor (preview) on a domain controller](activate-capabilities.md).
- **[Install a Defender for Identity sensor for AD FS, AD CS, and Microsoft Entra Connect](active-directory-federation-services.md)**.
- **Configure Windows event collection**. For more information, see [Event collection with Microsoft Defender for Identity](event-collection-overview.md) and [Configure audit policies for Windows event logs](configure-windows-event-collection.md).
- [**Configure a Directory Service account (DSA) for use with Defender for Identity**](directory-service-accounts.md). While a DSA is optional in some scenarios, we recommend that you configure a DSA for Defender for Identity for full security coverage. For example, when you have a DSA configured, the DSA is used to connect to the domain controller at startup. A DSA can also be used to query the domain controller for data on entities seen in network traffic, monitored events, and monitored ETW activities.
- [**Configure remote calls to SAM**](remote-calls-sam.md) as needed. While this step is optional, we recommend that you configure remote calls to SAM-R for lateral movement path detection with Defender for Identity.

## Start using Microsoft Defender for Identity in the Defender portal

This section describes how to start onboarding to Defender for Identity.

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com). 
1. From the navigation menu, select any item, such as **Incidents & alerts**, **Hunting**, **Action center**, or **Threat analytics** to initiate the onboarding process.

You see the option to deploy supported services, including Microsoft Defender for Identity. When you open the Defender for Identity settings page, the required cloud components are added automatically.

For more information, see:

- [Microsoft Defender for Identity in Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-security-center-mdi?bc=/defender-for-identity/breadcrumb/toc.json&toc=/defender-for-identity/TOC.json)
- [Get started with Microsoft Defender XDR](/microsoft-365/security/defender/get-started)
- [Turn on Microsoft Defender XDR](/microsoft-365/security/defender/m365d-enable)
- [Deploy supported services](/microsoft-365/security/defender/deploy-supported-services)
- [Frequently asked questions when turning on Microsoft Defender XDR](/microsoft-365/security/defender/m365d-enable-faq)

## Next step

 - For deploying on multiple domain controllers, we recommend using the [silent installation](install-sensor.md#perform-a-defender-for-identity-silent-installation) instead.


