---
title: Operating guide Microsoft Defender for Endpoint
description: Plan, design, implement, adopt, and manage updates for Micrsoft Defender for Endpoint. Get guidance and advice to determine goals, use-case scenarios and requirements, and create rollout and communication plans, support, testing, and validation plans.
keywords: mde planning and configuration, intune deployment planning, design and implementation guide, intune deployment project plan
author: siosulli
ms.author: siosulli
manager: deniseb
ms.date: 08/19/2024
ms.topic: conceptual
ms.service: mde
ms.subservice: fundamentals
ms.localizationpriority: high
ms.custom: get-started
ms.collection:
- tier1
- highpri
---

# Operating guide Microsoft Defender for Endpoint

This guide helps you plan, onboard, configure, update, and troubleshoot Microsoft Defender for Endpoint as your enterprise endpoint security platform. 

:::image type="content" source="./media/intune-planning-guide/intune-planning-guide-steps-image.png" alt-text="Diagram that shows the steps to plan your migration or move to Microsoft Intune, including licensing needs." lightbox="./media/intune-planning-guide/intune-planning-guide-steps-image.png":::

This guide:

- Lists and describes some common objectives for enterprise device management and security 
- Provides guidance on onboarding devices
- Gives guidance on configuration including use of exclusions
- Provides recommendations and information on safe deployment practices
- Provides troubleshooting information  

## Setp 1: Determine your objectives

### Objective: Onboard devices 

✅ **Task: Determine the correct onboarding mechanism for your organization**

### Objective: Secure access on all devices

✅ **Task: Determine how you want to secure your devices**

Antivirus, malware scanning, responding to threats, and keep devices up-to-date are all important considerations. You also want to minimize the impact of malicious activity.

Some considerations:

- **Antivirus (AV) and malware protection are a must**. Intune integrates with [Microsoft Defender for Endpoint](../protect/advanced-threat-protection.md) and [different Mobile Threat Defense (MTD) partners](../protect/mobile-threat-defense.md) to help protect your managed devices, personal devices, and apps.

  [Microsoft Defender for Endpoint](/windows/security/threat-protection/microsoft-defender-atp/microsoft-defender-advanced-threat-protection) includes security features and a [portal](/microsoft-365/security/defender/microsoft-365-security-center-mde) to help monitor, and react to threats.

- If a device is compromised, you want to **limit malicious impact using [Conditional Access](../protect/conditional-access.md)**.

  For example, Microsoft Defender for Endpoint scans a device, and can determine if the device is compromised. Conditional Access can automatically block organization access on this device, including email.

- **Update the device, the OS, and apps to help keep your data secure**. Create a plan on how and when updates are installed. T

## Step 2 - Review existing policies, exclusions and infrastructure

Many organizations have existing policies and device management infrastructure that's only being "maintained". For example, you might have 20-year-old group policies, and don't know what they do. When considering a move to the cloud, instead of looking at what you've always done, determine the goal.

With these goals in mind, create a baseline of your policies. If you have multiple device management solutions, now might be the time to use a single mobile device management service.

✅ **Task: Look at tasks you run on-premises**

- **Review existing policies and their structure**. Some policies can apply globally, some apply at the site level, and some are specific to a device. The goal is to know and understand the intent of global policies, the intent of local policies, and so on.

✅ **Task: Determine how you want to use exclusions**

## Step 3 - Safe deployment practices 

The next task is to plan how and when your users and devices are updated In this task

✅ **Task: Create a plan to roll out updates**

Some considerations:

- **Roll out your policies in phases**. For example:

  - Start with a pilot or test group. These groups should know they're the first users, and be willing to provide feedback. Use this feedback to improve configuration, documentation, notifications, and make it easier for users in a future rollout. These users shouldn't be executives or VIPs.

    After initial testing, add more users to the pilot group. Or, create more pilot groups that focus on a different rollout, such as:

    - **Departments**: Each department can be a rollout phase. You target an entire department at a time. In this rollout, users in each department might use their device in the same way, and access the same applications. Users likely have the same types of policies.

    - **Geography**: Deploy your policies to all users in a specific geography, whether it's the same continent, country/region, or same organization building. This rollout lets you focus on the specific location of users. You could provide a Windows Autopilot for pre-provisioned deployment approach, as the number of locations deploying Intune at the same time is less. There are chances of different departments or different use cases at the same location. So, you could be testing different use cases simultaneously.

    - **Platform**: This rollout deploys similar platforms at the same time. For example, deploy policies to all iOS/iPadOS devices in February, all Android devices in March, and all Windows devices in April. This approach might simplify help desk support, as they only support one platform at a time.

    Using a staged approach, you can get feedback from a wide range of user types.

  - After a successful pilot, you're ready to start a full production rollout. The following example is an Intune rollout plan that includes targeted groups and timelines:

  | Rollout phase | July | August | September | October |
  |:---:|:---:|:---:|:---:|:---:|
  | Limited Pilot | IT (50 users) |  |  |  |
  | Expanded Pilot | IT (200 users), IT Executives (10 users) |  |  |  |
  | Production rollout phase 1 |  | Sales and Marketing (2,000 users) |  |  |
  | Production rollout phase 2 |  |  | Retail (1,000 users) |  |
  | Production rollout phase 3 |  |  |  | HR (50 users), Finance (40 users), Executives (30 users) |

  This template is also available to download at [Intune deployment planning, design, and implementation - Table templates](https://www.microsoft.com/download/details.aspx?id=103005).

- **Choose how users will enroll** their personal and organization-owned devices. There are different enrollment approaches you can use, including:

  - **User self-service**: Users enroll their own devices following steps provided by their IT organization. This approach is most common, and is more scalable than user-assisted enrollment.
  - **User-assisted enrollment**: In this pre-provisioned deployment approach, an IT member helps users through the enrollment process, in person or using Teams. This approach is common with executive staff and other groups that might need more assistance.
  - **IT tech fair**: At this event, the IT group sets up an Intune enrollment assistance booth. Users receive information on Intune enrollment, ask questions, and get help enrolling their devices. This option is beneficial for IT and users, especially during the early phases of an Intune rollout.

  The following example includes the enrollment approaches:

  | Rollout phase | July | August | September | October |
  |:---:|:---:|:---:|:---:|:---:|
  | Limited Pilot |  |  |  |  |
  | Self-service | IT |  |  |  |
  | Expanded Pilot |  |  |  |  |
  | Self-service | IT |  |  |  |
  | Pre-provisioned | IT Executives |  |  |  |
  | Production rollout phase 1 |  | Sales, Marketing |  |  |
  | Self-service |  | Sales and Marketing |  |  |
  | Production rollout phase 2 |  |  | Retail |  |
  | Self-service |  |  | Retail |  |
  | Production rollout phase 3 |  |  |  | Executives, HR, Finance |
  | Self-service |  |  |  | HR, Finance |
  | Pre-provisioned |  |  |  | Executives |

  For more information on the different enrollment methods for each platform, go to [Deployment guidance: Enroll devices in Microsoft Intune](deployment-guide-enrollment.md).

## Step 4: Troubleshooting guidance

Include your IT support and helpdesk in the early stages of Intune deployment planning and pilot efforts. Early involvement exposes your support staff to Intune, and they gain knowledge and experience in identifying and resolving issues more effectively. It also prepares them for supporting the organization's full production rollout. Knowledgeable help desk and support teams also help users adopt these changes.

✅ **Task: Train your support teams**

Validate the end-user experience with success metrics in your deployment plan. Some considerations:

- **Determine who will support end users**. Organizations can have different tiers or levels (1-3). For example, tier 1 and 2 might be part of the support team. Tier 3 includes members of the MDM team responsible for the Intune deployment.

  Tier 1 is typically the first level of support and the first tier to contact. If tier 1 can't resolve the issue, then they escalate to tier 2. Tier 2 escalates it to tier 3. [Microsoft support](../../get-support.md) might be considered as tier 4.

  - In the initial rollout phases, be sure all tiers in your support team document issues and resolutions. Look for patterns, and adjust your communications for the next rollout phase. For example:
    - If different users or groups are hesitant about enrolling their personal devices, consider a Teams calls to answer common questions.
    - If users are having the same issues enrolling organization-owned devices, then host an in-person event to help users enroll the devices.

- **Create a help desk workflow, and constantly communicate support issues**, trends, and other important information to all tiers in your support team. For example, hold daily or weekly Teams meetings so all tiers are aware of trends, patterns, and can get help.

  The following example shows how Contoso implements their IT support or helpdesk workflows:

  1. End-user contacts IT support or helpdesk tier 1 with an enrollment issue.
  2. IT support or helpdesk tier 1 can't determine the root cause and escalates to tier 2.
  3. IT support or helpdesk tier 2 investigates. Tier 2 can't resolve the issue and escalates to tier 3, and provides additional information to help with the issue.
  4. IT support or helpdesk tier 3 investigates, determines the root cause, and communicates the resolution to tier 2 and 1.
  5. IT support/helpdesk tier 1 then contacts the users, and resolves the issue.

  This approach, especially in early stages of the Intune rollout, adds many benefits, including:

  - Help learn the technology
  - Quickly identify issues and resolution
  - Improve the overall user experience
