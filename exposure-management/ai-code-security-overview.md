---
title: Codename MDASH Overview
description: Learn how Codename MDASH - Agentic code scanner uses a multi-model agentic AI system to detect code vulnerabilities with depth and accuracy beyond traditional static analysis.
ms.topic: overview
ms.date: 05/26/2026
ms.custom: references_regions
ai-usage: ai-assisted
---

# Codename MDASH overview (private preview)

Codename MDASH - Agentic code scanner is a capability in Microsoft Defender that uses a multi-model agentic AI system to detect code vulnerabilities with unprecedented depth and accuracy. It extends the Defender CLI with agentic code scanning that goes beyond traditional static analysis.

## Capabilities

| Capability | Description |
|---|---|
| AI-powered vulnerability detection | Submits repository code to a multi-model agentic pipeline that identifies vulnerabilities with greater depth than traditional static analysis. |
| Granular confidence scoring | Rates each finding on a 10-level confidence hierarchy — from UNLIKELY to PROVEN — so teams can prioritize with precision. |
| AI-generated code fixes | Uses the `defender fix` command to generate and apply code fixes directly from scan results. |
| Centralized results in Defender portal | Publishes findings to Microsoft Security Exposure Management for organization-wide tracking and triage. |
| CI/CD integration | Runs as part of automated pipelines with SARIF output compatible with GitHub Advanced Security, Azure DevOps, and other tooling. |

## How it works

This service uses a multistage agentic pipeline where specialized AI agents collaborate to find, validate, and prove vulnerabilities:

- **Prepare** — Ranks files by risk using call-graph analysis and code complexity metrics, prioritizing functions most likely to contain vulnerabilities.
- **Scan** — More than 100 specialized AI agents (for example, injection-auditor, memory-safety-auditor, auth-bypass-auditor) analyze the ranked code using multiple LLMs. Each agent targets a specific vulnerability class.
- **Validate** — The system uses taint analysis and type resolution through Language Server Protocol (LSP) servers. A multi-model agentic debate refines confidence and eliminates false positives.
- **Dedup** — The system consolidates duplicate findings, producing a final set of unique, actionable vulnerabilities.

## Language support

Codename MDASH operates across codebases generically and supports all major programming languages. It has 100+ agents with different roles and expertise, and we tune it to deepen expertise across languages and environments.

Codename MDASH is continually adding new agents and expertise to improve both detection and prioritization of findings. Currently, we've trained individual specially tuned expert agents with particularly deep expertise in languages such as C, C++, Java, and C#.

## Key features

| Feature | Description |
|---|---|
| Multi-model agentic architecture | Over 100 specialized agents coordinated across multiple models - not a single LLM prompt. |
| 10-level confidence hierarchy | Granular confidence scoring from UNLIKELY to PROVEN so teams can prioritize with precision. |
| Integrated remediation | The `defender fix` command generates AI-powered code fixes from scan results. |
| Portal integration | Results publish to Microsoft Security Exposure Management for tracking and remediation. |

## Requirements

For prerequisites, see [Set up agentic code security](ai-code-security-onboarding.md). For information about permissions, see [Security posture – AI code scan](/defender-xdr/custom-permissions-details#security-posture--ai-code-scan).

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
