---
title: Criticality Levels for Classifications
description: Lists of all the current criticality levels for classifications in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: reference
ms.service: exposure-management
ms.date: 11/16/2024
---

# Predefined classifications

Security Exposure Management provides an out-of-the-box catalog of predefined critical asset classifications for assets that include devices, identities, and cloud resources.

You can [review and classify critical assets](classify-critical-assets.md), turning them on and off as needed.

To suggest new critical asset classifications, use the **Feedback** button.

Current asset types are:

* [Device](#device)
* [Identity](#identity)
* [Cloud resource](#cloud-resource)

> [!Note]
> We also utilize criticality context retrieved from external data connectors. This context will be presented as classifications in the predefined critical asset management classification library.

##### Device

| Classification             | Asset type | Default criticality level | Description                                                  |
| -------------------------- | ---------- | ------------------------- | ------------------------------------------------------------ |
| Microsoft Entra ID Connect | Device     | High                    | The Microsoft Entra ID Connect (formerly known as AAD Connect) server is responsible for syncing on-premises directory data and passwords to the Microsoft Entra ID tenant. |
| ADCS                       | Device     | High                    | ADCS server allows administrators to fully implement a public key infrastructure (PKI) and issue digital certificates that can be used to secure multiple resources on a network. Moreover, ADCS can be used for various security solutions, such as SSL encryption, user authentication, and secure email. |
| ADFS                       | Device     | High                      | ADFS server provides users with single sign-on access to systems and applications located across organizational boundaries. It uses a claims-based access control authorization model to maintain application security and implement federated identity. |
| Backup                     | Device     | Medium                    | Backup server is responsible for safeguarding data through regular backups, ensuring data protection and disaster recovery readiness. |
| Domain Admin Device      | Device     | High                      | Domain admin devices are devices that one or more of the domain admins are frequently logged into. These devices are likely to store related files, documents, and credentials used by the domain admins. _Note: We apply a logic to identify devices belonging to an admin based on multiple factors, including the frequent usage of administrative tools._|
| Domain Controller          | Device     | Very High                      | Domain controller server is responsible for user authentication, authorization, and centralized management of network resources within an active directory domain. |
| DNS                        | Device     | Low                    | The DNS server is essential for resolving domain names to IP addresses, enabling network communication and access to resources both internally and externally. |
| Exchange                   | Device     | Medium                    | Exchange server is responsible for all the mail traffic within the organization. Depending on the setup and architecture, each server might hold several mail databases that store highly sensitive organizational information. |
| IT Admin Device              | Device     | Medium                    | Critical devices used to configure, manage, and monitor the assets within the organization are vital for IT administration and are at high risk of cyber threats. They require top-level security to prevent unauthorized access. _Note: We apply a logic to identify devices belonging to an admin based on multiple factors, including the frequent usage of administrative tools._ |
| Security Operations Admin Device         | Device     | High        | Critical devices used to configure, manage, and monitor the security within an organization are vital for security operations administration and are at high risk of cyber threats. They require top-level security measures to prevent unauthorized access.  Note: We apply a logic to identify devices belonging to an admin based on multiple factors, including the frequent usage of administrative tools.|
| Network Admin Device         | Device     | Medium                    | Critical devices used to configure, manage, and monitor the network assets within the organization are vital for network administration and are at high risk of cyber threats. They require top-level security to prevent unauthorized access. _Note: We apply a logic to identify devices belonging to an admin based on multiple factors, including the frequent usage of administrative tools._|
| VMware ESXi                | Device     | High                      | The VMware ESXi hypervisor is essential for running and managing virtual machines within your infrastructure. As a bare-metal hypervisor, it's providing the foundation for creating and managing virtual resources. |
| VMware vCenter             | Device     | High                      | The VMware vCenter Server is crucial for managing virtual environments. It provides centralized management of virtual machines and ESXi hosts. If it fails, it could disrupt the administration and control of your virtual infrastructure, including provisioning, migration, load balancing of virtual machines, and datacenter automation. However, as there are often redundant vCenter Servers and High Availability configurations, the immediate halt of all operations might not occur. Its failure could still cause significant inconvenience and potential performance issues |
| Hyper-V Server             | Device     | High                      | The Hyper-V hypervisor is essential for running and managing virtual machines within your infrastructure, serving as the core platform for their creation and management. If the Hyper-V host fails, it can lead to the unavailability of hosted virtual machines, potentially causing downtime and disrupting business operations. Moreover, it can result in significant performance degradation and operational challenges. Ensuring the reliability and stability of Hyper-V hosts is therefore critical for maintaining seamless operations in a virtual environment. |

##### Identity

| Classification                                | Asset type | Default criticality level | Description                                                  |
| --------------------------------------------- | ---------- | ------------------------- | ------------------------------------------------------------ |
| Identity with Privileged  Role           | Identity   | High                      | The following identities (User, Group, Service Principal, or Managed Identity) have an assigned built-in or custom privileged Azure RBAC role, at subscription scope, containing a critical resource. The role can include permissions for Azure role assignments, modifying Azure policies, executing scripts on a VM using Run command, read-access to storage accounts and keyvaults, and more. |
| Application Administrator                     | Identity   | Very High                 | Identities in this role can create and manage all aspects of enterprise applications, application registrations, and application proxy settings. |
| Application Developer                         | Identity   | High                      | Identities in this role can create application registrations independent of the 'Users can register applications' setting. |
| Authentication Administrator                  | Identity   | Very High                 | Identities in this role can set and reset authentication method (including passwords) for non-admin users. |
| Backup Operators                  | Identity   | Very High                      | Identities in this role can backup and restore all files on a computer, regardless of the permissions that protect those files. Backup operators also can log on to and shut down the computer and can perform backup and restore operations on domain controllers. |
| Server Operators                  | Identity   | Very High                      | Identities in this role can administer domain controllers. Members of the Server operators group can take the following actions: sign in to a server interactively, create and delete network shared resources, start and stop services, backup and restore files, format the hard disk drive of the computer, and shut down the computer. |
| B2C IEF Keyset Administrator                  | Identity   | High                      | Identities in this role can manage secrets for federation and encryption in the Identity Experience Framework (IEF). |
| Cloud Application Administrator               | Identity   | Very High                 | Identities in this role can create and manage all aspects of app registrations and enterprise apps except App Proxy. |
| Cloud Device Administrator                    | Identity   | High                      | Identities in this role have limited access to manage devices in Microsoft Entra ID. They can enable, disable, and delete devices in Microsoft Entra ID and read Windows 10 BitLocker keys (if present) in the Azure portal. |
| Conditional Access Administrator              | Identity   | High                      | Identities in this role have the ability to manage Microsoft Entra Conditional Access settings. |
| Directory Synchronization Accounts            | Identity   | Very High                 | Identities in this role have the ability to manage all directory synchronization settings. Should Only be used by Microsoft Entra Connect service. |
| Directory Writers                             | Identity   | High                      | Identities in this role can read and write basic directory information. For granting access to applications, not intended for users. |
| Domain Administrator                          | Identity   | Very High                 | Identities in this role are authorized to administer the domain. By default, the Domain Admins group is a member of the Administrators group on all computers that have joined a domain, including the domain controllers. |
| Enterprise Administrator                          | Identity   | Very High                 | Identities in this role have complete access to configuring all domain controllers. Members in this group can modify the membership of all administrative groups. |
| Global Administrator                          | Identity   | Very High                 | Identities in this role can manage all aspects of Microsoft Entra ID and Microsoft services that use Microsoft Entra identities. |
| Global Reader                                 | Identity   | High                      | Identities in this role can read everything that a Global Administrator can, but not update anything. |
| Helpdesk Administrator                        | Identity   | Very High                 | Identities in this role can reset passwords for nonadministrators and Helpdesk Administrators. |
| Hybrid Identity Administrator                 | Identity   | Very High                 | Identities in this role can manage Active Directory to Microsoft Entra cloud provisioning, Microsoft Entra Connect, Pass-through Authentication (PTA), Password hash synchronization (PHS), seamless single sign-on (Seamless SSO), and federation settings. |
| Intune Administrator                          | Identity   | Very High                 | Identities in this role can manage all aspects of the Intune product. |
| Partner Tier1 Support                         | Identity   | Very High                 | Identities in this role can reset passwords for nonadmin users, update credentials for applications, create and delete users, and create OAuth2 permission grants. This role has been deprecated and will be removed from Microsoft Entra ID in the future. Don't use - not intended for general use. |
| Partner Tier2 Support                         | Identity   | Very High                 | Identities in this role can reset passwords for all users (including Global Administrators), update credentials for applications, create and delete users, and create OAuth2 permission grants. This role has been deprecated and will be removed from Microsoft Entra ID in the future. Don't use - not intended for general use. |
| Password Administrator                        | Identity   | Very High                 | Identities in this role can reset passwords for nonadministrators and Password Administrators. |
| Privileged Authentication Administrator       | Identity   | Very High                 | Identities in this role can view, set, and reset authentication method information for any user (admin or nonadmin). |
| Privileged Role Administrator                 | Identity   | Very High                 | Identities in this role can manage role assignments in Microsoft Entra ID, and all aspects of Privileged Identity Management. |
| Security Administrator                        | Identity   | High                      | Identities in this role can read security information and reports, and manage configuration in Microsoft Entra ID and Office 365. |
| Security Operator                             | Identity   | High                      | Identities in this role can create and manage security events.    |
| Security Reader                               | Identity   | High                      | Identities in this role can read security information and reports in Microsoft Entra ID and Office 365. |
| User Administrator                            | Identity   | Very High                 | Identities in this role can manage all aspects of users and groups, including resetting passwords for limited admins. |
| Exchange Administrator                        | Identity   | High                      | Identities in this role can manage all aspects of the Exchange product. |
| SharePoint Administrator                      | Identity   | High                      | Identities in this role can manage all aspects of the SharePoint service. |
| Compliance Administrator                      | Identity   | High                      | Identities in this role can read and manage compliance configurations and reports in Microsoft Entra ID and Microsoft 365. |
| Groups Administrator                          | Identity   | High                      | Identities in this role can create/manage groups and group settings like naming and expiration policies, and view group activity and audit reports. |
| External Identity Provider Administrator      | Identity   | Very High                 | Identities in this role can configure identity providers for use in direct federation. |
| Domain Name Administrator                     | Identity   | Very High                 | Identities in this role can manage domain names in cloud and on-premises. |
| Permissions Management Administrator          | Identity   | Very High                 | Identities in this role can manage all aspects of Microsoft Entra Permissions Management (EPM). |
| Billing Administrator                         | Identity   | High                      | Identities in this role can perform common billing related tasks like updating payment information. |
| License Administrator                         | Identity   | High                      | Identities in this role can manage product licenses on users and groups. |
| Teams Administrator                           | Identity   | High                      | Identities in this role can manage the Microsoft Teams service.   |
| External ID User Flow Administrator           | Identity   | High                      | Identities in this role can create and manage all aspects of user flows. |
| External ID User Flow Attribute Administrator | Identity   | High                      | Identities in this role can create and manage the attribute schema available to all user flows. |
| B2C IEF Policy Administrator                  | Identity   | High                      | Identities in this role can create and manage trust framework policies in the Identity Experience Framework (IEF). |
| Compliance Data Administrator                 | Identity   | High                      | Identities in this role can create and manage compliance content. |
| Authentication Policy Administrator           | Identity   | High                      | Identities in this role can create and manage the authentication methods policy, tenant-wide MFA settings, password protection policy, and verifiable credentials. |
| Knowledge Administrator                       | Identity   | High                      | Identities in this role can configure knowledge, learning, and other intelligent features. |
| Knowledge Manager                             | Identity   | High                      | Identities in this role can organize, create, manage, and promote topics and knowledge. |
| Attribute Definition Administrator            | Identity   | High                      | Identities in this role can define and manage the definition of custom security attributes. |
| Attribute Assignment Administrator            | Identity   | High                      | Identities in this role can assign custom security attribute keys and values to supported Microsoft Entra objects. |
| Identity Governance Administrator             | Identity   | High                      | Identities in this role can manage access using Microsoft Entra ID for identity governance scenarios. |
| Cloud App Security Administrator              | Identity   | High                      | Identities in this role can manage all aspects of the Defender for Cloud Apps product.                                                             |
| Windows 365 Administrator                     | Identity   | High                      | Identities in this role can provision and manage all aspects of Cloud PCs. |
| Yammer Administrator                          | Identity   | High                      | Identities in this role can manage all aspects of the Yammer service. |
| Authentication Extensibility Administrator    | Identity   | High                      | Identities in this role can customize sign in and sign up experiences for users by creating and managing custom authentication extensions. |
| Lifecycle Workflows Administrator             | Identity   | High                      | Identities in this role create and manage all aspects of workflows and tasks associated with Lifecycle Workflows in Microsoft Entra ID. |

##### Cloud resource

| Classification                                               | Asset type     | Default criticality level | Description                                                  |
| ------------------------------------------------------------ | -------------- | ------------------------- | ------------------------------------------------------------ |
| Databases with Sensitive Data                                | Cloud resource | High                      | This is a data store that contains sensitive data. Sensitivity of data can range from secrets, confidential documents, personally identifiable information, and more. |
| Confidential Azure Virtual Machine                           | Cloud resource | High                      | This rule applies to Azure confidential virtual machines. Confidential VMs provide increased isolation, privacy, and encryption, and are used for critical or highly sensitive data and workloads. |
| Locked Azure Virtual Machine                                 | Cloud resource | Medium                    | This is a virtual machine that is safeguarded by a lock. Locks are used to protect assets from deletion and modifications. Usually, administrators use locks to safeguard critical cloud assets in their environment, and to protect them from accidental deletion and unauthorized modifications. |
| Azure Virtual Machine with High Availability and Performance | Cloud resource | Low                       | This rule applies to Azure virtual machines that use premium Azure storage and are configured with an availability set. Premium storage is used for machines with high performance requirements, such as production workloads. Availability sets improve resilience and are often indicated for business critical VMs that need high availability. |
| Immutable Azure Storage                                      | Cloud resource | Medium                    | This rule applies to Azure storage accounts that have immutability support enabled. Immutability stores business data in a write once read many (WORM) state, and usually indicates that the storage account holds critical or sensitive data that must be protected from modification. |
| Immutable and Locked Azure Storage                           | Cloud resource | High                      | This rule applies to Azure storage accounts that have immutability support enabled with a locked policy. Immutability stores business data in a write once read many (WORM). Data protection is increased with a locked policy to ensure that data can’t be deleted or its retention time shortened. These settings usually indicate that the storage account holds critical or sensitive data that must be protected from modification or deletion. Data might also need to align with compliance policies for data protection. |
| Azure Virtual Machine with a Critical User Signed In         | Cloud resource | High                      | This rule applies to virtual machines protected by Defender for Endpoint, where a user with a high or very high criticality level is signed in. The signed-in user can be through a joined or registered device, an active browser session, or other means. |
| Azure Key Vaults with many connected identities              | Cloud resource | High                      | This rule identifies Azure Key Vaults that can be accessed by a large number of identities, compared to other Key Vaults. This often indicates that the Key Vault is used by critical workloads, such as production services. |
| Azure Key Vault with high number of operations              | Cloud resource | High                      | This rule identifies Azure Key Vaults with high operation volumes, marking them as critical. These metrics highlight Key Vaults essential for security and operational stability. |
| Locked Azure Kubernetes Service cluster              | Cloud resource | Low                       | This is an Azure Kubernetes Service cluster that is safeguarded by a lock. Locks are used to protect assets from deletion and modifications. Usually, administrators use locks to safeguard critical cloud assets in their environment, and to protect them from accidental deletion and unauthorized modifications. |
| Premium tier Azure Kubernetes Service cluster        | Cloud resource | High                      | This rule applies to Azure Kubernetes Service clusters with premium tier cluster management. Premium tiers are recommended for running production or mission-critical workloads that need high availability and reliability. |
| Azure Kubernetes Service cluster with multiple nodes | Cloud resource | High                      | This rule applies to Azure Kubernetes Service clusters with a large number of nodes. This often indicates that the cluster is used for critical workloads, such as production workloads. |
| Azure Arc Kubernetes cluster with multiple nodes                | Cloud Resource | High                      | This rule applies to Azure Arc Kubernetes clusters with a large number of nodes. This often indicates that the cluster is used for critical workloads, such as production workloads. |
