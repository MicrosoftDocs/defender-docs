---
title: Levering insights from data connectors in Microsoft Security Exposure Management
description: Learn about leveraging the data connectors in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 09/11/2024
---

# Leverage insights from data connectors

[Microsoft Security Exposure Management](microsoft-security-exposure-management.md) consolidates security posture data from all your digital assets enabling you to map your attack surface and focus your security efforts on areas at greatest risk. The data from Microsoft products gets ingested automatically once connected to Exposure Management, and you can add more data connectors from external data sources.

## Imported assets and types

There are various types of assets available for consumption, such as digital assets, customer relationship management (CRM) systems, and mobile applications.

- Devices
- Vulnerabilities
- Users (future)
- Software (future)
- SaaS Applications   (future)

The asset information imported into Exposure Management includes data from external data sources like Qualys, Rapid7, and ServiceNow CMDB environments. This data is consolidated to provide a comprehensive view of the security posture across all digital assets.

## Viewing the imported data

The data from the imported assets will appear in the device inventories and the exposure graph. Exposure Management also offers integration with critical asset protection, attack paths, metrics, and initiatives. It provides insights into potential attack paths and entry points that could compromise critical assets. It also offers metrics and recommendations to help prioritize actions to protect these assets.

The information brought into the system includes:

- Device and service data from systems, including OS
- Distribution
- Interfaces
- Network details
- Last users  

[INSERT IMAGE]

## Next steps

[Configuring your data connectors](configure-data-connectors.md)