---
title: Overview of Mend.io integration
description: Learn how to enhance vulnerability analysis and provide comprehensive visibility of critical vulnerabilities by integrating Mend.io with Microsoft Defender.
author: ElazarK
ms.author: elkrieger
ms.topic: overview
ms.date: 04/24/2025
ai-usage: ai-assisted
#customer intent: As a user, I want to learn about the integration that exists between Mend.io and Microsoft Defender for Cloud so that I can enhance the existing vulnerability analysis security capabilities that are provided when Defender for Cloud for comprehensive code to runtime visibility of critical vulnerabilities.
---

# Overview of Mend.io integration

Microsoft Defender for Cloud integrates with Mend.io to improve vulnerability analysis using reachability-based Software Composition Analysis (SCA). SCA shows exploitable vulnerabilities from code to runtime.

Reachable vulnerabilities are security flaws in open-source dependencies with a direct and exploitable execution path. These vulnerabilities are high risk because malicious actors can actively trigger them within the application's current flow. Addressing these vulnerabilities is critical to prevent potential attacks.

The integration with Mend.io identifies vulnerable security combinations, such as exploitable vulnerabilities in open-source packages used in internet-exposed workloads. Defender for Cloud users can see full attack paths from code committed in Azure DevOps, GitHub, or GitLab to running workloads on Azure, Amazon Web Services (AWS), or Google Cloud Platform (GCP).

## Benefits of Integrating Mend.io

Mend.io is a security platform that identifies and mitigates vulnerabilities in partner dependencies within software applications. Mend.io offers advanced reachability analysis that assesses the execution paths of these vulnerabilities, allowing security teams to prioritize and address them effectively.

Integrating Mend.io with Microsoft Defender for Cloud allows you to:

- Streamline the discovery and remediation of reachable vulnerabilities.
- View a comprehensive list of security risks within an application's code flow.
- Prevent potential attacks by identifying high-risk vulnerabilities early in the development lifecycle, ensuring robust application security from code to runtime.

With this integration, reachability analysis findings from Mend.io are accessible within the Defender for Cloud experiences, including recommendations, attack path analysis, and security explorer. The integration provides visibility into the health of the code for central security teams. This visibility enables them to better prioritize and mitigate open-source vulnerabilities from code development to runtime. They achieve this visibility through advanced function-level reachability and exploitability analysis.

## Next step

> [!div class="nextstep"]
> [Connect Mend.io to Defender for Cloud](connect-mend-io.md)
