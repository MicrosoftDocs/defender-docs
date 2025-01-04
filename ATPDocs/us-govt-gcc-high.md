---
title: US Government offerings
description: This article provides an overview of Microsoft Defender for Identity's US Government offerings.
ms.date: 02/14/2023
ms.topic: overview
---

# Microsoft Defender for Identity for US Government offerings

The Microsoft Defender for Identity GCC High offering uses the same underlying technologies and capabilities as the commercial workspace for Defender for Identity.

## Get started with US Government offerings

The Defender for Identity GCC, GCC High, and Department of Defense (DoD) offerings are built on the Microsoft Azure Government Cloud and are designed to inter-operate with Microsoft 365 GCC, GCC High, and DoD. Use Defender for Identity public documentation as a [starting point](deploy-defender-identity.md) for deploying and operating the service.

## Licensing requirements

Defender for Identity for US Government customers requires one of the following Microsoft volume licensing offers:

| **GCC**                                   | **GCC High**                              | **DoD**                                   |
| ----------------------------------------- | ----------------------------------------- | ----------------------------------------- |
| Microsoft 365 GCC G5                      | Microsoft 365 E5 for GCC High             | Microsoft 365 G5 for DOD                  |
| Microsoft 365 G5 Security GCC             | Microsoft 365 G5 Security for GCC High    | Microsoft 365 G5 Security for DOD         |
| Standalone Defender for Identity licenses | Standalone Defender for Identity licenses | Standalone Defender for Identity licenses |

## URLs

To access Microsoft Defender for Identity for US Government offerings, use the appropriate addresses in this table:

| US Government offering | Microsoft Defender portal | Sensor (agent) endpoint                           |
|------------------------|-------------------------------|---------------------------------------------------|
|DoD                     | `security.microsoft.us`       | `<your-workspace-name>sensorapi.atp.azure.us`      |
|GCC-H                   | `security.microsoft.us`       | `<your-workspace-name>sensorapi.atp.azure.us`      |
|GCC                     | `security.microsoft.com`      | `<your-workspace-name>sensorapi.gcc.atp.azure.com` |

You can also use the IP address ranges in our Azure service tag (**AzureAdvancedThreatProtection**) to enable access to Defender for Identity. For more information about service tags, see [Virtual network service tags](/azure/virtual-network/service-tags-overview) or download [the Azure IP Ranges and Service Tags – US Government Cloud file](https://www.microsoft.com/download/details.aspx?id=57063).

## Required connectivity settings

Use [this link](prerequisites.md#required-ports) to configure the minimum internal ports necessary that the Defender for Identity sensor requires.

## How to migrate from commercial to GCC

>[!NOTE]
> The following steps should only be taken after you have initiated the transition of Microsoft Defender for Endpoint and Microsoft Defender for Cloud Apps

1. Go to the [Azure portal](https://portal.azure.com/) > Microsoft Entra ID > Groups
1. Rename the following three groups (where _workspaceName_ is the name of your workspace), by adding to them a " - commercial" suffix:
   - "Azure ATP _workspaceName_ Administrators" --> "Azure ATP _workspaceName_ Administrators - commercial"
   - "Azure ATP _workspaceName_ Viewers" --> "Azure ATP _workspaceName_ Viewers - commercial"
   - "Azure ATP _workspaceName_ Users" --> "Azure ATP _workspaceName_ Users - commercial"
1. In the [Microsoft Defender portal](https://security.microsoft.com), go to the Settings -> Identities section to create a new workspace for Defender for Identity
1. Configure a Directory Service account
1. Download the new sensor agent package and copy the workspace key
1. Make sure sensors have access to *.gcc.atp.azure.com (directly or through proxy)
1. Uninstall existing sensor agents from the domain controllers, AD FS servers, and AD CS servers
1. [Reinstall sensors with the new workspace key](install-sensor.md)
1. Migrate any settings after the initial sync (use the https://transition.security.microsoft.com portal in a separate browser session to compare)
1. Eventually, delete the previous workspace (historical data will be lost)

>[!NOTE]
> No data is migrated from the commercial service.

## Feature parity with the commercial environment

Unless otherwise specified, new feature releases, including preview features, documented in [What's new with Defender for Identity](whats-new.md), will be available in GCC, GCC High, and DoD environments within 90 days of release in the Defender for Identity commercial environment. Preview features may not be supported in the GCC, GCC High, and DoD environments.

## Next steps

- [Deploy Microsoft Defender for Identity with Microsoft Defender XDR](deploy-defender-identity.md)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
