---
title: 'Group policy security assessments'
description: 'This section provides security assessments related to Group Policy Objects (GPOs) in Active Directory environments.'
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 09/15/2025
ms.reviewer: LiorShapiraa
---

# Group policy security assessments



## GPO can be modified by unprivileged accounts

**Description**

This recommendation lists any Group Policy Objects in your environment that can be modified by standard users which can potentially lead to the compromise of the domain.

Attackers may attempt to obtain information on Group Policy settings to uncover vulnerabilities that can be exploited to gain higher levels of access, understand the security measures in place within a domain, and identify patterns in domain objects. This information can be used to plan subsequent attacks, such as identifying potential paths to exploit within the target network or finding opportunities to blend in or manipulate the environment. 


**User impact**

A user, service or application that relies on these permissions may stop functioning. 

**Implementation**


Carefully review each assigned permission, identify any dangerous permission granted, and modify them to remove any unnecessary or excessive user rights. 



## Next steps

[Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)