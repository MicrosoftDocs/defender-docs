---
title: Plan Defender for Servers roles and permissions 
description: Review roles and permissions for Microsoft Defender for Servers.
ms.topic: concept-article
ms.author: dacurwin
author: dcurwin
ms.date: 05/30/2024
---
# Plan roles and permissions for Defender for Servers

This article helps you understand how to control access to Defender for Servers. Defender for Servers is one of the paid plans provided by [Microsoft Defender for Cloud](defender-for-cloud-introduction.md).

## Before you begin

This article is the *second* article in the Defender for Servers planning guide. Before you begin, review the earlier articles:

1. [Start planning Defender for Servers deployment](plan-defender-for-servers.md).


## Determine ownership and access

It's critical that you identify ownership for server and endpoint security in your organization.Ownership that's undefined or hidden increases security risk, making it more difficult for SecOps team to identity and follow threats across enterprise silos.

- Security leadership should identify the teams, roles, and individuals that are responsible for making and implementing decisions about server security. [Review cloud security functions](/azure/cloud-adoption-framework/organize/cloud-security) to get started.
- Responsibility is usually is shared between a [central IT team](/azure/cloud-adoption-framework/organize/central-it) and a [cloud infrastructure and endpoint security team](/azure/cloud-adoption-framework/organize/cloud-security-infrastructure-endpoint). Individuals on these teams need Azure access rights to manage and use Defender for Cloud.
- During planning, determine the right level of access for individuals based on the Defender for Cloud role-based access control (RBAC) model.

## Defender for Cloud roles

In addition to the built-in Owner, Contributor, and Reader roles for an Azure subscription and resource group, Defender for Cloud has built-in roles to control access.

Learn more about [roles and allowed actions](permissions.md#roles-and-allowed-actions) in Defender for Cloud.

## Next steps

After you work through these planning steps, [decide which Defender for Servers plan](defender-for-servers-overview.md) is right for your organization.
