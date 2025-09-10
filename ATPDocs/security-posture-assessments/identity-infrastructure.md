---
title: Identity infrastructure
description: 'Learn about Microsoft Defender for Identity security posture assessments for identity infrastructure.'
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 09/10/2025
ms.reviewer: LiorShapiraa
---

# Identity infrastructure

Learn about Microsoft Defender for Identity security posture assessments for identity infrastructure.

|Recommended action  |Description  |
|---------|---------|
|[Remediation for Built-in Active Directory Guest account is enabled](#remediation-for-built-in-active-directory-guest-account-is-enabled) |This recommendation indicates whether an AD Guest account is enabled in your environment. The goal is to ensure that the Guest account of the domain isn't enabled. The on-premises Guest account is a built-in, non-nominative account that allows anonymous access to Active Directory. Enabling this account permits access to the domain without requiring a password, potentially posing a security threat. |
|


## Remediation for Built-in Active Directory Guest account is enabled


1. Review the list of exposed entities to discover if there's a Guest account, which is enabled.  

1. Take appropriate action on those accounts by **disabling** the account.

   For example:

:::image type="content" source="../media/built-in-active-directory-guest-account-is-enabled/guest-account.png" alt-text="Screenshot that shows guest properties.":::

:::image type="content" source="../media/built-in-active-directory-guest-account-is-enabled/security-report.png" alt-text="Screenshot that shows the Built-in Active Directory account is enabled.":::
