---
title: Service Account Discovery
description: The Service Accounts page provides a centralized location for customers to view and manage identity information across their environment, ensuring optimal visibility and a comprehensive experience.
ms.topic: conceptual
ms.date: 03/25/2025
---

# Investigate and protect Service Accounts | Microsoft Defender for Identity

### What are Service Accounts?

Service accounts are specialized identities within the Active Directory that are used to run applications, services, and automated tasks. These accounts often require elevated privileges to perform their designated job. However, because they can't authenticate in the same way as human accounts, they typically don't benefit from the increased security of modern authentication methods like MFA (multifactor authentication). Given their potential elevated privilege and the inherent limitations of the access policies that govern them, careful management and monitoring are crucial to ensure they don't become a security vulnerability.

The auto discovery feature quickly identifies gMSA and sMSA accounts as well as user accounts within Active Directory that meet specific criteria and classifies them as service accounts. These accounts are then surfaced, along with relevant information including insights into recent authentications and the sources and destinations of those interactions, as part of a dedicated inventory within the Defender experience. This helps you better understand the accounts' purpose so you can more easily spot anomalous activity and understand its implications.

They can be broadly classified into several types, including:

- gMSA (Group Managed Service Accounts): gMSAs provide a single identity solution for multiple services that require mutual authentication across multiple servers, as they allow Windows to handle password management, reducing administrative overhead.
- sMSA (Managed Service Accounts): Designed for individual services on a single server rather than groups.
- User Account: These standard user accounts are typically used for interactive logins but can also be configured to run services.

In addition to the inventory views, each of the accounts also has its own details page which is enriched with other data from across the Defender experience. Things like account creation date, last sign-in, recent activities, privileges, and criticality level provide valuable insights into the service accounts themselves. You can also take direct action on these identities, like disabling a user, directly within this view.

> [!NOTE]
> Service account tags are exposed within the Identity Info table within Advanced Hunting. 


### Navigate to the Identity inventory page

In the Defender XDR portal at [https://security.microsoft.com](https://security.microsoft.com), go to Identities > Service Accounts.

The following image depicts the Service accounts page

:::image type="content" source="media/service-accounts-page.png" alt-text="Screenshot of the Service accounts page in the Defender portal" lightbox="media/service-accounts-page.png":::

There are several options you can choose from to customize the identities list view. On the top navigation you can:

- Add or remove columns.

- Apply filters.

- Search for an identity by name or full UPN, Sid, and Object ID. 

- Export the list to a CSV file.

- Copy list link with the included filters configured. 

### Service account details


- Total: The total number of service accounts listed.

- Managed: The total number of service accounts that are gMSA (Group Managed Service Accounts) or sMSA (Managed Service Accounts)

- User: The total number of standard user accounts used for interactive logins or configured to run services.

- Critical: The total number of service accounts identified as critical.

### Sort and filter the Service accounts list


You can use the sort and filter functionality on each service account tab to get a more focused view.

- Display name: The full name of the identity as shown in the directory.
- SID: The Security Identifier, a unique value used to identify the identity in Active Directory.
- Domain: The Active Directory domain to which the identity belongs.
- Type: Specifies if the identity is a user account or service account.
- Criticality level: Indicates the critical level of the identity.
- Tags: Sensitive or Honey Token
- Auth protocols: Lists the available methods for verifying user identities, for example, Kerberos and NTLM (New Technology LAN Manager).
- Service classes: Lists 
- Sources: Indicates whether the identity is on-premises (originate from Active Directory), Cloud only (Microsoft Entra ID) or Hybrid (synced from AD to Microsoft Entra ID).
- Destinations -The number of resources the account is trying to access, such as a Domain Controller or remote desktop session.
- Connections: 
- Created: The timestamp when the identity was first created.
- Last updated: The timestamp of the most recent update to the identity's attributes in Active Directory.

### Service accounts overview

For a deeper dive into what's happening in your service account click on the domain name to see the following information:

**Connections**
 Explore the connections made by these accounts, see insights into which machines were involved, their potential risk level, and identify abnormal interactions.

In order to capture network traffic we need to gather data from various places such as the device, service account, destination and what resource was requested.
 
Source: Where the network traffic or request originates from.
Source type: What kind of device or system is initiating the request. For example, server ,workstation, domain controller.
Source risk: Identicates the risk posed to the source from no risk to high risk.
Destination: Where the request is being directed to. The target system that the service account is trying to access. For example, when trying to access a destination server, there can be multiple resources on that server (e.g. a database and a file-server).
Destination type:
Auth protocols:
Service Class: A category of services within a network that defines the type of service being provided, often used for authentication and resource management. These include: Lightweight Directory Access Protoco (LDAP), Common Internet File System (CIFS), Remote Procedure Call (RPC), Remote Procedure Call Subsystem (RPCSS), "HTTP", Terminal Services (TERMSRV), and "HOST"
Count: 
Last seen: 

For more information about the following tabs, **Overview**, **Incidents and alerts**,**Observed in organization**, **Timeline**, and **Attack paths** see: [Investigate assets](/ATPDocs/investigate-assets.md#identity-details)