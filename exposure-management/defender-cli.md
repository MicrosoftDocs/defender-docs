---
title: Install and run Defender CLI
description: Download and install Defender CLI, then run agentic code scans from the terminal.
ms.topic: how-to
ms.date: 05/31/2026
ai-usage: ai-assisted
---

# Install and run Defender CLI (Preview)

Download Defender CLI and run agentic code scans from your terminal.

## Prerequisites

- Defender CLI authenticated. See [Defender CLI setup](defender-cli-authentication.md).
- A local clone of the repository you want to scan.


## Install Defender CLI

Download the CLI binary for your platform:

### Windows

```powershell
# Windows x64
Invoke-WebRequest ` 
    -Uri "https://cli.dfd.security.azure.com/public/v2/latest/Defender_win-x64.exe" ` 
    -OutFile "defender.exe"
```

### Linux or macOS

```bash
# Linux (x64)
curl -fL -o defender \
  "https://cli.dfd.security.azure.com/public/v2/latest/Defender_linux-x64"
chmod +x defender

# Linux (arm64)
curl -fL -o defender \
  "https://cli.dfd.security.azure.com/public/v2/latest/Defender_linux-arm64"
chmod +x defender

# macOS Intel
curl -fLo Defender https://cli.dfd.security.azure.com/public/v2/latest/Defender_osx-x64
chmod +x Defender
xattr -d com.apple.quarantine Defender 2>/dev/null || true

# macOS Apple Silicon
curl -fLo Defender https://cli.dfd.security.azure.com/public/v2/latest/Defender_osx-arm64
chmod +x Defender
xattr -d com.apple.quarantine Defender 2>/dev/null || true
```

## Scan

Submit a scan and wait for results in a single command:

```powershell
defender.exe scan ai-scan submit <TARGET_SOURCE_DIRECTORY>
```

This submits your code and **waits** for results. When it finishes, results are downloaded to the <TARGET_SOURCE_DIRECTORY> and are available in the [Microsoft Defender portal](https://security.microsoft.com).

### Scan with a scan profile (Preview)

A **scan profile** selects which AI models run your scan. Two profiles are available:

| Profile | Models | Use when |
| -------- | -------- | -------- |
| `gpt-general-profile` | GPT-5.4, GPT-5.3-Codex, GPT-5.4-Mini | General-purpose agentic code scanning (the baseline model set). |
| `mai-augmented-profile` (preview)| GPT-5.4, GPT-5.3-Codex, GPT-5.4-Mini + MAI-Cyber-1-Flash | You want the baseline models augmented with the cyber-specialized MAI-Cyber-1-Flash model. |

See available profiles and the current default:

```powershell
defender scan profile model list
defender scan profile model show-default
```

Run one scan with a specific profile (overrides the default for this scan only):

```powershell
# Baseline profile:
defender scan ai-scan submit . --model-profile gpt-general-profile

# MAI-augmented profile:
defender scan ai-scan submit . --model-profile mai-augmented-profile
```

### Async workflow (long-running scans)

Submit a job, then check on it independently:

```powershell
# Step 1: Submit and get a job ID
defender.exe scan ai-scan submit .
# Output: Job submitted: <JOB_ID>

# Step 2: Check job status
defender.exe status <JOB_ID>

# Step 3: (Optional) Wait for completion and download results
defender.exe status wait <JOB_ID> -o results.sarif
```

### Filter by severity

Return only high and critical findings:

```powershell
defender.exe scan ai-scan submit . --severity high
```

### Manage jobs

```powershell
defender.exe status                         # List all tracked jobs
defender.exe status result <JOB_ID>         # Download a finished report
defender.exe status log <JOB_ID>            # Print the path of the auto-saved debug log for a run
```
#### Cancel job

Canceling a scan does not refund tokens that have already been consumed. During a scan, MDASH makes live LLM calls that consume tokens as work is processed. If you cancel a scan that is already running, MDASH stops scheduling new work, but you are still charged for any tokens consumed before the cancellation takes effect. Canceling a scan can prevent additional token consumption from future work, but it does not refund tokens that have already been used.

```powershell
defender.exe status cancel <JOB_ID>         # Cancel a running job
```

## Related content

- [Defender CLI setup](defender-cli-authentication.md)
- [CI/CD example for Defender CLI](defender-cli-cicd.md)
- [Review terminal results](review-terminal-results.md)
- [Review results in the Microsoft Defender portal](review-portal-results.md)
- [Auto-fix agentic code vulnerabilities](auto-fix-ai-vulnerabilities.md)