---
title: Integrate the Forescout OT data connector in Microsoft Security Exposure Management
description: Learn how to set up the Forescout OT data connector in Microsoft Security Exposure Management.
author: limwainstein
ms.author: lwainstein
ms.service: exposure-management
ms.topic: how-to
ms.date: 07/07/2026
ms.custom: msecd-doc-authoring-1015
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to connect Forescout to Microsoft Security Exposure Management so that I can bring Forescout OT data into the Defender portal.
---

# Connect the Forescout OT data connector

The Forescout operational technology (OT) data connector lets you bring OT asset and vulnerability data from Forescout into Microsoft Security Exposure Management.

## Prerequisites

Before you configure the Forescout OT data connector, make sure you have:

- [Access to the Microsoft Defender portal](prerequisites.md).

- [Permissions to manage data connectors](configure-data-connectors.md#roles--permissions).

- Your Forescout **Endpoint** and **API Key**.

## Data retrieved by the connector

The Forescout OT data connector retrieves the following asset and device properties:

- Device name (hostname)
- MAC addresses
- IP addresses
- Operating system details
- Vendor
- Model
- Firmware version
- Device category or type
- Serial number
- Device criticality
- Associated edge collectors
- Last seen

## Connect the Forescout OT data connector

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).

1. Go to **System** > **Data management** > **Data connectors**.

1. In **Unified connectors**, select **Catalog**.

1. Select **Forescout**.

1. Select **Add new instance**.

1. In **Connector name**, enter a name for the connector instance.

1. In **Endpoint**, enter your Forescout endpoint without the `http://` or `https://` prefix.

1. In **API Key**, enter the API key from Forescout.

1. Select **Next**.

1. Confirm that **MSEM (Microsoft Security Exposure Management)** is selected.

1. Select **Next**.

1. Review the connector details.

1. Select **Connect**.

## Verify the connection

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).

1. Go to **System** > **Data management** > **Data connectors**.

1. In **Unified connectors**, select **My connectors**.

1. Confirm that the Forescout connector instance appears with a connected status.

## Related content

- [OT data connectors](ot-data-connectors.md)
- [Connect the Armis OT data connector](armis-data-connector.md)
- [Connect the Dragos OT data connector](dragos-data-connector.md)
- [Getting value from your data connectors](value-data-connectors.md)