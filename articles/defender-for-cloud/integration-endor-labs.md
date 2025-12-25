---
title: Overview of Endor Labs integration
description: Learn how integrating Endor Labs with Microsoft Defender for Cloud enhances vulnerability analysis by identifying exploitable open-source vulnerabilities from code to runtime.
author: Elazark
ms.author: elkrieger
ms.topic: overview
ms.date: 05/20/2025
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to understand how the Endor Labs integration enhances vulnerability analysis in Defender for Cloud so that I can prioritize exploitable vulnerabilities from code to runtime.

---

# Overview of Endor Labs integration

Microsoft Defender for Cloud integrates with Endor Labs to enhance vulnerability analysis by adding reachability-based Software Composition Analysis (SCA), helping security teams focus on open-source vulnerabilities that are exploitable within an application’s execution flow.

By correlating signals from source code repositories, build pipelines, and deployed workloads, Defender for Cloud provides visibility into exploitable vulnerabilities across the application lifecycle—from code development to runtime environments.

## Reachable vulnerabilities and risk prioritization

Reachable vulnerabilities are security flaws in open-source packages that have a confirmed execution path within an application. Unlike vulnerabilities that exist in unused or inactive code paths, reachable vulnerabilities can be actively triggered and exploited, making them higher risk.

The Endor Labs integration identifies vulnerable security combinations, such as exploitable open-source dependencies used by internet-exposed workloads. This reachability context enables Defender for Cloud to prioritize vulnerabilities based on exploitability rather than severity alone.

## Unified visibility across code and runtime

With this integration, Defender for Cloud correlates vulnerabilities identified in source repositories—such as Azure DevOps, GitHub, and GitLab—with workloads running across Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP). Security teams can trace attack paths from a vulnerable code commit through build and deployment pipelines to affected runtime resources.

Reachability analysis findings from Endor Labs surface directly in Defender for Cloud experiences, including:
- Security recommendations
- Attack path analysis
- Security explorer

This unified view helps central security teams understand how open-source risks propagate through their environments and where remediation efforts will have the greatest impact.

## Benefits of integrating Endor Labs

Integrating Endor Labs with Microsoft Defender for Cloud enables you to:

- Prioritize remediation by focusing on vulnerabilities that are actively exploitable.
- Reduce noise from vulnerabilities that don’t pose immediate risk.
- Gain code-to-runtime visibility into how open-source dependencies affect deployed workloads.
- Identify high-risk vulnerabilities earlier in the development lifecycle.

## Related content

- [Connect Endor Labs to Defender for Cloud](connect-endor-labs.md)