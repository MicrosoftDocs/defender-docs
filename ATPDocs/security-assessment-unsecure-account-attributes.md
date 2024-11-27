---
title: Unsecure account attributes assessment
description: This article provides an overview of Microsoft Defender for Identity's entities with unsecure attributes identity security posture assessment report.
ms.date: 07/02/2023
ms.topic: how-to
---

# Security assessment: Unsecure account attributes

## What are unsecure account attributes?

Microsoft Defender for Identity continuously monitors your environment to identify accounts with attribute values that expose a security risk, and reports on these accounts to assist you in protecting your environment.

## What risk do unsecure account attributes pose?

Organizations that fail to secure their account attributes leave the door unlocked for malicious actors.

Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. Accounts configured with unsecure attributes are windows of opportunity for attackers and can expose risks.

For example, if the **PasswordNotRequired** attribute is enabled, an attacker can easily access the account. This is especially risky if the account has privileged access to other resources.

## How do I use this security assessment?

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your accounts have unsecure attributes.

    ![Review top impacted entities and create an action plan.](media/cas-isp-unsecure-account-attributes-1.png)
1. Take appropriate action on those user accounts by modifying or removing the relevant attributes.

## Remediation

Use the remediation appropriate to the relevant attribute as described in the following table.

| Recommended action | Remediation | Reason |
| --- | --- | --- |
| Remove Do not require Kerberos preauthentication| Remove this setting from account properties in Active Directory (AD) | Removing this setting requires a Kerberos pre-authentication for the account resulting in improved security. |
| Remove Store password using reversible encryption | Remove this setting from account properties in AD | Removing this setting prevents easy decryption of the account's password. |
| Remove Password not required | Remove this setting from account properties in AD | Removing this setting requires a password to be used with the account and helps prevent unauthorized access to resources. |
| Remove Password stored with weak encryption | Reset the account password | Changing the account's password enables stronger encryption algorithms to be used for its protection. |
| Enable Kerberos AES encryption support | Enable AES features on the account properties in AD | Enabling AES128_CTS_HMAC_SHA1_96 or AES256_CTS_HMAC_SHA1_96 on the account helps prevent the use of weaker encryption ciphers for Kerberos authentication. |
| Remove Use Kerberos DES encryption types for this account | Remove this setting from account properties in AD | Removing this setting enables the use of stronger encryption algorithms for the account's password. |
| Remove a Service Principal Name (SPN) | Remove this setting from account properties in AD | When a user account is configured with an SPN set, it means that the account has been associated with one or more SPNs. This typically occurs when a service is installed or registered to run under a specific user account, and the SPN is created to uniquely identify the service workspace for Kerberos authentication. This recommendation only showed for sensitive accounts. |

Use the **UserAccountControl** flag to manipulate user account profiles. For more information, see:

- [Windows Server troubleshooting](/troubleshoot/windows-server/identity/useraccountcontrol-manipulate-account-properties) documentation.
- [User Properties - Account Section](/previous-versions/windows/it-pro/windows-server-2008-r2-and-2008/dd861342(v=ws.11))
- [Introduction to Active Directory Administrative Center Enhancements (Level 100)](/windows-server/identity/ad-ds/get-started/adac/introduction-to-active-directory-administrative-center-enhancements--level-100-)
- [Active Directory Administration Center](/previous-versions/windows/it-pro/windows-server-2008-r2-and-2008/dd871105(v=ws.11))

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours.  While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as **Completed**.
> 

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)


