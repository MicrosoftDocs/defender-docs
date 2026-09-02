---
title: Set up automated attacks and training in Attack Simulation Training
description: Automate Attack Simulation Training campaigns and send payloads to target users. Learn how to create automated simulation flows with specific techniques and payloads that run when defined conditions are met.
ms.service: defender-office-365
author: chrisda
ms.author: chrisda
ms.localizationpriority: medium
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.date: 07/02/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# How to set up automated attacks and training in Attack simulation training

Attack simulation training lets you run safe attack simulations to test your organization's phishing risk. It also helps teach users how to spot and avoid phishing attacks. This guide shows you how to set up automated flows with specific techniques and payloads that launch when your chosen conditions are met. Before you start, review the [prerequisites](#what-you-need) to confirm you have the required licensing and permissions.

<a name="what-you-need"></a>
## Prerequisites

Before you begin, make sure you have:

- Microsoft Defender for Office 365 Plan 2 (included as part of E5).
- Sufficient permissions (Security Administrator role).
- 5-10 minutes to perform the following procedures.

## Send a payload to target users

Use the following steps to create a simulation automation and send a payload to target users:

1. Navigate to [Attack simulation training](https://security.microsoft.com/attacksimulator).
1. Choose **Simulation automations** from the top navigation bar.
1. Press **Create automation**.
1. Name the Simulation automation with something relevant and memorable. *Next*.
1. Pick the techniques you'd like to use from the flyout. *Next*.
1. Manually select up to 20 payloads you'd like to use for this automation, or alternatively select Randomize. *Next*.
1. If you picked OAuth as a Payload, you need to enter the name, logo, and scope (permissions) you'd like the app to have when it's used in a simulation. *Next*.
1. Choose who to target with the payload, if choosing the entire organization highlight the radio button. *Next*.
1. If you don't want to target the entire organization, select **Add Users**. Then search for or filter users in the wizard, and select **Add Users**. *Next*.
1. Customize the training if appropriate, otherwise leave Assign training for me (recommended) selected. *Next*.
1. Customize the landing page displayed when a user is phished if appropriate, otherwise leave as the Microsoft Default. *Next*.
1. Choose if you'd like end user notifications, if so select the delivery preferences and customize where appropriate. *Next*.
1. For Simulation schedule, you can either select **Randomized** or **Fixed**, the recommended option is Randomized, once selected, select *Next*.
1. Depending on your choice of Randomized or Fixed, the schedule details can differ, but select preferences for the selected schedule type, including the start and end dates of the automation. *Next*.
1. For **Launch Details**, select any final options you want, such as using unique payloads, or targeting repeat offenders and then select *Next*.
1. **Submit** and the Simulation automation is set up.

<a name="learn-more"></a>
## Related content

Full guidance can be found at [Simulation automations for Attack simulation training](../attack-simulation-training-simulation-automations.md).
