---
title: Microsoft Defender for Identity Deployment Overview
description: Learn how to deploy Microsoft Defender for Identity from the Microsoft Defender portal.
ms.date: 06/18/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity deployment overview

This article explains the Microsoft Defender for Identity deployment process.

Defender for Identity uses sensors to collect signals from your Identity Infrastructure servers such as:
- Active Directory Domain controllers
- Active Directory Federation Services (AD FS)
- Active Directory Certification Services (AD CS)
- Microsoft Entra Connect servers

Defender for Identity uses these signals to detect threats like privilege escalation or high-risk lateral movement and reports on easily exploited identity issues like unconstrained Kerberos delegation for correction by the security team.

We recommend installing Defender for Identity sensors on all domain controllers, including read-only domain controllers (RODCs). If you have an AD FS, AD CS, or Microsoft Entra Connect farm or cluster in your environment, install the sensor on each server.

Defender for Identity data centers are located in Europe, the UK, Switzerland, North America, Central America, the Caribbean, Australia East, Asia, and India. Your workspace instance is automatically created in the Azure region closest to the geographical location of your Microsoft Entra tenant. Once created, Defender for Identity workspaces can't be moved.

## Microsoft Defender for Identity sensors
Defender for Identity uses two types of sensors to collect data from your identity infrastructure:

- **Classic Defender for Identity sensor**: The classic Defender for Identity sensor is designed for domain controllers, AD FS, AD CS, and Microsoft Entra Connect servers. The Defender for Identity sensor collects data from the network and Windows events.
- **The Windows Server sensor (Preview)**: You can activate the Windows Server sensor on domain controllers running Windows Server 2019 or later. This sensor is included directly into the Windows operating system, without the need for another agent. The sensor doesn't require a .NET framework to be installed on the Operating System. This sensor enables new onboarding and activation capabilities and closer integration between Defender for Identity and Defender for Endpoint. 

There are some differences between the functionality of the two sensors. The Windows Server sensor supports the following Defender for Identity functionality:

- Investigation features on the [ITDR dashboard](test-sensor.md#check-the-itdr-dashboard)
- [Identity inventory](test-sensor.md#confirm-entity-page-details)
- [Identity advanced hunting data](test-sensor.md#test-advanced-hunting-tables)
- [Security posture recommendations](test-sensor.md#test-identity-security-posture-management-ispm-recommendations)
- [Alert detections](test-sensor.md#test-alert-functionality)
- [Remediation actions](test-sensor.md#test-remediation-actions)
- [Automatic attack disruption](/microsoft-365/security/defender/automatic-attack-disruption)

> [!NOTE]
> We recommend the Windows Server sensor for customers who want to deploy core identity protections to new domain controllers running Windows Server 2019 or later. For all other identity infrastructure servers, or for customers who want to deploy the most robust identity protections available from Microsoft Defender for Identity today, we recommend deploying the Defender for Identity sensor. [Learn more about the Defender for XDR sensor](/defender-for-identity/deploy/activate-capabilities).

There are also differences in the complexity of setting up the sensors. This table describes the differences in functionality and required configurations of the sensors. 

|Functionality  |Classic Defender for Identity Sensor | Windows Server sensor  |
|---------|---------|---------|
|Connectivity requirements|[Requires connectivity](prerequisites.md#required-ports) to `*.atp.azure.com`|[Requires MDE streamlined URLs](../../defender-endpoint/configure-device-connectivity.md#option-1-configure-connectivity-using-the-simplified-domain)|
|[Health issues](../health-alerts.md)|All supported|Partial support|
|Sensor updates|Automatic updates around once weekly.|Occurs automatically as part of Windows update|
|[Directory Service account (DSA)](directory-service-accounts.md)|Supported, requires configuration        |  Not required|
|[Group Managed Service Account (gMSA)](directory-service-accounts.md#supported-dsa-account-options) |Supported, requires configuration        | Not required |
|[Remote calls to SAM-R](remote-calls-sam.md) | Supported, requires configuration        |Not supported         |
|[Defender for Identity action accounts](manage-action-accounts.md)    |Supported, requires configuration         |Not required|
|[VPN integration](../vpn-integration.md) |Supported       |Not supported      |
|[Silent installation on multiple domain controllers](install-sensor.md#perform-a-defender-for-identity-silent-installation)         | Supported       |Not supported        |

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
1. **Deploy a sensor**. Depending on your environment, either install the Microsoft Defender for Identity sensor or activate the Windows Server sensor.
    For more information, see:
    - [Activate a Windows Server sensor (preview) on a domain controller](activate-capabilities.md).
    - [Install a Defender for Identity sensor for AD FS, AD CS, and Microsoft Entra Connect](active-directory-federation-services.md).
    - When deploying on multiple domain controllers, we recommend using the [silent installation](install-sensor.md#perform-a-defender-for-identity-silent-installation)
1. [**Configure Windows event collection**](event-collection-overview.md).
1. [**Configure a Directory Service account (DSA)**](directory-service-accounts.md).
    If you're installing the classic Defender for Identity sensor, we recommend that you configure a DSA for Defender for Identity for full security coverage. For example, when you have a DSA configured, the DSA is used to connect to the domain controller at startup. A DSA can also be used to query the domain controller for data on entities seen in network traffic, monitored events, and monitored ETW activities.
1. [**Configure remote calls to SAM**](remote-calls-sam.md).
     If you're installing the classic Defender for Identity sensor, we recommend that you configure remote calls to SAM-R for lateral movement path detection with Defender for Identity.

## Next steps
- [**Prepare your environment**](prerequisites.md).
- Set up [Microsoft Defender for Identity role groups](../role-groups.md).
