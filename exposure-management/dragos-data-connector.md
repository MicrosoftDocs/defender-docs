---
title: Integrate the Dragos OT data connector in Microsoft Security Exposure Management
description: Learn how to set up the Dragos OT data connector in Microsoft Security Exposure Management.
author: limwainstein
ms.author: lwainstein
ms.service: exposure-management
ms.topic: how-to
ms.date: 07/07/2026
ms.custom: msecd-doc-authoring-1015
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to connect Dragos to Microsoft Security Exposure Management so that I can bring Dragos OT data into the Defender portal.
---

# Connect the Dragos OT data connector

The Dragos OT data connector lets you bring OT data from Dragos into Microsoft Security Exposure Management.

## Prerequisites

Before you configure the Dragos OT data connector, make sure you have:

- [Access to the Microsoft Defender portal](prerequisites.md).

- [Permissions to manage data connectors](configure-data-connectors.md#roles--permissions).

- Your Dragos **Hostname**, **API Key**, and **API Secret**.

## Data retrieved by the connector

The Dragos OT data connector retrieves the following asset and device properties:

- Device name (hostname)
- IP address
- MAC address
- Domain
- Operating system details, including OS platform, OS platform friendly name, and kernel version
- Vendor
- Model
- Firmware version
- Serial number
- Device type
- Device subtype
- Sensor associations
- Zone
- Dragos criticality

## Connect the Dragos OT data connector

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).

1. Go to **System** > **Data management** > **Data connectors**.

1. In **Unified connectors**, select **Catalog**.

1. Select **Dragos**.

1. Select **Add new instance**.

1. In **Connector name**, enter a name for the connector instance.

1. In **Hostname**, enter your Dragos hostname without the `http://` or `https://` prefix.

1. In **API Key**, enter the API key from Dragos.

1. In **API Secret**, enter the API secret from Dragos.

1. Select **Next**.

1. Confirm that **MSEM (Microsoft Security Exposure Management)** is selected.

1. Select **Next**.

1. Review the connector details.

1. Select **Connect**.

## Verify the connection

1. In the Microsoft Defender portal, go to **System** > **Data management** > **Data connectors**.

1. In **Unified connectors**, select **My connectors**.

1. Confirm that the Dragos connector instance appears with a connected status.

## Related content

- [OT data connectors](ot-data-connectors.md)
- [Connect the Armis OT data connector](armis-data-connector.md)
- [Connect the Forescout OT data connector](forescout-data-connector.md)
- [Getting value from your data connectors](value-data-connectors.md)