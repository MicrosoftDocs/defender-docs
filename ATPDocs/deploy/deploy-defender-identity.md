---
title: Microsoft Defender for Identity Deployment Overview
description: Learn how to deploy Microsoft Defender for Identity from the Microsoft Defender portal.
ms.date: 05/13/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity deployment overview

This article explains the Microsoft Defender for Identity deployment process.

Defender for Identity uses sensors to detect signals from your Identity Infrastructure servers such as:
- Domain controllers
- Active Directory
- Active Directory Federation Services (AD FS)
- Active Directory Certification Services (AD CS)
- Microsoft Entra Connect servers

Defender for Identity uses these signals to detect threats like privilege escalation or high-risk lateral movement and reports on easily exploited identity issues like unconstrained Kerberos delegation for correction by the security team.

We recommend installing Defender for Identity sensors on all domain controllers, including read-only domain controllers (RODCs). If you're deploying in a Microsoft AD FS, AD CS, or Microsoft Entra Connect farm or cluster, install the sensor on each server in the farm or cluster.

Defender for Identity data centers are located in Europe, the UK, Switzerland, North America, Central America, the Caribbean, Australia East, Asia, and India. Your workspace instance is automatically created in the Azure region closest to the geographical location of your Microsoft Entra tenant. Once created, Defender for Identity workspaces can't be moved.

## Microsoft Defender for Identity sensors
Defender for Identity uses two types of sensors to collect data from your identity infrastructure:

- **Defender for Identity sensor**: The original Defender for Identity sensor is designed for domain controllers, AD FS, AD CS, and Microsoft Entra Connect servers. The Defender for Identity sensor collects data from the network and Windows events.
- **The Windows Server sensor (Preview)**: You can activate the Windows Server sensor on domain controllers running Windows Server 2019 or later. This sensor is integrated directly into the Windows operating system, without the need for another agent. The sensor doesn't require a .NET framework to be installed on the Operating System. This sensor enables new onboarding and activation capabilities and closer integration between Defender for Identity and Defender for Endpoint. 

> [!NOTE]
> We recommend the Windows server sensor for customers who want to deploy core identity protections to new domain controllers running Windows Server 2019 or later. For all other identity infrastructures, or for customers who want to deploy the most robust identity protections available from Microsoft Defender for Identity today, we recommend deploying the Defender for Identity sensor. [Learn more about the Defender for XDR sensor](/defender-for-identity/deploy/activate-capabilities).

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
1. [**Set up roles and permissions**](../role-groups.md).
1. **Install a sensor**. Depending on your environment, either install the Microsoft Defender for Identity sensor or activate the Windows Server sensor.
    For more information, see:
    - [Activate a Windows Server sensor (preview) on a domain controller](activate-capabilities.md).
    - [Install a Defender for Identity sensor for AD FS, AD CS, and Microsoft Entra Connect](active-directory-federation-services.md).
1. [**Configure Windows event collection**](event-collection-overview.md).
1. (Optional).[**Configure a Directory Service account (DSA)**](directory-service-accounts.md).
    We recommend that you configure a DSA for Defender for Identity for full security coverage. For example, when you have a DSA configured, the DSA is used to connect to the domain controller at startup. A DSA can also be used to query the domain controller for data on entities seen in network traffic, monitored events, and monitored ETW activities.
1. (Optional).[**Configure remote calls to SAM**](remote-calls-sam.md).
    We recommend that you configure remote calls to SAM-R for lateral movement path detection with Defender for Identity.

We recommend using the [silent installation](install-sensor.md#perform-a-defender-for-identity-silent-installation) when deploying on multiple domain controllers.

## Next steps
- [Microsoft Defender for Identity in Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-security-center-mdi?bc=/defender-for-identity/breadcrumb/toc.json&toc=/defender-for-identity/TOC.json)
- [Get started with Microsoft Defender XDR](/microsoft-365/security/defender/get-started)
