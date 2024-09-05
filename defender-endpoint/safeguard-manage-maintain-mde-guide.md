---
title: Use Safe Deployment Practices and Defender for Endpoint capabilities to safeguard and manage your environment
description: Plan, design, implement, adopt, and manage updates for Micrsoft Defender for Endpoint. 
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

This article helps you understand how to use safe deployment practices and Defender for Endpoint capabilities to safeguard and manage your environment and maintain productivity.

## Safe Deployment Practices

Updates to Microsoft Defender for Endpoint are a combination of monthly and daily updates.  Monthly updates are software/drivers, and daily updates are, for example, antimalware definitions and detection logic.

Microsoft follows safe deployment practices to minimize the risk of these updates having an unexpected impact, but customers can create their own additional safe deployment practices by configuring gradual rollout controls.

### Monthly Update (software and drivers) safe deployment practices

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


## Enable Defender Antivirus capabilities

✅ **Task: Configure Antivirus (AV) and malware protection**

## Manage behavior with exclusions, indicators, and other techniques

✅ **Task: Configure baseline policies**

✅ **Task: Enable/disable the necessary capabilities for your organization**

✅ **Task: Plan how to manage exclusions**

## Troubleshooting guidance

Include your IT support and helpdesk in the early stages of Intune deployment planning and pilot efforts. Early involvement exposes your support staff to Intune, and they gain knowledge and experience in identifying and resolving issues more effectively. It also prepares them for supporting the organization's full production rollout. Knowledgeable help desk and support teams also help users adopt these changes.

✅ **Task: Train your support teams**

Validate the end-user experience with success metrics in your deployment plan. Some considerations:

- **Determine who will support end users**. Organizations can have different tiers or levels (1-3). For example, tier 1 and 2 might be part of the support team. Tier 3 includes members of the MDM team responsible for the Intune deployment.

  Tier 1 is typically the first level of support and the first tier to contact. If tier 1 can't resolve the issue, then they escalate to tier 2. Tier 2 escalates it to tier 3. [Microsoft support](../../get-support.md) might be considered as tier 4.

  - In the initial rollout phases, be sure all tiers in your support team document issues and resolutions. Look for patterns, and adjust your communications for the next rollout phase. For example:
    - If different users or groups are hesitant about enrolling their personal devices, consider a Teams calls to answer common questions.
    - If users are having the same issues enrolling organization-owned devices, then host an in-person event to help users enroll the devices.


## Next Steps

- [Security operations guide](mde-sec-ops-guide.md)