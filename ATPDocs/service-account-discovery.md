---
title: Service Account Discovery
description: The Service Accounts page provides a centralized location for customers to view and manage identity information across their environment, ensuring optimal visibility and a comprehensive experience.
ms.topic: conceptual
ms.date: 03/25/2025
---

# Investigate and protect Service Accounts

### What are Service Accounts?

Service accounts are specialized identities within Active Directory used to run applications, services, and automated tasks. These accounts often require elevated privileges to perform their designated job. However, because they can't authenticate in the same way as human accounts, they typically don't benefit from the increased security of modern authentication methods like MFA (multifactor authentication). Given their potential elevated privilege and the inherent limitations of the access policies that govern them, careful management and monitoring are crucial to ensure they don't become a security vulnerability.

Service accounts are classified into several types:

- gMSA (Group Managed Service Accounts): gMSAs provide a single identity solution for multiple services that require mutual authentication across multiple servers, as they allow Windows to handle password management, reducing administrative overhead.
- sMSA (Managed Service Accounts): Designed for individual services on a single server rather than groups.
- User Account: These standard user accounts are typically used for interactive logins but can also be configured to run services.

The auto discovery feature quickly identifies gMSA and sMSA accounts and user accounts within Active Directory that meet specific criteria. These criteria include having a [Service Principal Name](/windows/win32/ad/service-principal-names)(SPN) or a "password never expires" attribute assigned. The feature then classifies these accounts as service accounts. These accounts are then highlighted and presented, along with relevant information including insights into recent authentications and the sources and destinations of those interactions, as part of a dedicated inventory within the Defender experience. This helps you better understand the accounts' purpose so you can more easily spot anomalous activity and understand its implications.

Service account types are displayed in the Identity Info table within Advanced Hunting.

## Service accounts page

#### Navigate to the Service accounts page

In the Defender XDR portal at [https://security.microsoft.com](https://security.microsoft.com), go to Identities > Service Accounts.

The following image depicts the Service accounts page:

:::image type="content" source="media/service-accounts-page.png" alt-text="Screenshot of the Service accounts page in the Defender portal." lightbox="media/service-accounts-page.png":::

### Customize the page view

There are several options you can choose from to customize the identities list view. On the top navigation you can:

- Add or remove columns.

- Apply filters.

- Export the list to a CSV file.

- Sort and filter the Service accounts list.

> [!NOTE]
> When exporting the service accounts list to a CSV file, a maximum of 2,000 service accounts are displayed.

### Service account details

- Total: The total number of service accounts listed.

- Managed: The total number of service accounts that are gMSA (Group Managed Service Accounts) or sMSA (Managed Service Accounts).

- User: The total number of standard user accounts used for interactive logins or configured to run services.

- Critical: The total number of service accounts identified as critical.

You can use the sort and filter functionality on each service account tab to get a more focused view.

| Service account details   |  Description |
|---------|---------|
|**Display name** | The full name of the service account as shown in the directory.
|**SID**     | The Security Identifier, a unique value used to identify the identity in Active Directory.         |
|**Domain**    | The Active Directory domain to which the identity belongs.         |
|**Type**    | Specifies if the service account is gMSA (Group Managed Service Accounts), sMSA (Managed Service Accounts) or a user account.         |
|**Criticality level**     | Indicates the critical level of the service account, ranging from low to very high.         |
|**Tags**    | Sensitive or Honey Token        |
|**Auth protocols**   | Lists the available methods for verifying user identities, for example, Kerberos and NTLM (New Technology LAN Manager).         |
|**Sources**     |  The number of potential source logins.        |
|**Destinations**    | When a service account is trying to access a destination server, the request is directed to the target system, which can include many resources on that server. These resources might be a database, a file server, or other services hosted on the server.        |
|**Connections**   | The number of unique connections made between sources and destinations.         |
|**Created**    |The timestamp when the service account was first created.         |
|**Last updated**    | The timestamp of the most recent update to the service account.        |
|

### Connections


For a deeper dive into what's happening in your service account select the domain name to see the following information:

When you investigate a specific Service account, you see the following details under the connections tab:

:::image type="content" source="media/screenshot-of-the-connections-page.png" alt-text="Screenshot of the connections page." lightbox="media/Screenshot-of-the-connections-page.png":::

|Service account connection details  |Description |
|---------|---------|
|Source  |  Where the network traffic or request originates from.       |
|Source type    | What kind of device or system is initiating the request. For example, server, workstation or domain controller.        |
|Source risk   | Identicates the risk posed to the source from no risk to high risk.         |
|Destination   | Where the request is being directed to. The target system that the service account is trying to access. For example, when trying to access a destination server, there can be multiple resources on that server (for example, a database and a file-server).        |
|Destination type    | Server, Workstation, or Domain controller.         |
|Auth protocols   | Kerberos and NTLM        |
|Service Class     | The services within a network that define the type of service being provided, often used for authentication and resource management. These include: Lightweight Directory Access Protocol (LDAP), Common Internet File System (CIFS), Remote Procedure Call (RPC), Remote Procedure Call Subsystem (RPCSS), "HTTP," Terminal Services (TERMSRV), and "HOST"        |
|Count | How many sign in events occurred over this connection in the last 180 days.
Last seen   | The date and time of the most recent sign in event over this connection.        |


### Define Service Account classification rules

Service account classification rules let you define your own criteria for identifying service accounts. These rules help you include service accounts that Defender for Identity doesn't identify automatically. For example, some organizations name all their service accounts with a prefix like `srv`. Defender for Identity doesn't automatically detect such naming conventions. By creating a classification rule based on that pattern, you can include those accounts in the Service accounts view.

Classification rules work alongside Defender for Identity’s automatic discovery and provide a more complete and customized view of service accounts in your environment.

To create a rule:

1. Go to Settings > Microsoft Defender XDR > Service accounts classification.
1. Select on **+ Create a new rule**.
1. Enter a name for the rule.
2. Optional: Add a description.
1. Select one or more of the following filters:
   - **Account display name**
   - **Account domain**
   - **Account SAM name**
   - **Organizational unit**
1. Select Create to save the rule.


For more information about Defender for Identity details, see: [Investigate assets](/defender-for-identity/investigate-assets#identity-details).

## Related content
- [Service principal names](/windows/win32/ad/service-principal-names)
- [How to configure SPN](/windows-server/identity/ad-ds/manage/how-to-configure-spn?tabs=add%2Caduc)

If you run into any problems, we're here to help. To get assistance or support for your product issue, see how to open a support ticket at [Microsoft Defender for Identity support](support.md).
