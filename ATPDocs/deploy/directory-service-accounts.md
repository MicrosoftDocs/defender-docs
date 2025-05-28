---
title: Directory Service Accounts for Microsoft Defender for Identity
description: Learn about how Microsoft Defender for Identity uses Directory Service accounts (DSAs).
ms.date: 01/16/2024
ms.topic: conceptual
---

# Directory Service Accounts for Microsoft Defender for Identity

This article describes how Microsoft Defender for Identity uses Directory Service Accounts (DSAs).

>[!NOTE]
>Regardless of the Directory Service Accounts configured, the sensor service will operate under the LocalService identity, and the updater service will operate under the LocalSystem identity.


While a DSA is optional in some scenarios, we recommend that you configure a DSA for Defender for Identity for full security coverage.

For example, when you have a DSA configured, the DSA is used to connect to the domain controller at startup. A DSA can also be used to query the domain controller for data on entities seen in network traffic, monitored events, and monitored ETW activities

A DSA is required for the following features and functionality:

- When working with a sensor installed on an [AD FS / AD CS server](active-directory-federation-services.md).

- Requesting member lists for local administrator groups from devices seen in network traffic, events and ETW activities via a [SAM-R call](remote-calls-sam.md) made to the device. Collected data is used to calculate potential lateral movement paths.

- Accessing the *DeletedObjects* container to collect information about deleted users and computers. 

- Domain and trust mapping, which occurs at sensor startup, and again every 10 minutes.

- Querying another domain via LDAP for details, when detecting activities from entities in those other domains.

When you're using a single DSA, the DSA must have *Read* permissions to all the domains in the forests. In an untrusted, multi-forest environment, a DSA account is required for each forest.

One sensor in each domain is defined as the *domain synchronizer*, and is responsible for tracking changes to the entities in the domain. For examples, changes might include objects created, entity attributes tracked by Defender for Identity, and so on.

>[!NOTE]
>By default, Defender for Identity supports up to 30 credentials. To add more credentials, contact Defender for Identity support.

## Supported DSA account options

Defender for Identity supports the following DSA options:

|Option  |Description  |Configuration  |
|---------|---------|---------|
|**Group Managed Service Account gMSA** (Recommended)     |  Provides a more secure deployment and password management. Active Directory manages the creation and rotation of the account's password, just like a computer account's password, and you can control how often the account's password is changed.       |    For more information, see [Configure a Directory Service Account for Defender for Identity with a gMSA](create-directory-service-account-gmsa.md).     |
|**Regular user account**     |   Easy to use when getting started, and simpler to configure *Read* permissions between trusted forests, but requires extra overhead for password management. <br><br>A regular user account is less secure, as it requires you to create and manage passwords, and can lead to downtime if the password expires and isn't updated for both the user and the DSA.   |   Create a new account in Active Directory to use as the DSA with *Read* permissions to all the objects, including permissions to the *DeletedObjects* container. For more information, see [Grant required DSA permissions](#grant-required-dsa-permissions).   |
| **Local service account** | The Local service account is used out of the box and used by default when there is no DSA configured. <br>Note: <li> SAM-R queries for potential lateral movement paths not supported in this scenario. <li> LDAP queries only within the domain the sensor is installed. Queries to other domains in the same forest or cross forest will fail. | None |

>[!NOTE]
>While the local service account is used with the sensor by default, and a DSA is optional in some scenarios, we recommend that you configure a DSA for Defender for Identity for full security coverage.


## DSA entry usage

This section describes how DSA entries are used, and how the sensor selects a DSA entry in any given scenario. Sensor attempts differ, depending on the type of DSA entry:

|Type  |Description  |
|---------|---------|
|**gMSA account**     | The sensor attempts to retrieve the gMSA account password from Active Directory, and then signs into the domain.   |
|**Regular user account**     |   The sensor attempts to sign into the domain using the configured username and password.      |

The following logic is applied:

1. The sensor looks for an entry with an exact match of the domain name for the target domain. If an exact match is found, the sensor attempts to authenticate using the credentials in that entry.

1. If there isn't an exact match, or if the authentication failed, the sensor searches the list for an entry to the parent domain using DNS FQDN, and attempts to authenticate using the credentials in the parent entry instead.

1. If there isn't an entry for the parent domain, or if the authentication failed, the sensor searches the list for a sibling domain entry, using the DNS FQDN, and attempts to authenticate using the credentials in the sibling entry instead.

1. If there isn't an entry for the sibling domain, or if the authentication failed, the sensor reviews the list again and tries to authenticate again with each entry until it succeeds. DSA gMSA entries have higher priority than regular DSA entries.


### Sample logic with a DSA

This section provides an example of how the sensor tries the DSA entires when you have multiple accounts, including both a gMSA account and a regular account.

The following logic is applied:

1. The sensor looks for a match between the DNS domain name of the target domain, such as `emea.contoso.com` and the DSA gMSA entry, such as `emea.contoso.com`.

1. The sensor looks for a match between the DNS domain name of the target domain, such as `emea.contoso.com` and the DSA regular entry DSA, such as `emea.contoso.com`

1. The sensor looks for a match in the root DNS name of the target domain, such as `emea.contoso.com` and the DSA gMSA entry domain name, such as `contoso.com`.

1. The sensor looks for a match in the root DNS name of the target domain, such as `emea.contoso.com` and the DSA regular entry domain name, such as `contoso.com`.

1. The sensor looks for the target domain name for a sibling domain, such as `emea.contoso.com` and the DSA gMSA entry domain name, such as `apac.contoso.com`.

1. The sensor looks for the target domain name for a sibling domain, such as `emea.contoso.com` and the DSA regular entry domain name, such as `apac.contoso.com`.

1. The sensor runs a round robin of all DSA gMSA entries.

1. The sensor runs a round robin of all DSA regular entries.

The logic shown in this example is implemented with the following configuration:

- **DSA entries**:

    - `DSA1.emea.contoso.com`
    - `DSA2.fabrikam.com`

- **Sensors and the DSA entry that's used first**:

    | Domain controller FQDN | DSA entry used |
    | --------------------------- | -------------------------------- |
    | `DC01.emea.contoso.com`   | `DSA1.emea.contoso.com`            |
    | `DC02.contoso.com`        | `DSA1.emea.contoso.com` |
    | `DC03.fabrikam.com`       | `DSA2.fabrikam.com`                |
    | `DC04.contoso.local`      | Round robin                      |

>[!IMPORTANT]
>If a sensor isn't able to successfully authenticate via LDAP to the Active Directory domain at startup, the sensor won't enter a running state and a health issue is generated. For more information, see [Defender for Identity health issues](../health-alerts.md).

## Grant required DSA permissions

[!INCLUDE [dsa-permissions](../includes/dsa-permissions.md)]

## Test your DSA permissions and delegations via PowerShell

Use the following PowerShell command to verify that your DSA doesn't have too many permissions, such as powerful admin permissions:

```powershell
Test-MDIDSA [-Identity] <String> [-Detailed] [<CommonParameters>]
```

For example, to check permissions for the **mdiSvc01** account and provide full details, run:

```powershell
Test-MDIDSA -Identity "mdiSvc01" -Detailed
```

For more information, see the [DefenderForIdentity PowerShell reference](/powershell/module/defenderforidentity/test-mdidsa).

## Next step

> [!div class="step-by-step"]
> [Configure a Directory Service Account for Defender for Identity with a gMSA »](create-directory-service-account-gmsa.md)
