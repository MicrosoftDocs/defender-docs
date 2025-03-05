---
title: Multi-forest support | Microsoft Defender for Identity
description: Learn about how Microsoft Defender for Identity supports multiple Active Directory forests.
ms.date: 08/10/2023
ms.topic: conceptual
---

# Microsoft Defender for Identity multi-forest support

Microsoft Defender for Identity supports organizations with multiple Active Directory forests, giving you the ability to easily monitor activity and profile users across forests.

Enterprise organizations typically have several Active Directory forests - often used for different purposes, including legacy infrastructure from corporate mergers and acquisitions, geographical distribution, and security boundaries (red forests).

Securing your multiple Active Directory forests with Defender for Identity provides the following advantages:

- **View and investigate** activities performed by users across multiple forests from a single location
- **Gain improved detection** and reduce false positives with advanced Active Directory integration and account resolution
- **Gain greater control and easier deployment**, with an improved set of health issues and reporting for cross-org coverage when your domain controllers are all monitored from a single Defender for Identity server

> [!NOTE]
> Each Defender for Identity sensor can only report to a single Defender for Identity workspace.
>

## Detection activity across multiple forests

To detect cross-forest activities, Defender for Identity sensors query domain controllers in remote forests to create profiles for all entities involved, including users and computers from remote forests.

- Defender for Identity sensors can be installed on domain controllers in all forests, even forests with no trust.

- [Add additional credentials](create-directory-service-account-gmsa.md#configure-a-directory-service-account-in-microsoft-defender-xdr) on the **Directory services accounts** page to support any untrusted forests in your environment.

  - Only one credential is required to support all forests with a two-way trust.

  - Additional credentials are required for each forest with non-Kerberos trust or no trust.

  - There's a default limit of 30 credentials per Defender for Identity workspace. [Contact support](../support.md) if you need to add more than 30 credentials.

For more information, see [Microsoft Defender for Identity Directory Service account recommendations](directory-service-accounts.md).


## Network traffic impact for multi-forest support

When Defender for Identity maps your forests, it uses the following process:

1. After the Defender for Identity sensor starts running, the sensor queries the remote Active Directory forests and retrieves a list of users and machine data for profile creation.

1. Every 5 minutes, each Defender for Identity sensor queries one domain controller from each domain, from each forest, to map all the forests in the network.

    The Defender for Identity sensors map the forests using the `trustedDomain` Active Directory object, by signing in and checking the trust type.

You may see ad-hoc traffic when the Defender for Identity sensor detects cross forest activity. When this occurs, the Defender for Identity sensors will send an LDAP query to the relevant domain controllers to retrieve entity information.


## Related content

- [Deploy Microsoft Defender for Identity with Microsoft Defender XDR](deploy-defender-identity.md)
- [Microsoft Defender for Identity prerequisites](prerequisites.md)
- [Directory Service Accounts for Microsoft Defender for Identity](directory-service-accounts.md)
