---
title: Custom account correlation rules in Defender for Identity
description: Learn how to create custom account correlation rules in Defender for Identity to automatically correlate accounts that don't share strong identifiers.
author: AbbyMSFT
ms.author: abbyweisberg
ms.service: microsoft-defender-for-identity
ms.topic: how-to
ms.custom: msecd-doc-authoring-106
ms.date: 03/17/2026
ai-usage: ai-assisted

#customer intent: As a security admin using Microsoft Defender for Identity, I want to create custom account correlation rules so that I can automatically correlate accounts that don't share strong identifiers and get full identity visibility.

---

# Create custom account correlation rules

Custom account correlation rules allow you to correlate accounts that don't share strong identifiers such as account ID, SID, object ID, or UPN. This is especially useful for privileged accounts with unique naming conventions. By defining custom policies, you get full visibility and better protection for all accounts.

## Prerequisites

- An active Microsoft Defender for Identity license, or another license that includes Defender for Identity (such as an E5 license). Without the required license, the policies page is read-only.
- One of the following roles to **view** policies:
  - **Microsoft Entra ID roles**: Security Reader, Security Operator, Security Administrator, or Global Administrator
  - **Microsoft Defender unified RBAC roles**: Security operations, Security data, Alerts (manage)
- One of the following roles to **create, edit, or remove** policies:
  - **Microsoft Entra ID roles**: Security Administrator or Global Administrator
  - **Microsoft Defender unified RBAC roles**: Security operations, Security data, Alerts (manage)

> [!TIP]
> Use the least-privileged role that meets your needs. If your organization uses [Microsoft Entra Privileged Identity Management (PIM)](/entra/id-governance/privileged-identity-management/pim-configure), request just-in-time role activation instead of permanent role assignments.

## Choose a correlation type

Before you create a rule, decide which correlation type fits your scenario. The following table describes the available options:

| Correlation type | Description | Example |
|---|---|---|
| **Root UPN Prefix** | Correlates accounts with matching prefixes before the '@' symbol. | `user@acme.com` and `adm_user@acme.com` share the prefix `user`. |
| **Root UPN Suffix** | Correlates accounts with matching suffixes after the '@' symbol. | `user@acme.com` and `user_svc@acme.com` share the suffix `@acme.com`. |
| **Domain UPN** | Correlates accounts across different domains with the same username. | `user@acme.com` and `user@contoso.com`. |
| **Employee ID** | Correlates accounts that share the same employee ID. | Two accounts with the same employee ID value are linked to one identity. |

## Add a correlation rule

1. In the Microsoft Defender portal at [https://security.microsoft.com](https://security.microsoft.com), go to **Settings** > **Identities**.
1. Select **Account Correlation Rules**.
1. Select **Add Rule**.
1. In the wizard, enter a **Rule Name** (up to 50 characters). You can use letters, numbers, and the following special characters: `. - _ ! # ^ ~`.
1. Select the **Correlation Type** (Root UPN Prefix, Root UPN Suffix, Domain UPN, or Employee ID).
1. Enter the required values for the selected correlation type, such as prefixes, suffixes, domains, or employee IDs.
1. Review the summary, which includes the rule name, correlation type, and selected values.
1. Select **Submit** to create the rule.

> [!NOTE]
> Correlation rule changes take effect within 12 hours.

## Edit a correlation rule

1. On the **Account Correlation Rules** page, select the checkbox next to the rule you want to edit. You can select only one rule at a time.
1. Select **Edit**.
1. In the wizard, update the rule configuration as needed.
1. Review your changes, and then select **Save**.

Changes take effect within 12 hours.

## Remove a correlation rule

1. On the **Account Correlation Rules** page, select the checkbox next to the rule you want to remove.
1. Select **Delete**.
1. In the confirmation prompt, select **Remove** to confirm, or **Cancel** to abort.

> [!NOTE]
> Correlation rule changes take effect within 12 hours.

## Related content

- [Manage related identities and accounts](/defender-for-identity/manage-related-identities-accounts)
- [View the identity inventory](/defender-for-identity/identity-inventory)
