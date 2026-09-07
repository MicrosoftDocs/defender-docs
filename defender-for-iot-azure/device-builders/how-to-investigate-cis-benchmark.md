---
title: Investigate CIS benchmark recommendation
description: Investigate CIS benchmark recommendation results in Microsoft Defender for IoT using basic portal analysis and advanced Log Analytics queries for OS baseline findings.
ms.date: 07/03/2026
ms.topic: how-to
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016
ai-usage: ai-assisted
---

# Investigate OS baseline (based on CIS benchmark) recommendation

Microsoft Defender for IoT evaluates OS configurations against CIS benchmarks and raises recommendations when a device doesn't meet baseline security checks. This article walks you through two investigation approaches: a basic investigation using the Defender for IoT portal, and an advanced investigation that uses Azure Log Analytics to query OS baseline test results, identify failed checks, and pinpoint affected devices across your fleet. The advanced investigation requires a Log Analytics workspace connected to Defender for IoT. For details, see [Prerequisites for advanced OS baseline investigation](#advanced-os-baseline-security-recommendation-investigation).

## Basic OS baseline security recommendation investigation

You can investigate OS baseline recommendations by navigating to [Defender for IoT in the Azure portal](https://portal.azure.com/#blade/Microsoft_Azure_IoT_Defender/IoTDefenderDashboard/Getting_Started). For more information, see how to [Investigate security recommendations](quickstart-investigate-security-recommendations.md).

## Advanced OS baseline security recommendation investigation

The advanced investigation workflow helps you understand OS baseline test results and query related events in Azure Log Analytics.

**Prerequisites**:

The advanced OS baseline security recommendation investigation is only supported by using Azure Log Analytics and you must connect Defender for IoT to a Log Analytics workspace before continuing.

For more information, see [Configure Microsoft Defender for IoT agent-based solution](tutorial-configure-agent-based-solution.md).

**To query your IoT security events in Log Analytics for alerts**:

1. In your Log Analytics workspace, go to **Logs** > **AzureSecurityOfThings** > **SecurityAlert**.

1. In the query editor on the right, enter a KQL query to display the alerts you want to see. 

1. Select **Run** to display the alerts that match your query.

For example:

:::image type="content" source="media/how-to-investigate-cis-benchmark/log-analytics.png" alt-text="Screenshot of the Log Analytics workspace with a Defender for I o T alert query." lightbox="media/how-to-investigate-cis-benchmark/log-analytics.png":::

> [!NOTE]
> In addition to alerts, you can also use this same procedure to query for recommendations or raw event data.
>

## Useful queries to investigate the OS baseline resources

Use the following Kusto queries in your Log Analytics workspace to retrieve the latest OS baseline check results for your devices.

> [!Note]
> Make sure to replace `<device-id>` with the name(s) you gave your device in each of the following queries.

### Retrieve the latest information

- **Device fleet failure**: Run this query to retrieve the latest information about checks that failed across the device fleet:

    ```kusto
    let lastDates = SecurityIoTRawEvent |
    where RawEventName == "Baseline" |
    summarize TimeStamp=max(TimeStamp) by DeviceId;
    lastDates | join kind=inner (SecurityIoTRawEvent) on TimeStamp, DeviceId |
    extend event = parse_json(EventDetails) |
    where event.BaselineCheckResult == "FAIL" |
    project DeviceId, event.BaselineCheckId, event.BaselineCheckDescription
    ```

- **Specific device failure** - Run this query to retrieve the latest information about checks that failed on a specific device:  

    ```kusto
    let id = SecurityIoTRawEvent | 
    extend IoTRawEventId = extractjson("$.EventId", EventDetails, typeof(string)) |
    where TimeGenerated <= now() |
    where RawEventName == "Baseline" |
    where DeviceId == "<device-id>" |
    summarize arg_max(TimeGenerated, IoTRawEventId) |
    project IoTRawEventId;
    SecurityIoTRawEvent |
    extend IoTRawEventId = extractjson("$.EventId", EventDetails, typeof(string)), extraDetails = todynamic(EventDetails) |
    where IoTRawEventId == toscalar(id) |
    where extraDetails.BaselineCheckResult == "FAIL" |
    project DeviceId, CceId = extraDetails.BaselineCheckId, Description = extraDetails.BaselineCheckDescription
    ```

- **Specific device error** - Run this query to retrieve the latest information about checks that have an error on a specific device:

    ```kusto
    let id = SecurityIoTRawEvent |
    extend IoTRawEventId = extractjson("$.EventId", EventDetails, typeof(string)) |
    where TimeGenerated <= now() |
    where RawEventName == "Baseline" |
    where DeviceId == "<device-id>" |
    summarize arg_max(TimeGenerated, IoTRawEventId) |
    project IoTRawEventId;
    SecurityIoTRawEvent |
    extend IoTRawEventId = extractjson("$.EventId", EventDetails, typeof(string)), extraDetails = todynamic(EventDetails) |
    where IoTRawEventId == toscalar(id) |
    where extraDetails.BaselineCheckResult == "ERROR" |
    project DeviceId, CceId = extraDetails.BaselineCheckId, Description = extraDetails.BaselineCheckDescription
    ```

- **Update device list for device fleet that failed a specific check** - Run this query to retrieve updated list of devices (across the device fleet) that failed a specific check:  

    ```kusto
    let lastDates = SecurityIoTRawEvent |
    where RawEventName == "Baseline" |
    summarize TimeStamp=max(TimeStamp) by DeviceId;
    lastDates | join kind=inner (SecurityIoTRawEvent) on TimeStamp, DeviceId |
    extend event = parse_json(EventDetails) |
    where event.BaselineCheckResult == "FAIL" |
    where event.BaselineCheckId contains "6.2.8" |
    project DeviceId;
    ```

## Related content

- [Investigate security recommendations](quickstart-investigate-security-recommendations.md)
