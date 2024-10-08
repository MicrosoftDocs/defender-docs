---
title: Assign roles and permissions
description: Configure permissions deploying Microsoft Defender for Endpoint
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
  - m365-security
  - m365solution-endpointprotect
  - m365solution-scenario
  - highpri
  - tier1
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 09/09/2024
---

# Assign roles and permissions for Microsoft Defender for Endpoint deployment

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-exposedapis-abovefoldlink)

The next step when deploying Defender for Endpoint is to assign roles and permissions for the Defender for Endpoint deployment.

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

## Role-based access control

Microsoft recommends using the concept of least privileges. Defender for Endpoint leverages built-in roles within Microsoft Entra ID. [Review the different roles available](/azure/active-directory/roles/permissions-reference) and choose the right one to solve your needs for each persona for this application. Some roles may need to be applied temporarily and removed after the deployment has been completed.

Microsoft recommends using [Privileged Identity Management](/azure/active-directory/active-directory-privileged-identity-management-configure) to manage your roles to provide additional auditing, control, and access review for users with directory permissions.

Defender for Endpoint supports two ways to manage permissions:

- **Basic permissions management**: Set permissions to either full access or read-only. Users with a role, such as Security Administrator in Microsoft Entra ID have full access. The Security reader role has read-only access and does not grant access to view machines/device inventory.

- **Role-based access control (RBAC)**: Set granular permissions by defining roles, assigning Microsoft Entra user groups to the roles, and granting the user groups access to device groups. For more information. see [Manage portal access using role-based access control](rbac.md).

Microsoft recommends leveraging RBAC to ensure that only users that have a business justification can access Defender for Endpoint.

You can find details on permission guidelines here: [Create roles and assign the role to a Microsoft Entra group](user-roles.md#create-roles-and-assign-the-role-to-an-azure-active-directory-group).

The following example table serves to identify the Cyber Defense Operations Center structure in your environment that will help you determine the RBAC structure required for your environment.

|Tier|Description|Permissions required|
|---|---|---|
|Tier 1|**Local security operations team / IT team** <br/><br/> This team usually triages and investigates alerts contained within their geolocation and escalates to Tier 2 in cases where an active remediation is required.|View data|
|Tier 2|**Regional security operations team** <br/><br/> This team can see all the devices for their region and perform remediation actions.|View data <br/><br/> Alerts investigation <br/><br/> Active remediation actions <br/><br/>|
|Tier 3|**Global security operations team** <br/><br/> This team consists of security experts and is authorized to see and perform all actions from the portal.|View data <br/><br/> Alerts investigation <br/><br/> Active remediation actions <br/><br/>  Manage portal system settings <br/><br/> Manage security settings|

## Next step

After assigning roles and permissions to view and manage Defender for Endpoint it's time for [Step 3 - Identify your architecture and choose your deployment method](deployment-strategy.md).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
