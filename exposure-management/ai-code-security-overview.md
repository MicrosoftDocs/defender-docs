---
title: Codename MDASH Overview
description: Learn how Codename MDASH - Agentic code scanner uses a multi-model agentic AI system to detect code vulnerabilities with depth and accuracy beyond traditional static analysis.
ms.topic: overview
ms.date: 08/26/2026
ms.custom: references_regions
ai-usage: ai-assisted
---

# Codename MDASH overview (preview)

Codename MDASH is an agentic code scanner within Microsoft Defender that uses a multi-model agentic AI system to assist security and engineering teams detect and fix code vulnerabilities with unprecedented depth and accuracy.

## How it works

This service uses a multistage agentic pipeline where specialized AI agents collaborate to find, validate, and prove vulnerabilities:

- **Prepare** — The system ranks files by risk using call-graph analysis and code complexity metrics, prioritizing functions most likely to contain vulnerabilities.
- **Scan** — More than 100 specialized AI agents (for example, injection-auditor, memory-safety-auditor, auth-bypass-auditor) analyze the ranked code using multiple LLMs. Each agent targets a specific vulnerability class.
- **Validate** — The system uses taint analysis and type resolution through Language Server Protocol (LSP) servers. A multi-model agentic debate refines confidence and eliminates false positives.
- **Dedup** — The system consolidates duplicate findings, producing a final set of unique, actionable vulnerabilities.

## Key features & capabilities

| Capability | Description |
|---|---|
|AI-powered vulnerability detection |Submits code repositories to a multi-model agentic pipeline that identifies vulnerabilities with greater depth than traditional, pattern-matching static analysis. |
|Granular confidence scoring |Rates each finding with a confidence score so teams can prioritize with precision. |
|AI-generated code fixes |Uses the `defender fix` command in the Defender CLI to generate and apply code fixes directly from scan results. |
|Centralized results in Defender portal |Publishes findings to Microsoft Security Exposure Management for organization-wide tracking and triage. |
|Deployment and developer integration|Connects directly to GitHub and Azure DevOps using connecters, triggers on-demand scans locally or in the CI/CD via Defender CLI and integrates with AI coding environments using a dedicated agentic SKILL.|

## Language support

Codename MDASH operates across codebases generically and supports all major programming languages. It has 100+ agents with different roles and expertise, and we tune it to deepen expertise across languages and environments. Codename MDASH is continually adding new agents and expertise to improve both detection and prioritization of findings. Currently, we've trained individual specially tuned expert agents with particularly deep expertise in languages such as C, C++, Java, and C#.

## Requirements

- For prerequisites, see [Set up agentic code security](ai-code-security-onboarding.md). 
- For permissions, see [Security posture – AI code scan](/defender-xdr/custom-permissions-details#security-posture--ai-code-scan).

## Allow list

The following domains must be reachable from the machine or pipeline running the CLI.

**Required for `defender scan ai-scan`**

- `*.cli.dfd.security.azure.com`
- `*.blob.core.windows.net`
- `*.azurefd.net`
- `*.login.microsoftonline.com`
- `*.graph.microsoft.com`

**Required for GitHub Actions (OIDC)**

- `*.token.actions.githubusercontent.com`

**Required for Azure Pipelines (OIDC)**

- `*.dev.azure.com`

**Recommended for telemetry**

- `*.in.applicationinsights.azure.com`
- `*.dc.services.visualstudio.com`

**Optional**

- `*.aka.ms`

**Required for `scan fs`**

- `*.ghcr.io`
- `*.public.ecr.aws`
- `*.registry-1.docker.io`
- `*.auth.docker.io`

## Cloud and region support

Codename MDASH - Agentic code scanner is available in the Azure commercial cloud in the following regions:

- US (United States)
- EU (Europe)
- UK (United Kingdom)
- AUS (Australia)
- IND (India)
- CH (Switzerland)
- UAE (United Arab Emirates)
  - UAE currently supports MDASH CLI scans only.
  
## Next steps

- [Set up agentic code security](ai-code-security-onboarding.md)
- [Set up Microsoft Foundry integration](mdash-foundry-integration.md)
- [Defender CLI setup](defender-cli-authentication.md)
- [Install and run Defender CLI](defender-cli.md)
- [View results in the initiative](mdash-initiative.md)
