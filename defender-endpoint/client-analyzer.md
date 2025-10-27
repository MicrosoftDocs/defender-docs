---
title: Defender for Endpoint with Defender Antivirus in passive mode
ms.topic: conceptual
description: Understand how Defender Antivirus in passive mode works and when to use it.
ms.service: defender-endpoint
author: KesemSharabi
ms.author: kesharab
ms.localizationpriority: high
audience: ITPro
ms.collection: 
- m365-security
- tier1
- mde-ngp
ms.subservice: ngp
search.appverid: met150
ms.date: 03/26/2025
---

# Diagnose Defender for Endpoint issues with Client Analyzer

When you troubleshoot Microsoft Defender for Endpoint, collecting diagnostic data is crucial for problem resolution. Different issues such as performance, connectivity and detection-related concerns, require different telemetry. As security expert investigating these issues, you can use the MDE Client Analyzer tool to troubleshoot your organization's Defender for Endpoint issues.

This article lists different types of issues and how to collect data for them using the Client Analyzer tool.

## Categorize your issue

AAA

### Non reproducible issues

Non reproducible issues issues are issues that occur sporadically or are triggered by automated processes and cannot be reproduced. This includes problems related to scheduled tasks such as automatic updates and scans, and attack surface reduction (ARS) rules triggered unpredictably.

To collect data for non reproducible issues, run Client Analyzer without any arguments. When no arguments are passed, the tool collects general system and Defender information for analyzing intermittent or scheduled task-related issues.

```powershell

MDEClientAnalyzer.cmd 

```

### Issues that can be reproduced

Issues that can be reproduced, are problems that can be consistently reproduced when requested, allowing for targeted data collection when the issue occurs.

* **Performance issues** - For example, high CPU usage, memory consumption problems, and slow response times.

* **General issues** - For example, problems with on-demand scans, manual updates, sense portal and alert issues, ASR issues that can be triggered on command, and app compatibility problems.

Follow the steps in this section to collect data for issues that can be reproduced. If you have scenarios the involve both working and non-working conditions, collect separate log packages for each scenario and clearly label each collection. The comparison helps identify the differences that cause the performance issue.

1. Start log collection with performance and verbose tracing by running:

    ```powershell
    
    MDEClientAnalyzer.cmd -a -v 
    
    ```

2. When prompted for the number of minutes to collect logs, to ensure sufficient collection time enter a large number such as 1,000.

3. Once the log collection starts, reproduce the performance issue so that the issue's data is captured while the logs are being collected.

4. Use one of these methods to stop the log collection process:

    * Allow the process to finish automatically based on the time specified.

    * Press `q` to manually stop the collection.

### Performance issues that cannot be reproduced

Performance problems that cannot be reproduced include gradual performance degradation over extended periods, such as slow system performance that develops over time, intermittent high resource usage, and unpredictable performance issues that don't have clear triggers.

### Compatibility issues


## Flag list

options that should be selected based on the specific type of issue being investigated. Using the appropriate flags ensures that the diagnostic package contains sufficient relevant data for Microsoft support engineers to analyze and resolve the problem efficiently.  By following these best practices and selecting the right collection parameters, you can significantly improve the quality of diagnostic data and reduce the time needed for issue resolution. 