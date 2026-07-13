---
title: Install and run Defender CLI
description: Download and install Defender CLI, then run agentic code scans from the terminal.
ms.topic: how-to
ms.date: 05/31/2026
ai-usage: ai-assisted
---

# Install and run Defender CLI (preview)

Download Defender CLI and run agentic code scans from your terminal.

## Prerequisites

- Defender CLI authenticated. See [Defender CLI setup](defender-cli-authentication.md).

## Install Defender CLI

Download the CLI binary for your platform:

| Platform | URL |
|---|---|
| Windows | <https://cli.dfd.security.azure.com/public/v2/latest/Defender_win-x64.exe> |
| macOS x64 (Intel) | <https://cli.dfd.security.azure.com/public/v2/latest/Defender_osx-x64> |
| macOS ARM64 (Apple Silicon, M1+) | <https://cli.dfd.security.azure.com/public/v2/latest/Defender_osx-arm64> |
| Linux x64 | <https://cli.dfd.security.azure.com/public/v2/latest/Defender_linux-x64> |
| Linux ARM64 | <https://cli.dfd.security.azure.com/public/v2/latest/Defender_linux-arm64> |

```bash
# Linux
curl -fL -o defender \
  "https://cli.dfd.security.azure.com/public/v2/latest/Defender_linux-x64"
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

## Get the source code to scan

Defender CLI scans a local copy of your repository. Clone the repository you want to scan, or navigate to an existing local clone.

## Run your first scan

Submit a scan and wait for results in a single command:

```bash
cd /path/to/your/repo
defender scan ai-scan submit .
```

This command archives your repository code, submits it to the agentic code security service for analysis, and waits for the scan to complete.

## Async workflow

For long-running scans, submit a job and check status independently:

```bash
# Step 1: Submit and get a job ID
defender scan ai-scan submit .
# Output: Job submitted: <JOB_ID>

# Step 2: Check job status
defender status ai-scan <JOB_ID>

# Step 3: (Optional) Wait for completion and download results
defender status wait <JOB_ID> -o results.sarif
```

## Set severity thresholds

To limit results to high and critical findings only:

```bash
defender scan ai-scan submit . --severity high
```

## Manage jobs

```bash
defender status                         # List all tracked jobs
defender status cancel <JOB_ID>         # Cancel a running job
```

## Related content

- [Defender CLI setup](defender-cli-authentication.md)
- [CI/CD example for Defender CLI](defender-cli-cicd.md)
- [Review terminal results](review-terminal-results.md)
- [Review results in the Microsoft Defender portal](review-portal-results.md)
- [Auto-fix agentic code vulnerabilities](auto-fix-ai-vulnerabilities.md)

