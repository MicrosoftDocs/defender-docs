---
title:  Microsoft Defender for Identity XDR security alerts
description: This article provides a list of the sXDR ecurity alerts issued by Microsoft Defender for Identity.
ms.date: 07/29/2025
ms.topic: reference
ms.reviewer: rlitinsky
---

# Microsoft Defender XDR alerts categories

Microsoft Defender for Identity alerts Microsoft Defender XDR portal can appear in two different formats, depending on if they originate from Defender for Identity or Defender XDR. All alerts are based on detections from Defender for Identity sensors. The differences in layout and information are part of an ongoing transition to a unified alerting experience across Microsoft Defender products. This article lists 

To learn more about how to understand the structure, and common components of all Defender for Identity security alerts, see [View and manage alerts](understanding-security-alerts.md).

## Microsoft Defender XDR alerts categories

Defender for Identity security alerts are divided into the following categories or phases, like the phases seen in a typical cyber-attack kill chain. Learn more about each phase, the alerts designed to detect each attack, and how to use the alerts to help protect your network using the following links:

* [Initial Access](#initial-access-alerts)
* [Execution](#execution-alerts)
* [Persistence](#persistence-alerts)
* [Privilege Escalation](#privilege-escalation-alerts)
* [Defense Evasion](#defense-evasion-alerts)
* [Credential Access](#credential-access-alerts)
* [Discovery](#discovery-alerts)
* [Lateral Movement](#lateral-movement-alerts)
* [Collection](#collection-alerts)

## Initial access alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="okta-anonymous-user-access">Okta anonymous user access</a> | High | xdr_OktaAnonymousUserAccess |
|<a name="password-spray-against-onelogin">Password spray against OneLogin</a> | Medium | xdr_OneLoginPasswordSpray |
|<a name="suspicious-okta-account-enumeration">Suspicious Okta account enumeration</a> | High | xdr_SuspiciousOktaAccountEnumeration |
|<a name="suspicious-onelogin-mfa-fatigue">Suspicious OneLogin MFA fatigue</a> | Medium | xdr_OneLoginMfaFatigue |
|<a name="suspicious-sign-in-made-to-an-admin-account">Suspicious sign-in made to an admin account</a> | Low | xdr_SuspiciousAdminAccountSignIn |
|<a name="suspicious-sign-in-made-using-a-malicious-certificate">Suspicious sign-in made using a malicious certificate</a> | High | xdr_SignInUsingMaliciousCertificate |
|<a name="suspicious-sign-in-to-microsoft-sentinel-app-made-using-entra-id-sync-account">Suspicious sign-in to Microsoft Sentinel app made using Entra ID sync account</a> | Low | xdr_SuspiciousMicrosoftSentinelAccessByEntraIdSyncAccount |
|<a name="suspicious-tool-used-by-a-microsoft-entra-sync-account">Suspicious tool used by a Microsoft Entra Sync account</a> | High | xdr_SuspiciousToolSyncAccountSignIn |
|<a name="sync-account-risky-sign-in-to-an-uncommon-app">Sync account risky sign-in to an uncommon app</a> | High | xdr_RiskyEntraIDSyncAccount |

## Execution alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="suspicious-remote-service-installation">Suspicious remote service installation</a> | Medium | xdr_SuspiciousRemoteServiceInstallation |


## Persistence alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="oauth-app-created-a-user">OAuth app created a user</a> | Medium | xdr_OAuthAppCreatedAUser |
|<a name="okta-privileged-api-token-created">Okta privileged API token created</a> | High | xdr_OktaPrivilegedApiTokenCreated |
|<a name="okta-privileged-api-token-updated">Okta privileged API token updated</a> | High | xdr_OktaPrivilegedApiTokenUpdated |
|<a name="suspicious-mfa-tampering-activity-by-admin-account">Suspicious MFA tampering activity by admin account</a> | Low | xdr_AdminAccountTakeover |
|<a name="suspicious-account-creation">Suspicious account creation</a> | Medium | xdr_SuspiciousAccountCreation |
|<a name="suspicious-addition-of-alternative-phone-number">Suspicious addition of alternative phone number</a> | Medium | xdr_SuspiciousMFAAddition |
|<a name="suspicious-addition-of-email">Suspicious addition of email</a> | Medium | xdr_SuspiciousMFAAddition |
|<a name="suspicious-change-to-primary-group-id">Suspicious change to primary group ID</a> | Medium | xdr_SuspiciousChangeInUserPrimaryGroupId |
|<a name="suspicious-file-modification">Suspicious file modification</a> | Medium | xdr_SuspiciousCloudFileModification |
|<a name="suspicious-guest-user-invitation">Suspicious guest user invitation</a> | Medium | xdr_SuspiciousGuestUserInvitation |
|<a name="suspicious-inbox-rule">Suspicious inbox rule</a> | Medium | xdr_SuspiciousInboxRule |
|<a name="user-was-created-and-assigned-to-sensitive-role">User was created and assigned to sensitive role</a> | Medium | xdr_SuspiciousUserCreationAndSensitiveRoleAssignment |

## Privilege escalation alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="suspicious-spn-was-added-to-a-user">Suspicious SPN was added to a user</a> | High | xdr_SuspiciousAdditionOfSpnToUser |
|<a name="suspicious-certificate-enrollment-exploit-abusing-esc15">Suspicious certificate enrollment exploit abusing ESC15</a> | High | xdr_SuspectedCertificateEnrollmentESC15 |

## Defense evasion alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="suspicious-access-denial-to-view-primary-group-id-of-an-object">Suspicious access denial to view primary group ID of an object</a> | Medium | xdr_SuspiciousDenyAccessToPrimaryGroupId |
|<a name="suspicious-account-link">Suspicious account link</a> | Medium | xdr_SuspiciousAccountLink |

## Credential access alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="as-rep-roasting">AS-REP roasting</a> | Medium | xdr_AsrepRoastingAttack |
|<a name="honeytoken-activity">Honeytoken Activity</a> | High | xdr_HoneytokenSignInAttempt |
|<a name="negoex-relay-attack">NEGOEX relay attack</a> | High | xdr_NegoexRelayAttack |
|<a name="okta-privileged-role-assigned-to-application">Okta privileged role assigned to application</a> | High | xdr_OktaPrivilegedRoleAssignedToApplication |
|<a name="possible-as-rep-roasting-attack">Possible AS-REP roasting attack</a> | Medium | xdr_AsrepRoastingAttack |
|<a name="possible-golden-saml-attack">Possible Golden SAML attack</a> | High | xdr_PossibleGoldenSamlAttack |
|<a name="possible-netsync-attack">Possible NetSync attack</a> | High | xdr_PossibleNetsyncAttack |
|<a name="possible-account-secret-leak">Possible account secret leak</a> | Medium | xdr_CredentialStuffingToolObserved |
|<a name="possible-golden-ticket-attack">Possible golden ticket attack</a> | High | xdr_PossibleGoldenTicketAttacks |
|<a name="possible-golden-ticket-attack-cve-2021-42287-exploit">Possible golden ticket attack (CVE-2021-42287 exploit)</a> | High | xdr_PossibleGoldenTicketAttack_SuspiciousPac |
|<a name="possible-overpass-the-hash-attack">Possible overpass-the-hash attack</a> | High | xdr_PossibleOverPassTheHash |
|<a name="possible-service-principal-account-secret-leak">Possible service principal account secret leak</a> | Medium | xdr_CredentialStuffingToolObserved |
|<a name="possibly-compromised-service-principal-account-signed-in">Possibly compromised service principal account signed in</a> | Medium | xdr_CredentialStuffingToolObserved |
|<a name="possibly-compromised-user-account-signed-in">Possibly compromised user account signed in</a> | Medium | xdr_CredentialStuffingToolObserved |
|<a name="suspicious-dmsa-related-activity-detected">Suspicious DMSA related activity detected</a> | High | xdr_SuspiciousDmsaAction |
|<a name="suspicious-golden-gmsa-related-activity">Suspicious Golden gMSA related activity</a> | High | xdr_SuspiciousGoldenGmsaActivity |
|<a name="suspicious-kerberos-authentication-ap-req">Suspicious Kerberos authentication (AP-REQ)</a> | High | xdr_SuspiciousKerberosApReq |
|<a name="suspicious-kerberos-authentication-as-req">Suspicious Kerberos authentication (AS-REQ)</a> | Medium | xdr_SusKerberosAuth_AsReq |
|<a name="suspicious-kerberos-authentication-tgt-request-using-tgs-req">Suspicious Kerberos authentication (TGT request using TGS-REQ)</a> | Medium | xdr_SusKerberosAuth_S4U2selfTgsReq |
|<a name="suspicious-creation-of-esxi-group">Suspicious creation of ESXi group</a> | High | xdr_SuspiciousUserAdditionToEsxGroup |

## Discovery alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="okta-sync-service-principal-enumerated">Okta sync service principal enumerated</a> | High | xdr_OktaSyncServicePrincipalEnumeration |
|<a name="reconnaissance-related-to-sensitive-ldap-attribute">Reconnaissance related to sensitive LDAP attribute</a> | Medium | xdr_LdapSensitiveAttributeRecon | 
|<a name="suspicious-ldap-query">Suspicious LDAP query</a> | High | xdr_SuspiciousLdapQuery |

## Lateral movement alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="possible-authentication-silo-bypass">Possible authentication silo bypass</a> | High | xdr_PossibleAuthenticationSiloBypass |
|<a name="possible-takeover-of-a-microsoft-entra-seamless-sso-account">Possible takeover of a Microsoft Entra seamless SSO account</a> | High | xdr_SuspectedAzureSsoAccountTakeover |
|<a name="suspicious-activity-after-password-sync">Suspicious activity after password sync</a> | Medium | xdr_SuspiciousActivityAfterPasswordSync |

## Collection alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="possible-okta-session-theft">Possible Okta session theft</a> | High | xdr_PossibleOktaSessionTheft |


> [!NOTE]
> Contact support to disable security alerts.

## See Also
- [View and manage security alerts](understanding-security-alerts.md)
- [Investigate security alerts](/defender-for-identity/investigate-security-alerts)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)


