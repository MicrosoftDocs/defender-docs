---
title: Use the data ingestion benefit in Microsoft Defender for Cloud
description: Learn how to take advantage of the data ingestion benefit in Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: elazark
ms.date: 09/01/2025
ai-usage: ai-assisted
---

# Use the data ingestion benefit

When you enable Defender for Servers Plan 2 in Microsoft Defender for Cloud, you receive 500 MB of free data ingestion per node daily.

- The 500 MB allowance applies per machine, per day, for specific security data types collected directly by Defender for Cloud.
- Data ingestion is calculated per machine, per reported workspace, and daily.
- The total daily free limit equals the number of machines × 500 MB.
- The allowance is averaged across all machines in the subscription each day.
- You aren’t charged extra if the total remains within the daily free limit, even if some machines send only 100 MB and others send 800 MB.
- The benefit is applied to the Log Analytics workspace where the machine reports.
- The benefit might not appear on your invoice because it has zero cost. You can see it in the product UI and in Microsoft Cost Management exports. Learn how to  [view your data allocation benefits](/azure/azure-monitor/fundamentals/cost-usage#view-data-allocation-benefits).

## Prerequisites

- Each machine must run the Azure Monitor Agent (AMA) in a subscription with Defender for Servers Plan 2 enabled.
- Each Log Analytics workspace where machines report must have Defender for Servers Plan 2 enabled.
- If a machine reports to more than one workspace, the 500 MB/day benefit is applied to only one of them.

The following subset of  [security data types](/azure/azure-monitor/reference/tables-category#security) are supported for the benefit:

- [SecurityAlert](/azure/azure-monitor/reference/tables/securityalert)
- [SecurityBaseline](/azure/azure-monitor/reference/tables/securitybaseline)
- [SecurityBaselineSummary](/azure/azure-monitor/reference/tables/securitybaselinesummary)
- [SecurityDetection](/azure/azure-monitor/reference/tables/securitydetection)
- [SecurityEvent](/azure/azure-monitor/reference/tables/securityevent)
- [WindowsFirewall](/azure/azure-monitor/reference/tables/windowsfirewall)
- [ProtectionStatus](/azure/azure-monitor/reference/tables/protectionstatus)
- [Update](/azure/azure-monitor/reference/tables/update) and [UpdateSummary](/azure/azure-monitor/reference/tables/updatesummary) when the Update Management solution isn't running in the workspace or solution targeting is enabled.
- [MDCFileIntegrityMonitoringEvents](/azure/azure-monitor/reference/tables/mdcfileintegritymonitoringevents)
- [WindowsEvent](/azure/azure-monitor/reference/tables/windowsevent?branch=main)
- [LinuxAuditLog](/azure/azure-monitor/reference/tables/linuxauditlog)

### Create a custom Data Collection Rule (DCR) for Security Events (500 MB/day benefit)

To receive up to **500 MB per server per day of free Security Events data**, use a a Data Collection Rule (DCR) to route Windows Security events to the `SecurityEvent` table.

#### Quick steps to create a DCR

1. Sign into the [Azure portal](https://portal.azure.com).
1. Go to ▸ **Monitor** ▸ **Settings** ▸ **Data Collection Rules** ▸ **+ Create**.
1. On the **Basics** tab:
    - Enter a name and a subscription.
    - Choose or create a resource group.
    - Select the region. The region must match the region of the Log Analytics workspace(s) you’ll send to.
    - Under **Platform type**, select **Windows** to collect Windows Security events for the `SecurityEvent` ingestion benefit. *(Choose **Linux** or **All** if you also need those logs.)*
    - Under **Data Collection Endpoint**, leave **\<none\>** unless you have created a Data Collection Endpoint for Private Link or other advanced network setups.
1. On the **Resources** tab:
    - Click **+ Add resources** and select the resources where you want this rule applied.
    - Optionally, select **Enable Data Collection Endpoints**, then choose or create a Data Collection Endpoint if you are using Private Links or advanced network setups.
1. On the **Collect and deliver** tab:
    - Click **+ Add data source**. 
    - In **Data source**:
      - For **Data source type**, select **Windows Event Logs**.
      -  Choose **Basic** or **Custom**:
      :::image type="content" source="media/data-ingestion-benefit/dcr-add-data-source-window.png" alt-text="Add data source window in the Create Data Collection Rule wizard showing Windows Event Logs selected with Basic/Custom options.":::
          - **Basic**:
              - Under **Security**, select **Audit success** and/or **Audit failure** to collect Windows Security events (routes to the `SecurityEvent` table).  
              - Select **Application** or **System** levels if needed. These logs are sent to the Event table and are billed as regular ingestion. They are not covered by the Defender for Servers ingestion benefit.
          - **Custom**:
              - Under **Use XPath queries to filter event logs and limit data collection**, enter an XPath query and select **Add**. For example:  
                ```xpath
                Security!*[System[(EventID=4624 or EventID=4625 or EventID=4688)]]
                ```
    - In **Destination**:
      - Click **+ Add destination**:
      :::image type="content" source="media/data-ingestion-benefit/dcr-add-data-source-destination-tab.png" alt-text="Screenshot of the Add data source pane showing the Destination tab, where you click + Add destination." lightbox="media/data-ingestion-benefit/dcr-add-data-source-destination-tab.png":::
      - For **Destination type**, choose **Azure Monitor Logs**.
      - Select at least one Log Analytics workspace (same region as the DCR).
      - Click **Save**.
1. On the **Tags** tab add any tags you need for resource organization or cost management.
1. On the **Review + create** tab:
    - Review the settings.
    - Click **Create** to deploy the DCR.
1. After a few minutes you can verify data in the Log Analytics workspace by running a simple KQL query such as:
    ```kusto
    SecurityEvent
    | take 10
    ```
#### Sample JSON fragment

```json
{
  "dataSources": {
    "windowsEventLogs": [
      {
        "name": "SecurityEvents",
        "streams": ["Microsoft-SecurityEvent"],
        "xPathQueries": [
          "*[System[(EventID=4624 or EventID=4625 or EventID=4688)]]"
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

#### Compliance checklist

| Requirement | Why it matters |
|-------------|----------------|
| **`Microsoft-SecurityEvent`** stream in the DCR | Routes data to the `SecurityEvent` table covered by the allowance. |
| **Security solution enabled on workspace** | Ensures the ingestion benefit is applied (same as Defender for Servers Plan 2). |
| **Defender for Servers Plan 2** | Grants the daily 500 MB allowance per node. |
| **Azure Monitor Agent (AMA)** installed | Required to apply custom DCRs. |

#### Deploy at scale

Use the Azure Policy initiative [Deploy AMA DCR for Security Events collection](
https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Policy/Deploy%20AMA%20DCR%20for%20Security%20Events%20collection) to automatically create and assign a DCR that collects Windows Security events across multiple subscriptions.

## Configure a workspace

Azure Monitor describes how to [create a Log Analytics workspace](/azure/azure-monitor/logs/quick-create-workspace).

## Enable Defender for Servers Plan 2 on the workspace

To receive the 500 MB/day `SecurityEvent` ingestion benefit, the Log Analytics workspace that receives the data must have Defender for Servers Plan 2 enabled.

1. In the [Azure portal](https://portal.azure.com), search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**, and select the relevant workspace.

1. Select the relevant workspace.

1. Toggle the servers plan to **On**, and then select **Save**.

    :::image type="content" source="media/tutorial-enable-servers-plan/enable-workspace-servers.png" alt-text="Screenshot that shows the plan enablement page at the Log Analytics workspace level." lightbox="media/tutorial-enable-servers-plan/enable-workspace-servers.png":::

> [!NOTE]
> If you want to disable Defender for Servers Plan 2, you explicitly disable the plan on any Log Analytics workspace with it enabled.
