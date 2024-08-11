---
title: Defender for Servers in Microsoft Defender for Cloud
description: Get a quick overview of the Defender for Servers plan in Microsoft Defender for Cloud
ms.topic: conceptual
ms.author: dacurwin
author: dcurwin
ms.date: 11/20/2023
---

# Overview - Defender for Servers

The Defender for Servers plan in Microsoft Defender for Cloud reduces risk and exposure with security recommendations and best practices to improve and harden your multicloud security posture. It also provides comprehensive protection against real-time threats and attacks.


## Feature support

- Some features in Defender for Servers use the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) for feature support. The MMA is set to retire in August 2024.
- In addition, some features in Defender for Servers use the Azure Monitoring Agent (AMA) in preview. These features will be deprecated by August 2024
- Where possible, features that use the MMA and AMA will be redesigned to use either [agentless scanning](concept-agentless-data-collection.md), or the [Microsoft Defender for Endpoint agent integrated into Defender for Servers](integration-defender-for-endpoint.md).
- [Learn more](/prepare-deprecation-log-analytics-mma-agent.md) about upcoming agent deprecation.

## Benefits

- **Multicloud and hybrid protection**: Defender for Servers protects Windows and Linux machines that run in multicloud and hybrid environments, including Azure, AWS, GCP, and on-premises.
- **Centralized management and reporting**: In Defender for Cloud you can get a single view of all monitoring resources, including servers protected by the Defender for Servers plan. You can filter, soft, and cross-reference data to dig into resource security posture.
- **Real-time threat protection**: Defender for Servers applies known patterns to discover malicious behavior that deviates from established norms and conforms to potential attack vectors. Defender for Server identifies and analyzes potential real-time threats by a number of means, and issues security alerts as needed. [Learn more](alerts-overview.md) about security alerts.
- **Intelligent threat detection**: Defender for Cloud uses advanced security analytics and machine-learning technologies from multiple sources, such as Microsoft Security Response Center (MSRC), to evaluate events and detect threats across multicloud and hybrid environments.
- **Posture management**: Defender for Servers takes advantage of Defender for Cloud posture management capabilities to improve the security posture of protected servers. Server settings are assessed against compliance standards, and actionable security recommendations help you to improve machine  posture. 
- **Defender integration**: Defender for Servers integrates natively with Microsoft Defender for Endpoint and Microsoft Defender Vulnerability Management. 
- **Agentless scanning**: Defender for Servers Plan 2 adds agentless machine scanning to scan your software inventory, scan machines for vulnerabilities, scan for secrets, and detect malware threats.

## Defender for Endpoint integration

Defender for Servers integration with Microsoft Defender for Endpoint allows Defender for Servers to take advantage of the endpoint detection and response (EDR) capabilities of Defender for Endpoint, and the vulnerability scanning, software inventory, and premium features of Defender for Vulnerability Management.

- **Licensing**: Defender for Servers covers licensing for Defender for Endpoint. Licensing is charged per hour instead of per seat, lowering costs by protecting VMs only when they're in use.
- **Agent provisioning**: Defender for Cloud supports automatic provisioning of the Defender for Endpoint agent on supported machines that are connected to Defender for Cloud.
- **Unified alerts in Defender XDR**: With the integration, alerts and vulnerability data from Defender for Endpoint appear in the Defender for Cloud dashboard. You can move to the Defender portal to drill down into more detailed alert information


## Defender for Servers plans

Defender for Servers offers two plans:

- **Defender for Servers Plan 1** is entry-level, and focuses on the endpoint detection and response capabilities provided by the Defender for Endpoint integration. 
- **Defender for Servers Plan 2** provides the same features as plan one, and more extended detection and response capabilities.


## Plan protection features

**Area** | **Plan support** | **Details**
--- | --- | --- 
**Defender for Endpoint capabilities** | Plan 1,2 | Defender for Servers integrates Defender for Endpoint Plan 2 to provide protection, detection, and response capabilities. Features include:<br/><br/>- **Threat and vulnerability management** with [Defender Vulnerability Management](/defender/defender-vulnerability-management/defender-vulnerability-management).<br/>-  [Attack surface reduction](/defender/defender-endpoint/attack-surface-reduction), with reduction rules to protect endpoints.<br/>- **Threat protection**, including endpoint protection from [Internet-based network events](/defender/defender-endpoint/network-protection) and [web threats](/defender/defender-endpoint/web-protection-overview). <br/>- **Next-generation protection** providing [antimalware and antivirus protection](/defender/defender-endpoint/next-generation-protection). <br/>- **[EDR capabilities](defender/defender-endpoint/overview-endpoint-detection-response)**, to provide real-time, actionable detection and response.
**OS-level threat protection** | Plan 1, 2 | In addition to OS-level monitoring provided by Defender for Endpoint integration, Defender for Servers provides fileless attack detection to identify fileless attack toolkits, techniques, and behaviors.
**Security baseline assessment** Plan 1, 2 | Defender for Vulnerability Management provides a customizable profile that you can create to assess endpoint settings against security benchmarks.
**File integrity monitoring** | Plan 2 | [File integrity monitoring](file-integrity-monitoring-overview.md) examines files and registries for changes that might indicate an attack.<br/><br/>A new version of this feature, using the Defender for Endpoint agent that's integrated with Defender for Servers will be released in preview around August 2024.[Learn more](prepare-deprecation-log-analytics-mma-agent.md).
**Agentless malware detection** | Plan 2 | To broaden coverage provided by malware detection in Defender for Endpoint, Defender for Servers provides agentless [malware scanning](agentless-malware-scanning) to detect malware and viruses on supported machines.<br/><br/> Also available in the Defender CSPM plan.
**Vulnerability scanning (agent-based)** | Agent-based scanning | Plan 1, 2 | Defender for Servers provides machine vulnerability scanning with Defender Vulnerability Management, using the Defender for Endpoint agent.<br/>br/> Defender for Cloud also supports vulnerability scanning with a [bring your own licence (BYOL) solution](deploy-vulnerability-assessment-byol-vm.md) for [Qualys](https://www.qualys.com/lp/azure) and [Rapid7](https://www.rapid7.com/products/insightvm/).
**Vulnerability scanning (agentless)**| Plan 2 | Defender for Servers Plan 2 provides [agentless machine vulnerability scanning](auto-deploy-vulnerability-assessment.md) using cloud APIs to collect data.<br/><br/> Also available in the Defender CSPM plan.
**Premium vulnerability management features** | Plan 2 | Defender for Servers Plan 2 includes [premium vulnerability management](/defender/defender-vulnerability-management/defender-vulnerability-management-capabilities) capabilities from Defender Vulnerability Management.<br/><br/> Premium features are available in the [Defender portal](https://security.microsoft.com/homepage) only.
**Secrets scanning** | Plan 2 | Agentless [secrets scanning](secrets-scanning.md) to locate plain text secrets in protected machines.<br/><br/> Also available in the Defender CSPM plan.
**Threat detection (Azure network layer)**  | Plan 2 |  Defender for Servers detects threats that are at the network layer.
**OS misconfigurations** | Plan 1, 2 | Defender for Servers uses the free foundational posture capabilities of Defender for Cloud that collects operating system information from VMs and checks the information against standards in the Microsoft Cloud Security Benchmark.
**Regulatory compliance** | Plan 1, 2 | By default Defender for Cloud enables a couple of [default compliance standards](concept-regulatory-compliance-standards.md#default-compliance-standards). You can enable [additional compliance standards](concept-regulatory-compliance-standards.md#available-compliance-standards) if you have Defender for Servers, or any other Defender for Cloud plan enabled.
**[Adaptive network hardening](adaptive-network-hardening.md)** | Plan 2 | Network hardening filters traffic to and from resources by using network security groups (NSGs) to improve network security posture. 
**[Just-in-time virtual machine access](just-in-time-access-overview.md)** |Plan 2 | Just-in-time virtual machine access locks down machine ports to reduce the attack surface. 
**[Docker host hardening](harden-docker-hosts.md)** | Plan 2  | Assesses containers hosted on Linux machines running Docker containers, and then compares them with the Center for Internet Security (CIS) Docker Benchmark.
**Network map** | Plan 2 only | Provides a geographical [network map](protect-network-resources.md) view of recommendations for hardening your network resources.
**[Adaptive application controls](adaptive-application-controls.md)** | Plan 2 only | Adaptive application controls define allowlists of known safe applications for machines. To use this feature, Defender for Cloud must be enabled on the subscription. 
**Free data ingestion (500 MB)** | Plan 2 only | Free data ingestion is available for [specific data types](faq-defender-for-servers.yml#what-data-types-are-included-in-the-daily-allowance-) to Log Analytics workspaces.<br/>- Data ingestion is calculated per node, per reported workspace, and per day.<br/>- It's available for every workspace that has a *Security* or *AntiMalware* solution installed. 
**Free Azure Update Manager Remediation for Arc machines** | Plan 2 only | [Azure Update Manager remediation of unhealthy resources and recommendations](../update-center/update-manager-faq.md#im-a-defender-for-server-customer-and-use-update-recommendations-powered-by-azure-update-manager-namely-periodic-assessment-should-be-enabled-on-your-machines-and-system-updates-should-be-installed-on-your-machines-would-i-be-charged-for-azure-update-manager) is available at no additional cost for Arc enabled machines.




## Enabling plans

When you enable Defender for Servers you can select Plan 1 or Plan 2.

- A plan can be enabled for specific Azure resources: Azure VMs, on-premises machines onboarded as Azure Arc VMs, Azure VM scale sets flex.
- After a plan is enabled, a 30-day trial period begins. There is no way to stop, pause, or extend this trial period. To enjoy the full 30-day trial, plan ahead to meet your evaluation goals.
- When you enable a Defender for Servers plan, the Defender for Endpoint sensor is automatically provisioned on all supported machines connected to Defender for Cloud.
- When you enable a Defender for Servers plan, Defender Vulnerability Management is enabled by default on machines with the Defender for Endpoint sensor installed.
- Defender for Servers Plan 1:
    - Plan 1 can be enabled on Azure subscriptions, AWS accounts, and GCP projects connected to Defender for Cloud
    - Plan 1 can also be enabled and disabled at the resource level for Azure VMs, and for on-premises machines that are configured as Azure Arc-enabled VMs. This provides protection at machine level.
- Defender for Servers Plan 2:
    - Plan 2 can be enabled on Azure subscriptions, AWS accounts, and GCP projects connected to Defender for Cloud
    - The plan can't be enabled at the resource level, but you can disable protection for specific Azure VMs and on-premises machines that are configured as Azure Arc-enabled VMs.







## Next steps

[Deploy Defender for Servers](tutorial-enable-servers-plan.md).
