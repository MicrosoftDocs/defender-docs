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

# Diagnose Defender for Endpoint issues with Client Analyzer

When you troubleshoot Microsoft Defender for Endpoint, collecting diagnostic data is crucial for problem resolution. Different issues such as performance, connectivity and detection-related concerns, require different telemetry. As security expert investigating these issues, you can use the MDE Client Analyzer tool to troubleshoot your organization's Defender for Endpoint issues.

This article lists different types of issues and how to collect data for them using the Client Analyzer tool.

## Categorize your issue

Use the categories listed below to identify the type of issue you are experiencing. Run the Client Analyzer tool with the appropriate flags when collecting data.

### Issues that can't be reproduced

Non reproducible issues issues are issues that occur sporadically or are triggered by automated processes and cannot be reproduced. This includes problems related to scheduled tasks such as automatic updates and scans, and attack surface reduction (ARS) rules triggered unpredictably.

To collect data for non reproducible issues, [run Client Analyzer](#run-the-client-analyzer-tool) without any arguments. When no arguments are passed, the tool collects general system and Defender information for analyzing intermittent or scheduled task-related issues.

### Issues that can be reproduced

Issues that can be reproduced, are problems that can be consistently reproduced when requested, allowing for targeted data collection when the issue occurs.

* **Performance issues** - For example, high CPU usage, memory consumption problems, and slow response times.

* **General issues** - For example, problems with on-demand scans, manual updates, sense portal and alert issues, ASR issues that can be triggered on command, and app compatibility problems.

To collect data for issues that can be reproduced, [run Client Analyzer](#run-the-client-analyzer-tool) with the `-a` and `-v` [flags](#client-analyzer-flags).

### Performance issues that cannot be reproduced

Performance problems that cannot be reproduced include gradual performance degradation over extended periods, such as slow system performance that develops over time, intermittent high resource usage, and unpredictable performance issues that don't have clear triggers.

### System hang issues

System hang issues include unresponsive systems and freezes. These issues may require advanced debugging techniques including memory dumps and crash analysis.

To prepare a machine for a full memory dump run the command below. This command requires a system reboot.

```powershell

MDEClientAnalyzer.cmd -z

```

### Compatibility issues

To Compatibility issues with other applications or security solutions


## Run the Client Analyzer tool

Follow the steps in this section to collect data for the issues you've identified. Use the appropriate flags when needed. If you have scenarios the involve both working and non-working conditions, collect separate log packages for each scenario and clearly label each collection. The comparison helps identify the differences that cause the performance issue.

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

When running the Client Analyzer tool, select the appropriate flags based on the issue you are troubleshooting. The following table lists the flags available for the Client Analyzer tool:

| Flag | Description |
|------|-------------|
| `-a` | Enable all available data collection options. |
| `-v` | Enable verbose logging for more detailed output. |
| `-z` | Prepare the machine for a full memory dump. |
