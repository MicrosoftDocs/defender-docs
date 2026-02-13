---
title: 'Group policy security assessments'
description: 'This section provides security assessments related to Group Policy Objects (GPOs) in Active Directory environments.'
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date: 09/15/2025
ms.reviewer: LiorShapiraa
---

# Group policy security assessments


## GPO assigns unprivileged identities to local groups with elevated privileges

**Description**

Using Group Policy Objects (GPOs) to add membership to a local group can create a security risk if the target group has excessive permissions or rights. To mitigate this risk, it's important to identify any local groups, such as local administrators or terminal server access, where Authenticated Users or Everyone is granted access by a GPO.   
Attackers may attempt to obtain information on Group Policy settings to uncover vulnerabilities that can be exploited to gain higher levels of access, understand the security measures in place within a domain, and identify patterns in domain objects. This information can be used to plan subsequent attacks, such as identifying potential paths to exploit within the target network or finding opportunities to blend in or manipulate the environment.  

**User impact**

A user, service or application that relies on these local permissions may stop functioning. 


**Implementation**


This recommendation lists non-privileged users who are granted elevated permissions through GPO.

Carefully review each assigned group membership, identify any dangerous group membership granted, and modify the GPO to remove any unnecessary or excessive user rights.  


## GPO can be modified by unprivileged accounts

**Description**

This recommendation lists any Group Policy Objects in your environment that can be modified by standard users which can potentially lead to the compromise of the domain.

Attackers may attempt to obtain information on Group Policy settings to uncover vulnerabilities that can be exploited to gain higher levels of access, understand the security measures in place within a domain, and identify patterns in domain objects. This information can be used to plan subsequent attacks, such as identifying potential paths to exploit within the target network or finding opportunities to blend in or manipulate the environment. 


**User impact**

A user, service or application that relies on these permissions may stop functioning. 

**Implementation**


Carefully review each assigned permission, identify any dangerous permission granted, and modify them to remove any unnecessary or excessive user rights. 


## Reversible passwords found in GPOs

This posture recommendation lists any Group policy objects in your environment that contains password data. 

**Description**


Group Policy Preferences (GPP) previously allowed administrators to include embedded credentials in domain policies. However, this feature was removed with the release of MS14-025 due to security concerns regarding the insecure storage of passwords. Files containing these credentials could still be present in the SYSVOL folder, which means that any domain user can access the files and decrypt the password using the publicly available AES key.   
To prevent potential exploitation by adversaries, it is recommended to remove any existing preferences that contain embedded credentials.


**Implementation**


In order to remove the preferences that contain passwords data, use Group Policy Management Console (GPMC) on a domain controller or from a client that has Remote Server Administration Tools (RSAT) installed. You can remove any preference following these steps: 

1. In GPMC, open the Group Policy reported in the Exposed entities tab.  

1. Navigate to the preference configuration that contains password data and delete the object. Click **Apply** and **OK** to save your changes.    
 
    :::image type="content" source="../media/reversible-passwords-group-policy/screenshot-of-group-policy-objects.png" alt-text="Screenshot that shows how to delete a group policy object.":::


1. Wait a Group Policy refresh cycle to allow changes to propagate to clients (usually up to 120 minutes) .

1. After changes are applied to all clients, delete the preference.  

1. Repeat steps 1 through 5 as needed to clean your whole environment.  



## Next steps

[Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)