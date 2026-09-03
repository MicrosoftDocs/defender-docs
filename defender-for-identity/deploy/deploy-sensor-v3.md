---
title: Deploy the Defender for Identity sensor v3.x
description: Learn the requirements and configuration steps to deploy the Defender for Identity sensor v3.x on domain controllers running Windows Server 2019 or later.
ms.date: 07/15/2026
ms.topic: how-to
ms.custom: msecd-doc-authoring-1014
ms.reviewer: rlitinsky
ai-usage: ai-assisted
---

# Deploy the Defender for Identity sensor v3.x

Deploy the Defender for Identity sensor v3.x on supported domain controllers. Complete the prerequisite checks before activation, then configure auditing and identity settings afterward.

## Before you activate

Complete these checks before activating the sensor.

### Sensor version limitations

Before you activate the Defender for Identity sensor v3.x, note that v3.x:

- Doesn't support VPN integration.
- Doesn't support [syslog notifications](../notifications.md#configure-syslog-notifications).
- Has limitations working with Azure ExpressRoute. For more information, see [Azure ExpressRoute for Microsoft 365](/microsoft-365/enterprise/azure-expressroute).

### Server requirements

Make sure that the server on which you're activating the sensor:

- Has Defender for Endpoint deployed on the server. The Microsoft Defender Antivirus component can be in either active or passive mode. Defender for Endpoint must be onboarded on the server where the sensor runs; endpoint-only deployment isn't sufficient.
- Doesn't have a Defender for Identity sensor v2.x already deployed.
- Is running Windows Server 2019 or later.
- Includes the Windows Server July 2026 or later cumulative update.

#### Supported server types

The v3.x sensor supports domain controllers, including domain controllers with these identity roles:

- Active Directory Federation Services (AD FS)
- Active Directory Certificate Services (AD CS)
- Microsoft Entra Connect

Use the [Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md) for servers that aren't domain controllers and run AD FS, AD CS, or Microsoft Entra Connect.

### Licensing requirements

Deploying Defender for Identity requires one of the following Microsoft 365 licenses:

- Enterprise Mobility + Security E5 (EMS E5/A5)
- Microsoft 365 E5 (Microsoft E5/A5/G5)
- Microsoft 365 E5/A5/G5/F5* Security
- Microsoft 365 F5 Security + Compliance*

Both F5 licenses require Microsoft 365 F1/F3 or Office 365 F3 and Enterprise Mobility + Security E3. Purchase licenses in the Microsoft 365 portal or through Cloud Solution Partner (CSP) licensing. For more information, see [Licensing and privacy FAQs](/defender-for-identity/technical-faq#licensing-and-privacy).

### Roles and permissions

- To create your Defender for Identity workspace, you need a Microsoft Entra ID tenant.
- You must either be a [Security Administrator](/entra/identity/role-based-access-control/permissions-reference), or have the following [Unified RBAC](../role-groups.md#unified-role-based-access-control-rbac) permissions:

  - `System settings (Read and manage)`
  - `Security settings (All permissions)`

### Network requirements

The Defender for Identity sensor uses the same URIs as Microsoft Defender for Endpoint. Review the following documents for Defender for Endpoint, based on your system's connectivity, to find the complete list of required service endpoints.

- [Microsoft Defender for Endpoint streamlined connectivity URLs](/defender-endpoint/streamlined-device-connectivity-urls-commercial?tabs=Windows)

- [Microsoft Defender for Endpoint standard connectivity URLs](/defender-endpoint/standard-device-connectivity-urls-commercial)

### Memory requirements

The following table describes memory requirements on the server running the Defender for Identity sensor, depending on the type of virtualization you're using:

| VM running on | Description |
|------------|-------------|
|Hyper-V|Ensure that **Enable Dynamic Memory** isn't enabled for the VM.|
|VMware|Ensure that the amount of memory configured and the reserved memory are the same, or select the **Reserve all guest memory (All locked)** option in the VM settings.|
|Other virtualization host|Refer to the vendor-supplied documentation on how to ensure that memory is always fully allocated to the VMs.|

> [!IMPORTANT]
> When running as a virtual machine, always allocate all memory to the virtual machine.

Version 3 of the sensor prevents the sensor from overusing CPU or memory by limiting CPU utilization at 30%, and memory usage to 1.5 GB. However, if any other service uses substantial system resources, the domain controller might still experience performance strain.

Refer to the [Defender for Identity Capacity Planning documentation](/defender-for-identity/deploy/capacity-planning) to determine whether your domain controller servers have enough resources for a Microsoft Defender for Identity sensor. 

### Service account requirements

The Defender for Identity sensor interacts with Active Directory in two ways:

- **Reading AD data** (querying objects, tracking changes, resolving entities). In v2.x, this uses a Directory Service Account (DSA). In v3.x, LocalSystem handles this automatically.
- **Performing remediation actions** (disabling accounts, resetting passwords). In v2.x, this uses an action account. In v3.x, LocalSystem handles this automatically.

The v3.x sensor uses the local system identity of the server for both purposes. It doesn't use Directory Service Accounts (DSA) or group Managed Service Accounts (gMSA). LocalSystem is the only supported identity for v3.x.

If you're migrating from sensor v2.x and previously had a gMSA configured for [action accounts](manage-action-accounts.md), select **Automatically use the sensor's local system account** in the Microsoft Defender portal (**Settings** > **Identities** > **Microsoft Defender for Identity** > **Manage action accounts**). The v3.x sensors don't use gMSA accounts configured for v2.x sensors.

> [!IMPORTANT]
> If any of your sensors are v3.x, select **Automatically use the sensor's local system account** for all sensors. The v3.x sensors use the local system account regardless of gMSA configuration.

#### DSA and gMSA health alerts in environments with both v2 and v3 sensors

If your workspace still has a Directory Service Account (DSA) or group Managed Service Account (gMSA) configured because v2 sensors on AD FS, AD CS, or Entra Connect servers still require it, DSA and gMSA credentials continue to be validated on all sensors in the workspace, including v3 sensors. If validation fails, the **Directory services user credentials are incorrect** health alert appears. Workspace-level validation of DSA and gMSA credentials on all sensors is by design. Defender for Identity validates DSA and gMSA credentials at the workspace level for all sensors as long as those accounts exist, regardless of whether individual sensors use them for auditing or response actions.

V3 sensors ignore the DSA and gMSA for auditing and response actions, but they're still included in workspace-level credential validation. To stop receiving this health alert on v3 sensors, remove the workspace-level DSA or gMSA after all sensors are fully migrated to v3 and no v2 sensors require it.

### Test your prerequisites

Run the [*Test-MdiReadiness.ps1*](https://github.com/microsoft/Microsoft-Defender-for-Identity/tree/main/Test-MdiReadiness) script to test whether your environment has the necessary prerequisites.

The *Test-MdiReadiness.ps1* script is also available from Microsoft Defender XDR, on the **Identities > Tools** page (Preview).

## Activate the sensor

After confirming all prerequisites, [activate the sensor from the Microsoft Defender portal](activate-sensor.md).

## After you activate

Complete these configuration steps after the sensor is activated and running.

### Configure Windows event auditing

Defender for Identity relies on Windows event logs for many detections. For v3.x sensors on domain controllers, [enable automatic auditing](configure-windows-event-collection.md#configure-defender-for-identity-to-collect-windows-events-automatically), which handles all auditing settings without manual configuration.

If automatic auditing isn't available or you opted out, [configure auditing manually](configure-windows-event-collection.md#configure-windows-event-collection-manually) or [use PowerShell](configure-windows-event-collection.md#configure-windows-event-collection-using-powershell).

### Configure RPC auditing

Starting with the July 2026 Defender for Identity sensor release (sensor version 3.0.8), RPC auditing is automatically enabled on domain controllers when you upgrade the sensor to the latest version. You no longer need to apply a tag manually to enable RPC auditing, and the related health alert clears shortly after the upgrade.

> [!NOTE]
> If you're on sensor version 3.0.8 and you already applied the **Unified Sensor RPC Audit** or **Sensor Extended RPC Audit** tag, no additional action is needed. You can leave the tag in place.

### Recommended settings

Use the following recommended settings to help ensure stable sensor performance:

- Set the **Power Option** of the machine running the Defender for Identity sensor to **High Performance**.
- Synchronize the time on servers and domain controllers where you install the sensor to within five minutes of each other.

## Next step

[Activate the Microsoft Defender for Identity sensor](activate-sensor.md)
