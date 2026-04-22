---
title: Plan attack surface reduction rules deployment
description: Provides guidance to plan your attack surface reduction rules deployment.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: limwainstein
ms.author: lwainstein
ms.reviewer: sugamar, yongrhee
ms.custom: asr
ms.topic: article
ms.collection:
- m365-security
- m365solution-asr-rules
- highpri
- tier1
- mde-asr
ms.date: 03/27/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Plan attack surface reduction rules deployment

Always plan your deployment before you test or enable attack surface reduction (ASR) rules . Careful planning helps you test your ASR rules deployment and get ahead of any rule exceptions. When planning to test ASR rules, make sure you start with the right business unit. Start with a small group of people in a specific business unit. You can identify some champions within a particular business unit who can provide feedback to help tune your implementation.

> :::image type="content" source="media/asr-rules-planning-steps.png" alt-text="The ASR rule planning steps." lightbox="media/asr-rules-planning-steps.png":::

> [!TIP]
> Typically, you can enable the **standard protection** rules without extensive testing. For more information, see [Attack surface reduction rules](attack-surface-reduction-rules-overview.md#attack-surface-reduction-rules).

## Start your ASR rules deployment with the right business unit

How you select the first business unit to receive ASR rules depends on the following factors:

- Size of business unit
- Availability of ASR rule champions
- Distribution and usage of affected software. For example:
  - Software
  - Shared folders
  - Scripts
  - Office macros

Your business needs might clearly dictate one of the following choices:

- Include multiple business units to get a broad sampling of software, shared folders, scripts, macros, and line of business apps.
- Limit the initial scope to a single business unit, the repeat the roll out to other business units individually.

## Identify ASR rule champions

ASR rule champions are people in the affected business units who can help you during the preliminary testing and implementation phases. Typically, a champion has more technical skills and doesn't mind intermittent workflow outages. Champion involvement continues throughout the broader expansion of ASR rules deployment to your organization. Your ASR rule champions are the first to experience each level of the ASR rules rollout.

It's important to provide a feedback and response channel for your ASR rule champions to alert you to work disruptions and to receive ASR rules rollout communications.

## Get inventory of line-of-business apps and understand the business unit processes

Having a full understanding of the applications and per-business-unit processes that are used across your organization is critical to a successful ASR rules deployment. Additionally, it's imperative that you understand how those apps are used within the various business units in your organization.
To start, you should get an inventory of the apps that are approved for use across the breadth of the organization. You can use tools such as the Microsoft 365 Apps admin center to help inventory software applications. See: [Overview of inventory in the Microsoft 365 Apps admin center](/deployoffice/admincenter/inventory).

## Define reporting and response ASR rules team roles and responsibilities

Clearly articulating roles and responsibilities of persons responsible for monitoring and communicating ASR rules status and activity is a core activity of attack surface reduction  maintenance. Therefore, it's important to determine:

- The person or team responsible for gathering reports
- How and with whom reports are shared
- How escalation is addressed for newly identified threats or unwanted blockages caused by ASR rules

Typical roles and responsibilities include:

- IT admins: Implement ASR rules, manage exclusions. Work with different business units on apps and processes. Assembling and sharing reports to stakeholders
- Certified security operations center (CSOC) analyst: Responsible for investigating high-priority, blocked processes, to determine whether the threat is valid or not
- Chief information security officer (CISO): Responsible for the overall security posture and health of the organization

## ASR rules ring deployment

For large enterprises, Microsoft recommends deploying ASR rules in "rings." Rings are groups of devices that are visually represented as concentric circles that radiate outward like nonoverlapping tree rings. When the innermost ring is successfully deployed, you can transition to the next ring into the testing phase. Thorough assessment of your business units, attack surface reduction  rules champions, apps, and processes is imperative to defining your rings.
In most cases, your organization has deployment rings for phased rollouts of Windows updates. You can use your existing ring design to implement ASR rules.
See: [Create a deployment plan for Windows](/windows/deployment/update/create-deployment-plan)

## Other articles in this deployment collection

[Attack surface reduction rules deployment overview](attack-surface-reduction-rules-deployment.md)

[Test attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)

[Enable attack surface reduction rules](attack-surface-reduction-rules-deployment-implement.md)

[Manage and monitor attack surface reduction rules](attack-surface-reduction-rules-deployment-operationalize.md)

[Attack surface reduction rules reference](attack-surface-reduction-rules-reference.md)
