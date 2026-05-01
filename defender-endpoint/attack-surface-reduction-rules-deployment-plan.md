---
title: Plan your ASR rules deployment
description: Provides guidance to plan your attack surface reduction rules deployment.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: sugamar, yongrhee
ms.custom: asr
ms.topic: article
ms.collection:
- m365-security
- m365solution-asr-rules
- highpri
- tier1
- mde-asr
ms.date: 04/22/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Plan your attack surface reduction (ASR) rules deployment

This article is part of the [Attack surface reduction rules deployment guide](attack-surface-reduction-rules-deployment.md).

This first step in your attack surface reduction (ASR) rules deployment is to plan the deployment before testing or enabling rules. This article describes a sound planning methodology that you can adjust to meet your business needs.

> :::image type="content" source="media/asr-rules-planning-steps.png" alt-text="The ASR rule planning steps." lightbox="media/asr-rules-planning-steps.png":::

> [!TIP]
> Typically, you can enable the [standard protection rules](attack-surface-reduction-rules-overview.md#asr-rules) in **Block** or **Warn** mode without testing. You should test other ASR rules in **Audit** mode before you switch them to **Block** or **Warn** mode. For more information, see the [ASR rules deployment guide](attack-surface-reduction-rules-deployment.md).

## Infrastructure requirements for the deployment guide

Although there are [multiple ways to enable ASR rules](attack-surface-reduction-rules-configure.md), this deployment guide is based on an infrastructure consisting of the following features:

- Microsoft Entra ID
- Microsoft Intune
- Windows 10 and Windows 11 devices
- Microsoft Defender for Endpoint E5 or Windows E5 licenses

To take full advantage of ASR rules and reporting, we recommend using a Microsoft Defender XDR E5, Windows E5, or A5 license. Learn more at [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md).

> [!NOTE]
> If you're transitioning from a non-Microsoft host intrusion prevention system (HIPS) to Microsoft Defender Antivirus and ASR rules, we recommend running the HIPS solution alongside ASR rules util you enable rules in **Block** mode during the [implementation phase](attack-surface-reduction-rules-deployment-implement.md). Contact the antivirus solution provider for exclusion recommendations.

## Step 1: Identify business units

How you select the first business unit to receive ASR rules in the [testing phase](attack-surface-reduction-rules-deployment-test.md) depends on the following factors:

- Size of the business unit (smaller is usually easier to manage)
- Availability of ASR rule champions
- Distribution and usage of affected software. For example:
  - Software
  - Shared folders
  - Scripts
  - Office macros

Your business needs might clearly dictate one of the following choices:

- Include multiple business units to get a broad sampling of software, shared folders, scripts, macros, and line of business apps that might be affected by ASR rules.
- Limit the initial scope to a single business unit, work through all the issues in that business unit, the repeat the roll out to other business units individually.

## Step 2: Identify ASR rule champions

ASR rule champions are people in the affected business units who can help you during the preliminary testing and implementation phases. Typically, a champion has more technical skills and doesn't mind intermittent workflow outages. Champion involvement continues throughout the broader expansion of ASR rules deployment to your organization. Your ASR rule champions are the first to experience each level of the ASR rules rollout.

It's important to provide a feedback and response channel for your ASR rule champions to alert you to work disruptions and to receive ASR rules rollout communications.

## Step 3: Inventory line-of-business apps and understand the business unit processes

A full understanding of the apps and business processes in your organization is critical to a successful ASR rules deployment. It's imperative that you understand how those apps are used within the various business units in your organization.

Take inventory of the approved apps in your organization. You can use tools like the Microsoft 365 Apps admin center to help. For more information, see [Overview of inventory in the Microsoft 365 Apps admin center](/microsoft-365-apps/admin-center/inventory).

> [!NOTE]
> Some ASR rules don't work well if you frequently use unsigned, internally developed apps and scripts. It's more difficult to deploy ASR rules if you don't enforce code signing.

## Step 4: Define reporting and response ASR rules team roles and responsibilities

Clearly articulating roles and responsibilities of persons responsible for monitoring and communicating ASR rules status and activity is a core activity of attack surface reduction maintenance. Therefore, it's important to determine:

- Who's responsible for gathering reports.
- How and with whom reports are shared.
- How to escalate and address new threats or unwanted blocks by ASR rules.

Typical roles and responsibilities include:

- **IT admins**: Implement ASR rules and manage exclusions. Work with different business units on apps and processes. Create and share reports to stakeholders.
- **Certified security operations center (CSOC) analysts**: Investigate high-priority blocked processes.
- **Chief information security officer (CISO)**: Responsible for the overall security posture and health of the organization.

## Step 5: Define ASR rule deployment rings

For large enterprises, we recommend deploying ASR rules in _rings_. You define rings through the assessment of your business units, ASR rule champions, apps, and processes. After you successfully deploy ASR rules to the first ring, you can transition to the next ring into the testing phase, and so on. If you already defined rings for phased rollout of Windows updates, you can likely use those same rings to deploy ASR rules.

For more information about rings, see: [Windows: Create a deployment plan](/windows/deployment/update/create-deployment-plan)

## See also

- [Attack surface reduction (ASR) rules deployment guide](attack-surface-reduction-rules-deployment.md)
- [Test your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-test.md)
- [Enable attack surface reduction (ASR) rules](attack-surface-reduction-rules-deployment-implement.md)
- [Manage and monitor your attack surface reduction (ASR) rules deployment](attack-surface-reduction-rules-deployment-operationalize.md)
- [Attack surface reduction (ASR) rules reference](attack-surface-reduction-rules-reference.md)
