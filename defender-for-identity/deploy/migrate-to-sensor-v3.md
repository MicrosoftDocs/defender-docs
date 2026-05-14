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

| Eligibility condition | How to verify with MDE Client Analyzer | How to verify manually | Resolution if failing |
|---|---|---|---|
| Defender for Endpoint sensor is running | **Sense service Status** shows **Running** | Run `sc query sense` and confirm the service state is **RUNNING**. | Start the `MsSense` service on the server. Verify MDE onboarding is complete. |
| Defender for Endpoint onboarding policy exists | Check `RegOnboardingInfoPolicy.Json` in the results ZIP. If empty, the policy key is missing. The connectivity log also shows *"OnboardingInfo could not be found in the registry"* if missing. | Check that the registry key `HKLM\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection\OnboardingInfo` exists and contains a valid value. | Re-onboard the server to Microsoft Defender for Endpoint. Devices onboarded only via Azure Security Center (ASM) might be missing this policy key. |
| Device has a registered MDE device ID | **Device ID** field contains a valid GUID | Check the registry value `SenseMachineId` under `HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection`. A valid GUID must be present. | Verify MDE onboarding completed successfully. Re-onboard if `SenseMachineId` is empty. |
| MDI v2 sensor updater service is running | Not covered by MDE Client Analyzer | Run `sc query AATPSensorUpdater` and confirm the service state is **RUNNING**. | Start the `AATPSensorUpdater` service. If the service fails to start, reinstall the v2.x sensor. |
| Defender for Identity sensor version is 2.254 or later | Not covered by MDE Client Analyzer | Check the installed sensor version in **Programs and Features** or query the `AATPSensor` service file version. | Update the MDI v2 sensor to version 2.254.19112.470 or later. Ensure delayed updates aren't blocking the update. |
| Defender for Endpoint sensor version is 10.8735 or later | **Sense version** field shows the installed version. A warning appears if the version is below the recommended minimum. | Check the file version of `MsSense.exe` under `%ProgramFiles%\Windows Defender Advanced Threat Protection\`. | Update the Defender for Endpoint sensor to the latest version. |
| Windows Server 2019 or later with March 2026 cumulative update | **Device Operating System** and **OS Build** fields. Build must be 20348.4893 or later. | Run `winver` to confirm the OS version and build number. | Upgrade the operating system to Windows Server 2019 or later and install the [March 2026 or later](https://support.microsoft.com/en-us/topic/march-10-2026-kb5078766-os-build-20348-4893-fa3ee26a-0877-47d7-a4b2-9dd632ea8cea) cumulative update. |
| Domain controller without additional identity roles | Not covered by MDE Client Analyzer | Verify the server is a pure domain controller and doesn't run AD FS, AD CS, or Entra Connect alongside the DC role. | Migration is only supported on pure domain controllers. Use the v2.x sensor for servers with additional roles. |

#### Registry keys for manual verification

Use the following registry paths to manually verify MDE prerequisites:

- **Onboarding policy**: `HKLM\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection\OnboardingInfo` (must exist and contain a valid blob)
- **MDE device ID**: `HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection\SenseMachineId` (expected value: a valid GUID)

> [!NOTE]
> The registry path `HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection\OnboardedInfo` (without *Policies*) is the active onboarding info and is **not** used for migration eligibility. Make sure the **Policies** path exists.

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

The following table lists known runtime failure scenarios that can occur during or after migration:

| Scenario | Symptom | Resolution |
|---|---|---|
| Network timeout during migration | Status changes to **Migration failed** after ~2 hours | Verify outbound connectivity on port 443 to required service URLs. Check proxy and firewall rules. Retry migration. |
| TLS 1.2 not enabled | Status changes to **Migration failed** | Enable TLS 1.2 on the server. Disable older TLS versions if required by policy. Retry migration. |
| FQDN mismatch between MDI and MDE | Status changes to **Migration failed** | Resolve device identity conflicts in the Microsoft Defender portal. See [FQDN or device ID mismatch](#fqdn-or-device-id-mismatch). |
| Group Policy blocks new services | Status changes to **Migration failed** or timeout | Update Group Policy to allow the v3.x sensor service to be created and started on the domain controller. |

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
