---
title: Get devices onboarded to Microsoft Defender for Endpoint
description: Track onboarding of Intune-managed devices to Microsoft Defender for Endpoint and increase onboarding rate.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: install-set-up-deploy
ms.subservice: onboard
search.appverid: met150
ms.date: 03/10/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Get devices onboarded to Microsoft Defender for Endpoint


Each onboarded device adds an additional endpoint detection and response (EDR) sensor and increases visibility over breach activity in your network. Onboarding also ensures that a device can be checked for vulnerable components as well security configuration issues and can receive critical remediation actions during attacks.

Before you can track and manage onboarding of devices:

- [Enroll your devices to Intune management](configure-machines.md#enroll-devices-to-intune-management)
- [Ensure you have the necessary permissions](configure-machines.md#obtain-required-permissions)

Watch this video to learn how to easily onboard clients with Microsoft Defender for Endpoint.
> [!VIDEO https://learn-video.azurefd.net/vod/player?id=2524ee5d-6a5f-482c-8f69-dc3792577c60]

## Discover and track unprotected devices

The **Onboarding** card provides a high-level overview of your onboarding rate by comparing the number of Windows devices that have actually onboarded to Defender for Endpoint against the total number of Intune-managed Windows devices.

:::image type="content" source="media/secconmgmt-onboarding-card.png" alt-text="The Device configuration management Onboarding card" lightbox="media/secconmgmt-onboarding-card.png":::

*Card showing onboarded devices compared to the total number of Intune-managed Windows devices*

> [!NOTE]
> If you used Configuration Manager, the onboarding script, or other onboarding methods that don't use Intune profiles, you might encounter data discrepancies. To resolve these discrepancies, create a corresponding Intune configuration profile for Defender for Endpoint onboarding and assign that profile to your devices.

## Onboard more devices with Intune profiles

Defender for Endpoint provides several convenient options for [onboarding Windows devices](onboarding.md). For Intune-managed devices, you can use Intune profiles to deploy the Defender for Endpoint sensor to devices and onboard them to the service.

To create and assign a device configuration profile to onboard devices to Defender for Endpoint, see <a href="/intune/intune-service/protect/advanced-threat-protection#onboard-devices" target="_blank">Onboard devices</a> (opens in a new tab in the Intune documentation).



## Related topics

- [Ensure your devices are configured properly](configure-machines.md)
- [Increase compliance to the Defender for Endpoint security baseline](configure-machines-security-baseline.md)
- [Optimize ASR rule deployment and detections](configure-machines-asr.md)


