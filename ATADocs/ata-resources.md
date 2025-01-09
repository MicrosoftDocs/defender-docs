---
# required metadata

title: Advanced Threat Analytics resources and readiness roadmap
description: Provides a list of ATA resources, videos, getting started, deployment and readiness roadmap links.
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 42a1a34f-ed6b-4538-befb-452168a30e8c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: bennyl
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# ATA readiness roadmap

[!INCLUDE [Banner for top of topics](includes/banner.md)]

This article provides you a readiness roadmap that will assist you to get started with Advanced Threat Analytics.

## Understanding ATA

Advanced Threat Analytics (ATA) is an on-premises platform that helps protect your enterprise from multiple types of advanced targeted cyberattacks and insider threats. Use the following resources to learn more about ATA:

- [ATA overview](what-is-ata.md)

- [ATA introduction video - short](https://aka.ms/ATAShort)

- [ATA introductory video - full](https://aka.ms/ATAVideo)

## Deployment decisions

ATA is composed of the ATA Center, which you can install on a server, and ATA Gateways, which you can install on separate computers or by using the Lightweight Gateway directly on your domain controllers. Before you get up and running, it's important to make the following deployment decisions:

|Configuration | Decision |
|----|----|
|Hardware type|Physical, virtual, Azure VM|
|Workgroup or Domain|Workgroup, domain|
|Gateway sizing|Full Gateway, Lightweight Gateway|
|Certificates|PKI, self-signed|

If you are using physical servers, you should plan capacity. You can get help from the sizing tool to allocate space for ATA:

[ATA sizing tool](ata-capacity-planning.md) - The sizing tool automates the collection of the amount of traffic ATA needs. It automatically provides supportability and resource recommendations for both the ATA Center and ATA Lightweight Gateways.

[ATA capacity planning](ata-capacity-planning.md)

## Deploy ATA

These resources will help you download and install the ATA Center, connect to Active Directory, download the ATA Gateway package, set up event collection, and optionally integrate with your VPN and set up honeytoken accounts and exclusions.

[Download ATA](install-ata-step1.md#step-1-download-and-install-the-ata-center)

[ATA POC playbook](https://aka.ms/ataplaybook) - Guide to all the steps necessary to do a successful POC deployment of ATA.

## ATA settings

The basic necessary settings in ATA are configured as part of the installation wizard. However, there are a number of other settings that you can configure to fine-tune ATA that makes detections more accurate for your environment, such as SIEM integration and audit settings.

[Audit settings](https://github.com/microsoft/Azure-Advanced-Threat-Protection/tree/master/Auditing) – Audit your domain controller health before and after an ATA deployment.

[ATA general documentation](index.yml)

## Work with ATA

After ATA is up and running, you can view suspicious activities that are detected in the Attack timeline. This is the default landing page you are taken to when you log in to the ATA Console. By default, all open suspicious activities are shown on the attack time line. You can also see the severity assigned to each activity. Investigate each suspicious activity by drilling down into the entities (computers, devices, users) to open their profile pages that provide more information. These resources will help you work with ATA's suspicious activities:

[ATA suspicious activity playbook](/samples/browse/?redirectedfrom=TechNet-Gallery) - This article walks you through credential theft attack techniques using readily available research tools on the internet. At each point of the attack, you can see how ATA helps you gain visibility into these threats.

[ATA suspicious activity guide](suspicious-activity-guide.md)

## Security best practices

[ATA best practices](https://aka.ms/atasecbestpractices) - Best practices for securing ATA.

[ATA frequently asked questions](ata-technical-faq.yml) - This article provides a list of frequently asked questions about ATA and provides insight and answers.

## Community resources

[ATA blog](https://aka.ms/ATABlog)
[ATA community](https://aka.ms/ATACommunity)
