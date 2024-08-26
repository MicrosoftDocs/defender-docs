---
title: Review Docker host hardening recommendations
description: How to protect your Docker hosts and verify they're compliant with the CIS Docker benchmark with Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 06/29/2023
---
# Review Docker host hardening recommendations

The Defender for Servers plan in Microsoft Defender for Cloud identifies unmanaged containers hosted on IaaS Linux VMs, or other Linux machines running Docker containers. Defender for Servers continuously assesses the configuration of these Docker hosts, and compares them with the [Center for Internet Security (CIS) Docker Benchmark](https://www.cisecurity.org/benchmark/docker/).

- Defender for Cloud includes the entire ruleset of the CIS Docker Benchmark and alerts you if your containers don't satisfy any of the controls.
- When it finds misconfigurations, Defender for Servers generates security recommendations to address findings.- 
When vulnerabilities are found, they're grouped inside a single recommendation.

> [!NOTE]
> Docker host hardening uses the Log Analytics agent (also known as the Microsoft Monitoring agent (MMA) to collect host information for assessment. 
> The MMA is set to retire, and the Docket host hardening feature will be deprecated in November 2024.


## Prerequisites

- You need [Defender for Servers Plan 2](defender-for-servers-overview.md) to use this feature.
- These CIS benchmark checks will not run on AKS-managed instances or Databricks-managed VMs.
- You need *Reader** permissions on the workspace to which the host connects.


## Identify Docker configuration issues

1. From Defender for Cloud's menu, open the **Recommendations** page.

1. Filter to the recommendation **Vulnerabilities in container security configurations should be remediated** and select the recommendation.

    The recommendation page shows the affected resources (Docker hosts).

    :::image type="content" source="./media/monitor-container-security/docker-host-vulnerabilities-found.png" alt-text="Recommendation to remediate vulnerabilities in container security configurations.":::

    > [!NOTE]
    > Machines that aren't running Docker will be shown in the **Not applicable resources** tab. They'll appear in Azure Policy as Compliant.

1. To view and remediate the CIS controls that a specific host failed, select the host you want to investigate.

    > [!TIP]
    > If you started at the asset inventory page and reached this recommendation from there, select the **Take action** button on the recommendation page.
    >
    > :::image type="content" source="./media/monitor-container-security/host-security-take-action-button.png" alt-text="Take action button to launch Log Analytics.":::

    Log Analytics opens with a custom operation ready to run. The default custom query includes a list of all failed rules that were assessed, along with guidelines to help you resolve the issues.

    :::image type="content" source="./media/monitor-container-security/docker-host-vulnerabilities-in-query.png" alt-text="Log Analytics page with the query showing all failed CIS controls.":::

1. Tweak the query parameters if necessary.

1. When you're sure the command is appropriate and ready for your host, select **Run**.

## Next steps

Learn more about [container security in Defender for Cloud](defender-for-containers-introduction.md).
