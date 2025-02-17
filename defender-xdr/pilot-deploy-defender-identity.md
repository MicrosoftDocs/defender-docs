---
title: How do I pilot and deploy Microsoft Defender for Identity
description: Learn how to pilot and deploy Microsoft Defender for Identity as part of Microsoft Defender XDR to enhance your organization's security posture.
search.appverid: met150
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: dansimp
author: dansimp
ms.date: 01/12/2025
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
ms.topic: concept-article
#customerIntent: As a security admin, I want to pilot and deploy Microsoft Defender for Identity to evaluate it's ability to enhance my organization's security posture and protect against identity-based threats.
---

# Pilot and deploy Microsoft Defender for Identity

**Applies to:**
- Microsoft Defender XDR

This article provides a workflow for piloting and deploying Microsoft Defender for Identity in your organization. Use these recommendations to onboard Microsoft Defender for Identity as part of an end-to-end solution with Microsoft Defender XDR.

This article assumes you have a production Microsoft 365 tenant and are piloting and deploying Microsoft Defender for Identity in this environment. This practice will maintain any settings and customizations you configure during your pilot for your [full deployment](/defender-for-identity/deploy/deploy-defender-identity).

Defender for Identity contributes to a Zero Trust architecture by helping to prevent or reduce business damage from a breach. For more information, see the [Prevent or reduce business damage from a breach](/security/zero-trust/adopt/prevent-reduce-business-damage-breach) business scenario in the Microsoft Zero Trust adoption framework.

## End-to-end deployment for Microsoft Defender XDR

This is article 2 of 6 in a series to help you deploy the components of Microsoft Defender XDR, including investigating and responding to incidents.

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-identity.svg" alt-text="A diagram that shows Microsoft Defender for Identity in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-identity.svg" border="false":::

The articles in this series correspond to the following phases of end-to-end deployment:

| Phase | Link |
|---|---|
| A. Start the pilot | [Start the pilot](pilot-deploy-overview.md#start-the-pilot)|
| B. Pilot and deploy Microsoft Defender XDR components | - **Pilot and deploy Defender for Identity** (this article) <br><br> - [Pilot and deploy  Defender for Office 365](pilot-deploy-defender-office-365.md) <br><br> - [Pilot and deploy Defender for Endpoint](pilot-deploy-defender-endpoint.md) <br><br> - [Pilot and deploy Microsoft Defender for Cloud Apps](pilot-deploy-defender-cloud-apps.md)  |
|C. Investigate and respond to threats | [Practice incident investigation and response](pilot-deploy-investigate-respond.md) |

## Pilot and deploy workflow for Defender for Identity

The following diagram illustrates a common process to deploy a product or service in an IT environment.

:::image type="content" source="./media/eval-defender-xdr/adoption-phases.svg" alt-text="Diagram of the pilot, evaluate, and full deployment adoption phases." lightbox="./media/eval-defender-xdr/adoption-phases.svg" border="false":::

You start by evaluating the product or service and how it will work within your organization. Then, you pilot the product or service with a suitably small subset of your production infrastructure for testing, learning, and customization. Then, gradually increase the scope of the deployment until your entire infrastructure or organization is covered.

Here is the workflow for piloting and deploying Defender for Identity in your production environment.

:::image type="content" source="./media/eval-defender-xdr/defender-identity-pilot-deploy-steps.svg" alt-text="A diagram that shows the steps to pilot and deploy Microsoft Defender for Identity." lightbox="./media/eval-defender-xdr/defender-identity-pilot-deploy-steps.svg" border="false":::

Follow these steps:

1. [Set up the Defender for Identity instance](#step-1)
1. [Install and configure sensors](#step-2)
1. [Configure event log and proxy settings on machines with the sensor](#step-3)
1. [Allow Defender for Identity to identify local admins on other computers](#step-4)
1. [Try out capabilities](#step-5)

Here are the recommended steps for each deployment stage.

| Deployment stage | Description |
| --- | --- |
| Evaluate | Perform product evaluation for Defender for Identity. |
| Pilot | Perform Steps 1-5 for a suitable subset of servers with sensors in your production environment. |
| Full deployment | Perform Steps 2-4 for your remaining servers, expanding beyond the pilot to include all of them. |

### Protecting your organization from hackers

Defender for Identity provides powerful protection on its own. However, when combined with the other capabilities of Microsoft Defender XDR, Defender for Identity provides data into the shared signals which together help stop attacks.

Here's an example of a cyber-attack and how the components of Microsoft Defender XDR help detect and mitigate it.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-eval-threat-chain.svg" alt-text="A diagram that shows how Microsoft Defender XDR stops a threat chain." lightbox="./media/eval-defender-xdr/m365-defender-eval-threat-chain.svg":::

Defender for Identity gathers signals from Active Directory Domain Services (AD DS) domain controllers and servers running Active Directory Federation Services (AD FS) and Active Directory Certificate Services (AD CS). It uses these signals to protect your hybrid identity environment, including protecting against hackers that use compromised accounts to move laterally across workstations in the on-premises environment.

Microsoft Defender XDR correlates the signals from all the Microsoft Defender components to provide the full attack story.

## Defender for Identity architecture

Microsoft Defender for Identity is fully integrated with Microsoft Defender XDR and leverages signals from on-premises Active Directory identities to help you better identify, detect, and investigate advanced threats directed at your organization.

Deploy Microsoft Defender for Identity to help your Security Operations (SecOps) teams deliver a modern identity threat detection and response (ITDR) solution across hybrid environments, including:

- Prevent breaches, using proactive identity security posture assessments
- Detect threats, using real-time analytics and data intelligence
- Investigate suspicious activities, using clear, actionable incident information
- Respond to attacks, using automatic response to compromised identities. For more information, see [What is Microsoft Defender for Identity?](/defender-for-identity/what-is)

Defender for Identity protects your on-premises AD DS user accounts and user accounts synchronized to your Microsoft Entra ID tenant. To protect an environment made up of only Microsoft Entra user accounts, see [Microsoft Entra ID Protection](/azure/active-directory/identity-protection/overview-identity-protection).

The following diagram illustrates the architecture for Defender for Identity.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-identity-architecture.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Identity." lightbox="./media/eval-defender-xdr/m365-defender-identity-architecture.svg":::

In this illustration:

- Sensors installed on AD DS domain controllers and AD CS servers parse logs and network traffic and send them to Microsoft Defender for Identity for analysis and reporting.
- Sensors can also parse AD FS authentications for third-party identity providers and when Microsoft Entra ID is configured to use federated authentication (the dotted lines in the illustration).
- Microsoft Defender for Identity shares signals to Microsoft Defender XDR.

Defender for Identity sensors can be directly installed on the following servers:

- **AD DS domain controllers**. The sensor directly monitors domain controller traffic, without the need for a dedicated server or the configuration of port mirroring.
- **AD FS servers / AD CS servers**. The sensor directly monitors network traffic and authentication events.

For a deeper look into the architecture of Defender for Identity, see [Microsoft Defender for Identity architecture](/defender-for-identity/architecture).

<a name="step-1"></a>

## Step 1: Set up the Defender for Identity instance

Sign in to the Defender portal to start deploying supported services, including Microsoft Defender for Identity. For more information, see [Start using Microsoft Defender XDR](/defender-for-identity/deploy/deploy-defender-identity##start-using-microsoft-defender-xdr).

<a name="step-2"></a>

## Step 2: Install your sensors

Defender for Identity requires some prerequisite work to ensure that your on-premises identity and networking components meet minimum requirements for you to install the Defender for Identity sensor in your environment.

Once you're sure of your environment's readiness, plan your capacity, and verify connectivity to Defender for Identity. Then when you're ready, download, install, and configure the Defender for Identity sensor on the domain controllers, AD FS, and AD CS servers in your on-premises environment.

| Step | Description | More information |
|---|---|---|
| 1 | Confirm that your environment meets Defender for Identity prerequisites. | [Microsoft Defender for Identity prerequisites](/defender-for-identity/prerequisites)|
| 2 | Determine how many Microsoft Defender for Identity sensors you need. | [Plan capacity for Microsoft Defender for Identity](/defender-for-identity/capacity-planning) |
| 3 | Verify connectivity to the Defender for Identity service | [Check network activity](/defender-for-identity/deploy/quick-installation-guide#check-network-connectivity) |
| 4 | Download and install the Defender for Identity sensor | [Install Defender for Identity](/defender-for-identity/deploy/quick-installation-guide#install-defender-for-identity)  |
| 5 | Configure the sensor | [Configure Microsoft Defender for Identity sensor settings](/defender-for-identity/deploy/configure-sensor-settings)|

<a name="step-3"></a>

## Step 3: Configure event log and proxy settings on machines with the sensor

On the machines that you installed the sensor on, configure Windows event log collection to enable and enhance detection capabilities.

| Step | Description | More information |
|---|---|---|
| 1 | Configure Windows event log collection | [Event collection with Microsoft Defender for Identity](/defender-for-identity/deploy/event-collection-overview) <br><br>[Configure audit policies for Windows event logs](/defender-for-identity/deploy/configure-windows-event-collection) |

<a name="step-4"></a>

## Step 4: Allow Defender for Identity to identify local admins on other computers

Microsoft Defender for Identity lateral movement path (LMP) detection relies on queries that identify local admins on specific machines. These queries are performed with the SAM-R protocol, using the Defender for Identity Service account.

To ensure Windows clients and servers allow your Defender for Identity account to perform SAM-R, a modification to Group Policy must be made to add the Defender for Identity service account in addition to the configured accounts listed in the Network access policy. Make sure to apply group policies to all computers **except domain controllers**.

For instructions on how to do this, see [Configure SAM-R to enable lateral movement path detection in Microsoft Defender for Identity](/defender-for-identity/deploy/remote-calls-sam).

<a name="step-5"></a>

## Step 5: Try out capabilities

The Defender for Identity documentation includes the following articles that walk through the process of identifying and remediating various attack types:

- [Investigate assets](/defender-for-identity/investigate-assets), including suspicious users, groups, and devices
- [Understand and investigate LMPs with Microsoft Defender for Identity](/defender-for-identity/understand-lateral-movement-paths)
- [Understand security alerts](/defender-for-identity/understanding-security-alerts)

For more information, see:

- [Reconnaissance alerts](/defender-for-identity/reconnaissance-alerts)
- [Compromised credential alerts](/defender-for-identity/compromised-credentials-alerts)
- [Lateral movement alerts](/defender-for-identity/lateral-movement-alerts)
- [Domain dominance alerts](/defender-for-identity/domain-dominance-alerts)
- [Exfiltration alerts](/defender-for-identity/exfiltration-alerts)
- [Investigate a user](/defender-for-identity/investigate-a-user)
- [Investigate a computer](/defender-for-identity/investigate-a-computer)
- [Investigate lateral movement paths](/defender-for-identity/investigate-lateral-movement-path)
- [Investigate entities](/defender-for-identity/investigate-entity)

## SIEM integration

You can integrate Defender for Identity with Microsoft Sentinel as part of Microsoft's [unified security operations platform](/unified-secops-platform/) or a generic security information and event management (SIEM) service to enable centralized monitoring of alerts and activities from connected apps. With Microsoft Sentinel, you can more comprehensively analyze security events across your organization and build playbooks for effective and immediate response.

Microsoft Sentinel includes a Microsoft Defender for XDR data connector to bring all signals from Defender XDR, including Defender for Identity, to Microsoft Sentinel. Use the unified security operations platform in the Defender portal as a single platform for end-to-end security operations (SecOps). 

For more information, see:

- [Connect Microsoft Sentinel to the Microsoft Defender portal](/unified-secops-platform/microsoft-sentinel-onboard)
- [Generic SIEM integration](/cloud-app-security/siem)

## Next step

Incorporate the following into your SecOps processes:

- [View the ITDR dashboard](/defender-for-identity/dashboard)
- [View and manage Defender for Identity health issues](/defender-for-identity/health-alerts)

## Next step for the end-to-end deployment of Microsoft Defender XDR

Continue your end-to-end deployment of Microsoft Defender XDR with [Pilot and deploy Defender for Office 365](pilot-deploy-defender-office-365.md).

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-office-365.svg" alt-text="A diagram that shows Microsoft Defender for Office 365 in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-office-365.svg" border="false":::

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
