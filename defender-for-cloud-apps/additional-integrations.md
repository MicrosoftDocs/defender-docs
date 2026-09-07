---
title: Integrate Microsoft Defender for Cloud Apps with external security solutions
description: Integrate Microsoft Defender for Cloud Apps with third-party threat intelligence feeds, MDM/MTD solutions, and UEBA solutions to enrich investigations and apply device-aware session controls.
ms.date: 07/03/2026
ms.topic: how-to
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---
# Additional integrations with external solutions



You can integrate Microsoft Defender for Cloud Apps with your other security investments to leverage and enhance an integrated protection ecosystem. For example, you can integrate with external mobile device management solutions, UEBA solutions, and external threat intelligence feeds.

The Defender for Cloud Apps robust platform allows you to integrate with a wide variety of external security solutions, including:

- **Threat Intelligence (TI) feeds (Bring Your Own TI)**  
    You can use the Defender for Cloud Apps [IP address range API](api-data-enrichment.md) to add new risky IP address ranges identified by third-party TI solutions. Once defined, IP address ranges allow you to tag, categorize, and customize how logs and alerts are displayed and investigated.

- **Mobile Device Management (MDM) / Mobile Threat Defense (MTD) solutions**  
    Defender for Cloud Apps provides real-time, granular session controls. A critical factor in the assessment and protection of sessions is the device used by the user, which helps build a comprehensive identity. A device's management status can be identified either directly through the device management status in [Microsoft Entra ID](/azure/active-directory/conditional-access/overview), [Microsoft Intune](/mem/intune/protect/mobile-threat-defense), or more generically through the analysis of client certificates that allow integration with a variety of third-party MDM and MTD solutions.

    Defender for Cloud Apps can leverage signals from external MDM and MTD solutions to apply session controls based on a [device's management status](session-policy-aad.md).

- **UEBA solutions**  
    You can use multiple UEBA solutions to cater for different workloads and scenarios, where each UEBA solution relies on multiple data sources to identify suspicious and anomalous user behavior. Additionally, external UEBA solutions can be integrated with Microsoft's security ecosystem through Microsoft Entra ID Protection.

    Once an external UEBA solution is integrated with Microsoft Entra ID Protection, policies can be used to identify risky users, apply adaptive controls, and automatically remediate dangerous users by setting the user's risk level to high. Once a user is set to high, the relevant policy actions are enforced, such as resetting a user's password, requiring MFA authentication, or forcing a user to use a managed device.

    Defender for Cloud Apps allows security teams to automatically or manually confirm a user as compromised to ensure fast remediation of compromised users.

    For more information, see [How does Microsoft Entra ID use my risk feedback](/azure/active-directory/identity-protection/howto-identity-protection-risk-feedback#how-does-azure-ad-use-my-risk-feedback).

## Get support

If you run into any problems, we're here to help. To get assistance or support for your product issue, please [open a support ticket](/defender-xdr/contact-defender-support).
