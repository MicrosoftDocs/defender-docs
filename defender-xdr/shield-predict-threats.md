---
title: Predictive shielding in Microsoft Defender XDR
description: Predictive shielding dynamically infers risk, anticipates attacker progression, and hardens your environment.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: lwainstein
author: limwainstein
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

Microsoft Defender XDR uses predictive shielding as a proactive defense strategy designed to anticipate and mitigate threats as part of an ongoing attack. Learn [how predictive shielding works](#how-predictive-shielding-works) to dynamically infer risk, anticipate attacker progression, and harden your environment.

This article provides an overview of predictive shielding so that you can understand its capabilities and how it enhances your security posture.

> [!TIP]
> This article describes how predictive shielding works. To enrich these capabilities and view the predictive shielding details and results, see [Manage predictive shielding in Microsoft Defender XDR](shield-predict-threats-manage.md).

## How predictive shielding works

Predictive shielding represents a proactive defense strategy designed to anticipate and mitigate threats as part of an ongoing attack. 

Predictive shielding integrates posture, activity, and scenario context to identify potential attack paths and targets, selectively hardening critical assets or constraining attack paths just in time. This approach minimizes operational overhead and provides security teams with more time to respond.

The evolving threat landscape creates an imbalance: defenders must secure every asset, while attackers need only one opening. Traditional defenses are reactive, responding after malicious activity begins. This approach leaves defenders chasing attackers, who often act too quickly or subtly to detect in real time. While some attacker behaviors must be blocked outright, static prevention disrupts productivity and adds operational overhead.

Predictive Shielding addresses these challenges by anticipating risks and applying targeted protections only where needed. This proactive approach reduces the reactive chase, minimizes operational burden, maintains usability, and protects the environment before attackers can advance.

Predictive shielding relies on two pillars:  

- **Prediction** 
    - Involves analyzing threat intelligence, attacker behavior, past incidents, and organizational exposure. 
    - Defender XDR uses this prediction data to identify emerging risks, to understand likely attack progression, and to infer risk on non-compromised assets.
- **Enforcement** applies preventative protective controls to disrupt potential attack paths in real time.

This dual approach ensures that protection is both precise and timely.

## How predictive shielding expands on automatic attack disruption

While [automatic attack disruption](automatic-attack-disruption.md) focuses on identifying and neutralizing confirmed malicious activities, predictive shielding goes a step further by anticipating potential threats before they materialize. This capability enables organizations to stay ahead of attackers, reducing the likelihood of successful breaches.

Predictive Shielding enhances Defender's autonomous protection by complementing attack disruption. While attack disruption identifies and contains compromised assets using high-fidelity signals, Predictive Shielding anticipates potential attack progression and proactively restricts vulnerable assets or paths. This approach reduces operational overhead, ensures critical assets remain secure, and provides a comprehensive defense strategy against both immediate and future threats.

Predictive shielding uses predictive analytics and real-time insights and dynamically identifies emerging risks and applies targeted protections. This approach minimizes the operational overhead associated with broad, environment-wide restrictions while ensuring critical assets remain secure. The integration of predictive capabilities with automatic attack disruption creates a comprehensive defense strategy that addresses both immediate and future threats.

## Prediction logic

Prediction allows organizations to identify assets at risk and apply tailored protections in real time. Prediction focuses on emerging risks rather than static prevention, which minimizes operational friction and ensures that security measures are applied precisely where needed.

Defender XDR uses multiple layers of insight to make accurate predictions:

- Threat intelligence aligns observed activity with known attacker tools and tactics.
- Learnings from past incidents are used to recognize statistical patterns, and extrapolate the most probable next steps.
- Organizational exposure data is used to map how the environment is structured—which assets and identities are connected, what vulnerabilities or misconfigurations exist, and how risk can propagate across them.

Together, these insights create a dynamic understanding of the environment and its risks.

## Graph-based logic

Graph-based prediction logic bridges the gap between pre-breach and post-breach systems, providing a unified view of attacker activity and organizational vulnerabilities. Graph-based logic combines live activity data with the structural map of the environment. This logic enables Defender XDR to forecast attacker movements in real time, prioritize defenses effectively, and stop attackers before they reach critical assets.

The process involves three key stages: 

1. Defender XDR overlays post-breach activity onto the organization’s exposure graph, creating a comprehensive view of potential attack paths. 
1. Defender XDR identifies the "blast radius"—the assets and configurations that could be impacted next. 
1. Reasoning models predict paths attackers are most likely to take, factoring in past behaviors, asset characteristics, and environmental vulnerabilities.

This dynamic understanding allows Defender XDR to move beyond reactive responses, enabling just-in-time protection that stops attackers before they reach critical assets. Organizations can use these three perspectives to gain a proactive edge in mitigating threats and safeguarding their environments.

## Predictive shielding actions

Predictive shielding uses Defender for Endpoint-based response actions. To use these actions, you need a Defender for Endpoint license. 

- [Safeboot hardening](/defender-endpoint/respond-machine-alerts#safeboot-hardening) - hardens the device against booting into Safe Mode. Booting into Safe Mode is a common tactic used by attackers to bypass security controls and maintain persistence on compromised systems.

- [GPO hardening](/defender-endpoint/respond-machine-alerts#gpo-hardening) - hardens Group Policy Objects (GPOs) to prevent attackers from exploiting misconfigurations or weaknesses in GPO settings to escalate privileges or move laterally within the network.

- [Contain user](/defender-endpoint/respond-machine-alerts#contain-user-from-the-network) - automatically contains suspicious identities temporarily to help block any lateral movement and remote encryption related to incoming communication with devices onboarded to Defender for Endpoint.

    > [!NOTE]
    > With predictive shielding, the contain user action applies restrictions more selectively, with a focus on users identified as high risk through prediction logic. The contain user action in predictive shielding prevents new sessions rather than terminating existing ones.

## Identify when predictive shielding happens in your environment

The Defender XDR incident page reflects the automatic predictive shielding actions through the attack story. The incident shows a dedicated predictive tag, highlights the status of the assets contained in the incident graph, and adds an action to the Action center. For more information, see [Manage predictive shielding in Microsoft Defender XDR](shield-predict-threats-manage.md).

## Next steps

- [Manage predictive shielding in Microsoft Defender XDR](shield-predict-threats-manage.md) - Learn how to manage predictive shielding actions and investigate their impact in your environment.
- [Automatic attack disruption in Microsoft Defender XDR](automatic-attack-disruption.md) - Learn how automatic attack disruption works to identify and neutralize confirmed malicious activities.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
