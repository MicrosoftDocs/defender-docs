---
title: Predictive shielding in Microsoft Defender
description: Predictive shielding dynamically infers risk, anticipates attacker progression, and hardens your environment.
ms.service: defender-xdr
ms.author: monaberdugo
author: mberdugo
ms.localizationpriority: medium
ms.collection: 
  - m365-security
  - tier1
  - usx-security
  - usx-security
ms.topic: concept-article
ms.date: 11/04/2025
appliesto:
  - Microsoft Defender XDR
  - Microsoft Defender for Endpoint
---

# Predictive shielding in Microsoft Defender (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Predictive shielding (Preview) is a proactive defense strategy designed to anticipate and mitigate threats as part of an ongoing attack. Predictive shielding [expands the Microsoft Defender autonomous protection stack](#how-predictive-shielding-expands-on-automatic-attack-disruption), enhancing automatic attack disruption capabilities with proactive measures.

This article provides an overview of predictive shielding so that you can understand its capabilities and how it enhances your security posture.

Learn [how predictive shielding works](#how-predictive-shielding-works) or how to [manage predictive shielding in Microsoft Defender](shield-predict-threats-manage.md).

## How predictive shielding expands on automatic attack disruption

The evolving threat landscape creates an imbalance: defenders must secure every asset, while attackers need only one opening. Traditional defenses are reactive, responding after malicious activity begins. This approach leaves defenders chasing attackers, who often act too quickly or subtly to detect in real time. While some attacker behaviors must be blocked outright, static prevention disrupts productivity and adds operational overhead.

To address these challenges, predictive shielding enhances Defender's autonomous protection stack, expanding [attack disruption](automatic-attack-disruption.md) to include proactive measures during an attack, anticipating risks and applying targeted protections only where needed. 

This proactive approach reduces the reactive chase, minimizes operational burden, maintains usability, and protects the environment before attackers can advance.

While attack disruption identifies and contains compromised assets, predictive shielding anticipates potential attack progression and proactively restricts vulnerable assets or paths. For example, while automatic attack disruption isolates a compromised device, predictive shielding might proactively restrict access to sensitive data for at-risk devices.

Because predictive shielding is part of the same autonomous protection stack, the confidence and AI model principles described for attack disruption also apply to predictive shielding. For more information, see [How Defender establishes confidence for automatic action](automatic-attack-disruption.md#how-defender-establishes-confidence-for-automatic-action) and [How attack disruption uses AI](automatic-attack-disruption.md#how-attack-disruption-uses-ai).

## How predictive shielding works

Predictive shielding uses predictive analytics and real-time insights to dynamically identify emerging risks, and applies targeted protections.

Predictive shielding integrates posture, activity, and scenario context to identify potential attack paths and targets, selectively hardening critical assets, or constraining attack paths just in time. 

This approach minimizes operational overhead and provides security teams with more time to respond. For example, predictive shielding can dynamically restrict access to sensitive data for devices identified as at-risk, reducing the need for broad, environment-wide restrictions.

Predictive shielding relies on two pillars:  

- **Prediction** 
    - Involves analyzing threat intelligence, attacker behavior, past incidents, and organizational exposure. 
    - Defender uses this prediction data to identify emerging risks, to understand likely attack progression, and to infer risk on noncompromised assets.
- **Enforcement** applies preventative protective controls to disrupt potential attack paths in real time.

This dual approach ensures that protection is both precise and timely.

### Prediction logic

Prediction allows organizations to identify assets at risk and apply tailored protections in real time. Prediction focuses on emerging risks rather than static prevention, which minimizes operational friction and ensures that security measures are applied precisely where needed. For example, if a specific attacker tool is detected, predictive shielding can infer the next likely target based on past attack patterns.

Defender uses multiple layers of insight to make accurate predictions:

- Threat intelligence aligns observed activity with known attacker tools and tactics.
- Learnings from past incidents are used to recognize statistical patterns, and extrapolate the most probable next steps.
- Organizational exposure data is used to map how the environment is structured—which assets and identities are connected, which permissions these identities have, which vulnerabilities or misconfigurations exist, and how risk can propagate across them.

Together, these insights create a dynamic understanding of the environment and its risks.

### Graph-based logic

Graph-based prediction logic bridges the gap between pre-breach and post-breach systems, providing a unified view of attacker activity across the organizational topology. This unified view includes the organization's assets, connections, and vulnerabilities. Graph-based logic combines live activity data with the structural map of the environment.

This integration allows Defender to dynamically adjust protections based on the most critical vulnerabilities, enabling real-time prioritization of defenses and stopping attackers before they reach critical assets.

The process involves three key stages: 

1. Defender overlays post-breach activity onto the organization’s exposure graph, creating a comprehensive view of potential attack paths. 
1. Defender identifies the blast radius—the related assets that the identified activity might affect.
1. Reasoning models predict paths attackers are most likely to take, factoring in past behaviors, asset characteristics, and environmental vulnerabilities.

This dynamic understanding allows Defender to move beyond reactive responses, enabling just-in-time protection that stops attackers before they reach critical assets.

## Predictive shielding actions

Predictive shielding uses Defender for Endpoint-based actions. To use these actions, you need a Defender for Endpoint license.

- [Safeboot hardening](/defender-endpoint/respond-machine-alerts#safeboot-hardening) (Preview) - hardens the device against booting into Safe Mode. Booting into Safe Mode is a common tactic used by attackers to bypass security controls and maintain persistence on compromised systems.

- [GPO hardening](/defender-endpoint/respond-machine-alerts#gpo-hardening) (Preview) - hardens Group Policy Objects (GPOs) to prevent attackers from exploiting misconfigurations or weaknesses in GPO settings to escalate privileges or move laterally within the network.

- [Proactive user containment (contain user)](/defender-endpoint/respond-machine-alerts#contain-user-from-the-network) - infuses activity data with exposure data to identify exposed credentials at risk of being compromised and reused to conduct malicious activity. Proactively restricts the activity of the users associated with those credentials.

    > [!NOTE]
    > While the contain user action is used both in attack disruption and predictive shielding, this action is applied differently in each context. In predictive shielding, the contain user action applies restrictions more selectively, with a focus on users identified as high risk through prediction logic. This action prevents new sessions rather than terminating existing ones.
    > 
    > This action is generally available, both when triggered by attack disruption and predictive shielding.

## Next steps

- [Manage predictive shielding in Microsoft Defender](shield-predict-threats-manage.md) - Learn how to manage predictive shielding actions and investigate their impact in your environment.
- [Automatic attack disruption in Microsoft Defender](automatic-attack-disruption.md) - Learn how automatic attack disruption works to identify and neutralize confirmed malicious activities.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
