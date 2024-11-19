---
title: Overview of Endor Labs integration
description: Learn how to enhance vulnerability analysis and provide comprehensive visibility of critical vulnerabilities by integrating Endor Labs with Microsoft Defender.
author: dcurwin
ms.author: dacurwin
ms.topic: overview
ms.date: 11/19/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn about the integration that exists between Endor Labs and Microsoft Defender for Cloud so that I can enhance the existing vulnerability analysis security capabilities that are provided when Defender for Cloud for comprehensive code to runtime visibility of critical vulnerabilities.
---

# Overview of Endor Labs integration

Microsoft Defender for Cloud's integration with Endor Labs improves its vulnerability analysis through reachability-based Software Composition Analysis (SCA). SCA provides a view of exploitable vulnerabilities from code to runtime.

Reachable vulnerabilities are security flaws that exist in open source dependencies that have a direct and exploitable execution path. These vulnerabilities are high risk because they can be actively triggered within the application's current flow and exploited by malicious actors. Addressing these exploitable vulnerabilities is critical in the prevention of potential attacks.

The integration with Endor Labs identifies vulnerable security combinations, such as exploitable vulnerabilities in open source packages used in internet-exposed workloads. Defender for Cloud users can see full attack paths from code committed in Azure DevOps, GitHub, or GitLab to running workloads on Azure, Amazon Web Services, or Google Cloud Platform. 

## Benefits of integrating Endor Labs

Endor Labs is a security platform that focuses on the identification and mitigation of vulnerabilities in partner dependencies within software applications. Endor Labs offers advanced reachability analysis that assesses the execution paths of these vulnerabilities, allowing security teams to prioritize and address them effectively.

Integrating Endor Labs with Microsoft Defender for Cloud gives you gain the ability to:

- Streamline the discovery and remediation of reachable vulnerabilities.
- View a comprehensive view list of security risks within an application's code flow.
- Help with the prevention of potential attacks through the identification of high-risk vulnerabilities early in the development lifecycle, thus ensuring robust application security from code to runtime.

With this integration, reachability analysis findings from Endor Labs are accessible within the Defender for Cloud experiences, including recommendations, attack path analysis, and security explorer. The integration provides visibility into the health of the code for central security teams, enabling them to better prioritize and mitigate open-source vulnerabilities from code development to runtime through advanced function-level reachability and exploitability analysis.

## Related content

- [Connect Endor Labs to Defender for Cloud](connect-endor-labs.md)
