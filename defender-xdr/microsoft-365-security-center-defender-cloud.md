---
title: Microsoft Defender for Cloud in the Microsoft Defender portal
description: Learn about changes in the Microsoft Defender portal with the Microsoft Defender for Cloud integration.
ms.service: defender-xdr
ms.localizationpriority: medium
f1.keywords:
- NOCSH
ms.author: diannegali
author: diannegali
manager: deniseb
ms.date: 07/22/2024
audience: ITPro
ms.topic: conceptual
search.appverid: 
- MOE150
- MET150
ms.collection: 
- m365-security 
- tier2
ms.custom: admindeeplinkDEFENDER
---

# Microsoft Defender for Cloud in the Microsoft Defender portal

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)
- [Microsoft Defender for Cloud](/azure/defender-for-cloud/)

[Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction) is now part of Microsoft Defender XDR. Security teams can now access Defender for Cloud alerts and incidents within the Microsoft Defender portal, providing richer context to investigations that span cloud resources, devices, and identities. In addition, security teams can get the complete picture of an attack, including suspicious and malicious events that happen in their cloud environment, through immediate correlations of alerts and incidents.

The Microsoft Defender portal combines protection, detection, investigation, and response capabilities to protect attacks on device, email, collaboration, identity, and cloud apps. The portal's detection and investigation capabilities are now extended to cloud entities, offering security operations teams a single pane of glass to significantly improve their operational efficiency.

Moreover, the Defender for Cloud incidents and alerts are now part of [Microsoft Defender XDR's public API](api-overview.md). This integration allows exporting of security alerts data to any system using a single API.

## Prerequisite

To ensure access to Defender for Cloud alerts in the Microsoft Defender portal, you must be subscribed to any of the plans listed in [Connect your Azure subscriptions](/azure/defender-for-cloud/connect-azure-subscription).

### Required permissions

> [!NOTE]
> The permission to view Defender for Cloud alerts and correlations is automatic for the entire tenant. Viewing for specific subscriptions is not supported. You can use the **alert subscription ID** filter to view Defender for Cloud alerts associated with a specific Defender for Cloud subscription in the alert and incident queues. Learn more about [filters](incident-queue.md#filters-).

The integration is available only by applying the appropriate [Microsoft Defender XDR Unified role-based access control (RBAC)](manage-rbac.md) role for Defender for Cloud. To view Defender for Cloud alerts and correlations without Defender XDR Unified RBAC, you must be a Global Administrator or Security Administrator in Azure Active Directory.

> [!IMPORTANT]
> Global Administrator is a highly privileged role that should be limited to scenarios when you can't use an existing role. Microsoft recommends that you use roles with the fewest permissions. Using lower permissioned accounts helps improve security for your organization.

## Investigation experience in the Microsoft Defender portal

> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.


The following section describes the detection and investigation experience in the Microsoft Defender portal with Defender for Cloud alerts.

> [!div class="mx-tdCol2BreakAl"]
> |Area   |Description   |
> |----------|-----------|
> |Incidents|All Defender for Cloud incidents will be integrated to the Microsoft Defender portal.</br></br> - Searching for cloud resource assets in the [incident queue](incident-queue.md) is supported.</br> - The [attack story](investigate-incidents.md#attack-story) graph will show the cloud resource.</br> - The [assets tab](investigate-incidents.md#assets) in an incident page will show the cloud resource.</br> - Each virtual machine has its own device page containing all related alerts and activity.</br></br> There will be no duplication of incidents from other Defender workloads.|
> |Alerts|All Defender for Cloud alerts, including multi-cloud, internal and external providers' alerts will be integrated to the Microsoft Defender portal. Defender for Cloud alerts will show on the Microsoft Defender portal [alert queue](/defender-endpoint/alerts-queue-endpoint-detection-response).</br></br> The *cloud resource* asset will show up in the Asset tab of an alert. Resources are clearly identified as an Azure, Amazon, or a Google Cloud resource.</br></br>Defender for Cloud alerts will automatically be associated with a tenant.</br></br>There will be no duplication of alerts from other Defender workloads.|
> |Alert and incident correlation|Alerts and incidents are automatically correlated, providing robust context to security operations teams to understand the complete attack story in their cloud environment.|
> |Threat detection|Accurate matching of virtual entities to device entities to ensure precision and effective threat detection.|
> |Unified API|Defender for Cloud alerts and incidents are now included in [Microsoft Defender XDR's public API](api-overview.md), allowing customers to export their security alerts data into other systems using one API.|
> |Advanced hunting (Preview)| Information about cloud audit events for various cloud platforms protected by the organization's Defender for Cloud is available through the [CloudAuditEvents](advanced-hunting-cloudauditevents-table.md) table in [advanced hunting](advanced-hunting-overview.md).|

> [!NOTE]
> Informational alerts from Defender for Cloud are not integrated to the Microsoft Defender portal to allow focus on the relevant and high severity alerts. This strategy streamlines management of incidents and reduces alert fatigue.

## Impact to Microsoft Sentinel users

Microsoft Sentinel customers [integrating Microsoft Defender XDR incidents](/azure/sentinel/microsoft-365-defender-sentinel-integration) *and* ingesting Defender for Cloud alerts are required to make the following configuration changes to ensure that duplicate alerts and incidents aren't created:

- Connect the **Tenant-based Microsoft Defender for Cloud (Preview)** connector to synchronize collection of alerts from all your subscriptions with tenant-based Defender for Cloud incidents that are streaming through the Microsoft Defender XDR Incidents connector.
- Disconnect the **Subscription-based Microsoft Defender for Cloud (Legacy)** alerts connector to prevent alert duplicates.
- Turn off any analytics rules&mdash;either [*Scheduled* (regular query-type) or *Microsoft security* (incident creation)](/azure/sentinel/detect-threats-built-in) rules&mdash;used to create incidents from Defender for Cloud alerts. Defender for Cloud Incidents are created automatically in the Defender portal and synchronized with Microsoft Sentinel.
- If necessary, [use automation rules](/azure/sentinel/create-manage-use-automation-rules) to close noisy incidents, or use the [built-in tuning capabilities in the Defender portal](investigate-alerts.md#tune-an-alert) to suppress certain alerts.

The following change should also be noted:

- The action to relate alerts to the Microsoft Defender portal incidents is removed.

Learn more at [Ingest Microsoft Defender for Cloud incidents with Microsoft Defender XDR integration](/azure/sentinel/ingest-defender-for-cloud-incidents).

### Turn off Defender for Cloud alerts

The alerts for Defender for Cloud are turned on by default. To maintain your subscription-based settings and avoid tenant-based sync or to opt out from the experience, perform the following steps:

1. In the Microsoft Defender portal, go to **Settings** > **Microsoft Defender XDR**.
2. In **Alert service settings**, look for **Microsoft Defender for Cloud alerts**.
3. Select **No alerts** to turn off all Defender for Cloud alerts. Selecting this option stops the ingestion of new Defender for Cloud alerts to the portal. Alerts previously ingested remain in an alert or incident page.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
