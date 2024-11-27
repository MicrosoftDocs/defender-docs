---
title: Edit overly permissive certificate template with privileged EKU (Any purpose EKU or No EKU) (ESC2) | Microsoft Defender for Identity
description: This article provides an overview of Microsoft Defender for Identity's overly permissive certificate template with privileged EKU security posture assessment report.
ms.date: 11/20/2023
ms.topic: how-to
---

# Security assessment: Edit overly permissive certificate template with privileged EKU (Any purpose EKU or No EKU) (ESC2)  (Preview)

This article describes Microsoft Defender for Identity's **Overly permissive certificate template with privileged EKU** security posture assessment report.

## What is an overly permissive certificate template with privileged EKU?

Digital certificates play a vital role in establishing trust and preserving integrity throughout an organization. This is true not only in Kerberos domain authentication, but also in other areas, such as code integrity, server integrity, and technologies that rely on certificates like Active Directory Federation Services (AD FS) and IPSec.

When a certificate template has no EKUs or has an *Any Purpose* EKU, and it's enrollable for any unprivileged user, certificates issued based on that template can be used maliciously by an adversary, compromising trust.

Even though the certificate can’t be used for impersonating user authentication, it compromises other components that relieve digital certificates for their trust model. Adversaries can craft TLS certificates and impersonate any website.

## How do I use this security assessment to improve my organizational security posture?

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for overly permissive certificate templates with a privileged EKU.  For example:

    :::image type="content" source="media/secure-score/permissive-certificate-template.png" alt-text="Screenshot of the Edit overly permissive certificate template with privileged EKU (Any purpose EKU or No EKU) (ESC2) recommendation." lightbox="media/secure-score/permissive-certificate-template.png":::

1. Research why the templates have a privileged EKU.
1. Remediate the issue by doing the following:

    - Restrict the template's overly permissive permissions.
    - Enforce extra mitigations like adding *Manager approval* and signing requirements if possible.

Make sure to test your settings in a controlled environment before turning them on in production.

[!INCLUDE [secure-score-note](../includes/secure-score-note.md)]


## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
