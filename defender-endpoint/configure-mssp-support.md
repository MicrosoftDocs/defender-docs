---
title: Configure managed security service provider support
description: Take the necessary steps to configure the MSSP integration with the Microsoft Defender for Endpoint
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.topic: conceptual
search.appverid: met150
ms.date: 07/24/2024
---

# Configure managed security service provider integration

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

## Managed security service provider partnership opportunities

Security is recognized as a key component in running an enterprise; however, some organizations might not have the capacity or expertise to have a dedicated security operations team to manage the security of their endpoints and network, others may want to have a second set of eyes to review alerts in their network.

To address this demand, managed security service providers (MSSP) offer to deliver managed detection and response (MDR) services on top of Defender for Endpoint. 

Defender for Endpoint adds partnership opportunities for this scenario and allows MSSPs to take the following actions:

- Get access to MSSP customer's Microsoft Defender portal
- Get email notifications
- Fetch alerts through security information and event management (SIEM) tools

> [!NOTE]
> The following terms are used in this article to distinguish between the service provider and service consumer:
> - MSSPs: Security organizations who monitor and manage security devices for organizations (customers).
> - MSSP customers: Organizations who engage the services of MSSPs.

## MSSP integration

To enable MSSP integration, the MSSP customer needs to grant access to their Defender for Endpoint tenant so that the MSSP can access their Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)).

After access is granted, the MSSP or customer can do the other configuration steps. In general, the following table summarizes the configuration steps to complete:

| Step | Who does it|
|---|---|
| **Grant the MSSP access to the Microsoft Defender portal**. This action grants the MSSP access to the MSSP customer's Microsoft Defender portal. | MSSP Customer |
| **Configure alert notifications sent to MSSPs**. This action lets the MSSPs know what alerts they need to address for the MSSP customer. | MSSP customer or MSSP |
| **Fetch alerts from MSSP customer's tenant into SIEM system**. This action allows MSSPs to fetch alerts in SIEM tools. | MSSP |
| **Fetch alerts from MSSP customer's tenant using APIs**. This action allows MSSPs to fetch alerts using APIs. | MSSP |

## Multitenant access for MSSPs

For information on how to implement a multitenant delegated access, see [multitenant access for Managed Security Service Providers](https://techcommunity.microsoft.com/t5/microsoft-defender-atp/multi-tenant-access-for-managed-security-service-providers/ba-p/1533440).

## Related articles

- [Grant MSSP access to the portal](grant-mssp-access.md)
- [Access the MSSP customer portal](access-mssp-portal.md)
- [Configure alert notifications](configure-mssp-notifications.md)
- [Fetch alerts from customer tenant](api/fetch-alerts-mssp.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
