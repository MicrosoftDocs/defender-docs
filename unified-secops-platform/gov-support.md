---
title: Support for US Government customers
description: Learn about support for Microsoft's unified SecOps platform for US Government clouds.
author: batamig
ms.author: bagol
ms.service: unified-secops-platform
ms.topic: concept-article #Don't change.
ms.date: 11/10/2024
ms.collection:
- usx-security


#customer intent: As a US government cloud customer, I want to understand the support available for me in Microsoft's unified security operations platform.

---

# Microsoft's unified security operations platform for US Government customers

This article provides information about Microsoft's unified security operations (SecOps) platform for US Government customers.

## Feature availability

- All features in Microsoft's SecOps platform that are in general availability are available in both commercial and GCC High and DoD clouds. 
- Features still in preview are available only in the commercial cloud.

While [automatic attack disruption](/defender-xdr/automatic-attack-disruption) with Microsoft Defender XDR is generally available, [SAP support for attack disruption](/defender-xdr/automatic-attack-disruption) with Microsoft's unified SecOps platform is available only in the commercial cloud.

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
