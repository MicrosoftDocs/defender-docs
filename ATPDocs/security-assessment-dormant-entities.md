---
title: Dormant entities security assessment
description: This article provides an overview of Microsoft Defender for Identity's dormant entities in sensitive groups identity security posture assessment report.
ms.date: 01/29/2023
ms.topic: how-to
---

# Security assessment: Dormant entities in sensitive groups

## What are sensitive dormant entities?

Microsoft Defender for Identity discovers if particular users are **sensitive** along with providing attributes that surface if they are inactive, disabled, or expired.

However, **Sensitive** accounts can also become *dormant* if they are not used for a period of 180 days. Dormant sensitive entities are targets of opportunity for malicious actors to gain sensitive access to your organization. 

For more information, see [Default sensitive entities](entity-tags.md#default-sensitive-entities).

## What risk do dormant entities create in sensitive groups?

Organizations that fail to secure their dormant user accounts leave the door unlocked to their sensitive data safe.

Malicious actors, much like thieves, often look for the easiest and quietest way into any environment. An easy and quiet path deep into your organization is through **sensitive** user and service accounts that are no longer in use.

It doesn't matter if the cause is employee turnover or resource mismanagement -skipping this step leaves your organization's most sensitive entities vulnerable and exposed.

## How do I use this security assessment?

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your sensitive accounts are dormant.

    ![Remediate dormant entities ini sensitive groups.](media/cas-isp-dormant-entities-sensitive-groups-1.png)
1. Take appropriate action on those user accounts by removing their privileged access rights or by deleting the account.

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours.  While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as **Completed**.
> 

## See also

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
