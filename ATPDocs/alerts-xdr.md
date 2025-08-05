---
title:  Microsoft Defender for Identity XDR security alerts
description: This article provides a list of the XDR security alerts issued by Microsoft Defender for Identity.
ms.date: 07/29/2025
ms.topic: reference
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity XDR alerts

Microsoft Defender for Identity alerts can appear in the Microsoft Defender XDR portal in two different formats depending on if the alert originates from Defender for Identity or Defender XDR. All alerts are based on detections from Defender for Identity sensors. The differences in layout and information are part of an ongoing transition to a unified alerting experience across Microsoft Defender products. This article lists 

To learn more about how to understand the structure, and common components of all Defender for Identity security alerts, see [View and manage alerts](understanding-security-alerts.md).

## Microsoft Defender for Identity XDR alert categories

Defender for Identity security alerts are categorized by their corresponding MITRE ATT&CK tactics. This makes it easier to understand the suspected attack technique potentially in use when a Defender for Identity alert is triggered. This page contains information on each alert, to help with your investigation and remediation tasks. This guide contains general information about the conditions for triggering alerts. Note that anomaly-based alerts are only triggered when behavior significantly deviates from established baselines.

* [Initial Access](#initial-access-alerts)
* [Execution](#execution-alerts)
* [Persistence](#persistence-alerts)
* [Privilege Escalation](#privilege-escalation-alerts)
* [Defense Evasion](#defense-evasion-alerts)
* [Credential Access](#credential-access-alerts)
* [Discovery](#discovery-alerts)
* [Lateral Movement](#lateral-movement-alerts)
* [Collection](#collection-alerts)

## Initial Access alerts

This section describes alerts indicating that a malicious actor might be attempting to gain an initial foothold into your organization.


| Security alert name | Severity | MITRE Technique | Detector ID |
|---|---|---|---|
|<a name="okta-anonymous-user-access"></a><details><summary>Okta anonymous user access</summary><br>**Description**:<br><br>Anonymous User access was detected.</details> | High | [T1078](https://attack.mitre.org/techniques/T1078) | xdr_OktaAnonymousUserAccess |
|<a name="password-spray-against-onelogin"></a><details><summary>Password spray against OneLogin</summary><br>**Description**:<br><br>A suspicious IP address attempted to authenticate to OneLogin using multiple valid accounts. An attacker might be attempting to find valid user account credentials for later follow-on behavior.</details> | Medium | [T1110.003](https://attack.mitre.org/techniques/T1110/003) | xdr_OneLoginPasswordSpray |
|<a name="suspicious-okta-account-enumeration"></a><details><summary>Suspicious Okta account enumeration</summary><br>**Description**:<br><br>A suspicious IP address enumerated Okta accounts. An attacker might be attempting to perform discovery activities for later follow-on behavior.</details> | High | [T1078.004](https://attack.mitre.org/techniques/T1078/004) | xdr_SuspiciousOktaAccountEnumeration |
|<a name="suspicious-onelogin-mfa-fatigue"></a><details><summary>Suspicious OneLogin MFA fatigue</summary><br>**Description**:<br><br>A suspicious IP address sent several OneLogin multifactor authentication (MFA) challenge attempts for a user account. An attacker might have compromised the user's account credentials and is trying to flood and bypass the MFA mechanism.</details> | Medium | [T1110.003](https://attack.mitre.org/techniques/T1110/003) | xdr_OneLoginMfaFatigue |
|<a name="suspicious-sign-in-made-to-an-admin-account"></a><details><summary>Suspicious sign-in made to an admin account</summary><br>**Description**:<br><br>An admin account sign-in was performed in a suspicious manner. This behavior might indicate that a user account was compromised and is being used for malicious activities.</details> | Low | [T1078.001](https://attack.mitre.org/techniques/T1078/001) | xdr_SuspiciousAdminAccountSignIn |
|<a name="suspicious-sign-in-made-using-a-malicious-certificate"></a><details><summary>Suspicious sign-in made using a malicious certificate</summary><br>**Description**:<br><br>A user signed in to the organization using a malicious certificate. This behavior might indicate that a user account was compromised and is being used for malicious activities, and that a malicious domain with AAD Internals certificate is registered in the organization.</details> | High | [T1078.001](https://attack.mitre.org/techniques/T1078/001) | xdr_SignInUsingMaliciousCertificate |
|<a name="suspicious-sign-in-to-microsoft-sentinel-app-made-using-entra-id-sync-account"></a><details><summary>Suspicious sign-in to Microsoft Sentinel app made using Entra ID sync account</summary><br>**Description**:<br><br>A Microsoft Entra ID Connect sync account signed in to a Microsoft Sentinel resource in an unusual manner. This behavior might indicate that a user account was compromised and is being used for malicious activities.</details> | Low | [T1078.001](https://attack.mitre.org/techniques/T1078/001) | xdr_SuspiciousMicrosoftSentinelAccessByEntraIdSyncAccount |
|<a name="suspicious-tool-used-by-a-microsoft-entra-sync-account"></a><details><summary>Suspicious tool used by a Microsoft Entra Sync account</summary><br>**Description**:<br><br>A suspicious authentication to a Microsoft Entra ID account typically used for syncing operations was detected. This behavior might indicate that a user account has been compromised and an attacker is using it to carry out malicious activities.</details> | High | [T1078.004](https://attack.mitre.org/techniques/T1078/004) | xdr_SuspiciousToolSyncAccountSignIn |
|<a name="sync-account-risky-sign-in-to-an-uncommon-app"></a><details><summary>Sync account risky sign-in to an uncommon app</summary><br>**Description**:<br><br>A Microsoft Entra ID Connect sync account that signed in to a risky session performed unusual activities. This behavior might indicate that a user account was compromised and is being used for malicious activities.</details> | High | [T1078.001](https://attack.mitre.org/techniques/T1078/001) | xdr_RiskyEntraIDSyncAccount |

## Execution alerts

This section describes alerts indicating that a malicious actor might be attempting to run malicious code in your organization.

| Security alert name | Severity | MITRE Technique | Detector ID |
|---|---|---|---|
|<a name="suspicious-remote-service-installation"></a><details><summary>Suspicious remote service installation</summary><br>**Description**:<br><br>A suspicious service installation was detected. This service was created in order to execute potentially malicious commands. An attacker might be using stolen credentials to leverage this attack. This might also indicate that a pass-the-hash attack was used.</details> | Medium | [T1569.002](https://attack.mitre.org/techniques/T1569/002) | xdr_SuspiciousRemoteServiceInstallation |

## Persistence alerts

This section describes alerts indicating that a malicious actor might be attempting to maintain their foothold in your organization.

| Security alert name | Severity | MITRE Technique | Detector ID |
|---|---|---|---|
|<a name="oauth-app-created-a-user"></a><details><summary>OAuth app created a user</summary><br>**Description**:<br><br>A new user account was created by an OAuth application. An attacker might have compromised this application for persistence in the organization.</details> | Medium | [T1136.003](https://attack.mitre.org/techniques/T1136/003) | xdr_OAuthAppCreatedAUser |
|<a name="okta-privileged-api-token-created"></a><details><summary>Okta privileged API token created</summary><br>**Description**:<br><br>{ActorAliasName} created an API token. If stolen, it can grant the attacker access with the user's permission.</details> | High | [T1078.004](https://attack.mitre.org/techniques/T1078/004) | xdr_OktaPrivilegedApiTokenCreated |
|<a name="okta-privileged-api-token-updated"></a><details><summary>Okta privileged API token updated</summary><br>**Description**:<br><br>{ActorAliasName} updated a Privileged API token Configuration to be more promiscuous. If stolen, it can grant the attacker access with the user's permission.</details> | High | [T1078.004](https://attack.mitre.org/techniques/T1078/004) | xdr_OktaPrivilegedApiTokenUpdated |
|<a name="suspicious-mfa-tampering-activity-by-admin-account"></a><details><summary>Suspicious MFA tampering activity by admin account</summary><br>**Description**:<br><br>An administrator account performed multifactor authentication (MFA) tampering activity after a risky authentication. An attacker might have compromised an admin account to manipulate MFA settings for possible lateral movement activity.</details> | Low | [T1556.006](https://attack.mitre.org/techniques/T1556/006) | xdr_AdminAccountTakeover |
|<a name="suspicious-account-creation"></a><details><summary>Suspicious account creation</summary><br>**Description**:<br><br>A new user account was created by a compromised OAuth app. Attackers might be preparing the new user account for later use as a backdoor to move laterally across the network or access data. This alert was triggered based on another Microsoft Cloud App Security alert related to the compromised OAuth app.</details> | Medium | [T1136.003](https://attack.mitre.org/techniques/T1136/003) | xdr_SuspiciousAccountCreation |
|<a name="suspicious-addition-of-alternative-phone-number"></a><details><summary>Suspicious addition of alternative phone number</summary><br>**Description**:<br><br>A new alternative phone number was added for multiple users in suspicious way. An attacker might have done this to gain persistence in the organization.</details> | Medium | [T1556.006](https://attack.mitre.org/techniques/T1556/006) | xdr_SuspiciousMFAAddition |
|<a name="suspicious-addition-of-email"></a><details><summary>Suspicious addition of email</summary><br>**Description**:<br><br>New email was added for multiple users in suspicious way. An attacker might have done this to gain persistence in the organization.</details> | Medium | [T1556.006](https://attack.mitre.org/techniques/T1556/006) | xdr_SuspiciousMFAAddition |
|<a name="suspicious-change-to-primary-group-id"></a><details><summary>Suspicious change to primary group ID</summary><br>**Description**:<br><br>A user's primary group ID was modified. An attacker might have compromised a user account and assigned a backdoor user with strong permissions in the domain for later use.</details> | Medium | [T1098](https://attack.mitre.org/techniques/T1098) | xdr_SuspiciousChangeInUserPrimaryGroupId |
|<a name="suspicious-file-modification"></a><details><summary>Suspicious file modification</summary><br>**Description**:<br><br>A user modified a file in a suspicious manner.</details> | Medium | [T1546.001](https://attack.mitre.org/techniques/T1546/001) | xdr_SuspiciousCloudFileModification |
|<a name="suspicious-guest-user-invitation"></a><details><summary>Suspicious guest user invitation</summary><br>**Description**:<br><br>A new guest user was invited and accepted in a suspicious way. An attacker might have compromised a user account in the organization and is using it to add an unauthorized user for persistence purposes.</details> | Medium | [T1136.003](https://attack.mitre.org/techniques/T1136/003) | xdr_SuspiciousGuestUserInvitation |
|<a name="suspicious-inbox-rule"></a><details><summary>Suspicious inbox rule</summary><br>**Description**:<br><br>A user modified or created an inbox rule on this device in a suspicious manner.</details> | Medium | [T1114.003](https://attack.mitre.org/techniques/T1114/003) | xdr_SuspiciousInboxRule |
|<a name="user-was-created-and-assigned-to-sensitive-role"></a><details><summary>User was created and assigned to sensitive role</summary><br>**Description**:<br><br>A new user was created and assigned to sensitive role. An attacker might have compromised the user account to perform persistence and lateral movement.</details> | Medium | [T1136.003](https://attack.mitre.org/techniques/T1136/003), [T1098.003](https://attack.mitre.org/techniques/T1098/003) | xdr_SuspiciousUserCreationAndSensitiveRoleAssignment |

## Privilege Escalation alerts

This section describes alerts indicating that a malicious actor might be attempting to gain higher-level permissions in your organization.

| Security alert name | Severity | MITRE Technique | Detector ID |
|---|---|---|---|
|<a name="suspicious-spn-was-added-to-a-user"></a><details><summary>Suspicious SPN was added to a user</summary><br>**Description**:<br><br>A suspicious service principal name (SPN) was added to a sensitive user. An attacker might be attempting to gain elevated access for lateral movement within the organization.</details> | High | [T1098](https://attack.mitre.org/techniques/T1098) | xdr_SuspiciousAdditionOfSpnToUser |
|<a name="suspicious-certificate-enrollment-exploit-abusing-esc15"></a><details><summary>Suspicious certificate enrollment exploit abusing ESC15</summary><br>**Description**:<br><br>A certificate was enrolled suspiciously. An attacker might be exploiting a vulnerability (known as ESC) to escalate privileges in the forest.</details> | High | [T1068](https://attack.mitre.org/techniques/T1068) | xdr_SuspectedCertificateEnrollmentESC15 |

## Defense Evasion alerts

This section describes alerts indicating that a malicious actor might be attempting to evade detection in your organization.

| Security alert name | Severity | MITRE Technique | Detector ID |
|---|---|---|---|
|<a name="suspicious-access-denial-to-view-primary-group-id-of-an-object"></a><details><summary>Suspicious access denial to view primary group ID of an object</summary><br>**Description**:<br><br>An access control list (ACL) denied access to view the primary group ID of an object. An attacker might have compromised a user account and is looking to hide the group of a backdoor user.</details> | Medium | [T1564.002](https://attack.mitre.org/techniques/T1564/002) | xdr_SuspiciousDenyAccessToPrimaryGroupId |
|<a name="suspicious-account-link"></a><details><summary>Suspicious account link</summary><br>**Description**:<br><br>An account was linked through a cross tenant administrative action. The action was performed in a suspicious way that may indicate the account may be used in an attempt to bypass MFA.</details> | Medium | [T1556](https://attack.mitre.org/techniques/T1556) | xdr_SuspiciousAccountLink |

## Credential Access alerts

This section describes alerts indicating that a malicious actor might be attempting to steal account names and passwords from your organization.

| Security alert name | Severity | MITRE Technique | Detector ID |
|---|---|---|---|
|<a name="as-rep-roasting"></a><details><summary>AS-REP roasting</summary><br>**Description**:<br><br>Multiple attempts to sign in without preauthentication were detected. This behavior might indicate an Authentication Server Response (AS-REP) roasting attack, which targets the Kerberos authentication protocol, specifically accounts that have turned off preauthentication.</details> | Medium | [T1558.004](https://attack.mitre.org/techniques/T1558/004) | xdr_AsrepRoastingAttack |
|<a name="honeytoken-activity"></a><details><summary>Honeytoken Activity</summary><br>**Description**:<br><br>Honeytoken user attempted to sign in</details> | High | [T1098](https://attack.mitre.org/techniques/T1098) | xdr_HoneytokenSignInAttempt |
|<a name="negoex-relay-attack"></a><details><summary>NEGOEX relay attack</summary><br>**Description**:<br><br>An attacker used NEGOEX to impersonate a server that a client wants to connect to so that the attacker can then relay the authentication process to any target. This allows the attacker to gain access to the target. NEGOEX is an authentication protocol designed to authenticate user accounts to Microsoft Entra joined devices.</details> | High | [T1187](https://attack.mitre.org/techniques/T1187), [T1557.001](https://attack.mitre.org/techniques/T1557/001) | xdr_NegoexRelayAttack |
|<a name="okta-privileged-role-assigned-to-application"></a><details><summary>Okta privileged role assigned to application</summary><br>**Description**:<br><br>{ActorAliasName} assigned {RoleDisplayName} role to application: {ApplicationDisplayName}</details> | High | [T1003.006](https://attack.mitre.org/techniques/T1003/006) | xdr_OktaPrivilegedRoleAssignedToApplication |
|<a name="possible-as-rep-roasting-attack"></a><details><summary>Possible AS-REP roasting attack</summary><br>**Description**:<br><br>A suspicious Kerberos authentication request was made to accounts that do not require preauthentication. An attacker might be performing an AS-REP roasting attack to steal passwords and gain further access into the network.</details> | Medium | [T1558.004](https://attack.mitre.org/techniques/T1558/004) | xdr_AsrepRoastingAttack |
|<a name="possible-golden-saml-attack"></a><details><summary>Possible Golden SAML attack</summary><br>**Description**:<br><br>A privileged user account authenticated with characteristics that might be related to a Golden SAML attack.</details> | High | [T1071](https://attack.mitre.org/techniques/T1071), [T1606.002](https://attack.mitre.org/techniques/T1606/002) | xdr_PossibleGoldenSamlAttack |
|<a name="possible-netsync-attack"></a><details><summary>Possible NetSync attack</summary><br>**Description**:<br><br>NetSync is a module in Mimikatz, a post-exploitation tool, that requests the password hash of a target device's password by pretending to be a domain controller. An attacker might be performing malicious activities inside the network using this feature to gain access to the organization's resources.</details> | High | [T1003.006](https://attack.mitre.org/techniques/T1003/006) | xdr_PossibleNetsyncAttack |
|<a name="possible-account-secret-leak"></a><details><summary>Possible account secret leak</summary><br>**Description**:<br><br>A failed attempt to sign in to a user account by a credential stuffing tool was detected. The error code indicates that the secret was valid but misused. The user account's credentials might have been leaked or are in the possession of an unauthorized party.</details> | Medium | [T1078](https://attack.mitre.org/techniques/T1078) | xdr_CredentialStuffingToolObserved |
|<a name="possible-golden-ticket-attack"></a><details><summary>Possible golden ticket attack</summary><br>**Description**:<br><br>A suspicious Kerberos ticket granting service (TGS) request was observed. An attacker might be using stolen credentials of the KRBTGT account to attempt a golden ticket attack.</details> | High | [T1558](https://attack.mitre.org/techniques/T1558), [T1558.001](https://attack.mitre.org/techniques/T1558/001) | xdr_PossibleGoldenTicketAttacks |
|<a name="possible-golden-ticket-attack-cve-2021-42287-exploit"></a><details><summary>Possible golden ticket attack (CVE-2021-42287 exploit)</summary><br>**Description**:<br><br>A suspicious Kerberos ticket-granting ticket (TGT) containing anomalous Kerberos Privilege Attribute Certificate (PAC) was observed. An attacker may be using stolen credentials of the KRBTGT account to attempt a golden ticket attack.</details> | High | [T1558](https://attack.mitre.org/techniques/T1558), [T1558.001](https://attack.mitre.org/techniques/T1558/001) | xdr_PossibleGoldenTicketAttack_SuspiciousPac |
|<a name="possible-overpass-the-hash-attack"></a><details><summary>Possible overpass-the-hash attack</summary><br>**Description**:<br><br>A possible overpass-the-hash attack was detected. In this type of attack, an attacker uses the NT hash of a user account or other Kerberos keys to obtain Kerberos tickets, which allows unauthorized access to network resources.</details> | High | [T1003.006](https://attack.mitre.org/techniques/T1003/006) | xdr_PossibleOverPassTheHash |
|<a name="possible-service-principal-account-secret-leak"></a><details><summary>Possible service principal account secret leak</summary><br>**Description**:<br><br>A failed attempt to sign in to a service principal account by a credential stuffing tool was detected. The error code indicates that the secret was valid but misused. The service principal account's credentials might have been leaked or are in the possession of an unauthorized party.</details> | Medium | [T1078](https://attack.mitre.org/techniques/T1078) | xdr_CredentialStuffingToolObserved |
|<a name="possibly-compromised-service-principal-account-signed-in"></a><details><summary>Possibly compromised service principal account signed in</summary><br>**Description**:<br><br>A possibly compromised service principal account signed in. A credential stuffing attempt was successfully authenticated, indicating that the service principal account's credentials might have been leaked or are in the possession of an unauthorized party.</details> | Medium | [T1078](https://attack.mitre.org/techniques/T1078) | xdr_CredentialStuffingToolObserved |
|<a name="possibly-compromised-user-account-signed-in"></a><details><summary>Possibly compromised user account signed in</summary><br>**Description**:<br><br>A possibly compromised user account signed in. A credential stuffing attempt was successfully authenticated, indicating that the user account's credentials might have been leaked or are in the possession of an unauthorized party.</details> | Medium | [T1078](https://attack.mitre.org/techniques/T1078) | xdr_CredentialStuffingToolObserved |
|<a name="suspicious-dmsa-related-activity-detected"></a><details><summary>Suspicious DMSA related activity detected</summary><br>**Description**:<br><br>A suspicious DMSA related activity was detected. This may indicate a compromised managed account or an attempt to exploit a DMSA account.</details> | High | [T1555](https://attack.mitre.org/techniques/T1555) | xdr_SuspiciousDmsaAction |
|<a name="suspicious-golden-gmsa-related-activity"></a><details><summary>Suspicious Golden gMSA related activity</summary><br>**Description**:<br><br>A suspicious read activity was made to sensitive group Managed Service Account (gMSA) objects, which could be associated with a threat actor trying to leverage the Golden gMSA attack.</details> | High | [T1555](https://attack.mitre.org/techniques/T1555) | xdr_SuspiciousGoldenGmsaActivity |
|<a name="suspicious-kerberos-authentication-ap-req"></a><details><summary>Suspicious Kerberos authentication (AP-REQ)</summary><br>**Description**:<br><br>A suspicious Kerberos application request (AP-REQ) was detected. An attacker might be using stolen credentials of a service account to attempt a silver ticket attack. In this kind of attack, an attacker forges a service ticket (Ticket Granting Service or TGS) for a specific service within a network, which allows the attacker to access that service without needing to interact with the domain controller after the initial compromise.</details> | High | [T1558](https://attack.mitre.org/techniques/T1558), [T1558.002](https://attack.mitre.org/techniques/T1558/002) | xdr_SuspiciousKerberosApReq |
|<a name="suspicious-kerberos-authentication-as-req"></a><details><summary>Suspicious Kerberos authentication (AS-REQ)</summary><br>**Description**:<br><br>A suspicious Kerberos authentication request (AS-REQ) for a ticket-granting ticket (TGT) was observed. This anomalous TGT request is suspected to have been specially crafted by an attacker. The attacker might be using stolen credentials to leverage this attack.</details> | Medium | [T1550](https://attack.mitre.org/techniques/T1550), [T1558](https://attack.mitre.org/techniques/T1558) | xdr_SusKerberosAuth_AsReq |
|<a name="suspicious-kerberos-authentication-tgt-request-using-tgs-req"></a><details><summary>Suspicious Kerberos authentication (TGT request using TGS-REQ)</summary><br>**Description**:<br><br>A suspicious Kerberos ticket-granting service request (TGS-REQ) involving the Service for User to Self (S4U2self) extension was observed. This anomalous TGS request is suspected to have been specially crafted by an attacker.</details> | Medium | [T1550](https://attack.mitre.org/techniques/T1550), [T1558](https://attack.mitre.org/techniques/T1558) | xdr_SusKerberosAuth_S4U2selfTgsReq |
|<a name="suspicious-creation-of-esxi-group"></a><details><summary>Suspicious creation of ESXi group</summary><br>**Description**:<br><br>A suspicious VMware ESXi group was created in the domain. This might indicate that an attacker is trying to get more permissions for later steps in an attack.</details> | High | [T1098](https://attack.mitre.org/techniques/T1098) | xdr_SuspiciousUserAdditionToEsxGroup |

## Discovery alerts

This section describes alerts indicating that a malicious actor might be attempting to gather information about your organization.

| Security alert name | Severity | MITRE Technique | Detector ID |
|---|---|---|---|
|<a name="okta-sync-service-principal-enumerated"></a><details><summary>Okta sync service principal enumerated</summary><br>**Description**:<br><br>A suspicious LDAP (Lightweight Directory Access Protocol) enumeration to find the Okta sync service account was detected. This behavior might indicate that a user account has been compromised and an attacker is using it to carry out malicious activities.</details> | High | [T1087.002](https://attack.mitre.org/techniques/T1087/002) | xdr_OktaSyncServicePrincipalEnumeration |
|<a name="reconnaissance-related-to-sensitive-ldap-attribute"></a><details><summary>Reconnaissance related to sensitive LDAP attribute</summary><br>**Description**:<br><br>Reconnaissance activities related to sensitive Lightweight Directory Access Protocol (LDAP) attributes were detected on this device. An attacker might have compromised a user account and is looking for information for use in their next steps.</details> | Medium | [T1087.002](https://attack.mitre.org/techniques/T1087/002) | xdr_LdapSensitiveAttributeRecon |
|<a name="suspicious-ldap-query"></a><details><summary>Suspicious LDAP query</summary><br>**Description**:<br><br>A suspicious Lightweight Directory Access Protocol (LDAP) query associated with a known attack tool was detected. An attacker might be performing reconnaissance for later steps.</details> | High | [T1087.002](https://attack.mitre.org/techniques/T1087/002) | xdr_SuspiciousLdapQuery |

## Lateral Movement alerts

This section describes alerts indicating that a malicious actor might be attempting to move between resources or identities in your organization.

| Security alert name | Severity | MITRE Technique | Detector ID |
|---|---|---|---|
|<a name="possible-authentication-silo-bypass"></a><details><summary>Possible authentication silo bypass</summary><br>**Description**:<br><br>A possible attempt to bypass authentication silo policies and authenticate against a silo-protected service was detected on this device.</details> | High | [T1550](https://attack.mitre.org/techniques/T1550) | xdr_PossibleAuthenticationSiloBypass |
|<a name="possible-takeover-of-a-microsoft-entra-seamless-sso-account"></a><details><summary>Possible takeover of a Microsoft Entra seamless SSO account</summary><br>**Description**:<br><br>A Microsoft Entra seamless SSO (single sign-on) account object, AZUREADSSOACC, was modified suspiciously. An attacker might be moving laterally from the on-premises environment to the cloud.</details> | High | [T1556](https://attack.mitre.org/techniques/T1556) | xdr_SuspectedAzureSsoAccountTakeover |
|<a name="suspicious-activity-after-password-sync"></a><details><summary>Suspicious activity after password sync</summary><br>**Description**:<br><br>A user performed an uncommon action on an application after a recent password sync. An attacker might have compromised a user's account to perform malicious activities in the organization.</details> | Medium | [T1021.007](https://attack.mitre.org/techniques/T1021/007) | xdr_SuspiciousActivityAfterPasswordSync |

## Collection alerts

This section describes alerts indicating that a malicious actor might be attempting to gather data of interest to their goal from your organization.

| Security alert name | Severity | MITRE Technique | Detector ID |
|---|---|---|---|
|<a name="possible-okta-session-theft"></a><details><summary>Possible Okta session theft</summary><br>**Description**:<br><br>A new connection using a possibly stolen Okta session cookie was initiated. An attacker might have stolen a session cookie and is now using it to perform a malicious action.</details> | High | [T1539](https://attack.mitre.org/techniques/T1539) | xdr_PossibleOktaSessionTheft |
