---
title: Details and results of an automatic attack disruption action
description: View the results and key findings of automatic attack disruption in Microsoft Defender XDR
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.date: 10/21/2025
ms.collection: 
- m365-security
- tier2
ms.topic: article
ms.custom: 
- autoir
- admindeeplinkDEFENDER
ms.reviewer: evaldm, isco
appliesto:
- Microsoft Defender XDR
---

# Details and results of an automatic attack disruption action

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

When an automatic attack disruption triggers in Microsoft Defender XDR, you can view the details about the risk and the containment status of compromised assets during and after the process. You can view the details on the incident page, which provides the full details of the attack and the up-to-date status of associated assets.

## Review the incident graph

Microsoft Defender XDR automatic attack disruption is built-in in the incident view. Review the incident graph to get the entire attack story and assess the attack disruption impact and status.

The incident page includes the following information:

- Disrupted incidents include a tag for 'Attack Disruption' and the specific threat type identified (for example, ransomware). If you subscribe to incident email notifications, these tags also appear in the emails.
- A highlighted notification below the incident title indicating that the incident was disrupted.
- Suspended users and contained devices appear with a label indicating their status.

To release a user account or a device from containment, select the contained asset and select **release from containment** for a device or **enable user** for a user account.

## Track the actions in the Action center

The Action center ([https://security.microsoft.com/action-center](https://security.microsoft.com/action-center)) brings together [remediation](m365d-remediation-actions.md) and response actions across your devices, email & collaboration content, and identities. Actions listed include remediation actions that were taken automatically or manually. You can view automatic attack disruption actions in the Action center.

You can release the contained assets, for example, enable a blocked user account or release a device from containment, from the action details pane. You can release the contained assets after you mitigate the risk and complete the investigation of an incident. For more information about the action center, see [Action center](m365d-action-center.md).
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]

## Track the action status in the Activities tab

The **Activities** tab in the **Incident** page allows you to view details related to a specific incident, including the date and time the activity started, the triggering alert, and more. 

The **Policy status** column (Preview) in the activities list provides a stateful list of actions and policies taken within incidents, which allows you to see the current status of all relevant actions and policies in your environment. This addresses the challenge of tracking ongoing and expired actions, especially in large environments with many incidents.

To view all automatic attack disruption and predictive shielding actions taken as part of an incident:

1. In the incident's **Activities** tab, add the following filters:
    - Select **30 Days** > **Custom range**, and select the relevant timeframe for the actions you want to investigate.
    - **Performed by** - **AttackDisruption**. This filter also includes predictive shielding actions.
    - **Activity status** - **Completed**. This shows you the current policy status for actions that are completed, filtering out partial or in-progress actions.
    - **Policy status**: Select **Active**, **Inactive**, and **No status** (all options except **Not applicable**).
1. Review the listed activities. The **Policy status** column shows the current status of the policy for each activity. For example, a user was contained in the specified timeframe, but the policy is currently inactive. This means that the user is no longer contained.

    :::image type="content" source="media/autoad-results/activities-tab-status.png" alt-text="Screenshot of the Activities tab showing policy status." lightbox="media/autoad-results/activities-tab-status.png":::

The following policy statuses are available:

- **Active**: The policy is currently active and enforced.
- **Inactive**: The policy was previously applied but is no longer active. For example, a user was contained but has since been released.
- **Not applicable**: The policy status doesn't apply to the action. For example, the policy status doesn't apply to an uncontain action, because uncontain actions are not policies but rather the reversal of a previous action.
- **No status**: The policy status couldn't be retrieved for various reasons, for example, the action is still in progress and the final status is not yet determined.

This view provides unique data on the activity and policy status in the selected timeframe. This data goes beyond Action center views, which provide a historical log of actions taken but do not reflect the current status of those actions.  

## Track the actions in advanced hunting

You can use specific queries in [advanced hunting](advanced-hunting-overview.md) to track contain device or user, and disable user account actions.

### Containment-related events in advanced hunting

Containment in Microsoft Defender for Endpoint prevents further threat actor activity by blocking communication from contained entities. In advanced hunting, the [DeviceEvents table](advanced-hunting-deviceevents-table.md) logs **block actions that result from containment**, not the initial containment action itself:

- **Device-derived block actions** - These events indicate activity (such as network communication) that was *blocked because the device was contained*:

  ```Kusto
  DeviceEvents
  | where ActionType contains "ContainedDevice"
  ```

- **User-derived block actions** - These events indicate activity (such as sign-in or resource access attempts) that was *blocked because the user was contained*:

  ```Kusto
  DeviceEvents
  | where ActionType contains "ContainedUser"
  ```

### Hunt for disable user account actions

Attack disruption uses the remediation action capability of Microsoft Defender for Identity to disable accounts. By default, Microsoft Defender for Identity uses the LocalSystem account of the domain controller for all remediation actions. 

The following query looks for events where a domain controller disabled user accounts. This query also returns user accounts disabled by automatic attack disruption by triggering account disable in Microsoft Defender XDR manually: 

```Kusto
let AllDomainControllers =
DeviceNetworkEvents
| where TimeGenerated > ago(7d)
| where LocalPort == 88
| where LocalIPType == "FourToSixMapping"
| extend DCDevicename = tostring(split(DeviceName,".")[0])
| distinct DCDevicename;
IdentityDirectoryEvents
| where TimeGenerated > ago(90d)
| where ActionType == "Account disabled"
| where Application == "Active Directory"
| extend ACTOR_DEVICE = tolower(tostring(AdditionalFields.["ACTOR.DEVICE"]))
| where isnotempty( ACTOR_DEVICE)
| where ACTOR_DEVICE in (AllDomainControllers)
| project TimeGenerated, TargetAccountUpn, ACTOR_DEVICE
```

The preceding query was adapted from a [Microsoft Defender for Identity - Attack Disruption query](https://github.com/alexverboon/Hunting-Queries-Detection-Rules/blob/main/Defender%20For%20Identity/MDI-AttackDisruption.md#microsoft-365-defender).

## Related content

- [Exclude assets from automated response actions](automatic-attack-disruption-exclusions.md)
- [Get email notifications for response actions](m365d-response-actions-notifications.md)