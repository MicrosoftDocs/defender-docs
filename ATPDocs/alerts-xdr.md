---
title:  Microsoft Defender for Identity XDR security alerts
description: This article provides a list of the sXDR ecurity alerts issued by Microsoft Defender for Identity.
ms.date: 07/29/2025
ms.topic: reference
ms.reviewer: rlitinsky
---

# Microsoft Defender XDR alerts

Microsoft Defender for Identity alerts Microsoft Defender XDR portal can appear in two different formats, depending on if they originate from Defender for Identity or Defender XDR. All alerts are based on detections from Defender for Identity sensors. The differences in layout and information are part of an ongoing transition to a unified alerting experience across Microsoft Defender products. This article lists 

To learn more about how to understand the structure, and common components of all Defender for Identity security alerts, see [View and manage alerts](understanding-security-alerts.md).

## Microsoft Defender XDR alert categories

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
|<a name="okta-anonymous-user-access"></a>Okta anonymous user access | High | xdr_OktaAnonymousUserAccess |
|<a name="password-spray-against-onelogin"></a>Password spray against OneLogin | Medium | xdr_OneLoginPasswordSpray |
|<a name="suspicious-okta-account-enumeration"></a>Suspicious Okta account enumeration | High | xdr_SuspiciousOktaAccountEnumeration |
|<a name="suspicious-onelogin-mfa-fatigue"></a>Suspicious OneLogin MFA fatigue | Medium | xdr_OneLoginMfaFatigue |
|<a name="suspicious-sign-in-made-to-an-admin-account"></a>Suspicious sign-in made to an admin account | Low | xdr_SuspiciousAdminAccountSignIn |
|<a name="suspicious-sign-in-made-using-a-malicious-certificate"></a>Suspicious sign-in made using a malicious certificate | High | xdr_SignInUsingMaliciousCertificate |
|<a name="suspicious-sign-in-to-microsoft-sentinel-app-made-using-entra-id-sync-account"></a>Suspicious sign-in to Microsoft Sentinel app made using Entra ID sync account | Low | xdr_SuspiciousMicrosoftSentinelAccessByEntraIdSyncAccount |
|<a name="suspicious-tool-used-by-a-microsoft-entra-sync-account"></a>Suspicious tool used by a Microsoft Entra Sync account | High | xdr_SuspiciousToolSyncAccountSignIn |
|<a name="sync-account-risky-sign-in-to-an-uncommon-app"></a>Sync account risky sign-in to an uncommon app | High | xdr_RiskyEntraIDSyncAccount |

## Execution alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="suspicious-remote-service-installation"></a>Suspicious remote service installation | Medium | xdr_SuspiciousRemoteServiceInstallation |


## Persistence alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="oauth-app-created-a-user"></a>OAuth app created a user | Medium | xdr_OAuthAppCreatedAUser |
|<a name="okta-privileged-api-token-created"></a>Okta privileged API token created | High | xdr_OktaPrivilegedApiTokenCreated |
|<a name="okta-privileged-api-token-updated"></a>Okta privileged API token updated | High | xdr_OktaPrivilegedApiTokenUpdated |
|<a name="suspicious-mfa-tampering-activity-by-admin-account"></a>Suspicious MFA tampering activity by admin account | Low | xdr_AdminAccountTakeover |
|<a name="suspicious-account-creation"></a>Suspicious account creation | Medium | xdr_SuspiciousAccountCreation |
|<a name="suspicious-addition-of-alternative-phone-number"></a>Suspicious addition of alternative phone number | Medium | xdr_SuspiciousMFAAddition |
|<a name="suspicious-addition-of-email"></a>Suspicious addition of email | Medium | xdr_SuspiciousMFAAddition |
|<a name="suspicious-change-to-primary-group-id"></a>Suspicious change to primary group ID | Medium | xdr_SuspiciousChangeInUserPrimaryGroupId |
|<a name="suspicious-file-modification"></a>Suspicious file modification | Medium | xdr_SuspiciousCloudFileModification |
|<a name="suspicious-guest-user-invitation"></a>Suspicious guest user invitation | Medium | xdr_SuspiciousGuestUserInvitation |
|<a name="suspicious-inbox-rule"></a>Suspicious inbox rule | Medium | xdr_SuspiciousInboxRule |
|<a name="user-was-created-and-assigned-to-sensitive-role"></a>User was created and assigned to sensitive role | Medium | xdr_SuspiciousUserCreationAndSensitiveRoleAssignment |

## Privilege escalation alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="suspicious-spn-was-added-to-a-user"></a>Suspicious SPN was added to a user | High | xdr_SuspiciousAdditionOfSpnToUser |
|<a name="suspicious-certificate-enrollment-exploit-abusing-esc15"></a>Suspicious certificate enrollment exploit abusing ESC15 | High | xdr_SuspectedCertificateEnrollmentESC15 |

## Defense evasion alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="suspicious-access-denial-to-view-primary-group-id-of-an-object"></a>Suspicious access denial to view primary group ID of an object | Medium | xdr_SuspiciousDenyAccessToPrimaryGroupId |
|<a name="suspicious-account-link"></a>Suspicious account link | Medium | xdr_SuspiciousAccountLink |

## Credential access alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="as-rep-roasting"></a>AS-REP roasting | Medium | xdr_AsrepRoastingAttack |
|<a name="honeytoken-activity"></a>Honeytoken Activity | High | xdr_HoneytokenSignInAttempt |
|<a name="negoex-relay-attack"></a>NEGOEX relay attack | High | xdr_NegoexRelayAttack |
|<a name="okta-privileged-role-assigned-to-application"></a>Okta privileged role assigned to application | High | xdr_OktaPrivilegedRoleAssignedToApplication |
|<a name="possible-as-rep-roasting-attack"></a>Possible AS-REP roasting attack | Medium | xdr_AsrepRoastingAttack |
|<a name="possible-golden-saml-attack"></a>Possible Golden SAML attack | High | xdr_PossibleGoldenSamlAttack |
|<a name="possible-netsync-attack"></a>Possible NetSync attack | High | xdr_PossibleNetsyncAttack |
|<a name="possible-account-secret-leak"></a>Possible account secret leak | Medium | xdr_CredentialStuffingToolObserved |
|<a name="possible-golden-ticket-attack"></a>Possible golden ticket attack | High | xdr_PossibleGoldenTicketAttacks |
|<a name="possible-golden-ticket-attack-cve-2021-42287-exploit"></a>Possible golden ticket attack (CVE-2021-42287 exploit) | High | xdr_PossibleGoldenTicketAttack_SuspiciousPac |
|<a name="possible-overpass-the-hash-attack"></a>Possible overpass-the-hash attack | High | xdr_PossibleOverPassTheHash |
|<a name="possible-service-principal-account-secret-leak"></a>Possible service principal account secret leak | Medium | xdr_CredentialStuffingToolObserved |
|<a name="possibly-compromised-service-principal-account-signed-in"></a>Possibly compromised service principal account signed in | Medium | xdr_CredentialStuffingToolObserved |
|<a name="possibly-compromised-user-account-signed-in"></a>Possibly compromised user account signed in | Medium | xdr_CredentialStuffingToolObserved |
|<a name="suspicious-dmsa-related-activity-detected"></a>Suspicious DMSA related activity detected | High | xdr_SuspiciousDmsaAction |
|<a name="suspicious-golden-gmsa-related-activity"></a>Suspicious Golden gMSA related activity | High | xdr_SuspiciousGoldenGmsaActivity |
|<a name="suspicious-kerberos-authentication-ap-req"></a>Suspicious Kerberos authentication (AP-REQ) | High | xdr_SuspiciousKerberosApReq |
|<a name="suspicious-kerberos-authentication-as-req"></a>Suspicious Kerberos authentication (AS-REQ) | Medium | xdr_SusKerberosAuth_AsReq |
|<a name="suspicious-kerberos-authentication-tgt-request-using-tgs-req"></a>Suspicious Kerberos authentication (TGT request using TGS-REQ) | Medium | xdr_SusKerberosAuth_S4U2selfTgsReq |
|<a name="suspicious-creation-of-esxi-group"></a>Suspicious creation of ESXi group | High | xdr_SuspiciousUserAdditionToEsxGroup |

## Discovery alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="okta-sync-service-principal-enumerated"></a>Okta sync service principal enumerated | High | xdr_OktaSyncServicePrincipalEnumeration |
|<a name="reconnaissance-related-to-sensitive-ldap-attribute"></a>Reconnaissance related to sensitive LDAP attribute | Medium | xdr_LdapSensitiveAttributeRecon | 
|<a name="suspicious-ldap-query"></a>Suspicious LDAP query | High | xdr_SuspiciousLdapQuery |

## Lateral movement alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="possible-authentication-silo-bypass"></a>Possible authentication silo bypass | High | xdr_PossibleAuthenticationSiloBypass |
|<a name="possible-takeover-of-a-microsoft-entra-seamless-sso-account"></a>Possible takeover of a Microsoft Entra seamless SSO account | High | xdr_SuspectedAzureSsoAccountTakeover |
|<a name="suspicious-activity-after-password-sync"></a>Suspicious activity after password sync | Medium | xdr_SuspiciousActivityAfterPasswordSync |

## Collection alerts

| Security alert name | Severity | Detector ID |
|---|---|---|
|<a name="possible-okta-session-theft"></a>Possible Okta session theft | High | xdr_PossibleOktaSessionTheft |


> [!NOTE]
> Contact support to disable security alerts.

## See Also
- [View and manage security alerts](understanding-security-alerts.md)
- [Investigate security alerts](/defender-for-identity/investigate-security-alerts)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)


