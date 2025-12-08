---
title: GitHub Advanced Security integration with Microsoft Defender for Cloud
description: Learn how GitHub Advanced Security integrates with Microsoft Defender for Cloud to provide unified code-to-cloud security from development to production.
ms.date: 12/08/2025
ms.topic: overview
#customer intent: As a security administrator, I want to understand how GitHub Advanced Security integrates with Microsoft Defender for Cloud to provide comprehensive application security across the development lifecycle.
---

# What is GitHub Advanced Security integration with Microsoft Defender for Cloud?

Modern software moves fast, and so do attackers. That's why we're transforming application security with a solution that unifies code and runtime, empowering both developers and security teams to take control of risk at every stage of the software development lifecycle.

With this integration, you gain seamless visibility from source code to cloud workloads. By automatically connecting code changes, build artifacts, and production environments using attestations and real-time runtime context, we deliver security insights that reflect your actual footprint, not just theoretical risks. Our platform prioritizes issues with real production impact and leverages AI-powered remediation, so you can focus time and resources on what truly matters.

Unlike traditional tools that scatter findings across disconnected silos, our approach brings together vulnerabilities, dependencies, infrastructure, and runtime context into one actionable dashboard. You can instantly see which issues affect critical, internet-exposed applications running in production, mobilize fix campaigns directly from Microsoft Defender for Cloud, and track progress within the familiar GitHub workflow.

We designed this integration to work out-of-the-box for teams using GitHub, GHAS, and MDC, delivering the fastest path to intelligent, code-to-cloud security anywhere.

## Main capabilities

### Smart code-to-cloud mapping

As soon as you connect your GitHub organization / repo to Microsoft Defender for Cloud (MDC), the system automatically maps source repositories to running cloud workloads, using GitHub's Artifact Attestations and MDC proprietary "Code 2 Cloud" methods that ensure every workload is tracked to it's repo of origin and vice versa.

This gives instant end-to-end visibility, so you know which code powers each deployed application without time-consuming manual mapping.

### Production-aware alert prioritization

Cut through noisy security alerts and focus on vulnerabilities that truly matter. 

GHAS Security findings in GitHub are prioritized by real runtime context from MDC, highlighting risk factors like: Internet Exposure, Sensitive Data processing, Critical Resources and Lateral Movement. Those risk, spotted for runtime workloads are dynamically linked to those workloads code repositories of origin and the specific build artifacts in GitHub, letting you filter, triage, and act only on security issues with actual production impact, helping your team stay efficient and keep your most important applications secure.

### Unified AI-driven remediation 

Bridge the gap between security and engineering teams with integrated workflows and relevant context.

Within MDC, security managers can get indication regarding the security issues that already known to the engineering and their status, by clicking the "View on GitHub" link 

They can assign security recommendations for resolution to the relevant engineering teams by generate a GitHub issue assignment 

that would be generated on the repository of origin, providing runtime information and context to facilitate engineering fix.

Engineering manager can assign the issue to a developer for furthered resolution and the assignee can leverage Copilot Coding Agent for AI-powered autofixes.

GitHub issues fixes advancements and campaign progress is tracked in real time and the statuses reflected both in GitHub and in MDC.

This ensures fixes are delivered rapidly, creates clear accountability, and simplifies collaboration, all inside the tools your teams already use.

## Prerequisites 

| Aspect | Details |
|--------|---------|
| Environmental Requirements | - GitHub account with a connector created in Microsoft Defender for Cloud (MDC)<br>- GitHub Advanced Security (GHAS) license<br>- Defender CSPM enabled on the subscription<br>- GitHub Security Copilot (optional for automated remediation) |
| Roles & Permissions | - Security Admin permissions<br>- Security Reader on the Azure Subscription (to view findings in MDC)<br>- GitHub organization Owner |
| Cloud Environments | - Available in Commercial Clouds only (not in US Gov, China Gov, or other sovereign clouds) |

> [!NOTE]
> GHAS & MDC native integration supported for Containers workloads only for the Preview 

## Next steps

- Learn about DevOps security in Defender for Cloud: [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)
- Learn how to setup GHAS & MDC native integration: [Deploy GitHub Advanced Security integration](github-advanced-security-deploy.md)
- [Connect your GitHub organizations](quickstart-onboard-github.md)
