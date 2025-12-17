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
|---------|---------|---------|
|Domain controller     | Windows Server 2019 or later with the [June 2025 Cumulative Update](https://support.microsoft.com/en-us/topic/june-10-2025-kb5060526-os-build-20348-3807-4e9453c4-6602-48ea-b349-689cd66dfdb9) or later.<br> * **See Note**.|[Defender for Identity sensor v3.x](prerequisites-sensor-version-3.md)<br> * **See Note**.        |
|Domain controller      |Windows Server 2016 or later         |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)         |
|[Active Directory Federation Services (AD FS)](active-directory-federation-services.md)     |    Windows Server 2016 or later      |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)      |
|[Active Directory Certificate Services (AD CS)](active-directory-federation-services.md)     |  Windows Server 2016 or later        |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)      |
|[Entra Connect](active-directory-federation-services.md)|  Windows Server 2016 or later     |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)     |


Once you've evaluated your infrastructure and requirements, follow the instructions for deploying the sensor based on the version you need.

## Next steps
- [Prepare your environment](prerequisites-sensor-version-2.md).
- Set up [Microsoft Defender for Identity role groups](../role-groups.md).
