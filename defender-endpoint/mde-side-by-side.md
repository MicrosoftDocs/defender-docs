---
title: Microsoft Defender for Endpoint alongside other security solutions
description: See recommendations for running Defender for Endpoint alongside other security solutions.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 05/27/2025
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

Large organizations use a wide variety of security solutions, and running multiple security solutions concurrently can lead to performance issues and conflicts. To help minimize interoperability issues, trusted security solutions can often be configured to mitigate conflicts with each other. Organizations should understand the potential benefits, risks, and mitigation recommendations to make informed choices.  

1. **Disable duplication**. Running multiple security solutions that perform the same function can lead to performance issues and conflicts. It's recommended to avoid redundant capabilities, as this increases the likelihood of problematic product interactions. 

   Microsoft Defender for Endpoint can be configured to disable endpoint detection and response (EDR) in Block Mode, Automated Investigation & Remediation, PUA Protection, Network Discovery & Response, and other capabilities. Reducing overlap with functions provided by a non-Microsoft EDR solution such as CrowdStrike Falcon. Responsibility for these functions falls to the security solution actively providing those functions. 

   Similarly, setting Microsoft Defender Antivirus in "Passive Mode" ensures that when another anti-malware solution is present, Defender Antivirus doesn't perform active protection, remediation, or malware blocking. Responsibility for malware protection shifts to the active anti-malware solution. 

2. **Exclusions**. Security exclusions are used to prevent certain entities from being scanned or blocked by security software. Creating mutual exclusions between security solutions can help avoid performance issues and compatibility problems. Exclusions can potentially decrease protection, so it's important to only exclude processes and paths that are confidently benign. 

   When creating mutual exclusions between two security solutions, organizations are deferring protection for those solutions to their respective vendors. If a non-Microsoft EDR solution is unable to monitor Microsoft Defender for Endpoint binaries, for example, then Microsoft is being trusted to protect its own solution. Likewise, if Microsoft Defender for Endpoint is unable to monitor a non-Microsoft solution, then that vendor is being trusted to protect its own solution. These gaps in protection need to be actively managed as solutions change, to help minimize risk.

      > [!NOTE]
      > For Microsoft Windows performance, for example, see [Performance overview - Windows Client | Microsoft Learn](/troubleshoot/windows-client/performance/performance-overview) and [Performance overview - Windows Server | Microsoft Learn](/troubleshoot/windows-server/performance/performance-overview).

3. **Configurations**. Device hardware and software configurations can have a significant impact on performance and stability, which might be unrelated to security solution interoperability. Solutions and scenario guides are available to help troubleshoot and self-solve performance-related issues, or organizations can leverage available support resources. 

Delegating security functionality, creating exclusions, and configuring settings can help reduce the likelihood of interoperability issues, but these might not be eliminated completely. Acceptable risk is different for every organization; optimizing for usability might increase risk, and optimizing for security will likely impact usability. Organizations should weigh the benefits of interoperability over potential risks.

Commercially reasonable support is provided through Microsoft Customer Service and Support and Microsoft managed support offerings. In troubleshooting performance, reliability, and other issues, customers might be asked to temporarily remove potentially conflicting solutions to identify the source of the issue. Depending on the issue, customers might be asked to engage with the vendor of the non-Microsoft solution. Managing security often means finding an acceptable balance between productivity and risk; if a particular security configuration is causing significant performance problems, some organizations choose to disable the additional protection in favor of increased usability for select device groups. This should also be considered for other device-impacting settings.
