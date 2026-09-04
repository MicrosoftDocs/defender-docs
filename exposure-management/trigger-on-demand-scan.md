---
title: Trigger an on-demand agentic scan
description: Trigger a remote on-demand agentic code scan for a GitHub repository that you've onboarded through the GitHub connector in Microsoft Defender.
ms.topic: how-to
ms.date: 07/06/2026
ai-usage: ai-assisted
---

# Trigger an on-demand agentic scan (private preview)

After activating the SCM connector, the ability to trigger an on-demand agentic code scan for onboarded repositories.

> [!IMPORTANT]
> Onboarded repositories become available within up to one hour.

## Prerequisites

- A SCM connector created and activated. See [Create a GitHub connector](create-github-connector.md) or [Create an Azure DevOps connector](create-azure-devops-connector.md)

## Step 1: Open Manage scans

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Exposure management** > **Initiatives**.
1. Open the **Codename MDASH - Agentic code scanner (preview)** initiative, and then select **Open initiative page**.
1. Select the **Manage scans** button (next to the **Settings** button).

## Step 2: View the list of repositories

The side panel lists every repository discovered through the SCM connectors activated in your tenant.

For each repository, you can see:

- Repository name
- Repository size
- Organization name
- SCM type
- Scan status — last scan
- Tokens consumed in the last scan

The repository size and tokens consumed signals can help your security team predict the impact of a rescan.

## Step 3: Select a repository and run a scan

1. Select the repository you want to scan.
1. Select **Start scan**.
1. In the confirmation dialog, choose the scan profile to use **for this scan only** — keep the default **GPT-General profile**, or select **MAI-Augmented profile (Preview)** — then select **Scan repo**. The selection applies to this scan only. A profile whose required models aren't deployed shows an inline error and can't be selected. For the models required by each profile, see [Deploy the required models](/security-exposure-management/mdash-foundry-integration).

*If your tenant already has 10 queued scans from the portal and the CLI combined, a warning appears. You can still submit the scan. Queued scans that don't start running within 72 hours of submission are automatically cleaned up, so some queued scans might not run.*

A notification appears confirming the scan was started. The new scan appears in the **Scans** tab and progresses through its lifecycle.

## Related content

- [Create a GitHub connector](create-github-connector.md)

- [Create an Azure DevOps connector](create-azure-devops-connector.md)

- [Codename MDASH - Agentic code scanner initiative](mdash-initiative.md)

- [Review agentic code scan results in the Microsoft Defender portal](review-portal-results.md)

