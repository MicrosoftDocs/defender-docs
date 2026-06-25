---
title: Automatic attack disruption in Microsoft Defender
description: Automatically contain assets controlled by attackers by using automatic attack disruption in Microsoft Defender.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.reviewer: Ofer Shreiber
ms.localizationpriority: medium
ms.collection: 
  - m365-security
  - tier1
  - usx-security
ms.topic: concept-article
ai-usage: ai-assisted
ms.date: 06/11/2026
appliesto:
  - Microsoft Defender XDR

#customer intent: As a security operator, I want to understand how automatic attack disruption works in Microsoft Defender, so that I can have confidence in the automatic response actions taken in my environment and explain this capability to my stakeholders.
---

# Automatic attack disruption in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Microsoft Defender correlates millions of individual signals to identify active ransomware campaigns or other sophisticated attacks in the environment with high confidence. While an attack is in progress, Defender disrupts the attack by automatically containing compromised assets that the attacker is using through automatic attack disruption.

Automatic attack disruption limits lateral movement early on and reduces the overall impact of an attack, from associated costs to loss of productivity. At the same time, it leaves security operations teams in complete control of investigating, remediating, and bringing assets back online.

This overview explains automated attack disruption and links to next steps and related resources.

Attack disruption supports response actions in Microsoft Defender services and integrated identity services. This support includes actions in Microsoft Entra ID and Active Directory, and preview support for [Okta](okta-attack-disruption.md) and [AWS](/azure/sentinel/aws-disruption?toc=/defender-xdr/toc.json&bc=/defender-xdr/breadcrumb/toc.json) integrated scenarios.

> [!TIP]
> This article describes how attack disruption works. To configure these capabilities, see [Configure attack disruption capabilities](configure-attack-disruption.md) in Microsoft Defender.

## How automatic attack disruption works

Automatic attack disruption is designed to contain attacks in progress, limit the impact on an organization's assets, and provide more time for security teams to remediate the attack fully. Attack disruption uses extended detection and response (XDR) signals and evaluates the entire attack to take action at the incident level. This capability differs from protection methods such as prevention and blocking based on a single indicator of compromise.

While many XDR and security orchestration, automation, and response (SOAR) platforms allow you to create automatic response actions, automatic attack disruption is built in and uses insights from Microsoft security researchers and AI models to detect and contain advanced attacks. Automatic attack disruption considers signals from different sources to determine compromised assets.

Automatic attack disruption operates in three key stages:

- It uses Microsoft Defender's ability to correlate signals from many different sources into a single, high-confidence incident through insights from endpoints, identities, email and collaboration tools, and SaaS apps.
- It identifies assets controlled by the attacker and used to spread the attack.
- It automatically takes response actions in relevant Microsoft Defender products to contain the attack in real-time by containing and disabling affected assets.

This capability can limit a threat actor's progress early on and reduce the overall impact of an attack, including associated costs and loss of productivity.

## How Defender establishes confidence for automatic action

Security teams might hesitate when systems take automatic action because response actions can affect business operations. Automatic attack disruption addresses this concern by using high-fidelity signals and incident-level correlation from real data from email, identity, applications, documents, devices, networks, and files.

Confidence in automatic attack disruption refers to detector precision, measured by signal-to-noise ratio (SNR). For containment actions, Defender maintains a confidence level of 99% or higher based on real production data. Defender evaluates each detector hit against a broad set of indicators to classify true positives and false positives by combining machine learning outputs, cross-workload correlation, and expert-led incident classification.

Defender validates detectors in audit mode before broad release and gradually deploys only detectors that meet strict quality requirements. This process aims to keep false positives low while maintaining effective disruption of active attacks. Disruption detectors are continuously and dynamically evaluated to maintain detection quality and confidence.

Microsoft security experts continuously review disruption activity, monitor anomalies, and assess impact to preserve high detection quality over time.

In addition, all automatic actions can be undone by your security team, so you maintain full control over your environment. For more information, see [Details and results of an automatic attack disruption action](autoad-results.md).

If you have critical assets that shouldn't be automatically contained, you can configure exclusions for supported users, devices, and IP addresses. For guidance, see [Exclude assets from automated response actions](automatic-attack-disruption-exclusions.md).

## How attack disruption uses AI

Attack disruption AI uses an ensemble of specialized models and detectors developed across the Microsoft Defender suite. These capabilities are trained and tuned using multiple data sources, including:

- Correlated Defender workload telemetry
- Microsoft threat intelligence
- Past incidents and post-incident analysis learnings from Microsoft customers

The platform uses multiple machine learning approaches, including graph models, boosted decision trees, neural networks, and dedicated small language models (SLMs), to improve detection quality and action precision.

Model and detector quality is maintained through continuous engineering and validation cycles rather than a single static release point. Before broad rollout, new detectors go through rigorous pre-release validation and staged deployment. Ongoing quality is supported by review of AI decisions and 24x7 operational response coverage for anomalous behavior.

## Automated response actions

For containment actions, Defender for Endpoint applies a containment policy on all onboarded devices to prevent communication from the compromised entity (user, IP address, or device).

| Action | Capability | Product | Description |
|---|---|---|---|
| [Contain device](/defender-endpoint/respond-machine-alerts#contain-devices-from-the-network) | Attack disruption | Defender for Endpoint | Automatically contains a suspicious device by applying a policy on all Defender for Endpoint onboarded devices to block communication from that device. |
| [Contain IP](/defender-endpoint/respond-machine-alerts#contain-ip-addresses-of-undiscovered-devices) | Attack disruption | Defender for Endpoint | Contains an IP address associated with undiscovered/not onboarded devices by applying a policy on all Defender for Endpoint onboarded devices to block communication from that IP address. |
| [Isolate device](/defender-endpoint/respond-machine-alerts#isolate-device-automatic-attack-disruption) | Attack disruption | Defender for Endpoint | Automatically isolates a compromised device from the network when it's identified as an active foothold. Most network traffic is blocked while the device remains connected to required security services. |
| [Disable user](#disable-user-considerations) | Attack disruption | Defender for Identity | Disables the user account to prevent further sign-in and access. |
| [Contain user](#contain-user-considerations) | Attack disruption, Predictive shielding | Defender for Endpoint | Temporarily contains a suspicious identity by applying a policy on all Defender for Endpoint onboarded devices to block communication from that user and reduce lateral movement and remote encryption risk. |
| [Revoke user session](/defender-for-identity/remediation-actions#supported-actions) | Attack disruption | Microsoft Entra ID | Revokes active user sessions to interrupt access. |
| [Suspend user in Entra](/defender-xdr/investigate-users#identity-actions) | Attack disruption | Microsoft Entra ID | Suspends the user account in Microsoft Entra ID to prevent further access. |
| [OAuth app compromise](/defender-cloud-apps/governance-actions) | Attack disruption | Defender for Cloud Apps | Executes protective measures for a potentially compromised OAuth application. |
| [Safeboot hardening](/defender-endpoint/respond-machine-alerts#safeboot-hardening) | Predictive shielding | Defender for Endpoint | Applies preventive hardening to block potential tampering through Safe Mode reboots. |
| [GPO hardening](/defender-endpoint/respond-machine-alerts#gpo-hardening) | Predictive shielding | Defender for Endpoint | Applies preventive hardening to block potential Group Policy abuse. |
| [Proactive user containment](/defender-endpoint/respond-machine-alerts#contain-user-from-the-network) | Predictive shielding | Defender for Endpoint | Proactively contains a user account to prevent potential misuse before an incident escalates, focusing on users identified as high risk through prediction logic. |
| [Attach deny policy to AWS user](/azure/sentinel/aws-disruption) | Attack disruption | Microsoft Sentinel (AWS connector) | Attaches a deny policy to a compromised AWS IAM user or federated role to revoke permissions and block further access to AWS resources. |
| [Suspend user in Okta](okta-attack-disruption.md) | Attack disruption | Microsoft Sentinel (Okta connector) | Suspends a compromised Okta user account to temporarily deactivate the account and block login and activity until the suspension is lifted. |

### Contain user considerations

The contain user action enforces user containment at the endpoint layer. Defender for Endpoint applies a containment policy on all onboarded devices to block communication from the compromised user and limits authentication-based access, file system access, and network communication paths.

> [!NOTE]
> While the contain user action is used in both attack disruption and predictive shielding, it's applied differently in each context. In predictive shielding, the contain user action applies restrictions more selectively, focusing on users identified as high risk through prediction logic. It prevents new sessions rather than terminating existing ones.

### Disable user considerations
  - **When the user account is hosted in Active Directory**: Defender for Identity triggers the disable user action on domain controllers running the Defender for Identity sensor.
  - **When the user account is hosted in Active Directory and is synced to Microsoft Entra ID**:
Defender for Identity triggers the disable user action via onboarded domain controllers. Attack disruption also disables the user account in Microsoft Entra ID.
  - **When the user account is hosted in Microsoft Entra ID only (cloud‑native account)**:
Defender for Identity executes the disable user action in Microsoft Entra ID by using a Microsoft‑managed enterprise application. This application validates the signed-in user’s assigned roles and permissions through role-based access control (RBAC) before the account is disabled.

The [disable user](/defender-for-identity/remediation-actions) action is an automatic suspension of a compromised account to prevent additional damage, such as lateral movement, malicious mailbox use, or malware execution.

Defender for Identity enables remediation actions for users from Active Directory, Microsoft Entra ID, and integrated identity providers. The disable user action behaves differently depending on how the user is hosted in your environment:

- **When the user account is hosted in Active Directory**: Defender for Identity triggers the disable user action on domain controllers running the Defender for Identity sensor.
- **When the user account is hosted in Active Directory and is synced to Microsoft Entra ID**: Defender for Identity triggers the disable user action via onboarded domain controllers. Attack disruption also disables the user account in Microsoft Entra ID.
- **When the user account is hosted in Microsoft Entra ID only (cloud‑native account)**: Defender for Identity executes the disable user action in Microsoft Entra ID by using a Microsoft‑managed enterprise application. This application validates the signed‑in user's assigned roles and permissions through role‑based access control (RBAC) before the account is disabled.

The enterprise application is named `Microsoft Defender for Identity` and uses application ID `60ca1954‑583c‑4d1f‑86de‑39d835f3e452`. In older tenants, this application might appear as `Radius Aad Syncer`.

> [!NOTE]
> Disabling the user account in Microsoft Entra ID is not dependent on the deployment of Microsoft Defender for Identity.

## Supported identity services for disruption actions

Use the following table to find where each supported identity service is configured:

| Identity service | Availability | Configuration and setup |
| --- | --- | --- |
| Microsoft Entra ID and Active Directory | Generally available | [Configure automatic attack disruption in Microsoft Defender](configure-attack-disruption.md) |
| Okta (through Microsoft Sentinel integration) | Preview | [Enable attack disruption actions in Okta](okta-attack-disruption.md) |
| AWS IAM (through Microsoft Sentinel integration) | Preview | [Enable attack disruption actions on AWS with Microsoft Sentinel](/azure/sentinel/aws-disruption?toc=/defender-xdr/toc.json&bc=/defender-xdr/breadcrumb/toc.json) |

## Identify when an attack disruption happens in your environment

The Microsoft Defender incident page will reflect the automatic attack disruption actions through the attack story and the status indicated by a yellow bar (Figure 1). The incident shows a dedicated disruption tag, highlights the status of the assets contained in the incident graph, and adds an action to the Action Center.

:::image type="content" source="media/automatic-attack-disruption/auto-attack-disruption.png" alt-text="Selecting an incident in the Microsoft Defender portal" lightbox="media/automatic-attack-disruption/auto-attack-disruption.png":::
*Figure 1. Incident view showing the yellow bar where automatic attack disruption took action*

The Microsoft Defender user experience includes visual cues to ensure visibility of these automatic actions. You can find them in the following experiences:

1. In the incident queue:

    - A tag titled *Attack Disruption* appears next to affected incidents

1. On the incident page:

    - A tag titled *Attack Disruption*
    - A yellow banner at the top of the page that highlights the automatic action taken
    - The current asset status is shown in the incident graph if an action is done on an asset, for example, account disabled or device contained
    - The **Policy status** column (Preview) in the **Activities** tab shows the current status of all actions and policies relevant to the incident. Filter by **Provider: Attack disruption** and **Policy status: Active, Inactive, No status** to view disruption policy statuses.

1. Via API:

    An **(attack disruption)** string is added to the end of the titles of incidents with high confidence likely to be automatically disrupted. For example:

    *BEC financial fraud attack launched from a compromised account (attack disruption)*

For more information, see [view attack disruption details and results](autoad-results.md).

## Next steps

- [Configure automatic attack disruption](configure-attack-disruption.md)
- [View details and results](autoad-results.md)
- [Exclude assets from automated responses](automatic-attack-disruption-exclusions.md)
- [Get email notifications for response actions](m365d-response-actions-notifications.md)

[!INCLUDE [Microsoft Defender join tech community](../includes/defender-m3d-techcommunity.md)]
