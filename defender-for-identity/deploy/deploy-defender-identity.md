---
title: Deploy Microsoft Defender for Identity sensors
description: Learn how to deploy Microsoft Defender for Identity sensors on domain controllers and identity servers. Choose the right sensor version for your environment.
ms.date: 08/31/2026
ms.topic: overview
ms.custom: msecd-doc-authoring-1015
ms.reviewer: rlitinsky
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to choose and deploy the appropriate Defender for Identity sensor version so that I can monitor my on-premises identity infrastructure.
---

# Microsoft Defender for Identity deployment overview

Defender for Identity uses sensors to collect signals from your on-premises identity infrastructure to detect threats.

Defender for Identity detects threats such as privilege escalation and high-risk lateral movement. It also reports identity security issues, such as unconstrained Kerberos delegation, so your security team can address them.

Install Defender for Identity sensors on all supported domain controllers and identity servers.

## Select your deployment method

The sensor version you deploy depends on the server role, operating system, and when your Defender for Identity workspace was created. Use the following table to select the appropriate deployment for each server in your environment.

> [!IMPORTANT]
> In new Defender for Identity workspaces, you can install sensor v2.x only on servers running Windows Server 2016 or earlier. This restriction applies to all server roles. Existing workspaces aren't affected.

:::image type="content" source="media/deploy-defender-identity/sensor-deployment-decision.png" alt-text="Decision tree showing sensor v3.x for supported servers running Windows Server 2019 or later, with or without Defender for Endpoint, and sensor v2.x for Windows Server 2016 or earlier.":::

|Server configuration|Server operating system|Recommended deployment|
| --------- | --------- | --------- |
|Domain controller|Windows Server 2019 or later with the July 2026 or later cumulative update|[Defender for Identity sensor v3.x](deploy-sensor-v3.md)|
|Domain controller with AD FS, AD CS, or Microsoft Entra Connect identity roles|Windows Server 2019 or later with the July 2026 or later cumulative update|[Defender for Identity sensor v3.x](deploy-sensor-v3.md)|
|AD FS, AD CS, or Microsoft Entra Connect server that isn't a domain controller|Windows Server 2019 or later with the July 2026 or later cumulative update|[Defender for Identity sensor v3.x](deploy-sensor-v3.md)|
|Domain controller|Windows Server 2016 or earlier|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)|
|[AD FS server that isn't a domain controller](active-directory-federation-services.md)|Windows Server 2016 or earlier|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)|
|[AD CS server that isn't a domain controller](active-directory-federation-services.md)|Windows Server 2016 or earlier|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)|
|[Microsoft Entra Connect server that isn't a domain controller](active-directory-federation-services.md)|Windows Server 2016 or earlier|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)|

Defender for Identity supports environments with both v3.x and v2.x sensors. For example, you might deploy v3.x on servers running Windows Server 2019 or later, and v2.x on servers running Windows Server 2016 or earlier. Both sensor versions work together and report to the same Defender for Identity workspace.

If your organization requires [VPN integration](../vpn-integration.md) or [syslog notifications](../notifications.md#configure-syslog-notifications), use the v2.x sensor on the applicable domain controllers. These features aren't supported by the v3.x sensor.

> [!IMPORTANT]
> If any of your sensors are v3.x, select **Automatically use the sensor's local system account** for all sensors. The v3.x sensors don't use gMSA accounts configured for v2.x sensors; they always use the local system account. For more information, see [Sensor v3.x service account requirements](deploy-sensor-v3.md#service-account-requirements).

Before you activate the Defender for Identity sensor v3.x, note that v3.x:

- Requires Defender for Endpoint deployed on the server. The endpoint deployment alone isn't a prerequisite; Defender for Endpoint must be onboarded on the server where the sensor runs.
- Doesn't support VPN integration.
- Doesn't support [syslog notifications](../notifications.md#configure-syslog-notifications).
- Has limitations working with Azure ExpressRoute. For more information, see [Azure ExpressRoute for Microsoft 365](/microsoft-365/enterprise/azure-expressroute).

## Deployment steps for sensor v3.x

Follow these steps to deploy the Defender for Identity sensor v3.x on servers running Windows Server 2019 or later, including domain controllers and AD FS, AD CS, or Microsoft Entra Connect servers that aren't domain controllers:

1. [Verify prerequisites](deploy-sensor-v3.md#before-you-activate)
1. [Activate the sensor](activate-sensor.md)
1. [Configure Windows event auditing](configure-windows-event-collection.md#configure-defender-for-identity-to-collect-windows-events-automatically)
1. [Configure RPC auditing](deploy-sensor-v3.md#configure-rpc-auditing)
1. [Validate deployment](test-sensor.md)

## Deployment steps for sensor v2.x

Follow these steps to deploy the sensor v2.x on servers running Windows Server 2016 or earlier:

1. [Verify prerequisites](prerequisites-sensor-version-2.md)
1. [Plan capacity](capacity-planning.md)
1. [Configure connectivity](configure-proxy.md)
1. [Install the sensor](install-sensor.md)
1. [Configure the sensor](configure-sensor-settings.md)
1. [Configure Windows event auditing](configure-windows-event-collection.md#configure-windows-event-collection-manually)
1. [Configure Directory Service accounts](directory-service-accounts.md)
1. [Configure for AD FS, AD CS, or Entra Connect (if applicable)](active-directory-federation-services.md)
1. [Validate deployment](test-sensor.md)

## Next steps

- [Prepare your environment for sensor v3](deploy-sensor-v3.md)
- [Prepare your environment for sensor v2](prerequisites-sensor-version-2.md)
