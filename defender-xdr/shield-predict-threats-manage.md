---
title: Manage predictive shielding in Microsoft Defender XDR
description: Manage the predictive shielding feature in Microsoft Defender XDR.
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
ms.topic: how-to
search.appverid: 
  - MOE150
  - MET150
ms.date: 11/04/2025
appliesto:
  - Microsoft Defender XDR
  - Microsoft Defender for Endpoint
---

# Manage predictive shielding in Microsoft Defender XDR

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Microsoft Defender XDR uses predictive shielding as a proactive defense strategy designed to anticipate and mitigate threats before they materialize. Learn [how predictive shielding works](shield-predict-threats.md#how-predictive-shielding-works) to dynamically infer risk, anticipate attacker progression, and harden your environment.

This article describes how to manage predictive shielding so that you can enrich your prediction data and understand how predictive shielding actions are applied in your environment.

## Enrich predictive shielding data

We recommend that you use the Microsoft Defender for Identity unified sensor to improve security insights and expand coverage. The unified sensor combines endpoint and identity data into a single installation, removing the need for separate setups and enhancing detection capabilities. This approach adds metadata like usernames, Active Directory details, and group memberships to alerts, making them more actionable.

To add the unified sensor, see [Deploy Microsoft Defender for Identity](/defender-for-identity/deploy/deploy-defender-identity).

For example, this screenshot shows how enriched data appears in an incident, in an environment with both Microsoft Defender for Endpoint and Microsoft Defender for Identity enabled:

TBD - screenshot

## Review predictive shielding details and results

### Review the incident information

Review the incident graph to get the entire [attack story](investigate-incidents.md#attack-story) and assess the predictive shielding impact and status.

TBD - image

The incident page includes the following information:

- Filter by the the **Predictive Shielding** label to find incidents where predictive shielding is applied.
- Review the incident summary pane, which shows how predictive shielding is applied across your environment:

    - The **Predictive shielding** label and the specific threat type identified (for example, ransomware). If you subscribe to incident email notifications, these tags also appear in the emails.
    - The number of hardening policies applied as part of predictive shielding, and the number of devices each policy applies to.

    TBD - screenshot

### Review the activity information

Select the incident's **Activity** tab and filter by the **Response** category to get a live snapshot of the activities where predictive shielding actions are applied. Each action is specified under the **Type** column.
    
In this example, the **GPO Hardening**, **Safeboot Hardening**, and **Contain User from the Network** actions are applied as part of predictive shielding.

TBD - screenshot

> [!NOTE]
> The **Performed by** column indicates **Attack Disruption** both for attack disruption and predictive shielding actions. To understand which specific actions apply to predictive shielding, see the [Predictive shielding actions](shield-predict-threats.md#predictive-shielding-actions).

Select a specific action to open the activity details pane, which shows the number of devices where the relevant policy is currently applied.

TBD - screenshot

### Review the triggering alert information

To investigate the alert that led to the predictive shielding action, select the triggering alert either from the incident details pane or from the activity page.

TBD - screenshot

In the alert, you can review:

- Which assets are at risk.
- The triggering malicious activity from the **Alert chain**.
- The exposure data used to calculate this risk.

## Track the actions in the Action center

To track predictive shielding actions in the Action center, see [Track the actions in the Action center](autoad-results.md#track-the-actions-in-the-action-center) article.

## Track the actions in advanced hunting

You can use specific queries in [advanced hunting](advanced-hunting-overview.md) to track contain device or user, and disable user account actions.

### Track containment-related events

Containment in Microsoft Defender for Endpoint prevents further threat actor activity by blocking communication from contained entities. For containment related queries in advanced hunting, see [Containment-related events in advanced hunting](autoad-results.md#containment-related-events-in-advanced-hunting) article.

### Track policy modifications

This sample query retrieves events related to changes in predictive shielding hardening policies, and allows you to monitor when policies are enabled or disabled for specific domains. The query uses the [DisruptionAndResponseEvents table](advanced-hunting-disruptionandresponseevents-table.md).

```Kusto
  DisruptionAndResponseEvents
let hardeningPolicyType = 
let lookBackTime = 
DisruptionAndResponseEvents
| where Timestamp > lookBackTime
| where PolicyName == hardeningPolicyType
| where DomainName == domainName
| summarize arg_max(Timestamp, IsPolicyOn) by DeviceId
| where IsPolicyOn
```

## Undo predictive shielding actions

If a predictive shielding action isn't needed or doesn't reflect the current risk level, you can manually undo the action from the incident page. 

To undo an incident: 

1. Select the incident from the incident page. 
1. In the incident details pane, select **Undo** under the incident name. 

    Predictive shielding actions are no longer applied to the selected incident.