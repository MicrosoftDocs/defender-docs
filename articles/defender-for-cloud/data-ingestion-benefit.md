---
title: Use the data ingestion benefit in Microsoft Defender for Cloud
description: Learn how to take advantage of the data ingestion benefit in Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: elazark
ms.date: 09/15/2025
ai-usage: ai-assisted
---

# Use the data ingestion benefit

When you enable Defender for Servers Plan 2 in Microsoft Defender for Cloud, you receive 500 MB of free data ingestion per node daily.

- The 500 MB/day allowance applies to each machine for specific security data types collected by Defender for Cloud.
- Defender for Cloud calculates data ingestion daily for each machine and workspace.
- The total daily free limit equals the number of machines × 500 MB.
- Defender for Cloud averages the allowance across all machines in the subscription each day.
- You aren’t charged extra if the total remains within the daily free limit, even if some machines send 100 MB and others send 800 MB.
- The benefit is applied to the Log Analytics workspace where the machine reports.
- The benefit doesn't appear on your invoice because it has zero cost. You can see it in the product UI and in Microsoft Cost Management exports. Learn how to  [view your data allocation benefits](/azure/azure-monitor/fundamentals/cost-usage#view-data-allocation-benefits).

## Prerequisites

To use the 500 MB/day data-ingestion benefit, make sure:

- Azure Monitor Agent (AMA) is installed on every machine in a subscription that has Defender for Servers Plan 2 enabled.  
- Defender for Servers Plan 2 is enabled on each Log Analytics workspace where these machines report.  

> [!NOTE]
> If a machine reports to more than one workspace, Defender for Cloud applies the 500 MB/day benefit to only one workspace.

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

To receive up to **500 MB of free Security Events data per server per day**, use a Data Collection Rule (DCR) to route Windows Security events to the `SecurityEvent` table.

#### Steps to create a DCR

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
    - Optionally, select **Enable Data Collection Endpoints**, then choose or create a Data Collection Endpoint if you are using Private Links or advanced network setups.
1. On the **Collect and deliver** tab:
    - Select **+ Add data source**. 
    - In **Data source**:
      - For **Data source type**, select **Windows Event Logs**.
      -  Choose **Basic** or **Custom**:
      :::image type="content" source="media/data-ingestion-benefit/dcr-add-data-source-window.png" alt-text="Add data source window in the Create Data Collection Rule wizard showing Windows Event Logs selected with Basic/Custom options.":::
          - **Basic**:
              - Under **Security**, select **Audit success** and/or **Audit failure** to collect Windows Security events (routes to the `SecurityEvent` table).  
              - Select **Application** or **System** levels if needed. These logs go to the Event table and are billed as regular ingestion. They are not covered by the Defender for Servers ingestion benefit.
          - **Custom**:
              - Enter an XPath query under **Use XPath queries to filter event logs and limit data collection**, then select **Add**. For example:  
                ```xpath
                Security!*[System[(EventID=4624 or EventID=4625 or EventID=4688)]]
                ```
    - In **Destination**:
      - Select **+ Add destination**:
      :::image type="content" source="media/data-ingestion-benefit/dcr-add-data-source-destination-tab.png" alt-text="Screenshot of the Add data source pane showing the Destination tab, where you click + Add destination." lightbox="media/data-ingestion-benefit/dcr-add-data-source-destination-tab.png":::
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

Follow Azure Monitor instructions to [create a Log Analytics workspace](/azure/azure-monitor/logs/quick-create-workspace).

## Enable Defender for Servers Plan 2 on the workspace

To get the 500 MB/day `SecurityEvent` ingestion benefit, enable Defender for Servers Plan 2 on the Log Analytics workspace.

1. In the [Azure portal](https://portal.azure.com), search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**, and select the relevant workspace.

1. Select the relevant workspace.

1. Toggle on the servers plan, then select **Save**.

    :::image type="content" source="media/tutorial-enable-servers-plan/enable-workspace-servers.png" alt-text="Screenshot that shows the plan enablement page at the Log Analytics workspace level." lightbox="media/tutorial-enable-servers-plan/enable-workspace-servers.png":::

> [!NOTE]
> To disable Defender for Servers Plan 2, turn it off on each Log Analytics workspace where it's enabled.
