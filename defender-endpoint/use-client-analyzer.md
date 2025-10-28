---
title: Diagnose Defender for Endpoint issues with Client Analyzer
ms.topic: conceptual
description: Understand how to Diagnose Defender for Endpoint issues with Client Analyzer so that you can send the right data to Microsoft support for troubleshooting.
ms.service: defender-endpoint
author: KesemSharabi
ms.author: kesharab
audience: ITPro
ms.collection: 
- m365-security
- tier1
- mde-ngp
ms.subservice: ngp
search.appverid: met150
ms.date: 10/28/2025
---

# Diagnose issues with Client Analyzer

When you troubleshoot Microsoft Defender for Endpoint, collecting diagnostic data is crucial for problem resolution. Different issues such as performance, connectivity and detection-related concerns, require different telemetry. As security expert investigating these issues, you can use the [Client Analyzer](overview-client-analyzer.md) tool to troubleshoot your organization's Defender for Endpoint issues.

This article lists different types of issues and how to collect data for them using the Client Analyzer tool.

## Categorize your issue

Use the categories listed in the table to identify the type of issue you're experiencing. [Run the Client Analyzer tool](#run-the-client-analyzer-tool) with the appropriate flags when collecting data.

|Issue  |Description and examples  |Flags  |
|---------|---------|---------|
|Issues that can't be reproduced     |Issues that occur sporadically or are triggered by automated processes and can't be reproduced. This includes problems related to scheduled tasks such as automatic updates and scans, and Attack Surface Reduction (ARS) rules triggered unpredictably.         | Run without flags         |
|Performance issues that can be reproduced     |High CPU usage, memory consumption problems, and slow response times.         |`-a` and `-v`         |
|Performance issues that can't be reproduced     |High CPU usage, memory consumption problems, and slow response times.         |Run without flags         |
|General     |On-demand scans, manual updates, sense portal and alert issues, Azure Site Recovery (ASR) issues that can be triggered on command, and app compatibility problems.         |`-e` and `-v`         |
|Hanging systems     |Unresponsive systems and freezes. Require advanced debugging techniques including memory dumps and crash analysis.         |`-z`         |
|Compatibility     |Issues with third-party applications, other security solutions, system software, performance problems, and functional issues.         |`-c`, `-e` and `-v`         |
|Controlled Folder Access (CFA)    |Include blocked applications, unexpected access permissions, and issues related to protected folders configuration.         |Reproducible: `-cfa`, `-e` and `-v`</br>Nonreproducible: `-cfa`         |
|Data Loss Prevention (DLP)     |Include policy enforcement problems, content detection false positives and negatives, and DLP client health and connectivity issues.         |Reproducible: `-e`, `-t` and `-v`</br>Nonreproducible: `-t`          |
|Indicator     |Include problems with URLs, domains, IP addresses, files, and certificates that aren't enforced as expected.         |URL, IP, domain in first-party browser: `-a`, `-i` and `-v`</br>File indicator: `-v`          |
|Web Content Filtering (WCF)    |Unenforced WCF policy when accessing web content using first and third party browsers.         |`-a`, `-i` and `-v`         |
|Network protection     |Network protection doesn't trigger configured policies when URLs, domains, and IPs are accessed through third-party browsers.        |`-i` and `-v`         |
|Device control |Issues related to device control and blocking USB devices.  | `-v` with a five-minute limit. Then reproduce with a USB that's working as expected. |

## Run the Client Analyzer tool

Follow the steps in this section to collect data for the issues you've identified. Use the appropriate flags when needed. If you have scenarios that involve both working and nonworking conditions, collect separate log packages for each scenario and clearly label each collection. The comparison helps identify the differences that cause the performance issue.

1. Start log collection running:

    ```powershell
    
    MDEClientAnalyzer.cmd
    
    ```

2. When prompted for the number of minutes to collect logs, to ensure sufficient collection time enter a large number such as 1,000.

3. Once the log collection starts, reproduce the performance issue so that the issue's data is captured while the logs are being collected.

4. Use one of these methods to stop the log collection process:

    * Allow the process to finish automatically based on the time specified.

    * Press `q` to manually stop the collection.

### Client Analyzer flags

When running the Client Analyzer tool, select the appropriate flags based on the issue you're troubleshooting. The following table lists the flags available for the Client Analyzer tool:

| Flag   | Description |
|--------|-------------|
| `-a`   | Captures performance diagnostics using Windows Performance Recorder (WPR). Useful for analyzing CPU, memory, and input and output (I/O) bottlenecks.  |
| `-c`   | Enables verbose logging.  |
| `-cfa` |  |
| `-e`   |  |
| `-i`   | Collects network traces.  |
| `-t`   |  |
| `-v`   | Collects telemetry across Defender components.   |
| `-z`   |  |
