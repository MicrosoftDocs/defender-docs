---
title: Microsoft Defender for Identity Deployment Overview
description: Learn how to deploy Microsoft Defender for Identity from the Microsoft Defender portal.
ms.date: 06/30/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity deployment overview

Defender for Identity uses sensors to collect signals from your on-premises identity infrastructure to detect threats. This article explains the Microsoft Defender for Identity deployment process.

Defender for Identity detects threats like privilege escalation or high-risk lateral movement and reports on easily exploited identity issues like unconstrained Kerberos delegation for correction by the security team.

We recommend installing Defender for Identity sensors on all domain controllers, including read-only domain controllers (RODCs). If you have an AD FS, AD CS, or a Microsoft Entra Connect farm or cluster in your environment, install the sensor on each server.

## Select your deployment method

Once you've completed the steps to prepare your environment, and assigned roles and permissions for Defender for Identity, create a plan for onboarding. 

Identify your architecture and your requirements, and then use the table below to select the appropriate deployment for the servers in your environment. 

|Server configuration   |Server Operating System  |Recommended deployment |
|---------|---------|---------|---------|
|Domain controller     | Windows Server 2019 or later with the [March 2024 Cumulative Update](https://support.microsoft.com/topic/march-12-2024-kb5035857-os-build-20348-2340-a7953024-bae2-4b1a-8fc1-74a17c68203c) or later.<br> * **See Note**.|[Defender for Identity sensor v3.x (Preview)](prerequisites-sensor-version-3.md)<br> * **See Note**.        |
|Domain controller      |Windows Server 2016 or later         |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)         |
|[Active Directory Federation Services (AD FS)](active-directory-federation-services.md)     |    Windows Server 2016 or later      |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)      |
|[Active Directory Certificate Services (AD CS)](active-directory-federation-services.md)     |  Windows Server 2016 or later        |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)      |
|[Entra Connect](active-directory-federation-services.md)|  Windows Server 2016 or later     |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)     |

> [!NOTE]
> The Defender for Identity sensor version 3.x is still in preview and has some limited functionality compared to version 2.x. Keep these limitations in mind before activating the sensor.
> The Defender for Identity sensor v3.x:
> - Requires that Defender for Endpoint is deployed
> - Doesn't currently support VPN integration
> - Doesn't currently support ExpressRoute
> - Doesn't currently offer full functionality of health alerts, posture recommendations, security alerts or advanced hunting data.

Once you've evaluated your infrastructure and requirements, follow the instructions for deploying the sensor based on the version you need.

## Next steps
- [Prepare your environment](prerequisites-sensor-version-2.md).
- Set up [Microsoft Defender for Identity role groups](../role-groups.md).
