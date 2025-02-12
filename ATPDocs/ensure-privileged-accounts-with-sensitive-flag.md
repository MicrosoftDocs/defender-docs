---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: 'Security Assessment: Ensure privileged accounts are not delegated'
description: This recommendation lists all privileged accounts that lack the "account is sensitive and cannot be delegated" flag.
author:      LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     10/05/2024
---

# Security Assessment: Ensure privileged accounts are not delegated

This recommendation lists all privileged accounts that don't have the "not delegated" setting enabled, highlighting those potentially exposed to delegation-related risks. Privileged accounts are accounts that are being members of a privileged group such as Domain admins, Schema admins, and so on. 

## Organization risk

If the sensitive flag is disabled, attackers could exploit Kerberos delegation to misuse privileged account credentials, leading to unauthorized access, lateral movement, and potential network-wide security breaches. Setting the sensitive flag on privileged user accounts prevent users from gaining access to the account and manipulating system settings.   
For device accounts, setting them to "not delegated" is important to prevent it from being used in any delegation scenario, ensuring that credentials on this machine can't be forwarded to access other services.

## Remediation steps

1. Review the list of exposed entities to discover which of your privileged accounts don’t have the configuration flag "this account is sensitive and cannot be delegated."

1. Take appropriate action on those accounts:

- For user accounts: by setting the account's control flags to "this account is sensitive and cannot be delegated." Under the Account tab, select the check box to this flag in the Account Options section. This prevents users from gaining access to the account and manipulating system settings.    
![Screenshot of user profile.](media/ensure-privileged-accounts-with-sensitive-flag/administrator-properties.png)

- For device accounts:  
The safest approach is to use a PowerShell script to configure the device to prevent it from being used in any delegation scenario, ensuring that credentials on this machine can't be forwarded to access other services.

  ```
  $name = "ComputerA" 
  Get-ADComputer -Identity $name |
  Set-ADAccountControl -AccountNotDelegated:$true
  ```
  Another option is to set the `UserAccountControl` attribute to `NOT_DELEGATED = 0x100000` under the Attribute Editor tab for the exposed device.   
  
  For example:  
  
    ![Screenshot of device profile.](media/ensure-privileged-accounts-with-sensitive-flag/device-profile.png)
  
## Next steps

[Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

