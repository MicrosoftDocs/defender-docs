---
title: Certificates
description: This article provides an overview of Microsoft Defender for Identity's certificate security posture assessment report.
ms.date: 09/14/2025
ms.topic: how-to
ms.reviewer: LiorShapiraa
---

# Security assessment: Certificates

This article describes Microsoft Defender for Identity's **Certificates** security posture assessment report.

> [!NOTE]
> Make sure to test your settings in a controlled environment before turning them on in production.
> While assessments are updated in near real time, scores and statuses are updated every 24 hours.  While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as **Completed**.

## Enforce encryption for RPC certificate enrollment interface (ESC11)


**Description**

Active Directory Certificate Services (AD CS) supports certificate enrollment using the RPC protocol, specifically with the MS-ICPR interface. In such cases, the CA settings determine the security settings for the RPC interface, including the requirement for packet privacy.

If the `IF_ENFORCEENCRYPTICERTREQUEST` flag is turned on, the RPC interface only accepts connections with the `RPC_C_AUTHN_LEVEL_PKT_PRIVACY` authentication level. This is the highest authentication level, and requires each packet to be signed and encrypted so as to prevent any kind of relay attack. This is similar to `SMB Signing` in the SMB protocol.

If the RPC enrollment interface doesn't require packet privacy, it becomes vulnerable to relay attacks (ESC11). The `IF_ENFORCEENCRYPTICERTREQUEST` flag is on by default, but is often turned off to allow clients that can't support the required RPC authentication level, such as clients running Windows XP. 

>[!NOTE]
>This assessment is available only to customers who have installed a sensor on an AD CS server. 

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for enforcing encryption for RPC certificate enrollment.

    :::image type="content" source="../media/secure-score/enforce-encryption-rpc-certificate.png" alt-text="Screenshot of the Enforce encryption for RPC certificate enrollment interface (ESC11) recommendation.":::


1. Research why the `IF_ENFORCEENCRYPTICERTREQUEST` flag is turned off.

1. Make sure to turn the `IF_ENFORCEENCRYPTICERTREQUEST` flag on to remove the vulnerability.

    To turn on the flag, run:

    ```cmd
    certutil -setreg CA\InterfaceFlags +IF_ENFORCEENCRYPTICERTREQUEST
    ```

    To restart the service, run:

    ```cmd
    net stop certsvc & net start certsvc
    ```

  Make sure to test your settings in a controlled environment before turning them on in production.




## Edit insecure ADCS certificate enrollment IIS endpoints (ESC8)

**Description**

Active Directory Certificate Services (AD CS) supports certificate enrollment through various methods and protocols, including enrollment via HTTP using the Certificate Enrollment Service (CES) or the Web Enrollment interface (Certsrv).

If the IIS endpoint allows NTLM authentication without enforcing protocol signing (HTTPS) or without enforcing Extended Protection for Authentication (EPA), it becomes vulnerable to NTLM relay attacks (ESC8). Relay attacks can lead to complete domain takeover if an attacker manages to pull it off successfully.

> [!NOTE]
>This assessment is available only to customers who have installed a sensor on an AD CS server. For more information, see [Configure sensors for AD FS, AD CS, and Microsoft Entra Connect](../deploy/active-directory-federation-services.md).

**Implementation**


Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for insecure AD CS certificate enrollment IIS endpoints.

The assessment lists the problematic HTTP endpoints in your organization and guidance to configuring the endpoints securely.

Once handled, the ESC8 attack risk is mitigated, reducing your attack surface significantly.


## Edit misconfigured certificate templates owner (ESC4)

This article provides an overview of Microsoft Defender for Identity's **Misconfigured certificate templates owner (ESC4)** security posture assessment report.

**Description**

A certificate template is an Active Directory object with an owner, who controls access to the object and the ability to edit the object.

If the owner permissions grant a built-in, unprivileged group with permissions that allow for template setting changes, an adversary can introduce a template misconfiguration, escalate privileges, and compromise the entire domain. 

Examples of built-in, unprivileged groups are *Authenticated users*, *Domain users*, or *Everyone*. Examples of permissions that allow for template setting changes are *Full control* or *Write DACL*.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for a misconfigured certificate template owner.

   :::image type="content" source="../media/secure-score/misconfigured-owner.png" alt-text="Screenshot of the Edit misconfigured certificate templates owner (ESC4) recommendation." lightbox="../media/secure-score/misconfigured-owner.png":::


1. Research why the template owner might be misconfigured.
1. Remediate the issue by changing the owner to a privileged and monitored user.



## Edit misconfigured Certificate Authority ACL (ESC7)


**Description**

Certificate Authorities (CAs) maintain access control lists (ACLs) that outline roles and permissions for the CA. If access control isn't configured correctly, any user might be allowed to interfere with the CA settings, circumventing security measures, and potentially compromise the entire domain.

The effect of a misconfigured ACL varies based on the type of permission applied. For example:

- If an unprivileged user holds the *Manage Certificates* right, they can approve pending certificate requests, bypassing the *Manager approval* requirement. 
- With the *Manage CA* right, the user can modify CA settings, such as adding the *User specifies SAN* flag (`EDITF_ATTRIBUTESUBJECTALTNAME2`), creating an artificial misconfiguration that might later lead to a complete domain compromise.

### Prerequisites

This assessment is available only to customers who installed a sensor on an AD CS server. 

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for misconfigured Certificate Authority ACLs. For example:

    :::image type="content" source="../media/secure-score/misconfigured-certificate-authority.png" alt-text="Screenshot of the Edit misconfigured Certificate Authority ACL (ESC7) recommendation." lightbox="../media/secure-score/misconfigured-certificate-authority.png":::

1. Research why the CA ACL is misconfigured.
1. Remediate the issues by removing all permissions that grant unprivileged built-in groups with *Manage CA* and/or *Manage certificates* permissions.



## Edit misconfigured certificate templates ACL (ESC4)

**Description**

Certificate templates are Active Directory objects with an ACL controlling the access to the object. Besides determining enrollment permissions, the ACL also determines permissions for editing the object itself.

If for any reason, there's an entry in the ACL that grants a built-in, unprivileged group with permissions that allow for template setting changes, an adversary can introduce a template misconfiguration, escalate privileges, and compromise the entire domain. 

Examples of built-in, unprivileged groups are *Authenticated users*, *Domain users*, or *Everyone*. Examples of permissions that allow for template setting changes are *Full control* or *Write DACL*.

**Implementation**

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for a misconfigured certificate template ACL. For example:

    :::image type="content" source="../media/secure-score/misconfigured-certificate-acl.png" alt-text="Screenshot of the Edit misconfigured certificate templates ACL (ESC4) recommendation." lightbox="../media/secure-score/misconfigured-certificate-acl.png":::

1. Research why the template ACL might be misconfigured.
1. Remediate the issue by removing any entry that grants unprivileged group permissions that allow tampering with the template.
1. Remove the certificate template from being published by any CA if they're not needed.



## Edit misconfigured enrollment agent certificate template (ESC3)

**Description**    

Typically, users have an Enrollment Agent that enrolls their certificates for them. Under specific circumstances, Enrollment Agent certificates can enroll certificates for any eligible user, posing a risk to your organization. 

When Microsoft Defender for Identity reports about Enrollment Agent certificate templates that endanger your organization, risky Enrollment Agent templates are listed on the **Exposed entities** pane.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for misconfgured enrollment agent certificate templates.  For example:

    :::image type="content" source="../media/secure-score/misconfigured-enrollment-agent.png" alt-text="Screenshot of the Edit misconfigured enrollment agent certificate template (ESC3) recommendation." lightbox="../media/secure-score/misconfigured-enrollment-agent.png":::

1. Remediate the issues by performing at least one of the following steps:

    - Remove the *Certificate request agent* EKU.
    - Remove overly permissive enrollment permissions, which allow any user to enroll certificates based on that certificate template. Templates marked as vulnerable by Defender for Identity have at least one access list entry that allows enrollment for a built-in unprivileged group, making this exploitable by any user. Examples of built-in, unprivileged groups are *Authenticated Users* or *Everyone*.
    - Turn on the CA certificate *Manager approval* requirement.
    - Remove the certificate template from being published by any CA. Templates that aren't published can't be requested, and therefore can't be exploited.
    - Use Enrollment Agent restrictions on the Certificate Authority level. For example, you might want to restrict which users are allowed to act as an Enrollment Agent, and which templates can be requested.



## Edit overly permissive certificate template with privileged EKU (Any purpose EKU or No EKU) (ESC2)

**Description**

Digital certificates play a vital role in establishing trust and preserving integrity throughout an organization. This is true not only in Kerberos domain authentication, but also in other areas, such as code integrity, server integrity, and technologies that rely on certificates like Active Directory Federation Services (AD FS) and IPSec.

When a certificate template has no EKUs or has an *Any Purpose* EKU, and it's enrollable for any unprivileged user, certificates issued based on that template can be used maliciously by an adversary, compromising trust.

Even though the certificate can’t be used for impersonating user authentication, it compromises other components that relieve digital certificates for their trust model. Adversaries can craft TLS certificates and impersonate any website.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for overly permissive certificate templates with a privileged EKU.  For example:

    :::image type="content" source="../media/secure-score/permissive-certificate-template.png" alt-text="Screenshot of the Edit overly permissive certificate template with privileged EKU (Any purpose EKU or No EKU) (ESC2) recommendation." lightbox="../media/secure-score/permissive-certificate-template.png":::

1. Research why the templates have a privileged EKU.
1. Remediate the issue by doing the following:

    - Restrict the template's overly permissive permissions.
    - Enforce extra mitigations like adding *Manager approval* and signing requirements if possible.


## Prevent Certificate Enrollment with arbitrary Application Policies (ESC15)

**Description**

This recommendation directly addresses the recently published [CVE-2024-49019](https://msrc.microsoft.com/update-guide/advisory/CVE-2024-49019), which highlights security risks associated with vulnerable AD CS configurations. This security posture assessment lists all vulnerable certificate templates found in customer environments due to unpatched AD CS servers.

Certificate templates that are vulnerable to [CVE-2024-49019](https://msrc.microsoft.com/update-guide/en-US/advisory/CVE-2024-49019) allow an attacker to issue a certificate with arbitrary Application Policies and Subject Alternative Name. The certificate can be used to escalate privileges, possibly resulting with full domain compromise. 

These certificate templates expose organizations to significant risks, as they enable attackers to issue certificates with arbitrary Application Policies and Subject Alternative Names (SANs). Such certificates can be exploited to escalate privileges and potentially compromise the entire domain. In particular, these vulnerabilities allow non-privileged users to issue certificates that can authenticate as high-privileged accounts, posing a severe security threat.

> [!NOTE]
> This assessment is available only to customers who installed a sensor on an AD CS server. For more information, see [New sensor type for Active Directory Certificate Services (AD CS)](/defender-for-identity/whats-new).

**Implementation**

1. Review the recommended action at [Prevent Certificate Enrollment with arbitrary Application Policies (ESC15)](https://security.microsoft.com/securescore?viewid=actions).  

2. **Identify the vulnerable certificate templates:**  
   - Remove enrollment permission for unprivileged users.  
   - Disable the **“Supply in the request”** option.

3. Identify the AD CS servers which are vulnerable to CVE-2024-49019 and apply the relevant patch. 


   :::image type="content" source="../media/prevent-certificate-enrollment-esc15/exposed-entities-identitified.png" alt-text="Screenshot of exposed entities for Identified AD CS servers that are vulnerable.":::



## Prevent users to request a certificate valid for arbitrary users based on the certificate template (ESC1)  (Preview)


**Description**

Each certificate is associated with an entity through its subject field. However, certificates also include a *Subject Alternative Name* (SAN) field, which allows the certificate to be valid for multiple entities.

The SAN field is commonly used for web services hosted on the same server, supporting the use of a single HTTPS certificate instead of separate certificates for each service. When the specific certificate is also valid for authentication, by containing an appropriate EKU, such as *Client Authentication*, it can be used to authenticate several different accounts.

If a certificate template has the *Supply in the request* option turned on, the template is vulnerable, and attackers might be able to enroll a certificate that's valid for arbitrary users.

> [!IMPORTANT]
> If the certificate is also permitted for authentication and there aren't any mitigation measures enforced, such as *Manager approval* or required authorized signatures, the certificate template is dangerous as it allows any unprivileged user to take over any arbitrary user, including a domain admin user.
>
> This specific setting is one of the most common misconfigurations.
> 

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for certificate requests for arbitrary users. For example:

    :::image type="content" source="../media/secure-score/prevent-certificate-arbitrary-users.png" alt-text="Screenshot of the Prevent users to request a certificate valid for arbitrary users based on the certificate template (ESC1) recommendation." lightbox="../media/secure-score/prevent-certificate-arbitrary-users.png":::

1. To remediate certificate requests for arbitrary users, perform at least one of the following steps:

    - Turn off *Supply in the request* configuration.

    - Remove any EKUs that enable user authentication, such as *Client Authentication*, *Smartcard logon*, *PKINIT client authentication*, or *Any purpose*.

    - Remove overly permissive enrollment permissions, which allow any user to enroll certificate based on that certificate template.

        Certificate templates marked as vulnerable by Defender for Identity have at least one access list entry that supports enrollment for a built-in, unprivileged group, making this exploitable by any user. Examples of built-in, unprivileged groups include *Authenticated Users* or *Everyone*.

    - Turn on the CA certificate *Manager approval* requirement.

    - Remove the certificate template from being published by any CA. Templates that aren't published can't be requested, and therefore can't be exploited.


    
## Edit vulnerable Certificate Authority setting (ESC6)  (Preview)

**Description**

Each certificate is associated with an entity through its subject field. However, a certificate also includes a *Subject Alternative Name* (SAN) field, which allows the certificate to be valid for multiple entities.

The SAN field is commonly used for web services hosted on the same server, supporting the use of a single HTTPS certificate instead of separate certificates for each service. When the specific certificate is also valid for authentication, by containing an appropriate EKU, such as *Client Authentication*, it can be used to authenticate several different accounts.

Unprivileged users that can specify the users in the SAN settings can lead to immediate compromise, and post a great risk to your organization.

If the AD CS `editflags` > `EDITF_ATTRIBUTESUBJECTALTNAME2` flag is turned on, each user can specify the SAN settings for their certificate request. This, in turn affects all certificate templates, whether they have the `Supply in the request` option turned on or not.

If there's a template where the `EDITF_ATTRIBUTESUBJECTALTNAME2` setting is turned on, and the template is valid for authentication, an attacker can enroll a certificate that can impersonate any arbitrary account.

> [!NOTE]
> This assessment is available only to customers who installed a sensor on an AD CS server.

**Implementation**


1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for editing vulnerable Certificate Authority settings.  For example:

    :::image type="content" source="../media/secure-score/vulnerable-certificate-authority-settings.png" alt-text="Screenshot of the Edit vulnerable Certificate Authority setting (ESC6) recommendation." lightbox="../media/secure-score/vulnerable-certificate-authority-settings.png":::

1. Research why the `EDITF_ATTRIBUTESUBJECTALTNAME2` setting is turned on.

1. Turn off the setting by running:

    ```cmd
    certutil -setreg policy\EditFlags -EDITF_ATTRIBUTESUBJECTALTNAME2
    ```

1. Restart the service by running:

    ```cmd
    net stop certsvc & net start certsvc
    ```

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
