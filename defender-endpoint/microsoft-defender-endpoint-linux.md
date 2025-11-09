---
title: Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr, pahuijbr, megphapriya
description: Describes how to install and use Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: bagol
author: batamig
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: article
ms.subservice: linux
search.appverid: met150
ms.date: 03/31/2025
appliesto:
  - Microsoft Defender for Business
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Install Defender for Endpoint on Linux

[Defender for Endpoint](microsoft-defender-endpoint.md) supports Linux servers, including Arm64-based Linux servers. This article is aimed at security admins who want to learn how to install and use Defender for Endpoint on Linux servers.

## Prerequisites

To install Defender for Endpoint on Linux, you need the following:

* Administrative privileges on the Linux server endpoint.
* An appropriate [role](/defender-endpoint/prepare-deployment#role-based-access-control) assigned in Defender for Endpoint. 
* `*.endpoint.security.microsoft.com` access. If needed, you can [configure static proxy access](linux-static-proxy-configuration.md).
* Installed *systemd* system manager.

### Minimum system requirements

* **CPU** - One CPU core
* **Disk Space** - 2GB
* **Memory** - 1GB of RAM

## Supported Linux distributions

|Distribution  |Version  |x64 (AMD64/EM64T)  |
|---------|---------|---------|
|Alma     |8.4 and higher         |         |
|Amazon Linux     |2</br>2023         |2</br>2023         |
|CentOS     |7.2 and higher, excluding CentOS Stream         |         |
|Debian     |9 - 12         |11</br>12         |
|Fedora     |33 - 42         |         |
|Mariner     |2         |         |
|Oracle Linux     |7.2 and higher         |8.x</br>9.x         |
|Red Hat Enterprise Linux     |7.2 and higher         |         |
|RHEL     |         |8.x</br>9.x         |
|Rocky     |8.7 and higher         |         |
|SUSE Linux Enterprise Server     |12.x</br>15.x         |SP5</br>SP6          |
|Ubuntu     |16.04 LTS</br>18.04 LTS</br>20.04 LTS</br>22.04 LTS</br>24.04 LTS         |20.04</br>22.04</br>24.04         |

  
## Deploy and configure policies for Defender for Endpoint on Linux

There are several methods and tools that you can use to deploy Microsoft Defender for Endpoint on Linux. Make sure to meet the [prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md).

- [Installer script based deployment](/defender-endpoint/linux-installer-script)
- [Ansible based deployment](/defender-endpoint/linux-install-with-ansible)
- [Chef based deployment](/defender-endpoint/linux-deploy-defender-for-endpoint-with-chef)
- [Puppet based deployment](/defender-endpoint/linux-install-with-puppet)
- [SaltStack based deployment](/defender-endpoint/linux-install-with-saltack)
- [Manual deployment](/defender-endpoint/linux-install-manually)
- [Direct onboarding with Defender for Cloud](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint)
- [Deployment guidance for Defender for Endpoint on Linux Server with SAP](/defender-endpoint/mde-linux-deployment-on-sap)

> [!IMPORTANT]
> Installing Microsoft Defender for Endpoint in any location other than the default install path isn't supported. On Linux, Microsoft Defender for Endpoint creates an mdatp user with random UID and GID values. If you want to control these values, create an mdatp user before installation using the /usr/sbin/nologin shell option. Here's an example: `mdatp:x:UID:GID::/home/mdatp:/usr/sbin/nologin`.

If you experience any installation issues, self-troubleshooting resources are available. See the links in the [See also](#see-also) section.

### Configure policies for Defender for Endpoint on Linux

To configure Defender for Endpoint on Linux, you can choose from two options to configure policies:

- [Enroll in Defender for Endpoint security settings management](/defender-endpoint/mde-security-settings-management) and use the Microsoft Defender portal to configure and manage your policies
- [Set up a configuration profile that uses a json file](/defender-endpoint/linux-preferences?branch=main&branchFallbackFrom=pr-en-us-2468%22%20%5Cl%20%22configuration-profile)

For more information, see [Configure security settings and policies for Defender for Endpoint on Linux](/defender-endpoint/linux-preferences).

## Software updates

Microsoft publishes software updates for Defender for Endpoint on Linux to improve performance, improve security, and deliver new features. Software updates are released on a monthly basis, following testing, and verification. Occasionally, it can take more than 30 days between releases. For more information, see [What's new in Defender for Endpoint on Linux](/defender-endpoint/linux-whatsnew)

Each version of Defender for Endpoint on Linux is set to expire automatically after nine months. We recommend using current versions so you get available enhancements and fixes. For more information, see [How to deploy updates for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-updates)

## Device health reporting

The Device Health report provides information about the antivirus status of Linux servers, including details such as antivirus mode, scan results, platform version, antivirus engine version, and security intelligence version. 

You can access this information either through the portal or via API. For more information, see the following articles:

- [Device health reporting in Microsoft Defender for Endpoint](/defender-endpoint/device-health-microsoft-defender-antivirus-health)
- [Microsoft Defender Antivirus export device antivirus health details API methods and properties](/defender-endpoint/device-health-microsoft-defender-antivirus-health)

## Response actions and live response 

The security operations team can remotely connect to a device and execute various response actions such as running an antivirus scan, isolating the device, and collecting investigation packages.

Additionally, they can use live response for a remote shell connection to perform in-depth investigative work. For more information, see the following articles:

- [Take response actions on a device](/defender-endpoint/respond-machine-alerts)
- [Investigate entities on devices using live response](/defender-endpoint/live-response)

## Privacy

Microsoft is committed to providing you with the information and controls you need to make choices about how your data is collected and used when you're using Defender for Endpoint on Linux.
  
For more information, see [Privacy for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-privacy).

## Common applications that Defender for Endpoint impacts 

High I/O workloads from certain applications can experience performance issues when Defender for Endpoint is installed. Such applications for developer scenarios include Jenkins and Jira, and database workloads like OracleDB and Postgres. 

If you see performance degradation, consider setting exclusions for trusted applications. See the following articles:

- [Configure and validate exclusions for Defender for Endpoint on Linux](/defender-endpoint/linux-exclusions)
- [Review common Exclusion Mistakes for Microsoft Defender Antivirus](/defender-endpoint/common-exclusion-mistakes-microsoft-defender-antivirus)
  
If you're using non-Microsoft applications, also see their documentation regarding antivirus exclusions.

## Next steps

- [Review the prerequisites for Defender for Endpoint on Linux](/defender-endpoint/mde-linux-prerequisites)
- [Deploy Defender for Endpoint on Linux](/defender-endpoint/linux-installer-script)
- [Configure Defender for Endpoint on Linux](/defender-endpoint/linux-preferences)
- [Deploy updates for Defender for Endpoint on Linux](/defender-endpoint/linux-updates)

## See also

- [Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus](mde-security-settings-management.md)
- [Linux Resources](linux-resources.md)
- [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md)
- [Investigate agent health issues](health-status.md)
- [Troubleshoot missing events or alerts issues for Microsoft Defender for Endpoint on Linux](linux-support-events.md)
- [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md)

 > [!TIP]
> Do you want to learn more? Engage with the Microsoft Security community in our Tech Community: [Microsoft Defender for Endpoint Tech Community](https://techcommunity.microsoft.com/category/microsoft-defender-for-endpoint/discussions/microsoftdefenderatp)
