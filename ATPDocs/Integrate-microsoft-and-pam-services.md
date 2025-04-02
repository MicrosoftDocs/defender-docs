---
title: Integrate Defender for Identity with your PAM services
ms.service: microsoft-defender-for-identity
ms.date: 03/30/2025
ms.topic: concept-article
#customerIntent: As a SOC engineer, I want to understand how to integrate Microsoft Defender for Identity with my PAM (Privilege Access Management) system to manage privileged access and detect threats.
---

# Integrate Defender for Identity with your PAM services

## What are PAM services?

Privileged Access Management (PAM) is an identity security solution designed to protect organizations from cyber threats by monitoring, detecting, and preventing unauthorized privileged access to critical resources.
PAM solutions secure privileged accounts by storing their credentials in a secure vault, controlling access through approval workflows, and monitoring active sessions to enforce just-in-time (JIT) and just-enough-access (JEA) policies. Key features include automated password rotation, multifactor authentication, session isolation, and anomaly detection.

## Defender for Identity and PAM

Defender for Identity helps identify and investigate suspicious activities related to privileged accounts, such as unusual sign in patterns or privilege escalation attempts. 
This integration ensures a comprehensive approach to identity security, combining PAM's control over privileged access with Defender for Identity's threat detection and response.

### XDR experience: Visibility and response actions

Once PAM integration is enabled, Microsoft XDR surfaces privileged identity data and enables direct response actions:

- Privileged accounts managed by a PAM solution are automatically tagged, providing clear context during investigations.

- You can initiate a password reset directly from the Microsoft XDR console for high-risk or compromised privileged accounts.

To reset a password using the integrated PAM system:
1. Go to **Assets > Identities**.
2. Select the relevant identity.
3. Click the three-dot menu (**⋯**) in the top-right corner.
4. Select **Reset password**. The label may vary based on the vendor (for example, **Reset password by CyberArk**, **Reset password by BeyondTrust**).

This capability streamlines containment and response workflows by embedding privileged access controls directly into the investigation experience.

## Integration catalog

Microsoft Defender for Identity currently supports integration with the following PAM vendors. Dedicated integrations for each partner are now available in the Microsoft 365 Defender partner catalog for streamlined onboarding and visibility.

:::image type="content" source="media/Integrate with partner system services/Screenshot-of-mdi-technology-partners.png" alt-text="Screenshot of Defender for Identity PAM partners":::


|Vendor |Description |
|---------|---------|
|CyberArk    | Comprehensive visibility, risk monitoring, and remediation for privileged identities        |
|BeyondTrust     | BeyondTrust protects Paths to Privilege™. With identity-centric approach, BeyondTrust secure privileges and access, empower organizations to manage the entire identity attack surface and neutralize threats, whether from external attacks or insiders.        |
|Delinea     | Delinea secures identities with centralized authorization, enhancing security by governing interactions across enterprises        |

### Next steps 

For more information, see:

[How to integrate Defender for Identity with Delinea](https://docs.delinea.com/online-help/integrations/microsoft/mdi/integrating-mdi.htm)

[How to integrate Defender for Identity with CyberArk](https://community.cyberark.com/marketplace/s/#a35Ht0000018sDVIAY-a39Ht000004GLaEIAW)