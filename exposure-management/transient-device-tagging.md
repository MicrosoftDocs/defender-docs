---
title: Overview of transient device tagging in Microsoft Security Exposure Management
description: Learn how transient device tagging is designed in Microsoft Security Exposure Management
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 03/11/2024
---

# Overview - Identifying transient devices

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) provides transient device tagging to identify transient devices.

Security Exposure Management is currently in public preview.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Addressing challenges

Transient devices present challenges within device inventories. They appear for short times in the inventory, and are often unknown and unmanaged. They're difficult to effectively track, classify and audit, potentially causing inventory noise and reporting inaccuracies.

By identifying and tagging transient devices, Security Exposure Management addresses some of these issues, streamlining your device inventory and making it easier to manage.



## How does transient tagging work?


Security Exposure Management uses an internal algorithm to tag transient devices in the device inventory.

- The algorithm runs on unmanaged devices within the device inventory.
- The algorithm excludes specific devices from tagging. Excluded device types include: Server, NetworkDevice, Printer, Industrial, Surveillance, SmartFacility, and SmartAppliance.
- The algorithm is mainly based on the frequency with which devices appear in the network.
- Transient tagging doesn't delete any devices from the inventory. It simply tags them.

After tagging transient devices, by default Security Exposure Management filters them out of the device inventory.

## How do I work with transient tagging?

Transient devices are filtered out of the device inventory by default. You can turn off the filter as needed. Turning off the filter doesn't affect transient device tagging. The tag remains on inventory assets identified as transient.

## Next steps

[Review transient devices](initiatives.md) in the Defender for Endpoint device inventory.

