---
title: What's new | Microsoft Defender for Identity
description: This article is updated frequently to let you know what's new in the latest release of Microsoft Defender for Identity.
ms.date: 03/12/2026
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

## March 2026

### Migrate Defender for Identity sensors from v2.x to v3.x

You can now migrate Defender for Identity sensors from v2.x to v3.x directly from the Microsoft Defender portal. The v2.x sensor continues running during the migration until the v3.x sensor is ready, so there's no downtime. Eligible servers appear as **Ready for migration** on the **Sensors** page, and migration takes up to 20 minutes. For more information, see [Migrate to Defender for Identity sensor v3.x](deploy/migrate-to-sensor-v3.md).

### Sensor v3.x support for domain controllers with additional identity roles

Defender for Identity sensor v3.x now supports domain controllers that also run AD FS, AD CS, or Microsoft Entra Connect identity roles. Detections and identity security posture management (ISPM) recommendations for these roles will roll out gradually, starting with Microsoft Entra Connect. For v3, these domain controllers require Windows Server 2019 or later with at least the [March 2026 Cumulative Update](https://support.microsoft.com/topic/march-10-2026-kb5078766-os-build-20348-4893-fa3ee26a-0877-47d7-a4b2-9dd632ea8cea). For deployment details, see [Defender for Identity deployment overview](deploy/deploy-defender-identity.md) and [Sensor v3.x prerequisites](deploy/prerequisites-sensor-version-3.md).

### New Defender for Identity security alerts

These new alerts were added to the Defender for Identity security alerts:

**New alerts related to Entra ID**:

- [Attempt to disable Defender for Identity service principal observed](alerts-xdr.md#attempt-to-disable-defender-for-identity-service-principal-observed)
- [Suspicious Entra account enablement after disruption](alerts-xdr.md#suspicious-entra-account-enablement-after-disruption)
- [Suspicious Intune device registration activity](alerts-xdr.md#suspicious-intune-device-registration-activity)
- [Suspicious OS switch sign-in](alerts-xdr.md#suspicious-os-switch-sign-in)
- [Suspicious shared client infrastructure activity](alerts-xdr.md#suspicious-shared-client-infrastructure-activity)
- [Suspicious sign-in from unusual user agent and IP address using PowerShell](alerts-xdr.md#suspicious-sign-in-from-unusual-user-agent-and-ip-address-using-powershell)
- [Suspicious sign-in from unusual user agent and IP address using device code flow](alerts-xdr.md#suspicious-sign-in-from-unusual-user-agent-and-ip-address-using-device-code-flow)

**New alerts related to Active Directory**:

- [Suspicious on-prem account enablement after disruption](alerts-xdr.md#suspicious-on-prem-account-enablement-after-disruption)
- [Suspicious resource-based constrained delegation (RBCD) attribute change](alerts-xdr.md#suspicious-resource-based-constrained-delegation-rbcd-attribute-change)
- [Suspicious resource-based constrained delegation (RBCD) authentication](alerts-xdr.md#suspicious-resource-based-constrained-delegation-rbcd-authentication)

### Suspected pass-the-ticket attack alert is now generally available

The [Suspected pass-the-ticket attack](alerts-xdr.md#suspected-pass-the-ticket-attack) alert is now generally available. This alert was previously available in public preview as *Pass-the-Ticket (PtT) attack*. For more information, see [Lateral movement alerts](alerts-xdr.md).

### Updates to Secure Score category calculations for increased accuracy

To improve accuracy and better protect organizational identities, some security recommendations categorized as **Cloud apps** recommendations are now considered identity‑related and grouped under the **Identity** category. While the total Secure Score remains unchanged, individual identity and app scores may change.

### Continued rollout of new health alert: Sensor v3.x RPC audit misconfigured

The **Sensor v3.x RPC Audit Misconfigured** health alert is continuing to be rolled out gradually to customers.  The new health alert helps identify v3.x sensors where Enhanced RPC auditing configuration is either missing or incorrectly applied. Enhanced RPC auditing is required for some Microsoft Defender for Identity advanced identity detections.  For more information, see [Configure RPC on sensors v3.x](deploy/prerequisites-sensor-version-3.md#configure-rpc-auditing).

## February 2026

### Defender for Identity sensor updates

|Version number|Updates|
|---|---|
|2.255|This sensor update includes bug fixes.|

### New Defender for Identity security alerts

These new alerts were added to the Defender for Identity security alerts:

**New alerts related to Entra ID**:

- [Suspicious user configuration change activity from Entra ID sync application](alerts-xdr.md#suspicious-user-configuration-change-activity-from-entra-id-sync-application)
- [Anomalous OAuth device code authentication activity](alerts-xdr.md#anomalous-oauth-device-code-authentication-activity)
- [Suspicious Graph API request made from Entra ID sync application](alerts-xdr.md#suspicious-graph-api-request-made-from-entra-id-sync-application)
- [Suspicious sign-in observed from Entra ID sync application](alerts-xdr.md#suspicious-sign-in-observed-from-entra-id-sync-application)
- [Suspicious sign in with CSRF speedbump trigger](alerts-xdr.md#suspicious-sign-in-with-csrf-speedbump-trigger)

**New alerts related to Active Directory**:

- [Possible golden ticket attack (suspicious ticket)](alerts-xdr.md#possible-golden-ticket-attack-suspicious-ticket)
- [Possible Kerberos key list attack](alerts-xdr.md#possible-kerberos-key-list-attack)

## January 2026

### New Defender for Identity security alerts

These new alerts were added to the Defender for Identity security alerts:

**New alerts related to Entra ID**:

- [Suspicious sign-in observed from Entra ID sync application to an uncommon resource app](alerts-xdr.md#suspicious-sign-in-observed-from-entra-id-sync-application-to-an-uncommon-resource-app)
- [Suspicious sign-in observed to Entra ID sync application using an uncommon user agent](alerts-xdr.md#suspicious-sign-in-observed-to-entra-id-sync-application-using-an-uncommon-user-agent)
- [Possible OAuth code theft detected through consent abuse](alerts-xdr.md#possible-oauth-code-theft-detected-through-consent-abuse)
- [Possible adversary-in-the-middle (AiTM) attack detected (ConsentFix)](alerts-xdr.md#possible-adversary-in-the-middle-aitm-attack-detected-consentfix)
- [Skipped MFA on remembered device from uncommon ISP sign-in](alerts-xdr.md#skipped-mfa-on-remembered-device-from-uncommon-isp-sign-in)

**New alerts related to Active Directory**:

- [Pass-the-Ticket (PtT) attack](alerts-xdr.md#suspected-pass-the-ticket-attack)
- [Possible Active Directory Certificate Services enumeration](alerts-xdr.md#possible-active-directory-certificate-services-enumeration)
- [Possible Active Directory enumeration via ADWS](alerts-xdr.md#possible-active-directory-enumeration-via-adws)
- [Suspicious NTLM authentication](alerts-xdr.md#suspicious-ntlm-authentication)
- [Possible Kerberoasting attack using a stealthy LDAP search](alerts-xdr.md#possible-kerberoasting-attack-using-a-stealthy-ldap-search)
- [Suspicious Kerberos authentication (TGT request using TGS-REQ)](alerts-xdr.md#suspicious-kerberos-authentication-tgt-request-using-tgs-req)

### Identity inventory enhancements are now generally available

- **Accounts tab in Identity Inventory**: The new **Accounts*- tab provides a consolidated view of all accounts associated with an identity, including accounts from Active Directory, Microsoft Entra ID, and supported non-Microsoft identity providers. For more information, see [Manage related identities and accounts](manage-related-identities-accounts.md).
- **Manually link and unlink accounts**: Manually link or unlink accounts from an identity directly in the **Accounts*- tab. This capability helps you correlate identity components from different directory sources and provides a complete identity context during investigations. For more information, see [Manage related identities and accounts](manage-related-identities-accounts.md).
- **Identity-level remediation actions**: You can now perform remediation actions such as disabling accounts or resetting passwords on one or more accounts linked to an identity. For more information, see [Remediation actions](remediation-actions.md#roles-and-permissions).
- **New advanced hunting table**: Advanced hunting in Microsoft Defender now includes the **[IdentityAccountInfo](
/defender-xdr/advanced-hunting-identityaccountinfo-table)*- table. This table provides account information from various sources, including Microsoft Entra ID, and links to the identity that owns the account.

### New security posture assessments

- [Remove stale Active Directory accounts (Preview)](security-posture-assessments/accounts.md#remove-stale-active-directory-accounts-preview) lists any user accounts in Active Directory that are stale, meaning they haven't logged in at all during the past 90 days.
- [Microsoft Entra ID privileged user accounts that are also privileged in Active Directory (Preview)](security-posture-assessments/accounts.md#microsoft-entra-id-privileged-user-accounts-that-are-also-privileged-in-active-directory-preview) lists Microsoft Entra ID privileged user accounts that also have privileged roles in Active Directory.

### New Health Alert: Sensor v3.x RPC Audit Misconfigured
Enhanced RPC auditing is required for some Microsoft Defender for Identity advanced identity detections. A new health alert helps identify v3.x sensors where this configuration is either missing or incorrectly applied. The alert is being rolled out gradually to customers. For more information, see [Configure RPC on sensors v3.x](deploy/prerequisites-sensor-version-3.md#configure-rpc-auditing).

### Automatic Windows event auditing configuration for Defender for Identity sensors v3.x (Preview)

Weâ€™re gradually rolling out automatic Windows event-auditing configuration for sensors v3.x, along with related health alerts. Automatic Windows event-auditing streamlines deployment by automatically applying the required auditing settings to new sensors and correcting misconfigurations on existing ones.
This update might identify existing auditing configuration gaps that weren't previously detected.
To ensure consistent protection, we recommend that you make sure all servers with the v3 sensors are configured with:

- The latest Windows cumulative update.
- Automatic Windows event auditing enabled.
For more information, see [Configure automatic windows auditing](deploy/configure-windows-event-collection.md#configure-defender-for-identity-to-collect-windows-events-automatically-preview).

### Sensor updates

|Version number|Updates|
|---|---|
|2.254|The sensor now supports a new DNS zone target for *.atp.gcc.azure.com. Make sure your sensors in GCC can access this zone with your sensor DNS prefix.|

### New security posture assessment: Identify service accounts in privileged groups

This identity security posture assessment lists Active Directory service accounts with direct or nested membership in privileged groups.

You can use this assessment to identify service accounts with elevated permissions and take action when privileged access isnâ€™t required.

For more information, see:[Security posture assessment: Identify service accounts in privileged groups](security-posture-assessments/accounts.md#identify-service-accounts-in-privileged-groups)

### New security posture assessment: Locate accounts in built-in Operator Groups

This identity security posture assessment lists Active Directory accounts that are members of built-in Operator Groups, including direct and indirect membership. 

You can use this assessment to review legacy or unnecessary operator access and take action when elevated access isn't required.

For more information, see:[Security posture assessment: Locate accounts in built-in Operator Groups](security-posture-assessments/accounts.md#locate-accounts-in-built-in-operator-groups)

## December 2025

### New properties for 'sensorCandidate' resource type in Graph-API (preview)

|Property|Type|Description|
|---|---|---|
|domainName|String|The domain name of the sensor.|
|senseClientVersion|String|The version of the Defender for Identity sensor client.|

This capability is currently in preview and available in API preview version. Learn more [here](/graph/api/resources/security-sensorcandidate?view=graph-rest-beta&preserve-view=true)

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

In addition to the GA release of scoping by Active Directory domains a few months ago, you can now scope by **Organizational Units (OUs)*- as part of XDR user role-based access control (URBAC). This enhancement provides even more granular control over which entities and resources are included in security analysis.

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
