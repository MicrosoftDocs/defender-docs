---
title: Microsoft Defender for Endpoint alongside other security solutions
description: See recommendations for running Defender for Endpoint alongside other security solutions.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 06/13/2025
ms.topic: conceptual
author: emmwalshh
ms.author: ewalsh
ms.custom: 
- nextgen
- partner-contribution
ms.reviewer: pahuijbr
manager: deniseb
ms.collection: 
- m365-security
- tier2
search.appverid: met150
---

# Microsoft Defender for Endpoint alongside other security solutions

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)

## Considerations with concurrent security solutions

Large organizations use a wide variety of security solutions, and running multiple security solutions concurrently can lead to performance issues and conflicts. To help minimize interoperability issues, trusted security solutions can often be configured to mitigate conflicts with each other. Organizations should understand the potential benefits, risks, and mitigation recommendations to make informed choices.  

1. **Avoid duplication**. Running multiple security solutions that perform the same function can lead to performance issues and conflicts. It's generally recommended to avoid redundant capabilities, as this increases the likelihood of problematic product interactions. 

   Microsoft Defender for Endpoint can be configured to disable endpoint detection and response (EDR) in block mode, automated investigation & remediation, protection from potentially unwanted applications (PUA protection), network discovery & response, and other capabilities. This can reduce overlap with detection and response functions provided by non-Microsoft endpoint security solutions. Responsibility for these functions falls to the solution actively providing those functions. 

   Similarly, setting Microsoft Defender Antivirus in passive mode ensures that when another anti-malware solution is present, Microsoft Defender Antivirus doesn't perform active protection, remediation, or malware blocking. Responsibility for malware protection shifts to the active anti-malware solution. 

2. **Configure mutual exclusions**. Security exclusions are used to prevent certain entities from being scanned or blocked by security software. Creating mutual exclusions between security solutions can help avoid performance issues and compatibility problems. Exclusions can potentially decrease protection, so it's important to only exclude processes and paths that are confidently benign. 

   When creating mutual exclusions between two security solutions, organizations are deferring protection for those solutions to their respective vendors. If a non-Microsoft EDR solution is unable to monitor Defender for Endpoint binaries, for example, then Microsoft is being trusted to protect its own solution. Likewise, if Defender for Endpoint is unable to monitor a non-Microsoft solution, then that vendor is being trusted to protect its own solution. These gaps in protection need to be actively managed as solutions change, to help minimize risk.

   > [!NOTE]
   > For Microsoft Windows performance, for example, see [Performance overview - Windows Client | Microsoft Learn](/troubleshoot/windows-client/performance/performance-overview) and [Performance overview - Windows Server | Microsoft Learn](/troubleshoot/windows-server/performance/performance-overview).

3. **Consider system configuration**. In side-by-side scenarios, even well configured security tools can be impacted by underlying system limitations. Ensure that endpoints meet hardware requirements and stagger resource-heavy tasks. Built-in telemetry can monitor performance to help isolate interoperability issues from system constraints. Solutions and scenario guides are available to help troubleshoot and self-solve performance-related issues, or organizations can leverage available support resources. 

Delegating security functionality, creating exclusions, and configuring settings can help reduce the likelihood of interoperability issues, but these might not be eliminated completely. Acceptable risk is different for every organization; optimizing for usability might increase risk, and optimizing for security will likely impact usability. Organizations should weigh the benefits of interoperability over potential risks.

## Customer support

Commercially reasonable support is provided through Microsoft Customer Service & Support and Microsoft-managed support offerings. In troubleshooting performance, reliability, and other issues, customers might be asked to temporarily remove potentially conflicting solutions to identify the source of the issue. Depending on the issue, customers might be asked to engage with the vendor of the non-Microsoft solution.

