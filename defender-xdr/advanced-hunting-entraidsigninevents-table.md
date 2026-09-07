---
title: EntraIdSignInEvents table in the advanced hunting schema (preview)
description: Learn about the Microsoft Entra sign-in events table of the advanced hunting schema.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.custom:
- cx-ti
- cx-ah
- msecd-doc-authoring-1018
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: reference
ms.date: 07/27/2026
ai-usage: ai-assisted
---

# EntraIdSignInEvents

> [!IMPORTANT]
> On October 19, 2026, the `EntraIdSignInEvents` table will replace [`AADSignInEventsBeta`](advanced-hunting-aadsignineventsbeta-table.md). This change removes the latter's preview status and aligns it with the existing product branding. Both tables will coexist until `AADSignInEventsBeta` is deprecated on that date.
>
> All queries that use the `AADSignInEventsBeta` table will be migrated automatically to `EntraIdSignInEvents` on October 19, 2026. Your custom detections won't require any changes.

> [!IMPORTANT]
> Customers need to have a Microsoft Entra ID P2 license to collect and view activities for this table.

The `EntraIdSignInEvents` table in the advanced hunting schema contains information about Microsoft Entra interactive and non-interactive sign-ins. Learn more about sign-ins in [Microsoft Entra sign-in activity reports - preview](/azure/active-directory/reports-monitoring/concept-all-sign-ins).

Use this reference to construct queries that return information from the table. 

For information on other tables in the advanced hunting schema, see the [advanced hunting reference](/windows/security/threat-protection/microsoft-defender-atp/advanced-hunting-reference).

|Column name|Data type|Description|
|---|---|---|
|`Timestamp`|`datetime`|Date and time when the record was generated|
|`Application`|`string`|Application that performed the recorded action|
|`ApplicationId`|`string`|Unique identifier for the application|
|`LogonType`|`string`|Type of logon session, specifically interactive, remote interactive (RDP), network, batch, and service|
|`EndpointCall`|`string`|Information about the Microsoft Entra ID endpoint that the request was sent to and the type of request sent during sign in|
|`ErrorCode`|`int`|Contains the error code if a sign-in error occurs. To find a description of a specific error code, visit <https://aka.ms/AADsigninsErrorCodes>.|
|`CorrelationId`|`string`|Identifier of the sign-in event|
|`SessionId`|`string`|Unique number assigned to a user by a website's server for the duration of the visit or session|
|`AccountDisplayName`|`string`|Name displayed in the address book entry for the account user. This is usually a combination of the given name, middle initial, and surname of the user.|
|`AccountObjectId`|`string`|Unique identifier for the account in Microsoft Entra ID|
|`AccountUpn`|`string`|User principal name (UPN) of the account|
|`IsExternalUser`|`int`|Indicates if the user that signed in is external. Possible values: -1 (not set), 0 (not external), 1 (external).|
|`IsGuestUser`|`boolean`|Indicates whether the user that signed in is a guest in the tenant|
|`AlternateSignInName`|`string`|On-premises user principal name (UPN) of the user signing in to Microsoft Entra ID|
|`LastPasswordChangeTimestamp`|`datetime`|Date and time when the user that signed in last changed their password|
|`ResourceDisplayName`|`string`|Display name of the resource accessed. The display name can contain any character.|
|`ResourceId`|`string`|Unique identifier of the resource accessed|
|`ResourceTenantId`|`string`|Unique identifier of the tenant of the resource accessed|
|`DeviceName`|`string`|Fully qualified domain name (FQDN) of the device|
|`OSPlatform`|`string`|Platform of the operating system running on the device. Indicates specific operating systems, including variations within the same family, such as Windows 11, Windows 10, and Windows 7.|
|`DeviceTrustType`|`string`|Indicates the trust type of the device that signed in. For managed device scenarios only. Possible values are Workplace, AzureAd, and ServerAd.|
|`IsManaged`|`int`|Indicates whether the device that initiated the sign-in is a managed device (1) or not a managed device (0)|
|`IsCompliant`|`int`|Indicates whether the device that initiated the sign-in is compliant (1) or non-compliant (0)|
|`AuthenticationProcessingDetails`|`string`|Details about the authentication processor|
|`AuthenticationRequirement`|`string`|Type of authentication required for the sign-in. Possible values: multiFactorAuthentication (MFA was required) and singleFactorAuthentication (no MFA was required).|
|`TokenIssuerType`|`string`|Type of token issuer, such as Microsoft Entra ID or Active Directory Federation Services (AD FS)|
|`RiskLevelAggregated`|`int`|Aggregated risk level during sign-in. Possible values: 0 (aggregated risk level not set), 1 (none), 10 (low), 50 (medium), or 100 (high).|
|`RiskLevelDuringSignIn`|`int`|User risk level at sign-in|
|`RiskEventTypes`|`string`|Array of risk event types applicable to the event|
|`RiskState`|`int`|Indicates risky user state. Possible values: 0 (none), 1 (confirmed safe), 2 (remediated), 3 (dismissed), 4 (at risk), or 5 (confirmed compromised).|
|`UserAgent`|`string`|User agent information from the web browser or other client application|
|`ClientAppUsed`|`string`|Indicates the client app used|
|`Browser`|`string`|Details about the version of the browser used to sign in|
|`ConditionalAccessPolicies`|`string`|Details of the conditional access policies applied to the sign-in event|
|`ConditionalAccessStatus`|`int`|Status of the conditional access policies applied to the sign-in. Possible values are 0 (policies applied), 1 (attempt to apply policies failed), or 2 (policies not applied).|
|`IPAddress`|`string`|IP address assigned to the device during communication|
|`Country`|`string`|Two-letter code indicating the country/region where the client IP address is geolocated|
|`State`|`string`|State where the sign-in occurred, if available|
|`City`|`string`|City where the account user is located|
|`Latitude`|`string`|The north to south coordinates of the sign-in location|
|`Longitude`|`string`|The east to west coordinates of the sign-in location|
|`NetworkLocationDetails`|`string`|Network location details of the authentication processor of the sign-in event|
|`RequestId`|`string`|Unique identifier of the request|
|`ReportId`|`string`|Unique identifier for the event|
|`EntraIdDeviceId`|`string`|Unique identifier for the device in Microsoft Entra ID|
|`GatewayJA4`|`string`|JA4 fingerprint derived from the TLS Client Hello request that identifies the client's TLS configuration|
|`TenantId`|`string`|Unique identifier representing the organization's instance of Microsoft Entra ID|
|`Type`|`string`|Name of the table|
|`SourceSystem`|`string`|Source system for the record|
|`TimeGenerated`|`datetime`|Date and time when the record was generated|
|`UniqueTokenId`|`string`|Unique identifier for the token passed during sign-in, used to correlate the sign-in with the token request|
|`IsSignInThroughGlobalSecureAccess`|`boolean`|Indicates whether the sign-in event came through Global Secure Access|

## Related articles

- [EntraIdSpnSignInEvents](./advanced-hunting-entraidspnsigninevents-table.md)
- [Advanced hunting overview](/windows/security/threat-protection/microsoft-defender-atp/advanced-hunting-overview)
- [Learn the query language](/windows/security/threat-protection/microsoft-defender-atp/advanced-hunting-query-language)
- [Understand the schema](/windows/security/threat-protection/microsoft-defender-atp/advanced-hunting-schema-reference)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
