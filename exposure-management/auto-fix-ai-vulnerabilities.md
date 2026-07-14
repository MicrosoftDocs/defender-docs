---
title: Autofix agentic code vulnerabilities
description: Learn how to use the Defender CLI to generate AI-powered code fixes from your agentic code scan results.
ms.topic: how-to
ms.date: 05/27/2026
ai-usage: ai-assisted
---

# Autofix agentic code vulnerabilities (preview)

After running an agentic code scan, use `defender fix` to generate AI-powered code fixes from your scan results.

## Prerequisites

Before you start:

- Install Defender CLI. See [Set up the Defender CLI](defender-cli.md).
- Install GitHub Copilot CLI. See [Installing GitHub Copilot in the CLI](https://docs.github.com/en/copilot/github-copilot-in-the-cli/installing-github-copilot-in-the-cli).
- Complete at least one scan and have a SARIF results file. See [Run agentic code scans](run-ai-code-security-scans.md).

## Apply fixes

To fix findings, run the following command with your SARIF results file:

```bash
defender fix ./defender-aiscan-<JOB_ID>.sarif
```

To fix findings at all severity levels, specify a severity threshold. Findings at or above the severity threshold are included.

```bash
defender fix ./results.sarif --severity low
```

## Related content

- [Run agentic code scans](run-ai-code-security-scans.md)
- [Understand scan results](understanding-mdash-results.md)
- [Set up the Defender CLI](defender-cli.md)
