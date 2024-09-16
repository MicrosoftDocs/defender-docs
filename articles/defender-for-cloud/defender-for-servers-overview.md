---
title: Overview of Defender for Servers in Microsoft Defender for Cloud
description: Get a quick overview of the Defender for Servers plan in Microsoft Defender for Cloud
ms.topic: conceptual
ms.author: dacurwin
author: dcurwin
ms.date: 08/28/2024
# customer intent: I want to understand how the Defender for Servers plan in Defender for Cloud can help protect from business from security threats, and reduce security risk.
---

# Overview - Defender for Servers

The Defender for Servers plan in [Microsoft Defender for Cloud](defender-for-cloud-introduction.md) reduces risk and exposure with security recommendations for improving multicloud security posture. Defender for Servers also provides protection against real-time threats and attacks.

> [!NOTE]
> Some Defender for Servers features use the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) in general availability (GA), or the Azure Monitoring Agent (AMA), in preview, to gather information from machines.
> - Support for using these agents in Defender for Servers is ending.
> - In most plan features, the use of the MMA/AMA is replaced by [agentless machine scanning](concept-agentless-data-collection.md), or by [integration with Microsoft Defender for Endpoint](integration-defender-for-endpoint.md).
> - [Learn more](prepare-deprecation-log-analytics-mma-agent.md) about upcoming changes.

## Defender for Server benefits

Defender for Servers provides a number of security benefits.

- **Protect multicloud and on-premises machines**: Defender for Servers protects Windows and Linux machines in mulicloud environments (Azure, AWS, GCP), and on-premises.
- **Centralize management and reporting**: Defender for Cloud provides a single view of monitored resources, including machines protected by Defender for Servers. You can filter, sort, and cross-reference data to investigate resource security.
- **Integrate with Defender services**: Defender for Servers integrates natively with capabilities provided by Defender for Endpoint and Microsoft Defender Vulnerability Management.
- **Improve posture and reduce risk**: Defender for Servers assesses the security posture of protected machines against compliance standards, and provides actionable security recommendations to remediate security posture.
- **Benefit from agentless scanning**: Defender for Servers Plan 2 provides agentless machine scanning. Without needing an agent running on endpoints, you can scan your software inventory, assess machines for vulnerabilities, scan for machine secrets, and detect malware threats.
- **Protect against threats in near real-time**: Defender for Servers applies known patterns to discover malicious behavior that deviates from established norms and conforms to potential attack vectors. Defender for Server identifies and analyzes potential real-time threats by a number of means, and issues security alerts as needed.
- **Get intelligent threat detection**: Defender for Cloud uses advanced security analytics and machine-learning technologies from multiple sources, including [Microsoft Security Response Center (MSRC)](https://www.microsoft.com/msrc), to evaluate events and detect threats across the enterprise.


## Defender for Endpoint integration

Defender for Endpoint and Defender for Vulnerability Management integrate natively into Defender for Servers.

This default integration allows Defender for Servers to take advantage of the endpoint detection and response (EDR) capabilities of Defender for Endpoint, and the vulnerability scanning, software inventory, and premium features provided by Defender for Vulnerability Management.

- **Licensing**: Defender for Servers covers licensing for [Defender for Endpoint Plan 2](/defender-endpoint/microsoft-defender-endpoint). Licensing is charged per hour instead of per seat, lowering costs by protecting VMs only when they're in use.
- **Agent provisioning**: Defender for Cloud can automatically provision the Defender for Endpoint sensor on supported machines that are connected to Defender for Cloud.
- **Unified alerts**: With the integration, alerts and vulnerability data from Defender for Endpoint appear in the Defender for Cloud dashboard in Azure. You can move to the Defender portal to drill down into more detailed alert information and context.


## Defender for Servers plans

Defender for Servers offers two plans:

- **Defender for Servers Plan 1** is entry-level, and focuses on the EDR capabilities provided by the Defender for Endpoint integration.
- **Defender for Servers Plan 2** provides the same features as Plan 1, and additional capabilities.



## Plan protection features

Plan features are summarized in the table. Some plan features have upcoming changes to the way that information is collected. Review these in the table, and read the latest [upcoming agent deprecation information](prepare-deprecation-log-analytics-mma-agent.md).

**Feature** | **Plan** | **Details**
--- | --- | --- 
**Multicloud and hybrid support** | Plan 1, 2 | Defender for Servers can protect Azure VMs, AWS/GCP machines connected to Defender for Cloud, and on-premises machines onboarded as Azure Arc-enabled VMs.<br/><br/> Review Defender for Servers [support and requirements](support-matrix-defender-for-servers.md).
**Automatic onboarding** | Plan 1, 2 | Defender for Cloud can [automatically onboard machines to Defender for Endpoint](enable-defender-for-endpoint.md) by installing the Defender for Endpoint sensor on machines.
**Integrated alerts and incidents** | Plan 1, 2 | Defender for Endpoint alerts and incidents for connected machines are displayed in Defender for Cloud. You can drill down into alerts in the Defender portal for additional information and context.
**Software inventory discovery** | Plan 1, 2 | [Software inventory](asset-inventory.md) discovery provided by [Defender Vulnerability Management](/defender-vulnerability-management/tvm-software-inventory) is integrated into Defender for Cloud.
**Vulnerability scanning (agent-based)** | Plan 1, 2 | Defender for Servers [assesses machines for vulnerabilities](auto-deploy-vulnerability-assessment.md) with [Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management), using the Defender for Endpoint agent.
**Vulnerability scanning (agentless)** | Plan 2 only | As part of its [agentless scanning capabilities](concept-agentless-data-collection.md), Defender for Cloud [agentlessly assesses machines for vulnerabilities](auto-deploy-vulnerability-assessment.md) with Defender Vulnerability Management for connected machines. Agentless assessment is in addition to agent-based vulnerability scanning.
**OS baseline misconfigurations** | No plan needed | When you enable Defender for Cloud on an Azure subscription, Defender for Cloud's free foundational cloud security posture management (CSPM) collects information from protected resources, assesses it against the Microsoft Cloud Security Benchmark (including compute security baselines that assess machine OS compliance), and makes recommendations to improve security posture.<br/><br/> Support for using the MMA  to collect this information will end in November 2024. It will be replaced by the [Azure Policy guest configuration](/azure/virtual-machines/extensions/guest-configuration), currently in preview.<br/><br/>With the move to the guest configuration, OS recommendations based on compute security baselines will no longer be included in foundational CSPM. They will be available when you enable Defender for Servers Plan 2.
**Regulatory compliance assessment** | Plan 1, 2 | As part of its foundational posture assessment, Defender for Cloud provides a couple of [default compliance standards](concept-regulatory-compliance-standards.md#default-compliance-standards).<br/><br/>If you have the Defender for Servers plan enabled (or any other paid plan), you can enable [additional compliance standards](concept-regulatory-compliance-standards.md).
**OS system updates** | No plan required | Defender for Servers uses Defender for Cloud's free foundational posture capabilities to assess whether VMs have the latest updates installed. [Learn more](enable-periodic-system-updates.md).<br/><br/> Information about machine updates is gathered  using Azure Update Manager. The older method that used the MMA will remain supported until November 2024.
**Free OS system update remediation** | Plan 2 only | When Defender for Servers Plan 2 is enabled, there's no charge for assessing and remediating system updates on Azure Arc machines. Charges are incurred if you're not using Defender for Servers Plan 2. [Learn more](/azure/update-center/update-manager-faq#im-a-defender-for-server-customer-and-use-update-recommendations-powered-by-azure-update-manager-namely-periodic-assessment-should-be-enabled-on-your-machines-and-system-updates-should-be-installed-on-your-machines-would-i-be-charged-for-azure-update-manager).
**[Docker host hardening](harden-docker-hosts.md)** | Plan 2 only | Defender for Servers identifies and assesses containers hosted on Linux machines running Docker containers, and then compares their settings with the Center for Internet Security (CIS) Docker Benchmark.<br/><br/>Docker host hardening uses the MMA to collect information. The MMA is set to retire, and the Docker host hardening feature will be deprecated in November 2024.
**Defender for Vulnerability Management premium features** | Plan 2 only | Defender for Servers Plan 2 includes [premium features](/defender-vulnerability-management/defender-vulnerability-management-capabilities) in Defender Vulnerability Management. Premium features include certificate assessments, OS security baseline assessments, and more, and are available in the [Defender portal](https://security.microsoft.com/homepage) only.
**Endpoint detection and response** | Plan 1, 2 | Defender for Servers integrates Defender for Endpoint [EDR](/defender-endpoint/overview-endpoint-detection-response) capabilities to provide near real-time threat detection for supported endpoints.<br/><br/>Protection includes**[Attack surface reduction rules](/defender-endpoint/attack-surface-reduction)**, **threat protection** from [Internet-based network](/defender-endpoint/network-protection) and [web](/defender-endpoint/web-protection-overview) threats, and[next-generation](/defender-endpoint/next-generation-protection)** antimalware and antivirus protection.
**Malware scanning (agentless)** | Plan 2 only | In addition to the next-generation protection provided by the Defender for Endpoint integration, as part of its [agentless scanning capabilities](concept-agentless-data-collection.md), Defender for Cloud provides [malware scanning](agentless-malware-scanning.md) to find potential malware.
**Machine secrets scanning (agentless)** | Plan 2 only | As part of its [agentless scanning capabilities](concept-agentless-data-collection.md), Defender for Cloud provides [agentless secrets scanning](secrets-scanning.md) to locate plain text secrets in protected machines.<br/><br/> Secrets scanning is also avalable with the Defender Cloud Security Posture Management (CSPM) plan.
**Threat detection (OS-level)** | Plan 1, 2 | In addition to OS-level monitoring provided by Defender for Endpoint integration, Defender for Servers provides fileless attack detection to identify fileless attack toolkits, techniques, and behaviors.
**Threat detection (Azure network layer)** | Plan 2 only  | Defender for Servers uses agentless detection to detect threats that are directed at the control plan on the network, including [network-based security alerts](alerts-azure-network-layer.md) for Azure VMs. 
**File integrity monitoring** | Plan 2 only | [File integrity monitoring](file-integrity-monitoring-overview.md) examines files and registries for changes that might indicate an attack.<br/><br/> File integrity monitoring previously used the MMA to collect machine information. This method will be deprecated in November 2024. It will replaced by use of the Defender for Endpoint sensor integrated into Defender for Server, available for preview around September 2024.
**Just-in-time virtual machine access** | Plan 2 only | [Just-in-time virtual machine access](just-in-time-access-overview.md) locks down machine ports to reduce the attack surface. 
**[Adaptive network hardening](adaptive-network-hardening.md)** | Plan 2 | Adaptive network hardening refines and hardens network security group (NSG) rules.<br/><br/> Adaptive network hardening uses the MMA to collect information. The MMA is set to retire, and this feature will be deprecated in November 2024.  
**Network map** | Plan 2 only | The [network map](protect-network-resources.md) provides a geographical view of recommendations for hardening your network resources.
**Adaptive application controls** | Plan 2 only | [Adaptive application controls](adaptive-application-controls.md) define allowlists of known safe applications for machines.<br/><br/> The adaptive application controls features uses MMA to collect data. The MMA is set to retire, and this feature will be deprecated in August 2024.
**Free data ingestion (500 MB)** | Plan 2 only | Free data ingestion is available for [specific data types](faq-defender-for-servers.yml#what-data-types-are-included-in-the-daily-allowance-) to Log Analytics workspaces.<br/>- Data ingestion is calculated per node, per reported workspace, and per day.<br/>- It's available for every workspace that has a *Security* or *AntiMalware* solution installed.


## Enabling plans

You can enable Defender for Servers with the following scope.

**Scope** | **Plan**
--- | ---
**Enable on an Azure subscription** | Plan 1 and 2
**Enable on a resource** | Plan 1 only. Plan 1 can be enabled and disabled at the resource level for Azure VMs and on-premises machines that are configured as Azure Arc-enabled VMs. This provides protection at machine level.<br/><br/>Plan 2 can't be enabled at the resource level, but you can disable protection for specific machines.


- After a plan is enabled, a 30-day trial period begins. There is no way to stop, pause, or extend this trial period. To enjoy the full 30-day trial, plan ahead to meet your evaluation goals.
- When you enable a Defender for Servers plan, the Defender for Endpoint sensor is automatically installed on all supported machines connected to Defender for Cloud. You can disable automatic provisioning if you need to.
- Defender Vulnerability Management is enabled by default on machines with the Defender for Endpoint sensor installed.

## Next steps

[Deploy Defender for Servers](tutorial-enable-servers-plan.md).
