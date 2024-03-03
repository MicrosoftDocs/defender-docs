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

Microsoft Security Exposure Management is a security solution that provides a unified view of security posture across company data, assets, and workloads. Security Exposure Management enriches asset information with security context that helps you to manage attack surfaces, identify critical assets, and explore and mitigate exposure risk.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Who uses Security Exposure Management?

Security Exposure Management is aimed at:

- Security and compliance admins responsible for maintaining and improving organizational security posture.
- Security operations (SecOps) and partner teams who need visibility into data and workloads across organizational silos in order to improve, investigate, detect, and mitigate security threats.
- CISOs and security decision makers who need insights into organizational attack surfaces and exposure in order to understand, prioritize, and address company security risk.

## What can I do with Security Exposure Management?

With Security Exposure Management you can:

- **Get a unified view across the organization**: Security Exposure Management continuously discovers assets and workloads, and gathers discovered data into a unified up-to-date view of your inventory and attack surface.
- **Manage and investigate attack surfaces**: Visualize, analyze, and manage cross-workload attack surfaces.
    - **Enterprise exposure graph**: The enterprise exposure graph gathers information about your enterprise so you have a comprehensive view of your organizational security posture. Graph schemas provide contextual information about specific organizational entitles such as devices, identities, machines, and storage.
    - **Graph queries**: You query the exposure graph to explore assets, assess risks, and hunt for threats across on-premises, hybrid, and multicloud environments.
    - **Attack surface map**: The attack surface map provides information about your environment and graph query results in a visual format. 

- **Discover and safeguard critical assets**: Security Exposure Management marks predefined and customized assets as critical. You can then focus and prioritize on those critical assets to ensure security and business continuity.

- **Manage exposure**: Security Exposure Management provides a number of tools to manage exposure and mitigate exposure risk.
    - **Exposure insights**: Exposure insights aggregate security posture data, and provide rich context around the security posture state of your asset inventory. You leverage these insights to prioritize security effort, focus, and investment. Insights include security events, recommendations, metrics, secure score, and initiatives.
- **Manage exposure: attack paths**: As you manage exposure risk, attack paths show you how an attacker might breach your attack surface. 
    -  **Attack path generation**: Security Exposure Management generates attack paths based on the data collected across assets and workloads. It simulates attack scenarios, and identifies weaknesses that an attacker could exploit.
    - **Visibility**: You can use the attack surface map and enterprise exposure graph and attack surface map to visualize and understand potential threats. you can also get focus on choke points through which many attack paths flow.
    - **Recommendations**: Get actionable recommendation to mitigate identified attack paths.


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