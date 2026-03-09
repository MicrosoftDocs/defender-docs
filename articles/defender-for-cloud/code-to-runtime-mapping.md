---
title: Code to runtime - trace and fix cloud security issues at the source
description: Learn how to use code to runtime visibility to trace security issues from runtime back to source code and fix them at the origin to prevent recurrence.
ms.date: 03/09/2026
ms.topic: how-to
ms.author: dlanger
author: DebLanger
#customer intent: As a security administrator, I want to trace runtime security issues back to their source code origin and understand the blast radius to fix issues effectively at the source.
---

# Code to runtime: trace and fix cloud security issues at the source

Modern cloud applications move through stages that include source code, pipelines, registries, and runtime environments. A small code change can create many container images and workloads across clusters and namespaces. When a security issue appears at runtime, you might not know where the issue starts or how many assets it affects.

Code to runtime gives you end-to-end visibility across the software development lifecycle (SDLC). This feature helps you find the origin of an issue, assess its blast radius, and fix the issue at the source.

## Code-to-Runtime (C2R) – Technical Prerequisites

The following prerequisites are required to establish **code-to-runtime relationships**.

### General Prerequisites (All Methods)

The following prerequisites apply regardless of the mapping method used:

- **Defender CSPM (Cloud Security Posture Management)** or **Defender for Containers** must be enabled on your cloud environment  
  - A limited set of mapping capabilities is included with Defender for Containers.
- Container images must be **built through a CI/CD pipeline**  
  - Images that are manually built and pushed are not supported (in some cases, manually built/pushed images may still have mapping).
- Container images must be **discoverable by Defender for Cloud**, either by:
  - Being stored in a **supported container registry**, or
  - Running in a **supported Kubernetes environment**

### Method 1: Connect Your Code Environment to Defender for Cloud

When you connect your code environment to Defender for Cloud, a set of automated tools is triggered automatically. These tools do **not** affect your existing DevOps workflows and enable code-to-runtime mapping.

>[!NOTE]
>
> - Currently supported for **Azure DevOps** and **GitHub**
> - Container images built and deployed **prior** to connecting may have limited support

**Learn more:**

- [Connect Azure DevOps to Defender for Cloud](quickstart-onboard-devops.md)
- [Connect GitHub to Defender for Cloud](quickstart-onboard-github.md)

### Method 2: Docker Labels–Based Mapping

Docker labels–based mapping relies on metadata embedded directly into the container image at build time. Defender for Cloud extracts this metadata from the OCI/Docker image manifest and uses it to correlate the image to its source repository.

**Learn more:**

- [OCI Docker image annotations specification](https://github.com/opencontainers/image-spec/blob/main/annotations.md)
- [Add OCI/Docker labels in Azure DevOps](https://learn.microsoft.com/azure/devops/pipelines/tasks/reference/docker-v2?view=azure-pipelines&tabs=yaml)
- [Add labels in GitHub](https://github.com/docker/metadata-action?tab=readme-ov-file)
- [Manually provide labels using the Dockerfile `LABEL` instruction](https://docs.docker.com/reference/dockerfile/)

>[!NOTE]
>
>- This method does **not** require a DevOps connector.
>- Mapping is performed for Defender CSPM or Defender for Containers–covered Kubernetes environments.

### Method 3: GitHub Attestations–Based Mapping

Attestation-based mapping uses **cryptographically verifiable provenance metadata** generated during GitHub Actions workflows. These attestations link container images to their exact source repository, commit, and build identity.

**Learn more:**

- [Using artifact attestations to establish provenance for builds – GitHub Docs](https://docs.github.com/en/actions/how-tos/secure-your-work/use-artifact-attestations/use-artifact-attestations)

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

    :::image type="content" source="media/code-to-runtime-mapping/code-to-runtime-context-banner.png" alt-text="Screenshot of recommendations page with Code to Runtime context banner." lightbox="media/code-to-runtime-mapping/code-to-runtime-context-banner.png":::

    :::image type="content" source="media/code-to-runtime-mapping/code-to-runtime-sdlc-chain.png" alt-text="Screenshot of recommendations page with the SDLC chain." lightbox="media/code-to-runtime-mapping/code-to-runtime-sdlc-chain.png":::

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