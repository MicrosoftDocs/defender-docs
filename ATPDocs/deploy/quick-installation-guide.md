---
title: Quick installation guide | Microsoft Defender for Identity
description: Learn how to quickly install Microsoft Defender for Identity on Active Directory, Active Directory Federation Services (AD FS), or Active Directory Certificate Services (AD CS) servers.
ms.date: 13/05/2025
ms.topic: how-to
---

# Quick installation guide

### Minimum system requirements

This section describes the operating systems supported for Defender for Identity sensor installations. Installing a Defender for Identity sensor requires a minimum of two cores, 6 GB of RAM, and 6 GB of disk space installed on your domain controller.

When running as a virtual machine, all memory is required to be allocated to the virtual machine at all times. For more information, see [Plan capacity for Microsoft Defender for Identity deployment](capacity-planning.md).

[!INCLUDE [server-requirements](../includes/server-requirements.md)]


- To get your workspace name, see the [About page](https://security.microsoft.com/settings/identities) in the portal.
- For proxy configuration, see [Configure endpoint proxy and internet connectivity settings](configure-proxy.md).

### Schedule a maintenance window (optional)

During installation, if .NET Framework 4.7 or later isn't installed, the .NET Framework 4.7 will be installed and might require a reboot of the server. A reboot might also be required if there's a restart already pending.

When installing your sensors, consider scheduling a maintenance window for your domain controllers.







>


