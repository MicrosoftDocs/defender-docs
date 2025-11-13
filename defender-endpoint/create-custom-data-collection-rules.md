---
title: Custom data collection in Microsoft Defender for Endpoint
description: Custom data collection allows organizations to tailor telemetry collection to their specific threat hunting needs with customizable filters and enhanced visibility.
ms.service: defender-endpoint
f1.keywords: 
  - NOCSH
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
  - usx-security
ms.topic: concept-article
search.appverid: 
  - MOE150
  - MET150
ms.date: 11/12/2025
appliesto:
  - Microsoft Defender for Endpoint
---

# Custom data collection in Microsoft Defender for Endpoint (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Custom data collection (Preview) enables organizations to expand and customize telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs. This feature allows security teams to define specific collection rules with tailored filters for event properties such as folder paths, process names, and network connections.

This article provides an overview of custom data collection so that you can understand its capabilities and how it enhances your security visibility and threat hunting operations.

## Collection rules and filtering

Collection rules define what events to capture based on configurable filters:

- **Property-based filters**: Target specific event properties such as folder paths, process names, file extensions, or network ports
- **Device targeting**: Apply rules to specific device groups using dynamic tags from Asset Rule Management
- **Event limits**: Each collection rule is limited to 25,000 events for operational safety and performance

## Prerequisites and requirements

To use custom data collection, you need:

- **Microsoft Defender for Endpoint P2 license**
- **Connected Microsoft Sentinel workspace** - Required for custom data storage and querying
- **Minimum client version**: 10.8797 (Windows only)
- **Dynamic tags configured** in Asset Rule Management for device targeting

### Supported platforms

- **Windows**: Minimum client version 10.8797
- **Windows 10**: Requires enrollment in Extended Security Updates (ESU) program
- **Linux and macOS**: Planned for future releases

### Performance and limits

- Collection rules are limited to 25,000 events each for performance protection
- Rule deployment typically takes 20 minutes to 1 hour
- Custom collection operates alongside default telemetry without interference

### Data costs

Custom data collection is included with Microsoft Defender for Endpoint P2 licensing. However, data ingestion into Microsoft Sentinel workspaces incurs charges based on your Sentinel billing arrangement.

## Instructions for Using MDE Custom Data Collection

## 1. Connect Your Sentinel Workspace

1. In the Defender portal, go to **Settings** > **Microsoft Sentinel**.
2. Connect your Sentinel workspace.

> [!NOTE]
> If you've already connected your workspace, you can skip this step.

## 2. Navigate to Custom Data Collection

Go to **Settings** > **Endpoints** > **Custom Data Collection**.

## 3. Select Your Workspace

If you have multiple workspaces, select your desired workspace from the right-side pane.

> [!NOTE]
> Only a single workspace is supported in the current phase.

## 4. Create Collection Rules

1. Create new collection rules.
2. Assign tags to each rule to target specific devices.

Tags represent the devices you want the rule to apply to.

## 5. Rule Dispatch and Application

- Each rule is translated into MDE configuration and sent to the targeted machines.
- The dispatch process may take up to an hour (average ~20 minutes).

> [!TIP]
> If you encounter issues, try updating the rules to trigger retransmission.

## 6. Monitor and Troubleshoot

- Rules created during the preview may require migration in the future.
- Minimum client version required: 10.8805.
- EDR Exclusions may override custom collection rules.
- Dynamic tags update about every hour. Check the "Last run time" column for status.

If rules aren't working as expected:

- Try creating a general "collect-all" rule for the organization.
- Apply filters and tags individually to isolate issues.
- If a device isn't responding after enabling the feature, reboot the device.

### Troubleshooting
- **Rule deployment issues**: Try updating rules to trigger retransmission
- **Missing events**: Verify device tags are applied and current (updated hourly)
- **Client compatibility**: Ensure endpoints meet minimum version requirements and consider rebooting after enabling the feature

## 7. Onboarding Windows 10 Machines

1. Enroll in the Extended Security Updates (ESU) program.
2. Update machines to the latest version and follow the regular onboarding process.

## Next steps

- Learn how to [configure custom data collection rules](configure-custom-data-collection.md)
- Explore [advanced hunting with custom telemetry](advanced-hunting-custom-data.md)
- Review [best practices for custom collection rules](custom-collection-best-practices.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
