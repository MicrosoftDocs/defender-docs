---
title: Integrate Defender for Identity with PAM services
ms.service: microsoft-defender-for-identity
ms.date: 03/30/2025
ms.topic: concept-article
#customerIntent: As a SOC engineer, I want to understand how to integrate Microsoft Defender for Identity with my PAM (Privilege Access Management) system to manage privileged access and detect threats.
description: Learn how to integrate Microsoft Defender for Identity with your Privileged Access Management (PAM) services.
---

# Integrate Defender for Identity with PAM services

## What are PAM services?

Privileged Access Management (PAM) solutions help reduce the risk of credential misuse by securing, monitoring, and controlling privileged account access to critical resources.
PAM solutions secure privileged accounts by storing their credentials in a secure vault, controlling access through approval workflows, and monitoring active sessions to enforce just-in-time (JIT) and just-enough-access (JEA) policies. Common PAM capabilities include, automated password rotation, multifactor authentication, session isolation, and anomaly detection.

## Defender for Identity and PAM

Defender for Identity helps identify and investigate suspicious activities related to privileged accounts, such as unusual sign in patterns or privilege escalation attempts. 
When integrated with a PAM solution, Microsoft Defender for Identity can detect and investigate suspicious activity involving privileged accounts—such as abnormal sign-ins or privilege escalation attempts. The integration combines PAM’s access controls with Defender for Identity’s behavioral analytics for enhanced threat detection and containment.

## Technology partners

Microsoft Defender for Identity currently supports integration with the following PAM vendors. Dedicated integrations for each partner are now available in the Microsoft 365 Defender partner catalog for streamlined onboarding and visibility.

:::image type="content" source="media/integrate-with-partner-system-services/screenshot-of-mdi-technology-partners.png" alt-text="Screenshot of the defender for identity connections page":::


|Vendor |Description |
|---------|---------|
|CyberArk    | Provides credential vaulting, session monitoring, and threat remediation for privileged identities.       |
|BeyondTrust     | BeyondTrust Offers identity-centric controls to manage the privilege attack surface and mitigate internal and external threats.        |
|Delinea     | Delivers centralized authorization and session control for privileged identities across enterprise environments.       |

### Reset password

Once PAM integration is enabled, Microsoft Defender XDR automatically tags identities managed by your PAM solution, providing critical context during investigations.

Additionally, you can initiate a password reset for high-risk privileged accounts directly from the Microsoft Defender XDR console. This action uses the connected PAM system.

To reset a password:

1. Go to **Assets > Identities**.
2. Select the relevant identity.
3. Click the three-dot menu (**⋯**) in the top-right corner.
4. Select **Reset password**. The label might vary based on the vendor (for example, **Reset password by CyberArk**, **Reset password by BeyondTrust**).

:::image type="content" source="media/screenshot-of-privilege-access-management-tags-for-identities.png" alt-text="Screenshot of the priviledge access management tags assigned to identity accounts" lightbox="media/screenshot-of-privilege-access-management-tags-for-identities.png":::

This capability streamlines containment and response workflows by embedding privileged access controls directly into the investigation experience.


### Next steps 

For more information, see:

[How to integrate Defender for Identity with Delinea](https://docs.delinea.com/online-help/integrations/microsoft/mdi/integrating-mdi.htm)

[How to integrate Defender for Identity with CyberArk](https://community.cyberark.com/marketplace/s/#a35Ht0000018sDVIAY-a39Ht000004GLaEIAW)

[How to integrate Defender for Identity with BeyondTrust](https://docs.beyondtrust.com/insights/docs/microsoft-defender)