---
title: Criticality Levels for X in Microsoft Security Exposure Management
description: List of all the... in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: reference
ms.service: exposure-management
ms.date: 07/24/2024
---

# Overview of critical asset management

In [Microsoft Security Exposure Management](microsoft-security-exposure-management.md), you can define and manage resources as critical assets.

| AOI Name              | Asset type                 | Current Criticality Level | Suggested New level | Status   | Description and reasoning                                                                                                                                                                                                                                                                                                                                                                                   | Why is this critical? |
|-----------------------|----------------------------|---------------------------|---------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------|
| AAD Connect           | device                     | High                      | Medium              | Released |  The Azure Active Directory (AAD/Entra ID) Connect server is responsible for syncing on-premises directory data to your Azure AD. If it fails, it may disrupt the synchronization process and user authentication, but won't immediately halt all operations as there are potential manual workarounds. However, it should be given a high priority due to its important role in hybrid cloud environments. |                       |
| ADCS                  | device                     | High                      | Medium              | Released |  ADCS is critical for managing digital certificates in the network. If it fails, it could result in authentication and encryption issues. However, given that certificates typically have a long lifespan and that there are usually redundant servers, the immediate impact of a failure might not be as high as with some other systems.                                                                  |                       |
| ADFS                  | device                     | High                      | High                | Released |  ADFS is crucial for Single Sign-On (SSO) and web-based authentication. If it fails, it could result in users being unable to access essential services. This is similar to the Domain Controller in that it may have redundancy, but failure could still limit capacity assurance.                                                                                                                         |                       |
| Backup                | device                     | High                      | Medium              | Released |  While backups are crucial for disaster recovery, the immediate impact of a backup server failure is usually low, as it does not directly affect operational systems. However, the longer the backup server is down, the higher the risk, hence a medium classification.                                                                                                                                    |                       |
| Domain Admin Machines | privileged identity device | High                      | High                | Released | These machines have elevated privileges and are critical for maintaining and managing the domain. A failure could result in significant disruption to maintenance activities and pose a security risk, similar to the Domain Controller.                                                                                                                                                                    |                       |
