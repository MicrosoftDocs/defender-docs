---
title: OT data connectors in Microsoft Security Exposure Management
description: Learn how OT data connectors enrich Microsoft Security Exposure Management with third-party operational technology asset and vulnerability data.
author: limwainstein
ms.author: lwainstein
ms.service: exposure-management
ms.topic: overview
ms.date: 07/07/2026
ms.custom: msecd-doc-authoring-1015
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to understand OT data connectors so that I can bring OT asset and vulnerability data into Microsoft Security Exposure Management.
---

# OT data connectors in Microsoft Security Exposure Management

Operational technology (OT) data connectors let you bring OT asset and vulnerability data from supported third-party OT platforms into [Microsoft Security Exposure Management](microsoft-security-exposure-management.md).

After an OT connector is configured, Exposure Management uses the ingested data to enrich device inventory, improve asset context, and help security teams investigate exposure across IT and OT environments.

## Supported OT data connectors

Microsoft Security Exposure Management supports the following OT data connectors:

- [Armis](armis-data-connector.md)
- [Dragos](dragos-data-connector.md)
- [Forescout](forescout-data-connector.md)

## OT data in Exposure Management

OT data connectors bring OT device, asset, and vulnerability data from supported third-party OT platforms into the Defender portal. This data helps security teams view OT assets alongside other devices and investigate OT exposure without switching between separate tools.

OT connectors can provide data such as:

- OT device and asset information
- Device identifiers, such as hostnames, IP addresses, MAC addresses, and serial numbers
- Device type, subtype, vendor, model, firmware, and operating system details
- Location, zone, site, sensor, or network association information
- Asset criticality or device importance values from the connected OT platform
- Vulnerability findings associated with OT devices

The exact properties depend on the OT platform and connector.

## OT device visibility

OT data connectors enrich device inventory with OT device details from supported third-party OT platforms. This helps security teams view IT, IoT, and OT devices in a single inventory experience.

In device inventory, OT data can help you:

- Identify OT devices discovered by third-party OT platforms.
- View OT-specific device details, such as device type, vendor, model, firmware, and site.
- Filter devices by OT-related properties, such as discovery source, firmware version, and site.
- Open a device page to review available OT context for a specific asset.

:::image type="content" source="media/ot-data-connectors/ot-device-inventory.png" alt-text="Screenshot of OT devices in device inventory." lightbox="media/ot-data-connectors/ot-device-inventory.png":::

## OT vulnerability visibility

OT data connectors can also bring vulnerability findings associated with OT devices into Defender portal vulnerability experiences.

This helps security teams:

- View OT vulnerabilities together with other vulnerability data.
- Search for CVEs and review affected OT devices.
- Open a device page to review vulnerabilities discovered for that device.
- Understand vulnerability impact across IT and OT environments.

:::image type="content" source="media/ot-data-connectors/ot-vulnerabilities.png" alt-text="Screenshot of OT vulnerabilities in the Defender portal." lightbox="media/ot-data-connectors/ot-vulnerabilities.png":::

## Related content

- [Connect the Armis OT data connector](armis-data-connector.md)
- [Connect the Dragos OT data connector](dragos-data-connector.md)
- [Connect the Forescout OT data connector](forescout-data-connector.md)
- [Configure your data connectors](configure-data-connectors.md)
- [Getting value from your data connectors](value-data-connectors.md)