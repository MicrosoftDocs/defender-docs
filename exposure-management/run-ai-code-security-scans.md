---
title: Run agentic code scans
description: Learn how to submit agentic code scans, check job status, view results, and manage jobs using the Defender CLI.
ms.topic: how-to
ms.date: 05/26/2026
ai-usage: ai-assisted
---

# Run agentic code scans (preview)

Use the Defender CLI to submit agentic code scans, monitor job status, and view results.

## Prerequisites

Before you start:

- Defender CLI is installed. See, [Set up the Defender CLI](defender-cli.md).
- Authenticate with your credentials.
- Navigate to your repository:

   ```bash
   cd /path/to/your/repo
   ```

## Run your first scan

Submit a scan and wait for results in a single command:

```bash
defender scan ai-scan submit .
```

This command archives your repository code, submits it to the agentic code security service for analysis, and waits for the scan to complete.

## Async workflow

For long-running scans, use the async workflow to submit a job and check status independently.

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

## View results in the portal

After a scan finishes, the Microsoft Defender portal publishes the results. To view the results:

1. Go to the [Microsoft Defender portal](https://security.microsoft.com).
1. Select **Exposure Management** > **Initiatives** > **Codename MDASH - Agentic code scanner (preview)**.

## Manage jobs

Use the following commands to list and cancel scan jobs:

```bash
defender status                         # List all tracked jobs
defender status cancel <JOB_ID>         # Cancel a running job
```

## Related content

- [Auto-fix agentic code vulnerabilities](auto-fix-ai-vulnerabilities.md)
- [Agentic code security overview](ai-code-security-overview.md)
- [Set up agentic code security](ai-code-security-onboarding.md)
- [Set up the Defender CLI](defender-cli.md)
- [View results in the initiative](mdash-initiative.md)
- [Understand scan results](understanding-mdash-results.md)
