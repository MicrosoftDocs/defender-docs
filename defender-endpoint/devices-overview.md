---
title: Devices in Microsoft Defender for Endpoint
description: Understand the device lifecycle, roles, and how to manage devices in Microsoft Defender for Endpoint
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: overview
search.appverid: met150
ms.date: 01/29/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Devices in Microsoft Defender for Endpoint

Devices are the foundation of your security operations in Microsoft Defender for Endpoint. Understanding how devices appear in your environment, how to manage them effectively, and how to organize them for security actions is essential for protecting your organization.

## What are devices in Defender for Endpoint?

Devices in Microsoft Defender for Endpoint include any endpoint that reports security telemetry to the service. This includes:

- **Computers and mobile devices**: Workstations, servers, laptops, and mobile devices (Windows, macOS, Linux, iOS, Android)
- **Network devices**: Routers, switches, and other network infrastructure
- **IoT/OT devices**: Printers, cameras, industrial control systems, and operational technology devices

Devices appear in your inventory through two primary methods:

- **Onboarding**: Devices you explicitly onboard to Defender for Endpoint with the full agent installed. Onboarded devices show an **Onboarding status** of **Onboarded** and typically have an **Active** sensor health state. Because the agent is installed, Defender for Endpoint can collect detailed security data from these devices, including alerts, vulnerabilities, and software inventory. For more information, see [Onboard devices to Microsoft Defender for Endpoint](onboarding.md).
- **Discovery**: Devices automatically discovered on your network without an agent installed. Discovery happens through onboarded endpoints that observe network traffic (basic discovery) or actively probe the environment (standard discovery). Discovered devices show an **Onboarding status** of **Can be onboarded**, **Unsupported**, or **Insufficient info**. For more information, see [Device discovery overview](device-discovery.md).
- **IoT and OT devices**: IoT and operational technology (OT) devices — such as printers, cameras, and industrial control systems — appear in the inventory when you enable [Microsoft Defender for IoT in the Defender portal](/defender-for-iot/microsoft-defender-iot). These devices appear on the **IoT/OT devices** tab and include extra fields like device type, subtype, vendor, and model.

The **Discovery sources** column in the [device inventory](machines-view-overview.md) tells you how each device was found: **MDE** (found by the Defender for Endpoint sensor), **Microsoft Defender for IoT** (discovered by Defender for IoT), and other sources. Use this column to understand why a device appears and whether it requires onboarding. For more detail on discovery source values, see [Device inventory field reference](device-inventory-field-reference.md#discovery-sources-values).

## The device lifecycle and journey

Managing devices in Defender for Endpoint follows a predictable lifecycle. The following table outlines the key stages, tasks, roles involved, and related documentation:

| Stage | Tasks | Roles involved | Learn more |
|-------|-------|----------------|------------|
| **Discover and onboard devices** | • Discover devices on your network<br>• Onboard devices with the Defender for Endpoint agent<br>• View devices in the device inventory<br>• Assess risk levels and exposure scores | Security Administrator<br>IT Operations | [Explore devices in the device inventory](machines-view-overview.md)<br>[Onboard devices](onboarding.md)<br>[Configure device discovery](configure-device-discovery.md) |
| **Manage scope and relevance** | • Filter out transient devices (automatic)<br>• Exclude devices from vulnerability management (manual)<br>• Determine which devices require security attention | Security Administrator | [Manage device scope and relevance](manage-device-scope-relevance.md) |
| **Classify and organize with tags and exclusions** | • Add manual tags to individual devices<br>• Create dynamic tags using rules<br>• Organize devices into meaningful groups<br>• Apply tags for business context | Security Administrator<br>Security Analyst | [Create and manage device tags](machine-tags.md) |
| **Target devices for security actions** | • Use device groups for role-based access<br>• Collect custom telemetry from device groups<br>• Apply automation rules to tagged devices<br>• Deploy security policies to device groups | Security Administrator<br>Security Analyst | [Create and manage device tags and target devices](machine-tags.md)<br>[Custom data collection](custom-data-collection.md) |
| **Investigate devices** | • Review device timelines<br>• Investigate alerts and incidents<br>• Identify internet-facing devices<br>• Hunt for threats across device groups<br>• Take response actions | Security Analyst<br>Security Administrator | [Investigate devices](investigate-machines.md)<br>[Review device timeline](investigate-machines.md#investigate-device-timeline)<br>[Identify internet-facing devices](investigate-machines.md#investigate-internet-facing-devices) |
| **Monitor and maintain** | • Monitor device health status<br>• Fix unhealthy sensors<br>• Review sensor health reports<br>• Track onboarding status | IT Operations<br>Security Administrator | [Fix unhealthy sensors](fix-unhealthy-sensors.md)<br>[Device health reports](device-health-microsoft-defender-antivirus-health.md) |

## Device targeting

Device targeting uses device tags to identify which devices should receive specific security actions. Rather than managing devices individually, targeting lets you organize devices into meaningful groups and apply configurations, policies, or data collection rules at scale.

### Security actions powered by targeting

Device tags and groups enable you to apply security operations across multiple areas:

| Security action | Description | Scenarios | Learn more |
|-----------------|-------------|-----------|------------|
| **Investigations and threat hunting** | Filter alerts and scope investigations to specific device groups | • Investigate all "Finance-Department" devices for suspicious activity<br>• Hunt for threats across "Windows-Servers" in a specific region<br>• Track devices involved in a compromise using incident tags | [Advanced hunting](/defender-xdr/advanced-hunting-overview) |
| **Custom data collection** | Collect specialized telemetry from devices with dynamic tags | • Collect file events from "Database-Servers"<br>• Capture network connections from "Developer-Workstations"<br>• Monitor script execution on "Administrative-Systems" | [Custom data collection](custom-data-collection.md)<br>[Create custom data collection rules](create-custom-data-collection-rules.md) |
| **Automation rules** | Apply automated response actions to device categories | • Auto-isolate "Public-Kiosk" devices if malware is detected<br>• Run forensic collection on "Critical-Servers" during incidents<br>• Restrict "BYOD-Devices" from sensitive resources | [Automated investigation and response](/defender-xdr/m365d-configure-auto-investigation-response) |
| **Device groups for role-based access** | Control which security analysts can see and act on specific devices | • Finance Security Team manages only "Finance-Department" devices<br>• Regional teams manage devices in their geographic locations<br>• Junior analysts access only "Non-Production" device groups | [Create and manage device groups](machine-groups.md) |
| **Attack surface reduction rules** | Deploy different security controls to different device types | • Strict blocking rules on "Internet-Facing-Servers"<br>• Audit mode on "Development-Machines"<br>• Standard baseline for general user workstations | [Attack surface reduction rules](/defender-endpoint/attack-surface-reduction-rules-deployment) |
| **Conditional Access policies** | Enforce access controls based on device security posture and tags | • Require MFA for "High-Risk-Devices"<br>• Block "Non-Compliant-Devices" from corporate resources<br>• Allow "Managed-BYOD" limited access to approved services | [Conditional Access with Intune](/mem/intune/protect/advanced-threat-protection) |
