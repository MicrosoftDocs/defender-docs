---
title: Defender for Servers in Microsoft Defender for Cloud
description: Get a quick overview of the Defender for Servers plan in Microsoft Defender for Cloud
ms.topic: conceptual
ms.author: dacurwin
author: dcurwin
ms.date: 11/20/2023
---

# Overview - Defender for Servers

The Defender for Servers plan in Microsoft Defender for Cloud reduces risk and exposure with security recommendations and best practices to improve and harden your multicloud security posture. Defender for Servers also provides comprehensive protection against real-time threats and attacks.

> [!NOTE]
> - Some features in Defender for Servers use the Log Analytics agent, also known as the Microsoft Monitoring Agent (MMA) in general availability (GA), and the Azure Monitoring Agent (AMA) (in preview), to gather information from machines.
> - Support for these agents is ending, and in most features will be replaced by [agentless machine scanning](concept-agentless-data-collection.md), or by [integration with the Microsoft Defender for Endpoint sensor](integration-defender-for-endpoint.md)..
> - [Learn more](prepare-deprecation-log-analytics-mma-agent.md) about upcoming agent deprecation.

## Defender for Server benefits

- **Protect multicloud and on-premises machines**: Defender for Servers protects Windows and Linux machines that run in multicloud and hybrid environments, including Azure, AWS, GCP, and on-premises.
- **Centralize management and reporting**: In Defender for Cloud you can get a single view of all monitoring resources, including servers protected by the Defender for Servers plan. You can filter, soft, and cross-reference data to dig into resource security posture.
- **Protect against threats in real-time**: Defender for Servers applies known patterns to discover malicious behavior that deviates from established norms and conforms to potential attack vectors. Defender for Server identifies and analyzes potential real-time threats by a number of means, and issues security alerts as needed. [Learn more](alerts-overview.md) about security alerts.
- **Get intelligent threat detection**: Defender for Cloud uses advanced security analytics and machine-learning technologies from multiple sources, such as Microsoft Security Response Center (MSRC), to evaluate events and detect threats across multicloud and hybrid environments.
- **Improve posture management and reduce risk**: Defender for Servers takes advantage of Defender for Cloud posture management capabilities to improve the security posture of protected servers. Server settings are assessed against compliance standards, and actionable security recommendations help you to improve machine  posture. 
- **Integrate with other Defender services**: Defender for Servers integrates natively with Microsoft Defender for Endpoint and Microsoft Defender Vulnerability Management. Defender for Servers security alerts integrate into Defender XDR.
- **Take advantage of agentless scanning**: Defender for Servers Plan 2 provides agentless machine scanning. Without needing an agent running on endpoints, you can your software inventory, assess machines for vulnerabilities, scan for secrets, and detect malware threats.

## Defender for Endpoint integration

Defender for Servers integrates natively with Microsoft Defender for Endpoint and Microsoft Defender for Vulnerability Management. This default integration allows Defender for Servers to take advantage of the endpoint detection and response (EDR) capabilities of Defender for Endpoint, and the vulnerability scanning, software inventory, and premium features provided by Defender for Vulnerability Management.

- **Licensing**: Defender for Servers covers licensing for Defender for Endpoint Plan 2. Licensing is charged per hour instead of per seat, lowering costs by protecting VMs only when they're in use.
- **Agent provisioning**: Defender for Cloud can automatically provision the Defender for Endpoint sensor on supported machines that are connected to Defender for Cloud.
- **Unified alerts in Defender XDR**: With the integration, alerts and vulnerability data from Defender for Endpoint appear in the Defender for Cloud dashboard. You can move to the Defender portal to drill down into more detailed alert information


## Defender for Servers plans

Defender for Servers offers two plans:

- **Defender for Servers Plan 1** is entry-level, and focuses on the EDR capabilities provided by the Defender for Endpoint integration.
- **Defender for Servers Plan 2** provides the same features as plan one, and more extended capabilities.


## Plan protection features

**Area** | **Plan support** | **Details**
--- | --- | ---
**Defender protection** | Plan 1,2 | Integrated protection features include:<br/><br/>**Automatic onboarding** of the Defender for Endpoint sensor on supported machines connected to Defender for Cloud.<br/><br/><br/><br/> **Integration of alerts and data** in Defender for Cloud and Defender XDR.<br/><br/>Defender Vulnerability Management features that include:<br/>- **[Continuous vulnerability monitoring](/defender-vulnerability-management/defender-vulnerability-management)**  <br/> - **[Software inventory discovery](/defender-vulnerability-management/tvm-software-inventory)**.<br/><br/> Defender for Endpoint protection features, including:<br/> - **[Attack surface reduction rules](/defender-endpoint/attack-surface-reduction)**<br/> - **Threat protection** from [Internet-based network](/defender-endpoint/network-protection) and [web](/defender-endpoint/web-protection-overview) threats.<br/>- **[Next-generation](/defender-endpoint/next-generation-protection)** antimalware and antivirus protection.<br/>- **[EDR capabilities](/defender-endpoint/overview-endpoint-detection-response)** to provide real-time, actionable detection and response.
**Defender for Vulnerability Management premium  features** | Plan 2 | Defender for Servers Plan 2 includes [premium features](/defender-vulnerability-management/defender-vulnerability-management-capabilities) in Defender Vulnerability Management.<br/><br/>Premium features include certificate assessments, OS security baseline assessments, and more.<br/><br/> Premium features are available in the [Defender portal](https://security.microsoft.com/homepage) only.
**Agentless scanning** | Plan 2 | Defender for Servers Plan 2 provides [agentless machine scanning](concept-agentless-data-collection) that includes:<br/><br/>- [Agentless machine vulnerability scanning](auto-deploy-vulnerability-assessment.md), in addition to the vulnerability scanning provided by Defender Vulnerability Management.<br/><br/> - [Agentless malware scanning](agentless-malware-scanning.md) to detect malware and viruses on supported machines.<br/><br/>[Agentless secrets scanning](secrets-scanning.md) to locate plain text secrets in protected machines.<br/><br/> Agentless vulnerability scanning and secrets scanning is also available in the Defender CSPM plan.
**Third-party vulnerability monitoring** |  Defender for Cloud also supports vulnerability scanning with a [bring your own licence (BYOL) solution](deploy-vulnerability-assessment-byol-vm.md) for Azure VMs only. Azure Arc-enabled VMs aren't supported. Supported solutions include [Qualys](https://www.qualys.com/lp/azure) and [Rapid7](https://www.rapid7.com/products/insightvm/).
**Threat detection (Azure network layer)** | Plan 2 | Defender for Server uses agentless detection to detect threats that are directed at the control plan on the network, including [network-based security alerts](alerts-azure-network-layer.md) for Azure VMs. 
**Threat detection** | Plan 1, 2 | In addition to OS-level monitoring provided by Defender for Endpoint integration, Defender for Servers provides fileless attack detection to identify fileless attack toolkits, techniques, and behaviors.

**OS misconfigurations** | Plan 1, 2 | Defender for Servers uses the free foundational posture capabilities of Defender for Cloud that collects operating system information from VMs and checks the information against standards in the Microsoft Cloud Security Benchmark.


**File integrity monitoring** | Plan 2 | [File integrity monitoring](file-integrity-monitoring-overview.md) examines files and registries for changes that might indicate an attack.<br/><br/>A new version of this feature, using the Defender for Endpoint agent that's integrated with Defender for Servers will be released in preview around August 2024.[Learn more](prepare-deprecation-log-analytics-mma-agent.md).
**[Just-in-time virtual machine access](just-in-time-access-overview.md)** | Plan 2 | Just-in-time virtual machine access locks down machine ports to reduce the attack surface. 
**[Adaptive network hardening](adaptive-network-hardening.md)** | Plan 2 | Network hardening filters traffic to and from resources by using network security groups (NSGs) to improve network security posture. 
**[Docker host hardening](harden-docker-hosts.md)** | Plan 2  | Assesses containers hosted on Linux machines running Docker containers, and then compares them with the Center for Internet Security (CIS) Docker Benchmark.



 - FIM, JIM
500 MB

- Agentlessly scan machines for vulnerabilities,


  and secrets.


using cloud APIs to collect data.<br/><br/> Also available in the Defender CSPM plan.

<br/><br/> Also available in the Defender CSPM plan.









**Regulatory compliance** | Plan 1, 2 | By default Defender for Cloud enables a couple of [default compliance standards](concept-regulatory-compliance-standards.md#default-compliance-standards). You can enable [additional compliance standards](concept-regulatory-compliance-standards.md#available-compliance-standards) if you have Defender for Servers, or any other Defender for Cloud plan enabled.

**Network map** | Plan 2 only | Provides a geographical [network map](protect-network-resources.md) view of recommendations for hardening your network resources.
**[Adaptive application controls](adaptive-application-controls.md)** | Plan 2 only | Adaptive application controls define allowlists of known safe applications for machines. To use this feature, Defender for Cloud must be enabled on the subscription. 
**Free data ingestion (500 MB)** | Plan 2 only | Free data ingestion is available for [specific data types](faq-defender-for-servers.yml#what-data-types-are-included-in-the-daily-allowance-) to Log Analytics workspaces.<br/>- Data ingestion is calculated per node, per reported workspace, and per day.<br/>- It's available for every workspace that has a *Security* or *AntiMalware* solution installed. 
**Free Azure Update Manager Remediation for Arc machines** | Plan 2 only | [Azure Update Manager remediation of unhealthy resources and recommendations](/azure/update-center/update-manager-faq#im-a-defender-for-server-customer-and-use-update-recommendations-powered-by-azure-update-manager-namely-periodic-assessment-should-be-enabled-on-your-machines-and-system-updates-should-be-installed-on-your-machines-would-i-be-charged-for-azure-update-manager) is available at no additional cost for Arc enabled machines.




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
