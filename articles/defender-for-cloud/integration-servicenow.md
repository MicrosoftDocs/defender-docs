---
title: Overview of the ServiceNow integration
description: Learn about integrating ServiceNow with Microsoft Defender for Cloud to protect Azure, hybrid, and multicloud machines.
author: dcurwin
ms.author: dacurwin
ms.topic: overview
ms.date: 05/20/2025
ai-usage: ai-assisted
#customer intent: As a user, I want to learn about the integration that exists between ServiceNow and Microsoft Defender for Cloud so that I can protect my Azure, hybrid, and multicloud machines.
---

# Overview of the ServiceNow integration

You can integrate Microsoft Defender for Cloud with ServiceNow to centralize security and compliance operations within a single workflow platform. This integration helps security and IT teams collaborate more efficiently by automatically creating and syncing tickets, tracking remediation progress, and aligning Defender for Cloud findings with existing IT processes.

The integration supports the following ServiceNow modules:

- **[IT Service Management (ITSM)](#it-service-management-itsm)** – Provides incident management capabilities that let you create, view, and synchronize ServiceNow tickets linked to Defender for Cloud security recommendations.  
- **[Configuration Compliance](#configuration-compliance-module)** – Integrates Defender for Cloud’s cloud security posture management (CSPM) findings into ServiceNow’s compliance module, helping you assess and remediate configuration issues across Azure, AWS, GCP, and on-premises environments.

## IT Service Management (ITSM)

Through the ITSM integration, you can create and manage ServiceNow tickets directly from Microsoft Defender for Cloud. This connection lets you track and remediate security recommendations as part of your organization’s existing incident management workflows.

Defender for Cloud can create or update the following ticket types in ServiceNow:

- **Incident** – Represents an unplanned interruption or reduction in service quality. Incidents can be created automatically from Defender for Cloud alerts or manually by analysts.  
- **Problem** – Identifies the root cause of recurring incidents to prevent future issues.  
- **Change** – Records planned modifications to IT services or infrastructure that are initiated as part of remediation activities.

### Bidirectional synchronization

Defender for Cloud supports bidirectional synchronization with ServiceNow, allowing changes in either system to stay aligned. When enabled, incidents, problems, and change tickets created in Defender for Cloud are automatically reflected in ServiceNow, and updates made in ServiceNow sync back to Defender for Cloud.

You can create tickets manually or automatically by using [governance automation rules](governance-rules.md).

> [!NOTE]
> Data is synchronized every 24 hours.

## Configuration Compliance module

The ServiceNow Configuration Compliance module integrates with Microsoft Defender for Cloud to unify compliance management across on-premises and multicloud environments. This integration lets you import Defender for Cloud’s Cloud Security Posture Management (CSPM) findings into ServiceNow, so compliance teams can track, prioritize, and remediate issues directly from the ServiceNow portal.

By centralizing cloud configuration findings in ServiceNow, your organization can:
- Gain a single view of compliance across Azure, AWS, and Google Cloud.
- Automate ticketing and remediation workflows for compliance deviations.
- Improve visibility and reduce risk with real-time compliance insights.

### Requirements

To enable this integration, you must:

**In Azure**:
- Have an active Azure subscription with Defender for Cloud onboarded.
- Enable [Defender CSPM or Foundational CSPM](tutorial-enable-cspm-plan.md) on the target environments.

**In ServiceNow:**
- Have an [application registry configured](https://www.opslogix.com/knowledgebase/servicenow/kb-create-a-servicenow-api-key-and-secret-for-the-scom-servicenow-incident-connector).
- Enable the [ServiceNow Configuration Compliance module](https://store.servicenow.com/sn_appstore_store.do#!/store/application/29691e1f0212471dad08668c1e39932b/14.12.4).
- Enable and [configure the Microsoft Defender for Cloud integration in ServiceNow](https://docs.servicenow.com/bundle/washingtondc-security-management/page/product/secops-integration-vr/azure-security-center/task/cc_asc_install_configure.html).

## Related content

- [Connect ServiceNow's ITSM module to Defender for Cloud](connect-servicenow.md)
- [Create a ticket in Defender for Cloud](create-ticket-servicenow.md)

