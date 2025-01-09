---
title: How do I pilot and deploy Microsoft Defender XDR?
description: How to pilot and deploy Microsoft Defender XDR and its components in your production Microsoft 365 tenant.
search.appverid: met150
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: tracyp
author: MSFTTracyP
ms.date: 05/31/2024
ms.localizationpriority: medium
manager: dansimp 
audience: ITPro
ms.collection: 
  - m365-security
  - m365solution-overview
  - m365solution-evalutatemtp
  - zerotrust-solution
  - highpri
  - tier1
ms.topic: solution-overview
---

# Pilot and deploy Microsoft Defender XDR

**Applies to:**

- Microsoft Defender XDR

This series of articles steps you through the entire process of piloting the components of Microsoft Defender XDR in your production tenant so you can evaluate their features and capabilities and then completing the deployment across your organization.

<a name='microsoft-365-defender-is-a-microsoft-xdr-cyber-security-solution'></a>

An eXtended detection and response (XDR) solution is a step forward in cyber security because it takes the threat data from systems that were once isolated and unifies them so that you can see patterns and act on suspected cyberattacks faster.

Microsoft Defender XDR:

- Is an XDR solution that combines the information on cyberattacks for identities, endpoints, email, and cloud apps in one place. It leverages artificial intelligence (AI) and automation to automatically stop some types of attacks and remediate affected assets to a safe state.

- Is a cloud-based, unified, pre- and post-breach enterprise defense suite. It coordinates prevention, detection, investigation, and response across identities, endpoints, email, cloud apps, and their data.

- Contributes to a strong Zero Trust architecture by providing threat protection and detection. It helps prevent or reduce business damage from a breach. For more information, see the [Implement threat protection and XDR](/security/zero-trust/adopt/prevent-reduce-business-damage-breach-threat-protection) business scenario in the Microsoft Zero Trust adoption framework.

<a name='microsoft-365-defender-components-secure-devices-identity-data-and-applications'></a>

## Microsoft Defender XDR components and architecture

This table lists the components of Microsoft Defender XDR.

|Component|Description|For more information|
|---|---|---|
| Microsoft Defender for Identity | Uses signals from your on-premises Active Directory Domain Services (AD DS) and Active Directory Federation Services (AD FS) to identify, detect, and investigate advanced threats, compromised identities, and malicious insider actions directed at your organization. | [What is Microsoft Defender for Identity?](/defender-for-identity/what-is) |
| Exchange Online Protection | The native cloud-based SMTP relay and filtering service that helps protect your organization against spam and malware. | [Exchange Online Protection (EOP) overview - Office 365](/defender-office-365/eop-about) |
| Microsoft Defender for Office 365 | Safeguards your organization against malicious threats posed by email messages, links (URLs) and collaboration tools. | [Microsoft Defender for Office 365 - Office 365](/defender-office-365/defender-for-office-365-whats-new) |
| Microsoft Defender for Endpoint | A unified platform for device protection, post-breach detection, automated investigation, and recommended response. | [Microsoft Defender for Endpoint - Windows security](/defender-endpoint/microsoft-defender-endpoint) |
| Microsoft Defender for Cloud Apps | A comprehensive cross-SaaS solution bringing deep visibility, strong data controls, and enhanced threat protection to your cloud apps. | [What is Defender for Cloud Apps?](/cloud-app-security/what-is-cloud-app-security) |
| Microsoft Entra ID Protection | Evaluates risk data from billions of sign-in attempts and uses this data to evaluate the risk of each sign-in to your tenant. This data is used by Microsoft Entra ID to allow or prevent account access, depending on how Conditional Access policies are configured. Microsoft Entra ID Protection is separate from Microsoft Defender XDR and is included with Microsoft Entra ID P2 licenses.| [What is Identity Protection?](/azure/active-directory/identity-protection/overview-identity-protection) |

This illustration shows the architecture and integration of Microsoft Defender XDR components.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-eval-architecture.svg" alt-text="A diagram that shows the high-level architecture of Microsoft Defender XDR." lightbox="./media/eval-defender-xdr/m365-defender-eval-architecture.svg":::

In this illustration:

- Microsoft Defender XDR combines the signals from all of the Defender components to provide XDR across domains. This includes a unified incident queue, automated response to stop attacks, self-healing (for compromised devices, user identities, and mailboxes), cross-threat hunting, and threat analytics.
- Microsoft Defender for Office 365 safeguards your organization against malicious threats posed by email messages, links (URLs), and collaboration tools. It shares signals resulting from these activities with Microsoft Defender XDR. Exchange Online Protection (EOP) is integrated to provide end-to-end protection for incoming email and attachments.
- Microsoft Defender for Identity gathers signals from AD DS domain controllers and servers running AD FS and AD CS. It uses these signals to protect your hybrid identity environment, including protecting against hackers that use compromised accounts to move laterally across workstations in the on-premises environment.
- Microsoft Defender for Endpoint gathers signals from and protects devices managed by your organization.
- Microsoft Defender for Cloud Apps gathers signals from your organization's use of cloud apps and protects data flowing between your IT environment and these apps, including both sanctioned and unsanctioned cloud apps.
- Microsoft Entra ID Protection evaluates risk data from billions of sign-in attempts and uses this data to evaluate the risk of each sign-in to your tenant. This data is used by Microsoft Entra ID to allow or prevent account access based on the conditions and restrictions of your [Conditional Access policies](/security/zero-trust/zero-trust-identity-device-access-policies-overview). Microsoft Entra ID Protection is separate from Microsoft Defender XDR and is included with Microsoft Entra ID P2 licenses.

<a name='microsoft-siem-and-soar-can-use-data-from-microsoft-365-defender'></a>

### Microsoft Defender XDR components and SIEM integration

You can integrate Microsoft Defender XDR components with Microsoft Sentinel or a generic security information and event management (SIEM) service to enable centralized monitoring of alerts and activities from connected apps.

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-siem-integration.svg" alt-text="A diagram that shows Microsoft Defender XDR integration with SIEM." lightbox="./media/eval-defender-xdr/defender-xdr-siem-integration.svg":::

Microsoft Sentinel is a cloud-native solution that provides SIEM and security orchestration, automation, and response (SOAR) capabilities. Together, Microsoft Sentinel and Microsoft Defender XDR components provide a comprehensive solution to help organizations defend against modern attacks. 

Microsoft Sentinel includes connectors for Microsoft Defender components. This allows you to not only gain visibility into your cloud apps but to also get sophisticated analytics to identify and combat cyberthreats and to control how your data travels. For more information, see [Overview of Microsoft Defender XDR and Microsoft Sentinel integration](/azure/sentinel/microsoft-365-defender-sentinel-integration) and [Integration steps for Microsoft Sentinel and Microsoft Defender XDR](/azure/sentinel/connect-microsoft-365-defender?tabs=MDE).

For more information about SOAR in Microsoft Sentinel (including links to playbooks in the Microsoft Sentinel GitHub Repository), see [Automate threat response with playbooks in Microsoft Sentinel](/azure/sentinel/automate-responses-with-playbooks).

For information about integration with third-party SIEM systems, see [Generic SIEM integration](/cloud-app-security/siem).

## Microsoft Defender XDR and an example cyber security attack

This diagram shows a common cyber-attack and the components of Microsoft Defender XDR that help detect and remediate it.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-eval-threat-chain.svg" alt-text="A diagram that shows the various attempts of a cyber security attack." lightbox="./media/eval-defender-xdr/m365-defender-eval-threat-chain.svg":::

The cyber-attack starts with a phishing email that arrives at the Inbox of an employee in your organization, who unknowingly opens the email attachment. This attachment installs malware, which can lead to a chain of attack attempts that can result in the theft of sensitive data.

In the illustration:

- **Exchange Online Protection**, part of Microsoft Defender for Office 365, can detect the phishing email and use mail flow rules (also known as transport rules) to make certain it never arrives in a user's Inbox.
- **Defender for Office 365** uses Safe Attachments to test the attachment and determine that it's harmful, so the mail that arrives either isn't actionable by the user, or policies prevent the mail from arriving at all.
- **Defender for Endpoint** detects device and network vulnerabilities that might otherwise be exploited for devices managed by your organization.
- **Defender for Identity** takes note of sudden on-premises user account changes like privilege escalation or high-risk lateral movement. It also reports on easily exploited identity issues like unconstrained Kerberos delegation, for correction by your security team.
- **Microsoft Defender for Cloud Apps** detects anomalous behavior such as impossible-travel, credential access, and unusual downloading, file sharing, or mail forwarding activity and reports these to your security team.

<a name='the-evaluation-process-for-microsoft-365-defender-cyber-security'></a>

## The pilot and deploy process for Microsoft Defender XDR

Microsoft recommends enabling the components of Microsoft 365 Defender in the following order.

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow.svg" alt-text="A diagram that shows the pilot and deploy process for Microsoft Defender XDR." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow.svg" border="false":::

| Phase | Link |
|---|---|
| A. Start the pilot | [Start the pilot](#start-the-pilot)|
| B. Pilot and deploy Microsoft Defender XDR components | - [Pilot and deploy Defender for Identity](pilot-deploy-defender-identity.md) <br><br> - [Pilot and deploy  Defender for Office 365](pilot-deploy-defender-office-365.md) <br><br> - [Pilot and deploy Defender for Endpoint](pilot-deploy-defender-endpoint.md) <br><br> - [Pilot and deploy Microsoft Defender for Cloud Apps](pilot-deploy-defender-cloud-apps.md)  |
|C. Investigate and respond to threats | [Practice incident investigation and response](pilot-deploy-investigate-respond.md) |

This order is designed to leverage the value of the capabilities quickly based on how much effort is typically required to deploy and configure the capabilities. For example, Defender for Office 365 can be configured in less time than it takes to enroll devices in Defender for Endpoint. Prioritize the components to meet your business needs.

## Start the pilot

Microsoft recommends you start your pilot in your existing production subscription of Microsoft 365 to gain real-world insights immediately and you can tune settings to work against current threats in your Microsoft 365 tenant. After you've gained experience and are comfortable with the platform, simply expand the use of each component, one at a time, to full deployment.

An alternative is to [Set up your Microsoft Defender XDR trial lab environment](setup-m365deval.md). However, this environment won't show any real cybersecurity information such as threats or attacks on your production Microsoft 365 tenant while you are piloting and you won't be able to move security settings from this environment to your production tenant.

<a name='you-will-need-to-activate-e5-trial-licenses-to-evaluate-microsoft-365-defender'></a>

### Using Microsoft 365 E5 trial licenses

If you do not have Microsoft 365 E5 and want to advantage of Microsoft 365 E5 trial licenses for your pilot:

1. Sign in to your existing Microsoft 365 tenant administration portal.
2. Select **Purchase Services** from the navigation menu.
3. From the Office 365 section select **Details** under Office 365 E5 license.

   :::image type="content" source="/defender/media/mdo-eval/2_mdo-eval-license-details.png" alt-text="Screenshot of the Details button in the Microsoft Defender portal." lightbox="/defender/media/mdo-eval/2_mdo-eval-license-details.png":::

4. Select **Start free trial**.

   :::image type="content" source="/defender/media/mdo-eval/3-m365-purchase-button.png" alt-text="Screenshot of the Start free trial button in the Microsoft Defender portal." lightbox="/defender/media/mdo-eval/3-m365-purchase-button.png":::

5. Confirm your request and select **Try now**.

   :::image type="content" source="/defender/media/mdo-eval/4_mdo-trial-order.png" alt-text="Screenshot of the Try Now button in the Microsoft Defender portal." lightbox="/defender/media/mdo-eval/4_mdo-trial-order.png":::

Your pilot using Microsoft 365 E5 trial licenses in your existing production tenant will let you keep any security settings and methods when the trial expires and you purchase equivalent licenses.

## Next step

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-identity.svg" alt-text="A diagram showing Microsoft Defender for Identity in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-identity.svg" border="false":::

See [Pilot and deploy Microsoft Defender for Identity](pilot-deploy-defender-identity.md).

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]

<!---

=====================================================================

## Deploy your pilot environment into production

To promote your Microsoft Defender XDR evaluation environment to production, first purchase the necessary license. Follow the steps in [Create the eval environment](eval-create-eval-environment.md) and purchase the Office 365 E5 license (instead of selecting Start free trial).

Next, complete any other configuration and expand your pilot groups until these reach full production.

### Microsoft Defender for Identity

Defender for Identity doesn't require any other configuration. Just make sure to purchase the necessary licenses and install the sensor on all of your Active Directory domain controllers and Active Directory Federation Services (AD FS) servers.

### Microsoft Defender for Office 365

After successfully evaluating or piloting Defender for Office 365, it can be promoted to your entire production environment.

1. Purchase and provision the necessary licenses and assign them to your production users.
2. Rerun recommended baseline policy configurations (either Standard or Strict) against your production email domain or specific groups of users.
3. Optionally create and configure any custom Defender for Office 365 policies against your production email domain or groups of users.  However, remember that any assigned baseline policies will always take precedence over custom policies.
4. Update the public MX record for your production email domain to resolve directly to EOP.
5. Decommission any third-party SMTP gateways and disable or delete any EXO connectors associated with this relay.

### Microsoft Defender for Endpoint

To promote Microsoft Defender for Endpoint evaluation environment from a pilot to production, onboard more endpoints to the service using any of the [supported tools and methods](/defender-endpoint/onboard-configure).

Use the following general guidelines to onboard more devices to Microsoft Defender for Endpoint.

1. Verify that the device fulfills the [minimum requirements](/defender-endpoint/minimum-requirements).
2. Depending on the device, follow the configuration steps provided in the onboarding section of the Defender for Endpoint portal.
3. Use the appropriate management tool and deployment method for your devices.
4. Run a detection test to verify that the devices are properly onboarded and reporting to the service.

### Microsoft Defender for Cloud Apps

Microsoft Defender for Cloud Apps doesn't require any other configuration. Just make sure to purchase the necessary licenses. If you've scoped the deployment to certain user groups, increase the scope of these groups until you reach production scale.


--->
