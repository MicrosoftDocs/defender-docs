---
title: Password protection in Microsoft Defender
description: Learn how the Password protection page in Microsoft Defender helps you find leaked credentials, exposed passwords, and weak password policies across your identity sources.
#customer intent: As a security admin, I want to see password-related risks across my identity sources so that I can find exposed credentials, weak policies, and configuration issues and take action to reduce risk.
author: AbbyMSFT
ms.author: abbyweisberg
ms.date: 03/17/2026
ms.topic: concept-article
ms.service: defender-xdr
ms.custom: msecd-doc-authoring-106
ai-usage: ai-assisted
---

# Password protection in Microsoft Defender

The **Password protection** page in Microsoft Defender shows password-related risks across your identity sources in one place. Use it to find leaked credentials, exposed passwords, weak password policies, and configuration issues, and then take action directly from the page. It supports on-premises Active Directory, cloud identity providers like Microsoft Entra ID, and non-Microsoft providers like Okta.

## Prerequisites

To access the Password protection page, you need:

- A Microsoft Defender for Identity license, or another license that includes Defender for Identity (such as E5), and a Microsoft Entra ID Protection license.
- A user role with at least [Security Reader](/azure/active-directory/roles/permissions-reference#security-reader) permissions.

## Page layout and identity sources

In the Microsoft Defender portal, select **Identities** > **Password protection**.

The page includes a left panel where you select the identity source you want to review. Supported identity sources include:

- **Active Directory**: Available on all four tabs.
- **Microsoft Entra ID**: Available on the Leaked Credentials tab.
- **Okta**: Available on the Password Hygiene and Password Policies tabs.

## Password Hygiene

The **Password Hygiene** tab shows password weaknesses that attackers commonly exploit. Each item is a recommendation you can act on to reduce risk.

## Password Policies

The **Password Policies** tab shows password policies from your identity providers side by side. Use this tab to check whether your password policies meet current security standards.

| Column | Description |
|---|---|
| **Name** | The name of the password policy. |
| **Provider** | The identity provider that enforces the policy. |
| **Maximum password age** | The maximum number of days before a password must be changed. |
| **Minimum password age** | The minimum number of days before a password can be changed. |
| **Password history length** | The number of previous passwords that can't be reused. |
| **Password complexity** | Whether password complexity requirements are enabled. |
| **Lockout threshold** | The number of failed sign-in attempts before the account is locked. |
| **Lockout duration** | The duration of the account lockout after the threshold is reached. |

## Leaked Credentials

The **Leaked Credentials** tab shows accounts with credentials that were found outside your organization, for example on public paste sites or the dark web.

Exposures are sourced from:

- Public paste sites
- Law enforcement intelligence
- Dark web and underground research

From this tab, you can reset passwords or disable accounts, individually or in bulk, to prevent misuse.

## Exposed Passwords

The **Exposed Passwords** tab shows accounts and settings that store or expose passwords in insecure ways, such as in plain text or in easily discoverable locations.

Examples include:

- Clear-text or discoverable credentials stored in Active Directory attributes, identified using AI-based detection.
- Reversible passwords embedded in Group Policy Objects (GPOs).

## Common columns

The Password Hygiene, Leaked Credentials, and Exposed Passwords tabs share the following columns:

| Column | Description |
|---|---|
| **Name** | The display name of the account. |
| **SID** | The Security Identifier of the account. |
| **Entity type** | The type of entity (for example, User or Computer). |
| **Domain** | The Active Directory domain the account belongs to. |
| **Service account type** | The type of service account, if applicable. |

## Related content

- [The Identity Security dashboard](/defender-for-identity/dashboard)
- [View your identity coverage and maturity](/defender-xdr/identity-security/coverage-maturity)
- [Unified identity security recommendations](/defender-xdr/identity-security/identity-security-recommendations)
