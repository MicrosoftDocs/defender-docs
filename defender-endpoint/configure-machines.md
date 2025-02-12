---
title: Ensure your devices are configured properly
description: Properly configure devices to boost overall resilience against threats and enhance your capability to detect and respond to attacks.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.custom: admindeeplinkDEFENDER
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 08/29/2024
---

# Ensure your devices are configured properly

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

With properly configured devices, you can boost overall resilience against threats and enhance your capability to detect and respond to attacks. Security configuration management helps ensure that your devices:

- Onboard to Microsoft Defender for Endpoint
- Meet or exceed the Defender for Endpoint security baseline configuration
- Have strategic attack surface mitigations in place

In the [Microsoft Defender portal](https://security.microsoft.com), go to **Endpoints** > **Configuration management** > **Dashboard**. 

:::image type="content" source="media/secconmgmt-main.png" alt-text="The Security configuration management page" lightbox="media/secconmgmt-main.png":::

*The device configuration management page*

You can track configuration status at an organizational level and quickly take action in response to poor onboarding coverage, compliance issues, and poorly optimized attack surface mitigations through direct, deep links to device management pages on Microsoft Intune and <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>.

In doing so, you benefit from:

- Comprehensive visibility of the events on your devices
- Robust threat intelligence and powerful device learning technologies for processing raw events and identifying the breach activity and threat indicators
- A full stack of security features configured to efficiently stop the installation of malicious implants, hijacking of system files and process, data exfiltration, and other threat activities
- Optimized attack surface mitigations, maximizing strategic defenses against threat activity while minimizing impact to productivity

## Enroll devices to Intune management

Device configuration management works closely with Intune device management to establish the inventory of the devices in your organization and the baseline security configuration. You will be able to track and manage configuration issues on Intune-managed Windows devices.

Before you can ensure your devices are configured properly, enroll them to Intune management. Intune enrollment is robust and has several enrollment options for Windows devices. For more information about Intune enrollment options, read about [setting up enrollment for Windows devices](/mem/intune/enrollment/windows-enroll).

> [!NOTE]
> To enroll Windows devices to Intune, administrators must have already been assigned licenses. [Read about assigning licenses for device enrollment](/mem/intune/fundamentals/licenses-assign).

> [!TIP]
> To optimize device management through Intune, [connect Intune to Defender for Endpoint](/mem/intune/protect/advanced-threat-protection-configure#connect-microsoft-defender-for-endpoint-to-intune).

## Obtain required permissions

By default, only users who have been assigned an appropriate role, such as the Intune Service Administrator role in Microsoft Entra ID, can manage and assign the device configuration profiles needed for onboarding devices and deploying the security baseline.

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

If you have been assigned other roles, ensure you have the necessary permissions:

- Full permissions to device configurations
- Full permissions to security baselines
- Read permissions to device compliance policies
- Read permissions to the organization

:::image type="content" source="media/secconmgmt-intune-permissions.png" alt-text="The required permissions on intune" lightbox="media/secconmgmt-intune-permissions.png":::

*Device configuration permissions on Intune*

> [!TIP]
> To learn more about assigning permissions on Intune, [read about creating custom roles](/mem/intune/fundamentals/create-custom-role#to-create-a-custom-role).

## More information

|Article |Description
|:---|:---
|[Get devices onboarded to Defender for Endpoint](configure-machines-onboarding.md)|Track onboarding status of Intune-managed devices and onboard more devices through Intune. |
|[Increase compliance to the Defender for Endpoint security baseline](configure-machines-security-baseline.md)|Track baseline compliance and noncompliance. Deploy the security baseline to more Intune-managed devices. |
| [Optimize ASR rule deployment and detections](configure-machines-asr.md)|Review rule deployment and tweak detections using impact analysis tools in <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>. |

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
