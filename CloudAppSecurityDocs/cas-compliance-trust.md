---
title:  Microsoft Defender for Cloud Apps – privacy
description: Learn about how Microsoft Defender for Cloud Apps manages user privacy.
ms.date: 06/17/2025
ms.topic: concept-article
---
# Privacy with Microsoft Defender for Cloud Apps

Microsoft Defender for Cloud Apps is a critical component of the Microsoft cloud security stack, which helps you stay in control over your cloud applications with comprehensive visibility, auditing, and granular controls over your sensitive data.

This article provides an overview of the data security and privacy practices for Microsoft Defender for Cloud Apps.

## Data collected by Defender for Cloud Apps

Microsoft Defender for Cloud Apps collects information from your configured cloud apps and data sources. Information collected from those sources includes:

- Network data
- OAuth app configuration and usage
- Audits on cloud app usage by users and other apps
- File metadata and content
- System settings and policies
- User and group configurations

> [!NOTE]
> The data collected from the various applications is dependent on the customer-provided data from the various applications and might include personal information.

## Data storage location

Defender for Cloud Apps operates in the Microsoft Azure data centers in the following geographical regions: 

|Customer provisioning location  |Data storage location  |
|---------|---------|
|**Customers whose tenants are provisioned in the United States**     |  United States       |
|**Customers whose tenants are provisioned in the European Union or the United Kingdom**     |    The European Union or the United Kingdom, depending on service availability.      |
|**Customers whose tenants are provisioned in any other region**     |     The United States and/or a data center in the region that's nearest to the location of where the customer's Microsoft Entra tenant has been provisioned.    |

In addition to the locations above, the App Governance features within Defender for Cloud Apps operate in the Microsoft Azure data centers in the following geographical regions listed below. Customer with App Governance enabled will have data stored within the data storage location the customer provisions in above, and in a second data storage location as described below: 

|Customer provisioning location  |Data storage location  |
|---------|---------|
|**Customers whose tenants are provisioned in the United States** | United States |
|**Customers whose tenants are provisioned in in the European Union** | European Union |
|**Customers whose tenants are provisioned in the United Kingdom** | United Kingdom |
|**Customers whose tenants are provisioned in Australia** | Australia |
|**Customers whose tenants are provisioned in Germany** | Germany |
|**Customers whose tenants are provisioned in Canada** |Canada  |
|**Customers whose tenants are provisioned in France**  | France  |
| **Customers whose tenants are provisioned in Japan** | Japan  |
| **Customers whose tenants are provisioned in India** | India  |
| **Customers whose tenants are provisioned in Asia Pacific**  | Asia Pacific  |
|**Customers whose tenants are provisioned in any other region**     |     The United States and/or a data center in the region that's nearest to the location of where the customer's Microsoft Entra tenant has been provisioned.   |

Customer data collected by Defender for Cloud Apps is either stored in your tenant location, as described in the previous tables, or in the geographic location of another online service that Defender for Cloud Apps shares data with, as defined by the data storage rules of that online service.


### View your data storage location

To view your Defender for Cloud Apps tenant location in the Microsoft Defender portal, go to **Settings > Cloud Apps > About > Region**.

> [!NOTE]
> If Defender for Cloud Apps data is stored in your tenant location, your tenant isn't movable after having been created.
 
## Data retention

Data from Microsoft Defender for Cloud Apps is retained for up to 180 days, and is visible across the portal.  

Your data is kept and is available to you while the license is under grace period or suspended mode. At the end of this period, that data is erased from Microsoft's systems to make it unrecoverable, no later than 180 days from contract termination or expiration.

## Data sharing for Microsoft Defender for Cloud Apps

Defender for Cloud Apps shares data, including customer data, among the following Microsoft products also licensed by the customer. For customers in the Government Community Cloud (GCC), data sharing between government and commercial cloud environments might occur, depending on the location of the service offering.

- Microsoft Defender XDR
- Microsoft Defender for Cloud
- Microsoft Sentinel
- Microsoft Defender for Endpoint
- Microsoft Security Exposure Management
- Microsoft Purview
- Microsoft Entra ID Protection

## Related content

For more information, see the [Microsoft compliance offerings](/compliance/regulatory/offering-nist-sp-800-171).
