---
title: Microsoft Defender for Identity Deployment Overview
description: Learn how to deploy Microsoft Defender for Identity from the Microsoft Defender portal.
ms.date: 01/28/2026
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity deployment overview

Defender for Identity uses sensors to collect signals from your on-premises identity infrastructure to detect threats. This article explains the Defender for Identity deployment process.

Defender for Identity detects threats like privilege escalation or high-risk lateral movement, and reports on easily exploited identity issues like unconstrained Kerberos delegation for correction by the security team.

We recommend installing Defender for Identity sensors on all domain controllers, including read-only domain controllers (RODCs). If you have an AD FS, AD CS, or Microsoft Entra Connect farm or cluster in your environment, install the sensor on each server.

## Select your deployment method

After you complete the steps to prepare your environment and assign roles and permissions for Defender for Identity, create a plan for onboarding.
Identify your architecture and requirements, and then use the following table to select the appropriate deployment for the servers in your environment.

:::image type="content" source="media/deploy-defender-identity/sensor-deployment-decision.png" alt-text="Diagram that shows the decision tree for choosing which sensor to deploy.":::

|Server configuration   |Server Operating System  |Recommended deployment |
|---------|---------|---------|
|Domain controller     | Windows Server 2019 or later with the [June 2025 or later Cumulative Update](https://support.microsoft.com/topic/june-10-2025-kb5060526-os-build-20348-3807-4e9453c4-6602-48ea-b349-689cd66dfdb9)|[Defender for Identity sensor v3.x](prerequisites-sensor-version-3.md)|
|Domain controller with AD FS, AD CS, or Entra Connect     | Windows Server 2019 or later with the [June 2025 or later Cumulative Update](https://support.microsoft.com/topic/june-10-2025-kb5060526-os-build-20348-3807-4e9453c4-6602-48ea-b349-689cd66dfdb9)|[Defender for Identity sensor v3.x](prerequisites-sensor-version-3.md)|
|Domain controller      |Windows Server 2016 or later|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)         |
|[Active Directory Federation Services (AD FS)](active-directory-federation-services.md)|Windows Server 2016 or later|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)|
|[Active Directory Certificate Services (AD CS)](active-directory-federation-services.md)|Windows Server 2016 or later|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)|
|[Microsoft Entra Connect](active-directory-federation-services.md)|Windows Server 2016 or later|[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)|

Before you activate the Defender for Identity sensor v3.x, note that v3.x:

- Requires Defender for Endpoint.
- Doesn't support VPN integration.
- Doesn't support [syslog notifications](../notifications.md#configure-syslog-notifications).
- Has limitations working with Azure ExpressRoute. For more information, see [Azure ExpressRoute for Microsoft 365](/microsoft-365/enterprise/azure-expressroute).

## Next steps

- [Prepare your environment for sensor v2](prerequisites-sensor-version-2.md)
- [Prepare your environment for sensor v3](prerequisites-sensor-version-3.md)
