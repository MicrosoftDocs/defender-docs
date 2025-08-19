---
title: IdentityInfo table in the advanced hunting schema
description: Learn about user account information in the IdentityInfo table of the advanced hunting schema
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: maccruz
author: schmurky
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- usx-security
- tier3
ms.custom:
- cx-ti
- cx-ah
ms.topic: reference
ms.date: 05/13/2025
appliesto: 
- Microsoft Defender XDR 
- Microsoft Sentinel in the Microsoft Defender portal
---

# IdentityInfo

The `IdentityInfo` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about user accounts obtained from various services, including Microsoft Entra ID. Use this reference to construct queries that return information from this table.

This table was renamed from `AccountInfo`. During renames, all queries saved in the portal are automatically updated. Check queries you have saved elsewhere.

Microsoft Sentinel uses a slightly expanded version of this table in Log Analytics. For more information, see [Microsoft Sentinel UEBA reference | IdentityInfo table](/azure/sentinel/ueba-reference)

For information on other tables in the advanced hunting schema, [see the advanced hunting reference](advanced-hunting-schema-tables.md).

The following schema is the unified `IdentityInfo` schema that streamlines a similar table in Microsoft Sentinel's log analytics and in Microsoft Defender XDR advanced hunting. The complete set of columns is available for Defender portal users who have onboarded Microsoft Sentinel and turned on the User and Entity Behavior Analytics (UEBA) service. 

Defender portal users who haven't onboarded a Microsoft Sentinel workspace that has the UEBA service turned on can't view UEBA-specific columns. Read [UEBA-specific columns](#ueba-specific-columns).

This advanced hunting table is populated by records from Microsoft Defender for Identity or Microsoft Sentinel and Microsoft Entra ID. If your organization hasn’t deployed the service in Microsoft Defender XDR, queries that use the table aren’t going to work or return any results. For more information about how to deploy Defender for Identity in Defender XDR, read [Deploy supported services](deploy-supported-services.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` [*](#mdi-only) | `datetime` | The date and time that the line was written to the database. <br><br>This is used when there are multiple lines for each identity, such as when a change is detected, or if 24 hours have passed since the last database line was added. |
| `ReportId` [*](#mdi-only) | `string` | Unique identifier for the event |
| `AccountObjectId` | `string` | Unique identifier for the account in Microsoft Entra ID |
| `AccountUpn` | `string` | User principal name (UPN) of the account |
| `OnPremSid` | `string` | On-premises security identifier (SID) of the account |
| `AccountDisplayName` | `string` | Name of the account user displayed in the address book. Typically a combination of a given or first name, a middle initial, and a last name or surname. |
| `AccountName` | `string` | User name of the account |
| `AccountDomain` [*](#mdi-only) | `string` | Domain of the account |
| `CriticalityLevel` | `int` | The criticality score of the account |
| `Type` [*](#mdi-only) | `string` | Type of identity; possible values: User, ServiceAccount |
| `DistinguishedName` [*](#mdi-only) | string | The user's [distinguished name](/previous-versions/windows/desktop/ldap/distinguished-names) |
| `CloudSid` | `string` | Cloud security identifier of the account |
| `GivenName` | `string` | Given name or first name of the account user |
| `Surname` | `string` | Surname, family name, or last name of the account user |
| `Department` | `string` | Name of the department that the account user belongs to |
| `JobTitle` | `string` | Job title of the account user |
| `EmailAddress` | `string` | SMTP address of the account |
| `SipProxyAddress` | `string` | Voice over IP (VOIP) session initiation protocol (SIP) address of the account |
| `Address` | `string` | Address of the account user |
| `City` | `string` | City where the account user is located |
| `Country` | `string` | Country/Region where the account user is located |
| `IsAccountEnabled` | `boolean` | Indicates whether the account is enabled or not |
| `Manager` [*](#mdi-only)  | `string` | The listed manager of the account user |
| `Phone` [*](#mdi-only)  | `string` | The listed phone number of the account user|
| `CreatedDateTime` [*](#mdi-only)  | `datetime` | Date and time when the account user was created |
| `ChangeSource` [*](#mdi-only)  | `string` |Identifies which identity provider or process triggered the addition of the new row. For example, the `System-UserPersistence` value is used for any rows added by an automated process.|
| `BlastRadius` | `string` | A calculation based on the position of the user in the org tree and the user's Microsoft Entra roles and permissions; possible values: Low, Medium, High|
| `CompanyName` | `string` | Name of the company for which the user works |
| `DeletedDateTime` | `datetime` | Date and time when the user account was deleted |
| `EmployeeId` | `string` | Employee identifier assigned to the user by the organization |
| `OtherMailAddresses` | `dynamic` | Additional email addresses of the user account |
| `RiskLevel` | `string` | Microsoft Entra ID risk level of the user account; possible values: Low, Medium, High |
| `RiskLevelDetails` | `string` | Details regarding the Microsoft Entra ID risk level |
| `State` | `string` | State where the sign-in occurred, if available |
| `Tags` [*](#mdi-only)  | `dynamic` | Tags assigned to the account user by Defender for Identity |
| `AssignedRoles` [*](#mdi-only) | `dynamic` | For identities from Microsoft Entra-only, the roles assigned to the account user|
| `PrivilegedEntraPimRoles` (Preview)  [**](#mdi) | `dynamic` | A snapshot of privileged role assignment schedules and eligibility schedules for the account as maintained by Microsoft Entra Privileged Identity Management (excluding activated assignments) |
| `TenantId` | `string` | Unique identifier representing your organization's instance of Microsoft Entra ID |
| `SourceSystem` [*](#mdi-only) | `string` | The source system for the record|
| `OnPremObjectId` | `string` | Active Directory object ID of the user |
| `TenantMembershipType` | `string` | User type in Microsoft Entra ID; possible values: Guest, Member|
| `RiskStatus` | `string` | Status of the user's risk; possible values: None, ConfirmedSafe, Remediated, Dismissed, AtRisk, ConfirmedCompromised, UnknownFutureValue|
| `UserAccountControl` | `string` | Security attributes of the user account in the Active Directory domain |
| `IdentityEnvironment` | `string` | Environment where the identity is used; possible values: CloudOnly, Hybrid, On-premises |
| `SourceProviders` | `dynamic` | Source providers of the accounts for the identity; possible values: ActiveDirectory, EntraID, Okta |
| `GroupMembership`	| `dynamic` |	Microsoft Entra ID groups where the user account is a member |


<a name="mdi-only"></a>* Available only for tenants with Microsoft Defender for Identity, Microsoft Defender for Cloud Apps or Microsoft Defender for Endpoint P2 licensing.<br>
<a name="mdi"></a>** Available only for tenants with Microsoft Defender for Identity.

## UEBA-specific columns
If you're using the Microsoft Defender portal but haven't onboarded a Microsoft Sentinel workspace with the UEBA service turned on, the following columns aren't available in your `IdentityInfo` table:

- `BlastRadius`
- `CompanyName`
- `DeletedDateTime`
- `EmployeeId`
- `OtherMailAddresses`
- `RiskLevel`
- `RiskLevelDetails`
- `State`
- `Tags`

For more information about UEBA, read [Advanced threat detection with User and Entity Behavior Analytics (UEBA) in Microsoft Sentinel](/azure/sentinel/identify-threats-with-entity-behavior-analytics). For more information about the different data sources in UEBA, read [Microsoft Sentinel UEBA reference](/azure/sentinel/ueba-reference).


## Related articles

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
