---
title: Edit misconfigured certificate templates owner (ESC4) | Microsoft Defender for Identity
description: This article provides an overview of Microsoft Defender for Identity's misconfigured certificate templates owner (ESC4) security posture assessment report.
ms.date: 11/14/2023
ms.topic: how-to
---

# Security assessment: Edit misconfigured certificate templates owner (ESC4) (Preview)

This article provides an overview of Microsoft Defender for Identity's **Misconfigured certificate templates owner (ESC4)** security posture assessment report.

## What is a misconfigured certificate template owner?

A certificate template is an Active Directory object with an owner, who controls access to the object and the ability to edit the object.

If the owner permissions grant a built-in, unprivileged group with permissions that allow for template setting changes, an adversary can introduce a template misconfiguration, escalate privileges, and compromise the entire domain. 

Examples of built-in, unprivileged groups are *Authenticated users*, *Domain users*, or *Everyone*. Examples of permissions that allow for template setting changes are *Full control* or *Write DACL*.


## How do I use this security assessment to improve my organizational security posture?

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for a misconfigured certificate template owner.  For example:

    :::image type="content" source="media/secure-score/misconfigured-owner.png" alt-text="Screenshot of the Edit misconfigured certificate templates owner (ESC4) recommendation." lightbox="media/secure-score/misconfigured-owner.png":::

1. Research why the template owner might be misconfigured.
1. Remediate the issue by changing the owner to a privileged and monitored user.

Make sure to test your settings in a controlled environment before turning them on in production.

[!INCLUDE [secure-score-note](../includes/secure-score-note.md)]


## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
