---
title:  'Security Assessment: Remove Discoverable Passwords in Active Directory Account Attributes'
description: Learn how to identify and address discoverable passwords in Active Directory account attributes to mitigate security risks and improve your organization's security posture.
ms.date: 08/04/2025
ms.topic: how-to
---

# Security Assessment: Remove discoverable passwords in Active Directory account attributes


## Why do discoverable passwords in Active Directory account attributes pose a risk?

Attackers often seek low-friction paths to expand access. Exposed passwords in free-text fields represent an easy win. These fields are often overlooked during hardening but are readable by any authenticated user in the domain. When credentials or clues are mistakenly stored in these fields, attackers can abuse them to move laterally across the environment or escalate privileges—often without triggering traditional alerts.

## How does Microsoft Defender for Identity detect discoverable passwords?

[!NOTE] 
> This security recommendation is part of Microsoft Defender for Identity and is powered by AI-based analysis of free-text attributes in Active Directory. 
> Results can include false positives should be manually reviewed to validate accuracy before taking action.

Microsoft Defender for Identity detects credential exposure in Active Directory by analyzing commonly used free-text attributes. This includes looking for common password formats, hints,  description, info, and adminComment fields, as well as other contextual clues that may suggest the presence of credential misuse.


It analyzes attributes for: 

- Plaintext passwords or variations. For example, Password=Summer2024!

- Credential patterns, reset hints, or sensitive account information 

- Other indicators suggesting operational misuse of directory fields 

Detected matches are surfaced in Secure Score and the Security Assessment report for review and remediation. 


## Remediation steps 

To address this security assessment, follow these steps:

> [!IMPORTANT]
>  Don’t just mask the value fully remove it. Partial obfuscation (for example, P@ssw***) can still offer useful clues to attackers.

1. Review the exposed entries in the security report. Identify any field content that includes:

    - Cleartext passwords

    - Reset instructions or credential clues

    - Sensitive business or system information

1. Remove sensitive information from the listed attribute fields using standard directory management tools (for example, PowerShell or ADSI Edit).

> [!NOTE]
> Assessments are updated in near real time, and scores and statuses are updated every 24 hours. The list of impacted entities is updated within a few minutes of your implementing the recommendations. The status might take time until it's marked as **Completed**.