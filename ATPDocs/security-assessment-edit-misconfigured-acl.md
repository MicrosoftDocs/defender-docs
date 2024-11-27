---
title: Edit misconfigured certificate templates ACL (ESC4) | Microsoft Defender for Identity
description: This article provides an overview of Microsoft Defender for Identity's misconfigured certificate template ACL security posture assessment report.
ms.date: 11/20/2023
ms.topic: how-to
---

# Security assessment: Edit misconfigured certificate templates ACL (ESC4)  (Preview)

This article describes Microsoft Defender for Identity's **Misconfigured certificate template ACL** security posture assessment report.

## What is a misconfigured certificate template ACL?

Certificate templates are Active Directory objects with an ACL controlling the access to the object. Besides determining enrollment permissions, the ACL also determines permissions for editing the object itself.

If for any reason, there's an entry in the ACL that grants a built-in, unprivileged group with permissions that allow for template setting changes, an adversary can introduce a template misconfiguration, escalate privileges, and compromise the entire domain. 

Examples of built-in, unprivileged groups are *Authenticated users*, *Domain users*, or *Everyone*. Examples of permissions that allow for template setting changes are *Full control* or *Write DACL*.


## How do I use this security assessment to improve my organizational security posture?

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for a misconfigured certificate template ACL. For example:

    :::image type="content" source="media/secure-score/misconfigured-certificate-acl.png" alt-text="Screenshot of the Edit misconfigured certificate templates ACL (ESC4) recommendation." lightbox="media/secure-score/misconfigured-certificate-acl.png":::

1. Research why the template ACL might be misconfigured.
1. Remediate the issue by removing any entry that grants unprivileged group permissions that allow tampering with the template.
1. Remove the certificate template from being published by any CA if they're not needed.

Make sure to test your settings in a controlled environment before turning them on in production.

[!INCLUDE [secure-score-note](../includes/secure-score-note.md)]


## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
