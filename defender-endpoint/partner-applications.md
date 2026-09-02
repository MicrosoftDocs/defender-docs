---
title: Partner applications in Microsoft Defender for Endpoint
ms.reviewer:
description: View supported partner applications to enhance the detection, investigation, and threat intelligence capabilities of the platform
ms.service: defender-endpoint
ms.subservice: reference
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.topic: article
ms.date: 06/08/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Partner applications in Microsoft Defender for Endpoint

Defender for Endpoint supports third-party applications to help enhance the detection, investigation, and threat intelligence capabilities of the platform.

The support for third-party solutions helps to further streamline, integrate, and orchestrate defenses from other vendors with Microsoft Defender for Endpoint; enabling security teams to effectively respond better to modern threats.

Microsoft Defender for Endpoint seamlessly integrates with existing security solutions. The integration provides integration with the following solutions such as:

- [SIEM](#siem-integration)
- [Ticketing and IT service management solutions](#ticketing-and-it-service-management)
- [IoC indicators ingestions and matching](#indicators-matching)
- [Automated device investigation and remediation based on external alerts](#external-alert-correlation-and-automated-investigation-and-remediation)
- [Integration with Security orchestration and automation response (SOAR) systems](#security-orchestration-and-automation-response-soar-integration)
- [Support for non-Windows platforms](#support-for-non-windows-platforms)

To find the complete list of supported partner applications and integrations, see the [Microsoft Marketplace](https://marketplace.microsoft.com).

## SIEM integration

Defender for Endpoint supports SIEM integration through various of methods. This can include specialized SIEM system interface with out of the box connectors, a generic alert API enabling custom implementations, and an action API enabling alert status management.

## Ticketing and IT service management

Ticketing solution integration helps to implement manual and automatic response processes. Defender for Endpoint can help to create tickets automatically when an alert is generated and resolve the alerts when tickets are closed using the alerts API.

## Indicators matching

You can use threat-intelligence from providers and aggregators to maintain and use indicators of compromise (IOCs).

Defender for Endpoint allows you to integrate with these solutions and act on IoCs by correlating rich telemetry to create alerts. You can also use prevention and automated response capabilities to block execution and take remediation actions when there's a match.

Defender for Endpoint supports IOC matching and remediation for file and network indicators. Blocking is supported for file indicators.

## External alert correlation and Automated investigation and remediation

Defender for Endpoint offers unique automated investigation and remediation capabilities to drive incident response at scale.

Integrating the automated investigation and response capability with other solutions such as IDS and firewalls help to address alerts and minimize the complexities surrounding network and device signal correlation, effectively streamlining the investigation and threat remediation actions on devices.

External alerts can be pushed to Defender for Endpoint. These alerts are shown side by side with additional device-based alerts from Defender for Endpoint. This view provides a full context of the alert and can reveal the full story of an attack.

## Security orchestration and automation response (SOAR) integration

Orchestration solutions can help build playbooks and integrate the rich data model and actions that Defender for Endpoint APIs exposes to orchestrate responses, such as query for device data, trigger device isolation, block/allow, resolve alert and others.

## Support for non-Windows platforms

Defender for Endpoint provides a centralized security operations experience for Windows and non-Windows platforms, including mobile devices. You'll be able to see alerts from various supported operating systems (OS) in the portal and better protect your organization's network.


