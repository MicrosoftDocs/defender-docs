---
title: Pilot and deploy Microsoft Defender for Endpoint
description: Pilot and deploy Microsoft Defender for Endpoint.
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

# Pilot and deploy Microsoft Defender for Endpoint

**Applies to:**

- Microsoft Defender XDR

This article outlines the process to enable and pilot Microsoft Defender for Endpoint. Before starting this process, be sure you've reviewed the overall process for [evaluating Microsoft Defender XDR](pilot-deploy-overview.md), and you've and you have created the Microsoft Defender XDR pilot environment.

This article is part of the end-to-end process of piloting and deploying Microsoft Defender XDR.

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-endpoint.svg" alt-text="A diagram that shows the Microsoft Defender for Endpoint step in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-endpoint.svg":::

Use the following steps to enable and pilot Microsoft Defender for Endpoint.

:::image type="content" source="/defender/media/defender/m365-defender-endpoint-eval-steps.png" alt-text="The steps for adding Microsoft Defender for Endpoint to the Microsoft Defender evaluation environment" lightbox="/defender/media/defender/m365-defender-endpoint-eval-steps.png":::

The following table describes the steps in the illustration.

|Step|Description|
|---|---|
|Step 1. Review architecture requirements and key concepts|Understand the Defender for Endpoint architecture and the capabilities available to you.|
|Step 2. Enable the evaluation environment|Follow the steps to set up the evaluation environment.|
|Step 3. Set up the pilot|Verify your pilot group, run simulations, and become familiar with key features and dashboards.|
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Before enabling Microsoft Defender for Endpoint, be sure you understand the architecture and can meet the requirements.

## Understand the architecture

The following diagram illustrates Microsoft Defender for Endpoint architecture and integrations.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-endpoint-architecture.svg" alt-text="A diagram that shows the steps for adding Microsoft Defender for Endpoint to the Microsoft Defender XDR evaluation environment." lightbox="./media/eval-defender-xdr/m365-defender-endpoint-architecture.svg":::

The following table describes the illustration.

Call-out | Description
:---|:---|
1 | Devices are on-boarded through one of the supported management tools.
2 | On-boarded devices provide and respond to Microsoft Defender for Endpoint signal data.
3 | Managed devices are joined and/or enrolled in Microsoft Entra ID.
4 | Domain-joined Windows devices are synchronized to Microsoft Entra ID using Microsoft Entra Connect.
5 | Microsoft Defender for Endpoint alerts, investigations, and responses are managed in Microsoft Defender XDR.

## Understand key concepts

The following table identified key concepts that are important to understand when evaluating, configuring, and deploying Microsoft Defender for Endpoint:

Concept | Description | More information
:---|:---|:---|
Administration Portal | Microsoft Defender portal to monitor and assist in responding to alerts of potential advanced persistent threat activity or data breaches. | [Microsoft Defender for Endpoint portal overview](microsoft-365-security-center-mde.md)
Attack Surface Reduction | Help reduce your attack surfaces by minimizing the places where your organization is vulnerable to cyberthreats and attacks. | [Overview of attack surface reduction](/defender-endpoint/overview-attack-surface-reduction)
Endpoint Detection and Response | Endpoint detection and response capabilities provide advanced attack detections that are near real-time and actionable. | [Overview of endpoint detection and response capabilities](/defender-endpoint/overview-endpoint-detection-response)
Behavioral Blocking and Containment | Behavioral blocking and containment capabilities can help identify and stop threats, based on their behaviors and process trees even when the threat has started execution. | [Behavioral blocking and containment](/defender-endpoint/behavioral-blocking-containment)
Automated Investigation and Response | Automated investigation uses various inspection algorithms based on processes that are used by security analysts and designed to examine alerts and take immediate action to resolve breaches. | [Use automated investigations to investigate and remediate threats](/defender-endpoint/automated-investigations)
Advanced Hunting | Advanced hunting is a query-based threat-hunting tool that lets you explore up to 30 days of raw data so that you can proactively inspect events in your network to locate threat indicators and entities. | [Overview of advanced hunting](advanced-hunting-overview.md)
Threat Analytics | Threat analytics is a set of reports from expert Microsoft security researchers covering the most relevant threats. | [Track and respond to emerging threats](/defender-endpoint/threat-analytics)

For more detailed information about the capabilities included with Microsoft Defender for Endpoint, see [What is Microsoft Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint).

## SIEM integration

You can integrate Microsoft Defender for Endpoint with Microsoft Sentinel to more comprehensively analyze security events across your organization and build playbooks for effective and immediate response.

Microsoft Defender for Endpoint can also be integrated into other Security Information and Event Management (SIEM) solutions. For more information, see [Enable SIEM integration in Microsoft Defender for Endpoint](/defender-endpoint/configure-siem).

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

This article will guide you through the steps on setting up the evaluation environment for Microsoft Defender for Endpoint using production devices.

> [!TIP]
> Microsoft Defender for Endpoint also comes with an in-product evaluation lab where you can add pre-configured devices and run simulations to evaluate the capabilities of the platform. The lab comes with a simplified set-up experience that can help quickly demonstrate the value of Microsoft Defender for Endpoint including guidance for many features like advanced hunting and threat analytics. For more information, see [Evaluate capabilities](/defender-endpoint/evaluation-lab). <br> The main difference between the guidance provided in this article and the evaluation lab is the evaluation environment uses production devices whereas the evaluation lab uses non-production devices.

Use the following steps to enable the evaluation for Microsoft Defender for Endpoint.

:::image type="content" source="/defender/media/defender/m365-defender-endpoint-eval-enable-steps.png" alt-text="The steps to enable Microsoft Defender for Endpoint in the Microsoft Defender evaluation environment" lightbox="/defender/media/defender/m365-defender-endpoint-eval-enable-steps.png":::

- [Step 1. Check license state](#step-1-check-license-state)
- [Step 2. Onboard endpoints](#step-2-onboard-endpoints-using-any-of-the-supported-management-tools)

## Step 1: Check license state

You'll first need to check the license state to verify that it was properly provisioned. You can do this through the admin center or through the **Microsoft Azure portal**.

1. To view your licenses, go to the **Microsoft Azure portal** and navigate to the [Microsoft Azure portal license section](https://portal.azure.com/#blade/Microsoft_AAD_IAM/LicensesMenuBlade/Products).

   :::image type="content" source="/defender/media/defender/atp-licensing-azure-portal.png" alt-text="The Azure Licensing page in the Microsoft Defender portal" lightbox="/defender/media/defender/atp-licensing-azure-portal.png":::

1. Alternately, in the admin center, navigate to **Billing** > **Subscriptions**.

    On the screen, you'll see all the provisioned licenses and their current **Status**.

    :::image type="content" source="/defender/media/defender/atp-billing-subscriptions.png" alt-text="The Billing licenses page in the Microsoft Azure portal" lightbox="/defender/media/defender/atp-billing-subscriptions.png":::

## Step 2: Onboard endpoints using any of the supported management tools

After verifying that the license state has been provisioned properly, you can start onboarding devices to the service.

For the purpose of evaluating Microsoft Defender for Endpoint, we recommend choosing a couple of Windows devices to conduct the evaluation on.

You can choose to use any of the supported management tools, but Intune provides optimal integration. For more information, see [Configure Microsoft Defender for Endpoint in Microsoft Intune](/mem/intune/protect/advanced-threat-protection-configure#enable-microsoft-defender-for-endpoint-in-intune).

The [Plan deployment](/defender-endpoint/deployment-strategy) topic outlines the general steps you need to take to deploy Defender for Endpoint.

Watch this video for a quick overview of the onboarding process and learn about the available tools and methods.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4bGqr]

### Onboarding tool options

The following table lists the available tools based on the endpoint that you need to onboard.

| Endpoint | Tool options |
|---|---|
| **Windows** |- [Local script (up to 10 devices)](/defender-endpoint/configure-endpoints-script)<br/>- [Group Policy](/defender-endpoint/configure-endpoints-gp)<br/>- [Microsoft Intune / Mobile Device Manager](/defender-endpoint/configure-endpoints-mdm)<br/>- [Microsoft Endpoint Configuration Manager](/defender-endpoint/configure-endpoints-sccm)<br/>- [VDI scripts](/defender-endpoint/configure-endpoints-vdi) |
| **macOS** | - [Local scripts](/defender-endpoint/mac-install-manually)<br/>- [Microsoft Intune](/defender-endpoint/mac-install-with-intune)<br/>- [JAMF Pro](/defender-endpoint/mac-install-with-jamf)<br/>- [Mobile Device Management](/defender-endpoint/mac-install-with-other-mdm) |
| **iOS** | [App-based](/defender-endpoint/ios-install) |
| **Android** | [Microsoft Intune](/defender-endpoint/android-intune) |

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Use the following steps to setup and configure the pilot for Microsoft Defender for Endpoint. 

:::image type="content" source="/defender/media/defender/m365-defender-endpoint-pilot-steps.png" alt-text="The steps for adding Microsoft Defender for Identity to the Microsoft Defender evaluation environment" lightbox="/defender/media/defender/m365-defender-endpoint-pilot-steps.png":::

- Step 1. Verify pilot group
- Step 2. Try out capabilities

When you pilot Microsoft Defender for Endpoint, you may choose to onboard a few devices to the service before onboarding your entire organization.  

You can then try out capabilities that are available such as running attack simulations and seeing how Defender for Endpoint surfaces malicious activities and enables you to conduct an efficient response. 

## Step 1: Verify pilot group
After completing the onboarding steps outlined in the Enable evaluation section, you should see the devices in the Device inventory list approximately after an hour. 

When you see your onboarded devices you can then proceed with trying out capabilities. 

## Step 2: Try out capabilities
Now that you've completed onboarding some devices and verified that they are reporting to the service, familiarize yourself with the product by trying out the powerful capabilities that are available right out of the box.

During the pilot, you can easily get started with trying out some of the features to see the product in action without going through complex configuration steps.

Let's start by checking out the dashboards.

### View the device inventory
The device inventory is where you'll see the list of endpoints, network devices, and IoT devices in your network. Not only does it provide you with a view of the devices in your network, but it also gives your in-depth information about them such as  domain, risk level, OS platform, and other details for easy identification of devices most at risk.

### View the Microsoft Defender Vulnerability Management dashboard 
Defender Vulnerability Management management helps you focus on the weaknesses that pose the most urgent and the highest risk to the organization. From the dashboard, get a high-level view of the organization exposure score, Microsoft Secure Score for Devices, device exposure distribution, top security recommendations, top vulnerable software, top remediation activities, and top exposed device data. 

### Run a simulation
Microsoft Defender for Endpoint comes with ["Do It Yourself" attack scenarios](https://securitycenter.windows.com/tutorials) that you can run on your pilot devices.  Each document includes OS and application requirements as well as detailed instructions that are specific to an attack scenario. These scripts are safe, documented, and easy to use. These scenarios will reflect Defender for Endpoint capabilities and walk you through investigation experience.

To run any of the provided simulations, you need at least [one onboarded device](/defender-endpoint/onboard-configure).

1. In **Help** > **Simulations & tutorials**, select which of the available attack scenarios you would like to simulate:

   - **Scenario 1: Document drops backdoor** - simulates delivery of a socially engineered lure document. The document launches a specially crafted backdoor that gives attackers control.

   - **Scenario 2: PowerShell script in fileless attack** - simulates a fileless attack that relies on PowerShell, showcasing attack surface reduction and device learning detection of malicious memory activity.

   - **Scenario 3: Automated incident response** - triggers automated investigation, which automatically hunts for and remediates breach artifacts to scale your incident response capacity.

2. Download and read the corresponding walkthrough document provided with your selected scenario.

3. Download the simulation file or copy the simulation script by navigating to **Help** > **Simulations & tutorials**. You can choose to download the file or script on the test device but it's not mandatory.

4. Run the simulation file or script on the test device as instructed in the walkthrough document.

> [!NOTE]
> Simulation files or scripts mimic attack activity but are actually benign and will not harm or compromise the test device.

## Next step

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-cloud-apps.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Cloud Apps." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-cloud-apps.svg":::

See [Pilot and deploy Microsoft Defender for Cloud Apps](pilot-deploy-defender-cloud-apps.md).
