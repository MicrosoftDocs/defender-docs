---
title: Deploy updates for Microsoft Defender for Endpoint on Linux
description: Describes how to deploy updates for Microsoft Defender for Endpoint on Linux in enterprise environments.
ms.service: defender-endpoint
ms.author: deniseb
author: deniseb
ms.reviewer: gopkr
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-linux
ms.topic: conceptual
ms.subservice: linux
search.appverid: met150
ms.date: 12/16/2024
---

# Deploy updates for Microsoft Defender for Endpoint on Linux

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to**:

- Microsoft Defender for Endpoint Server
- [Microsoft Defender for Servers](/azure/defender-for-cloud/integration-defender-for-endpoint)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=en-us&country=us)

Microsoft regularly publishes software updates to improve performance, security, and to deliver new features.

> [!WARNING]
> Each version of Defender for Endpoint on Linux is set to expire automatically after 9 months. While expired versions continue to receive security intelligence updates, install the latest version to get all available fixes and enhancements.
> To check the expiration date, run the following command:
>
> ```bash
> mdatp health --field product_expiration
> ```
>
> Expired clients report a health issue and warning message when you run the following command:
>
> ```bash
> mdatp health
> ```
>
> Indicators of an expired client include the message, "**ATTENTION: No license found. Contact your administrator for help**." with the following attributes:
>
> ```bash
> ATTENTION: No license found. Contact your administrator for help.
> healthy                                     : false
> health_issues                               : ["missing license"]
> licensed                                    : false
> ```

Defender for Endpoint capabilities that are generally available are equivalent, regardless of which update channel is used for deployment (Beta (Insider), Preview (External), Current (Production)).

To update Defender for Endpoint on Linux manually, run one of the following commands:

## RHEL and variants (CentOS and Oracle Linux)

```bash
sudo yum update mdatp
```

## SLES and variants

```bash
sudo zypper update mdatp
```

## Ubuntu and Debian systems

```bash
sudo apt-get install --only-upgrade mdatp
```

> [!IMPORTANT]
> When Defender for Cloud is provisioning the Microsoft Defender for Endpoint agent to Linux servers, it keeps the client updated automatically.

To schedule an update of Microsoft Defender for Endpoint on Linux, see [Schedule an update for Microsoft Defender for Endpoint on Linux](linux-update-mde-linux.md).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
