---
title: How Microsoft Defender for Identity protects your SailPoint Identity Security Cloud accounts
description: Learn how Microsoft Defender for Identity protect your SailPoint Identity Security Cloud and what the integration enables.
ms.date: 03/04/2026
ms.topic: overview
ms.reviewer: himanch
# customer-intent: As a security administrator, I want to understand what happens when I connect SailPoint to Microsoft Defender for Identity, so that I can decide whether to enable the integration.
---

# How Microsoft Defender for Identity protects your SailPoint Identity Security Cloud accounts (Preview)

Microsoft Defender for Identity helps protect your on-premises Active Directory and Azure Active Directory environments from advanced threats. 
Connecting SailPoint Identity Security Cloud with Microsoft Defender for Identity (MDI) gives you the ability to detect, investigate, and respond to identity-based threats across both cloud and on-premises infrastructures. 

## What you can do after connecting SailPoint Identity to Microsoft Defender for Identity

After you connect SailPoint Identity, Microsoft Defender for Identity provides the following capabilities:

| Capability | Description |
|------------|------------|
| View SailPoint accounts in the identity inventory | - Adds SailPoint Identity Security Cloud accounts into the identity inventory and correlates them with identities from on-premises, Active Directory and Microsoft Entra ID.  |
| Improve SailPoint security posture | Evaluates SailPoint Identity Security Cloud accounts for security risks such as stale privileged accounts and excessive privileged role assignments, and generates posture recommendations. Example recommendations include: <br> - Change password for SailPoint Identity Security Cloud privileged user accounts<br>- Remove stale SailPoint Identity Security Cloud privileged accounts <br>- Limit the number of SailPoint Identity Security Cloud accounts with system admin role <br>- High number of SailPoint Identity Security Cloud accounts with a privileged role assigned <br> - Assign multi-factor authentication for SailPoint  privileged user accounts|
| Use advanced hunting to investigate SailPoint identities and their related activities |  The [IdentityInfo](/defender-xdr/advanced-hunting-identityinfo-table) and the [IdentityEvents](/defender-xdr/advanced-hunting-identityevents-table) advanced hunting tables include inventory and event data from SailPoint Identity Security Cloud for investigation. |
| Take remediation actions | If an identity is determined to be at risk, the following remediation actions can be taken from within the Microsoft Defender portal: <br>- Disable user in SailPoint Identity Security Cloud <br> - Enable user in SailPoint Identity Security Cloud  |

## Next steps

- [Connect SailPoint Identity to Microsoft Defender for Identity (Preview)](connect-sail-point.md).
