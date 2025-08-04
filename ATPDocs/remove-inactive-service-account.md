---
title: Security Assessment: Remove inactive service account
description: Learn how to identify and address inactive Active Directory service accounts to mitigate security risks and improve your organization's security posture.
ms.date: 08/04/2025
ms.topic: how-to
---

# Security Assessment: Remove inactive service account

This recommendation lists Active Directory service accounts that have been detected as inactive (stale) within the past 180 days. 

## Why do inactive service accounts pose a risk?

Unused service accounts can pose significant security risks to your organization, as some of these accounts can possess elevated privileges, which, if accessed by an attacker, could result in substantial damage. Therefore, it is imperative to identify and address any unused or orphaned service accounts.

## How do I use this security assessment to improve my organizational security posture? 

To leverage this security assessment effectively, follow these steps:

1. Review the recommended action at https://security.microsoft.com/securescore?viewid=actions for Remove inactive service account 
1. Review the list of exposed entities to discover which of your service account is inactive. 

  :::image type="content" source="media/remove-inactive-service-account/remove-inactive-service-accounts.png" alt-text="Screenshot that shows the recommendation action to remove inactive service accounts." lightbox="media/remove-inactive-service-account/remove-inactive-service-accounts.png":::

1. Take appropriate actions on those entities by removing the service account. For example:

- Disable the account: Prevent any usage by disabling the account identified as exposed.

- Monitor for impact: Wait several weeks and monitor for operational issues, such as service disruptions or errors.

- Delete the account: If no issues are observed, proceed to delete the account and fully remove its access.

> [!NOTE]
> Assessments are updated in near real time, and scores and statuses are updated every 24 hours. The list of impacted entities is updated within a few minutes of your implementing the recommendations. The status may take time until it's marked as **Completed**.