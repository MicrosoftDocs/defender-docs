---
title: GitHub Advanced Security Integration with Microsoft Defender for Cloud
description: Learn how GitHub Advanced Security integrates with Microsoft Defender for Cloud to provide unified code-to-cloud security from development to production.
ms.date: 12/08/2025
ms.topic: overview
ms.author: dlanger
author: DebLanger
#customer intent: As a security administrator, I want to understand how GitHub Advanced Security integrates with Microsoft Defender for Cloud to provide comprehensive application security across the development lifecycle.
---

# What is GitHub Advanced Security integration with Microsoft Defender for Cloud (preview)?

GitHub Advanced Security (GHAS) integration with Microsoft Defender for Cloud connects your source code repositories to cloud workloads. This integration automatically maps code changes to production environments, prioritizes security alerts based on real runtime context, and enables coordinated remediation workflows between development and security teams. It provides unified security visibility across your development lifecycle.

Use this integration to:

- Track vulnerabilities from source code to deployed applications.
- Focus on security issues that affect production workloads.
- Coordinate fixes between GitHub repositories and Azure environments.
- Take advantage of AI-powered remediation tools for faster resolution.

This overview explains how the integration works and helps you understand its core capabilities before deployment. The integration is currently in preview.

> [!NOTE]
> For the current preview release, native integration of GHAS with Defender for Cloud is supported only for container workloads.

## Main capabilities

### Smart code-to-cloud mapping

When you [connect your GitHub organization or repository to Microsoft Defender for Cloud](/azure/defender-for-cloud/quickstart-onboard-github), the system automatically maps source repositories to running cloud workloads. It uses Defender for Cloud proprietary code-to-cloud methods to ensure that every workload is tracked to its repository of origin (and vice versa).

This capability gives you instant end-to-end visibility, so you know which code powers each deployed application without time-consuming manual mapping.

### Production-aware alert prioritization

Cut through noisy security alerts and focus on vulnerabilities that truly matter.

GHAS security findings in GitHub are prioritized by real runtime context from Defender for Cloud. They highlight risk factors like **Internet Exposure**, **Sensitive Data**, **Critical Resources**, and **Lateral Movement**. These risks, identified in runtime workloads, are dynamically linked to those workloads' code repositories of origin and the specific build artifacts in GitHub.

You can filter, triage, and act on only security issues that have actual production impact. This ability helps your team stay efficient and keep your most important applications secure.

### Unified AI-driven remediation

Bridge the gap between security and engineering teams with integrated workflows and relevant context.

Within Defender for Cloud, security managers can see which security issues the engineering team already knows about, along with the status of those issues. Security managers open this view by selecting the **View on GitHub** link.

:::image type="content" source="media/github-advanced-security/cve-vulnerability-tracking.jpg" alt-text="Screenshot of the Associated CVEs tab in Defender for Cloud, including links for viewing related alerts on GitHub." lightbox="media/github-advanced-security/cve-vulnerability-tracking.jpg":::

Security managers can assign security recommendations for resolution to the relevant engineering teams by generating a GitHub issue assignment.

:::image type="content" source="media/github-advanced-security/code-to-runtime-workflow.jpg" alt-text="Screenshot of Defender for Cloud that displays remediation insights with affected assets linked to development phases." lightbox="media/github-advanced-security/code-to-runtime-workflow.jpg":::

The assignment is generated on the repository of origin. It provides runtime information and context to facilitate the engineering fix.

:::image type="content" source="media/github-advanced-security/github-security-issue-list.jpg" alt-text="Screenshot of the GitHub Issues tab that shows open issues with security and vulnerability labels highlighted for tracking fixes." lightbox="media/github-advanced-security/github-security-issue-list.jpg":::

:::image type="content" source="media/github-advanced-security/github-issue-security-details.jpg" alt-text="Screenshot of a GitHub issue interface that highlights security details, risk levels, and actionable insights for engineering teams." lightbox="media/github-advanced-security/github-issue-security-details.jpg":::

Engineering managers can assign an issue to a developer for further resolution. The assignee can use a Copilot coding agent for AI-powered automatic fixes.

:::image type="content" source="media/github-advanced-security/copilot-ai-autofix-tracking.jpg" alt-text="Screenshot of GitHub pull request details, including Copilot comments on security fixes." lightbox="media/github-advanced-security/copilot-ai-autofix-tracking.jpg":::

GitHub issue fixes, progress, and campaign advancements are tracked in real time. The statuses are reflected both in GitHub and in Defender for Cloud.

:::image type="content" source="media/github-advanced-security/github-issue-status-details.jpg" alt-text="Screenshot of GitHub issue details, including repository URL, owner, and status." lightbox="media/github-advanced-security/github-issue-status-details.jpg":::

This approach ensures that fixes are delivered rapidly, creates clear accountability, and simplifies collaboration. All these benefits happen inside the tools that your teams already use.

## Prerequisites

| Aspect | Details |
| ------ | ------- |
| Environmental requirements | - GitHub account with a connector created in Defender for Cloud<br>- GHAS license<br>- Defender Cloud Security Posture Management (CSPM) enabled on the subscription<br>- Microsoft Security Copilot (optional for automated remediation) |
| Roles and permissions | - Security Admin permissions<br>- Security Reader on the Azure subscription (to view findings in Defender for Cloud)<br>- GitHub organization owner |
| Cloud environments | - Available in commercial clouds only (not in Azure Government, Azure operated by 21Vianet, or other sovereign clouds) |

## Related content

- [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)
- [Deploy GitHub Advanced Security integration with Microsoft Defender for Cloud](github-advanced-security-deploy.md)
- [Quickstart: Connect your GitHub environment to Microsoft Defender for Cloud](quickstart-onboard-github.md)
