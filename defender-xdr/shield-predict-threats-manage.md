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
ms.topic: concept-article
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

This article describes how to manage predictive shielding so that you can understand its capabilities and how it enhances your security posture.

## Enrich predictive shielding data

Enrich predictive shielding data to improve security insights and expand coverage. The unified sensor combines endpoint and identity data into a single installation, removing the need for separate setups and enhancing detection capabilities. This approach adds metadata like usernames, Active Directory details, and group memberships to alerts, making them more actionable.

For more information, see [Deploy Microsoft Defender for Identity](/defender-for-identity/deploy/deploy-defender-identity.md).

For example, this screenshot shows how enriched data appears in an incident, in an environment with both Microsoft Defender for Endpoint and Microsoft Defender for Identity enabled:

TBD - screenshot

## Review the incident graph

Predictive shielding is built-in in the incident view. Review the incident graph to get the entire attack story and assess the predictive shielding impact and status.

The incident page includes the following information:

- Incidents where predictive shielding is applied include a tag for 'Predictive Shielding' and the specific threat type identified (for example, ransomware). If you subscribe to incident email notifications, these tags also appear in the emails.
- Suspended users and contained devices appear with a label indicating their status.

To release a user account or a device from containment, select the contained asset and select **release from containment** for a device or **enable user** for a user account.

## Track the actions in the Action center

The Action center ([https://security.microsoft.com/action-center](https://security.microsoft.com/action-center)) brings together [remediation](m365d-remediation-actions.md) and response actions across your devices, email and collaboration content, and identities. Actions listed include manual or automatic remediation actions. You can view predictive shielding actions in the Action center.

You can release the contained assets, for example, enable a blocked user account or release a device from containment, from the action details pane. You can release the contained assets after you mitigate the risk and complete the investigation of an incident. For more information about the action center, see [Action center](m365d-action-center.md).

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

## Next steps

TBD

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
