---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: 'Security Assessment: GPO can be modified by unprivileged accounts '
description: This recommendation lists any Group Policy Objects in your environment that can be modified by standard users which can potentially lead to the compromise of the domain.
author:      LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     10/06/2024
---

# Security Assessment: GPO can be modified by unprivileged accounts

This recommendation lists any Group Policy Objects in your environment that can be modified by standard users which can potentially lead to the compromise of the domain.

## Organization risk

Attackers may attempt to obtain information on Group Policy settings to uncover vulnerabilities that can be exploited to gain higher levels of access, understand the security measures in place within a domain, and identify patterns in domain objects. This information can be used to plan subsequent attacks, such as identifying potential paths to exploit within the target network or finding opportunities to blend in or manipulate the environment. A user, service or application that relies on these permissions may stop functioning. 

## Remediation steps

Carefully review each assigned permission, identify any dangerous permission granted, and modify them to remove any unnecessary or excessive user rights. 

## Next steps

[Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

