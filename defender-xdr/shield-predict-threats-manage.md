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

# Manage predictive shielding in Microsoft Defender XDR (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Microsoft Defender XDR uses predictive shielding (Preview) as a proactive defense strategy designed to anticipate and mitigate threats before they materialize. Learn [how predictive shielding works](shield-predict-threats.md#how-predictive-shielding-works) to dynamically infer risk, anticipate attacker progression, and harden your environment.

This article describes how to manage predictive shielding so that you can enrich your prediction data and understand how predictive shielding actions are applied in your environment.

## Enrich predictive shielding data

We recommend that you use the Microsoft Defender for Identity sensor to improve security insights and expand coverage. This approach adds metadata like usernames, Active Directory details, and group memberships to alerts, making them more actionable.

To add the unified sensor, see [Deploy Microsoft Defender for Identity](/defender-for-identity/deploy/deploy-defender-identity).

For example, this screenshot shows how enriched data appears in an incident, in an environment with both Microsoft Defender for Endpoint and Microsoft Defender for Identity enabled:

TBD - screenshot

## Review predictive shielding details and results

The incident view in Microsoft Defender XDR includes built-in predictive shielding details. Use the incident graph and activity information to assess the predictive shielding impact and status.

> [!TIP]
> To undo an action, see [Undo actions triggered by predictive shielding](#undo-actions-triggered-by-predictive-shielding).

### Review the incident information

Review the incident graph to get the entire [attack story](investigate-incidents.md#attack-story) and assess the predictive shielding impact and status.

TBD - image

Review the incident page for predictive shielding details and results:

- Filter by the **Predictive Shielding** label to find incidents where predictive shielding is applied.
- Review the incident summary pane, which shows how predictive shielding is applied across your environment:

    - The **Predictive shielding** label and the specific threat type identified (for example, ransomware). If you subscribe to incident email notifications, these tags also appear in the emails.
    - The number of predictive shielding policies invoked as part of this incident, and the number of hardened devices across all policies.

    > [!NOTE]
    > The incident shows historical data from the inception of the incident, not a snapshot of current status. For the current status, select the **Activity** tab and [review the hardened devices in each activity's details](#review-the-activity-information).

    TBD - screenshot

### Review the activity information

Select the incident's **Activity** tab and filter by the **Response** category to get a live snapshot of the activities where predictive shielding actions are applied:

- Review the **Type** column to see the actions triggered by predictive shielding.
    
    In this example, the **GPO Hardening**, **Safeboot Hardening**, and **Contain User from the Network** actions are applied as part of predictive shielding.

    TBD - screenshot

- Review the **Triggering alert** column to see the alert that led to the predictive shielding action. For more information, see [Review the triggering alert information](#review-the-triggering-alert-information).
- Review the **Policy status** column to see which hardening policies are currently applied.

> [!NOTE]
> The **Performed by** column indicates **Attack Disruption** both for attack disruption and predictive shielding actions. To understand which specific actions apply to predictive shielding, see the [Predictive shielding actions](shield-predict-threats.md#predictive-shielding-actions).

- Select a specific action to open the activity details pane, which shows the number of devices where the relevant policy is currently applied.

TBD - screenshot

> [!TIP]
> While the **Activity** tab displays actions that are specific to the current incident, the Action center displays all activites. To track predictive shielding actions in the Action center, see [Use the Action center](m365d-action-center.md).

### Review the triggering alert information

To investigate the alert that led to the predictive shielding action, select the triggering alert either from the incident details pane or from the activity page.

TBD - screenshot

In the alert, you can review:

- Which assets are at risk.
- The triggering malicious activity from the **Alert chain**.
- The exposure data used to calculate this risk.

## Track policy modifications in advanced hunting

You can use specific queries in [advanced hunting](advanced-hunting-overview.md) to track policy modifications in your environment.

### Track enabled predictive shielding hardening policies

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

### Track policy modification events in the environment

This sample query retrieves policy modification events in the environment, including application and removal of hardening policies from devices onboarded to Defender for Endpoint.

```kusto
  DisruptionAndResponseEvents
let hardeningPolicyType = dynamic(["GpoPrevention", "SafebootPrevention"]);
let lookBackTime = datetime("");
DisruptionAndResponseEvents
| where PolicyName in (hardeningPolicyType)
| where Timestamp > lookBackTime
| where ReportType == 'PolicyUpdated' and IsPolicyOn == '1'
| summarize arg_max(Timestamp, DeviceName) , PoliciesApplied = make_set(PolicyName)  by DeviceId
```

### Track blocked events related to predictive shielding hardening policies

This sample query retrieves blocked events related to predictive shielding hardening policies, and allows you to monitor when specific actions were blocked on devices.

```kusto
  DisruptionAndResponseEvents
let hardeningPolicyType = dynamic(["GpoPrevention", "SafebootPrevention"]);
DisruptionAndResponseEvents
| where PolicyName in (hardeningPolicyType)
| where ReportType == 'Prevented'
```

## Undo actions triggered by predictive shielding

You can undo an action that was applied as part of predictive shielding. 

To undo an action, do one of the following:

- In the **Activity** tab of the incident, select the specific action you want to undo.
- [Undo an action from the Action center](m365d-autoir-actions.md#undo-completed-actions).