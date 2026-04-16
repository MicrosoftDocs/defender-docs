---
title: Automatic attack disruption in Microsoft Defender
description: Automatically contain assets controlled by attackers by using automatic attack disruption in Microsoft Defender.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection: 
  - m365-security
  - tier1
  - usx-security
  - usx-security
ms.topic: concept-article
ai-usage: ai-assisted
ms.date: 06/22/2025
appliesto:
  - Microsoft Defender XDR
---

# Automatic attack disruption in Microsoft Defender

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Microsoft Defender correlates millions of individual signals to identify active ransomware campaigns or other sophisticated attacks in the environment with high confidence. While an attack is in progress, Defender disrupts the attack by automatically containing compromised assets that the attacker is using through automatic attack disruption.

Automatic attack disruption limits lateral movement early on and reduces the overall impact of an attack, from associated costs to loss of productivity. At the same time, it leaves security operations teams in complete control of investigating, remediating, and bringing assets back online.

This article provides an overview of automated attack disruption and includes links to the next steps and other resources.

> [!TIP]
> This article describes how attack disruption works. To configure these capabilities, see [Configure attack disruption capabilities](configure-attack-disruption.md) in Microsoft Defender.

## How automatic attack disruption works

Automatic attack disruption is designed to contain attacks in progress, limit the impact on an organization's assets, and provide more time for security teams to remediate the attack fully. Attack disruption uses the full breadth of our extended detection and response (XDR) signals, taking the entire attack into account to act at the incident level. This capability is unlike known protection methods such as prevention and blocking based on a single indicator of compromise.

While many XDR and security orchestration, automation, and response (SOAR) platforms allow you to create your automatic response actions, automatic attack disruption is built in and uses insights from Microsoft security researchers and advanced AI models to counteract the complexities of advanced attacks. Automatic attack disruption considers the entire context of signals from different sources to determine compromised assets.


Automatic attack disruption operates in three key stages:

- It uses Microsoft Defender's ability to correlate signals from many different sources into a single, high-confidence incident through insights from endpoints, identities, email and collaboration tools, and SaaS apps.
- It identifies assets controlled by the attacker and used to spread the attack.
- It automatically takes response actions across relevant Microsoft Defender products to contain the attack in real-time by containing and disabling affected assets.

This game-changing capability limits a threat actor's progress early on and dramatically reduces the overall impact of an attack, from associated costs to loss of productivity.

## How Defender establishes confidence for automatic action

Security teams might hesitate when systems take automatic action because response actions can affect business operations. Automatic attack disruption addresses this concern by using high-fidelity signals and incident-level correlation across real data from email, identity, applications, documents, devices, networks, and files.

Confidence in automatic attack disruption refers to detector precision, measured by signal-to-noise ratio (SNR). For containment actions, Defender maintains a confidence level of 99% or higher based on real production data. Defender evaluates each detector hit against a broad set of indicators to classify true positives and false positives by combining machine learning outputs, cross-workload correlation, and expert-led incident classification.

Defender validates detectors in audit mode before broad release and gradually deploys only detectors that meet strict quality requirements. This process aims to keep false positives low while maintaining effective disruption of active attacks. Disruption detectors are continuously and dynamically evaluated to maintain detection quality and confidence.

Microsoft security experts continuously review disruption activity, monitor anomalies, and assess impact to preserve high detection quality over time.

In addition, all automatic actions can be undone by your security team, so you maintain full control over your environment. For more information, see [Details and results of an automatic attack disruption action](autoad-results.md).

## How attack disruption uses AI

Attack disruption AI uses an ensemble of purpose-built models and detectors developed across the Microsoft Defender suite. These capabilities are trained and tuned using multiple data sources, including:

- Correlated Defender workload telemetry
- Microsoft threat intelligence
- Past incidents and post-incident analysis learnings from Microsoft customers

The platform uses multiple machine learning approaches, including graph models, boosted decision trees, neural networks, and dedicated small language models (SLMs), to improve detection quality and action precision.

Model and detector quality is maintained through continuous engineering and validation cycles rather than a single static release point. Before broad rollout, new detectors go through rigorous pre-release validation and staged deployment. Ongoing quality is supported by expert review of AI decisions and 24x7 operational response coverage for anomalous behavior.

## Automated response actions

Automatic attack disruption uses Microsoft-based XDR response actions. Examples of these actions are:

- [Device contain](/defender-endpoint/respond-machine-alerts#contain-devices-from-the-network) - based on Microsoft Defender for Endpoint's capability, this action is an automatic containment of a suspicious device to block any incoming/outgoing communication with the said device. 
  - In addition, Defender for Endpoint automatically contains malicious IP addresses associated with undiscovered/not onboarded devices to block any lateral movement and encryption activity to other Defender for Endpoint-onboarded/discovered devices. It does this through its **[Contain IP](/defender-endpoint/respond-machine-alerts#contain-ip-addresses-of-undiscovered-devices)** (Preview) policy. Moreover, [compromised critical assets' IP addresses are also automatically contained](/defender-endpoint/respond-machine-alerts#containing-critical-assets) with specific blocking mechanisms to stop the spread of an attack while avoiding productivity loss.

- [Disable user](/defender-for-identity/remediation-actions) - based on Microsoft Defender for Identity's capability, this action is an automatic suspension of a compromised account to prevent additional damage like lateral movement, malicious mailbox use, or malware execution. The disable user action behaves differently depending on how the user is hosted in your environment.
  - When the user account is hosted in Active Directory: Defender for Identity triggers the disable user action on domain controllers running the Defender for Identity agent.
  - When the user account is hosted in Active Directory and is synced on Microsoft Entra ID:  Defender for Identity triggers the disable user action via onboarded domain controllers. Attack disruption also disables the user account on the Microsoft Entra ID synced account.
  - When the user account is hosted in the Microsoft Entra ID only (cloud native account): attack disruption disables the user account on the Microsoft Entra ID synced account.

  > [!NOTE]
  > Disabling the user account in Microsoft Entra ID is not dependent on the deployment of Microsoft Defender for Identity. 

- [Contain user](/defender-endpoint/respond-machine-alerts#contain-user-from-the-network) - based on Microsoft Defender for Endpoint's capability, this response action automatically contains suspicious identities temporarily to help block any lateral movement and remote encryption related to incoming communication with Defender for Endpoint's onboarded devices.

  Defender for Endpoint enforces user containment at the endpoint layer and doesn't disable the account in the identity provider. Defender for Endpoint blocks attacker use of compromised identities on protected devices and limits authentication-based access, file system access, and network communication paths.

  This action applies controls at a granular level, so Microsoft can target attack-related activity and preserve normal business communication where possible.

For more information, see [remediation actions](m365d-remediation-actions.md) in Microsoft Defender.

## Identify when an attack disruption happens in your environment

The Microsoft Defender incident page will reflect the automatic attack disruption actions through the attack story and the status indicated by a yellow bar (Figure 1). The incident shows a dedicated disruption tag, highlight the status of the assets contained in the incident graph, and add an action to the Action Center.

:::image type="content" source="media/automatic-attack-disruption/Fig1-auto-attack-disruption.png" alt-text="Selecting an incident in the Microsoft Defender portal" lightbox="media/automatic-attack-disruption/Fig1-auto-attack-disruption.png":::
*Figure 1. Incident view showing the yellow bar where automatic attack disruption took action*

The Microsoft Defender user experience now includes additional visual cues to ensure visibility of these automatic actions. You can find them across the following experiences:

1. In the incident queue:

    - A tag titled *Attack Disruption* appears next to affected incidents

2. On the incident page:

    - A tag titled *Attack Disruption*
    - A yellow banner at the top of the page that highlights the automatic action taken
   - The current asset status is shown in the incident graph if an action is done on an asset, for example, account disabled or device contained
   - The **Policy status** column (Preview) in the **Activities** tab shows the current status of all actions and policies relevant to the incident. Filter by **Provider: Attack disruption** and **Policy status: Active, Inactive, No status** to view disruption policy statuses.
      
3. Via API:

    An **(attack disruption)** string is added to the end of the titles of incidents with high confidence likely to be automatically disrupted. For example:

    *BEC financial fraud attack launched from a compromised account (attack disruption)*

For more information, see [view attack disruption details and results](autoad-results.md).

## Next steps

- [Configure automatic attack disruption](configure-attack-disruption.md)
- [View details and results](autoad-results.md)
- [Get email notifications for response actions](m365d-response-actions-notifications.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
