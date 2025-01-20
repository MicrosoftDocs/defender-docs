---
title: Use safe deployment practices to safeguard your environment
description: Plan, implement, adopt, and manage safe deployment practices to safeguard and manage your environment
keywords: mde safe deployment practices
author: emmwalshh
ms.author: ewalsh
ms.reviewer: yongrhee
manager: deniseb
ms.date: 09/16/2024
ms.topic: conceptual
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: high
ms.custom: get-started
ms.collection:
- tier1
- highpri
---

# Use safe deployment practices to safeguard and manage your environment

Microsoft follows safe deployment practices (SDP) to minimize the risk of security updates having an unexpected impact. This article describes Microsoft Defender for Endpoint’s approach to SDP and what customers can do to manage their own roll-out processes to add an extra layer of control.

Microsoft Defender for Endpoint ships updates externally only after all the certification and validation tests are completed across multiple iterations of internal devices. 

Defender for Endpoint applies SDP to two distinct update mechanisms:

- Software and driver updates that are updated monthly (can potentially update kernel-mode components).
- Security intelligence and detection logic updates that can be updated multiple times a day (updates only apply to user-mode components).

## Monthly SDP software and driver updates

Defender for Endpoint releases monthly software and driver updates that add new functionality, improve existing features, and resolve bugs. 

Defender for Endpoint’s kernel drivers capture system-wide signals like process execution, file creation, and network activity. These drivers are updated through Windows Update, over a gradual and staged deployment process after spending weeks in stabilization and testing. The deployment evaluation monitors key metrics like reliability, performance, battery, application compatibility, and more across hardware and software configurations. 

The process for rolling out software and driver updates for Defender for Endpoint is shown in this image:

:::image type="content" alt-text="Screenshot that shows the process for rolling out software and driver updates for Defender for Endpoint." source="/defender/media/defender-endpoint/mde-software-driver-updates.png" lightbox="/defender/media/defender-endpoint/mde-software-driver-updates.png":::

### Microsoft SDP for monthly updates

All code and content changes go through engineering release gates along with extensive validations and stability testing. After the certification and validation process, Microsoft ships the updates through multiple groups of devices known as stabilization rings. The first stabilization ring targets Microsoft’s hundreds of thousands of employees and millions of internal devices. This helps ensure Microsoft discovers and addresses issues first, before customers.
 
Within each ring, Microsoft closely monitors quality signals such as product behavior and performance, false positives, as well as functional and reliability issues, before proceeding to roll out the update to a broader set of devices.
 
Once internal testing is successfully completed, Microsoft then releases the updates externally in a staggered manner to ensure stability. During this time, Microsoft continuously monitors the rollout to ensure a quick response and remote resolution of any issues by reverting or reissuing update packages.

### Customer SDP for monthly updates 

In addition to Microsoft’s safe deployment practices, organizations can also manage monthly updates with their own safe deployment practices through various controls:

- [Create a custom gradual rollout process for Microsoft Defender updates](configure-updates.md) to control the delivery of agent updates to their devices. Customers can control the rings that are assigned to their device group and when each ring receives updates. For example, place lower-valued assets in earlier rings and higher-valued assets in later rings.
- Apply patch management software and practices for security component updates that can also arrive in the form of monthly Latest Cumulative Updates (LCUs).
- Use [rollback controls](microsoft-defender-antivirus-updates.md#how-to-roll-back-an-update) or automated rollback options to revert or reset components to a last known good state. 

> [!NOTE]
> Caution is advised when rolling back an update across a large group of devices.

## Daily SDP security intelligence and detection logic updates

Microsoft releases security intelligence updates that once installed on devices supplement the real-time local and cloud-based machine learning models, behavior analysis, and heuristics that enable Defender for Endpoint to neutralize the latest known cyberthreats.

Given the high frequency at which these updates need to be delivered to protect customers, it’s not possible to deploy them through the same deployment process. Therefore, Defender for Endpoint doesn't include kernel changes in intelligence updates. Instead, daily updates are only delivered to components that run in the user mode of the operating system. This approach helps mitigate the risk of these more frequent updates from impacting the broader operating system and, in the unlikely event of an error, limits the risk of significant negative effects like system crashes and ensures devices can be automatically recovered.

### Microsoft SDP for daily updates 

Similar to the process for software and driver updates, Microsoft ships security intelligence updates after extensive testing and rolls them out starting with internal devices, early access customers, and then releases them externally in a controlled, gradual manner. Microsoft continually monitors telemetry and can mitigate issues through the cloud in minutes.

### Customer SDP for daily updates

Customers can also manage security intelligence updates with their own safe deployment policies through various measures:

- Stage updates through [corporate networks](microsoft-defender-antivirus-ring-deployment-group-policy-network-share.md#setting-up-the-pilot-environment) or software management solutions.
- Apply updates at a lower frequency for critical systems. Daily releases can be applied at a lower frequency for certain device groups, including servers critical to running your infrastructure.
- Use [rollback controls](microsoft-defender-antivirus-updates.md#how-to-roll-back-an-update) to revert or reset components to a last known good state.

## Related articles

- [microsoft-defender-antivirus-ring-deployment](microsoft-defender-antivirus-ring-deployment.md)
- [manage-protection-updates-microsoft-defender-antivirus](manage-protection-updates-microsoft-defender-antivirus.md)
- [microsoft-defender-antivirus-updates](microsoft-defender-antivirus-updates.md)
- [mac-updates](mac-updates.md)
- [linux-support-offline-security-intelligence-update](linux-support-offline-security-intelligence-update.md)
