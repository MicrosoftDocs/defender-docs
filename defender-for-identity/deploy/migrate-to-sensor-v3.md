---
title: Migrate from sensor v2.x to sensor v3.x (Preview)
description: Learn how to migrate from the Defender for Identity sensor v2.x to the sensor v3.x with no downtime using the Sensors page in the Microsoft Defender portal.
author: AbbyMSFT
ms.author: abbyweisberg
ms.date: 05/07/2026
ms.topic: how-to
ms.service: microsoft-defender-for-identity
ms.custom: msecd-doc-authoring-106
ai-usage: ai-assisted

#customer intent: As a security admin, I want to migrate my Defender for Identity sensors from v2.x to v3.x so that I can use the latest sensor without downtime or data loss.
---

# Migrate from Defender for Identity sensor v2 to sensor v3.x (Preview)

You can migrate your Defender for Identity sensors from v2.x to v3.x directly from the Microsoft Defender portal. The migration automatically completes the switchover and maintains your server configurations and security monitoring, with no downtime or data duplication.

## Prerequisites

To migrate, each server must meet the following requirements:

- Domain controller without additional identity roles
- Defender for Identity sensor v2.x (version 2.254.19112.470 or later)
- Windows Server 2019 or later
- Microsoft Defender for Endpoint deployed
- Includes the [March 2026 or later](https://support.microsoft.com/en-us/topic/march-10-2026-kb5078766-os-build-20348-4893-fa3ee26a-0877-47d7-a4b2-9dd632ea8cea) cumulative update.

For the full list of v3.x requirements, see [Defender for Identity sensor v3.x prerequisites](prerequisites-sensor-version-3.md).

### Backend eligibility checks

In addition to the requirements listed above, the portal automatically validates the following conditions before a server appears as **Ready for migration**:

- The MDI v2 sensor updater service (`AATPSensorUpdater`) is running on the server.
- The MDE Sense service (`MsSense`) is running on the server.
- The MDE onboarding policy registry key exists at `HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection\Status`.
- The device has a registered MDE device ID (`SenseMachineId`) associated with it.

If any of these checks fail, the server shows as **Not ready for migration** on the **Sensors** page.

> [!TIP]
> If a server doesn't appear as **Ready for migration**, see [Troubleshoot eligibility issues](#troubleshoot-eligibility-issues) for guidance on identifying and resolving the specific blocker.

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
| **Not ready for migration** | The server doesn't meet one or more prerequisites. Hover over the state or open the sensor details pane to see which requirements aren't met. |
| **Migrating** | The migration is in progress. The v2.x sensor continues to protect the server while the v3.x sensor is being activated. |
| **Migration failed** | The migration encountered an error. You can retry the migration. See [Troubleshoot migration failures](#troubleshoot-migration-failures). |
| **Up to date** | The migration completed successfully. The server is running sensor v3.x. |

> [!IMPORTANT]
> If a migration doesn't complete within 2 hours, the system automatically reverts the server to the v2.x sensor. The server returns to the **Ready for migration** state and you can retry the migration after addressing any underlying issues.

## Configure the v3.x sensor

For optimal protection and monitoring, complete the configuration steps described in [Defender for Identity sensor v3.x prerequisites](prerequisites-sensor-version-3.md), including:

- [Configure RPC auditing](prerequisites-sensor-version-3.md#configure-rpc-auditing).
- [Configure automatic Windows event auditing](prerequisites-sensor-version-3.md#configure-windows-event-auditing). Existing auditing configurations from the v2.x sensor are preserved and converted for v3.x, but we recommend [enabling automatic Windows event auditing (Preview)](configure-windows-event-collection.md#configure-defender-for-identity-to-collect-windows-events-automatically) for optimal configuration validation.
- [Switch from gMSA to local system](prerequisites-sensor-version-3.md#recommended-configurations-for-optimal-performance). The v3.x sensor uses the local system identity. If you had a gMSA configured for the v2.x sensor, remove the gMSA configuration.

> [!NOTE]
> After a successful migration, the v3.x sensor enters a 1-week observation period. During this period, you can roll back to the v2.x sensor if needed. After the observation period ends, the migration is automatically committed and becomes irreversible. Once committed, the server permanently runs the v3.x sensor and rollback is no longer possible.

## Troubleshoot migration failures

If a server shows a **Migration failed** status, use the following steps to troubleshoot:

1. Run the [MDE Client Analyzer](/defender-endpoint/overview-client-analyzer) on the server to validate that the Microsoft Defender for Endpoint sensor is running, healthy, and sending events.
1. If the Client Analyzer results show the MDE sensor is healthy and everything looks fine, raise a support case for further assistance.

> [!NOTE]
> You can retry the migration on a server even if the status shows **Migration failed**. Select the server on the **Sensors** page and select **Migrate** again.

### Troubleshoot eligibility issues

If a server shows **Not ready for migration**, use the MDE Client Analyzer and the following table to identify which eligibility condition is failing:

| Eligibility condition | MDE Client Analyzer field / validation | How to verify manually |
|---|---|---|
| MDE Sense service is running | **MsSense Service Status** shows **Running** | Run `sc query sense` and confirm the service state is **RUNNING**. |
| MDE onboarding policy exists | **OnboardedInfo** section shows a valid onboarding state | Check that the registry key `HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection\Status` exists and contains a valid `OnboardingState` value of `1`. |
| Device has a registered MDE device ID | **DeviceId** field contains a valid GUID | Check the registry value `SenseMachineId` under `HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection`. A valid GUID must be present. |
| MDI v2 sensor updater service is running | Not covered by MDE Client Analyzer | Run `sc query AATPSensorUpdater` and confirm the service state is **RUNNING**. |
| Defender for Identity sensor version is 2.254 or later | Not covered by MDE Client Analyzer | Check the installed sensor version in **Programs and Features** or query the `AATPSensor` service file version. |
| Windows Server cumulative update (March 2026 or later) is installed | **OS Build** shows build 20348.4893 or later | Run `winver` or `[System.Environment]::OSVersion` to confirm the OS build number. |

#### Registry keys for manual verification

Use the following registry paths to manually verify MDE prerequisites:

- **Onboarding state**: `HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection\Status\OnboardingState` (expected value: `1`)
- **MDE device ID**: `HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection\SenseMachineId` (expected value: a valid GUID)
- **Org ID**: `HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection\Status\OrgId` (expected value: your tenant's organization ID)

### Migration timeout

If the migration doesn't complete within 2 hours, the system automatically reverts the server to the v2.x sensor. The server returns to the **Ready for migration** state.

**Common causes:**

- Network connectivity issues between the server and the Microsoft Defender for Endpoint cloud service.
- The MDE Sense service became unresponsive during migration.
- High server load prevented the v3.x sensor from activating within the allowed time window.
- Group Policy or endpoint protection software blocked the v3.x sensor activation.

**Remediation:**

1. Verify network connectivity to the required Microsoft Defender for Endpoint service URLs. See [Configure your network environment](/defender-endpoint/configure-environment).
1. Confirm the MDE Sense service is running and healthy by running the [MDE Client Analyzer](/defender-endpoint/overview-client-analyzer).
1. Ensure no Group Policy or third-party security software is blocking new service installations on the domain controller.
1. Retry the migration during a period of lower server activity.

### Connectivity or prerequisite issues

Migration can fail if the server loses connectivity or a prerequisite becomes invalid during the migration process.

**Verify the following:**

- **Required ports**: Ensure outbound TCP port 443 is open to the required Microsoft Defender for Endpoint and Defender for Identity service endpoints.
- **TLS configuration**: Confirm that TLS 1.2 is enabled on the server. Older TLS versions aren't supported.
- **Proxy configuration**: If the server uses a proxy, verify that the proxy is configured correctly for both MDE and MDI traffic. Ensure the proxy doesn't terminate or inspect TLS connections to Microsoft service endpoints.
- **Service URLs**: Confirm that the server can reach the required [Defender for Identity service URLs](../configure-proxy.md) and [Defender for Endpoint service URLs](/defender-endpoint/configure-environment#enable-access-to-microsoft-defender-for-endpoint-service-urls-in-the-proxy-server).

### FQDN or device ID mismatch

Migration can fail if the fully qualified domain name (FQDN) reported by the MDI v2 sensor doesn't match the device identity registered in Microsoft Defender for Endpoint.

**Common causes:**

- The server was renamed after the MDE sensor was onboarded.
- The MDE sensor was offboarded and re-onboarded, resulting in a new device ID.
- Multiple device records exist for the same server in the Microsoft Defender portal.

**Remediation:**

1. In the Microsoft Defender portal, go to **Assets** > **Devices** and search for the server.
1. Verify that only one device record exists for the server and that the FQDN matches the server's current name.
1. If duplicate records exist, identify the stale record and remove it.
1. If the server was recently renamed, offboard and re-onboard the MDE sensor to register the new name.

### Auto-commit

> [!IMPORTANT]
> After a successful migration, the system automatically commits the v3.x sensor after a 1-week observation period. Once committed, the migration is irreversible and you can't roll back to the v2.x sensor. Ensure you validate sensor health and detection coverage during the observation period. If you need to roll back, do so before the auto-commit occurs.

If you experience issues after auto-commit:

1. Verify the v3.x sensor health on the **Sensors** page.
1. Check for health alerts on the sensor detail pane.
1. If the v3.x sensor isn't functioning correctly after commit, raise a support case for assistance.

### Common failure scenarios

The following table lists known failure scenarios, symptoms, and resolutions:

| Scenario | Symptom | Resolution |
|---|---|---|
| MDE Sense service not running | Server shows **Not ready for migration** | Start the `MsSense` service on the server. Verify MDE onboarding is complete. |
| MDI v2 sensor updater not running | Server shows **Not ready for migration** | Start the `AATPSensorUpdater` service. Verify the sensor isn't in a disabled state. |
| Missing MDE onboarding registry key | Server shows **Not ready for migration** | Re-onboard the server to Microsoft Defender for Endpoint. |
| No MDE device ID registered | Server shows **Not ready for migration** | Verify MDE onboarding completed successfully. Re-onboard if `SenseMachineId` is empty. |
| Sensor version too old | Server shows **Not ready for migration** | Update the MDI v2 sensor to version 2.254.19112.470 or later. Ensure delayed updates aren't blocking the update. |
| Windows cumulative update missing | Server shows **Not ready for migration** | Install the March 2026 or later cumulative update on the server. |
| Network timeout during migration | Status changes to **Migration failed** after ~2 hours | Verify outbound connectivity on port 443 to required service URLs. Check proxy and firewall rules. Retry migration. |
| TLS 1.2 not enabled | Status changes to **Migration failed** | Enable TLS 1.2 on the server. Disable older TLS versions if required by policy. Retry migration. |
| FQDN mismatch between MDI and MDE | Status changes to **Migration failed** | Resolve device identity conflicts in the Microsoft Defender portal. See [FQDN or device ID mismatch](#fqdn-or-device-id-mismatch). |
| Group Policy blocks new services | Status changes to **Migration failed** or timeout | Update Group Policy to allow the v3.x sensor service to be created and started on the domain controller. |
| Server has additional identity roles | Server shows **Not ready for migration** | Migration is only supported on pure domain controllers. Servers running AD FS, AD CS, or Entra Connect alongside the DC role aren't eligible. |

## Clean up the v2.x sensor

The migration disables the v2.x sensor service, but the v2.x sensor software remains installed on the server. Complete the following cleanup steps to fully clean your server from the v2.x sensor files:

- **Uninstall the v2.x sensor**: Remove the v2.x sensor software from the server. This step might require a server restart. For instructions, see [Delete and uninstall a sensor v2.x from a domain controller](../uninstall-sensor.md#delete-and-uninstall-a-sensor-v2x-from-a-domain-controller).
- **Remove Npcap**: Npcap was used by the v2.x sensor but isn't required by the v3.x sensor. If Npcap isn't used by other applications on the server, remove it. Leaving Npcap installed doesn't affect the v3.x sensor.

## Related content

- [Defender for Identity sensor v3.x prerequisites](prerequisites-sensor-version-3.md)
- [Activate the Defender for Identity sensor v3.x](activate-sensor.md)
- [Manage and update sensors](../sensor-settings.md)
- [Remove the Microsoft Defender for Identity sensor](../uninstall-sensor.md)
- [Microsoft Defender for Endpoint Client Analyzer](/defender-endpoint/overview-client-analyzer)
