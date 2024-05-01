---
title: Overview of transient device tagging in Microsoft Defender for Endpoint
description: Learn how transient device tagging is designed in Microsoft Defender for Endpoint
ms.author: raynew
author: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 03/11/2024
---

# Identifying transient devices

Microsoft Defender for Endpoint provides transient device tagging to identify transient devices.

Transient device tagging is currently in preview.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Addressing challenges

Transient devices present challenges within device inventories. They appear for short times in the network, and so are often unknown device types. They're difficult to effectively track, classify, and audit, potentially causing inventory noise and reporting inaccuracies.

Defender for Endpoint addresses some of these issues by identifying and tagging transient devices, making the device inventory easier to manage.

## How does transient tagging work?


Transient device tagging uses an internal algorithm to tag transient devices in the inventory.

- The algorithm runs on discovered devices within the device inventory.
- The algorithm excludes specific devices from tagging. Excluded device types include: Server, NetworkDevice, Printer, Industrial, Surveillance, SmartFacility, and SmartAppliance.
- The algorithm is mainly based on the frequency with which devices appear in the network.
- Transient tagging doesn't delete any devices from the inventory. It simply tags them.

> [!IMPORTANT]
> Transient tagging doesn't delete any devices from the network. It tags them, and then it filters them out of the device inventory by default.

## How do I work with transient tagging?

Transient devices are filtered out of the inventory by default. You can turn off the filter as needed. Note that turning off the filter doesn't affect tagging. The tag remains on inventory assets identified as transient.

## Next steps

[Learn about filtering](machines-view-overview.md) in the Defender for Endpoint device inventory.

