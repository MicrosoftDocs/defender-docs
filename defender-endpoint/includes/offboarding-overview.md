---
author: paulinbar
ms.author: painbar
ms.date: 03/30/2026
ms.topic: include
ms.service: defender-endpoint
---

When you offboard a device from Defender for Endpoint, no new detections, vulnerability, or security data are sent to the Microsoft Defender portal. Seven days after offboarding a device, its status changes to [inactive](fix-unhealthy-sensors.md#inactive-devices). Devices that weren't active within the past 30 days are not factored into your organization's [exposure score](/defender-vulnerability-management/tvm-exposure-score).

Past data, such as alerts, vulnerabilities, and the device timeline, for an offboarded device is displayed in the Microsoft Defender portal until the [configured retention period](data-storage-privacy.md#data-retention) expires. You also see the device profile (without data) in the device inventory for up to 180 days. To view data for active devices only, you can use filters, such as [sensor health state](machines-view-overview.md#use-filters-to-customize-the-device-inventory-views), [device tags](machine-tags.md), or [device groups](machine-groups.md).