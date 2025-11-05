---
title: Predictive shielding in Microsoft Defender XDR
description: Predictive shielding dynamically infers risk, anticipates attacker progression, and hardens your environment.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: limwainstein
author: lwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
  - usx-security
  - usx-security
ms.topic: concept-article
search.appverid: 
  - MOE150
  - MET150
ms.date: 11/04/2025
appliesto:
  - Microsoft Defender XDR
  - Microsoft Defender for Endpoint
---

# Predictive shielding in Microsoft Defender XDR

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Defender XDR uses predictive shielding as a proactive defense strategy designed to anticipate and mitigate threats before they materialize. Learn [how predictive shielding works](#how-predictive-shielding-works) to dynamically infer risk, anticipate attacker progression, and harden your environment.

This article provides an overview of predictive shielding so that you can understand its capabilities and how it enhances your security posture.

> [!TIP]
> This article describes how attack disruption works. To enrich these capabilities, see Enrich predictive shielding in Defender XDR - TBD.

## How predictive shielding works

Predictive shielding represents a proactive defense strategy designed to anticipate and mitigate threats before they materialize. Unlike reactive models that rely on high-confidence signals, predictive shielding integrates posture, activity, and scenario context to predict attack progression in real time. This approach enables organizations to identify potential attack paths and targets, selectively hardening critical areas to minimize impact and provide security teams with more time to respond.

The evolving threat landscape has exposed the limitations of reactive defense models. Persistent, human-operated attacks exploit the asymmetry between defenders, who must protect every asset, and attackers, who need only one weak point. Predictive shielding addresses this imbalance by dynamically forecasting risks and applying tailored protections where they are most needed, reducing operational overhead and maintaining productivity.

Predictive shielding relies on two pillars:  

- **Prediction** involves analyzing attacker behavior, past incidents, and organizational exposure to identify emerging risks.
- **Enforcement** applies automated protective controls to disrupt potential attack paths in real time. This dual approach ensures that protection is both precise and timely.

Predictive shielding uses [graph-based prediction logic](#graph-based-logic), which unifies pre-breach and post-breach insights. By overlaying live attacker activity onto an organization’s exposure graph, Defender can model the potential blast radius and forecast the most probable attack paths. This dynamic understanding allows for just-in-time protection, stopping attackers before they reach critical assets.

## How predictive shielding expands on automatic attack disruption

While [automatic attack disruption](automatic-attack-disruption.md) focuses on identifying and neutralizing confirmed malicious activities, predictive shielding goes a step further by anticipating potential threats before they materialize. This capability enables organizations to stay ahead of attackers, reducing the likelihood of successful breaches.

By leveraging predictive analytics and real-time insights, predictive shielding dynamically identifies emerging risks and applies targeted protections. This approach minimizes the operational overhead associated with broad, environment-wide restrictions while ensuring critical assets remain secure. The integration of predictive capabilities with automatic attack disruption creates a comprehensive defense strategy that addresses both immediate and future threats.

## Prediction logic

Prediction allows organizations to identify assets at risk and apply tailored protections in real time. By focusing on emerging risks rather than static prevention, this approach minimizes operational friction and ensures that security measures are applied precisely where needed.

Defender leverages multiple layers of insight to make accurate predictions:

- Threat intelligence aligns observed activity with known attacker tools and tactics.
- Learnings from past incidents, used to recognize statistical patterns and extrapolate the most probable next steps.
- Organizational exposure data, used to map how the environment is structured — which assets and identities are connected, what vulnerabilities or misconfigurations exist, and how risk can propagate across them.

Together, these insights create a dynamic understanding of the environment and its risks.

## Graph-based logic

Graph-based prediction logic bridges the gap between pre-breach and post-breach systems, providing a unified view of attacker activity and organizational vulnerabilities. By combining live activity data with the structural map of the environment, this approach enables Defender to forecast attacker movements in real time and prioritize defenses effectively.

The process involves three key stages. First, Defender overlays post-breach activity onto the organization’s exposure graph, creating a comprehensive view of potential attack paths. Next, it identifies the "blast radius"—the assets and configurations that could be impacted next. Finally, reasoning models predict the most likely paths attackers will take, factoring in past behaviors, asset characteristics, and environmental vulnerabilities.

This dynamic understanding allows Defender to move beyond reactive responses, enabling just-in-time protection that stops attackers before they reach critical assets. By unifying these perspectives, organizations gain a proactive edge in mitigating threats and safeguarding their environments.

## Predictive shielding actions

Predictive shielding uses Defender XDR-based XDR response actions. Examples of these actions are:

- Safeboot hardening - based on Microsoft Defender for Endpoint capability, this action hardens the device against booting into Safe Mode, which is a common tactic used by attackers to bypass security controls and maintain persistence on compromised systems.

- GPO hardening - based on Microsoft Defender for Endpoint capability, this action hardens Group Policy Objects (GPOs) to prevent attackers from exploiting misconfigurations or weaknesses in GPO settings to escalate privileges or move laterally within the network.

- [Contain user](/defender-endpoint/respond-machine-alerts#contain-user-from-the-network) - based on Microsoft Defender for Endpoint capability, this response action automatically contains suspicious identities temporarily to help block any lateral movement and remote encryption related to incoming communication with MDFE's onboarded devices.

## Identify when predictive shielding happens in your environment

The Defender XDR incident page reflects the automatic predictive shielding actions through the attack story. The incident shows a dedicated predictive tag, highlights the status of the assets contained in the incident graph, and adds an action to the Action Center.

TBD - image

The Defender XDR user experience now includes additional visual cues to ensure visibility of these automatic actions. You can find them across the following experiences:

- In the incident queue: A tag titled *Predictive Shielding* appears next to affected incidents

- On the incident page:

    - A tag titled *Predictive Shielding*
    - A yellow banner at the top of the page that highlights the automatic action taken
   - The current asset status is shown in the incident graph if an action is done on an asset, for example, account disabled or device contained

For more information, see view predictive shielding details and results - TBD.

## Next steps

TBD

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
