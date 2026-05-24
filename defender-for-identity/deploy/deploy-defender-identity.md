---
title: Deploy Microsoft Defender for Identity sensors
description: Learn how to deploy Microsoft Defender for Identity sensors on domain controllers and identity servers. Choose the right sensor version for your environment.
ms.date: 05/04/2026
ms.topic: overview
ms.custom: msecd-doc-authoring-106
ms.reviewer: rlitinsky
ai-usage: ai-assisted
---

# Microsoft Defender for Identity deployment overview

Defender for Identity uses sensors to collect signals from your on-premises identity infrastructure to detect threats.

Defender for Identity detects threats like privilege escalation or high-risk lateral movement, and reports on easily exploited identity issues like unconstrained Kerberos delegation for correction by the security team.

Install Defender for Identity sensors on all domain controllers, including read-only domain controllers (RODCs). If you have AD FS, AD CS, or Microsoft Entra Connect servers in your environment that aren't domain controllers, install the v2.x sensor on each of those servers as well.

## Select your deployment method

The sensor version you deploy depends on the server role and operating system. Use the following table to select the appropriate deployment for each server in your environment.

:::image type="content" source="media/deploy-defender-identity/sensor-deployment-decision.png" alt-text="Decision tree diagram showing sensor version selection based on server role and operating system version.":::

| Server configuration | Server Operating System | Recommended deployment |
| --------- | --------- | --------- |
|Domain controller | Windows Server 2019 or later with at least the [March 2026 Cumulative Update](https://support.microsoft.com/topic/march-10-2026-kb5078766-os-build-20348-4893-fa3ee26a-0877-47d7-a4b2-9dd632ea8cea)|[Defender for Identity sensor v3.x](deploy-sensor-v3.md)|
|Domain controller with AD FS, AD CS, or Microsoft Entra Connect identity roles   | Windows Server 2019 or later with at least the [March 2026 Cumulative Update](https://support.microsoft.com/topic/march-10-2026-kb5078766-os-build-20348-4893-fa3ee26a-0877-47d7-a4b2-9dd632ea8cea)|[Defender for Identity sensor v3.x](deploy-sensor-v3.md)|
|Domain controller | Windows Server 2016 or earlier| [Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md) |
|[AD FS server that isn't a domain controller](active-directory-federation-services.md)|Windows Server 2016 or later|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)|
|[AD CS server that isn't a domain controller](active-directory-federation-services.md)|Windows Server 2016 or later|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)|
|[Microsoft Entra Connect server that isn't a domain controller](active-directory-federation-services.md)|Windows Server 2016 or later|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)|

Defender for Identity supports mixed environments with both v3.x and v2.x sensors. For example, you might deploy v3.x on domain controllers running Windows Server 2019 or later, and v2.x on older domain controllers or on AD FS, AD CS, and Microsoft Entra Connect servers that aren't domain controllers. Both sensor versions work together and report to the same Defender for Identity workspace.

Before you activate the Defender for Identity sensor v3.x, note that v3.x:

- Requires Defender for Endpoint deployed on the server. The endpoint deployment alone isn't a prerequisite; Defender for Endpoint must be onboarded on the server where the sensor runs.
- Doesn't support VPN integration.
- Doesn't support [syslog notifications](../notifications.md#configure-syslog-notifications).
- Has limitations working with Azure ExpressRoute. For more information, see [Azure ExpressRoute for Microsoft 365](/microsoft-365/enterprise/azure-expressroute).

## Deployment steps for sensor v3.x

Follow these steps to deploy the sensor v3.x on domain controllers running Windows Server 2019 or later, including domain controllers that also run AD FS, AD CS, or Microsoft Entra Connect roles:

1. [Verify prerequisites](deploy-sensor-v3.md#before-you-activate)
1. [Activate the sensor](activate-sensor.md)
1. [Configure Windows event auditing](configure-windows-event-collection.md#configure-defender-for-identity-to-collect-windows-events-automatically)
1. [Configure RPC auditing](deploy-sensor-v3.md#configure-rpc-auditing)
1. [Validate deployment](test-sensor.md)

## Deployment steps for sensor v2.x

Follow these steps to deploy the sensor v2.x on domain controllers running Windows Server 2016 or later, or on AD FS, AD CS, and Microsoft Entra Connect servers that aren't domain controllers:

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
