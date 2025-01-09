---
title: Remove non-admin accounts with DCSync permissions | Microsoft Defender for Identity
description: Learn about Microsoft Defender for Identity's `Remove non-admin accounts with DCSync permissions` security assessment in Microsoft Secure Score.
ms.date: 06/08/2023
ms.topic: how-to
---

# Security assessment: Remove non-admin accounts with DCSync permissions

This article describes the **Remove non-admin accounts with DCSync permissions** security assessment, which identifies risky DCSync permission settings.

## Why might the DCSync permission be a risk?

Accounts with the DCSync permission can initiate domain replication. Attackers can potentially exploit domain replication to gain unauthorized access, manipulate domain data, or compromise the integrity and availability of your Active Directory environment.

It's crucial to carefully manage and restrict the membership of this group to ensure the security and integrity of your domain replication process.

## How do I use this security assessment to improve my organizational security posture?

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for **Remove non-admin accounts with DCSync permissions**.

    For example:

    :::image type="content" source="media/secure-score/dcsync-permissions.png" alt-text="Screenshot of the Remove non-admin accounts with DCSync permissions security assessment." lightbox="media/secure-score/dcsync-permissions.png":::

1. Review this list of exposed entities to discover which of your accounts have DCSync permissions and are also nondomain admins.

1. Take appropriate action on those entities by removing their privileged access rights.

To achieve the maximum score, remediate all exposed entities.

[!INCLUDE [secure-score-note](../includes/secure-score-note.md)]


## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
