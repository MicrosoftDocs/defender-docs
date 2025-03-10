---
title: Overview of Defender for Servers in Defender for Cloud
description: Get an overview of the Defender for Servers plan in Microsoft Defender for Cloud, including its features and integration with other Defender services.
ms.topic: concept-article
ms.author: elkrieger
author: elazark
ms.date: 03/10/2025
# customer intent: I want to understand how the Defender for Servers plan in Defender for Cloud can help reduce security risk and protect against threats.
---

# Defender for Servers

The Defender for Servers plan in Microsoft Defender for Cloud reduces security risk and exposure for machines in your organization. It provides recommendations to improve and remediate security posture. Defender for Servers also protects machines against real-time security threats and attacks.

> [!NOTE]
> Support for the Log Analytics agent and Azure Monitoring Agent (AMA) in Defender for Servers has ended. For most plan features, these agents are replaced by [agentless machine scanning](concept-agentless-data-collection.md), or by [integration with Microsoft Defender for Endpoint](integration-defender-for-endpoint.md).

## Benefits

Defender for Servers offers several security benefits.

- **Protect multicloud and on-premises machines**: Defender for Servers protects Windows and Linux machines in multicloud environments (Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP)) and on-premises.
- **Centralize management and reporting**: Defender for Cloud offers a single view of monitored resources, including machines protected by Defender for Servers. Filter, sort, and cross-reference data to understand, investigate, and analyze machine security.
- **Integrate with Defender services**: Defender for Servers integrates with security capabilities provided by Defender for Endpoint and Microsoft Defender Vulnerability Management.
- **Improve posture and reduce risk**: Defender for Servers assesses the security posture of machines against compliance standards and provides security recommendations to remediate and improve security posture.
- **Benefit from agentless scanning**: Defender for Servers Plan 2 provides agentless machine scanning. Without an agent on endpoints, scan software inventory, assess machines for vulnerabilities, scan for machine secrets, and detect malware threats.
- **Protect against threats in near real-time**: Defender for Servers identifies and analyzes real-time threats and issues security alerts as needed.
- **Get intelligent threat detection**: Defender for Cloud evaluates events and detects threats using advanced security analytics and machine-learning technologies with multiple threat intelligence sources, including the [Microsoft Security Response Center (MSRC)](https://www.microsoft.com/msrc).

## Defender for Endpoint integration

Defender for Endpoint and Defender for Vulnerability Management integrate into Defender for Cloud.

This integration allows Defender for Servers to use the endpoint detection and response (EDR) capabilities of Defender for Endpoint. It also enables vulnerability scanning, software inventory, and premium features provided by Defender for Vulnerability Management.

[Learn more](integration-defender-for-endpoint.md) about the integration.

## Defender for Servers plans

Defender for Servers offers two plans:

- **Defender for Servers Plan 1** is entry-level and focuses on the EDR capabilities provided by the Defender for Endpoint integration.
- **Defender for Servers Plan 2** provides the same features as Plan 1 and other capabilities.

## Plan protection features

Plan features are summarized in the table.

**Feature** | **Plan support** | **Details**
--- | --- | ---
**Multicloud and hybrid support** | Supported in Plan 1 and 2 | Defender for Servers can protect Azure VMs, AWS/GCP VMs, and on-premises machines connected to Microsoft Defender for Cloud. <br/><br/> Review Defender for Servers [support and requirements](support-matrix-defender-for-servers.md).
**Defender for Endpoint automatic onboarding** | Supported in Plan 1 and 2 | Microsoft Defender for Cloud [automatically onboards machines to Defender for Endpoint](enable-defender-for-endpoint.md) by installing the Defender for Endpoint extension on connected machines.
**Defender for Endpoint EDR** | Supported in Plan 1 and 2 | Supported endpoints receive near real-time threat detection using Defender for Endpoint's [EDR](/defender-endpoint/overview-endpoint-detection-response) capabilities.
**Threat detection (OS-level)** | Supported in Plan 1 and 2 | Defender for Endpoint integration provides OS-level threat detection.
**Integrated alerts and incidents** | Supported in Plan 1 and 2 | Defender for Endpoint alerts and incidents for connected machines are displayed in Microsoft Defender for Cloud, with drill-down in the Defender portal. [Learn more](concept-integration-365.md).
**Threat detection (Azure network layer)** | Supported in Plan 2 only  | Agentless detection identifies threats directed at the control plane on the network, including [network-based security alerts](alerts-azure-network-layer.md) for Azure VMs.
**Software inventory discovery** | Supported in Plan 1 and 2 | [Software inventory](asset-inventory.md) discovery (provided by [Defender Vulnerability Management](/defender-vulnerability-management/tvm-software-inventory)) is integrated into Defender for Cloud.
**Vulnerability scanning (agent-based)** | Supported in Plan 1 and 2 | The Defender for Endpoint agent allows Defender for Servers to [assess machines for vulnerabilities](auto-deploy-vulnerability-assessment.md) with Defender Vulnerability Management.
**Vulnerability scanning (agentless)** | Supported in Plan 2 only | As part of its [agentless scanning capabilities](concept-agentless-data-collection.md), Defender for Cloud provides [agentless vulnerability assessment](auto-deploy-vulnerability-assessment.md), using Defender Vulnerability Management.<br/><br/>Agentless assessment is in addition to agent-based vulnerability scanning.
**OS baseline misconfigurations** | OS recommendations based on [Linux](/security/benchmark/azure/baselines/virtual-machines-linux-virtual-machines-security-baseline) and [Windows](/security/benchmark/azure/baselines/virtual-machines-linux-virtual-machines-security-baseline) compute security baselines are supported in Plan 2 only.<br/><br/> Other MCSB recommendations in Defender for Cloud continue to be included in free foundational posture management. | Defender for Cloud assesses and enforces security configurations using [built-in Azure policy initiatives](policy-reference.md), including its default [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction) initiative.<br/><br/>Defender for Servers collects machine information using the [Azure machine configuration extension](/azure/virtual-machines/extensions/guest-configuration).
**Regulatory compliance assessment** | Supported in Plan 1 and 2 | As part of its free foundational posture management, Defender for Cloud provides a couple of [default compliance standards](concept-regulatory-compliance-standards.md#default-compliance-standards).<br/><br>If you have a Defender for Servers plan enabled (or any other paid plan), you can enable [other compliance standards](concept-regulatory-compliance-standards.md).
**OS system updates** | Supported in Plan 2 only | Defender for Servers assesses machine to check that updates and patches are installed. It uses Azure Update Manager to gather update information.<br/><br/>To take advantage of Azure Update integration in Defender for Servers Plan 2, on-premises, AWS, and GCP machines should be onboarded with Azure Arc. [Learn more](enable-periodic-system-updates.md).
**Defender for Vulnerability Management premium features** | Supported in Plan 2 only | Defender for Servers Plan 2 includes [premium features](/defender-vulnerability-management/defender-vulnerability-management-capabilities) in Defender Vulnerability Management.<br/><br/>Premium features include certificate assessments, OS security baseline assessments, and more, and are available in the [Defender portal](https://security.microsoft.com/homepage) only.
**Malware scanning (agentless)** | Supported in Plan 2 only | In addition to the next-generation anti-malware protection provided by the Defender for Endpoint integration, Defender for Servers Plan 2 provides [malware scanning](agentless-malware-scanning.md) as part of its [agentless scanning capabilities](concept-agentless-data-collection.md).
**Machine secrets scanning (agentless)** | Supported in Plan 2 only | As part of its [agentless secrets scanning capabilities](secrets-scanning.md), Defender for Cloud provides [machine secrets scanning](secrets-scanning-servers.md) to locate plain text secrets on machines.<br/><br/> Secrets scanning is also available with the Defender Cloud Security Posture Management (CSPM) plan.
**File integrity monitoring** | Supported in Plan 2 only | [File integrity monitoring](file-integrity-monitoring-overview.md) examines files and registries for changes that might indicate an attack. You configure file integrity monitoring after enabling Defender for Servers Plan 2.<br/><br/> File integrity monitoring uses the Defender for Endpoint extension to collect information. The previous collection method that used the MMA is now deprecated. [Learn more](migrate-file-integrity-monitoring.md) about migration to the Defender for Endpoint extension.
**Just-in-time virtual machine access** | Supported in Plan 2 only | [Just-in-time virtual machine access](just-in-time-access-overview.md) locks down machine ports to reduce the attack surface.
**Network map** | Supported in Plan 2 only | The [network map](protect-network-resources.md) provides a geographical view of recommendations for hardening your network resources.
**Free data ingestion (500 MB)** | Supported in Plan 2 only | Free data ingestion is available for specific data types in Log Analytics workspaces. [Learn more](data-ingestion-benefit.md).

## Deployment scope

Enable Defender for Servers at the subscription level, but you can enable and disable Defender for Servers at the resource level if you need deployment granularity, as follows:

**Scope** | **Plan 1** | **Plan 2**
--- | --- | ---
**Enable for an Azure subscription** | Yes | Yes
**Enable for a resource** | Yes | No
**Disable for a resource** | Yes | Yes

- Enable and disable Plan 1 at the resource level per server.
- Plan 2 can't be enabled at the resource level, but you can disable it at the resource level.

## After enabling

After you enable a Defender for Servers plan, the following rules apply:

- **Trial period**: A 30-day trial period begins. You can't stop, pause, or extend this trial period. To enjoy the full 30-day trial, plan ahead to meet your evaluation goals.
- **Endpoint protection**: Microsoft Defender for Endpoint extension is automatically installed on all supported machines connected to Microsoft Defender for Cloud. Disable automatic provisioning if needed.
- **Vulnerability assessment**: Microsoft Defender Vulnerability Management is enabled by default on machines with the Microsoft Defender for Endpoint extension installed.
- **Agentless scanning**: [Agentless scanning](concept-agentless-data-collection.md) is enabled by default when you enable Defender for Servers Plan 2.
- **OS configuration assessment**: When you enable Defender for Servers Plan 2, Microsoft Defender for Cloud [assesses operation system configuration settings](operating-system-misconfiguration.md) against compute security baselines in Microsoft Cloud Security Benchmark. To use this feature, machines must run the Azure Machine Configuration extension. [Learn more](security-baseline-guest-configuration.md) about setting up the extension.
- **File integrity monitoring**: You set up [file integrity monitoring](file-integrity-monitoring-overview.md) after enabling Defender for Servers Plan 2.

## Related content

- [Plan your Defender for Servers deployment](plan-defender-for-servers.md).
- Review [common questions](faq-defender-for-servers.yml) about Defender for Servers.
