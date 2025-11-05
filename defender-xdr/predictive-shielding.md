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

# Predictive shielding in Microsoft Defender XDR (Defender XDR)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Defender XDR correlates millions of individual signals to identify active ransomware campaigns or other sophisticated attacks in the environment with high confidence. TBD - overview.

This article provides an overview of predictive shielding and includes links to the next steps and other resources.

> [!TIP]
> This article describes how attack disruption works. To enrich these capabilities, see Enrich predictive shielding in Defender XDR - TBD.

## How predictive shielding works

Predictive Shielding is a new capability in Microsoft Defender (Defender) that expands autonomous protection beyond the reactive paradigm. The industry’s reactive model - waiting to confirm something as malicious before acting - has reached its glass ceiling. Against today’s human-operated, multi-wave attacks, reacting after compromise isn't enough. Certain attacker activities, such as credential theft or data exfiltration, must be prevented outright. Yet traditional static prevention introduces operational overhead and potential friction when applied uniformly across an organization, making it difficult to balance protection with productivity.

Predictive Shielding bridges that gap by introducing just-in-time, post-breach, contextual preemptive actions - enabling Defender to dynamically infer risk, anticipate attacker progression, and harden the environment only where and when it matters most.

### Predictive shielding pillars

At its core, Predictive Shielding is built on two pillars:

- Prediction, our ability to infer risk and forecast attack progression across assets that aren't yet compromised. 
- Enforcement, the automated application of protective controls to disrupt potential attack paths and shield critical targets in real time.

## Predictive shielding logic

## Prediction logic

Prediction is at the core of Predictive Shielding. It enables Defender to identify, contextually and surgically, which specific assets are at risk and in reference to what kind of risk, so it can apply the right, tailored protection. Instead of relying on static prevention that creates operational overhead and friction when applied uniformly, prediction allows Defender to act just-in-time and in context, focusing protection only where risk is emerging. 

To perform these predictions, Defender draws from multiple layers of insight spanning both attacker behavior and organizational context — including: 

Threat intelligence, to understand what type of activity is observed and which threat actors, tools, or playbooks it aligns with. 

Learnings from past incidents, to recognize statistical patterns and extrapolate the most probable next steps. 

Organizational exposure data, to map how the environment is structured — which assets and identities are connected, what vulnerabilities or misconfigurations exist, and how risk can propagate across them. 

Among these layers, the organizational exposure layer plays a particularly critical role. It represents the live topology of the environment and the relationships that shape how cyberattackers can move within it. This layer is modeled and continuously updated through what we call the Exposure Graph — the foundation of Defender’s graph-based prediction logic.

## Graph-based prediction logic

In cybersecurity, pre-breach and post-breach systems often operate separately.

Post-breach systems, like incident and detection platforms, show the attacker activity, compromised assets, and evidence of malicious behavior that already occurred. Pre-breach posture tools map the organization’s structure, exposures, configurations, and potential paths that an attacker could take. But without connecting the two systems, defenders are left asking the crucial question that Waze always answers: given where the car is now, where can it go next? 

Our graph-based prediction logic solves this problem. It brings these two perspectives together - the live activity and the structural map of the environment - into a single reasoning layer that lets Defender forecast attacker movement in real time.

We use three key stages: 

Unify pre-breach and post-breach signals - see both the roads and the cars. 
The first step is overlaying post-breach activity (the cars) onto the organization’s exposure graph (the roads). By bringing these worlds together, Defender can see not just that an attacker exists, but where they are within the topology and what routes are open from that position. 

Identify the blast radius - understand where the car can drive next. 
Once the maps are unified, Defender models the reachable paths from the current point of compromise - the set of assets, identities, and configurations that are exposed or adjacent. This view shows the blast radius: what can be impacted next, and through which connections or weaknesses. 

Predict the most probable paths and targets - anticipate where the car is heading. 
Finally, Defender applies reasoning models to determine which of those paths are most likely to be taken. It factors in the attacker’s past behaviors, the characteristics of the compromised assets, and the “terrain” of the environment - vulnerabilities, privileges, and data value - to forecast the most probable next destination. 

By unifying these perspectives, Defender gains what the security industry has long lacked: a live, dynamic understanding of both the environment and the adversary’s movement within it. It's no longer about reacting to where the attacker was, but about foreseeing where they're going - and applying just-in-time protection to stop them before they get there. 

## Predictive shielding controls

Predictive shielding uses Defender XDR-based XDR response actions. Examples of these actions are:

- Safeboot hardening

- GPO hardening

- [Contain user](/defender-endpoint/respond-machine-alerts#contain-user-from-the-network) - based on Microsoft Defender for Endpoint (MDFE)'s capability, this response action automatically contains suspicious identities temporarily to help block any lateral movement and remote encryption related to incoming communication with MDFE's onboarded devices.

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
