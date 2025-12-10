---
title: GitHub Advanced Security integration with Microsoft Defender for Cloud
description: Learn how GitHub Advanced Security integrates with Microsoft Defender for Cloud to provide unified code-to-cloud security from development to production.
ms.date: 12/08/2025
ms.topic: overview
ms.author: dlanger
author: DebLanger
#customer intent: As a security administrator, I want to understand how GitHub Advanced Security integrates with Microsoft Defender for Cloud to provide comprehensive application security across the development lifecycle.
---

# What is GitHub Advanced Security integration with Microsoft Defender for Cloud?

GitHub Advanced Security (GHAS) integration with Microsoft Defender for Cloud connects your source code repositories to cloud workloads, providing unified security visibility across your development lifecycle. This integration automatically maps code changes to production environments, prioritizes security alerts based on real runtime context, and enables coordinated remediation workflows between development and security teams.

Use this integration to:

- Track vulnerabilities from source code to deployed applications
- Focus on security issues that affect production workloads
- Coordinate fixes between GitHub repositories and Azure environments
- Leverage AI-powered remediation tools for faster resolution

This overview explains how the integration works and helps you understand its core capabilities before deployment.

## Main capabilities

### Smart code-to-cloud mapping

When you connect your GitHub organization or repo to Microsoft Defender for Cloud (MDC) as explained [here](/azure/defender-for-cloud/quickstart-onboard-github), the system automatically maps source repositories to running cloud workloads. It uses MDC proprietary "Code 2 Cloud" methods that ensure every workload is tracked to its repo of origin and vice versa.

This capability gives you instant end-to-end visibility, so you know which code powers each deployed application without time-consuming manual mapping.

### Production-aware alert prioritization

Cut through noisy security alerts and focus on vulnerabilities that truly matter.

GHAS Security findings in GitHub are prioritized by real runtime context from MDC, highlighting risk factors like **Internet Exposure**, **Sensitive Data** processing, **Critical Resources**, and **Lateral Movement**. These risks, identified in runtime workloads, are dynamically linked to those workloads' code repositories of origin and the specific build artifacts in GitHub. You can filter, triage, and act only on security issues with actual production impact, helping your team stay efficient and keep your most important applications secure.

### Unified AI-driven remediation

Bridge the gap between security and engineering teams with integrated workflows and relevant context.

Within MDC, security managers can see which security issues the engineering team already knows about and their status by selecting the **View on GitHub** link.

 :::image type="content" source="media/github-advanced-security/cve-vulnerability-tracking.jpg" alt-text="Screenshot of Associated CVEs tab showing CVE titles, CVSS scores, fix versions, and 'View on GitHub' links for related alerts." lightbox="media/github-advanced-security/cve-vulnerability-tracking.jpg":::

They can assign security recommendations for resolution to the relevant engineering teams by generating a GitHub issue assignment.

:::image type="content" source="media/github-advanced-security/code-to-runtime-workflow.jpg" alt-text="Screenshot of MDC displaying remediation insights with impacted assets linked to Code and Runtime phases. Runtime phase includes a 'Take Action' button." lightbox="media/github-advanced-security/code-to-runtime-workflow.jpg":::

The assignment is generated on the repository of origin, providing runtime information and context to facilitate the engineering fix.

:::image type="content" source="media/github-advanced-security/github-security-issue-list.jpg" alt-text="Screenshot of GitHub Issues tab showing open issues with labels 'security' and 'vulnerability' highlighted for tracking fixes." lightbox="media/github-advanced-security/github-security-issue-list.jpg":::

:::image type="content" source="media/github-advanced-security/github-issue-security-details.jpg" alt-text="Screenshot of a GitHub issue interface highlighting security details, risk levels, and actionable insights for engineering teams." lightbox="media/github-advanced-security/github-issue-security-details.jpg":::

Engineering managers can assign the issue to a developer for further resolution, and the assignee can leverage Copilot Coding Agent for AI-powered autofixes.

:::image type="content" source="media/github-advanced-security/copilot-ai-autofix-tracking.jpg" alt-text="Screenshot of GitHub pull request details displaying updated Dockerfile base image, CVE links, and Copilot's comments on security fixes." lightbox="media/github-advanced-security/copilot-ai-autofix-tracking.jpg":::

GitHub issue fixes, progress, and campaign advancements are tracked in real time, and the statuses are reflected both in GitHub and in MDC.

:::image type="content" source="media/github-advanced-security/github-issue-status-details.jpg" alt-text="Screenshot of GitHub issue details showing repository URL, owner, status, and interactive 'Take Action' button." lightbox="media/github-advanced-security/github-issue-status-details.jpg":::

This approach ensures fixes are delivered rapidly, creates clear accountability, and simplifies collaboration, all inside the tools your teams already use.

## Prerequisites

| Aspect | Details |
|--------|---------|
| Environmental Requirements | - GitHub account with a connector created in Microsoft Defender for Cloud (MDC)<br>- GitHub Advanced Security (GHAS) license<br>- Defender CSPM enabled on the subscription<br>- GitHub Security Copilot (optional for automated remediation) |
| Roles & Permissions | - Security Admin permissions<br>- Security Reader on the Azure Subscription (to view findings in MDC)<br>- GitHub organization Owner |
| Cloud Environments | - Available in Commercial Clouds only (not in US Gov, China Gov, or other sovereign clouds) |

> [!NOTE]
> GHAS and MDC native integration is supported for Containers workloads only for the current preview release.

## Next steps

- Learn about DevOps security in Defender for Cloud: [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)
- Learn how to set up GHAS and MDC native integration: [Deploy GitHub Advanced Security integration](github-advanced-security-deploy.md)
- [Connect your GitHub organizations](quickstart-onboard-github.md)
