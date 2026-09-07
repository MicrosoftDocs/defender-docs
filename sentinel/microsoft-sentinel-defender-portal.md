---
title: Microsoft Sentinel in the Microsoft Defender portal
description: Learn how Microsoft Sentinel integrates into the Microsoft Defender portal, compare capabilities with the Azure portal experience, and plan your transition.
ms.author: guywild
author: guywi-ms
ms.reviewer: soulisabag
ms.topic: overview
ms.date: 06/18/2026
appliesto: 
    - Microsoft Sentinel in the Microsoft Defender portal
ms.collection: usx-security
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1013


#Customer intent: As a security operations analyst, I want to understand the integration of Microsoft Sentinel within the Microsoft Defender portal so that I can effectively navigate and utilize the new and improved security capabilities.

---

# Microsoft Sentinel in the Microsoft Defender portal

Microsoft Defender provides a unified cybersecurity solution that integrates endpoint protection, cloud security, identity protection, email security, threat intelligence, exposure management, and SIEM into a centralized platform powered by a modern data lake. It uses AI-driven defense to help organizations anticipate and stop attacks, ensuring efficient and effective security operations.

Microsoft Sentinel is generally available in the Microsoft Defender portal, either with [Microsoft Defender](/defender-xdr/microsoft-365-defender) or on its own, delivering a unified SIEM and XDR experience for faster and more accurate threat detection and response, simplified workflows, and enhanced operational efficiency.

This article describes the Microsoft Sentinel experience in the Defender portal. The following sections compare capabilities, list navigation changes, and identify features that are limited without Defender services.

Microsoft Sentinel is generally available in the Microsoft Defender portal, including for customers without Microsoft Defender XDR or an E5 license. You can use Microsoft Sentinel in the Defender portal even if you aren't using other Microsoft Defender services.

After **March 31, 2027**, Microsoft Sentinel will no longer be supported in the Azure portal and will be available only in the Microsoft Defender portal.

If you're currently using Microsoft Sentinel in the Azure portal, we recommend that you start planning your transition to the Defender portal now to ensure a smooth transition and take full advantage of the [unified security operations experience offered by Microsoft Defender](/unified-secops-platform/overview-unified-security).

For more information, see:

- [Transition your Microsoft Sentinel environment to the Defender portal](move-to-defender.md)
- [Planning your move to Microsoft Defender portal for all Microsoft Sentinel customers](https://techcommunity.microsoft.com/blog/microsoft-security-blog/planning-your-move-to-microsoft-defender-portal-for-all-microsoft-sentinel-custo/4428613) (blog)

[!INCLUDE [unified-soc-preview](includes/unified-soc-preview.md)]

<a name='feature-comparison-sentinel-in-azure-vs-sentinel-in-the-defender-portal'></a>

## Feature comparison: Microsoft Sentinel in the Azure portal vs. the Defender portal

The following tables compare Microsoft Sentinel capabilities in the Azure portal with capabilities in the Defender portal.

### Incidents and investigation

| **Capability area** | **Sentinel in Azure portal** | **Sentinel in Defender portal** | **Benefits** |
|----|----|----|----|
| Core SIEM capabilities | Full SIEM functionality (ingestion, analytics rules, incidents, workbooks, hunting) | Full SIEM functionality integrated into unified SIEM and Defender experience. | Same SIEM power, better operating model |
| Incident management | Sentinel incident queue separate from Defender | [Unified incident queue](/defender-xdr/incidents-overview) for SIEM and XDR, with [Security Copilot for incident investigation](sentinel-security-copilot.md) to summarize and respond. Incidents are automatically enriched with Defender signals. | Single pane of glass, deeper analyst insights |
| Alert correlation and threat detection | Separate correlation for Sentinel and Defender incidents | Automatic cross-domain correlation with AI/ML for faster [threat detection](/unified-secops-platform/detect-threats-overview). | Reduced alert fatigue, full attack story in one incident |
| Investigation experience | Log-centric workflows  | [Attack story and incident graph](/defender-xdr/investigate-incidents#attack-story) with [unified entity pages](entity-pages.md) for devices, users, IPs, and Azure resources. Includes [blast radius analysis](/defender-xdr/investigate-incidents#blast-radius-analysis) to visualize possible attack propagation paths and assess business impact. Entity pages combine Sentinel and Defender data to provide expanded investigation context. | Visual investigation, faster root-cause analysis |
| Threat intelligence (TI) | TI managed within Sentinel | Rich TI embedded in incidents, hunting, and investigations including premium Microsoft Threat Intelligence feed. | Better intelligence, operationalized out of the box |

&nbsp;

### Hunting and AI

| **Capability area** | **Sentinel in Azure portal** | **Sentinel in Defender portal** | **Benefits** |
|----|----|----|----|
| Advanced hunting | Sentinel-only (Log Analytics) | Unified [advanced hunting](https://go.microsoft.com/fwlink/p/?linkid=2264410) for SIEM, Defender, and the data lake, with [Security Copilot in advanced hunting](/defender-xdr/advanced-hunting-security-copilot) for KQL generation. Supports hunting in the tenant and workspaces and reuse of existing Sentinel workspace queries and functions. | Broader dataset, richer context, no context-switching |
| AI-assisted SOC (Security Copilot) | Not available | Native Security Copilot: [automated incident summary](/defender-xdr/security-copilot-m365d-incident-summary), [guided response actions](/defender-xdr/security-copilot-m365d-guided-response), [script analysis](/defender-xdr/security-copilot-m365d-script-analysis), [file analysis](/defender-xdr/copilot-in-defender-file-analysis), [incident reports](/defender-xdr/security-copilot-m365d-create-incident-report), and [autonomous Security Copilot agents](/defender-xdr/security-copilot-agents-defender) for alert triage, threat intelligence briefing, and [threat hunting](/defender-xdr/advanced-hunting-security-copilot-threat-hunting-assistant). [Included capacity for E5/E7 customers](/copilot/security/security-copilot-inclusion). | Faster investigation, lower skill barrier, agentic defense |
| Post-incident recommendations | Not available | Tailored recommendations via [Exposure Management](/unified-secops-platform/overview-msem-strategy), including attack path analysis to identify exploitable vulnerabilities. | Proactive posture improvement |

&nbsp;

### Automation and workflow

| **Capability area** | **Sentinel in Azure portal** | **Sentinel in Defender portal** | **Benefits** |
|----|----|----|----|
| Automation and SOAR | Manual playbook creation | AI-assisted [playbook generator](automation/generate-playbook.md) and integrated SOAR, including [automatic attack disruption](/defender-xdr/automatic-attack-disruption) | Faster response, reduced manual effort |
| Case management | Not available | End-to-end [case management](/unified-secops-platform/cases-overview) integrated with incidents and workflows | Track multi-incident investigations |
| SOC workflow / UX | Multiple portals, tool switching | Unified SecOps experience in the Defender portal | Less context-switching, faster response |
| SOC optimization | Limited, fragmented views | Guided [SOC optimization](soc-optimization/soc-optimization-access.md) recommendations, available [programmatically via API](soc-optimization/soc-optimization-api.md); see [optimization reference](soc-optimization/soc-optimization-reference.md) | More actionable guidance, measurable improvements |

&nbsp;

### Data and cost

| **Capability area** | **Sentinel in Azure portal** | **Sentinel in Defender portal** | **Benefits** |
|----|----|----|----|
| Data lake and long-term analytics | Log Analytics-centric | Centralized [data lake](datalake/sentinel-lake-overview.md) with tiered retention, massive-scale analytics, and simplified onboarding | Enterprise-wide visibility, lower costs at scale |
| Cost and data optimization | Separate billing models | Unified schema for Sentinel and Defender, with [advanced hunting raw logs free for 30 days without ingestion](/defender-xdr/advanced-hunting-microsoft-defender#what-to-expect-for-defender-xdr-tables-streamed-to-microsoft-sentinel) | Simplified billing, reduced ingestion costs |
| Defender data integration | Enable the Defender XDR connector in Sentinel | Automatically integrates Sentinel with Defender | Defender data integrated by default |
| Unified data model | Separate schemas | Normalized schema for Defender and SIEM | Simpler queries, less transform work |

&nbsp;

### Platform and administration

| **Capability area** | **Sentinel in Azure portal** | **Sentinel in Defender portal** | **Benefits** |
|----|----|----|----|
| Innovation focus / roadmap | Maintenance and parity only | Primary innovation surface, all new Sentinel experiences land here first | Faster access to new capabilities, optimized workflows |
| Multi-tenant / MSSP operations | Azure Lighthouse | Native multi-tenant operations (MTO) with easy delegation and management | Centralized SOC management |
| Cross-tenant visibility | Manual | Unified cross-tenant incidents and alerts | MSSP efficiency |
| RBAC model | Azure RBAC | Unified Defender RBAC, with row-level RBAC support | Granular permissions, simpler administration |
| Extensibility and APIs | Sentinel APIs | Unified Defender and Sentinel APIs | Broader integration surface |
| Support timeline | Supported until March 31, 2027 | Long-term home for Sentinel | Future-proof investment |

&nbsp;

## Limited or unavailable capabilities with Microsoft Sentinel only in the Defender portal

When you onboard Microsoft Sentinel to the Defender portal without enabling Defender capabilities or other services, the following capabilities are limited or unavailable:

- [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management)
- [Custom detection rules](/defender-xdr/custom-detections-overview), provided by Microsoft Defender
- The [Action center](/defender-xdr/m365d-action-center), provided by Microsoft Defender

## Quick reference

Some Microsoft Sentinel capabilities, like the unified incident queue, are integrated with other Microsoft Defender capabilities in the Defender portal. Many other Microsoft Sentinel capabilities are available in the **Microsoft Sentinel** section of the Defender portal.

The following image shows the Microsoft Sentinel menu in the Defender portal:

:::image type="content" source="media/microsoft-sentinel-defender-portal/navigation-defender-portal.png" alt-text="Screenshot of the Defender portal left navigation with the Microsoft Sentinel section." lightbox="media/microsoft-sentinel-defender-portal/navigation-defender-portal.png":::

The following sections describe where to find Microsoft Sentinel features in the Defender portal. They're intended for existing customers who are moving to the Defender portal. The sections are organized as Microsoft Sentinel is in the Azure portal.

For more information, see [Transition your Microsoft Sentinel environment to the Defender portal](move-to-defender.md).

### General

The following table lists the changes in navigation between the Azure and Defender portals for the **General** section in the Azure portal.

| Azure portal  | Defender portal                                       |
| ------------- | ----------------------------------------------------- |
| **Overview**      | **Overview**                                              |
| **Logs**          | **Investigation & response** > **Hunting** > **Advanced hunting** |
| **News & guides** | Not available                                         |
| **Search**        | **Microsoft Sentinel** > **Search**                           |

&nbsp;

### Threat management

The following table lists the changes in navigation between the Azure and Defender portals for the **Threat management**  section in the Azure portal.

| Azure portal        | Defender portal                                              |
| ------------------- | ------------------------------------------------------------ |
| **Incidents**           | **Investigation & response** > **Incidents & alerts** > **Incidents**    |
| **Workbooks**           | **Microsoft Sentinel** > **Threat management** > **Workbooks**            |
| **Hunting**             |**Microsoft Sentinel** > **Threat management** >  **Hunting**            |
| **Notebooks**           |**Microsoft Sentinel** > **Threat management** >  **Notebooks**          |
| **Entity behavior**     | *User entity page:* **Assets** > **Identities** > *{user}* > **Sentinel events**<br>AND<br>*Device entity page:* **Assets** > **Devices** > *{device}* > **Sentinel events**<br><br>Also, find the entity pages for the user, device, IP, and Azure resource entity types from incidents and alerts as they appear.                               |
| **Threat intelligence** | **Threat intelligence** > **Intel management** |
| **MITRE ATT&CK**        |**Microsoft Sentinel** > **Threat management** > **MITRE ATT&CK**        |

&nbsp;

### Content management

The following table lists the changes in navigation between the Azure and Defender portals for the **Content management** section in the Azure portal.

| Azure portal | Defender portal                                        |
| ------------ | ------------------------------------------------------ |
| **Content hub**  |**Microsoft Sentinel** > **Content management** > **Content hub**  |
| **Repositories** |**Microsoft Sentinel** > **Content management** > **Repositories** |
| **Community**    |**Microsoft Sentinel** > **Content management** > **Community**    |

&nbsp;

### Configuration

The following table lists the changes in navigation between the Azure and Defender portals for the **Configuration** section in the Azure portal.

| Azure portal      | Defender portal                                      |
| ----------------- | ---------------------------------------------------- |
| **Workspace manager** | Not available                                        |
| **Data connectors**   |**Microsoft Sentinel** > **Configuration** > **Data connectors** |
| **Analytics**         |**Microsoft Sentinel** > **Configuration** > **Analytics**<br>AND<br>**Investigation and response** > **Hunting** > **Custom detection rules**      |
| **Watchlists**        |**Microsoft Sentinel** > **Configuration** > **Watchlists**      |
| **Automation**        |**Microsoft Sentinel** > **Configuration** > **Automation**      |
| **Settings**          | **System** > **Settings** >**Microsoft Sentinel**              |

&nbsp;


## Related content

- [What are unified security operations?](/unified-secops-platform/overview-unified-security)
- [Microsoft Defender integration with Microsoft Sentinel](microsoft-365-defender-sentinel-integration.md)
- [Connect Microsoft Sentinel to Microsoft Defender](/unified-secops-platform/microsoft-sentinel-onboard)