---
title: Overview of Defender for Servers in Microsoft Defender for Cloud
description: Get a quick overview of the Defender for Servers plan in Microsoft Defender for Cloud
ms.topic: conceptual
ms.author: elkrieger
author: elazark
ms.date: 10/20/2024
# customer intent: I want to understand how the Defender for Servers plan in Defender for Cloud can help reduce security risk and protect against threats.
---

# Overview - Defender for Servers

The Defender for Servers plan in [Microsoft Defender for Cloud](defender-for-cloud-introduction.md) reduces organizational security risk and exposure with security recommendations to improve security posture. Defender for Servers also provides protection against real-time security threats and attacks.

> [!NOTE]
> - Defender for Servers previously used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)), or the Azure Monitoring Agent (AMA) (in preview) to collect information from machines.
> - Support for using these agents in Defender for Servers is ending.
> - For most plan features, the use of agents is replaced by [agentless machine scanning](concept-agentless-data-collection.md), or by [integration with Microsoft Defender for Endpoint](integration-defender-for-endpoint.md).
> - [Learn more](prepare-deprecation-log-analytics-mma-agent.md) about feature changes.

## Defender for Server benefits

Defender for Servers provides a number of security benefits.

- **Protect multicloud and on-premises machines**: Defender for Servers protects Windows and Linux machines in multicloud environments (Azure, AWS, GCP), and on-premises.
- **Centralize management and reporting**: Defender for Cloud provides a single view of monitored resources, including machines protected by Defender for Servers. You can filter, sort, and cross-reference data to investigate and analyze asset security.
- **Integrate with Defender services**: Defender for Servers integrates natively with security capabilities provided by Defender for Endpoint and Microsoft Defender Vulnerability Management.
- **Improve posture and reduce risk**: Defender for Servers assesses the security posture of machines against compliance standards, and provides actionable security recommendations to remediate and improve security posture.
- **Benefit from agentless scanning**: Defender for Servers Plan 2 provides agentless machine scanning. With no need for an agent on endpoints, you can scan software inventory, assess machines for vulnerabilities, scan for machine secrets, and detect malware threats.
- **Protect against threats in near real-time**: Defender for Servers identifies and analyzes real-time threats, and issues security alerts as needed.
- **Get intelligent threat detection**: Defender for Cloud evaluates events and detects threats using advanced security analytics and machine-learning technologies with multiple threat intelligence sources, including [Microsoft Security Response Center (MSRC)](https://www.microsoft.com/msrc).


## Defender for Endpoint integration

Defender for Endpoint and Defender for Vulnerability Management integrate natively into Defender for Cloud.

This default integration allows Defender for Servers to take advantage of the endpoint detection and response (EDR) capabilities of Defender for Endpoint, and the vulnerability scanning, software inventory, and premium features provided by Defender for Vulnerability Management. [Learn more](integration-defender-for-endpoint.md).


## Defender for Servers plans

Defender for Servers offers two plans:

- **Defender for Servers Plan 1** is entry-level, and focuses on the EDR capabilities provided by the Defender for Endpoint integration.
- **Defender for Servers Plan 2** provides the same features as Plan 1, and additional capabilities.

## Plan protection features

Plan features are summarized in the table. Some plan features have upcoming changes to the way that information is collected. Review the table, and read about [upcoming deprecations](prepare-deprecation-log-analytics-mma-agent.md).

**Feature** | **Plan support** | **Details**
--- | --- | --- 
**Multicloud and hybrid support** | Supported in Plan 1 and 2 | Defender for Servers can protect Azure VMs, AWS/GCP machines connected to Defender for Cloud, and on-premises machines onboarded as Azure Arc-enabled VMs.<br/><br/> Review Defender for Servers [support and requirements](support-matrix-defender-for-servers.md).
**Automatic onboarding** | Supported in Plan 1 and 2 | Defender for Cloud can [automatically onboard machines to Defender for Endpoint](enable-defender-for-endpoint.md) by installing the Defender for Endpoint sensor on machines.
**Integrated alerts and incidents** | Supported in Plan 1 and 2 | Defender for Endpoint alerts and incidents for connected machines are displayed in Defender for Cloud, with drill-down in the Defender portal.
**Software inventory discovery** | Supported in Plan 1 and 2 | [Software inventory](asset-inventory.md) discovery provided by [Defender Vulnerability Management](/defender-vulnerability-management/tvm-software-inventory) is integrated into Defender for Cloud.
**Vulnerability scanning (agent-based)** | Supported in Plan 1 and 2 | Defender for Servers [assesses machines for vulnerabilities](auto-deploy-vulnerability-assessment.md) with [Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management), using the Defender for Endpoint agent.
**Vulnerability scanning (agentless)** | Supported in Plan 2 only | As part of its [agentless scanning capabilities](concept-agentless-data-collection.md), Defender for Cloud provides [agentless vulnerability assessment](auto-deploy-vulnerability-assessment.md) with Defender Vulnerability Management. Agentless assessment is in addition to agent-based vulnerability scanning.
**OS baseline misconfigurations** | Supported in Plan 2 only | Defender for Cloud assesses and enforces security configurations using [built-in Azure policy initiatives](policy-reference.md), including its default [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction) initiative.<br/><br/>Defender for Servers collects machine informatio using the [Azure machine configuration extension](/azure/virtual-machines/extensions/guest-configuration). The older collection method with the MMA will be deprecated in Defender for Cloud in November 2024. Support for assessing misconfigurations in Docker hub and Azure virtual machine scale sets will also be deprecated in November. <br/><br/> For OS recommendations based on [Linux](/security/benchmark/azure/baselines/virtual-machines-linux-virtual-machines-security-baseline) and [Windows](/security/benchmark/azure/baselines/virtual-machines-linux-virtual-machines-security-baseline) compute security baselines in the MCSB, Defender for Servers Plan 2 must be enabled. Other MCSB recommendations in Defender for Cloud continue to be included in free foundational posture management.
**Regulatory compliance assessment** | Supported in Plan 1 and 2 | As part of its foundational posture assessment, Defender for Cloud provides a couple of [default compliance standards](concept-regulatory-compliance-standards.md#default-compliance-standards). If you have a Defender for Servers plan enabled (or any other paid plan), you can enable [additional compliance standards](concept-regulatory-compliance-standards.md).
**OS system updates** | Supported in Plan 2 only | Defender for Servers assesses machine to check that updates and patches are installed. It uses Azure Update Manager to gather update information. The former method that uses the MMA to gather data is now deprecated.<br/><br/> To take advantage of Azure Update integration in Defender for Servers Plan 2, on-premises, AWS, and GCP machines should be onboarded with Azure Arc. [Learn more](enable-periodic-system-updates.md).
**Defender for Vulnerability Management premium features** | Plan 2 only | Defender for Servers Plan 2 includes [premium features](/defender-vulnerability-management/defender-vulnerability-management-capabilities) in Defender Vulnerability Management. Premium features include certificate assessments, OS security baseline assessments, and more, and are available in the [Defender portal](https://security.microsoft.com/homepage) only.
**Endpoint detection and response** | Supported in Plan 1 and 2 | Defender for Servers integrates Defender for Endpoint [EDR](/defender-endpoint/overview-endpoint-detection-response) capabilities to provide near real-time threat detection for supported endpoints.
**Malware scanning (agentless)** | Supported in Plan 2 only | In addition to the next-generation antimalware protection provided by the Defender for Endpoint integration, Defender for Servers Plan 2 provides [malware scanning](agentless-malware-scanning.md) as part of its [agentless scanning capabilities](concept-agentless-data-collection.md) capabilities.
**Machine secrets scanning (agentless)** | Supported in Plan 2 only | As part of its [agentless secrets scanning capabilities](secrets-scanning.md), Defender for Cloud provides [machine secrets scanning](secrets-scanning-servers.md) to locate plain text secrets on machines.<br/><br/> Secrets scanning is also available with the Defender Cloud Security Posture Management (CSPM) plan.
**Threat detection (OS-level)** | Supported in Plan 1 and 2 | Integration with Defender for Endpoint provides OS-level threat detection.
**Threat detection (Azure network layer)** | Supported in Plan 2 only  | Defender for Servers uses agentless detection to detect threats that are directed at the control plan on the network, including [network-based security alerts](alerts-azure-network-layer.md) for Azure VMs. 
**File integrity monitoring** | Supported in Plan 2 only | [File integrity monitoring](file-integrity-monitoring-overview.md) examines files and registries for changes that might indicate an attack. You configure file integrity monitoring after enabling Defender for Servers Plan 2.<br/> File integrity monitoring uses the Defender for Endpoint sensor to collect information. The previous collection method that used the MMA is now deprecated. [Learn more](migrate-file-integrity-monitoring.md).
**Just-in-time virtual machine access** | Supported in Plan 2 only | [Just-in-time virtual machine access](just-in-time-access-overview.md) locks down machine ports to reduce the attack surface. 
**Network map** | Plan 2 only | The [network map](protect-network-resources.md) provides a geographical view of recommendations for hardening your network resources.
**Free data ingestion (500 MB)** | Supported in Plan 2 only | Free data ingestion is available for [specific data types](faq-defender-for-servers.yml#what-data-types-are-included-in-the-daily-allowance-) in Log Analytics workspaces.<br/><br/>  The benefit is available for every machines running the Azure Monitor agent (AMA) that's located in a subscription that has Defender for Servers Plan 2 enabled.<br/><br/> The benefit is granted to the Log Analytics workspace to which the machine reports. If the machine reports to more than one workspace, the benefit is only granted to one of them.<br/><br/>- Data ingestion is calculated per node, per reported workspace, and per day.<br/><br/>- The relevant workspace should have the *Security* or *AntiMalware* solution installed. [Learn](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/how-to-configure-security-events-collection-with-azure-monitor/ba-p/3770719) how to enable the Security solution.


## Enabling deployment scope

We recommend enabling Defender for Servers at subscription level, but you can enable and disable Defender for Servers at resource level as follows.

**Scope** | **Plan 1** | **Plan 2**
--- | --- | ---
**Enable for Azure subscription** | Yes | Yes
**Enable for resource** | Yes | No
**Disable for resource** | Yes | Yes

- Plan 1 can be enabled and disabled at resource level per server.
- Plan 2 can't be enabled at the resource level, but you can disable the plan at resource level.

This option allows you to:

- Manage Defender for Server protection at machine level.
- Exclude specific machines in a subscription from the plan.
- Enable both Plan 1 and Plan 2 within a subscription. You can enable Plan 2 at the subscription level, and then downgrade specific machines to Plan 1.


## After enabling

After a plan is enabled.

- **Trial period**: 30-day trial period begins. There is no way to stop, pause, or extend this trial period. To enjoy the full 30-day trial, plan ahead to meet your evaluation goals.
- **Endpoint protection**: The Defender for Endpoint sensor is automatically installed on all supported machines connected to Defender for Cloud. You can disable automatic provisioning if you need to.
- **Vulnerability assessment**: Defender Vulnerability Management is enabled by default on machines with the Defender for Endpoint sensor installed.
- **Azure Policy machine configuration**: The [Azure Policy machine configuration](/azure/virtual-machines/extensions/guest-configuration) (formerly known as the Azure Policy guest configuration) provides a set of built-in policies that help you to assess and enforce security configurations for machines. [Learn more](security-baseline-guest-configuration.md) about enabling machine configuration.

## Next steps

[Deploy Defender for Servers](tutorial-enable-servers-plan.md).
