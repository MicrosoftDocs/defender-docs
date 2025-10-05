---
title: US Government offerings
description: This article describes the features differences between Microsoft Defender for Cloud Apps for US Government offerings and the commercial offering.
ms.date: 04/11/2024
ms.topic: overview
---
# Microsoft Defender for Cloud Apps for US Government offerings



The Microsoft Defender for Cloud Apps GCC High and Department of Defense (DoD) offerings is built on the Microsoft Azure Government Cloud and is designed to inter-operate with Microsoft 365 GCC High and DoD. The GCC High and DoD offerings utilizes the same underlying technologies and capabilities as the commercial instance of Microsoft Defender for Cloud Apps. Therefore, the commercial offering's public documentation should be used as a starting point for deploying and operating the service.

The Microsoft Defender for Cloud Apps US Government Service Description is designed to serve as an overview of the service offering in the GCC High and DoD environments and will cover feature variations from the commercial offering.  For more information about government offerings, see [US Government service description](/enterprise-mobility-security/solutions/ems-govt-service-description).

>[!NOTE]
> Defender for Cloud Apps customers who are using GCC should use this URL to log on to the service:  <https://portal.cloudappsecuritygov.com>

## Getting started with Microsoft Defender for Cloud Apps for US Government offerings

The Microsoft Defender for Cloud Apps offerings for GCC High and DoD customers are built on the Microsoft Azure Government Cloud and are designed to inter-operate with Microsoft 365 GCC High and DoD environments. Full details on the services and how to use them can be found in the [Microsoft Defender for Cloud Apps public documentation](/defender-cloud-apps/). The public documentation should be used as a starting point for deploying and operating the service and the following Service Description details and changes from functionality or features in the GCC High or DoD environments.

To get started, use the [Basic Setup](general-setup.md) page for access to the Microsoft Defender for Cloud Apps GCC High or DoD portals, and ensure your [Network requirements](network-requirements.md) are configured. To configure Defender for Cloud Apps to use your own key to encrypt the data it collects while it's at rest, see [Encrypt Defender for Cloud Apps data at rest with your own key (BYOK)](ems-cloud-app-security-govt-service-byok.md). Follow the additional steps in the How-to guides for other detailed instructions.

> [!NOTE]
> Data encryption is currently only available for specific Microsoft Defender for Cloud Apps government offerings.

## Feature variations in Microsoft Defender for Cloud Apps US Government offerings

Unless otherwise specified, new feature releases, including preview features, documented in [What's new with Microsoft Defender for Cloud Apps](release-notes.md), will be available in GCC High and DoD environments within three months of release in the Microsoft Defender for Cloud Apps commercial environment.

## Feature support

Microsoft Defender for Cloud Apps for US Government offers parity with the Microsoft Defender for Cloud Apps commercial environment except for the following list of App Governance features. These features are on the roadmap for support in GCC, GCC High and DoD:

**App Governance predefined app policy alerts:**

- App created recently has low consent rate

- High volume of email search activity by an app

- High volume of inbox rule creation activity by an app

- Increase in app API calls to EWS

- Suspicious app with access to multiple Microsoft 365 services

**App Governance threat detection alerts:**

- App accessed from unusual location post certificate update

- App performed drive enumeration

- App redirects to phishing URL by exploiting OAuth redirection vulnerability

- App with bad URL reputation

- App with suspicious OAuth scope made graph calls to read email and created inbox rule

- App impersonating a Microsoft logo

- App is associated with a typosquatted domain

- App metadata associated with known phishing campaign

- App metadata associated with previously flagged suspicious apps

- App metadata associated with suspicious mail-related activity

- App with EWS application permissions accessing numerous emails

- Application initiating multiple failed KeyVault read activity with no success

- Dormant OAuth App predominantly using ARM API or MS Graph recently seen to be accessing EWS workloads

- Dormant OAuth App predominantly using ARM or EWS recently seen to be accessing MS Graph workloads

- Dormant OAuth App predominantly using MS Graph or Exchange Web Services recently seen to be accessing ARM workloads

- Dormant OAuth App with no recent ARM activity

- Dormant OAuth App with no recent EWS activity

- Dormant OAuth App with no recent MS Graph activity

- Entra Line-of-Business app initiating an anomalous spike in virtual machine creation

- Increase in app API calls to Exchange after a credential update

- New app with numerous consent revocations

- OAuth App using unusual user agent

- OAuth App with suspicious Reply URL

- Oauth app with suspicious reply url

- Suspicious enumeration activities performed using Microsoft Graph PowerShell

- Unused app newly accessing APIs


## Next steps

- [Microsoft Defender for Cloud Apps overview](what-is-defender-for-cloud-apps.md)
