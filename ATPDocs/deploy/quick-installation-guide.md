---
title: Quick installation guide | Microsoft Defender for Identity
description: Learn how to quickly install Microsoft Defender for Identity on Active Directory, Active Directory Federation Services (AD FS), or Active Directory Certificate Services (AD CS) servers.
ms.date: 08/27/2023
ms.topic: how-to
---

# Quick installation guide

This article outlines the steps required when installing Microsoft Defender for Identity sensors on Active Directory, Active Directory Federation Services (AD FS), or Active Directory Certification Services (AD CS) servers. For more detailed instructions, see [Deploy Microsoft Defender for Identity with Microsoft Defender XDR](deploy-defender-identity.md).

Watch the following video for a step-by-step demo and to learn about:

- The importance of installing Defender for Identity sensors to protect your organization against identity-based attacks
- Downloading and installing the sensor
- Finding potential sensor and configuration health issues
- Viewing identity-related posture assessments in Microsoft Secure Score

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RW16oLB]

## Prerequisites

This section lists the prerequisites required before installing the Defender for Identity sensor, including:

- Licensing
- Permissions
- System requirements
- Recommendations for best practices

Each Defender for Identity workspace supports a multiple Active Directory forest boundary and Forest Functional Level (FFL) of Windows 2003 and above.

### Licensing requirements

Make sure that you have one of the following licenses:

[!INCLUDE [licenses](../includes/licenses.md)]

For more information, see [Licensing and privacy FAQs](/defender-for-identity/technical-faq#licensing-and-privacy).


### Required permissions

To create your Defender for Identity workspace, you need a Microsoft Entra ID tenant with at least one Security administrator.

You need at least [Security administrator](/azure/active-directory/users-groups-roles/directory-assign-admin-roles#available-roles) access on your tenant to access the **Identity** section of the Microsoft Defender XDR **Settings** area and create the workspace.

For more information, see [Microsoft Defender for Identity role groups](../role-groups.md).

### Minimum system requirements

This section describes the operating systems supported for Defender for Identity sensor installations. Installing a Defender for Identity sensor requires a minimum of 2 cores, 6 GB of RAM, and 6 GB of disk space installed on your domain controller.

When running as a virtual machine, all memory is required to be allocated to the virtual machine at all times. For more information, see [Plan capacity for Microsoft Defender for Identity deployment](capacity-planning.md).

[!INCLUDE [server-requirements](../includes/server-requirements.md)]

### Check network connectivity

Verify that the servers you intend to install Defender for Identity sensors on can reach the Defender for Identity cloud service. From each server, try accessing: `https://*your-workspace-name*sensorapi.atp.azure.com`.

- To get your workspace name, see the [About page](https://security.microsoft.com/settings/identities) in the portal.
- For proxy configuration, see [Configure endpoint proxy and internet connectivity settings](configure-proxy.md).

### Schedule a maintenance window (optional)

During installation, if .NET Framework 4.7 or later isn't installed, the .NET Framework 4.7 will be installed and might require a reboot of the server. A reboot might also be required if there's a restart already pending.

When installing your sensors, consider scheduling a maintenance window for your domain controllers.

## Install Defender for Identity


This procedure describes how to install the Defender for Identity sensor on a Windows server version 2016 or higher. Make sure that your server has the [minimum system requirements](#minimum-system-requirements).

> [!NOTE]
> Defender for Identity sensors should be installed on all domain controllers, including read-only domain controllers (RODC). If you're installing on an AD FS / AD CS farm or cluster, we recommend installing the sensor on each AD FS / AD CS server.
>

**To download and install the sensor**:

1. Download the Defender for Identity sensor from the [Microsoft Defender portal](https://security.microsoft.com).
1. Browse to **System** > **Settings** > **Identities** > **Sensors** > **Add sensor**
1. Select **Download installer** and save the file in a location you can access from your domain controller.
1. Copy the **Access key** value, which you'll need for the installation.

    > [!TIP]
    > You only need to download the installer once, as it can be used for every server in the tenant. Make sure that no pop-up blocker is blocking the download.

1. From the domain controller, run the installer you'd downloaded from Microsoft Defender XDR and follow the instructions on the screen.  


## Next step

For full installation instructions with additional details, see [Deploy Microsoft Defender for Identity with Microsoft Defender XDR](deploy-defender-identity.md).  For example, to deploy on multiple domain controllers, we recommend using the [silent installation](install-sensor.md#perform-a-defender-for-identity-silent-installation) instead.
