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

- **Onboarding**: Devices you explicitly onboard to Defender for Endpoint with the full agent installed
- **Discovery**: Devices automatically discovered on your network through the device discovery feature

## The device lifecycle

Managing devices in Defender for Endpoint follows a predictable lifecycle:

### 1. Discover devices

Devices appear in your inventory as they're onboarded or discovered on your network. The [device inventory](machines-view-overview.md) shows all devices that Defender for Endpoint can see, including their risk levels, exposure scores, and health status.

**Start here**: [Device inventory](machines-view-overview.md)

### 2. Manage scope and relevance

Not all discovered devices require the same level of attention. You'll need to determine which devices are relevant to your security operations and which represent noise in your inventory.

- **Automatic filtering**: Transient devices (like temporary guest devices) are automatically tagged to reduce noise
- **Manual exclusion**: Remove specific devices from vulnerability management exposure calculations when they're out of scope

**Next step**: [Manage device scope and relevance](manage-device-scope-relevance.md)

### 3. Classify and organize with tags

Tags let you add business context to devices and organize them into meaningful groups. Tags are essential for targeting security actions, investigations, and automation.

- **Manual tags**: Add custom labels to individual devices
- **Dynamic tags**: Automatically apply tags based on device properties using rules

**Add context**: [Create and manage device tags](machine-tags.md)

### 4. Target devices for actions

Once devices are organized with tags, you can use those tags to target specific device groups for security actions:

- **Investigations**: Filter alerts and events by device groups
- **Custom data collection**: Collect specialized telemetry from specific device sets
- **Automation rules**: Apply automated response actions to tagged devices
- **Security policies**: Deploy configurations to device groups

**Take action**: [Targeting devices in Microsoft Defender for Endpoint](targeting-devices.md)

## Roles and responsibilities

Different roles interact with devices in different ways:

| Role | Primary tasks | Key pages |
|------|--------------|-----------|
| **Security Administrator** | Onboard devices, configure discovery, manage device groups, set up targeting rules | Device inventory, Manage scope & relevance, Device tags |
| **Security Analyst** | Investigate alerts, assess device risk, respond to incidents, hunt for threats | Device inventory, Device pages, Advanced hunting |
| **IT Operations** | Maintain device health, troubleshoot sensor issues, manage device lifecycle | Device inventory, Sensor health reports |

## Navigation hub

Use these pages to manage devices in Microsoft Defender for Endpoint:

### Core device management

- **[Device inventory](machines-view-overview.md)**: View all devices, assess risk and exposure, sort and filter your inventory
- **[Manage device scope and relevance](manage-device-scope-relevance.md)**: Control which devices are relevant to your security operations
- **[Create and manage device tags](machine-tags.md)**: Add business context and organize devices into groups

### Advanced capabilities

- **[Targeting devices](targeting-devices.md)**: Understand how device tags enable security actions at scale
- **[Custom data collection](custom-data-collection.md)**: Collect specialized telemetry from specific device groups
- **[Create custom data collection rules](create-custom-data-collection-rules.md)**: Configure rules to collect custom telemetry

### Device discovery and onboarding

- **[Device discovery overview](device-discovery.md)**: Automatically discover devices on your network
- **[Onboarding devices](onboarding.md)**: Deploy the Defender for Endpoint agent to devices

### Device health and troubleshooting

- **[Fix unhealthy sensors](fix-unhealthy-sensors.md)**: Resolve device health issues
- **[Device health reports](device-health-microsoft-defender-antivirus-health.md)**: Monitor antivirus and sensor health across devices

## Next steps

Start with the device inventory to see all devices in your environment:

- [View your device inventory](machines-view-overview.md)
- [Onboard devices to Defender for Endpoint](onboarding.md)
- [Configure device discovery](configure-device-discovery.md)
