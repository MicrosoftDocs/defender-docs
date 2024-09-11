---
title: Use Safe Deployment Practices to safeguard your environment
description: Plan, design, implement, adopt, and manage
keywords: mde safe deployment practices
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

# Use Safe Deployment Practices and Defender for Endpoint capabilities to safeguard and manage your environment

This article will help you better understand: 

- Microsoft's safe deployment practices for Defender for Endpoint: Microsoft follows safe deployment practices that minimize the risk of updates having an unexpected impact.
- Recommended additional safe deployment practices customers can put in place: For example, configuring gradual rollout controls.
- Defender for Endpoint capabilities that will help you safeguard and manage your environment and maintain productivity.

## Safe Deployment Practices

Microsoft Defender for Endpoint ships update externally only after all the certification and validation tests are completed across multiple iterations of internal devices. Microsoft Defender for Endpoint follows a monthly cycle for software/driver updates and daily security intelligence and logic updates for content. 

Enterprise customers can stage their roll-outs of Microsoft Defender for Endpoint to control how quickly updates are applied to specific classes of devices.  

### Monthly Update (software and drivers) safe deployment practices

Every release of Microsoft Defender for Endpoint is tested with Windows and other operating systems to ensure it operates normally. Updates to Microsoft Defender for Endpoint are a combination of monthly and daily updates.  Monthly updates are software/drivers, and daily updates are, for example, antimalware definitions and detection logic.

**Microsoft**

- Microsoft undertakes extensive pre-release validations for monthly rollouts (including running driver code under driver verifier and other tools that can catch subtle bugs). 
- We ship updates post all the certification and validation to multiple internal rings of devices and watch for Telemetry/False positives/ Crashes etc from them before releasing to the world in "waves". 
- We continue to monitor post release and act quickly through our cloud to remotely solve issues if they emerge - as well as quickly revert and reissue update packages.
- Mature infrastructure (Watson) for tracking product crashes (both in user-mode and kernel-mode).

**Customer**

- Gradual rollout - enterprises can control what ring each of their device comes into (place lower-valued assets in earlier rings and higher-valued assets in later rings)
- Windows Update - security component updates can also arrive in the form of monthly "LCUs" - cumulative update packages. Patch management software and practices apply.
- Rollback controls - as a last resort, it's possible to revert or reset components to a last known good state. As this can introduce new challenges if applied across a large group of devices, caution is advised.

✅ **Task: Create a plan to roll out updates**

### Daily security intelligence and logic updates (Content) safe deployment practices

**Microsoft** 

- We ship definitions post all the certification and validation to multiple internal rings of devices and watch for Telemetry/False positives/ Crashes etc from them before releasing to the world in "waves". 
- We continue to monitor post release and act quickly through our cloud to solve issues if they emerge.

**Customer**

- Customers can control security intelligence (definition) updates with their own Safe Deployment Policies by staging updates on file-shares or through patch management solutions.
- For critical systems, it's recommended to set up practices where daily releases updates are applied at a lower frequency, or to have these updates applied to monitored test environments first. 
- Rollback controls - as a last resort, it's possible to revert or reset components to a last known good state. As this can introduce new challenges if applied across a large group of devices, caution is advised.

> [!NOTE]
> The following articles provide more details Information on Defender for Endpoint updates and safe deployment practices 
>
> - [microsoft-defender-antivirus-ring-deployment](microsoft-defender-antivirus-ring-deployment.md)
> - [manage-protection-updates-microsoft-defender-antivirus](manage-protection-updates-microsoft-defender-antivirus)
> - [microsoft-defender-antivirus-updates](microsoft-defender-antivirus-updates)
> - [mac-updates](mac-updates)
> - [linux-support-offline-security-intelligence-update](linux-support-offline-security-intelligence-update)
> - [Microsoft Defender for Endpoint’s Safe Deployment Practices](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/microsoft-defender-for-endpoint-s-safe-deployment-practices/ba-p/4220342)

