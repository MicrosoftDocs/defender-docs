---
title: What is the Microsoft Defender Experts coverage for cloud workloads?
ms.reviewer:
description: This document describes the cloud workload coverage in Microsoft Defender Experts for Servers and Microsoft Defender Experts for Hunting - Servers. 
ms.service: defender-experts-for-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - essentials-get-started
ms.topic: conceptual
ms.custom: 
- cx-ti
- cx-dex
search.appverid: met150
ms.date: 08/01/2025
---

# Microsoft Defender Experts coverage for cloud workloads

Micorosft Defender Experts expands its service coverage to include cloud workloads, beginning with on-premises and multi-cloud servers (such as Google Cloud Platform and Amazon Web Services) protected by [Microsoft Defender for Cloud](/defender-for-cloud/defender-for-cloud-introduction). It's offered as an add-on SKU to both Defender Experts for XDR and Defender Experts for Hunting as **Microsoft Defender Experts for Servers** and **Microsoft Defender Experts for Hunting - Servers**, respectively.

This service has the following capabilities:

- Coverage to Microsoft Defender incidents that contain at least one Defender for Cloud alert with a severity **Medium** or higher. 
- Hunting for threats to cloud infrastructure (Azure virtual machines and servers), such as infrastructure as a service (IaaS) resource theft and Azure extension abuse. 
- Extension of existing Defender Experts capabilites (such as [Ask Defender Experts](experts-on-demand.md), chat, reports, and [Defender Experts Notifications](onboarding-defender-experts-for-hunting.md#receive-defender-experts-notifications)) to Defender for Cloud servers

For Defender Experts for XDR customers, this service also has the following capabilities: 
- Service Delivery Manager support with the completion of manual onboarding steps.  
- Guidance (through [managed response](managed-detection-and-response-xdr.md)) on responding to incidents impacting virtual machines and servers, enable customers to take actions based on their business impact.  

## Prerequisities

Customers who wish to have Defender Experts coverage for Defender for Cloud servers must have the following:
- Defender Experts for XDR or Defender Experts for Hunting service enrollment
- Defender for Servers Plan 1 or Plan 2 in Microsoft Defender for Cloud

## Frequently asked questions
**What servers do I pay for this service?**
<br>When you enable Defender Experts coverage for Defender for Cloud servers (either through Defender Experts for Servers or Defender Experts for Hunting - Servers), you're charged for all servers protected and billed by your Defender for Servers license in your tenant.

**What are the licensing requirements for this service?**<br>

**Can I have this service cover only a subset of my cloud servers?**<br>
Yes, you can enable the service on specific resources in a subscription. [Learn more about planning deployment scope](/azure/defender-for-cloud/plan-defender-for-servers-select-plan)

**What's the difference between this service and covering Microsoft Defender for Endpoint for Servers?**<br>


### See also

- [Before you begin using Defender Experts for XDR](before-you-begin-xdr.md)
- [Before you begin using Defender Experts for Hunting](before-you-begin-defender-experts.md)
