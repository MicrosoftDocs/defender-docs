---
title: Defender Code Security skills overview
description: Learn how Defender Code Security skills bring agentic code scan results and local scanning into your coding agent, so you can find and fix vulnerabilities without leaving the terminal.
ms.topic: overview
ms.author: dlanger
author: dlanger
ms.date: 06/28/2026
ai-usage: ai-assisted
---

# Defender Code Security skills overview (private preview)

Defender Code Security skills extend your coding agent with capabilities that surface Microsoft Defender agentic (Codename MDASH) scan results and run local security scans inline in chat. Developers can fetch the latest scan findings for their repo, run SAST, SCA, IaC, and secrets scans on their working tree, and accept AI-generated fixes - all without leaving the terminal or opening the portal.

Supported coding agents:

- **GitHub Copilot CLI**
- **Claude**

## Skills

The following skills are available:

| Skill | What it does |
|---|---|
| `onboard-defender-cli` | Downloads the Defender CLI binary and completes tenant setup. |
| `run-security-scan` | Retrieves the latest MDASH AI scan results for the current repo, and runs SAST, SCA, IaC, and secrets scans against your working tree or the full repo using Defender CLI. |
| `fix-security-issues` | Generates a diff preview for a selected finding and applies the fix to your working tree on acceptance. |

## What you can do

### Fetch AI scan results for your repo

The `run-security-scan` skill resolves your repo from the `origin` remote and returns the latest MDASH findings in chat — no portal navigation required.

Results include a header with the branch, scan timestamp, and scan ID, followed by a severity breakdown and per-finding rows with severity, rule, file and line number, a short rationale, and a **Fix it** affordance.

### Scan locally and fix findings inline

The `run-security-scan` skill runs Defender CLI scans against your local working tree. Results show the exact scope scanned (changed files or full repo), findings with severity and file location, and a **Fix it** affordance for each finding.

Select **Fix it** to invoke `fix-security-issues`, which posts a diff preview. Accept or decline the proposed change - accepted diffs apply directly to your working tree. No source code leaves the local machine.

## Requirements

- GitHub Copilot CLI or Claude CLI installed. If you don't have GitHub Copilot CLI, install it from [aka.ms/copilot](https://aka.ms/copilot).
- Agentic code security onboarded in your tenant. See [Set up agentic code security](ai-code-security-onboarding.md).
- The **Scan results** permission at the **Read** level in Microsoft Defender unified RBAC. See [Security posture – AI code scan](/defender-xdr/custom-permissions-details#security-posture--ai-code-scan).
- An active internet connection to download the Defender CLI binary during onboarding.

## Install and onboard

### Using GitHub Copilot CLI

Run this command in your terminal:

```bash
copilot plugin install microsoft/security-devops-common:plugin/defender-code-security
```

> [!NOTE]
> You might see a warning. You can safely ignore it. The actual plugin install for customers will be through a public marketplace.

### Using Claude CLI

The plugin isn't published to a Claude marketplace yet. To use Claude CLI, install the skill manually from the GitHub source.

1. Install the `onboard-defender-cli` skill from `https://github.com/microsoft/security-devops-common/tree/main/plugin/defender-code-security/skills/onboard-defender-cli`.

1. Claude fetches the `SKILL.md` and supporting files from that path and adds the skill to your environment.

1. Ask your agent to onboard you.

   Open Copilot, Claude, or your CLI agent, and send:

   ```text
   Onboard me to Defender CLI
   ```

   Or, if you're on Copilot CLI, run this command from your terminal:

   ```bash
   copilot -i /defender-code-security:onboard-defender-cli
   ```

1. The agent downloads the binary to `~/.mdc`, verifies the Authenticode signature, and adds it to your PATH automatically. After it's done, you only need to confirm that onboarding is complete.

1. Choose your tenant ID if prompted. If you have more than one tenant, you can choose the tenant ID.

1. Verify that onboarding works.

   After onboarding finishes, restart your terminal, or open your VS Code in a folder that contains a Git repository that has been AI-scanned, and ask your agent:

   ```text
   Show me AI scan results for my repo
   ```

   You should see findings rendered inline with severity, file locations, and suggested fixes.
   
## Next steps

- [Set up agentic code security](ai-code-security-onboarding.md)
- [Agentic code security overview](ai-code-security-overview.md)
- [Install and run Defender CLI](defender-cli.md)
- [Review agentic code scan results from the terminal](review-terminal-results.md)
- [Auto-fix agentic code vulnerabilities](auto-fix-ai-vulnerabilities.md)
