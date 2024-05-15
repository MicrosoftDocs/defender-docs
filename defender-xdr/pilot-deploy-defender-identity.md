---
title: Step 2. Pilot and deploy Microsoft Defender for Identity
description: Pilot and deploy Microsoft Defender for Identity.
search.appverid: met150
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: dansimp
author: dansimp
ms.date: 05/15/2024
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
  - m365-security
  - m365solution-scenario
  - m365solution-evalutatemtp
  - zerotrust-solution
  - highpri
  - tier1
ms.topic: conceptual
---

# Step 2. Pilot and deploy Microsoft Defender for Identity


**Applies to:**
- Microsoft Defender XDR

> [!NOTE]
> This article is also part of the Microsoft Defender XDR XDR solution we talk about in this [Overview](pilot-deploy-overview.md).

 Before starting the process that enables and pilots Microsoft Defender for Identity, if you intend to evaluate *Microsoft Defender XDR as an eXtended Detection and Response (XDR) solution*, make sure you've reviewed the process from the beginning: [evaluating Microsoft Defender XDR](pilot-deploy-overview.md) including [created the Microsoft Defender XDR evaluation environment](eval-create-eval-environment.md).
<br>

Use the steps below to enable and pilot Microsoft Defender for Identity.

:::image type="content" source="/defender/media/defender/m365-defender-identity-eval-steps.png" alt-text="The steps for adding Microsoft Defender for Identity to the Microsoft Defender evaluation environment" lightbox="/defender/media/defender/m365-defender-identity-eval-steps.png":::

Before enabling Microsoft Defender for Identity, be sure you understand the architecture and can meet the requirements.

Microsoft Defender for Identity is fully integrated with Microsoft Defender XDR, and leverages signals from both on-premises Active Directory and cloud identities to help you better identify, detect, and investigate advanced threats directed at your organization.

Deploy Microsoft Defender for Identity to help your SecOp teams deliver a modern identity threat detection (ITDR) solution across hybrid environments, including:

- Prevent breaches, using proactive identity security posture assessments
- Detect threats, using real-time analytics and data intelligence
- Investigate suspicious activities, using clear, actionable incident information
- Respond to attacks, using automatic response to compromised identities. For more information, see [What is Microsoft Defender for Identity?](/defender-for-identity/what-is)

Defender for Identity protects your on-premises Active Directory users and/or users synced to your Microsoft Entra ID. To protect an environment made up of only Microsoft Entra users, see [Microsoft Entra ID Protection](/azure/active-directory/identity-protection/overview-identity-protection).

## Understand the architecture

The following diagram illustrates the baseline architecture for Defender for Identity.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-identity-architecture.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Identity." lightbox="./media/eval-defender-xdr/m365-defender-identity-architecture.svg":::

In this illustration:

- Sensors installed on Active Directory Domain Services (AD DS) domain controllers and Active Directory Certificate Services (AD CS) servers parse logs and network traffic and send them to Microsoft Defender for Identity for analysis and reporting.
- Sensors can also parse Active Directory Federation Services (AD FS) authentications for third-party identity providers and when Microsoft Entra ID is configured to use federated authentication (the dotted lines in the illustration).
- Microsoft Defender for Identity shares signals to Microsoft Defender XDR for extended detection and response (XDR).

Defender for Identity sensors can be directly installed on the following servers:

- AD DS domain controllers

  The sensor directly monitors domain controller traffic, without the need for a dedicated server or the configuration of port mirroring.

- AD CS servers
- AD FS servers

  The sensor directly monitors network traffic and authentication events.

For a deeper look into the architecture of Defender for Identity, see [Microsoft Defender for Identity architecture](/defender-for-identity/architecture).

## Understand key concepts

The following table identified key concepts that are important to understand when evaluating, configuring, and deploying Microsoft Defender for Identity.

|Concept  |Description |More information  |
|---------|---------|---------|
| Monitored activities | Defender for Identity monitors signals generated from within your organization to detect suspicious or malicious activity and helps you determine the validity of each potential threat so that you can effectively triage and respond.  |  [Microsoft Defender for Identity monitored activities](/defender-for-identity/monitored-activities)       |
| Security alerts    | Defender for Identity security alerts explain the suspicious activities detected by sensors on your network along with the actors and computers involved in each threat.   | [Microsoft Defender for Identity Security Alerts](/defender-for-identity/suspicious-activity-guide?tabs=external)    |
| Entity profiles    | Entity profiles provide a comprehensive deep-dive investigation of users, computers, devices, and resources along with their access history.   | [Understanding entity profiles](/defender-for-identity/entity-profiles)  |
| Lateral movement paths    | A key component of MDI security insights is identifying lateral movement paths in which an attacker uses non-sensitive accounts to gain access to sensitive accounts or machines throughout your network.  | [Microsoft Defender for Identity Lateral Movement Paths (LMPs)](/defender-for-identity/use-case-lateral-movement-path)  |
| Network Name Resolution    |  Network Name Resolution (NNR) is a component of MDI functionality which captures activities based on network traffic, Windows events, ETW, etc. and correlates this raw data to the relevant computers involved in each activity.       | [What is Network Name Resolution?](/defender-for-identity/nnr-policy)      |
| Reports    | Defender for Identity reports allow you to schedule or immediately generate and download reports that provide system and entity status information.  You can create reports about system health, security alerts, and potential lateral movement paths detected in your environment.   | [Microsoft Defender for Identity Reports](/defender-for-identity/reports)       |
| Role groups    | Defender for Identity offers role-based groups and delegated access to safeguard data according to your organization's specific security and compliance needs which includes Administrators, Users and Viewers.        |  [Microsoft Defender for Identity role groups](/defender-for-identity/role-groups)       |
| Administrative portal    |  In addition to the Microsoft Defender portal, the Defender for Identity portal can be used to monitor and respond to suspicious activity.      | [Working with the Microsoft Defender for Identity portal](/defender-for-identity/workspace-portal)        |
| Microsoft Defender for Cloud Apps integration   | Microsoft Defender for Cloud Apps integrates with Microsoft Defender for Identity to provide user entity behavioral analytics (UEBA) across a hybrid environment - both cloud app and on-premises   | Microsoft Defender for Identity integration  |

## Review prerequisites

Defender for Identity requires some prerequisite work to ensure that your on-premises identity and networking components meet minimum requirements. Use this article as a checklist to ensure your environment is ready: [Microsoft Defender for Identity prerequisites](/defender-for-identity/prerequisites).

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Use the following steps to set up your Microsoft Defender for Identity environment.

:::image type="content" source="/defender/media/defender/m365-defender-identity-eval-enable-steps.png" alt-text="The steps to enable Microsoft Defender for Identity in the Microsoft Defender evaluation environment" lightbox="/defender/media/defender/m365-defender-identity-eval-enable-steps.png":::

- [Step 1. Set up the Defender for Identity Instance](#step-1-set-up-the-defender-for-identity-instance)
- [Step 2. Install and configure the sensor](#step-2-install-and-configure-the-sensor)
- [Step 3. Configure event log and proxy settings on machines with the sensor](#step-3-configure-event-log-and-proxy-settings-on-machines-with-the-sensor)
- [Step 4. Allow Defender for Identity to identify local admins on other computers](#step-4-allow-defender-for-identity-to-identify-local-admins-on-other-computers)

## Step 1: Set up the Defender for Identity Instance

Sign in to the Defender for Identity portal to create your instance and then connect this instance to your Active Directory environment.

|Step|Description|More information|
|---|---|---|
|1|Create the Defender for Identity instance|[Quickstart: Create your Microsoft Defender for Identity instance](/defender-for-identity/install-step1)|
|2|Connect the Defender for Identity instance to your Active Directory forest|[Quickstart: Connect to your Active Directory Forest](/defender-for-identity/install-step2)|

## Step 2: Install and configure the sensor

Next, download, install, and configure the Defender for Identity sensor on the domain controllers and AD FS servers in your on-premises environment.

|Step|Description|More information|
|---|---|---|
|1|Determine how many Microsoft Defender for Identity sensors you need.|[Plan capacity for Microsoft Defender for Identity](/defender-for-identity/capacity-planning)|
|2|Download the sensor setup package|[Quickstart: Download the Microsoft Defender for Identity sensor setup package](/defender-for-identity/install-step3)|
|3|Install the Defender for Identity sensor|[Quickstart: Install the Microsoft Defender for Identity sensor](/defender-for-identity/install-step4)|
|4|Configure the sensor|[Configure Microsoft Defender for Identity sensor settings](/defender-for-identity/install-step5)|

## Step 3: Configure event log and proxy settings on machines with the sensor

On the machines that you installed the sensor on, configure Windows event log collection and Internet proxy settings to enable and enhance detection capabilities.

|Step|Description|More information|
|---|---|---|
|1|Configure Windows event log collection|[Configure Windows Event collection](/defender-for-identity/configure-windows-event-collection)|
|2|Configure Internet proxy settings|[Configure endpoint proxy and Internet connectivity settings for your Microsoft Defender for Identity Sensor](/defender-for-identity/configure-proxy)|

## Step 4: Allow Defender for Identity to identify local admins on other computers

Microsoft Defender for Identity lateral movement path detection relies on queries that identify local admins on specific machines. These queries are performed with the SAM-R protocol, using the Defender for Identity Service account.

To ensure Windows clients and servers allow your Defender for Identity account to perform SAM-R, a modification to Group Policy must be made to add the Defender for Identity service account in addition to the configured accounts listed in the Network access policy. Make sure to apply group policies to all computers **except domain controllers**.

For instructions on how to do this, see [Configure Microsoft Defender for Identity to make remote calls to SAM](/defender-for-identity/install-step8-samr).


XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Use the following steps to set up and configure the pilot for Microsoft Defender for identity. The recommendations don't include setting up a pilot group. The best practice is to install the sensor on all of your servers running Active Directory Domain Services (AD DS) and Active Directory Federated Services (AD FS).

:::image type="content" source="/defender/media/defender/m365-defender-identity-pilot-steps.png" alt-text="The steps for piloting Microsoft Defender for Identity in the Microsoft Defender evaluation environment" lightbox="/defender/media/defender/m365-defender-identity-pilot-steps.png":::

The following table describes the steps in the illustration.

- [Step 1: Configure benchmark recommendations for your identity environment](#step-1-configure-benchmark-recommendations-for-your-identity-environment)
- [Step 2: Try out capabilities — Walk through tutorials for identifying and remediating different attack types](#step-2-try-out-capabilities--walk-through-tutorials-for-identifying-and-remediating-different-attack-types)

## Step 1: Configure benchmark recommendations for your identity environment

Microsoft provides security benchmark recommendations for customers using Microsoft Cloud services. The [Azure Security Benchmark](/security/benchmark/azure/overview) (ASB) provides prescriptive best practices and recommendations to help improve the security of workloads, data, and services on Azure.

Implementing these recommendations can take some time to plan and implement. While these recommendations greatly increase the security of your identity environment, they shouldn't prevent you from continuing to evaluate and implement Microsoft Defender for Identity. These recommendations are provided here for your awareness.

## Step 2: Try out capabilities — Walk through tutorials for identifying and remediating different attack types

The Microsoft Defender for Identity documentation includes a series of tutorials that walk through the process of identifying and remediating various attack types.

Try out Defender for Identity tutorials:

- [Reconnaissance alerts](/defender-for-identity/reconnaissance-alerts)
- [Compromised credential alerts](/defender-for-identity/compromised-credentials-alerts)
- [Lateral movement alerts](/defender-for-identity/lateral-movement-alerts)
- [Domain dominance alerts](/defender-for-identity/domain-dominance-alerts)
- [Exfiltration alerts](/defender-for-identity/exfiltration-alerts)
- [Investigate a user](/defender-for-identity/investigate-a-user)
- [Investigate a computer](/defender-for-identity/investigate-a-computer)
- [Investigate lateral movement paths](/defender-for-identity/investigate-lateral-movement-path)
- [Investigate entities](/defender-for-identity/investigate-entity)

## Next steps

[Evaluate Microsoft Defender for Office 365.](pilot-deploy-defender-office-365.md)

Return to the overview for [Evaluate Microsoft Defender for Identity]()

Return to the overview for [Pilot and deploy Microsoft Defender XDR](pilot-deploy-overview.md)

