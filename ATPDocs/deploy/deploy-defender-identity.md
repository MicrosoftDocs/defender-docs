---
title: Microsoft Defender for Identity Deployment Overview
description: Learn how to deploy Microsoft Defender for Identity from the Microsoft Defender portal.
ms.date: 06/18/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity deployment overview

Defender for Identity uses sensors to collect signals from your on-premises identity infrastructure. This article explains the Microsoft Defender for Identity deployment process.

Defender for Identity uses signals to detect threats like privilege escalation or high-risk lateral movement and reports on easily exploited identity issues like unconstrained Kerberos delegation for correction by the security team.

We recommend installing Defender for Identity sensors on all domain controllers, including read-only domain controllers (RODCs). If you have an AD FS, AD CS, or a Microsoft Entra Connect farm or cluster in your environment, install the sensor on each server.

## Select your deployment method

Once you've completed the steps to prepare your environment and assigned roles and permissions for Defender for Identity, create a plan for onboarding. 

Identify your architecture and your requirements, and then use the table below to select the appropriate deployment for the servers in your environment. 

|Server configuration   |Server Operating System  |Requirements and considerations  |Recommended deployment |
|---------|---------|---------|---------|
|Domain controller     | Windows Server 2019 or later with the [March 2024 Cumulative Update](https://support.microsoft.com/topic/march-12-2024-kb5035857-os-build-20348-2340-a7953024-bae2-4b1a-8fc1-74a17c68203c) or later.        |         | [Defender for Identity sensor v3.x (Preview)](prerequisites-sensor-version-3.md)        |
|      |         |If you need:<br> - VPN integration<br> - ExpressRoute <br> - Optimal NNR, but your domain controller is not onboarded to MDE     |  [Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)    |
|      |Windows Server 2016 or earlier         |         |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)         |
|Active Directory Federation Services (AD FS)     |    NA     |         |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)      |
|Active Directory Certificate Services (AD CS)     |  NA       |         |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)      |
|Entra Connect|  NA    |        |[Defender for Identity sensor v2.x](prerequisites-sensor-version-2.md)     |

Once you've evaluated your infrastructure and requirements, follow the instructions for deploying the sensor based on the version you need.

## Deployment process

Watch the following video for a step-by-step demo and to learn about:

- How Defender for Identity sensors protect your organization against identity-based attacks.
- How to download and install the sensor.
- How to find potential sensor and configuration health issues.
- How to view identity-related posture assessments in a Microsoft Secure Score.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=de930a92-f552-4c09-92dc-1ab03c2e1131]


## Next steps
- [Prepare your environment](prerequisites-sensor-version-2.md).
- Set up [Microsoft Defender for Identity role groups](../role-groups.md).
