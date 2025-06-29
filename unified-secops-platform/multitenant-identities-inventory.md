---
# Required metadata
# For more information, see https://learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata
# For valid values of ms.service, ms.prod, and ms.topic, see https://learn.microsoft.com/en-us/help/platform/metadata-taxonomies

title: Multitenant identities
description: A multi-tenant identity inventory
author:      LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     06/29/2025
---

# Identities

The **Identities** page in multitenant management enables you to quickly manage tenants and identities.

## Identity inventory

The Identity inventory page lists all the identities in each tenant that you have access to. The page is like the [Defender for Identity inventory](/defender-for-identity/identity-inventory) with the addition of the **Tenant name** column and filter. 

You can navigate to the identity inventory page by selecting **Assets > Identities** in Microsoft Defender XDR's navigation menu.



The total number of identities, critical assets, disabled identities, and service accounts for all tenants are shown at the top of the page.

There are several options you can choose from to customize the identities list view. On the top navigation you can:

- Add or remove columns.

- Apply filters.

- Search for an identity by name or full UPN, SID, and Object ID.

- Export the list to a CSV file.

- Copy list link with the included filters configured.

> [!NOTE]
> When exporting the identities list to a CSV file, a maximum of 5,000 identities are displayed.

To manage a device, select a specific device from the list. Device management tasks like managing tags, device exclusion, and reporting inaccuracy becomes available at the top of the device list.

[![Screenshot of choosing a device from the device inventory list](https://learn.microsoft.com/en-us/unified-secops-platform/media/mto-tenant-devices/devices-choose-device.png)](/unified-secops-platform/media/mto-tenant-devices/devices-choose-device.png)

Selecting a device by clicking on the device name opens the device page in a new tab. You can further apply other actions on the device in the new tab.The **Devices** page in multitenant management enables you to quickly manage tenants and devices.

