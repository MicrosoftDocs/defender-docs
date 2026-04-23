---
title: GitHub Advanced Security Integration with Microsoft Defender for Cloud
description: Learn how GitHub Advanced Security integrates with Microsoft Defender for Cloud to provide unified code-to-runtime security from development to production.
ms.date: 04/23/2026
ms.topic: overview
ms.author: dlanger
author: DebLanger
#customer intent: As a security administrator, I want to understand how GitHub Advanced Security integrates with Microsoft Defender for Cloud to provide comprehensive application security across the development lifecycle.
---

# What is GitHub Advanced Security integration with Microsoft Defender for Cloud?

GitHub Advanced Security (GHAS) integration with Microsoft Defender for Cloud connects your source code repositories to cloud workloads. This integration automatically maps code changes to production environments, prioritizes security alerts based on deployment indication and real runtime context, and enables automated, coordinated remediation workflows between development and security teams. It provides unified security visibility across your development lifecycle.

Use this integration to:

- Track vulnerabilities from source code to deployed applications 
- Trace the code repository and the fix owner of origin for your vulnerable runtime workloads.
- Focus on security issues that affect production workloads.
- Coordinate fixes between GitHub repositories and Azure environments.
- Take advantage of AI-powered remediation tools for faster resolution.

This overview explains how the integration works and helps you understand its core capabilities before deployment.

## Main capabilities

### Smart code-to-runtime mapping

When you [connect your GitHub organization or repository to Microsoft Defender for Cloud](/azure/defender-for-cloud/quickstart-onboard-github), the system automatically maps source repositories to running cloud workloads. It uses Defender for Cloud proprietary code-to-runtime methods to ensure that every workload is tracked to its repository of origin (and vice versa).

This capability gives you instant end-to-end visibility, so you know which code powers each deployed application without time-consuming manual mapping.

:::image type="content" source="media/github-advanced-security/cve-vulnerability-tracking.jpg" alt-text="Screenshot of the Associated CVEs tab in Defender for Cloud, including links for viewing related alerts on GitHub." lightbox="media/github-advanced-security/cve-vulnerability-tracking.jpg":::

### Production-aware alert prioritization

Cut through noisy security alerts and focus on vulnerabilities that truly matter.

GHAS security findings in GitHub are prioritized by real runtime context from Defender for Cloud. They highlight risk factors like **Internet Exposure**, **Sensitive Data**, **Critical Resources**, and **Lateral Movement**. These risks, identified in runtime workloads, are dynamically linked to those workloads' code repositories of origin and the specific build artifacts in GitHub.

You can filter, triage, and act on only security issues that have actual production impact. This ability helps your team stay efficient and keep your most important applications secure.

**Runtime context enrichment includes:**

- **GHAS Alert Enrichment Status** - Security alerts status for alerts enriching container vulnerability assessment recommendations is surfaced in Defender for Cloud, reflecting alert resolution status and assignee information. You can copy the GHAS alert link for further investigation.

- **Runtime Risks in Dependabot alerts** - Runtime risk factors appear as metadata in Dependabot alerts, providing production context directly within the dependency scanning workflow.

- **Runtime Risks as alert filters** - Filter GHAS alerts by runtime risk factors to focus on vulnerabilities that pose actual threats to production environments.

- **Security Campaigns prioritization** - Runtime context powers GitHub Advanced Security Security Campaigns, enabling targeted remediation efforts based on actual production risk.

### Unified AI-driven remediation

Bridge the gap between security and engineering teams with integrated workflows and relevant context. GitHub Copilot Autofix and the GitHub Copilot coding agent provide validated, ready-to-merge fixes for security vulnerabilities. The multi-fix merge capability bundles multiple fixes into a single pull request for efficiency.

Within Defender for Cloud, security managers can see which security issues the engineering team already knows about, along with the status of those issues. Security managers open this view by selecting the **View on GitHub** link.

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

### Near-real-time synchronization

GitHub issue status and owner assignment changes made in GitHub are reflected in Defender for Cloud within minutes. This bidirectional sync ensures that both security and development teams have current information about remediation progress without manual updates.

### Comprehensive issue content

Generated GitHub issues include all information developers need to understand and fix vulnerabilities across every phase of the software development lifecycle. Issues contain:

- CVE details and vulnerability descriptions
- Runtime context and risk factors
- Affected workloads and deployment information
- Remediation guidance and fix prioritization
- Links to relevant Defender for Cloud recommendations

## Related content

- [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)
- [Deploy GitHub Advanced Security integration with Microsoft Defender for Cloud](github-advanced-security-deploy.md)
- [Quickstart: Connect your GitHub environment to Microsoft Defender for Cloud](quickstart-onboard-github.md)
