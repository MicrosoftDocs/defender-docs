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
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Get devices onboarded to Microsoft Defender for Endpoint

Each onboarded device adds an additional endpoint detection and response (EDR) sensor and increases visibility over breach activity in your network. Onboarding also ensures that a device can be checked for vulnerable components, for security configuration issues, and can receive critical remediation actions during attacks.

Defender for Endpoint supports [multiple onboarding methods](deployment-strategy.md#step-2-select-your-deployment-method). For cloud-native and Intune-managed environments, [Microsoft Intune is the recommended approach](deployment-strategy.md#step-1-identify-your-architecture).

Before you begin, review the following prerequisites in the Intune documentation:

- [Review licensing and platform requirements](/intune/intune-service/protect/microsoft-defender-with-intune#prerequisites) for the Intune-Defender integration, including supported platforms and enrollment requirements
- [Ensure you have the necessary permissions](/intune/intune-service/protect/microsoft-defender-integrate#connect-microsoft-defender-for-endpoint-to-intune). The required roles are Endpoint Security Manager in Intune and Security Administrator in Microsoft Entra ID.

<!--- Placeholder > Removing this outdated video. Seeking possible replacement.
> [!VIDEO https://learn-video.azurefd.net/vod/player?id=2524ee5d-6a5f-482c-8f69-dc3792577c60] --->

## Discover and track unprotected devices

To see how many of your Intune-managed devices are onboarded, open the [Microsoft Defender portal](https://security.microsoft.com) and go to **Endpoints** \> **Configuration management** \> **Dashboard**. Or, to go directly to the **Device configuration management** page, use <https://security.microsoft.com/configuration_management>.

On the **Device configuration management** page, the **Onboarded devices** card gives you a high-level view of your onboarding rate, comparing the number of Windows devices that are onboarded to Defender for Endpoint against the total number of Intune-managed Windows devices.

:::image type="content" source="media/secconmgmt-onboarding-card.png" alt-text="Screenshot of the Onboarded devices card from the Device configuration management page in the Microsoft Defender portal." lightbox="media/secconmgmt-onboarding-card.png":::

*Card showing onboarded devices compared to the total number of Intune-managed Windows devices*

> [!NOTE]
> If you used Configuration Manager, the onboarding script, or other onboarding methods that don't use Intune profiles, you might encounter data discrepancies. To resolve these discrepancies, create a corresponding Intune configuration profile for Defender for Endpoint onboarding and assign that profile to your devices.

<a name="onboard-more-devices-with-intune-profiles"></a>

## Onboard more devices with Intune policies

Selecting **Onboard more devices** on the card opens the **Microsoft Defender for Endpoint** connector page in the [Microsoft Intune admin center](https://intune.microsoft.com) (**Endpoint security** \> **Microsoft Defender for Endpoint**). This page controls the service-to-service connection between Intune and Defender for Endpoint, and determines which device platforms participate in the integration. Deploying policies to onboard devices is a separate step done elsewhere in Intune.

To configure this connection and deploy onboarding policies, see <a href="/intune/intune-service/protect/microsoft-defender-integrate" target="_blank">Configure Microsoft Defender for Endpoint with Intune and onboard devices</a> (opens in a new tab in the Intune documentation).

## Related articles

- [Ensure your devices are configured properly](configure-machines.md)
- [Increase compliance to the Defender for Endpoint security baseline](configure-machines-security-baseline.md)
- [Optimize ASR rule deployment and detections](configure-machines-asr.md)
