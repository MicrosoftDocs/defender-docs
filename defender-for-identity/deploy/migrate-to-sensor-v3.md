---
title: Migrate from sensor v2.x to sensor v3.x (Preview)
description: Learn how to migrate from the Defender for Identity sensor v2.x to the sensor v3.x with no downtime using the Sensors page in the Microsoft Defender portal.
author: AbbyMSFT
ms.author: abbyweisberg
ms.date: 05/19/2026
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
- Microsoft Defender for Endpoint deployed, with the [March 2026 or later](https://support.microsoft.com/en-us/topic/march-10-2026-kb5078766-os-build-20348-4893-fa3ee26a-0877-47d7-a4b2-9dd632ea8cea) cumulative update installed.

For the full list of v3.x requirements, see [Defender for Identity sensor v3.x prerequisites](deploy-sensor-v3.md).

## Known limitations

- **Windows Server 2025 domain controllers:** Windows Server 2025 domain controllers don't yet have full detection coverage after migration. Until this limitation is resolved, keep Windows Server 2025 domain controllers on sensor v2.x.

## Start the migration

Servers that meet all prerequisites appear as **Ready for migration** on the **Sensors** page.

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Identities** > **On-premises** > **Sensors**.
1. Select one or more servers marked as **Ready for migration** and select **Migrate**.
1. In the confirmation prompt, review the details and confirm to start the migration.

> [!NOTE]
> The migration typically takes up to 20 minutes. During this time, the v2.x sensor continues to run until the v3.x sensor is ready, so your server stays protected without interruption.

### Migration states

The **Migration state** column on the **Sensors** page shows the current status of each server:

| State | Description |
|---|---|
| **Ready for migration** | The server meets all prerequisites and can be migrated. Select the server and choose **Migrate** to begin. |
| **Not ready for migration** | The server doesn't meet one or more prerequisites. |
| **Migrating** | The migration is in progress. The v2.x sensor continues running while the v3.x sensor is being activated. |
| **Migration failed** | The migration encountered an error. |
| **Up to date** | The server is running sensor v3.x. |

## Configure the v3.x sensor

For optimal protection and monitoring, complete the configuration steps described in [Defender for Identity sensor v3.x prerequisites](deploy-sensor-v3.md), including:

- [Configure RPC auditing](deploy-sensor-v3.md#configure-rpc-auditing).
- [Configure automatic Windows event auditing](deploy-sensor-v3.md#configure-windows-event-auditing). Existing auditing configurations from the v2.x sensor are preserved and converted for v3.x, but we recommend [enabling automatic Windows event auditing](configure-windows-event-collection.md#configure-defender-for-identity-to-collect-windows-events-automatically) for optimal configuration validation.
- [Switch from gMSA to local system](deploy-sensor-v3.md#service-account-requirements). The v3.x sensor uses the local system identity. If you had a gMSA configured for [action accounts](manage-action-accounts.md), you must remove it. If gMSA remains enabled, response actions, including attack disruption, won't work.

## Troubleshoot "Not ready for migration" status

If a server shows **Not ready for migration**, use the Microsoft Defender for Endpoint Client Analyzer and the following table to identify which condition is failing:

| Condition | How to verify | Resolution if failing |
|---|---|---|
| Defender for Endpoint sensor is running | Client Analyzer report shows **Sense service Status** is **Running**. | Verify Microsoft Defender for Endpoint onboarding is complete. |
| Defender for Endpoint onboarding info exists | Client Analyzer: Check `RegOnboardingInfoPolicy.Json` in the results ZIP. If empty, the policy key is missing. The connectivity log also shows *"OnboardingInfo could not be found in the registry"* if missing. | Re-onboard the server to Microsoft Defender for Endpoint. |
| Device has a registered Defender for Endpoint device ID | Client Analyzer report shows **Device ID** field contains a valid GUID. | Verify Microsoft Defender for Endpoint onboarding completed successfully. Re-onboard the server if `SenseMachineId` is empty. |
| Defender for Identity v2.x sensor is running | Go to the **Sensors** page in the portal and validate the **Service status** column shows **Running**, or run `sc query AATPSensorUpdater` and confirm the service state is **Running**. | Start the `AATPSensorUpdater` service. If the service fails to start, reinstall the v2.x sensor. |
| Defender for Identity v2.x sensor version is 2.254 or later | Check the installed sensor version in **Programs and Features** or on the **Sensors** page in the portal. | Update the Defender for Identity v2 sensor to version 2.254.19112.470 or later. Ensure delayed updates aren't blocking the update. |
| Defender for Endpoint sensor version is 10.8735 or later | Client Analyzer report: the **Sense version** field displays the installed version. | Update the Defender for Endpoint sensor to the latest version. |
| Windows Server 2019 or later with March 2026 cumulative update | Run `winver` to confirm the OS version and build number. | Upgrade the operating system to Windows Server 2019 or later and install the [March 2026 or later](https://support.microsoft.com/en-us/topic/march-10-2026-kb5078766-os-build-20348-4893-fa3ee26a-0877-47d7-a4b2-9dd632ea8cea) cumulative update. |
| Domain controller without additional identity roles | Verify the server is a pure domain controller and doesn't run AD FS, AD CS, or Entra Connect alongside the DC role. | Migration is only supported on pure domain controllers. Use the v2.x sensor for servers with additional roles. |

## Troubleshoot migration failures

If a server shows a **Migration failed** status, run the [Microsoft Defender for Endpoint Client Analyzer](/defender-endpoint/overview-client-analyzer) on the server to validate that the Defender for Endpoint sensor is running, healthy, and sending events. If the Client Analyzer results show the sensor is healthy, raise a support case for further assistance.

## Clean up the v2.x sensor

The migration disables the v2.x sensor service, but the v2.x sensor software remains installed on the server. Complete the following cleanup steps to fully clean your server from the v2.x sensor files:

- **Uninstall the v2.x sensor**: Remove the v2.x sensor software from the server. This step might require a server restart. For instructions, see [Delete and uninstall a sensor v2.x from a domain controller](../uninstall-sensor.md#delete-and-uninstall-a-sensor-v2x-from-a-domain-controller).
- **Remove Npcap**: Npcap was used by the v2.x sensor but isn't required by the v3.x sensor. If Npcap isn't used by other applications on the server, remove it. Leaving Npcap installed doesn't affect the v3.x sensor.

## Related content

- [Defender for Identity sensor v3.x prerequisites](deploy-sensor-v3.md)
- [Activate the Defender for Identity sensor v3.x](activate-sensor.md)
- [Manage and update sensors](../sensor-settings.md)
- [Remove the Microsoft Defender for Identity sensor](../uninstall-sensor.md)
- [Microsoft Defender for Endpoint Client Analyzer](/defender-endpoint/overview-client-analyzer)
