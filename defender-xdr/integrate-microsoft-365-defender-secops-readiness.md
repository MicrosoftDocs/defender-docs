---
title: Step 2. Perform a SOC integration readiness assessment using the Zero Trust Framework
description: The basics of performing a SOC integration readiness assessment using the Zero Trust Framework when integrating Microsoft Defender XDR into your security operations.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection: 
  - msftsolution-secops
  - tier2
ms.topic: how-to
ms.date: 06/15/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Step 2. Perform a SOC integration readiness assessment using the Zero Trust Framework

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- Microsoft Defender XDR

To prepare for Microsoft Defender adoption, organizations should assess readiness using a [Zero Trust approach](/security/zero-trust/). Adoption can help you determine the requirements needed for deploying Microsoft Defender using modern industry-leading practices, while evaluating Microsoft Defender XDR's capabilities against your environment.

The Zero Trust approach is based on a strong foundation of protections and includes key areas such as identity, endpoints (devices), data, apps, infrastructure, and networking. The Readiness Assessment team determines the areas where a foundational requirement for enabling Microsoft Defender XDR hasn't yet been met and what needs remediation.

The following list provides some examples of things that must be remediated in order for the SOC to fully optimize processes in the SOC:

- **Identity:** Legacy on-premises Active Directory Domain Services (AD DS) domains, no MFA plan, no inventory of privileged accounts, and others.
- **Endpoints (devices):** Large number of legacy operating systems, limited device inventory, and others.
- **Data and apps:**  Lack of data governance standards, or no inventory of custom apps that won't integrate.
- **Infrastructure:** Large number of unsanctioned SaaS licenses, no container security, and others.
- **Networking:** Performance issues due to low bandwidth, flat network, wireless security issues, and others.

Use the guidance in [turning on Microsoft Defender](m365d-enable.md) to capture the baseline set of configuration requirements. Capturing the baseline configuration requirements helps determine remediation activities the SOC teams have to carry out to effectively develop use cases. 

For next steps, see [Plan for Microsoft Defender XDR integration with your SOC catalog of services](integrate-microsoft-365-defender-secops-services.md) and [Use Microsoft Defender XDR incident response in your SOC](integrate-microsoft-365-defender-secops-use-cases.md).

## Next step

[Step 3. Plan for Microsoft Defender integration with your SOC catalog of services](integrate-microsoft-365-defender-secops-services.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
