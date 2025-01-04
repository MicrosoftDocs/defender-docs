---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: 'Security Assessment: Prevent Certificate Enrollment with arbitrary Application Policies (ESC15)'
description: 'This recommendation directly addresses the recently published CVE-2024-49019, which highlights security risks associated with vulnerable AD CS configurations. '
author:      LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     12/04/2024
---

# Security assessment: Prevent Certificate Enrollment with arbitrary Application Policies (ESC15)

This article describes Microsoft Defender for Identity's Prevent Certificate Enrollment with arbitrary Application Policies (ESC15) security posture assessment report.

## Why is it important to review the Certificate templates?

This recommendation directly addresses the recently published [CVE-2024-49019](https://msrc.microsoft.com/update-guide/en-US/advisory/CVE-2024-49019)__,__ which highlights security risks associated with vulnerable AD CS configurations. This security posture assessment lists all vulnerable certificate templates found in customer environments due to unpatched AD CS servers.

Certificate templates that are vulnerable to [CVE-2024-49019](https://msrc.microsoft.com/update-guide/en-US/advisory/CVE-2024-49019) allow an attacker to issue a certificate with arbitrary Application Policies and Subject Alternative Name. The certificate can be used to escalate privileges, possibly resulting with full domain compromise. 

These certificate templates expose organizations to significant risks, as they enable attackers to issue certificates with arbitrary Application Policies and Subject Alternative Names (SANs). Such certificates can be exploited to escalate privileges and potentially compromise the entire domain. In particular, these vulnerabilities allow non-privileged users to issue certificates that can authenticate as high-privileged accounts, posing a severe security threat.

## Prerequisites

This assessment is available only to customers who installed a sensor on an AD CS server. For more information, see [New sensor type for Active Directory Certificate Services (AD CS)](/defender-for-identity/whats-new).

## **How do I use this security assessment to improve my organizational security posture?**

1. Review the recommended action at [Prevent Certificate Enrollment with arbitrary Application Policies (ESC15)](https://security.microsoft.com/securescore?viewid=actions).  

2. **Identify the vulnerable certificate templates:**  
   - Remove enrollment permission for unprivileged users.  
   - Disable the **“Supply in the request”** option.

3. Identify the AD CS servers which are vulnerable to CVE-2024-49019 and apply the relevant patch. 

   For example:  

   :::image type="content" source="media/prevent-certificate-enrollment-esc15/image.png" alt-text="Screenshot of servers." lightbox="media/prevent-certificate-enrollment-esc15/image.png":::

## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

- [Check out the Defender for Identity forum!](https://aka.ms/MDIcommunity)

