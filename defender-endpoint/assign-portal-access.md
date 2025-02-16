---
title: Assign user access 
description: Assign read and write or read only access to the Microsoft Defender for Endpoint portal.
search.appverid: met150
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: conceptual
ms.date: 06/25/2024
---

# Assign user access 

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**
- Microsoft Entra ID
- Office 365
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

Defender for Endpoint supports two ways to manage permissions:

- **Basic permissions management**: Set permissions to either full access or read-only. See [Use basic permissions to access the portal](basic-permissions.md).

- **Role-based access control (RBAC)**: Set granular permissions by defining roles, assigning Microsoft Entra user groups to the roles, and granting the user groups access to device groups. For more information on RBAC, see [Manage portal access using role-based access control](rbac.md).

## Change from basic permissions to RBAC

If you have already assigned basic permissions, you can switch to RBAC anytime. Consider the following before making the switch:

- Users who have full access (users who are assigned either the Global Administrator or Security Administrator directory role in Microsoft Entra ID) are automatically assigned the default Defender for Endpoint administrator role, which also has full access. 
- Other Microsoft Entra user groups can be assigned to the Defender for Endpoint administrator role after switching to RBAC.
- Only users who are assigned the Defender for Endpoint administrator role can manage permissions using RBAC. 
- Users who have read-only access (Security Readers) lose access to the portal until they are assigned a role. Only Microsoft Entra user groups can be assigned a role under RBAC.
- After switching to RBAC, you can't switch back to using basic permissions management.

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

## Related articles

- [Create and manage device groups](machine-groups.md)
- [Zero Trust with Microsoft Defender for Endpoint](zero-trust-with-microsoft-defender-endpoint.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
