---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: 'Security Assessment: Change Domain Controller computer account old password '
description: This recommendation lists all domain controller’s computer accounts with password last set over 45 days ago.
author:      LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     10/05/2024
---

# Security Assessment: Change Domain Controller computer account old password

This recommendation lists all domain controller’s computer accounts with password last set over 45 days ago.

## Organization risk

A Domain Controller (DC) is a server in an Active Directory (AD) environment that manages user authentication and authorization, enforces security policies, and stores the AD database. It handles logins, verifies permissions, and ensures secure access to network resources. Multiple DCs provide redundancy for high availability.  
Domain Controllers with old passwords are at heightened risk of compromise and could be more easily taken over. Attackers can exploit outdated passwords, gaining prolonged access to critical resources and weakening network security. It could indicate a Domain controller that is no longer functioning in the domain.

## Remediation steps

1. Verify Registry Values: 

   - HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\DisablePasswordChange is set to 0 or is nonexistent. 
      
   - HKLM\System\CurrentControlSet\Services\Netlogon\Parameters\MaximumPasswordAge is set to 30. 
      
1. Reset Incorrect Values:   
     - Reset any incorrect values to their default settings.   
     - Check Group Policy Objects (GPOs) to ensure they do not override these settings. 
  
1. If these values are correct, check if the NETLOGON service is started with sc.exe query netlogon. 

1. Validate Password Synchronization by Running nltest /SC_VERIFY: (with DomainName being the domain NetBIOS name) can check the synchronization status and should display0 0x0 NERR_Success for both verifications.

> [!TIP]
> For more information about commuter account’s password process check this blog post about [Machine accounts password process](https://techcommunity.microsoft.com/t5/ask-the-directory-services-team/machine-account-password-process/ba-p/396026). 
## Next steps

[Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

