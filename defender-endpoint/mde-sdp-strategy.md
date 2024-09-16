---
title: Use safe deployment practices to safeguard your environment
description: Plan, design, implement, adopt, and manage safe deployment practices to safeguard and manage your environment
keywords: mde safe deployment practices
author: siosulli
ms.author: siosulli
manager: deniseb
ms.date: 09/16/2024
ms.topic: conceptual
ms.service: mde
ms.subservice: fundamentals
ms.localizationpriority: high
ms.custom: get-started
ms.collection:
- tier1
- highpri
---

# Use safe deployment practices to safeguard and manage your environment

Safe Deployment Practices (SDP) help an organzation build resilient processes that maintain productivity. Microsoft follows safe deployment practices that minimize the risk of updates having an unexpected impact. This guides describes Microsoft Defender for Endpoint’s approach to SDP and what customers can do to manage their own roll-out process for an additional layer of control.

Microsoft Defender for Endpoint ships updates externally only after all the certification and validation tests are completed across multiple iterations of internal devices. 

Defender for Endpoint applies safe deployment practices to two distinct update mechanisms:

- Software and driver updates that are updated monthly (and potentially can update kernel-mode components).
- Security intelligence and detection logic updates that may be updated multiple times per day and apply only to user-mode components.

Enterprise customers can stage their roll-outs of Microsoft Defender for Endpoint to control how quickly updates are applied to specific classes of devices.  

## Monthly update (software and drivers) safe deployment practices

Defender for Endpoint releases monthly software and driver updates that add new functionality, improve existing features, and resolve bugs. 

Defender for Endpoint’s kernel drivers capture system-wide signals like process execution, file creation, and network activity. These drivers are updated through Windows Update, over a gradual and staged deployment process after spending weeks in stabilization and testing. The deployment evaluation monitors key metrics like reliability, performance, battery, application compatibility, and more across hardware and software configurations. 

:::image type="content" alt-text="process for rolling out software and driver updates for Defender for Endpoint" source="/defender/media/defender-endpoint/mde-software-driver-updates.png" lightbox="/defender/media/defender-endpoint/mde-software-driver-updates.png":::

## Microsoft practices

All code and content changes go through engineering release gates along with extensive validations and stability testing. After the certification and validation process, Microsoft ships the updates through multiple groups of devices known as stabilization rings. The first stabilization ring targets Microsoft’s hundreds of thousands of employees and millions of internal devices. This helps ensure we discover and address issues first, before customers.
 
Within each ring, we closely monitor quality signals such as product behavior and performance, false positives, as well as functional and reliability issues, before proceeding to roll out the update to a broader set of devices. Customers can control the rings that are assigned to their device groups, including early access groups, to see how each update may interact with their devices and provide feedback to Microsoft before it is released.
 
Once internal testing is successfully completed, Microsoft then releases the updates externally in a staggered manner to ensure stability. During this time, Microsoft continuously monitors the rollout. That way we can quickly respond and remotely resolve any issues by reverting or reissuing update packages.

## Customer controls

In addition to Microsoft’s safe deployment practices, organizations can also manage monthly updates with their own safe deployment policies through various controls:
•	[Create a custom gradual rollout process for Microsoft Defender updates](configure-updates.md) to control the delivery of agent updates to their devices by their device groups and the timing of updates. Enterprises can control which ring each device receives updatesm, for example, place lower-valued assets in earlier rings and higher-valued assets in later rings.
•	Apply patch management software and practices for security component updates that can also arrive in the form of monthly Latest Cumulative Updates (LCUs).
•	Use [manual](./microsoft-defender-antivirus-updates.md#how-to-roll-back-an-update) or automated rollback options to revert or reset components to a last known good state. 

> [!NOTE]
> Caution is advised when rolling back an update across a large group of devices.


### Daily security intelligence and logic updates (Content) safe deployment practices

In addition to monthly code updates, Microsoft releases security intelligence updates which are installed on devices to supplement the real-time local and cloud-based machine learning models, behavior analysis, and heuristics that enable Defender for Endpoint to neutralize the latest known cyberthreats.

Given the high frequency at which these updates need to be delivered to protect customers, it’s not possible to deploy these through the same deployment process. Therefore, Defender for Endpoint does not include kernel changes in intelligence updates. Instead, daily updates are only delivered to components that run in the user mode of the operating system. This approach helps mitigate the risk of these more frequent updates from impacting the broader operating system and, in the unlikely event of an error, limits the risk of significant negative effects like system crashes and ensures devices can be automatically recovered.

## Microsoft practices

Similar to the process for software and driver updates, Microsoft ships security intelligence updates after extensive testing and rolls them out starting with internal devices, early access customers, and then releases them externally in a controlled, gradual manner. We continually monitor telemetry and can mitigate issues through the cloud in minutes.

***
- We ship definitions post all the certification and validation to multiple internal rings of devices and watch for Telemetry/False positives/ Crashes etc from them before releasing to the world in "waves". 
- We continue to monitor post release and act quickly through our cloud to solve issues if they emerge.
***

## Customer controls

Customers can also manage security intelligence updates with their own safe deployment policies through various controls:

Stage updates through corporate networks or software management solutions.
Apply updates at a lower frequency for critical systems. Daily releases can be applied at a lower frequency for certain device groups, including servers critical to running your infrastructure.
Use rollback controls. As a last resort, it's possible to revert or reset components to a last known good state using rollback controls.

Microsoft has long invested in safe deployment practices and established a robust SDP model in how we deliver updates to customers of Defender for Endpoint. In addition, customers have full control over how updates are delivered and how controls are applied to their device estate. This model of shared control helps ensure security and resiliency. 

***
- Customers can control security intelligence (definition) updates with their own Safe Deployment Policies by staging updates on file-shares or through patch management solutions.
- For critical systems, it's recommended to set up practices where daily releases updates are applied at a lower frequency, or to have these updates applied to monitored test environments first. 
- Rollback controls - as a last resort, it's possible to revert or reset components to a last known good state. As this can introduce new challenges if applied across a large group of devices, caution is advised.
***

## Related articles

- [microsoft-defender-antivirus-ring-deployment](microsoft-defender-antivirus-ring-deployment.md)
- [manage-protection-updates-microsoft-defender-antivirus](manage-protection-updates-microsoft-defender-antivirus.md)
- [microsoft-defender-antivirus-updates](microsoft-defender-antivirus-updates.md)
- [mac-updates](mac-updates.md)
- [linux-support-offline-security-intelligence-update](linux-support-offline-security-intelligence-update)
