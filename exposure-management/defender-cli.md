---
title: Install and run Defender CLI
description: Download and install Defender CLI, then run agentic code scans from the terminal.
ms.topic: how-to
ms.date: 08/06/2026
ai-usage: ai-assisted
---

# Install and run Defender CLI (Preview)

Download Defender CLI and run agentic code scans from your terminal.

## Prerequisites

- Defender CLI authenticated. See [Defender CLI setup](defender-cli-authentication.md).
- A local clone of the repository you want to scan.


## Install Defender CLI

Download the CLI binary for your platform:


# [Windows](#tab/windows)

```powershell
# Windows x64
Invoke-WebRequest ` 
    -Uri "https://cli.dfd.security.azure.com/public/v2/latest/Defender_win-x64.exe" ` 
    -OutFile "defender.exe"
```


# [macOS](#tab/macos)

```bash
# macOS Intel
curl -fLo Defender https://cli.dfd.security.azure.com/public/v2/latest/Defender_osx-x64
chmod +x Defender
xattr -d com.apple.quarantine Defender 2>/dev/null || true

# macOS Apple Silicon
curl -fLo Defender https://cli.dfd.security.azure.com/public/v2/latest/Defender_osx-arm64
chmod +x Defender
xattr -d com.apple.quarantine Defender 2>/dev/null || true
```

# [Linux](#tab/linux)

```bash
# Linux (x64)
curl -fL -o defender \
  "https://cli.dfd.security.azure.com/public/v2/latest/Defender_linux-x64"
chmod +x defender

# Linux (arm64)
curl -fL -o defender \
  "https://cli.dfd.security.azure.com/public/v2/latest/Defender_linux-arm64"
chmod +x defender
```

---

## Scan

By default, scans run asynchronously. This means that when you submit a scan, the scanner doesn't wait around for it to finish. It exits immediately and hands you back a **Job ID**. The Job ID serves as a persistent reference that can subsequently be used to download scan result artifacts, cancel the job, wait for job completion, or query its current status.

In the following commands, replace the `<TARGET_SOURCE>` placeholder with one of the path to your target source code directory, for example `my-code\project1`. If you're running the Defender CLI from within your code's directory, use `.` to refer to the current directory. 

# [Windows](#tab/windows)

```powershell
# Step 1: Submit and get a job ID
defender.exe scan ai-scan submit <TARGET_SOURCE>
# Output: Job submitted: <JOB_ID>

# Step 2: Check job status
defender.exe status <JOB_ID>

# Step 3: (Optional) Wait for completion and download results
defender.exe status wait <JOB_ID> -o results.sarif
```


# [macOS](#tab/macos)

```bash
# Step 1: Submit and get a job ID
./defender scan ai-scan submit <TARGET_SOURCE>
# Output: Job submitted: <JOB_ID>

# Step 2: Check job status
./defender status <JOB_ID>

# Step 3: (Optional) Wait for completion and download results
./defender status wait <JOB_ID> -o results.sarif
```

# [Linux](#tab/linux)

```bash
# Step 1: Submit and get a job ID
./defender scan ai-scan submit <TARGET_SOURCE>
# Output: Job submitted: <JOB_ID>

# Step 2: Check job status
./defender status <JOB_ID>

# Step 3: (Optional) Wait for completion and download results
./defender status wait <JOB_ID> -o results.sarif
```

---



### Scan with a scan profile (Preview)

A **scan profile** selects which AI models run your scan. Two profiles are available:

| Profile | Models | Use when |
| -------- | -------- | -------- |
| `gpt-general-profile` | GPT-5.4, GPT-5.3-Codex, GPT-5.4-Mini | General-purpose agentic code scanning (the baseline model set). |
| `mai-augmented-profile` (preview)| GPT-5.4, GPT-5.3-Codex, GPT-5.4-Mini + MAI-Cyber-1-Flash | You want the baseline models augmented with the cyber-specialized MAI-Cyber-1-Flash model. |

See available profiles and the current default:


# [Windows](#tab/windows)

```powershell
defender.exe scan profile model list
defender.exe scan profile model show-default
```


# [macOS](#tab/macos)

```bash
./defender scan profile model list
./defender scan profile model show-default
```

# [Linux](#tab/linux)

```bash
./defender scan profile model list
./defender scan profile model show-default
```

---


Run one scan with a specific profile (overrides the default for this scan only):

# [Windows](#tab/windows)

```powershell
# Baseline profile:
defender.exe scan ai-scan submit <TARGET_SOURCE> --model-profile gpt-general-profile

# MAI-augmented profile:
defender.exe scan ai-scan submit <TARGET_SOURCE> --model-profile mai-augmented-profile
```


# [macOS](#tab/macos)

```bash
# Baseline profile:
./defender scan ai-scan submit <TARGET_SOURCE> --model-profile gpt-general-profile

# MAI-augmented profile:
./defender scan ai-scan submit <TARGET_SOURCE> --model-profile mai-augmented-profile
```

# [Linux](#tab/linux)

```bash
# Baseline profile:
./defender scan ai-scan submit <TARGET_SOURCE> --model-profile gpt-general-profile

# MAI-augmented profile:
./defender scan ai-scan submit <TARGET_SOURCE> --model-profile mai-augmented-profile
```

---


## Filter by severity

Return only high and critical findings:


# [Windows](#tab/windows)

```powershell
defender.exe scan ai-scan submit <TARGET_SOURCE> --severity high
```


# [macOS](#tab/macos)

```bash
./defender scan ai-scan submit <TARGET_SOURCE> --severity high
```

# [Linux](#tab/linux)

```bash
./defender scan ai-scan submit <TARGET_SOURCE> --severity high
```

---


## Manage jobs 

# [Windows](#tab/windows)

```powershell
defender.exe status                         # List all tracked jobs
defender.exe status result <JOB_ID>         # Download a finished report
defender.exe status log <JOB_ID>            # Print the path of the auto-saved debug log for a run
```


# [macOS](#tab/macos)

```bash
./defender status                         # List all tracked jobs
./defender status result <JOB_ID>         # Download a finished report
./defender status log <JOB_ID>            # Print the path of the auto-saved debug log for a run
```

# [Linux](#tab/linux)

```bash
./defender status                         # List all tracked jobs
./defender status result <JOB_ID>         # Download a finished report
./defender status log <JOB_ID>            # Print the path of the auto-saved debug log for a run
```

---



### Download the result

Once a job has reached a terminal state (**completed** or **failed**), download its results using the command below. This command is particularly useful if you've cleared the local SARIF file, the original `wait` command was interrupted before it finished, or you submitted the job from one machine but want to retrieve the results from another. Replace `<JOB_ID>` with your actual job ID. 

# [Windows](#tab/windows)

```powershell
defender.exe status result <JOB_ID>
```


# [macOS](#tab/macos)

```bash
./defender status result <JOB_ID>
```

# [Linux](#tab/linux)

```bash
./defender status result <JOB_ID>
```

---


### Cancel job

Canceling a scan does not refund tokens that have already been consumed. During a scan, MDASH makes live LLM calls that consume tokens as work is processed. If you cancel a scan that is already running, MDASH stops scheduling new work, but you are still charged for any tokens consumed before the cancellation takes effect. Canceling a scan can prevent additional token consumption from future work, but it does not refund tokens that have already been used.

# [Windows](#tab/windows)

```powershell
defender.exe status cancel <JOB_ID>
```


# [macOS](#tab/macos)

```bash
./defender status cancel <JOB_ID>
```

# [Linux](#tab/linux)

```bash
./defender status cancel <JOB_ID>
```

---



## Related content

- [Defender CLI setup](defender-cli-authentication.md)
- [CI/CD example for Defender CLI](defender-cli-cicd.md)
- [Review terminal results](review-terminal-results.md)
- [Review results in the Microsoft Defender portal](review-portal-results.md)
- [Auto-fix agentic code vulnerabilities](auto-fix-ai-vulnerabilities.md)
