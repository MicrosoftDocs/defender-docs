---
title: Access the Microsoft Defender XDR MSSP customer portal
description: Access the Microsoft Defender XDR MSSP customer portal
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.topic: how-to
ms.date: 12/24/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Access the Microsoft Defender XDR MSSP customer portal



> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

> [!NOTE]
> These set of steps are directed towards the MSSP.

By default, MSSP customers access their Microsoft Defender XDR tenant through the following URL: `https://security.microsoft.com/`.

MSSPs however, will need to use a tenant-specific URL in the following format: `https://security.microsoft.com?tid=customer_tenant_id` to access the MSSP customer portal.

In general, MSSPs will need to be added to each of the MSSP customer's Microsoft Entra ID that they intend to manage.

Use the following steps to obtain the MSSP customer tenant ID and then use the ID to access the tenant-specific URL:

1. As an MSSP, log in to Microsoft Entra ID with your credentials.
1. Switch directory to the MSSP customer's tenant.
1. Select **Microsoft Entra ID > Properties**. You'll find the tenant ID in the Tenant ID field.
1. Access the MSSP customer portal by replacing the `customer_tenant_id` value in the following URL: `https://security.microsoft.com/?tid=customer_tenant_id`.
1. Access a Unified View for MSSP (Preview) in `https://mto.security.microsoft.com/`

## Related topics

- [Grant MSSP access to the portal](grant-mssp-access.md)
- [Configure alert notifications](configure-mssp-notifications.md)
- [Fetch alerts from customer tenant](api/fetch-alerts-mssp.md)


