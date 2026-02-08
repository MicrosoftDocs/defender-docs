---
title: What's new | Microsoft Defender for Identity
description: This article is updated frequently to let you know what's new in the latest release of Microsoft Defender for Identity.
ms.date: 11/30/2025
ms.topic: overview
#CustomerIntent: As a Defender for Identity customer, I want to know what's new in the latest release of Defender for Identity, so that I can take advantage of new features and functionality.
ms.reviewer: AbbyMSFT
---

# What's new in Microsoft Defender for Identity

This article is updated frequently to let you know what's new in the latest releases of Microsoft Defender for Identity.

## What's new scope and references

Defender for Identity releases are deployed gradually across customer tenants. If there's a feature documented here that you don't see yet in your tenant, check back later for the update.

For more information, see also:

- [What's new in Microsoft Defender XDR](/microsoft-365/security/defender/whats-new)
- [What's new in Microsoft Defender for Endpoint](/microsoft-365/security/defender-endpoint/whats-new-in-microsoft-defender-endpoint)
- [What's new in Microsoft Defender for Cloud Apps](/cloud-app-security/release-notes)

For updates about versions and features released six months ago or earlier, see the [What's new archive for Microsoft Defender for Identity](whats-new-archive.md).

## January 2026

### Identity inventory enhancements are now generally available

- **Accounts tab in Identity Inventory**: The new **Accounts** tab provides a consolidated view of all accounts associated with an identity, including accounts from Active Directory, Microsoft Entra ID, and supported non-Microsoft identity providers. For more information, see [Manage related identities and accounts](manage-related-identities-accounts.md).
- **Manually link and unlink accounts**: Manually link or unlink accounts from an identity directly in the **Accounts** tab. This capability helps you correlate identity components from different directory sources and provides a complete identity context during investigations. For more information, see [Manage related identities and accounts](manage-related-identities-accounts.md).
- **Identity-level remediation actions**: You can now perform remediation actions such as disabling accounts or resetting passwords on one or more accounts linked to an identity. For more information, see [Remediation actions](remediation-actions.md#roles-and-permissions).
- **New advanced hunting table**: Advanced hunting in Microsoft Defender now includes the **[IdentityAccountInfo](
/defender-xdr/advanced-hunting-identityaccountinfo-table)** table. This table provides account information from various sources, including Microsoft Entra ID, and links to the identity that owns the account.


### MDI alerts migrated to the unified Defender alerting experience
As part of the ongoing transition to a unified alerting experience across Microsoft Defender products, some alerts were converted from the Microsoft Defender for Identity classic format to the MDI XDR alert format. Keep in mind that all alerts are based on detections from Defender for Identity sensors. See [Microsoft Defender for Identity XDR security alerts](alerts-xdr.md) for the full list of XDR alerts.

### New Health Alert: Sensor v3.x RPC Audit Misconfigured
Enhanced RPC auditing is required for some Microsoft Defender for Identity advanced identity detections. A new health alert helps identify v3.x sensors where this configuration is either missing or incorrectly applied. The alert is being rolled out gradually to customers. For more information, see [Configure RPC on sensors v3.x](deploy/prerequisites-sensor-version-3.md#configure-rpc-auditing).

### Automatic Windows event auditing configuration for Defender for Identity sensors v3.x (preview)
We’re gradually rolling out automatic Windows event-auditing configuration for sensors v3.x, along with related health alerts. Automatic Windows event-auditing streamlines deployment by automatically applying the required auditing settings to new sensors and correcting misconfigurations on existing ones. 
This update may identify existing auditing configuration gaps that were not previously detected. 
To ensure consistent protection, we recommend that you make sure all servers with the v3 sensors are configured with:
- the latest Windows cumulative update 
- Automatic Windows event auditing enabled 
For more information, see [Configure automatic windows auditing](deploy/configure-windows-event-collection.md#configure-defender-for-identity-to-collect-windows-events-automatically-preview).

|Version number|Updates|
|---|---|
|2.254|The sensor now supports a new DNS zone target for *.aatp.gcc.azure.com. Make sure your sensors in GCC can access this zone with your sensor dns prefix.|

### New security posture assessment: Identify service accounts in privileged groups

This identity security posture assessment lists Active Directory service accounts with direct or nested membership in privileged groups.

You can use this assessment to identify service accounts with elevated permissions and take action when privileged access isn’t required.

For more information, see:[Security posture assessment: Identify service accounts in privileged groups](security-posture-assessments/accounts.md#identify-service-accounts-in-privileged-groups)

### New security posture assessment: Locate accounts in built-in Operator Groups

This identity security posture assessment lists Active Directory accounts that are members of built-in Operator Groups, including direct and indirect membership. 

You can use this assessment to review legacy or unnecessary operator access and take action when elevated access isn’t required.

For more information, see:[Security posture assessment: Locate accounts in built-in Operator Groups](security-posture-assessments/accounts.md#locate-accounts-in-built-in-operator-groups)

## December 2025

### New properties for 'sensorCandidate' resource type in Graph-API (preview)

|Property|Type|Description|
|---|---|---|
|domainName|String|The domain name of the sensor.|
|senseClientVersion|String|The version of the Defender for Identity sensor client.|

This capability is currently in preview and available in API Beta version. Learn more [here](/graph/api/resources/security-sensorcandidate?view=graph-rest-beta&preserve-view=true)

### ADWS LDAP search in Advanced Hunting

New ADWS LDAP search activity is now available in the 'IdentityQueryEvents' table in Advanced Hunting. This can provides visibility into directory queries performed through ADWS, helping customers track these operations and create custom detection based on this data.

|Version number|Updates|
|---|---|
|2.253|Includes bug fixes and stability improvements for the Microsoft Defender for Identity sensor.|
|2.252|Includes bug fixes and stability improvements for the Microsoft Defender for Identity sensor.|

## November 2025

|Version number|Updates|
|---|---|
|2.251|The enhanced ADWS LDAP and legacy password-based LDAP query methods now capture a broader range of unique events at scale. As a result, you might notice an increase in recorded activity.|

### Identity Inventory enhancements: Accounts tab, manual account linking and unlinking, and expanded remediation actions

The following new features are now available in Microsoft Defender for Identity:

**Accounts tab in Identity Inventory**:

A new Accounts tab provides a consolidated view of all accounts associated with an identity, including accounts from Active Directory, Microsoft Entra ID, and supported non-Microsoft identity providers. For more information, see: [Manage related identities and accounts (Preview)](manage-related-identities-accounts.md)

**Manual link and unlink of accounts**:

You can now manually link or unlink accounts from an identity directly in the Accounts tab. This capability helps you correlate identity components from different directory sources and provides a complete identity context during investigations.
For more information, see: [Manage related identities and accounts](manage-related-identities-accounts.md).

**Identity-level remediation actions**:

You can now perform remediation actions such as disabling accounts or resetting passwords on one or more accounts linked to an identity. For more information, see: [Remediation actions](remediation-actions.md#roles-and-permissions).

### New security posture assessment: Change password for on-premises account with potentially leaked credentials (Preview)

The new security posture assessment lists users whose valid credentials were leaked. For more information, see: [Change password for on-premises account with potentially leaked credentials (Preview)](/defender-for-identity/security-posture-assessments/accounts#change-password-for-on-prem-account-with-potentially-leaked-credentials-preview)

### Microsoft Defender for Identity sensor version updates

|Version number|Updates|
|---|---|
|2.250|The improved event log query method captures a broader range of unique events at scale. As a result, you might notice an increase in captured activities. This update also includes security and performance improvements.|

### Expansion of identity scoping: Support for Organizational units (Preview)

In addition to the GA release of scoping by Active Directory domains a few months ago, you can now scope by **Organizational Units (OUs)** as part of XDR User Role-Based Access Control (URBAC). This enhancement provides even more granular control over which entities and resources are included in security analysis.

For more information, see [Configure scoped access for Microsoft Defender for Identity](configure-scoped-access.md).

## October 2025

We're excited to announce that the Microsoft Defender for Identity sensor v3.x is now generally available (GA).
The [Microsoft Defender for Identity sensor v3.x](/defender-for-identity/deploy/activate-sensor) provides enhanced coverage, improved performance across your environment and offering easier deployment and management for domain controllers.

### Microsoft Defender for Identity sensor version updates

|Version number|Updates|
|---|---|
|2.249|The improved event log query method now captures a broader range of unique events at scale. As a result, you might notice an increase in captured activities. This update also delivers other security enhancements and performance improvements.|

## Next steps

- [What is Microsoft Defender for Identity?](what-is.md)
- [Frequently asked questions](technical-faq.yml)
- [Defender for Identity prerequisites](prerequisites.md)
- [Defender for Identity capacity planning](capacity-planning.md)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
