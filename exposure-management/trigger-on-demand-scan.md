---
title: Trigger an on-demand agentic scan
description: Trigger a remote on-demand agentic code scan for a GitHub repository that you've onboarded through the GitHub connector in Microsoft Defender.
ms.topic: how-to
ms.date: 07/06/2026
ai-usage: ai-assisted
---

# Trigger an on-demand agentic scan (preview)

After activating the GitHub connector, the ability to trigger an on-demand agentic scan for onboarded repositories becomes available within up to one hour.

## Prerequisites

- A GitHub connector created and activated. See [Create a GitHub connector](create-github-connector.md).

## Step 1: Open Manage scans

1. In the Microsoft Defender portal, go to **Exposure management** > **Initiatives**.
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

The repository size and tokens consumed signals can help your security team predict the impact of a scan before running it.

## Step 3: Select a repository and run a scan

1. Select the repository you want to scan.
1. Select **Start scan**.
1. Confirm in the dialog that appears.

A notification appears confirming the scan was started. The new scan appears in the **Scans** tab and progresses through its lifecycle.

## Related content

- [Create a GitHub connector](create-github-connector.md)
- [Codename MDASH - Agentic code scanner initiative](mdash-initiative.md)
- [Review agentic code scan results in the Microsoft Defender portal](review-portal-results.md)
