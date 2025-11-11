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

# Predictive shielding in Microsoft Defender XDR (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Predictive shielding (Preview) is a proactive defense strategy designed to anticipate and mitigate threats as part of an ongoing attack. Predictive shielding [expands the Microsoft Defender XDR autonomous protection stack](#how-predictive-shielding-expands-on-automatic-attack-disruption), enhancing automatic attack disruption capabilities with proactive measures.

This article provides an overview of predictive shielding so that you can understand its capabilities and how it enhances your security posture.

Learn [how predictive shielding works](#how-predictive-shielding-works) or how to [manage predictive shielding in Microsoft Defender XDR](shield-predict-threats-manage.md).

## How predictive shielding expands on automatic attack disruption

The evolving threat landscape creates an imbalance: defenders must secure every asset, while attackers need only one opening. Traditional defenses are reactive, responding after malicious activity begins. This approach leaves defenders chasing attackers, who often act too quickly or subtly to detect in real time. While some attacker behaviors must be blocked outright, static prevention disrupts productivity and adds operational overhead.

To address these challenges, predictive shielding enhances Defender XDR's autonomous protection stack, expanding [attack disruption](automatic-attack-disruption.md) to include proactive measures during an attack, anticipating risks and applying targeted protections only where needed. 

This proactive approach reduces the reactive chase, minimizes operational burden, maintains usability, and protects the environment before attackers can advance.

While attack disruption identifies and contains compromised assets using high-fidelity signals, predictive shielding anticipates potential attack progression and proactively restricts vulnerable assets or paths. For example, while automatic attack disruption isolates a compromised device, predictive shielding might proactively restrict access to sensitive data for at-risk devices.

## How predictive shielding works

Predictive shielding uses predictive analytics and real-time insights to dynamically identify emerging risks, and applies targeted protections.

Predictive shielding integrates posture, activity, and scenario context to identify potential attack paths and targets, selectively hardening critical assets or constraining attack paths just in time. 

This approach minimizes operational overhead and provides security teams with more time to respond. For example, predictive shielding can dynamically restrict access to sensitive data for devices identified as at-risk, reducing the need for broad, environment-wide restrictions.

Predictive shielding relies on two pillars:  

- **Prediction** 
    - Involves analyzing threat intelligence, attacker behavior, past incidents, and organizational exposure. 
    - Defender XDR uses this prediction data to identify emerging risks, to understand likely attack progression, and to infer risk on non-compromised assets.
- **Enforcement** applies preventative protective controls to disrupt potential attack paths in real time.

This dual approach ensures that protection is both precise and timely.

### Prediction logic

Prediction allows organizations to identify assets at risk and apply tailored protections in real time. Prediction focuses on emerging risks rather than static prevention, which minimizes operational friction and ensures that security measures are applied precisely where needed. For instance, if a specific attacker tool is detected, predictive shielding can infer the next likely target based on past attack patterns.

Defender XDR uses multiple layers of insight to make accurate predictions:

- Threat intelligence aligns observed activity with known attacker tools and tactics.
- Learnings from past incidents are used to recognize statistical patterns, and extrapolate the most probable next steps.
- Organizational exposure data is used to map how the environment is structured—which assets and identities are connected, which permissions these identities have, which vulnerabilities or misconfigurations exist, and how risk can propagate across them.

Together, these insights create a dynamic understanding of the environment and its risks.

### Graph-based logic

Graph-based prediction logic bridges the gap between pre-breach and post-breach systems, providing a unified view of attacker activity and organizational vulnerabilities. Graph-based logic combines live activity data with the structural map of the environment. 

This integration allows Defender XDR to dynamically adjust protections based on the most critical vulnerabilities, enabling real-time prioritization of defenses and stopping attackers before they reach critical assets.

The process involves three key stages: 

1. Defender XDR overlays post-breach activity onto the organization’s exposure graph, creating a comprehensive view of potential attack paths. 
1. Defender XDR identifies the "blast radius"—the assets and configurations that could be impacted next. 
1. Reasoning models predict paths attackers are most likely to take, factoring in past behaviors, asset characteristics, and environmental vulnerabilities.

This dynamic understanding allows Defender XDR to move beyond reactive responses, enabling just-in-time protection that stops attackers before they reach critical assets.

## Predictive shielding actions

Predictive shielding uses Defender for Endpoint-based actions. To use these actions, you need a Defender for Endpoint license.

- Safeboot hardening - hardens the device against booting into Safe Mode. Booting into Safe Mode is a common tactic used by attackers to bypass security controls and maintain persistence on compromised systems.

- GPO hardening - hardens Group Policy Objects (GPOs) to prevent attackers from exploiting misconfigurations or weaknesses in GPO settings to escalate privileges or move laterally within the network.

- [Proactive user containment (contain user)](/defender-endpoint/respond-machine-alerts#contain-user-from-the-network) - infuses activity data with exposure data to identify exposed credentials at risk of being compromised and reused to conduct malicious activity. Proactively restricts the activity of the users associated with those credentials.

    > [!NOTE]
    > While the contain user action is used both in attack disruption and predictive shielding, this action is applied differently in each context. In predictive shielding, the contain user action applies restrictions more selectively, with a focus on users identified as high risk through prediction logic. This action prevents new sessions rather than terminating existing ones.

## Example scenario

This example illustrates how predictive shielding works in conjunction with automatic attack disruption to defend against an ongoing attack:

1. A hands-on-keyboard attacker gains access to the environment and begins operating.
2. Attack disruption automatically contains the compromised user, preventing further lateral movement.
3. Predictive shielding anticipates the attacker's next steps and proactively hardens the environment.
4. By the time security teams engage, the attack has already been halted, minimizing impact.
5. Security teams investigate the incident, leveraging the attack story to understand the progression and complete the response.

### Stages and defenses

This table summarizes the steps of an attack and how predictive shielding and attack disruption defend against it, providing clarity and context.

| Stage | Description | Method/feature used | Analyze with Predictive Shielding |
|-----------|-----------------|--------------------------|-----------------------------------|
| Initial Detection | An anomalous remote connection from an external IP into a domain controller using a privileged account is flagged as the first indication of compromise. | Threat intelligence and anomaly detection | Exposure graph and activity chain analysis |
| Behavioral Analysis | A new privileged local account is created, signaling hands-on-keyboard activity. This triggers automatic containment of the user involved. | Automatic attack disruption | Incident graph to trace lateral movement |
| Threat Actor Correlation | The account creation pattern matches the Cactus ransomware playbook. Defender correlates this activity with the Cactus threat actor profile. | Threat intelligence and pattern recognition | Pivot from the incident into Threat Analytics |
| Threat Intelligence Integration | Bread Analytics provides insights into the attacker’s campaign methods, tooling, and typical progression patterns. | Bread Analytics | Threat Analytics dashboard for campaign insights |
| Predictive Shielding Activation | Based on the exposure graph and activity chain, predictive shielding identifies devices at risk of being rebooted into Safe Mode. Hardening policies are automatically applied to prevent this. | Predictive shielding and hardening policies | Exposure graph to identify at-risk devices |
| Disruption Summary | The Disruption Summary card aggregates all actions taken, showing their impact and enforcement status. | Disruption Summary card | Action center for detailed enforcement logs |
| Live Activity Monitoring | The Activity tab provides a detailed view of every disruption action, including the alerts that triggered them and the devices protected. | Activity tab | Live view of disruption actions in the Activity tab |
| Outcome | The attacker’s attempt to reboot devices into Safe Mode is blocked. When the attacker pivots to disabling Defender AV via Group Policy, GPO hardening prevents the propagation of malicious changes. Ultimately, the encryption attempt is blocked, and the environment remains secure. | Predictive shielding, GPO hardening, and Safeboot hardening | Incident timeline to review blocked actions |

## Next steps

- [Manage predictive shielding in Microsoft Defender XDR](shield-predict-threats-manage.md) - Learn how to manage predictive shielding actions and investigate their impact in your environment.
- [Automatic attack disruption in Microsoft Defender XDR](automatic-attack-disruption.md) - Learn how automatic attack disruption works to identify and neutralize confirmed malicious activities.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
