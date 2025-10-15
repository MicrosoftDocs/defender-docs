---
title: Overview of the ServiceNow integration
description: Learn how to integrate ServiceNow with Microsoft Defender for Cloud to protect Azure, hybrid, and multicloud machines.
author: dcurwin
ms.author: dacurwin
ms.topic: overview
ms.date: 10/15/2025
ai-usage: ai-assisted
#customer intent: As a user, I want to learn about the integration that exists between ServiceNow and Microsoft Defender for Cloud so that I can protect my Azure, hybrid, and multicloud machines.
---

# Overview of the ServiceNow integration

You can integrate Microsoft Defender for Cloud with ServiceNow to centralize security and compliance operations within a single workflow platform. This integration helps security and IT teams work together by creating and syncing tickets, tracking remediation progress, and aligning Defender for Cloud findings with existing IT processes.

The integration supports the following ServiceNow modules:

- **[IT Service Management (ITSM)](#it-service-management-itsm)** – Provides incident management capabilities that let you create, view, and synchronize ServiceNow tickets linked to Defender for Cloud security recommendations.  
- **[Configuration Compliance](#configuration-compliance-module)** – Integrates Defender for Cloud’s cloud security posture management (CSPM) findings into ServiceNow’s compliance module, helping you assess and remediate configuration issues across Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP), and on-premises environments.

For an overview of all supported partner integrations, see [Overview of partner integration](partner-integrations.md).

## IT Service Management (ITSM)

Use the ITSM integration to create and manage ServiceNow tickets in Microsoft Defender for Cloud. This connection lets you track and remediate security recommendations as part of your organization’s existing incident management workflows.

Defender for Cloud can create or update the following ticket types in ServiceNow:

- **Incident** – Represents an unplanned interruption or reduction in service quality. Incidents can be created automatically from Defender for Cloud alerts or manually by analysts.  
- **Problem** – Identifies the root cause of recurring incidents to prevent future issues.  
- **Change** – Records planned modifications to IT services or infrastructure that are initiated as part of remediation activities.

### Bidirectional synchronization

Defender for Cloud synchronizes with ServiceNow bidirectionally, keeping changes in both systems aligned. When enabled, Defender for Cloud automatically creates and updates incidents, problems, and change tickets in ServiceNow, and syncs any changes made in ServiceNow back to Defender for Cloud.

> [!NOTE]
> This synchronization applies to the ITSM module only and runs every 24 hours.

## Configuration Compliance module

The ServiceNow Configuration Compliance module integrates with Microsoft Defender for Cloud to unify compliance management across on-premises and multicloud environments. Use this integration to import Cloud Security Posture Management (CSPM) findings from Defender for Cloud into ServiceNow. Compliance teams can then track, prioritize, and fix issues in the ServiceNow portal.

By centralizing cloud configuration findings in ServiceNow, your organization can:
- Gain a single view of compliance across Azure, AWS, and Google Cloud.
- Automate ticketing and remediation workflows for compliance deviations.
- Improve visibility and reduce risk with real-time compliance insights.

### Requirements

To set up this this integration, make sure you:

**In Azure:**
- Have an active Azure subscription with Defender for Cloud onboarded.
- Enable [Defender CSPM or Foundational CSPM](tutorial-enable-cspm-plan.md) on the target environments.

**In ServiceNow:**
- Have an [application registry configured](https://www.opslogix.com/knowledgebase/servicenow/kb-create-a-servicenow-api-key-and-secret-for-the-scom-servicenow-incident-connector).
- Enable the [ServiceNow Configuration Compliance module](https://store.servicenow.com/sn_appstore_store.do#!/store/application/29691e1f0212471dad08668c1e39932b/14.12.4).
- Enable and [configure the Microsoft Defender for Cloud integration in ServiceNow](https://docs.servicenow.com/bundle/washingtondc-security-management/page/product/secops-integration-vr/azure-security-center/task/cc_asc_install_configure.html).

## Related content

- [Connect ServiceNow's ITSM module to Defender for Cloud](connect-servicenow.md)
- [Create a ticket in Defender for Cloud](create-ticket-servicenow.md)

