---
# required metadata

title: Troubleshooting Advanced Threat Analytics with performance counters
description: Describes how you can use performance counters to troubleshoot issues with ATA
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: df162a62-f273-4465-9887-94271f5000d2

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: bennyl
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Troubleshooting ATA using the performance counters

[!INCLUDE [Banner for top of topics](includes/banner.md)]

The ATA performance counters provide insight into how well each component of ATA is performing. The components in ATA process data sequentially, so that when there's a problem, it might cause partial dropped traffic somewhere along the chain of components. In order to fix the problem, you have to figure out which component is backfiring and fix the problem at the beginning of the chain. Use the data found in the performance counters to understand how each component is functioning.
    Refer to [ATA architecture](ata-architecture.md) to understand the flow of internal ATA components.

**ATA component process**:

1. When a component reaches its maximum size, it blocks the previous component from sending more entities to it.

1. Then, eventually the previous component will start to increase **its** own size until it blocks the component before it, from sending more entities.

1. This happens all the way back to the NetworkListener component, which will drop traffic when it can no longer forward entities.


## Retrieving performance monitor files for troubleshooting

To retrieve the performance monitor files (BLG) from the various ATA components:
1. Open perfmon.
1. Stop the data collector set named: **Microsoft ATA Gateway** or **Microsoft ATA Center**.
1. Go to the data collector set folder (by default, this is "C:\Program Files\Microsoft Advanced Threat Analytics\Gateway\Logs\DataCollectorSets" or “C:\Program Files\Microsoft Advanced Threat Analytics\Center\Logs\DataCollectorSets”).
1. Copy the BLG file that was most recently modified.
1. Restart the data collector set named: **Microsoft ATA Gateway** or **Microsoft ATA Center**.


## ATA Gateway performance counters

In this section, every reference to ATA Gateway refers also to the ATA Lightweight Gateway.

You can observe the real-time performance status of the ATA Gateway by adding the ATA Gateway's performance counters.
This is done by opening **Performance Monitor** and adding all counters for the ATA Gateway. The name of the performance counter object is: **Microsoft ATA Gateway**.

Here is the list of the main ATA Gateway counters to pay attention to:

> [!div class="mx-tableFixed"]
> 
> |Counter|Description|Threshold|Troubleshooting|
> |-----------|---------------|-------------|-------------------|
> |Microsoft ATA Gateway\NetworkListener PEF Parsed Messages\Sec|The amount of traffic being processed by the ATA Gateway every second.|No threshold|Helps you understand the amount of traffic that is being parsed by the ATA Gateway.|
> |NetworkListener PEF Dropped Events\Sec|The amount of traffic being dropped by the ATA Gateway every second.|This number should be zero all of the time (rare short burst of drops are acceptable).|Check if there is any component that reached its maximum size and is blocking previous components all the way to the NetworkListener. Refer to the **ATA Component Process** above.<br /><br />Check that there is no issue with the CPU or memory.|
> |Microsoft ATA Gateway\NetworkListener ETW Dropped Events\Sec|The amount of traffic being dropped by the ATA Gateway every second.|This number should be zero all of the time (rare short burst of drops are acceptable).|Check if there is any component that reached its maximum size  and is blocking previous components all the way to the NetworkListener. Refer to the **ATA Component Process** above.<br /><br />Check that there is no issue with the CPU or memory.|
> |Microsoft ATA Gateway\NetworkActivityTranslator Message Data # Block Size|The amount of traffic queued for translation to Network Activities (NAs).|Should be less than the maximum-1 (default maximum: 100,000)|Check if there is any component that reached its maximum size  and is blocking previous components all the way to the NetworkListener. Refer to the **ATA Component Process** above.<br /><br />Check that there is no issue with the CPU or memory.|
> |Microsoft ATA Gateway\EntityResolver Activity Block Size|The number of Network Activities (NAs) queued for resolution.|Should be less than the maximum-1 (default maximum: 10,000)|Check if there is any component that reached its maximum size  and is blocking previous components all the way to the NetworkListener. Refer to the **ATA Component Process** above.<br /><br />Check that there is no issue with the CPU or memory.|
> |Microsoft ATA Gateway\EntitySender Entity Batch Block Size|The amount of Network Activities (NAs) queued to be sent to the ATA Center.|Should be less than the maximum-1 (default maximum: 1,000,000)|Check if there is any component that reached its maximum size  and is blocking previous components all the way to the NetworkListener. Refer to the **ATA Component Process** above.<br /><br />Check that there is no issue with the CPU or memory.|
> |Microsoft ATA Gateway\EntitySender Batch Send Time|The amount of time it took to send the last batch.|Should be less than 1000 milliseconds most of the time|Check if there are any networking issues between the ATA Gateway and the ATA Center.|
> 
> [!NOTE]
> - Timed counters are in milliseconds.
> - It is sometimes more convenient to monitor the full list of the counters by using the **Report** graph type (example: real-time monitoring of all the counters)

## ATA Lightweight Gateway performance counters
The performance counters can be used for quota management in the Lightweight Gateway, to make sure that ATA doesn't drain too many resources from the domain controllers on which it is installed.
To measure the resource limitations that ATA enforces on the Lightweight Gateway, add these counters.

This is done by opening **Performance Monitor** and adding all counters for the ATA Lightweight Gateway. The names of the performance counter objects are: **Microsoft ATA Gateway** and **Microsoft ATA Gateway Updater**.

> [!div class="mx-tableFixed"]
> 
> |Counter|Description|Threshold|Troubleshooting|
> |-----------|---------------|-------------|-------------------|
> |Microsoft ATA Gateway Updater\GatewayUpdaterResourceManager CPU Time Max %|The maximum amount of CPU time (in percentage) that the Lightweight Gateway process can consume. |No threshold. | This is the limitation that protects the domain controller resources from being used up by the ATA Lightweight Gateway. If you see that the process reaches the maximum limit often over a period of time (the process reaches the limit and then starts to drop traffic) it means that you need to add more resources to the server running the domain controller..|
> |Microsoft ATA Gateway Updater\GatewayUpdaterResourceManager Commit Memory Max Size|The maximum amount of committed memory (in bytes) that the Lightweight Gateway process can consume.|No threshold. | This is the limitation that protects the domain controller resources from being used up by the ATA Lightweight Gateway. If you see that the process reaches the maximum limit often over a period of time (the process reaches the limit and then starts to drop traffic) it means that you need to add more resources to the server running the domain controller.| 
> |Microsoft ATA Gateway Updater\GatewayUpdaterResourceManager Working Set Limit Size|The Maximum amount of physical memory (in bytes) that the Lightweight Gateway process can consume.|No threshold. | This is the limitation that protects the domain controller resources from being used up by the ATA Lightweight Gateway. If you see that the process reaches the maximum limit often over a period of time (the process reaches the limit and then starts to drop traffic) it means that you need to add more resources to the server running the domain controller.|



In order to see your actual consumption, refer to the following counters:


> [!div class="mx-tableFixed"]
> 
> |Counter|Description|Threshold|Troubleshooting|
> |-----------|---------------|-------------|-------------------|
> |Process(Microsoft.Tri.Gateway)\%Processor Time|The amount of CPU time (in percentage) that the Lightweight Gateway process is actually consuming. |No threshold. | Compare the results of this counter to the limit found in GatewayUpdaterResourceManager CPU Time Max %. If you see that the process reaches the maximum limit often over a period of time (the process reaches the limit and then starts to drop traffic) it means that you need to dedicate more resources to the Lightweight Gateway.|
> |Process(Microsoft.Tri.Gateway)\Private Bytes|The amount of committed memory (in bytes) that the Lightweight Gateway process is actually consuming.|No threshold. | Compare the results of this counter to the limit found in GatewayUpdaterResourceManager Commit Memory Max Size. If you see that the process reaches the maximum limit often over a period of time (the process reaches the limit and then starts to drop traffic) it means that you need to dedicate more resources to the Lightweight Gateway.| 
> |Process(Microsoft.Tri.Gateway)\Working Set|The amount of physical memory (in bytes) that the Lightweight Gateway process is actually consuming.|No threshold. |Compare the results of this counter to the limit found in GatewayUpdaterResourceManager Working Set Limit Size. If you see that the process reaches the maximum limit often over a period of time (the process reaches the limit and then starts to drop traffic) it means that you need to dedicate more resources to the Lightweight Gateway.|

## ATA Center performance counters
You can observe the real-time performance status of the ATA Center by adding the ATA Center's performance counters.

This is done by opening **Performance Monitor** and adding all counters for the ATA Center. The name of the performance counter object is: **Microsoft ATA Center**.

Here is the list of the main ATA Center counters to pay attention to:

> [!div class="mx-tableFixed"]
> 
> |Counter|Description|Threshold|Troubleshooting|
> |-----------|---------------|-------------|-------------------|
> |Microsoft ATA Center\EntityReceiver Entity Batch Block Size|The number of entity batches queued by the ATA Center.|Should be less than the maximum-1 (default maximum: 10,000)|Check if there is any component that reached its maximum size  and is blocking previous components all the way to the NetworkListener.  Refer to the preceding **ATA Component Process**.<br /><br />Check that there is no issue with the CPU or memory.|
> |Microsoft ATA Center\NetworkActivityProcessor Network Activity Block Size|The number of Network Activities (NAs) queued for processing.|Should be less than the maximum-1 (default maximum: 50,000)|Check if there is any component that reached its maximum size  and is blocking previous components all the way to the NetworkListener. Refer to the preceding **ATA Component Process**.<br /><br />Check that there is no issue with the CPU or memory.|
> |Microsoft ATA Center\EntityProfiler Network Activity Block Size|The number of Network Activities (NAs) queued for profiling.|Should be less than the maximum-1 (default maximum: 100,000)|Check if there is any component that reached its maximum size  and is blocking previous components all the way to the NetworkListener. Refer to the preceding **ATA Component Process**.<br /><br />Check that there is no issue with the CPU or memory.|
> |Microsoft ATA Center\Database &#42; Block Size|The number of Network Activities, of a specific type, queued to be written to the database.|Should be less than the maximum-1 (default maximum: 50,000)|Check if there is any component that reached its maximum size  and is blocking previous components all the way to the NetworkListener. Refer to the preceding **ATA Component Process**.<br /><br />Check that there is no issue with the CPU or memory.|
> 
> 
> [!NOTE]
> - Timed counters are in milliseconds
> - It is sometimes more convenient to monitor the full list of the counters using the graph type for Report (example: real-time monitoring of all the counters).

## Operating system counters
The following table lists the main operating system counters to pay attention to:

> [!div class="mx-tableFixed"]
> 
> |Counter|Description|Threshold|Troubleshooting|
> |-----------|---------------|-------------|-------------------|
> |Processor(_Total)\% Processor Time|The percentage of elapsed time that the processor spends to execute a non-Idle thread.|Less than 80% on average|Check if there is a specific process that is taking a lot more processor time than it should.<br /><br />Add more processors.<br /><br />Reduce the amount of traffic per server.<br /><br />The "Processor(_Total)\% Processor Time" counter may be less accurate on virtual servers, in which case the more accurate way to measure the lack of processor power is through the "System\Processor Queue Length" counter.|
> |System\Context Switches\sec|The combined rate at which all processors are switched from one thread to another.|Less than 5000&#42;cores (physical cores)|Check if there is a specific process that is taking a lot more processor time than it should.<br /><br />Add more processors.<br /><br />Reduce the amount of traffic per server.<br /><br />The "Processor(_Total)\% Processor Time" counter may be less accurate on virtual servers, in which case the more accurate way to measure the lack of processor power is through the "System\Processor Queue Length" counter.|
> |System\Processor Queue Length|The number of threads that are ready to execute and are waiting to be scheduled.|Less than five&#42;cores (physical cores)|Check if there is a specific process that is taking a lot more processor time than it should.<br /><br />Add more processors.<br /><br />Reduce the amount of traffic per server.<br /><br />The "Processor(_Total)\% Processor Time" counter may be less accurate on virtual servers, in which case the more accurate way to measure the lack of processor power is through the "System\Processor Queue Length" counter.|
> |Memory\Available MBytes|The amount of physical memory (RAM) available for allocation.|Should be more than 512|Check if there is a specific process that is taking a lot more physical memory than it should.<br /><br />Increase the amount of physical memory.<br /><br />Reduce the amount of traffic per server.|
> |LogicalDisk(&#42;)\Avg. Disk sec\Read|The average latency for reading data from the disk (you should choose the database drive as the instance).|Should be less than 10 milliseconds|Check if there is a specific process that is utilizing the database drive more than it should.<br /><br />Consult with your storage team/vendor if this drive can deliver the current workload while having less than 10 ms of latency. The current workload can be determined by using the disk utilization counters.|
> |LogicalDisk(&#42;)\Avg. Disk sec\Write|The average latency for writing data to the disk (you should choose the database drive as the instance).|Should be less than 10 milliseconds|Check if there is a specific process that is utilizing the database drive more than it should.<br /><br />Consult with your storage team\vendor if this drive can deliver the current workload while having less than 10 ms of latency. The current workload can be determined by using the disk utilization counters.|
> |\LogicalDisk(&#42;)\Disk Reads\sec|The rate of performing read operations to the disk.|No threshold|Disk utilization counters can add insight when troubleshooting storage latency.|
> |\LogicalDisk(&#42;)\Disk Read Bytes\sec|The number of bytes per second that are being read from the disk.|No threshold|Disk utilization counters can add insight when troubleshooting storage latency.|
> |\LogicalDisk&#42;\Disk Writes\sec|The rate of performing write operations to the disk.|No threshold|Disk utilization counters (can add insights when troubleshooting the storage latency)|
> |\LogicalDisk(&#42;)\Disk Write Bytes\sec|The number of bytes per second that are being written to the disk.|No threshold|Disk utilization counters can add insight when troubleshooting storage latency.|

## See Also
- [ATA prerequisites](ata-prerequisites.md)
- [ATA capacity planning](ata-capacity-planning.md)
- [Configure event collection](configure-event-collection.md)
- [Configuring Windows event forwarding](configure-event-collection.md)
- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
