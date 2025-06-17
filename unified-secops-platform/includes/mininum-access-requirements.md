---
title: Include file
description: Include file
ms.topic: include
ms.date: 04/22/2025
---

The minimal required permission for an analyst to view Microsoft Sentinel data is to delegate permissions for the Azure RBAC Sentinel Reader role. These permissions are also applied to the unified portal. Without these permissions, the Microsoft Sentinel navigation menu isn't available on the unified portal, despite the analyst having access to the Microsoft Defender portal.

A best practice is to have all Microsoft Sentinel related resources in the same Azure resource group, then delegate Microsoft Sentinel role permissions (like the Sentinel Reader role) at the resource group level that contains the Microsoft Sentinel workspace. By doing this, the role assignment applies to all the resources that support Microsoft Sentinel.