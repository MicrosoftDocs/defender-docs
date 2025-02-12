---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: 'Security Assessment: GPO assigns unprivileged identities to local groups with elevated privileges'
description: This recommendation lists non-privileged users who are granted elevated permissions through GPO.
author:      LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     10/05/2024
---

# Security assessment: GPO assigns unprivileged identities to local groups with elevated privileges

This recommendation lists non-privileged users who are granted elevated permissions through GPO.

### Organization risk

Using Group Policy Objects (GPOs) to add membership to a local group can create a security risk if the target group has excessive permissions or rights. To mitigate this risk, it's important to identify any local groups, such as local administrators or terminal server access, where Authenticated Users or Everyone is granted access by a GPO.   
Attackers may attempt to obtain information on Group Policy settings to uncover vulnerabilities that can be exploited to gain higher levels of access, understand the security measures in place within a domain, and identify patterns in domain objects. This information can be used to plan subsequent attacks, such as identifying potential paths to exploit within the target network or finding opportunities to blend in or manipulate the environment.  

A user, service or application that relies on these local permissions may stop functioning. 

### Remediation steps 

Carefully review each assigned group membership, identify any dangerous group membership granted, and modify the GPO to remove any unnecessary or excessive user rights.  

### Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

