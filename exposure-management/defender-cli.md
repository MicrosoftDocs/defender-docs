---
title: Install and run Defender CLI
description: Download and install Defender CLI, then run agentic code scans from the terminal.
ms.topic: how-to
ms.date: 08/18/2026
ai-usage: ai-assisted
---

# Install and run Defender CLI (Preview)

The Defender CLI is a command-line tool for MDASH and other security scanners in Microsoft Defender. It uses a multi-model, agentic AI system to help security and engineering teams detect and remediate code vulnerabilities. Through the Defender CLI, you can run agentic code scans and apply fixes locally or in CI/CD pipelines. The Defender CLI is distributed as a standalone executable for Windows, macOS, and Linux.


## Prerequisites

- The Defender CLI supports two authentication methods: Use **app-based authentication** for CI/CD pipelines and other non-interactive automation, and  **interactive authentication** for local terminal scans by signed-in users. The permissions you need depend on your authentication method. For details, see [Defender CLI setup for agentic code security](./defender-cli-authentication.md).
- Set the tenant environment variable, such as `DEFENDER_ASPM_TENANT_ID`. The required variables depend on the authentication method you use. For details, see [Defender CLI setup for agentic code security](./defender-cli-authentication.md).
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


```bash
# Step 1: Submit and get a job ID
./defender scan ai-scan submit <TARGET_SOURCE>
# Output: Job submitted: <JOB_ID>

# Step 2: Check job status
./defender status <JOB_ID>

# Step 3: (Optional) Wait for completion and download results
./defender status wait <JOB_ID> -o results.sarif
```


### Scan with a scan profile (Preview)

A **scan profile** selects which AI models run your scan. Two profiles are available:

| Profile | Models | Use when |
| -------- | -------- | -------- |
| `gpt-general-profile` | GPT-5.4, GPT-5.3-Codex, GPT-5.4-Mini | General-purpose agentic code scanning (the baseline model set). |
| `mai-augmented-profile` (preview)| GPT-5.4, GPT-5.3-Codex, GPT-5.4-Mini + MAI-Cyber-1-Flash | You want the baseline models augmented with the cyber-specialized MAI-Cyber-1-Flash model. |

See available profiles and the current default:

```bash
./defender scan profile model list
./defender scan profile model show-default
```


Run one scan with a specific profile (overrides the default for this scan only):

```bash
# Baseline profile:
./defender scan ai-scan submit <TARGET_SOURCE> --model-profile gpt-general-profile

# MAI-augmented profile:
./defender scan ai-scan submit <TARGET_SOURCE> --model-profile mai-augmented-profile
```


### Filter by severity

When submitting a scan, you can limit the returned results to high and critical severity findings only. This narrows the output to the issues that pose the greatest risk, making triage faster and helping teams prioritize remediation where it matters most. Use the `--severity` flag to set the threshold, with accepted values of `low` (default), `medium`, `high`, or `critical`.

```bash
./defender scan ai-scan submit <TARGET_SOURCE> --severity high
```


## Manage jobs 

The Defender CLI `status` command provides a quick access to a the jobs tracked by Codename MDASH. It allows you to list all jobs currently being tracked, view details for a specific job, block and download SARIF file, re-download the SARIF for a given run, and more.


```bash
./defender status                         # List all tracked jobs
./defender status <JOB_ID>                # Show details of a job
./defender status result <JOB_ID>         # Download a finished report
./defender status log <JOB_ID>            # Print the path of the auto-saved debug log for a run
```


## Download the result

Scans run asynchronously by default, and take some time to complete. Instead of repeatedly checking the job status, the `wait` command waits for the job to complete and downloads the results to a SARIF file. For details, see [Review agentic code scan results from the terminal](./review-terminal-results.md). 

The following command waits for scan `<JOB_ID>` to finish, then saves the results to `results.sarif`:

```bash
./defender status wait <JOB_ID> -o results.sarif
```

## Re-download the result

Once a job has reached a terminal state (**completed** or **failed**), download its results using the command below. This command is particularly useful if you've cleared the local SARIF file, the original `wait` command was interrupted before it finished, or you submitted the job from one machine but want to retrieve the results from another. Replace `<JOB_ID>` with your actual job ID. 

```bash
./defender status result <JOB_ID>
```


## Cancel job

Canceling a scan does not refund tokens that have already been consumed. During a scan, MDASH makes live LLM calls that consume tokens as work is processed. If you cancel a scan that is already running, MDASH stops scheduling new work, but you are still charged for any tokens consumed before the cancellation takes effect. Canceling a scan can prevent additional token consumption from future work, but it does not refund tokens that have already been used.


```bash
./defender status cancel <JOB_ID>
```

## Troubleshooting

When troubleshooting Defender CLI issues, administrators or support teams may ask you to provide the auto-saved log to help diagnose the problem. To find the log path for a specific run, use the following command on the same machine where the scan occurred, replacing `<JOB_ID>` with the scan’s job ID.


```bash
./defender status log <JOB_ID>
```

When troubleshooting unexpected CLI behavior, one option is to re-run the command with a higher log level, such as debug, which surfaces more detailed diagnostic output than the default info level. This can help you identify the cause. However, this approach only works if you're able to reproduce the issue by re-running the command. To adapt the example below for your scenario:

- Replace the `<failing-command>` placeholder with the command that is failing. For example: `scan ai-scan submit .`
- Set `--log-level` to the appropriate level. Expected values: `trace`, `debug`, `info` (default), `warn`, `error`.
- Optionally, set `--log-file` to a file path. When this flag is used, the CLI writes the debug output to the specified file instead of only displaying it in the console.

```bash
./defender <failing-command> --log-level debug --log-file ./defender-debug.log
```

For example, if a scan fails, re-run the command and append the `--log-level` flag to the command as follows:

```bash
./defender scan ai-scan submit <TARGET_SOURCE> --log-level debug
```


## Related content

- [Defender CLI setup](defender-cli-authentication.md)
- [CI/CD example for Defender CLI](defender-cli-cicd.md)
- [Review terminal results](review-terminal-results.md)
- [Review results in the Microsoft Defender portal](review-portal-results.md)
- [Auto-fix agentic code vulnerabilities](auto-fix-ai-vulnerabilities.md)
