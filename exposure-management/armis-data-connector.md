---
title: Integrate the Armis OT data connector in Microsoft Security Exposure Management
description: Learn how to set up the Armis OT data connector in Microsoft Security Exposure Management.
author: limwainstein
ms.author: lwainstein
ms.service: exposure-management
ms.topic: how-to
ms.date: 07/07/2026
ms.custom: msecd-doc-authoring-1015
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to connect Armis to Microsoft Security Exposure Management so that I can bring Armis OT data into the Defender portal.
---

# Connect the Armis OT data connector

The Armis OT data connector lets you bring OT data from Armis into Microsoft Security Exposure Management.

## Prerequisites

Before you configure the Armis OT data connector, make sure you have:

- [Access to the Microsoft Defender portal](prerequisites.md).

- [Permissions to manage data connectors](configure-data-connectors.md#roles--permissions).

- Your Armis **Tenant Hostname**, **Client ID**, and **Client Secret**.

## Data retrieved by the connector

The Armis OT data connector retrieves the following asset and device properties:

- Device ID
- Device name
- Device category
- Device type
- Brand or vendor
- Model
- Operating system details, including OS name and OS version
- Firmware version
- Serial numbers
- Site or location
- Network interfaces
- Visibility information
- First seen
- Last seen

## Connect the Armis OT data connector

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).

1. Go to **System** > **Data management** > **Data connectors**.

1. In **Unified connectors**, select **Catalog**.

1. Select **Armis**.

1. Select **Add new instance**.

1. In **Connector name**, enter a name for the connector instance.

1. In **Tenant Hostname**, enter your Armis tenant hostname without the `http://` or `https://` prefix.

1. In **Client ID**, enter the client ID from Armis.

1. In **Client Secret**, enter the client secret from Armis.

1. Select **Next**.

1. Confirm that **MSEM (Microsoft Security Exposure Management)** is selected.

1. Select **Next**.

1. Review the connector details.

1. Select **Connect**.

## Verify the connection

1. In the Microsoft Defender portal, go to **System** > **Data management** > **Data connectors**.

1. In **Unified connectors**, select **My connectors**.

1. Confirm that the Armis connector instance appears with a connected status.

## Related content

- [OT data connectors](ot-data-connectors.md)
- [Connect the Dragos OT data connector](dragos-data-connector.md)
- [Connect the Forescout OT data connector](forescout-data-connector.md)
- [Getting value from your data connectors](value-data-connectors.md)