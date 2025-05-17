---
title: Review remediation actions in Microsoft Defender for Business
description: View remediations that were taken on detected threats or suspected attacks with Defender for Business.
search.appverid: MET150
author: chrisda
ms.author: chrisda
manager: deniseb
audience: Admin
ms.topic: how-to
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 12/02/2022
ms.reviewer: efratka
f1.keywords: NOCSH
ms.collection:
- SMB
- m365-security
- m365-initiative-defender-business
- tier1
---

# Review remediation actions in the Action Center

As threats are detected, remediation actions come into play. Depending on the particular threat and how your security settings are configured, remediation actions might be taken automatically or only upon approval. Examples of remediation actions include stopping a process from running or removing a scheduled task.

All remediation actions are tracked in the Action Center.

:::image type="content" source="media/mdb-actioncenter.png" alt-text="Screenshot of the location of the Action Center in the Microsoft Defender portal." lightbox="media/mdb-actioncenter.png":::

**This article describes**:

- [How to use the Action Center](#how-to-use-the-action-center)
- [Remediation actions](#remediation-actions)

## How to use the Action Center

1. In the Defender portal at <https://security.microsoft.com>, go to  **Actions & submissions** \> **Action Center**. Or, to go directly to the **Action Center** page, use <https://security.microsoft.com/action-center>.

2. On the **Action Center** page, use the available tabs:
   - **Pending**: View and approve (or reject) any pending actions. Actions on the **Pending** tab can arise from anti-virus protection, anti-malware protection, automated investigations, manual response activities, or live response sessions.
   - **History**: View completed actions.

## Remediation actions

Defender for Business includes several remediation actions. These actions include manual response actions, actions following automated investigation, and live response actions.

The following table lists remediation actions that are available.

|Source|Actions|
|---|---|
|[Automatic attack disruption](mdb-attack-disruption.md)|<ul></li>Contain a device</li><li>Contain a user account on a device</li><li>Disable a user account</ul></li>|
|[Automated investigations](/defender-endpoint/automated-investigations)|<ul></li>Quarantine a file</li><li>Remove a registry key</li><li>Kill a process</li><li>Stop a service</li><li>Disable a driver</li><li>Remove a scheduled task</ul></li>|
|[Manual response actions](/defender-endpoint/respond-machine-alerts)|<ul></li>Run antivirus scan</li><li>Isolate a device</li><li>Add an indicator to block or allow a file</ul></li>|
|[Live response](/defender-endpoint/live-response)|<ul></li>Collect forensic data</li><li>Analyze a file</li><li>Run a script</li><li>Send a suspicious entity to Microsoft for analysis</li><li>Remediate a file</li><li>Proactively hunt for threats</ul></li>|

## Next steps

- [Respond to and mitigate threats in Defender for Business](mdb-respond-mitigate-threats.md)
- [Manage devices in Defender for Business](mdb-manage-devices.md)
