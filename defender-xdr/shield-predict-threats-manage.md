---
title: Manage predictive shielding in Microsoft Defender
description: Manage the predictive shielding feature in Microsoft Defender.
ms.service: defender-xdr
ms.author: monaberdugo
author: mberdugo
ms.localizationpriority: medium
ms.collection: 
  - m365-security
  - tier1
  - usx-security
  - usx-security
ms.topic: how-to
ms.date: 11/04/2025
appliesto:
  - Microsoft Defender XDR
  - Microsoft Defender for Endpoint
---

# Manage predictive shielding in Microsoft Defender (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Microsoft Defender uses predictive shielding (Preview) as a proactive defense strategy designed to anticipate and mitigate threats before they materialize. Learn [how predictive shielding works](shield-predict-threats.md#how-predictive-shielding-works) to dynamically infer risk, anticipate attacker progression, and harden your environment.

This article describes how to manage predictive shielding so that you can enrich your prediction data and understand how predictive shielding actions are applied in your environment.

## Review predictive shielding details and results

The incident view in Microsoft Defender includes built-in predictive shielding details. Use the incident graph and activity information to assess the predictive shielding impact and status.

> [!TIP]
> To enrich your predictive shielding data, we recommend that you use the Microsoft Defender for Identity sensor to improve security insights and expand coverage. For more information, see [Enrich predictive shielding data](#enrich-predictive-shielding-data).

### Review the incident information

In the **Incidents** page, filter by the **Predictive Shielding** tag to find incidents where predictive shielding is applied.

:::image type="content" source="media/shield-predict-threats-manage/shield-predict-threats-filter-incidents.png" alt-text="Screenshot of the incident list filtered by the Predictive Shielding tag." lightbox="media/shield-predict-threats-manage/shield-predict-threats-filter-incidents.png":::

> [!NOTE]
> While the incident and alert details show historical data from the inception of the incident, the **Activities** tab shows a snapshot of the current status. For more information, see [Track the action status in the Activities tab](autoad-results.md#track-the-action-status-in-the-activities-tab-preview).

You can then select the relevant incident, and review the incident graph to get the entire [attack story](investigate-incidents.md#attack-story) and assess the predictive shielding impact and status.

:::image type="content" source="media/shield-predict-threats-manage/shield-predict-threats-attack-story.png" alt-text="Screenshot of predictive shielding data shown in the incident graph, attack story, and disruption summary card." lightbox="media/shield-predict-threats-manage/shield-predict-threats-attack-story.png":::

You can also review the alert, and disruption information for predictive shielding details and results:

- In the alert details, view the **Predictive shielding** label and the specific threat type identified (for example, ransomware). If you subscribe to incident email notifications, these tags also appear in the emails.
    
    :::image type="content" source="media/shield-predict-threats-manage/shield-predict-threats-alert-details.png" alt-text="Screenshot of the alert details with the Predictive Shielding label."::: 

- In the [disruption summary](autoad-results.md#review-the-attack-disruption-summary-card), view the number of predictive shielding policies invoked as part of this incident, and the number of hardened devices across all policies.

    :::image type="content" source="media/shield-predict-threats-manage/shield-predict-threats-disruption-summary.png" alt-text="Screenshot of the disruption summary card showing predictive shielding details." loc-scope="other":::

### Review the activity information

Select the incident's **Activities** tab and filter by the **Response** category to get a live snapshot of the activities where predictive shielding actions are applied:

- Review the **Type** column to see the actions triggered by predictive shielding.
    
    In this example, the **Contain User**, **GPO Hardening**, and **SafeBoot Hardening** actions are applied as part of predictive shielding. Learn more about [predictive shielding actions](shield-predict-threats.md#predictive-shielding-actions).

    :::image type="content" source="media/shield-predict-threats-manage/shield-predict-threats-view-activities.png" alt-text="Screenshot of the Activities tab filtered by Response category, showing predictive shielding actions." lightbox="media/shield-predict-threats-manage/shield-predict-threats-view-activities.png":::

- Select the **Triggering alert** column to open the alert details pane, and review the alert that led to the predictive shielding action. For more information, see [Review the triggering alert information](#review-the-triggering-alert-information).
- Review the **Policy status** column to see which hardening policies are currently applied.

> [!NOTE]
> The **Performed by** column indicates **Attack Disruption** both for attack disruption and predictive shielding actions. To understand which specific actions apply to predictive shielding, see the [Predictive shielding actions](shield-predict-threats.md#predictive-shielding-actions).

- Select a specific action to open the activity details pane, which describes the activity, and shows the number of devices where the relevant policy is currently applied.

    :::image type="content" source="media/shield-predict-threats-manage/shield-predict-threats-view-activity-details.png" alt-text="Screenshot of the activity details pane showing the number of devices hardened by a predictive shielding action.":::

> [!TIP]
> While the **Activities** tab displays actions that are specific to the current incident, the Action center displays all activites. To track predictive shielding actions in the Action center, see [Use the Action center](m365d-action-center.md).

### Review the triggering alert information

To investigate the alert that led to the predictive shielding action, select the triggering alert either from the incident details pane or from the activity page.

:::image type="content" source="media/shield-predict-threats-manage/shield-predict-threats-view-triggering-alert.png" alt-text="Screenshot of the alert details pane showing relevant alert data." lightbox="media/shield-predict-threats-manage/shield-predict-threats-view-triggering-alert.png":::

In the alert, you can review:

- Which assets are at risk.
- The triggering malicious activity from the **Alert chain**.
- The exposure data used to calculate this risk.

## Enrich predictive shielding data

We recommend that you use the Microsoft Defender for Identity sensor to improve security insights and expand coverage. This approach adds metadata like usernames, Active Directory details, and group memberships to alerts, making them more actionable.

To add the Defender for Identity sensor, see [Deploy Microsoft Defender for Identity](/defender-for-identity/deploy/deploy-defender-identity).

### Enriched data example

In this example scenario:

- Both Microsoft Defender for Endpoint and Microsoft Defender for Identity are enabled in the environment. 
- An attacker gained a foothold on a jump box and conducted malicious activities that led to compromising a workstation (WSA).
- The enriched data reveals suspicious PowerShell activities on WSA, **indicating the attacker's intent to perform remote credential harvesting on WSB**.
- This enrichment adds predictive data on the incident, and indicates intent for further compromise.

:::image type="content" source="media/shield-predict-threats-manage/shield-predict-threats-enriched-data.png" alt-text="Screenshot of enriched predictive shielding data in an incident, showing user and Active Directory details.":::

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

This sample query retrieves policy modification events in the environment, including application and removal of hardening policies from devices onboarded to Defender for Endpoint. The query uses the [DisruptionAndResponseEvents table](advanced-hunting-disruptionandresponseevents-table.md).

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

This sample query retrieves blocked events related to predictive shielding hardening policies, and allows you to monitor when specific actions were blocked on devices. The query uses the [DisruptionAndResponseEvents table](advanced-hunting-disruptionandresponseevents-table.md).

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