---
title: Overview for how to troubleshoot performance issues for Microsoft Defender for Endpoint on macOS
description: Troubleshoot performance issues overview for Microsoft Defender for Endpoint on macOS.
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.service: defender-endpoint
ms.topic: overview
ms.localizationpriority: medium
ms.date: 08/11/2026
ms.subservice: macos
ms.custom: partner-contribution, msecd-doc-authoring-1015
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

ai-usage: ai-assisted
---
# Overview for how to troubleshoot performance issues for Microsoft Defender for Endpoint on macOS


This article provides general guidelines to identify performance issues related to Microsoft Defender for Endpoint on macOS. See [Troubleshoot performance issues for Microsoft Defender for Endpoint on macOS](mac-support-perf.md) for more specific guidance. 

Depending on the applications that you're running and your device characteristics, you might experience suboptimal performance when running Microsoft Defender for Endpoint on macOS. In particular, applications or system processes that access many resources over a short timespan can lead to performance issues in Microsoft Defender for Endpoint on macOS.

> [!TIP]
> As a general best practice, it's recommended to [update the Microsoft Defender for Endpoint agent to latest available version](mac-whatsnew.md) and confirming that the issue still persists before investigating further.

> [!CAUTION]
> Running other non-Microsoft endpoint protection products alongside Microsoft Defender for Endpoint on macOS is likely to lead to performance problems and unpredictable side effects. If non-Microsoft endpoint protection is an absolute requirement in your environment, you can configure Microsoft Defender Antivirus to run in **[Passive mode](mac-preferences.md)**. After you configure Passive mode, you can use Defender for Endpoint on macOS EDR functionality.

> [!WARNING]
> Before starting, identify which security product provides active antivirus protection and confirm the intended Defender enforcement mode. Avoid running overlapping active protection capabilities because they can conflict and affect system performance. For more information, see [Microsoft Defender for Endpoint alongside other security solutions](mde-side-by-side.md).

> [!TIP]
> If you're running other non-Microsoft security products, review the vendor-specific coexistence guidance. Mutual exclusions can help address a confirmed interoperability issue, but they reduce protection. Exclude only trusted processes and paths, and validate that the exclusions provide a measurable improvement.

When troubleshooting performance issues for Microsoft Defender for Endpoint on macOS, review **Activity Monitor** or run `top` to identify which Defender process has high CPU or memory usage. Collect the data while the performance issue is occurring.

|Daemon name|Component|First troubleshooting step|
|---|---|---|
|`wdavdaemon`|Core (privileged)|Collect Client Analyzer performance data and hot event sources.|
|`wdavdaemon_unprivileged`|Antivirus and endpoint protection platform (EPP)|Use real-time protection statistics to identify files and processes that trigger scans.|
|`wdavdaemon_enterprise`|Endpoint detection and response (EDR)|Collect Client Analyzer performance data and hot event sources.|

For all three processes, record the process name, CPU and memory use, duration, device model and processor, Defender version, macOS version, enforcement mode, workload, and other security products. Gather [Microsoft Defender for Endpoint Client Analyzer](overview-client-analyzer.md) files while the issue occurs.

> [!IMPORTANT]
> File, folder, and file extension exclusions affect antivirus scanning. Process exclusions also prevent Network Protection from inspecting traffic or enforcing rules for the excluded process. These exclusions don't suppress EDR visibility or other Endpoint Security event processing. If an exclusion doesn't improve performance, don't broaden it without first identifying the affected component.
