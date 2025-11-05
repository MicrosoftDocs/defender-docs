---
title: 'Security Assessment: Remove Inactive Service Account'
description: Learn how to identify and address inactive Active Directory service accounts to mitigate security risks and improve your organization's security posture.
ms.date: 08/17/2025
ms.topic: how-to
#customer intent: As a security administrator, I want to improve security posture in my organization by removing inactive service accounts
---

# Security Assessment: Remove Inactive Service Accounts

This recommendation lists Active Directory service accounts detected as inactive within the past 90 days. 

## Why do inactive service accounts pose a risk?

Unused service accounts create significant security risks, as some of them can carry elevated privileges. If attackers gain access, the result can be substantial damage. Inactive service accounts might retain high or legacy permissions. When compromised, they provide attackers with discreet entry points into critical systems, granting far more access than a standard user account.

This exposure creates several risks:

- Unauthorized access to sensitive applications and data.

- Lateral movement across the network without detection.


## How do I use this security assessment to improve my organizational security posture? 

To use this security assessment effectively, follow these steps:

1. Review the recommended action at [https://security.microsoft.com/securescore?viewid=actions ](https://security.microsoft.com/securescore?viewid=actions) for Remove inactive service account.

1. Review the list of exposed entities to discover which of your service accounts are inactive and haven't performed any login activity in the last 90 days.

1. Take appropriate actions on those entities by removing the service account. For example:

    - **Disable the account:** Prevent any usage by disabling the account identified as exposed.

    - **Monitor for impact:** Wait several weeks and monitor for operational issues, such as service disruptions or errors.

    - **Delete the account:** If no issues are observed, delete the account and fully remove its access.

> [!NOTE]
> Assessments are updated in near real time, and scores and statuses are updated every 24 hours. The list of impacted entities is updated within a few minutes of your implementing the recommendations. The status might take time until it's marked as **Completed**.

## Related articles

- [Learn more about Microsoft Secure Score](/defender-xdr/microsoft-secure-score)
