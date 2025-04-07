---
title: Microsoft Defender Core service configurations and experimentation 
description: Understand the interaction between Microsoft Defender Core Service and the Experimentation and Configuration Service (ECS). 
search.appverid: met150
ms.service: defender-endpoint
author: emmwalshh
ms.author: ewalsh
ms.reviewer: yongrhee
manager: deniseb
ms.localizationpriority: medium
ms.date: 07/19/2024
audience: ITPro
ms.topic: troubleshooting
ms.subservice: ngp
ms.collection: 
- m365-security
- tier3
- mde-ngp
---

# Microsoft Defender Core service configurations and experimentation 

This article describes the interaction between Microsoft Defender Core Service and the Experimentation and Configuration Service (ECS). Microsoft Defender Core Service is a part of Microsoft Defender Antivirus and communicates with ECS to request and receive different kinds of payloads. These payloads include configurations, feature rollouts, and experiments. 

> [!CAUTION]
> If you disable communications with the service, this will affect Microsoft's ability to respond to a severe bug in a timely manner. 

> [!IMPORTANT]
> Make sure clients can access the following URLs so payloads can be received:
>
> Enterprise customers should allow the following URLs: 
> -  `*.events.data.microsoft.com` 
> -  `*.endpoint.security.microsoft.com`
> -  `*.ecs.office.com`
>
>Enterprise U.S. Government customers should allow the following URLs: 
> - `*.events.data.microsoft.com` 
> - `*.endpoint.security.microsoft.us (GCC-H & DoD)`
> - `*.gccmod.ecs.office.com (GCC-M)` 
>- `*.config.ecs.gov.teams.microsoft.us (GCC-H)`
> - `*.config.ecs.dod.teams.microsoft.us (DoD)`

> [!NOTE]
> The information in this article applies to Microsoft Defender Antivirus platform update version [4.18.24030](microsoft-defender-antivirus-updates.md) or later. 

## Configurations
 
Configurations are the payload meant to ensure product health, security, and privacy compliance, and are intended to have the same value for all the users (based on platforms and channels.) This could be to enable a feature flag for a domain action, and can also be used to disable a feature flag in the event of a bug. 

## Controlled feature rollout

Controlled feature rollout (CFR) is a procedure for slowly increasing the size of the user group that receives a feature. By distributing a new feature to a randomly selected subset of the user population, it's possible to compare user feedback to an equally sized control group without the feature to measure the impact of the feature. 

## Experiments 

Currently, Microsoft Defender Core service doesn't do any experimental testing. Development is carried out via the [Gradual Rollout process](/defender-endpoint/manage-gradual-rollout#microsoft-gradual-rollout-model). If this changes, an announcement will be posted in the [Message Center](/microsoft-365/admin/manage/message-center). 

## See also 

- [Microsoft Defender Antivirus in Windows | Microsoft Learn](microsoft-defender-antivirus-windows.md) 

