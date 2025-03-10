---
title: Alerts and incidents in Microsoft Defender XDR
description: Learn about the benefits of receiving Microsoft Defender for Cloud's alerts in Microsoft Defender XDR 
ms.topic: concept-article
ms.date: 01/29/2025
#customer intent: As a security professional, I want to understand the benefits of integrating Microsoft Defender for Cloud alerts with Microsoft Defender XDR.
---

# Alerts and incidents in Microsoft Defender XDR

Microsoft Defender for Cloud is integrated with Microsoft Defender XDR. This integration allows security teams to access Defender for Cloud alerts and incidents within the Microsoft Defender portal. This integration provides richer context to investigations that span cloud resources, devices, and identities.

The partnership with Microsoft Defender XDR allows security teams to get the complete picture of an attack, including suspicious and malicious events that happen in their cloud environment. Security teams can accomplish this goal through immediate correlations of alerts and incidents.

Microsoft Defender XDR offers a comprehensive solution that combines protection, detection, investigation, and response capabilities. The solution protects against attacks on devices, email, collaboration, identity, and cloud apps. Our detection and investigation capabilities are now extended to cloud entities, offering security operations teams a single pane of glass to significantly improve their operational efficiency.

Incidents and alerts are now part of [Microsoft Defender XDR's public API](/microsoft-365/security/defender/api-overview). This integration allows exporting of security alerts data to any system using a single API. As Microsoft Defender for Cloud, we're committed to providing our users with the best possible security solutions, and this integration is a significant step towards achieving that goal.

## Prerequisites

To ensure access to Defender for Cloud alerts in the Microsoft Defender portal, you must be subscribed to any of the plans listed in [Connect your Azure subscriptions](connect-azure-subscription.md).

> [!NOTE]
> The permission to view Defender for Cloud alerts and correlations is automatic for the entire tenant. Viewing for specific subscriptions is not supported. You can use the **alert subscription ID** filter to view Defender for Cloud alerts associated with a specific Defender for Cloud subscription in the alert and incident queues. Learn more about [filters](/defender-xdr/incident-queue#filters).

The integration is available only by applying the appropriate [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac) role for Defender for Cloud. To view Defender for Cloud alerts and correlations without Defender XDR Unified RBAC, you must be a Global Administrator or Security Administrator in Azure Active Directory.

## Investigation experience in Microsoft Defender XDR

The following table describes the detection and investigation experience in Microsoft Defender XDR with Defender for Cloud alerts.

| Area | Description |
|--|--|
| Incidents | All Defender for Cloud incidents are integrated to Microsoft Defender XDR. <br> - Searching for cloud resource assets in the [incident queue](/microsoft-365/security/defender/incident-queue) is supported. <br> - The [attack story](/microsoft-365/security/defender/investigate-incidents#attack-story) graph shows cloud resource. <br> - The [assets tab](/microsoft-365/security/defender/investigate-incidents#assets) in an incident page shows the cloud resource. <br> - Each virtual machine has its own entity page containing all related alerts and activity. <br> <br> There are no duplications of incidents from other Defender workloads. |
| Alerts  | All Defender for Cloud alerts, including multicloud, internal and external providers’ alerts, are integrated to Microsoft Defender XDR. Defenders for Cloud alerts show on the Microsoft Defender XDR [alert queue](/microsoft-365/security/defender-endpoint/alerts-queue-endpoint-detection-response). <br>Microsoft Defender XDR<br> The `cloud resource` asset shows up in the Asset tab of an alert. Resources are clearly identified as an Azure, Amazon, or a Google Cloud resource. <br> <br> Defender for Cloud alerts are automatically be associated with a tenant. <br> <br> There are no duplications of alerts from other Defender workloads.|
| Alert and incident correlation | Alerts and incidents are automatically correlated, providing robust context to security operations teams to understand the complete attack story in their cloud environment. |
| Threat detection | Accurate matching of virtual entities to device entities to ensure precision and effective threat detection. |
| Unified API | Defender for Cloud alerts and incidents are now included in [Microsoft Defender XDR’s public API](/microsoft-365/security/defender/api-overview), allowing customers to export their security alerts data into other systems using one API. |

> [!NOTE]
> Informational alerts from Defender for Cloud are not integrated to the Microsoft Defender portal to allow focus on the relevant and high severity alerts. This strategy streamlines management of incidents and reduces alert fatigue.

## Advanced hunting in XDR

Microsoft Defender XDR's advanced hunting capabilities are extended to include Defender for Cloud alerts and incidents. This integration allows security teams to hunt across all their cloud resources, devices, and identities in a single query.

The advanced hunting experience in Microsoft Defender XDR is designed to provide security teams with the flexibility to create custom queries to hunt for threats across their environment. The integration with Defender for Cloud alerts and incidents allows security teams to hunt for threats across their cloud resources, devices, and identities.

The [CloudAuditEvents table](/defender-xdr/advanced-hunting-cloudauditevents-table) in advanced hunting allows you to investigate and hunt through control plane events and to create custom detections to surface suspicious Azure Resource Manager and Kubernetes (KubeAudit) control plane activities.  

The [CloudProcessEvents table](/defender-xdr/advanced-hunting-cloudauditevents-table) in advanced hunting allows you to triage, investigate and create custom detections for suspicious activities that are invoked in your cloud infrastructure with information that includes details on the process details.   

## Microsoft Sentinel customers

If you're a Microsoft Sentinel customer who has onboarded to [Microsoft's unified security operations (SecOps) platform](/azure/sentinel/microsoft-sentinel-defender-portal), Defender for Cloud alerts are already ingested directly to Defender XDR. To benefit from built-in security content, make sure to install the Microsoft Defender for Cloud solution from the Microsoft Sentinel **Content hub**. 

Microsoft Sentinel customers who aren't using Microsoft's unified SecOps platform can also [benefit from the Defender for Cloud integration with Microsoft Defender XDR](/azure/sentinel/ingest-defender-for-cloud-incidents) in their workspaces using the Microsoft Defender XDR incidents and alerts connector.

First you need to [enable incident integration in your Microsoft Defender XDR connector](/azure/sentinel/connect-microsoft-365-defender).

Then, enable the **Tenant-based Microsoft Defender for Cloud (Preview)** data connector to synchronize your subscriptions with your tenant-based Defender for Cloud incidents to stream through the Microsoft 365 Defender incidents connector.

The **Tenant-based Microsoft Defender for Cloud (Preview)** data connector is available through the Microsoft Defender for Cloud solution, version 3.0.0, from the Microsoft Sentinel **Content hub**. If you have an earlier version of this solution, we recommend that you update your solution version. If you still have the **Subscription-based Microsoft Defender for Cloud (Legacy)** data connector enabled, we recommend that you disconnect the connector to prevent duplicating alerts in your logs.

We also recommend that you disable any analytics rules that create incidents from your Microsoft Defender for Cloud alerts directly. Use Microsoft Sentinel automation rules to close incidents immediately and prevent specific types of Defender for Cloud alerts from becoming incidents, or use the [built-in tuning capabilities in the Microsoft Defender portal](/defender-xdr/investigate-alerts#tune-an-alert) to prevent alerts from becoming incidents.

If you've integrated your Microsoft Defender XDR incidents into Microsoft Sentinel and want to keep their subscription-based settings and avoid tenant-based syncing, you can opt out of syncing incidents and alerts using the Microsoft Defender XDR connector. To opt out:

1. In the Microsoft Defender portal, go to **Settings > Microsoft Defender XDR**.
2. In **Alert service settings**, look for Microsoft Defender for Cloud alerts.
3. Select **No alerts** to turn off all Defender for Cloud alerts. Selecting this option stops the ingestion of new Defender for Cloud alerts to the portal. Alerts previously ingested remain in an alert or incident page.

For more information, see:

- [Discover and manage Microsoft Sentinel out-of-the-box content](/azure/sentinel/sentinel-solutions-deploy)
- [Ingest Microsoft Defender for Cloud incidents with Microsoft Defender XDR integration](/azure/sentinel/ingest-defender-for-cloud-incidents)

## Related content

[Security alerts - a reference guide](alerts-reference.md)
