---
title: What is Microsoft Defender for Identity?
description: This article describes the Microsoft Defender for Identity service and the sorts of suspicious activities Defender for Identity can detect.
ms.date: 08/27/2023
ms.topic: overview
#customer intent: As a Microsoft Defender for Identity customer or potential customer, I want to understand the main use case scenarios for Defender for Identity so that I can best use my Microsoft Defender XDR deployment.
---

# What is Microsoft Defender for Identity?

Microsoft Defender for Identity is a cloud-based security solution that helps secure your identity monitoring across your organization. 

Defender for Identity is fully integrated with Microsoft Defender XDR, and leverages signals from both on-premises Active Directory and cloud identities to help you better identify, detect, and investigate advanced threats directed at your organization.

Deploy Defender for Identity to help your SecOp teams deliver a modern identity threat detection (ITDR) solution across hybrid environments, including:

- **Prevent breaches**, using proactive identity security posture assessments
- **Detect threats**, using real-time analytics and data intelligence
- **Investigate suspicious activities**, using clear, actionable incident information
- **Respond to attacks**, using automatic response to compromised identities

Defender for Identity was formerly known as Azure Advanced Threat Protection (Azure ATP).

[!INCLUDE [automatic-redirect](../includes/automatic-redirect.md)]

## Protect user identities and reduce the attack surface

Defender for Identity provides you with invaluable insights on identity configurations and suggested security best-practices. Through security reports and user profile analytics, Defender for Identity helps dramatically reduce your organizational attack surface, making it harder to compromise user credentials, and advance an attack.

### Proactively assess your identity posture

Defender for Identity provides you with a clear view of your identity security posture, helping you to identify and resolve security issues before they can be exploited by attackers.

For example:

- **Defender for Identity's *Lateral Movement Paths*** help you quickly understand exactly how an attacker can move laterally inside your organization. [Lateral movement paths](understand-lateral-movement-paths.md) can compromise sensitive accounts, and Defender for Identity helps you prevent those risks in advance.

- **[Defender for Identity security assessments](security-assessment.md)**, available from [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score), provide extra insights to improve your organizational security posture and policies.


### Detect threats across modern identity environments

Modern identity environments often span both on-premises and in the cloud. Defender for Identity uses data from across your environment, including domain controllers, Active Directory Federation Services (AD FS), and Active Directory Certificate services (AD CS), to provide you with a complete view of your identity environment.

Defender for Identity sensors monitor domain controller traffic by default. For AD FS / AD CS servers, make sure to install the relevant sensor type for complete identity monitoring.

For more information, see:

- [Deploy Microsoft Defender for Identity with Microsoft Defender XDR](deploy/deploy-defender-identity.md)
- [Microsoft Defender for Identity on Active Directory Federation Services (AD FS)](deploy/active-directory-federation-services.md)


## Identify suspicious activities across the cyber-attack kill-chain

Typically, attacks are launched against any accessible entity, such as a low-privileged user. Attackers then quickly move laterally until they gain access to valuable assets, such as sensitive accounts, domain administrators, and highly sensitive data.

Defender for Identity identifies these advanced threats at the source throughout the entire cyber-attack kill chain:

|Threat  |In Defender for Identity ...  |
|---------|---------|
|**Reconnaissance**     |     Identify rogue users and attackers' attempts to gain information. <br><br>Attackers search for information about user names, users' group membership, IP addresses assigned to devices, resources, and more, using various methods.    |
|**Compromised credentials**     |   Identify attempts to compromise user credentials using brute force attacks, failed authentications, user group membership changes, and other methods.      |
|**Lateral movements**     |  Detect attempts to move laterally inside the network to gain further control of sensitive users, utilizing methods such as Pass the Ticket, Pass the Hash, Overpass the Hash and more.       |
|**Domain dominance**     |   View highlighted attacker behavior if domain dominance is achieved. For example, attackers might run code remotely on the domain controller, or use methods like DC Shadow, malicious domain controller replication, Golden Ticket activities, and more.      |

For more information, see [Security alerts in Microsoft Defender for Identity](alerts-overview.md).

## Investigate alerts and user activities

Defender for Identity is designed to reduce general alert noise, providing you with a prioritized list of relevant, important security alerts in a simple, real-time organizational attack timeline.

Seamless integration with Microsoft Defender XDR provides another layer of enhanced security by correlating data from other domains, for greater visibility and accuracy across users, devices, and network resources.

For more information, see [Investigate assets](investigate-assets.md) and [Investigate security alerts](manage-security-alerts.md).

## Related content

Use the following table to find more resources about Defender for Identity:

|Resource type  |References |
|---------|---------|
|**Learn more**     |   - [Deploy Microsoft Defender for Identity](deploy-defender-identity.md)  <br> - [Licensing and privacy FAQs](/defender-for-identity/technical-faq#licensing-and-privacy) <br>- [Defender for Identity frequently asked questions](technical-faq.yml) <br>    - [Working with security alerts](/defender-for-identity/manage-security-alerts)<br>    - [Defender for Identity architecture](architecture.md)  <br>- [Zero Trust with Defender for Identity](zero-trust.md)     |	
|**Join communities**     |     - [Follow Defender for Identity on the Microsoft TechCommunity](https://aka.ms/MDIcommunity "Defender for Identity on Microsoft Tech Community") <br>    - [Join the Defender for Identity Yammer community](https://www.yammer.com/azureadvisors/#/threads/inGroup?type=in_group&feedId=9386893 "Defender for Identity Yammer community")<br>    - Read the [Defender for Identity blog](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/bg-p/MicrosoftSecurityandCompliance/label-name/Microsoft%20Defender%20for%20Identity)        |
| **Roadmap** | [See the upcoming roadmap for Defender for Identity](https://www.microsoft.com/microsoft-365/roadmap?filters=Microsoft%20Defender%20for%20Identity) |
| **Product page** |[Visit the Defender for Identity product page](https://www.microsoft.com/microsoft-365/security/identity-defender "Defender for Identity product page") |
| **Free trial** | [Start a free trial](https://signup.microsoft.com/Signup?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7&ali=1 "Enterprise Mobility + Security E5") |
