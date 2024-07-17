---
title: How do I pilot and deploy Microsoft Defender for Cloud Apps?
description: How to pilot and deploy Microsoft Defender for Cloud Apps in your production Microsoft 365 tenant.
search.appverid: met150
ms.service: defender-xdr
f1.keywords:
  - NOCSH
ms.author: bcarter
author: brendacarter
ms.date: 05/31/2024
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

# Pilot and deploy Microsoft Defender for Cloud Apps

**Applies to:**

- Microsoft Defender XDR

This article provides a workflow for piloting and deploying Microsoft Defender for Cloud Apps in your organization. You can use these recommendations to onboard Microsoft Defender for Cloud Apps as an individual cybersecurity tool or as part of an end-to-end solution with Microsoft Defender XDR.

This article assumes you have a production Microsoft 365 tenant and are piloting and deploying Microsoft Defender for Cloud Apps in this environment. This practice will maintain any settings and customizations you configure during your pilot for your full deployment.

Defender for Office 365 contributes to a Zero Trust architecture by helping to prevent or reduce business damage from a breach. For more information, see the [Prevent or reduce business damage from a breach](/security/zero-trust/adopt/prevent-reduce-business-damage-breach) business scenario in the Microsoft Zero Trust adoption framework.

## End-to-end deployment for Microsoft Defender XDR

This is article 5 of 6 in a series to help you deploy the components of Microsoft Defender XDR, including investigating and responding to incidents.

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-cloud-apps.svg" alt-text="A diagram that shows Microsoft Defender for Cloud Apps in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-cloud-apps.svg" border="false":::

The articles in this series correspond to the following phases of end-to-end deployment:

| Phase | Link |
|---|---|
| A. Start the pilot | [Start the pilot](pilot-deploy-overview.md#start-the-pilot)|
| B. Pilot and deploy Microsoft Defender XDR components | - [Pilot and deploy Defender for Identity](pilot-deploy-defender-identity.md) <br><br> - [Pilot and deploy  Defender for Office 365](pilot-deploy-defender-office-365.md) <br><br> - [Pilot and deploy Defender for Endpoint](pilot-deploy-defender-endpoint.md) <br><br> - **Pilot and deploy Microsoft Defender for Cloud Apps** (this article)  |
|C. Investigate and respond to threats | [Practice incident investigation and response](pilot-deploy-investigate-respond.md) |

## Pilot and deploy workflow for Defender for Cloud Apps

The following diagram illustrates a common process to deploy a product or service in an IT environment.

:::image type="content" source="./media/eval-defender-xdr/adoption-phases.svg" alt-text="A diagram of the pilot, evaluate, and full deployment adoption phases." lightbox="./media/eval-defender-xdr/adoption-phases.svg":::

You start by evaluating the product or service and how it will work within your organization. Then, you pilot the product or service with a suitably small subset of your production infrastructure for testing, learning, and customization. Then, gradually increase the scope of the deployment until your entire infrastructure or organization is covered.

Here is the workflow for piloting and deploying Defender for Cloud Apps in your production environment.

:::image type="content" source="./media/eval-defender-xdr/defender-cloud-apps-pilot-deploy-steps.svg" alt-text="A diagram that shows the pilot and deploy workflow for Microsoft Defender for Cloud Apps." lightbox="./media/eval-defender-xdr/defender-cloud-apps-pilot-deploy-steps.svg" border="false":::

Follow these steps:

1. [Connect to the Defender for Cloud Apps portal](#step-1)
1. [Integrate with Microsoft Defender for Endpoint](#step-2)
1. [Deploy the log collector on your firewalls and other proxies](#step-3)
1. [Create a pilot group](#step-4)
1. [Discover and manage cloud apps](#step-5)
1. [Configure Conditional Access App Control](#step-6)
1. [Apply session policies to cloud apps](#step-7)
1. [Try out additional capabilities](#step-8)

Here are the recommended steps for each deployment stage.

| Deployment stage | Description |
| --- | --- |
| Evaluate | Perform product evaluation for Defender for Cloud Apps. |
| Pilot | Perform Steps 1-4 and then 5-8 for a suitable subset of cloud apps in your production environment. |
| Full deployment | Perform Steps 5-8 for your remaining cloud apps, adjusting the scoping for pilot user groups or adding user groups to expand beyond the pilot and include all of your user accounts. |

### Protecting your organization from hackers

Defender for Cloud Apps provides powerful protection on its own. However, when combined with the other capabilities of Microsoft Defender XDR, Defender for Cloud Apps provides data into the shared signals which together help stop attacks.

Here's an example of a cyber-attack and how the components of Microsoft Defender XDR help detect and mitigate it.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-eval-threat-chain.svg" alt-text="A diagram that shows how Microsoft Defender XDR stops a threat chain." lightbox="./media/eval-defender-xdr/m365-defender-eval-threat-chain.svg":::

Defender for Cloud Apps detects anomalous behavior like impossible-travel, credential access, and unusual download, file share, or mail forwarding activity and displays these behaviors in the Defender for Cloud Apps portal. Defender for Cloud Apps also helps prevent lateral movement by hackers and exfiltration of sensitive data.

Microsoft Defender XDR correlates the signals from all the Microsoft Defender components to provide the full attack story.

### Defender for Cloud Apps role as a CASB

A cloud access security broker (CASB) acts as a gatekeeper to broker access in real time between your enterprise users and cloud resources they use, wherever your users are located and regardless of the device they are using. Defender for Cloud Apps is a CASB for your organization's cloud apps. Defender for Cloud Apps natively integrates with Microsoft security capabilities, including Microsoft Defender XDR.

Without Defender for Cloud Apps, cloud apps that are used by your organization are unmanaged and unprotected.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-a.svg" alt-text="A diagram that shows cloud apps that are not managed and protected by your organization." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-a.svg":::

In the illustration:

- The use of cloud apps by an organization is unmonitored and unprotected.
- This use falls outside the protections achieved within a managed organization.

To discover cloud apps used in your environment, you can implement one or both of the following methods:

- Get up and running quickly with Cloud Discovery by integrating with Microsoft Defender for Endpoint. This native integration enables you to immediately start collecting data on cloud traffic across your Windows 10 and Windows 11 devices, on and off your network.
- To discover all cloud apps accessed by all devices connected to your network, deploy the Defender for Cloud Apps log collector on your firewalls and other proxies. This deployment helps collect data from your endpoints and sends it to Defender for Cloud Apps for analysis. Defender for Cloud Apps natively integrates with some third-party proxies for even more capabilities.

This article includes guidance for both methods.

<a name="step-1"></a>

## Step 1. Connect to the Defender for Cloud Apps portal

To verify licensing and to connect to the Defender for Cloud Apps portal, see [Quickstart: Get started with Microsoft Defender for Cloud Apps](/cloud-app-security/getting-started-with-cloud-app-security).

If you're not immediately able to connect to the portal, you might need to add the IP address to the allow list of your firewall. See [Basic setup for Defender for Cloud Apps](/cloud-app-security/general-setup).

If you're still having trouble, review [Network requirements](/cloud-app-security/network-requirements).

<a name="step-2"></a>

## Step 2: Integrate with Microsoft Defender for Endpoint

Microsoft Defender for Cloud Apps integrates with Microsoft Defender for Endpoint natively. The integration simplifies roll out of Cloud Discovery, extends Cloud Discovery capabilities beyond your corporate network and enables device-based investigation. This integration reveals cloud apps and services being accessed from IT-managed Windows 10 and Windows 11 devices.

If you've already set up Microsoft Defender for Endpoint, configuring integration with Defender for Cloud Apps is a toggle in Microsoft Defender XDR. After integration is turned on, you can return to the Defender for Cloud Apps portal and view rich data in the Cloud Discovery Dashboard.

To accomplish these tasks, see [Microsoft Defender for Endpoint integration with Microsoft Defender for Cloud Apps](/cloud-app-security/mde-integration).

<a name="step-3"></a>

## Step 3: Deploy the Defender for Cloud Apps log collector on your firewalls and other proxies

For coverage on all devices connected to your network, deploy the Defender for Cloud Apps log collector on your firewalls and other proxies to collect data from your endpoints and send it to Defender for Cloud Apps for analysis.

If you're using one of the following Secure Web Gateways (SWG), Defender for Cloud Apps provides seamless deployment and integration:

- Zscaler
- iboss
- Corrata
- Menlo Security

For more information on integrating with these network devices, see [Set up Cloud Discovery](/cloud-app-security/set-up-cloud-discovery).

<a name="step-4"></a>

## Step 4. Create a pilot group — Scope your pilot deployment to certain user groups

Microsoft Defender for Cloud Apps enables you to scope your deployment. Scoping allows you to select certain user groups to be monitored for apps or excluded from monitoring. You can include or exclude user groups. To scope your pilot deployment, see [Scoped Deployment](/cloud-app-security/scoped-deployment).

<a name="step-5"></a>

## Step 5. Discover and manage cloud apps

For Defender for Cloud Apps to provide the maximum amount of protection, you must discover all the cloud apps in your organization and manage how they are used.

### Discover cloud apps

The first step to managing the use of cloud apps is to discover which cloud apps are used by your organization. This next diagram illustrates how cloud discovery works with Defender for Cloud Apps.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-b.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Cloud Apps with cloud discovery." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-b.svg":::

In this illustration, there are two methods that can be used to monitor network traffic and discover cloud apps that are being used by your organization.

1. Cloud App Discovery integrates with Microsoft Defender for Endpoint natively. Defender for Endpoint reports cloud apps and services being accessed from IT-managed Windows 10 and Windows 11 devices.

2. For coverage on all devices connected to a network, you install the Defender for Cloud Apps log collector on firewalls and other proxies to collect data from endpoints. The collector sends this data to Defender for Cloud Apps for analysis.

View the Cloud Discovery dashboard to see what apps are being used in your organization

The Cloud Discovery dashboard is designed to give you more insight into how cloud apps are being used in your organization. It provides an at-a-glance overview of what kinds of apps are being used, your open alerts, and the risk levels of apps in your organization.

To get started using the Cloud Discovery dashboard, see [Working with discovered apps](/cloud-app-security/discovered-apps).

### Manage cloud apps

After you discover cloud apps and analyze how these apps are used by your organization, you can begin managing cloud apps that you choose.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-c.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Cloud Apps for managing cloud apps." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-c.svg":::

In this illustration:

- Some apps are sanctioned for use. Sanctioning is a simple way of beginning to manage apps.
- You can enable greater visibility and control by connecting apps with app connectors. App connectors use the APIs of app providers.

You can begin managing apps by sanctioning, unsanctioning, or outright blocking apps. To begin managing apps, see [Govern discovered apps](/defender-cloud-apps/governance-discovery).

<a name="step-6"></a>

## Step 6. Configure Conditional Access App Control

One of the most powerful protections you can configure is Conditional Access App Control. This protection requires integration with Microsoft Entra ID. It allows you to apply Conditional Access policies, including related policies (like requiring healthy devices), to cloud apps you've sanctioned.

You might already have SaaS apps added to your Microsoft Entra tenant to enforce multi-factor authentication and other conditional access policies. Microsoft Defender for Cloud Apps natively integrates with Microsoft Entra ID. All you must do is configure a policy in Microsoft Entra ID to use Conditional Access App Control in Defender for Cloud Apps. This routes network traffic for these managed SaaS apps through Defender for Cloud Apps as a proxy, which allows Defender for Cloud Apps to monitor this traffic and to apply session controls.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-e.svg" alt-text="A diagram that shows the architecture for the Microsoft Defender for Cloud Apps with SaaS apps." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-e.svg":::

In this illustration:

- SaaS apps are integrated with the Microsoft Entra tenant. This integration allows Microsoft Entra ID to enforce conditional access policies, including multi-factor authentication.
- A policy is added to Microsoft Entra ID to direct traffic for SaaS apps to Defender for Cloud Apps. The policy specifies which SaaS apps to apply this policy to. After Microsoft Entra ID enforces any conditional access policies that apply to these SaaS apps, Microsoft Entra ID then directs (proxies) the session traffic through Defender for Cloud Apps.
- Defender for Cloud Apps monitors this traffic and applies any session control policies that have been configured by administrators.

You might have discovered and sanctioned cloud apps using Defender for Cloud Apps that have not been added to Microsoft Entra ID. You can take advantage of Conditional Access App Control by adding these cloud apps to your Microsoft Entra tenant and the scope of your conditional access rules.

The first step in using Microsoft Defender for Cloud Apps to manage SaaS apps is to discover these apps and then add them to your Microsoft Entra tenant. If you need help with discovery, see [Discover and manage SaaS apps in your network](/cloud-app-security/tutorial-shadow-it). After you've discovered apps, [add these apps to your Microsoft Entra tenant](/azure/active-directory/manage-apps/add-application-portal).

You can begin to manage these apps with the following tasks:

1. In Microsoft Entra ID, create a new conditional access policy and configure it to "Use Conditional Access App Control." This configuration helps to redirect the request to Defender for Cloud Apps. You can create one policy and add all SaaS apps to this policy.
2. Next, in Defender for Cloud Apps, create session policies. Create one policy for each control you want to apply.

For more information, including supported apps and clients, see [Protect apps with Microsoft Defender for Cloud Apps Conditional Access App Control](/cloud-app-security/proxy-intro-aad).

For example policies, see [Recommended Microsoft Defender for Cloud Apps policies for SaaS apps](/security/zero-trust/zero-trust-identity-device-access-policies-mcas-saas). These policies build on a set of [common identity and device access policies](/security/zero-trust/zero-trust-identity-device-access-policies-overview) that are recommended as a starting point for all customers.

<a name="step-7"></a>

## Step 7. Apply session policies to cloud apps

Microsoft Defender for Cloud Apps serves as a reverse proxy, providing proxy access to sanctioned cloud apps. This provision allows Defender for Cloud Apps to apply session policies that you configure.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-d.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Cloud Apps with proxy access session control." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-d.svg":::

In the illustration:

- Access to sanctioned cloud apps from users and devices in your organization is routed through Defender for Cloud Apps.
- This proxy access allows session policies to be applied.
- Cloud apps that you have not sanctioned or explicitly unsanctioned are not affected.

Session policies allow you to apply parameters to how cloud apps are used by your organization. For example, if your organization is using Salesforce, you can configure a session policy that allows only managed devices to access your organization's data at Salesforce. A simpler example could be configuring a policy to monitor traffic from unmanaged devices so you can analyze the risk of this traffic before applying stricter policies.

For more information, see [Create session policies](/defender-cloud-apps/session-policy-aad).

<a name="step-8"></a>

## Step 8. Try out additional capabilities

Use these Defender for Cloud Apps tutorials to help you discover risk and protect your environment:

- [Detect suspicious user activity](/cloud-app-security/tutorial-suspicious-activity)
- [Investigate risky users](/cloud-app-security/tutorial-ueba)
- [Investigate risky OAuth apps](/cloud-app-security/investigate-risky-oauth)
- [Discover and protect sensitive information](/cloud-app-security/tutorial-dlp)
- [Protect any app in your organization in real time](/cloud-app-security/tutorial-proxy)
- [Block downloads of sensitive information](/cloud-app-security/use-case-proxy-block-session-aad)
- [Protect your files with admin quarantine](/cloud-app-security/use-case-admin-quarantine)
- [Require step-up authentication upon risky action](/cloud-app-security/tutorial-step-up-authentication)

For more information on advanced hunting in Microsoft Defender for Cloud Apps data, see this [video](https://www.microsoft.com/en-us/videoplayer/embed/RWFISa).

## SIEM integration

You can integrate Defender for Cloud Apps with Microsoft Sentinel or a generic security information and event management (SIEM) service to enable centralized monitoring of alerts and activities from connected apps. With Microsoft Sentinel, you can more comprehensively analyze security events across your organization and build playbooks for effective and immediate response.

:::image type="content" source="./media/eval-defender-xdr/defender-cloud-apps-siem-integration.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Cloud Apps with SIEM integration." lightbox="./media/eval-defender-xdr/defender-cloud-apps-siem-integration.svg":::

Microsoft Sentinel includes a Defender for Cloud Apps connector. This allows you to not only gain visibility into your cloud apps but to also get sophisticated analytics to identify and combat cyberthreats and to control how your data travels. For more information, see [Microsoft Sentinel integration](/defender-cloud-apps/siem-sentinel) and [Stream alerts and Cloud Discovery logs from Defender for Cloud Apps into Microsoft Sentinel](/azure/sentinel/connect-cloud-app-security).

For information about integration with third-party SIEM systems, see [Generic SIEM integration](/cloud-app-security/siem).

## Next step

Perform [lifecycle management for Defender for Cloud Apps](/defender-cloud-apps/lifecycle-management).

## Next step for the end-to-end deployment of Microsoft Defender XDR

Continue your end-to-end deployment of Microsoft Defender XDR with [Investigate and respond using Microsoft Defender XDR](pilot-deploy-investigate-respond.md).

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-investigate-respond.svg" alt-text="A diagram that shows incident investigation and response in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-investigate-respond.svg" border="false":::

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
