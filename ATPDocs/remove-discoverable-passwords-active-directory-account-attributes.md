---
title:  'Security Assessment: Remove Discoverable Passwords in Active Directory Account Attributes' (Preview)
description: Learn how to identify and address discoverable passwords in Active Directory account attributes to mitigate security risks and improve your organization's security posture.
ms.date: 08/04/2025
ms.topic: how-to
---

# Security Assessment: Remove discoverable passwords in Active Directory account attributes (Preview)


## Why do discoverable passwords in Active Directory account attributes pose a risk?

Certain free-text attributes are often overlooked during hardening but are readable by any authenticated user in the domain. When credentials or clues are mistakenly stored in these attributes, attackers can abuse them to move laterally across the environment or escalate privileges—often without triggering traditional alerts.

Attackers seek low-friction paths to expand access. Exposed passwords in these attributes represent an easy win because:

- The attributes aren't access-restricted.

- They aren't monitored by default.

- They provide context attackers can exploit for lateral movement and privilege escalation.

Removing exposed credentials from these attributes reduces the risk of identity compromise and strengthens your organization’s security posture.


## How does Microsoft Defender for Identity detect discoverable passwords?

> [!NOTE] 
> This security recommendation is part of Microsoft Defender for Identity and is powered by AI-based analysis of free-text attributes in Active Directory. 
> Findings can include false positives. Always validate the results before taking action.

Microsoft Defender for Identity detects potential credential exposure in Active Directory by analyzing commonly used free-text attributes. This includes looking for common password formats, hints,  `'description'`, `'info'`, and `'adminComment'` fields, and other contextual clues that might suggest the presence of credential misuse. Microsoft Defender for Identity detects indicators such as:

- Plaintext passwords or variations. For example, '`Password=Summer2024!'`

- Credential patterns, reset hints, or sensitive account information. 

- Other indicators suggesting operational misuse of directory fields. 

Detected matches are surfaced in **Secure Score** and the **Security Assessment report** for review and remediation.


## Remediation steps 

To address this security assessment, follow these steps:

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions](https://security.microsoft.com/securescore?viewid=actions) for Remove discoverable passwords in Active Directory account attributes.
1. Review the exposed entries in the security report. Identify any field content that includes:

    - Cleartext passwords

    - Reset instructions or credential clues

    - Sensitive business or system information

1. Remove sensitive information from the listed attribute fields using standard directory management tools (for example, PowerShell or ADSI Edit).
1. Fully remove the sensitive information. Don’t just mask the value. Partial obfuscation (for example, P@ssw***) can still offer useful clues to attackers.

> [!NOTE]
> Assessments are updated in near real time. Scores and statuses are updated every 24 hours. The list of impacted entities is updated within a few minutes of you implementing the recommendations. The status might take time until it's marked as **Completed**.

## Related articles

- [Learn more about Microsoft Secure Score](/defender-xdr/microsoft-secure-score)
