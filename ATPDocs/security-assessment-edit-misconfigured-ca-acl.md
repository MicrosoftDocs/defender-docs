---
title: Edit misconfigured Certificate Authority ACL (ESC7) | Microsoft Defender for Identity
description: This article provides an overview of Microsoft Defender for Identity's misconfigured certificate authority ACL security posture assessment report.
ms.date: 11/14/2023
ms.topic: how-to
---

# Security assessment: Edit misconfigured Certificate Authority ACL (ESC7)  (Preview)

This article describes Microsoft Defender for Identity's **Misconfigured certificate authority ACL** security posture assessment report.

## What is a misconfigured Certificate Authority ACL?

Certificate Authorities (CAs) maintain access control lists (ACLs) that outline roles and permissions for the CA. If access control isn't configured correctly, any user might be allowed to interfere with the CA settings, circumventing security measures, and potentially compromise the entire domain.

The effect of a misconfigured ACL varies based on the type of permission applied. For example:

- If an unprivileged user holds the *Manage Certificates* right, they can approve pending certificate requests, bypassing the *Manager approval* requirement. 
- With the *Manage CA* right, the user can modify CA settings, such as adding the *User specifies SAN* flag (`EDITF_ATTRIBUTESUBJECTALTNAME2`), creating an artificial misconfiguration that might later lead to a complete domain compromise.

## Prerequisites

This assessment is available only to customers who installed a sensor on an AD CS server. For more information, see [New sensor type for Active Directory Certificate Services (AD CS)](whats-new.md#new-sensor-type-for-active-directory-certificate-services-ad-cs).

## How do I use this security assessment to improve my organizational security posture?

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for misconfigured Certificate Authority ACLs. For example:

    :::image type="content" source="media/secure-score/misconfigured-certificate-authority.png" alt-text="Screenshot of the Edit misconfigured Certificate Authority ACL (ESC7) recommendation." lightbox="media/secure-score/misconfigured-certificate-authority.png":::

1. Research why the CA ACL is misconfigured.
1. Remediate the issues by removing all permissions that grant unprivileged built-in groups with *Manage CA* and/or *Manage certificates* permissions.

Make sure to test your settings in a controlled environment before turning them on in production.

[!INCLUDE [secure-score-note](../includes/secure-score-note.md)]


## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
