---
title: Code to runtime - trace and fix cloud security issues at the source
description: Learn how to use code to runtime visibility to trace security issues from runtime back to source code and fix them at the origin to prevent recurrence.
ms.date: 02/08/2026
ms.topic: how-to
ms.author: dlanger
author: DebLanger
#customer intent: As a security administrator, I want to trace runtime security issues back to their source code origin and understand the blast radius to fix issues effectively at the source.
---

# Code to runtime: trace and fix cloud security issues at the source

Modern cloud applications move through stages that include source code, pipelines, registries, and runtime environments. A small code change can create many container images and workloads across clusters and namespaces. When a security issue appears at runtime, you might not know where the issue starts or how many assets it affects.

Code to runtime gives you end-to-end visibility across the software development lifecycle (SDLC). This feature helps you find the origin of an issue, assess its blast radius, and fix the issue at the source.

## Prerequisites

1. Defender CSPM plan / Defender for Containers, some of the correlation might be available only in DCSPM.
1. One or more of the following:
   - GitHub Connector (and DCSPM plan) ([learn more about setting up your GH connector and configure it to support code to runtime](quickstart-onboard-github.md))
   - Azure DevOps connector (and DCSPM plan) ([learn more about setting up your ADO connector and configure it to support code to runtime](quickstart-onboard-devops.md))
   - Defender CLI integrated into relevant pipelines (DCSPM/DfC plan enabled) ([Learn more](defender-cli-overview.md))
   - Use standard Docker labels in your container image build process. ([Learn more](container-image-mapping.md))

## Where you see Code to runtime

You access code to runtime from recommendations in Microsoft Defender for Cloud.

> [!NOTE]
> Currently only containers VA recommendations are supported.

When SDLC context is available, the recommendation page shows:

- A context banner indicating the issue's SDLC flow
- An SDLC chain view: Source → Pipeline → Registry → Runtime
- A dynamic count of impacted runtime assets
- Cards representing each SDLC stage
- Links to deeper views and remediation actions

    :::image type="content" source="media/code-to-runtime-mapping/c2r-context.png" alt-text="Screenshot of recommendations page with Code to Runtime context banner." lightbox="media/code-to-runtime-mapping/c2r-context.png":::

    :::image type="content" source="media/code-to-runtime-mapping/c2r-context-runtime.png" alt-text="Screenshot of recommendations page with the SDLC chain." lightbox="media/code-to-runtime-mapping/c2r-context-runtime.png":::

## How Code to runtime builds end-to-end context

When a runtime recommendation appears, Defender correlates data across the SDLC to identify:

1. Where the issue originated (for example, in code or the build pipeline).
1. Which intermediate stages are involved. These stages include the image in the registry and the pipeline that creates it.
1. How many assets are affected, giving you visibility into the blast radius.
1. Which actions you can take at each stage.

## Why this feature matters

- Fixing only at runtime can cause the issue to reappear during the next deployment.
- Fixing at the source prevents recurring regressions.
- Understanding impact helps you plan rollouts and coordinate work.
- Helps you identify the owner for the fix

## Walk the SDLC chain from runtime back to source

The SDLC chain provides a clear, linear path that explains how the affected workload was created. Each stage appears as a card. You can expand this card to see metadata and available actions.

## Understand the blast radius of the issue

Before taking action, you can open the All impacted assets grid for more information:

1. The list shows the impacted assets from the same source. It includes assets in the cloud environment or code environment. Fixing the issue at the source can impact all the affected assets either by automated CI/CD processes or by manual deployment of new code.
1. You can filter the list based on your preferences. For example, you can filter runtime assets by namespace to assign the issue to a specific development team. You can also filter by relevant asset metadata, such as image tags, labels and so on.
1. When you select a line, the system shows more details for that instance of the issue.

The grid shows:

- Each runtime workload that uses the affected image
- Clusters and namespaces
- Related recommendations
- Filtering and navigation options

This helps you:

- Prioritize issues
- Coordinate with owning teams
- Decide whether you need a staged rollout
- Avoid unintentionally breaking dependent workloads

## Handling missing or partial data

Some SDLC stages might not show full data because of missing prerequisites such as:

- Disabled connectors
- Missing permissions
- Absent pipeline signals
- Unsupported configurations

Instead of ending the experience, Code to Runtime provides:

- Clear explanations for missing data
- Guidance to enable or configure missing components
- An actionable path to expand SDLC visibility

## Act on these insights

Once you understand the issue and its impact, choose the appropriate next step:

### Assign ownership

Assign the recommendation directly to a person or team inside Defender for Cloud.

### Create or link a GitHub issue

If repository integration is enabled, you can:

- Auto populate an issue with the SDLC context
- Route it directly to engineering
- Provide precise guidance on what needs to change

> [!NOTE]
> This is currently only available in the Azure portal.

### Apply exemptions in a consistent way

If you exempt a finding (temporarily or permanently), you can do so:

- At the SDLC stage where it makes the most sense
- Once, instead of repeatedly across multiple workloads
- With partial exemptions if you want visibility on selected findings

## Example workflow

A typical investigation that uses code to runtime includes these steps:

1. Open a container runtime recommendation.
1. Review the SDLC context banner.
1. Identify the earliest stage where the issue originated.
1. Expand SDLC cards to explore source, pipeline, registry, and runtime data.
1. Use the impact grid to understand how many workloads are affected.
1. Assign ownership or open a GitHub issue.
1. (Optional) Apply an exemption at the appropriate SDLC stage.

## Summary

Code to Runtime gives you a unified, contextual view across the SDLC so you can:

- Find the real source of a runtime issue
- Understand its reach
- Fix it once in the most effective place
- Provide engineering teams with actionable, precise context

This streamlines collaboration between security and engineering and reduces repeated manual remediation work.

## Related content

- [What is GitHub Advanced Security integration with Microsoft Defender for Cloud (preview)?](github-advanced-security-overview.md)
- [Deploy GitHub Advanced Security integration with Microsoft Defender for Cloud](github-advanced-security-deploy.md)
- [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)
- [Container image mapping](container-image-mapping.md)