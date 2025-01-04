---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: 'Security Assessment: Change password for krbtgt account'
description: This recommendation lists any krbtgt account within your environment with password last set over 180 days ago.
author:      LiorShapiraa # GitHub alias
ms.author: liorshapira
ms.service: microsoft-defender-for-identity
ms.topic: article
ms.date:     10/06/2024
---

# Security Assessment: Change password for krbtgt account

This recommendation lists any krbtgt account within your environment with password last set over 180 days ago.

## Organization risk

The krbtgt account in Active Directory is a built-in account used by the Kerberos authentication service. It encrypts and signs all Kerberos tickets, enabling secure authentication within the domain. The account cannot be deleted, and securing it is crucial, as compromise could allow attackers to forge authentication tickets.  
If the KRBTGT account's password is compromised, an attacker can use its hash to generate valid Kerberos authentication tickets, allowing them to perform Golden Ticket attacks and gain access to any resource in the AD domain. Since Kerberos relies on the KRBTGT password to sign all tickets, closely monitoring and regularly changing this password is essential to mitigating the risk of such attacks.

## Remediation steps

1. Review the list of exposed entities to discover which of your krbtgt accounts have an old password. 

1. Take appropriate action on those accounts by resetting their password **twice** to invalidate the Golden Ticket attack. 

> [!NOTE]
> The krbtgt Kerberos account in all Active Directory domains supports key storage in all Kerberos Key Distribution Centers (KDC). To renew the Kerberos keys for TGT encryption, periodically change the krbtgt account password. It is recommended to use the [Microsoft-provided script.](https://github.com/microsoft/New-KrbtgtKeys.ps1)
### Next steps

[Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

