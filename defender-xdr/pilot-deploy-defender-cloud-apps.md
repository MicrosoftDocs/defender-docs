---
title: Pilot and deploy Microsoft Defender for Cloud Apps
description: Microsoft Defender for Cloud Apps technical diagrams explain the architecture in Microsoft Defender XDR, which will help you build a pilot environment.
search.appverid: met150
ms.service: defender-xdr
f1.keywords:
  - NOCSH
ms.author: bcarter
author: brendacarter
ms.date: 05/16/2024
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

This article provides a workflow for piloting and deploying Microsoft Defender for Cloud Apps.

## End-to-end deployment for Microsoft Defender XDR

This is article 5 of 6 in a series to help you deploy the components of Microsoft Defender XDR, including investigating and responding to incidents.

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-cloud-apps.svg" alt-text="A diagram that shows Microsoft Defender for Cloud Apps in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-cloud-apps.svg":::

Articles in this series:

1. [Create the pilot environment](pilot-deploy-investigate-respond.md)
1. [Pilot and deploy Defender for Identity](pilot-deploy-defender-identity.md)
1. [Pilot and deploy Defender for Office 365](pilot-deploy-defender-office-365.md)
1. [Pilot and deploy Defender for Endpoint](pilot-deploy-defender-endpoint.md)
1. Pilot and deploy **Defender for Cloud Apps** (this article)
1. [Investigate and respond to threats](pilot-deploy-investigate-respond.md)

## Pilot and deploy workflow for Defender for Cloud Apps

Here is the workflow for piloting and deploying Defender for Cloud Apps in your production environment.

:::image type="content" source="./media/eval-defender-xdr/defender-cloud-apps-pilot-deploy-steps.svg" alt-text="A diagram that shows the pilot and deploy workflow for Microsoft Defender for Cloud Apps." lightbox="./media/eval-defender-xdr/defender-cloud-apps-pilot-deploy-steps.svg":::

Follow these steps:

1. Connect to the Defender for Cloud Apps portal
1. Integrate with Microsoft Defender for Endpoint
1. Deploy the log collector on your firewalls and other proxies
1. Create a pilot group
1. Discover and manage cloud apps
1. Configure Conditional Access App Control
1. Apply session policies to cloud apps
1. Try out additional capabilities

### Protecting your organization from hackers

Defender for Cloud Apps provides powerful protection on its own. However, when combined with the other capabilities of Microsoft Defender XDR, Defender for Cloud Apps provides data into the shared signals which together help stop attacks.

Here's an example of a cyber-attack and how the components of Microsoft Defender XDR help detect and mitigate it.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-eval-threat-chain.svg" alt-text="A diagram that shows how Microsoft Defender XDR stops a threat chain." lightbox="./media/eval-defender-xdr/m365-defender-eval-threat-chain.svg":::

Defender for Cloud Apps detects anomalous behavior like impossible-travel, credential access, and unusual download, file share, or mail forwarding activity and displays these behaviors in the Defender for Cloud Apps portal. Defender for Cloud Apps also helps prevent lateral movement by hackers and exfiltration of sensitive data. 

Microsoft Defender XDR correlates the signals from all the Microsoft Defender components to provide the full attack story.

### About the workflow

Defender for Cloud Apps is a cloud access security broker (CASB). CASBs act a gatekeeper to broker access in real time between your enterprise users and cloud resources they use, wherever your users are located and regardless of the device they are using. Defender for Cloud Apps natively integrates with Microsoft security capabilities, including Microsoft Defender XDR.

Without Defender for Cloud Apps, cloud apps that are used by your organization are unmanaged and unprotected, as illustrated.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-a.svg" alt-text="A diagram that shows cloud apps that are not managed and protected by your organization." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-a.svg":::

In the illustration:

- The use of cloud apps by an organization is unmonitored and unprotected.
- This use falls outside the protections achieved within a managed organization.

To discover cloud apps used in your environment, you can implement one or both of the following methods:

- Get up and running quickly with Cloud Discovery by integrating with Microsoft Defender for Endpoint. This native integration enables you to immediately start collecting data on cloud traffic across your Windows 10 and Windows 11 devices, on and off your network.
- To discover all cloud apps accessed by all devices connected to your network, deploy the Defender for Cloud Apps log collector on your firewalls and other proxies. This deployment helps collect data from your endpoints and sends it to Defender for Cloud Apps for analysis. Defender for Cloud Apps natively integrates with some third-party proxies for even more capabilities.

This article includes guidance for both methods.

### Understand key concepts

The following table identified key concepts that are important to understand when evaluating, configuring, and deploying Defender for Cloud Apps.

|Concept  |Description |More information  |
|---------|---------|---------|
| Defender for Cloud Apps Dashboard | Presents an overview of the most important information about your organization and gives links to deeper investigation.        | [Working with the dashboard](/cloud-app-security/daily-activities-to-protect-your-cloud-environment)       |
| Conditional Access App Control    | Reverse proxy architecture that integrates with your Identity Provider (IdP) to give Microsoft Entra Conditional Access policies and selectively enforce session policies.        |  [Protect apps with Defender for Cloud Apps Conditional Access App Control](/cloud-app-security/proxy-intro-aad)       |
|  Cloud App Catalog   | The Cloud App Catalog gives you a full picture against Microsoft catalog of over 16,000 cloud apps that are ranked and scored based on more than 80 risk factors.    |  [Working with App risk scores](/cloud-app-security/risk-score)       |
| Cloud Discovery Dashboard    | Cloud Discovery analyzes your traffic logs and is designed to give more insight into how cloud apps are being used in your organization as well as give alerts and risk levels.     |  [Working with discovered apps](/cloud-app-security/discovered-apps)    |
|Connected Apps |Defender for Cloud Apps provides end-to-end protection for connected apps using Cloud-to-Cloud integration, API connectors, and real-time access and session policies using our Conditional App Access Controls. |[Protecting connected apps](/cloud-app-security/protect-connected-apps) |

<a name="step-1"></a>

## Step 1. Connect to the Defender for Cloud Apps portal

To verify licensing and to connect to the Defender for Cloud Apps portal, see [Quickstart: Get started with Microsoft Defender for Cloud Apps](/cloud-app-security/getting-started-with-cloud-app-security).

If you're not immediately able to connect to the portal, you might need to add the IP address to the allowlist of your firewall. See [Basic setup for Defender for Cloud Apps](/cloud-app-security/general-setup).

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

>> Add intro

### Discover cloud apps

The first step to managing the use of cloud apps is to discover which cloud apps are used by your organization. This next diagram illustrates how cloud discovery works with Defender for Cloud Apps.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-b.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Cloud Apps with cloud discovery." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-b.svg":::

In this illustration, there are two methods that can be used to monitor network traffic and discover cloud apps that are being used by your organization.

- A. Cloud App Discovery integrates with Microsoft Defender for Endpoint natively. Defender for Endpoint reports cloud apps and services being accessed from IT-managed Windows 10 and Windows 11 devices.
- B. For coverage on all devices connected to a network, the Defender for Cloud Apps log collector is installed on firewalls and other proxies to collect data from endpoints. This data is sent to Defender for Cloud Apps for analysis.

View the Cloud Discovery dashboard to see what apps are being used in your organization

The Cloud Discovery dashboard is designed to give you more insight into how cloud apps are being used in your organization. It provides an at-a-glance overview of what kinds of apps are being used, your open alerts, and the risk levels of apps in your organization.

To get started using the Cloud Discovery dashboard, see [Working with discovered apps](/cloud-app-security/discovered-apps).

### Manage cloud apps

After you discover cloud apps and analyze how these apps are used by your organization, you can begin managing cloud apps that you choose.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-c.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Cloud Apps for managing cloud apps." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-c.svg":::

In this illustration:

- Some apps are sanctioned for use. This sanction is a simple way of beginning to manage apps.
- You can enable greater visibility and control by connecting apps with app connectors. App connectors use the APIs of app providers.

You can begin managing apps by sanctioning, unsanctioning, or outright blocking apps. To begin managing apps, see [Govern discovered apps](/defender-cloud-apps/governance-discovery).

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

For example policies, see [Recommended Microsoft Defender for Cloud Apps policies for SaaS apps](/defender-office-365/zero-trust-identity-device-access-policies-mcas-saas). These policies build on a set of [common identity and device access policies](/defender-office-365/zero-trust-identity-device-access-policies-overview) that are recommended as a starting point for all customers.

## Step 7. Apply session policies to cloud apps

Microsoft Defender for Cloud Apps serves as a reverse proxy, providing proxy access to sanctioned cloud apps. This provision allows Defender for Cloud Apps to apply session policies that you configure.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-d.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Cloud Apps with proxy access session control." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-d.svg":::

In the illustration:

- Access to sanctioned cloud apps from users and devices in your organization is routed through Defender for Cloud Apps.
- This proxy access allows session policies to be applied.
- Cloud apps that you have not sanctioned or explicitly unsanctioned are not affected.

Session policies allow you to apply parameters to how cloud apps are used by your organization. For example, if your organization is using Salesforce, you can configure a session policy that allows only managed devices to access your organization's data at Salesforce. A simpler example could be configuring a policy to monitor traffic from unmanaged devices so you can analyze the risk of this traffic before applying stricter policies.

For more information, see [Create session policies](/defender-cloud-apps/session-policy-aad).

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

You can integrate Defender for Cloud Apps with your generic SIEM server or with Microsoft Sentinel to enable centralized monitoring of alerts and activities from connected apps.

Additionally, Microsoft Sentinel includes a Defender for Cloud Apps connector to provide deeper integration with Microsoft Sentinel. This arrangement enables you to not only gain visibility into your cloud apps but to also get sophisticated analytics to identify and combat cyberthreats and to control how your data travels.

- [Generic SIEM integration](/cloud-app-security/siem)
- [Stream alerts and Cloud Discovery logs from Defender for Cloud Apps into Microsoft Sentinel](/azure/sentinel/connect-cloud-app-security)

## Next step for the end-to-end deployment of Microsoft Defender XDR

>> Add

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-investigate-respond.svg" alt-text="A diagram that shows incident investigation and response in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-investigate-respond.svg":::

See [Investigate and respond using Microsoft Defender XDR](pilot-deploy-investigate-respond.md).

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]

<!---

<a name="step-1"></a>

## Step 1. Connect to the Defender for Cloud Apps portal

To verify licensing and to connect to the Defender for Cloud Apps portal, see [Quickstart: Get started with Defender for Cloud Apps](/cloud-app-security/getting-started-with-cloud-app-security).

If you're not immediately able to connect to the portal, you might need to add the IP address to the allowlist of your firewall. See [Basic setup for Defender for Cloud Apps](/cloud-app-security/general-setup).

If you're still having trouble, review [Network requirements](/cloud-app-security/network-requirements).


<a name="step-2"></a>

## Step 2: Integrate with Microsoft Defender for Endpoint

Defender for Cloud Apps integrates with Microsoft Defender for Endpoint natively. The integration simplifies roll out of Cloud Discovery, extends Cloud Discovery capabilities beyond your corporate network, and enables device-based investigation. This integration reveals cloud apps and services being accessed from IT-managed Windows 10 and Windows 11 devices.

If you've already set up Microsoft Defender for Endpoint, configuring integration with Defender for Cloud Apps is a toggle in Microsoft Defender XDR. After integration is turned on, you can return to the Defender for Cloud Apps portal and view rich data in the Cloud Discovery Dashboard.

To accomplish these tasks, see [Microsoft Defender for Endpoint integration with Defender for Cloud Apps](/cloud-app-security/mde-integration).

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

## Step 4. Create a pilot group

Defender for Cloud Apps enables you to scope your deployment. Scoping allows you to select certain user groups to be monitored for apps or excluded from monitoring. You can include or exclude user groups. To scope your pilot deployment, see [Scoped Deployment](/cloud-app-security/scoped-deployment).


<a name="step-5"></a>

## Step 5. Discover cloud apps

The first step to managing the use of cloud apps is to discover which cloud apps are used by your organization. This next diagram illustrates how cloud discovery works with Defender for Cloud Apps.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-b.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Cloud Apps with cloud discovery." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-b.svg":::

In this illustration, there are two methods that can be used to monitor network traffic and discover cloud apps that are being used by your organization.

1. Cloud App Discovery integrates with Microsoft Defender for Endpoint natively. Defender for Endpoint reports cloud apps and services being accessed from IT-managed Windows 10 and Windows 11 devices.
2. For coverage on all devices connected to a network, the Defender for Cloud Apps log collector is installed on firewalls and other proxies to collect data from endpoints. This data is sent to Defender for Cloud Apps for analysis.

View the Cloud Discovery dashboard to see what apps are being used in your organization

The Cloud Discovery dashboard is designed to give you more insight into how cloud apps are being used in your organization. It provides an at-a-glance overview of what kinds of apps are being used, your open alerts, and the risk levels of apps in your organization.

To get started using the Cloud Discovery dashboard, see [Working with discovered apps](/cloud-app-security/discovered-apps).

## Step 6. Configure Conditional Access App Control

One of the most powerful protections you can configure is Conditional Access App Control. This protection requires integration with Microsoft Entra ID. It allows you to apply Conditional Access policies, including related policies (like requiring healthy devices), to cloud apps you've sanctioned.

You might already have SaaS apps added to your Microsoft Entra tenant to enforce multi-factor authentication and other conditional access policies. Defender for Cloud Apps natively integrates with Microsoft Entra ID. All you have to do is configure a policy in Microsoft Entra ID to use Conditional Access App Control in Defender for Cloud Apps. This routes network traffic for these managed SaaS apps through Defender for Cloud Apps as a proxy, which allows Defender for Cloud Apps to monitor this traffic and to apply session policies.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-e.svg" alt-text="A diagram that shows the architecture for the Defender for Cloud Apps with SaaS apps." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-e.svg":::

In this illustration:

- SaaS apps are integrated with the Microsoft Entra tenant. This integration allows Microsoft Entra ID to enforce conditional access policies, including multi-factor authentication.
- A policy is added to Microsoft Entra ID to direct traffic for SaaS apps to Defender for Cloud Apps. The policy specifies which SaaS apps to apply this policy to. Therefore, after Microsoft Entra ID enforces any conditional access policies that apply to these SaaS apps, Microsoft Entra ID then directs (proxies) the session traffic through Defender for Cloud Apps.
- Defender for Cloud Apps monitors this traffic and applies any session control policies that have been configured by administrators.

You might have discovered and sanctioned cloud apps using Defender for Cloud Apps that have not been added to Microsoft Entra ID. You can take advantage of Conditional Access App Control by adding these cloud apps to your Microsoft Entra tenant and the scope of your conditional access rules.
The first step in using Defender for Cloud Apps to manage SaaS apps is to discover these apps and then add them to your Microsoft Entra tenant. If you need help with discovery, see [Discover and manage SaaS apps in your network](/cloud-app-security/tutorial-shadow-it). After you've discovered apps, [add these apps to your Microsoft Entra tenant](/azure/active-directory/manage-apps/add-application-portal).

You can begin to manage these apps by executing the following tasks:

- First, in Microsoft Entra ID, create a new conditional access policy and configure it to "Use Conditional Access App Control." This configuration helps to redirect the request to Defender for Cloud Apps. You can create one policy and add all SaaS apps to this policy.
- Next, in Defender for Cloud Apps, create session policies. Create one policy for each control you want to apply.

For more information, including supported apps and clients, see [Protect apps with Defender for Cloud Apps Conditional Access App Control](/cloud-app-security/proxy-intro-aad).

For example policies, see [Recommended Defender for Cloud Apps policies for SaaS apps](/defender-office-365/zero-trust-identity-device-access-policies-mcas-saas). These policies build on a set of [common identity and device access policies](/defender-office-365/zero-trust-identity-device-access-policies-overview) that are recommended as a starting point for all customers.

## Step 7. Manage cloud apps

After you discover cloud apps and analyze how these apps are used by your organization, you can begin managing cloud apps that you choose.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-c.svg" alt-text="A diagram that shows the architecture for Defender for Cloud Apps for managing cloud apps." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-c.svg":::

In this illustration:

- Some apps are sanctioned for use. This sanction is a simple way of beginning to manage apps.
- You can enable greater visibility and control by connecting apps with app connectors. App connectors use the APIs of app providers.


[need a contrete task here -- likely sanction apps]



## Step 8. Apply session policies to cloud apps

Defender for Cloud Apps serves as a reverse proxy, providing proxy access to sanctioned cloud apps. This provision allows Defender for Cloud Apps to apply session policies that you configure.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-mcas-architecture-d.svg" alt-text="A diagram that shows the architecture for Defender for Cloud Apps with proxy access session control." lightbox="./media/eval-defender-xdr/m365-defender-mcas-architecture-d.svg":::

In this illustration:

- Access to sanctioned cloud apps from users and devices in your organization is routed through Defender for Cloud Apps.
- This proxy access allows session policies to be applied.
- Cloud apps that you have not sanctioned or explicitly unsanctioned are not affected.

session policies allow you to apply parameters to how cloud apps are used by your organization. For example, if your organization is using Salesforce, you can configure a session policy that allows only managed devices to access your organization's data at Salesforce. A simpler example could be configuring a policy to monitor traffic from unmanaged devices so you can analyze the risk of this traffic before applying stricter policies.

[need to refer to a concrete task for doing this]

## Step 9. Try out additional capabilities

The Defender for Cloud Apps documentation includes a series of tutorials to help you discover risk and protect your environment.

Try out Defender for Cloud Apps tutorials:

- [Detect suspicious user activity](/cloud-app-security/tutorial-suspicious-activity)
- [Investigate risky users](/cloud-app-security/tutorial-ueba)
- [Investigate risky OAuth apps](/cloud-app-security/investigate-risky-oauth)
- [Discover and protect sensitive information](/cloud-app-security/tutorial-dlp)
- [Protect any app in your organization in real time](/cloud-app-security/tutorial-proxy)
- [Block downloads of sensitive information](/cloud-app-security/use-case-proxy-block-session-aad)
- [Protect your files with admin quarantine](/cloud-app-security/use-case-admin-quarantine)
- [Require step-up authentication upon risky action](/cloud-app-security/tutorial-step-up-authentication)

For more information on advanced hunting in Defender for Cloud Apps data, see the [video](https://www.microsoft.com/en-us/videoplayer/embed/RWFISa).

--->

<!---


---
title: Evaluate Microsoft Defender for Cloud Apps overview
description: Steps to set up your Microsoft Defender XDR trial lab or pilot environment to try out and experience the security solution designed to protect devices, identity, data, and applications in your organization.
search.appverid: met150
ms.service: defender-xdr
f1.keywords:
  - NOCSH
ms.author: bcarter
author: brendacarter
ms.date: 07/09/2021
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

# Evaluate Microsoft Defender for Cloud Apps

**Applies to:**
- Microsoft Defender XDR

This article outlines the process to enable and pilot Microsoft Defender for Cloud Apps alongside Microsoft Defender XDR. Before starting this process, be sure you've reviewed the overall process for [evaluating Microsoft Defender XDR](pilot-deploy-overview.md) and you have created the Microsoft Defender XDR pilot environment.

Use the following steps to enable and pilot Microsoft Defender for Cloud Apps.

:::image type="content" source="/defender/media/defender/m365-defender-office-eval-steps.png" alt-text="The steps for adding Microsoft Defender for Office to the Defender evaluation environment" lightbox="/defender/media/defender/m365-defender-office-eval-steps.png":::

|Step  |Description  |
|---------|---------|
|Review architecture requirements and key concepts    | Understand the Defender for Cloud Apps architecture and how it integrates with Microsoft Defender XDR, Microsoft Defender for Endpoint, and Microsoft Entra ID.        |
|Enable the evaluation environment     | Connect to the portal, configure integration with Defender for Identity and/or your organization's network devices, and begin to view and manage cloud apps.         |
|Set up the pilot    | Scope your deployment to certain user groups, configure Conditional Access App Control, and try out tutorials for protecting your environment.       |
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]


--->

