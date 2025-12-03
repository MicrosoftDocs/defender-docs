---
title: Microsoft Security Copilot Dynamic Threat Detection Agent
description: Investigate incidents and alerts using the Microsoft Security Copilot Dynamic Threat Detection Agent in the Microsoft Defender portal.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
ms.topic: article
search.appverid: 
  - MOE150
  - MET150
ms.date: 12/15/2025
appliesto: 
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Microsoft Security Copilot Dynamic Threat Detection Agent

[Microsoft Security Copilot in Microsoft Defender](security-copilot-in-microsoft-365-defender.md) includes the Dynamic Threat Detection Agent, an AI-powered security agent framework that automates investigation, triage, proactive threat hunting, and dynamic detection rule generation. It augments and amplifies human analyst capabilities, delivering comprehensive, real-time security insights across complex and high-volume signal environments. It enables your security teams to move beyond manual, reactive processes and embrace strategic, AI-driven threat management. 

This article provides an overview of the Threat Detection Agent, including steps to use it when investigating incidents and alerts.

## Overview
Security teams often face the risk of false negatives—threats that go undetected by traditional, rule-based detection systems. The Dynamic Threat Detection Agent uses AI to continuously monitor and analyze system activity, proactively uncovering hidden threats and surfacing high-fidelity alerts. 

This agent is always on, operates seamlessly in the Defender backend, and requires no setup or onboarding. These features and capabilities empower organizations to detect and respond to threats with greater speed, accuracy, and confidence. 

## Get access
Users with access to Security Copilot can use the Dynamic Threat Detection Agent.

## Start using the Dynamic Threat Detection Agent
Like the other [available tools and methods](incidents-overview.md#tools-and-methods-for-investigation-and-response) in the Defender portal for investigation and response, the Threat Detection Agent helps the triage, investigation, and resolution of incidents. 

The Dynamic Threat Detection Agent runs automatically in the background. When it generates an alert, the alert shows up in your incidents and alerts queues with **Security Copilot** as the **Detection source**.
 
To view more details about the alert, select the alert title. The Dynamic Threat Detection Agent provides a summary and recommended actions in the alert page.
 
>[!IMPORTANT]
>The summary and recommended actions are AI-generated, so make sure to review and verify them for accuracy.

You can then proceed to investigate the alert or incident. For more information, see the following articles:
- [Investigate incidents in the Microsoft Defender portal](investigate-incidents.md)
- [Investigate alerts in Microsoft Defender XDR](investigate-alerts.md)

## See also
- [Incidents and alerts in the Microsoft Defender portal](incidents-overview.md)
