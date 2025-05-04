---
title: Identify SQL Servers protected by MMA
description: Learn how to identify SQL servers protected by the Microsoft Monitoring Agent (MMA) in your environment without having Azure Arc installed
ms.topic: how-to
ms.date: 05/04/2025
ms.author: Elazark
author: elkrieger
# customer intent: As a user, I want to learn how to identify SQL servers protected by Microsoft Monitoring Agent (MMA) in my environment so that I can assess their security posture.
---

Microsoft Defender for Cloud's Defender for SQL Server on Machines plan provides database security to protect SQL Server instances hosted on Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP), and on-premises machines.

> [!NOTE]
> As of August 31, 2025, the Microsoft Monitor Agent (MMA) will be retired. The Defender for SQL Server on Machines plan requires meeting the [required perquisites](defender-for-sql-usage.md#prerequisites) and deploying Azure Arc on all non-Azure SQL Server instances. Once Azure Arc is deployed and following the [release on the updated agent](release-notes.md#update-to-defender-for-sql-servers-on-machines-plan), your SQL Server instances will migrate automatically and seamlessly to the updated agent. This change might affect your pricing. For information regarding the plan pricing review, [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

## Identify SQL servers protected by MMA

You can identify SQL servers onboarded to the Defender for SQL Server on Machines plan with the legacy Microsoft Monitoring agent (MMA) in your environment without Azure Arc installed.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Azure Resource Graph Explorer**.

1. Copy and paste the following query into the query window: 

    ```kusto
    securityresources 
    | where type == "microsoft.security/assessments/subassessments" 
    | extend assessmentKey = extract(@"(?i)providers/Microsoft.Security/assessments/([^/]*)", 1, id) 
    | where assessmentKey == "f97aa83c-9b63-4f9a-99f6-b22c4398f936" 
    | where tostring(properties.resourceDetails.source) == "OnPremiseSql" 
    | extend lastScanTime = todatetime(properties.timeGenerated) 
    | where lastScanTime > ago(30d) 
    | extend machineName = tostring(properties.resourceDetails.machineName) 
    | extend machineUuid = tostring(properties.resourceDetails.vmuuid) 
    | distinct machineName, machineUuid
    ```

1. Select **Run query**.

    :::image type="content" source="media/identify-sql-servers-protected-by-mma/run-query.png" alt-text="Screenshot that shows the pasted query and where to find the Run query button." lightbox="media/identify-sql-servers-protected-by-mma/run-query.png":::

1. For any results returned, [connect hybrid machines with Azure Arc-enabled servers](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).

## Related content

- [Defender for SQL on machines](defender-for-sql-on-machines.md)
