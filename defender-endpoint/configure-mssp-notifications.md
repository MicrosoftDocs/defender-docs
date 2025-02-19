---
title: Configure alert notifications that are sent to MSSPs
description: Configure alert notifications that are sent to MSSPs
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.topic: conceptual
search.appverid: met150
ms.date: 12/18/2020
---

# Configure alert notifications that are sent to MSSPs

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

> [!NOTE]
> This step can be done by either the MSSP customer or MSSP. MSSPs must be granted the appropriate permissions to configure this on behalf of the MSSP customer.

After access the portal is granted, alert notification rules can be created so that emails are sent to MSSPs when alerts associated with the tenant are created and set conditions are met.

For more information, see [Create rules for alert notifications](/defender-xdr/configure-email-notifications#create-rules-for-alert-notifications).

These check boxes must be checked:

- **Include organization name** - The customer name will be added to email notifications
- **Include tenant-specific portal link** - Alert link URL will have tenant specific parameter (tid=target_tenant_id) that allows direct access to target tenant portal

## Related topics

- [Grant MSSP access to the portal](grant-mssp-access.md)
- [Access the MSSP customer portal](access-mssp-portal.md)
- [Fetch alerts from customer tenant](api/fetch-alerts-mssp.md)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
