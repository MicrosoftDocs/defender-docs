---
title: ServiceNow integration with Defender for Cloud
description: Learn about integrating ServiceNow with Microsoft Defender for Cloud to protect Azure, hybrid, and multicloud machines.
author: dcurwin
ms.author: dacurwin
ms.topic: overview
ms.date: 08/18/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn about the integration that exists between ServiceNow and Microsoft Defender for Cloud so that I can protect my Azure, hybrid, and multicloud machines.
---

# ServiceNow integration with Defender for Cloud

ServiceNow is a cloud-based workflow automation and enterprise-oriented solution that enables organizations to manage and track digital workflows within a unified, robust platform. ServiceNow helps to improve operational efficiencies by streamlining and automating routine work tasks and delivers resilient services that help increase your productivity.  

ServiceNow can be integrated with Microsoft Defender for Cloud to allow customers to prioritize remediation of recommendations that affect your business. Defender for Cloud integrates workflows with the following ServiceNow modules:

- **IT Service Management (ITSM)** -For incident management. As part of this connection, customers can create/view ServiceNow tickets (linked to recommendations) from Defender for Cloud.
- **Configuration Compliance (CC)** - For compliance management. As part of this connection, customers can create and view ServiceNow tickets (linked to recommendations) from Defender for Cloud.

## IT Service Management (ITSM)

As part of the integration, you can create and monitor tickets in ServiceNow directly from Defender for Cloud:

- **Incident**: An incident is an unplanned interruption of reduction in the quality of an IT service as reported by a user or monitoring system. ServiceNow’s incident management module helps IT teams track and manage incidents, from initial reporting to resolution.
- **Problem**: A problem is the underlying cause of one or more incidents. It’s often a recurring or persistent issue that needs to be addressed to prevent future incidents.
- **Change**: A change is a planned alternation or addition to an IT service or its supporting infrastructure. A change management module helps IT teams plan, approve, and execute changes in a controlled and systematic manner. It minimizes the risk of service disruptions and maintains service quality.

### Bidirectional synchronization

As part of the governance capabilities within Defender for Cloud, you can enable a bi-directional integration between ServiceNow and Defender for Cloud, for the creation of ITSM incidents, changes or problem tickets. 

Tickets can be initiated manually or automatically by leveraging governance automation rules.

> [!NOTE]
> Synchronization occurs every 24 hrs.

## Configuration Compliance (CC)

As part of the integration, you can utilize the Defender for Clouds CSPM plan's findings into the ServiceNow Configuration Compliance module to unify compliance efforts across on-premises and cloud environments.

The integration enhances visibility by providing detailed insights into vulnerabilities and misconfigurations detected by Defender for Cloud. It also enables automated remediation workflows, significantly reduces the time and effort needed to resolve compliance issues. It improves risk management by accurately assessing risks and prioritizing compliance tasks based on real-time security data. Streamlined reporting capabilities offer stakeholders clear, actionable insights into compliance status and trends, facilitating better decision-making and demonstrating adherence to regulatory requirements. The integration fosters a proactive approach to compliance with continuous monitoring and assessment, helping organizations identify and address issues before they lead to security incidents. It seamlessly incorporates compliance findings into broader IT service management processes, ensuring a holistic and efficient approach to IT operations and compliance, ultimately strengthening the organization's overall security posture.

As Defender for Cloud generates cloud security posture management (CSPM) findings, we are happy to explain how customers could leverage this in combination with ServiceNow Configuration Compliance (CC). 

To integrate both solutions, customers must meet the following pre-requisites: 

## Related content

- [Integrate ServiceNow to Defender for Cloud](connect-servicenow.md)
- [Create a ticket in Defender for Cloud](create-ticket-servicenow.md)
- [Assign an owner to a recommendation or severity level](integration-servicenow.md)
