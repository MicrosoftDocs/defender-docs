---
title: Deploy Microsoft Defender for Identity
description: Learn how to deploy Microsoft Defender for Identity from the Microsoft Defender portal.
ms.date: 05/13/2025
ms.topic: how-to
---

# Deploy Microsoft Defender for Identity with Microsoft Defender XDR

This article provides an overview of the full deployment process for Microsoft Defender for Identity, including steps for preparation, deployment, and extra steps for specific scenarios.

Defender for Identity is a primary component of a [Zero Trust](/security/zero-trust/zero-trust-overview) strategy and your Identity Threat Detection and Response (ITDR) or extended detection and response (XDR) deployment with Microsoft Defender XDR. Defender for Identity uses signals from your Identity Infrastructure servers like domain controllers, Active Directory, Active Directory Federation Services (AD FS), or Active Directory Certification Services (AD CS) and Microsoft Entra Connect servers to detect threats like privilege escalation or high-risk lateral movement, and reports on easily exploited identity issues like unconstrained Kerberos delegation, for correction by the security team.


> [!IMPORTANT]
> The new sensor is recommended for customers looking to deploy core identity protections to new domain controllers running Windows Server 2019 or newer. For all other identity infrastructure, or for customers looking to deploy the most robust identity protections available from Microsoft Defender for Identity today, we recommend deploying the classic sensor. [Learn more about the new sensor](/defender-for-identity/deploy/activate-capabilities)

## Prerequisites

Before you start, make sure that you meet the basic setup requirements: 

- You have access to Microsoft Defender XDR with at least as a [Security administrator role](/azure/active-directory/users-groups-roles/directory-assign-admin-roles#available-roles).
- You have one of the following licenses:

[!INCLUDE [licenses](../includes/licenses.md)]

For more information, see [Licensing and privacy FAQs](/defender-for-identity/technical-faq#licensing-and-privacy) and [What are Defender for Identity roles and permissions?](../role-groups.md)

## Start using Microsoft Defender XDR

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

> [!IMPORTANT]
> Currently, Defender for Identity data centers are deployed in Europe, UK, Switzerland, North America/Central America/Caribbean, Australia East, Asia, and India. Your workspace (instance) is created automatically in the Azure region closest to the geographical location of your Microsoft Entra tenant. Once created, Defender for Identity workspaces aren't movable.

## Plan and prepare

Use the following steps to prepare for deploying Defender for Identity:

1. Make sure that you have all [prerequisites](prerequisites.md) required. 

1. [Plan your Defender for Identity capacity](capacity-planning.md).

> [!TIP]
> We recommend running the [*Test-MdiReadiness.ps1*](https://github.com/microsoft/Microsoft-Defender-for-Identity/tree/main/Test-MdiReadiness) script to test and see if the servers in your environment have the necessary prerequisites.
> You can use the [DefenderForIdentity PowerShell module](https://www.powershellgallery.com/packages/DefenderForIdentity/) to add the required auditing and configure the necessary settings.

> [!IMPORTANT]
> The new sensor is recommended for customers looking to deploy core identity protections to new domain controllers running Windows Server 2019 or newer. For all other identity infrastructure, or for customers looking to deploy the most robust identity protections available from Microsoft Defender for Identity today, we recommend deploying the classic sensor. [Learn more about the new sensor](/defender-for-identity/deploy/activate-capabilities)

## Quick steps: Install classic sensors

Watch the following video for a step-by-step demo and to learn about:

- The importance of installing Defender for Identity sensors to protect your organization against identity-based attacks
- Downloading and installing the sensor
- Finding potential sensor and configuration health issues
- Viewing identity-related posture assessments in Microsoft Secure Score

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=de930a92-f552-4c09-92dc-1ab03c2e1131]

> [!NOTE]
> Defender for Identity sensors should be installed on all domain controllers, including read-only domain controllers (RODC). If you're installing on an AD FS / AD CS / Microsoft Entra Connect farm or cluster, we recommend installing the sensor on each AD FS / AD CS / Microsoft Entra Connect server.

This procedure describes how to install the Defender for Identity sensor on a Windows server version 2016 or higher. 

### Minimum system requirements

Installing a Defender for Identity sensor requires a minimum of 2 cores, 6 GB of RAM, and 6 GB of disk space installed on your domain controller.

When running as a virtual machine, all memory is required to be allocated to the virtual machine always. For more information, see [Plan capacity for Microsoft Defender for Identity deployment](capacity-planning.md).

Defender for Identity sensors is supported on the following operating systems:

[!INCLUDE [server-requirements](../includes/server-requirements.md)]

**To download and install the classic sensor**:

1. Download the Defender for Identity sensor from the [Microsoft Defender portal](https://security.microsoft.com).
1. Browse to **System** > **Settings** > **Identities** > **Sensors** > **Add sensor**
1. Select **Download installer** and save the file in a location you can access from your domain controller.
1. Copy the **Access key** value, which you need for the installation.

> [!TIP]
> You only need to download the installer once, as it can be used for every server in the tenant. Make sure that no pop-up blocker is blocking the download.

1. From the domain controller, run the installer you downloaded from Microsoft Defender XDR and follow the instructions on the screen.  

### Schedule a maintenance window (optional)

During installation, the setup adds .NET Framework 4.7, if it's not already installed. The process might trigger a server reboot, especially if a restart is already pending. 

When installing your sensors, consider scheduling a maintenance window for your domain controllers.

## Deploy Defender for Identity classic sensor

After you prepare your system, follow these steps:

1. [Verify connectivity to the Defender for Identity service](configure-proxy.md).
1. [Download the Defender for Identity classic sensor](download-sensor.md).
1. [Install the Defender for Identity classic sensor](install-sensor.md). 
1. [Configure the Defender for Identity classic sensor](configure-sensor-settings.md) to start receiving data.

## Post-deployment configuration

The following procedures help you complete the deployment process:

- **Configure Windows event collection**. For more information, see [Event collection with Microsoft Defender for Identity](event-collection-overview.md) and [Configure audit policies for Windows event logs](configure-windows-event-collection.md).

- [**Enable and configure unified role-based access control (RBAC)**](../role-groups.md) for Defender for Identity.

- [**Configure a Directory Service account (DSA) for use with Defender for Identity**](directory-service-accounts.md). While a DSA is optional in some scenarios, we recommend that you configure a DSA for Defender for Identity for full security coverage. For example, when you have a DSA configured, the DSA is used to connect to the domain controller at startup. A DSA can also be used to query the domain controller for data on entities seen in network traffic, monitored events, and monitored ETW activities.

- [**Configure remote calls to SAM**](remote-calls-sam.md) as needed. While this step is optional, we recommend that you configure remote calls to SAM-R for lateral movement path detection with Defender for Identity.

> [!TIP]
> By default, Defender for Identity sensors query the directory using LDAP on ports 389 and 3268. To switch to LDAPS on ports 636 and 3269, open a support case. For more information, see [Microsoft Defender for Identity support](../support.md).
>

> [!IMPORTANT]
> Installing a Defender for Identity sensor on an AD FS / AD CS and Microsoft Entra Connect servers requires extra steps. For more information, see [Configuring sensors for AD FS, AD CS, and Microsoft Entra Connect](active-directory-federation-services.md).
> 

## Next step

 - For deploying on multiple domain controllers, we recommend using the [silent installation](install-sensor.md#perform-a-defender-for-identity-silent-installation) instead.


