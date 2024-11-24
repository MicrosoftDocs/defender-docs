---
title: Overview of Defender for Servers in Microsoft Defender for Cloud
description: Get a quick overview of the Defender for Servers plan in Microsoft Defender for Cloud
ms.topic: conceptual
ms.author: elkrieger
author: elazark
ms.date: 10/20/2024
# customer intent: I want to understand how the Defender for Servers plan in Defender for Cloud can help reduce security risk and protect against threats.
---

# Defender for Servers

The Defender for Servers plan in [Microsoft Defender for Cloud](defender-for-cloud-introduction.md) reduces security risk and exposure for machines in your organization by providing actionable recommendations to improve and remediate security posture. Defender for Servers also helps to protect machines against real-time security threats and attacks.

> [!NOTE]
> - Defender for Servers previously used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)), or the Azure Monitoring Agent (AMA) (in preview) to collect information from machines.
> - Support for using these agents in Defender for Servers has ended. For most plan features, the use of these agents is replaced by [agentless machine scanning](concept-agentless-data-collection.md), or by [integration with Microsoft Defender for Endpoint](integration-defender-for-endpoint.md).

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

This default integration allows Defender for Servers to take advantage of the endpoint detection and response (EDR) capabilities of Defender for Endpoint, and the vulnerability scanning, software inventory, and premium features provided by Defender for Vulnerability Management.

[Learn more](integration-defender-for-endpoint.md) about the integration.

## Defender for Servers plans

Defender for Servers offers two plans:

- **Defender for Servers Plan 1** is entry-level, and focuses on the EDR capabilities provided by the Defender for Endpoint integration.
- **Defender for Servers Plan 2** provides the same features as Plan 1, and additional capabilities.

## Plan protection features

Plan features are summarized in the table. 

**Feature** | **Plan support** | **Details**
--- | --- | ---
**Multicloud and hybrid support** | Supported in Plan 1 and 2 | Defender for Servers can protect Azure VMs, AWS/GCP VMs, and on-premises machines connected to Defender for Cloud. <br/><br/> Review Defender for Servers [support and requirements](support-matrix-defender-for-servers.md).
**Defender for Endpoint automatic onboarding** | Supported in Plan 1 and 2 |  Defender for Cloud [automatically onboards machines to Defender for Endpoint](enable-defender-for-endpoint.md) by installing the Defender for Endpoint extension on connected machines.
**Defender for Endpoint EDR** | Supported in Plan 1 and 2 | Supported endpoints receive near real-time threat detection using Defender for Endpoint [EDR](/defender-endpoint/overview-endpoint-detection-response) capabilities.
**Threat detection (OS-level)** | Supported in Plan 1 and 2 | Integration with Defender for Endpoint provides OS-level threat detection.
**Integrated alerts and incidents** | Supported in Plan 1 and 2 | Defender for Endpoint alerts and incidents for connected machines are displayed in Defender for Cloud, with drill-down in the Defender portal. [Learn more](concept-integration-365.md).
**Threat detection (Azure network layer)** | Supported in Plan 2 only  | Agentless detection detects threats that are directed at the control plane on the network, including [network-based security alerts](alerts-azure-network-layer.md) for Azure VMs.
**Software inventory discovery** | Supported in Plan 1 and 2 | [Software inventory](asset-inventory.md) discovery (provided by [Defender Vulnerability Management](/defender-vulnerability-management/tvm-software-inventory)) is integrated into Defender for Cloud.
**Vulnerability scanning (agent-based)** | Supported in Plan 1 and 2 | Using the Defender for Endpoint agent, Defender for Servers [assesses machines for vulnerabilities](auto-deploy-vulnerability-assessment.md) with Defender Vulnerability Management.
**Vulnerability scanning (agentless)** | Supported in Plan 2 only | As part of its [agentless scanning capabilities](concept-agentless-data-collection.md), Defender for Cloud provides [agentless vulnerability assessment](auto-deploy-vulnerability-assessment.md), using Defender Vulnerability Management.<br/><br/>Agentless assessment is in addition to agent-based vulnerability scanning.
**OS baseline misconfigurations** | OS recommendations based on [Linux](/security/benchmark/azure/baselines/virtual-machines-linux-virtual-machines-security-baseline) and [Windows](/security/benchmark/azure/baselines/virtual-machines-linux-virtual-machines-security-baseline) compute security baselines are supported in Plan 2 only.<br/><br/> Other MCSB recommendations in Defender for Cloud continue to be included in free foundational posture management. | Defender for Cloud assesses and enforces security configurations using [built-in Azure policy initiatives](policy-reference.md), including its default [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction) initiative.<br/><br/>Defender for Servers collects machine information using the [Azure machine configuration extension](/azure/virtual-machines/extensions/guest-configuration).
**Regulatory compliance assessment** | Supported in Plan 1 and 2 | As part of its free foundational posture management, Defender for Cloud provides a couple of [default compliance standards](concept-regulatory-compliance-standards.md#default-compliance-standards).<br/><br>If you have a Defender for Servers plan enabled (or any other paid plan), you can enable [additional compliance standards](concept-regulatory-compliance-standards.md).
**OS system updates** | Supported in Plan 2 only | Defender for Servers assesses machine to check that updates and patches are installed. It uses Azure Update Manager to gather update information.<br/><br/>To take advantage of Azure Update integration in Defender for Servers Plan 2, on-premises, AWS, and GCP machines should be onboarded with Azure Arc. [Learn more](enable-periodic-system-updates.md).
**Defender for Vulnerability Management premium features** | Supported in Plan 2 only | Defender for Servers Plan 2 includes [premium features](/defender-vulnerability-management/defender-vulnerability-management-capabilities) in Defender Vulnerability Management.<br/><br/>Premium features include certificate assessments, OS security baseline assessments, and more, and are available in the [Defender portal](https://security.microsoft.com/homepage) only.
**Malware scanning (agentless)** | Supported in Plan 2 only | In addition to the next-generation antimalware protection provided by the Defender for Endpoint integration, Defender for Servers Plan 2 provides [malware scanning](agentless-malware-scanning.md) as part of its [agentless scanning capabilities](concept-agentless-data-collection.md).
**Machine secrets scanning (agentless)** | Supported in Plan 2 only | As part of its [agentless secrets scanning capabilities](secrets-scanning.md), Defender for Cloud provides [machine secrets scanning](secrets-scanning-servers.md) to locate plain text secrets on machines.<br/><br/> Secrets scanning is also available with the Defender Cloud Security Posture Management (CSPM) plan.
**File integrity monitoring** | Supported in Plan 2 only | [File integrity monitoring](file-integrity-monitoring-overview.md) examines files and registries for changes that might indicate an attack. You configure file integrity monitoring after enabling Defender for Servers Plan 2.<br/><br/> File integrity monitoring uses the Defender for Endpoint extension to collect information. The previous collection method that used the MMA is now deprecated. [Learn more](migrate-file-integrity-monitoring.md) about migration to the Defender for Endpoint extension.
**Just-in-time virtual machine access** | Supported in Plan 2 only | [Just-in-time virtual machine access](just-in-time-access-overview.md) locks down machine ports to reduce the attack surface.
**Network map** | Supported in Plan 2 only | The [network map](protect-network-resources.md) provides a geographical view of recommendations for hardening your network resources.
**Free data ingestion (500 MB)** | Supported in Plan 2 only | Free data ingestion is available for specific data types in Log Analytics workspaces. [Learn more](data-ingestion-benefit.md)


## Deployment scope

We recommend enabling Defender for Servers at subscription level, but you can enable and disable Defender for Servers at resource level if you need deployment granularity.

You can enable and disable at the resource level as follows:

**Scope** | **Plan 1** | **Plan 2**
--- | --- | ---
**Enable for Azure subscription** | Yes | Yes
**Enable for resource** | Yes | No
**Disable for resource** | Yes | Yes

- Plan 1 can be enabled and disabled at resource level per server.
- Plan 2 can't be enabled at the resource level, but you can disable the plan at resource level.

## After enabling

After a plan is enabled.

- **Trial period**: 30-day trial period begins. There is no way to stop, pause, or extend this trial period. To enjoy the full 30-day trial, plan ahead to meet your evaluation goals.
- **Endpoint protection**: The Defender for Endpoint extension is automatically installed on all supported machines connected to Defender for Cloud. You can disable automatic provisioning if you need to.
- **Vulnerability assessment**: Defender Vulnerability Management is enabled by default on machines with the Defender for Endpoint extension installed.
- **Agentless scanning**: [Agentless scanning](concept-agentless-data-collection.md) is enabled by default when you turn on Defender for Servers Plan 2.
- **OS configuration assessment**: When you enable Defender for Servers Plan 2, Defender for Cloud [assesses operation system configuration settings](operating-system-misconfiguration.md) against compute security baselines in Microsoft Cloud Security Benchmark. To use this feature, machines must be running the Azure machine configuration extension. [Learn more](security-baseline-guest-configuration.md) about setting up the extension.
- **File integrity monitoring**: You set up [file integrity monitoring](file-integrity-monitoring-overview.md) after enabling Defender for Servers Plan 2.

## Next steps

- Learn how [Defender for Endpoint and Defender Vulnerability Management integrate into Defender for Cloud](integration-defender-for-endpoint.md). 
- [Plan your Defender for Servers deployment](plan-defender-for-servers.md).
