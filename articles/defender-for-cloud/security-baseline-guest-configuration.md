---
title: Set up Azure Policy guest configuration on machines protected by Microsoft Defender for Cloud
description: Learn how to install the guest configuration on machines protected by Microsoft Defender for Cloud to assess OS misconfigurations. 
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 07/31/2023
---

# Install the Azure machine configuration extension

Defender for Cloud assesses operating system configuration against the [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) compute security baselines in the [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction).

The information needed for assessment is collected by the Azure machine configuration extension (formerly known as the Azure Policy guest configuration).

This article describes how to deploy the extension.

## Prerequisites

**Requirement** | **Details**
--- | ---
**Plan** | To receive operating system recommendations based on MCSB compute security baselines, [Defender for Servers Plan 2](defender-for-servers-overview.md) must be enabled.
**Machine support** |  Review supported Azure VMs and Azure Arc VMs running  [Windows](support-matrix-defender-for-servers.md#windows-machine-support) and [Linux](support-matrix-defender-for-servers.md#linux-machine-support).
**Extension requirements** |  Review [extension deployment requirements](/azure/governance/machine-configuration/overview#enable-machine-configuration) for Azure VMs.
**Permissions** | To view the recommendations and explore the OS baseline data, you need Read permission on the relevant Azure subscription.

> [!NOTE]
> Collection with the machine configuration extension replaces the older method of data collection that used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)). Use of the MMA will be supported until November 2024.

## Install on AWS/GCP

For AWS/GCP machines, the machine configuration is installed by default when you select Arc provisioning in the [AWS](quickstart-onboard-aws.md) or [GCP](quickstart-onboard-gcp.md) connector.

## Install on on-premises machines

For on-premises machines, the machine configuration is enabled by default when you [onboard on-premises VMs as Azure Arc-enabled VMs](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).

## Install on an Azure machines

With Defender for Servers Plan 2 enabled, you can install the machine configuration extension on machines using a Defender for Cloud recommendation.

1. Search for the appropriate recommendations.

    - **Azure machines**: Search for the recommendation [Guest Configuration extension should be installed on machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/6c99f570-2ce7-46bc-8175-cde013df43bc).
    - **Azure VMs**: On Azure VMs only, you must assign a managed identity to the machine. To do this, search for the recommendation [virtual machines Guest Configuration extension should be deployed with system-assigned managed identity](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/69133b6b-695a-43eb-a763-221e19556755)
1. Remediate the recommendations as needed.

### Autoprovision the guest configuration extension

For Azure VMs, you can autoprovision installation of guest configuration extension on Azure VMs across the entire subscription.

1. In Defender for Cloud, open **Environment settings** > **Your subscription** > **Settings & Monitoring**.
1. Under **Settings**, select **Guest Configuration**.

    :::image type="content" source="media/prepare-deprecation-log-analytics-mma-agent/setting-and-monitoring.png" alt-text="Screenshot that shows the location of the settings and monitoring button." lightbox="media/prepare-deprecation-log-analytics-mma-agent/setting-and-monitoring.png":::

1. Toggle the Guest Configuration agent (preview) to **On**.

    :::image type="content" source="media/prepare-deprecation-log-analytics-mma-agent/toggle-guest.png" alt-text="Screenshot that shows the location of the toggle button to enable the Guest Configuration agent." lightbox="media/prepare-deprecation-log-analytics-mma-agent/toggle-guest.png":::

1. Select **Continue**.

With the machine configuration extension enabled on machine, the machine can then be assessed against [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) operating systems baselines.

## Next step

[Review](apply-security-baseline.md) OS misconfiguration recommendations.
