---
title: Migrate from sensor v2.x to sensor v3.x (Preview)
description: Learn how to migrate from the Defender for Identity sensor v2.x to the sensor v3.x with no downtime using the Sensors page in the Microsoft Defender portal.
author: AbbyMSFT
ms.author: abbyweisberg
ms.date: 03/18/2026
ms.topic: how-to
ms.service: microsoft-defender-for-identity
ms.custom: msecd-doc-authoring-106
ai-usage: ai-assisted

#customer intent: As a security admin, I want to migrate my Defender for Identity sensors from v2.x to v3.x so that I can use the latest sensor without downtime or data loss.
---

# Migrate from Defender for Identity sensor v2 to sensor v3.x (Preview)

You can migrate your Defender for Identity sensors from v2.x to v3.x directly from the Microsoft Defender portal. The migration automatically completes the switchover and maintains your server configurations and security monitoring, with no downtime or data duplication.

Before migrating, review the [sensor version limitations](deploy-sensor-v3.md#sensor-version-limitations), including that v3.x doesn't support VPN integration or syslog notifications.

## Prerequisites

To migrate, each server must meet the following requirements:

- Domain controller without additional identity roles
- Defender for Identity sensor v2.x (version 2.254.19112.470 or later)
- Windows Server 2019 or later
- Microsoft Defender for Endpoint deployed
- Includes the [March 2026 or later](https://support.microsoft.com/en-us/topic/march-10-2026-kb5078766-os-build-20348-4893-fa3ee26a-0877-47d7-a4b2-9dd632ea8cea) cumulative update.

For the full list of v3.x requirements, see [Defender for Identity sensor v3.x prerequisites](deploy-sensor-v3.md).

## Start the migration

Servers that meet all prerequisites appear as **Ready for migration** on the **Sensors** page.

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Identities** > **On-premises** > **Sensors**.
1. Select one or more servers marked as **Ready for migration** and select **Migrate**.
1. In the confirmation prompt, review the details and confirm to start the migration.

> [!NOTE]
> The migration typically takes up to 20 minutes. During this time, the v2.x sensor continues to run until the v3.x sensor is ready, so your server stays protected without interruption.

## Post-migration steps

### Configure the v3.x sensor

For optimal protection and monitoring, complete the configuration steps described in [Defender for Identity sensor v3.x prerequisites](deploy-sensor-v3.md), including:

- [Configure RPC auditing](deploy-sensor-v3.md#configure-rpc-auditing).
- [Configure automatic Windows event auditing](deploy-sensor-v3.md#configure-windows-event-auditing). Existing auditing configurations from the v2.x sensor are preserved and converted for v3.x, but we recommend [enabling automatic Windows event auditing (Preview)](configure-windows-event-collection.md#configure-defender-for-identity-to-collect-windows-events-automatically) for optimal configuration validation.
- [Switch from gMSA to local system](deploy-sensor-v3.md#service-account-requirements). The v3.x sensor uses the local system identity. If you had a gMSA configured for [action accounts](manage-action-accounts.md), you must remove it. If gMSA remains enabled, response actions, including attack disruption, won't work.

### Clean up the v2.x sensor

The migration disables the v2.x sensor service, but the v2.x sensor software remains installed on the server. Complete the following cleanup steps to fully clean your server from the v2.x sensor files:

- **Uninstall the v2.x sensor**: Remove the v2.x sensor software from the server. This step might require a server restart. For instructions, see [Delete and uninstall a sensor v2.x from a domain controller](../uninstall-sensor.md#delete-and-uninstall-a-sensor-v2x-from-a-domain-controller).
- **Remove Npcap**: Npcap was used by the v2.x sensor but isn't required by the v3.x sensor. If Npcap isn't used by other applications on the server, remove it. Leaving Npcap installed doesn't affect the v3.x sensor.

## Related content

- [Defender for Identity sensor v3.x prerequisites](deploy-sensor-v3.md)
- [Activate the Defender for Identity sensor v3.x](activate-sensor.md)
- [Manage and update sensors](../sensor-settings.md)
- [Remove the Microsoft Defender for Identity sensor](../uninstall-sensor.md)
