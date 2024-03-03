---
title: Microsoft Security Exposure Management
description: Microsoft Security Exposure Management Overview
author: mjosephym
ms.author: v-mjosephy
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 01/09/2024
---


# What is Microsoft Security Exposure Management?

Microsoft Security Exposure Management is a security solution that provides a unified view of security posture across company data, assets and workloads. Security Exposure Management enriches asset information with security context that helps you to manage attack surfaces, identify critical assets, and explore and mitigate exposure risk.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Who uses Security Exposure Management?

Security Exposure Management is aimed at:

- Security and compliance admins responsible for maintaining and improving organizational security posture
- SOC and partner teams who need visibility into data and workloads across the enterprise in order to detect and mitigate security threats.
- CISOs and security decision makers who need security insight into attack surfaces and organizational exposure in order to understand,prioritize, and mitigate company security risk.

## What can I do with Security Exposure Management?

With Security Exposure Management you can:

- **Get a unified view across the organization**: Security Exposure Management continuously discovers assets and workloads, and gathers discovered data into a unified up-to-date view of your company inventory and attack surface.
-**Manage attack surfaces**: You can visualize, analyze, and manage cross-workload attack surfaces. Features include:
    - **Enterprise exposure graph**: The enterprise exposure graph gathers infomation about assets, users, and workloads across your enterprise to provide a unified, comprehensive view of your organizational security posture.
    - **Enterprise exposure graph schemas**: Schemas provide contextual information about specific organizational entitles such as devices, identities, machines, and storage.
    - **Graph queries**: You can query the exposure graph to explore assets, assess risks, and hunt for threats across on-premises, hybrid, and multicloud environments.
    - **Attack surface map**: The attack surface map provides information about your environment and provides query results in a visual format.  

- **Discover and safeguard critical assets**: Security Exposure Management marks predefined assets, and assets you customize, as critical. You can then focus and prioritize those critical assets for exploration, triage, and remediation, to ensure security and business continuity.

- **Manage exposure**: Security Exposure Management provides a number of tools to manage exposure and mitigate exposure risk.
    - **Exposure insights**: Exposure insights aggregate security posture data, and provide rich context around the security posture state of your asset inventory. You leverage these insights to effectively prioritize security focus and investment. 
    - **Security recommendations**: Assets and workloads are assessment against security standards. Based on those assessments, security recommendations provide practical steps to help you remediate security issues that were identified. Security Exposure Management integrates recommendations fromMicrosoft Defender for Cloud running the [Defender for Cloud Security Posture Management (CSPM) plan](/azure/defender-for-cloud/concept-cloud-security-posture-management), and from Defender XDR [secure score](/microsoft-365/security/defender/microsoft-secure-score.md).
    - **Metrics**: Metrics group together recommendations that have a similar context, and measure how you're doing in that context, from high to zero exposure for the context area.
    - **Initiatives**: Predefined initiatives gather metrics information that helps you to review and manage exposure in specific areas of security risk.
        - Initiatives might measure a specific type of security such as identity or endpoint security, or focus horizontally across asset types, for example ransomware protection. Initiatives might also focus on known and emerging threats/attacks, or on specific compliance standards.
        - Initiative recommendations are derived from metrics within the initiative.
    - **Secure score**: In addition to exposure features in Security Exposure Management, the Security Exposure Management dashboard also includes secure score data. Secure score is an analytics tool that assigns a score based on security configuration settings.  
- **Manage exposure: attack paths**: As you manage exposure risk, attack paths show you how an attacker might breach your attack surface. Security Exposure Management:
    -  **Generates attack paths**: Security Exposure Management generates attack paths based on the data collected across assets and workloads. It simulates attack scenarios, and identifies weaknesses that an attacker could exploit.
    - **Provides visibility**: You can use the attack surface map and enterprise exposure graph and attack surface map to visualize and understand potential threats. you can also get focus on choke points through which many attack paths flow.
    - **Provides recommendations**: Get actionable recommendation to mitigate identified attack paths.


## What's integrated into Security Exposure Management?

Currently, Security Exposure Management consolidates security posture information and insights from workloads that include:

- Microsoft Defender for Endpoint (MDE)
- Microsoft Defender for Identity (MDI)
- Microsoft Defender for Cloud Apps (MDA)
- Microsoft Defender for Office (MDO)
- Microsoft Defender for IoT (MDIOT)
- Microsoft Secure Score  
- Microsoft Defender Vulnerability Management  
- Microsoft Defender for Cloud 
- Microsoft Entra ID  
- Azure External Attack Surface Management (EASM)

In addition to Microsoft services, Security Exposure Management provides data connectors to connect to non-Microsoft data sources. Data connectors will connect to more third-party data sources over time.

## Next steps

- Read the [Microsoft Security Exposure Management licensing datasheet](https://aka.ms/?)
- Review [prerequisites and support](prerequisites.md)