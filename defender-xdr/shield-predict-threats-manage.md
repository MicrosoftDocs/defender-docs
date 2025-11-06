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

## Review the incident

Predictive shielding is built-in in the incident view. Review the incident graph to get the entire [attack story](investigate-incidents.md#attack-story) and assess the predictive shielding impact and status.

TBD - image

The incident page includes the following information:

- Incidents where predictive shielding is applied include a tag for 'Predictive Shielding' and the specific threat type identified (for example, ransomware). If you subscribe to incident email notifications, these tags also appear in the emails.
- Suspended users and contained devices appear with a label indicating their status.

To release a user account or a device from containment, select the contained asset and select **release from containment** for a device or **enable user** for a user account.

The incident summary pane shows historical data on the attack, and how predictive shielding was applied. Specifically, it shows:

- The number of hardening policies applied as part of predictive shielding.
- The number of devices each policy applies to.

In the incident **Activity** tab, filter by the **Response** category to get a live snapshot of the activities where a predictive shielding action is applied. The action is specified under the **Type** column. In this example, the **GPO Hardening**, **Safeboot Hardening**, and **Contain User from the Network** actions were applied as part of predictive shielding.

Select an action to open the activity details, which shows the number of devices that currently apply the relevant policy.

> [!NOTE]
> The **Performed by** column indicates **Attack Disruption** both for attack disruption and predictive shielding actions. To understand which specific actions apply to predictive shielding, see the [Predictive shielding actions](shield-predict-threats.md#predictive-shielding-actions).

Select the **Triggering alert** column to investigate the alert that led to the predictive shielding action, including the risk, activity, and exposure data that led to the alert. In the alert page, you can also see the alert that triggered the prediction as part of the **Alert chain**.

To summarize:

- In the alert body, you can see which assets are at risk.
- In the alert chain, you can see the triggering malicious activity.
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