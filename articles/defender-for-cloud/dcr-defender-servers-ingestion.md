---
title: Use a Custom Data Collection Rule for Defender for Servers ingestion
description: Learn how to use Data Collection Rules (DCRs) to customize how Defender for Servers security events are collected and ingested.
ms.topic: how-to
ms.author: elkrieger
author: elazark
ms.date: 12/15/2025
---

# Use a custom Data Collection Rule (DCR) for Defender for Servers ingestion

You can use a custom Data Collection Rule (DCR) to customize how security events are collected and sent to Log Analytics for Defender for Servers. 

With a custom DCR, you can:

- Filter high-volume security events
- Collect a specific subset of Windows Security events
- Apply transformations before ingestion
- Route data from non-standard ingestion sources

## Prerequisites

Before you create a custom DCR, make sure:

- Azure Monitor Agent (AMA) is installed on the machines that will send data to Log Analytics.

- A Log Analytics workspace exists in the same region as the DCR.

## Create a DCR

1. Sign into the [Azure portal](https://portal.azure.com).

1. Go to ▸ **Monitor** ▸ **Settings** ▸ **Data Collection Rules** ▸ **+ Create**.

1. On the **Basics** tab:

    - Enter a name and a subscription.

    - Choose or create a resource group.

    - Select the region. The region must match the region of the Log Analytics workspace(s) you’ll send to.

    - Under **Platform type**, select **Windows** to collect Windows Security events for the `SecurityEvent` ingestion benefit. *(Choose **Linux** or **All** if you also need those logs.)*

    - Under **Data Collection Endpoint**, leave **\<none\>** unless you're using a Data Collection Endpoint for Private Link or another advanced network setup.

1. On the **Resources** tab:

    - Select **+ Add resources** and choose the resources for this rule.

    - If you are using Private Links or advanced network setups, select **Enable Data Collection Endpoints**, then choose or create a Data Collection Endpoint.

1. On the **Collect and deliver** tab:

    - Select **+ Add data source**.

    - In **Data source**:
      - For **Data source type**, select **Windows Event Logs**.
      - Choose **Basic** or **Custom**:        
        - **Basic:**
          - Under **Security**, select **Audit success** and/or **Audit failure** to send Windows Security events to the `SecurityEvent` table. 
          - Select **Application** or **System** levels if needed. These logs go to the `Event` table and are billed as regular ingestion. They are not covered by the Defender for Servers ingestion benefit.
        - **Custom**:
          - Enter an XPath query under **Use XPath queries to filter event logs and limit data collection**, then select **Add**. For example, `Security!*[System[(EventID=4624 or EventID=4625 or EventID=4688)]]`.

        :::image type="content" source="media/data-ingestion-benefit/add-data-source-window.png" alt-text="Add data source window in the Create Data Collection Rule wizard showing Windows Event Logs selected with Basic/Custom options.":::

    - In **Destination**:
      - Select **+ Add destination**:

      :::image type="content" source="media/data-ingestion-benefit/add-data-source-destination-tab.png" alt-text="Screenshot of the Add data source pane showing the Destination tab, where you click + Add destination." lightbox="media/data-ingestion-benefit/add-data-source-destination-tab.png":::

      - For **Destination type**, choose **Azure Monitor Logs**.
      - Select at least one Log Analytics workspace in the same region as the DCR.
      - Select **Save**.

1. On the **Tags** tab add any tags you need for resource organization or cost management.

1. On the **Review + create** tab:
    - Review the settings.
    - Select **Create** to deploy the DCR.
    
1. Wait a few minutes, then you can run a simple KQL query to verify that data is flowing to the Log Analytics workspace:

```kusto
SecurityEvent
| take 10
```

## Sample JSON fragment

The following example shows a DCR configuration that collects selected Windows Security events:

```json
{
  "dataSources": {
    "windowsEventLogs": [
      {
        "name": "SecurityEvents",
        "streams": ["Microsoft-SecurityEvent"],
        "xPathQueries": [
          "Security!*[System[(EventID=4624 or EventID=4625 or EventID=4688)]]"
        ]
      }
    ]
  },
  "destinations": {
    "logAnalytics": [
      { "workspaceId": "<workspace-id>" }
    ]
  }
}
```

## Deploy at scale

For large environments, you can use Azure Policy to automatically create and assign Data Collection Rules (DCRs) for security events across multiple subscriptions by using the [Deploy AMA DCR for Security Events collection](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Policy/Deploy%20AMA%20DCR%20for%20Security%20Events%20collection) initiative.


## Related content

- [Use the data ingestion benefit in Microsoft Defender for Cloud](data-ingestion-benefit.md)

