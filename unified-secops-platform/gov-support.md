---
title: Microsoft Defender Portal Service Support for US Government Customers
description: Learn about support in the Microsoft Defender portal for US Government clouds.
author: batamig
ms.author: bagol
ms.service: unified-secops-platform
ms.topic: concept-article #Don't change.
ms.date: 06/22/2025
ms.collection:
- usx-security


#customer intent: As a US government cloud customer, I want to understand the support available for me in the Microsoft Defender portal.

---

# Microsoft Defender portal service support for US Government customers

This article provides information about support for US Government customers by unified security operations services in the Microsoft Defender portal.

## Feature availability

- All features in Microsoft's SecOps platform that are in general availability are available in commercial and GCC High and DoD clouds. 

  GCC is supported with the following limitation: The [Advanced hunting](/defender-xdr/advanced-hunting-overview) [JOIN operator](/defender-xdr/advanced-hunting-query-language#learn-common-query-operators) isn't supported between Defender tables and Microsoft Sentinel tables unless you configure per-table retention on your Defender tables in Log Analytics. For more information, see [Advanced hunting event collection](/azure/sentinel/microsoft-365-defender-sentinel-integration?tabs=defender-portal#advanced-hunting-event-collection).
  
- Features still in preview are available only in the commercial cloud.

For more information, see:

- [Microsoft Defender XDR for US Government customers](/defender-xdr/usgov)
- [Microsoft Sentinel feature support for Azure commercial/other clouds](/azure/sentinel/feature-availability)

## Portal URLs

The following are the Microsoft Defender portal URLs for US Government customers:

- **GCC**:	https://security.microsoft.com
- **GCC High**:	https://security.microsoft.us
- **DoD**:	https://security.apps.mil

If you are a GCC customer and are in the process of moving from Microsoft Defender for Endpoint commercial to GCC, use https://transition.security.microsoft.com to access your Microsoft Defender for Endpoint commercial data.

## API access

When using a US government cloud, you need to use the following URIs instead of the public URIs listed in our API documentation:

- **Login**:

  - **GCC**: https://login.microsoftonline.com
  - **GCC High and DoD**: https://login.microsoftonline.us

- **Microsoft Defender XDR API**:

  - **GCC**: https://api-gcc.security.microsoft.us
  - **GCC High and DoD**: https://api-gov.security.microsoft.us
