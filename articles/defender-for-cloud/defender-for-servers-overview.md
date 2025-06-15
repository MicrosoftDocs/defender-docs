---
title: Overview of Defender for Servers in Defender for Cloud
description: Get an overview of the Defender for Servers plan in Microsoft Defender for Cloud, including its features and integration with other Defender services.
ms.topic: concept-article
ms.author: elkrieger
author: elazark
ms.date: 06/04/2025
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

## Plan pricing

For Defender for Servers pricing, review the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

## Plan protection features

Plan features are summarized in the table.

| Feature | Plan 1 (P1) | Plan 2 (P2) | Cloud availability |
|--|--|--|--|
| **Multicloud and hybrid support** | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png":::| Defender for Servers protects VMs on Azure, AWS and GCP VMs, and on-premises machines connected to Microsoft Defender for Cloud. <br/><br/> Review Defender for Servers [support and requirements](support-matrix-defender-for-servers.md). |
| **Defender for Endpoint automatic onboarding** | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png":::|  |
| [Defender for Endpoint EDR](integration-defender-for-endpoint.md) | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS and GCP |
| [Integrated alerts and incidents](concept-integration-365.md) | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS and GCP |
| [Software inventory discovery](asset-inventory.md) <sup>[1](#footnote1)</sup> | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS and GCP |
| [Regulatory compliance assessment](concept-regulatory-compliance-standards.md) | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Different standards are available for different environments. Learn more about [compliance cloud availability](concept-regulatory-compliance-standards.md#available-compliance-standards). |
| [Vulnerability scanning (agent-based)](auto-deploy-vulnerability-assessment.md) | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS and GCP |
| OS baseline misconfigurations based on [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction) recommendations <sup>[2](#footnote2)</sup> | :::image type="icon" source="./media/icons/yes-icon.png":::  | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS |
| OS recommendations based on [Linux](/security/benchmark/azure/baselines/virtual-machines-linux-virtual-machines-security-baseline) and [Windows](/security/benchmark/azure/baselines/virtual-machines-linux-virtual-machines-security-baseline) compute security baselines | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS |
| [Vulnerability scanning (agentless)](concept-agentless-data-collection.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS and GCP |
| [Threat detection (Azure network layer)](alerts-azure-network-layer.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure |
| [OS system updates](enable-periodic-system-updates.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP and on-premises <sup>[3](#footnote3)</sup> |
| [Defender for Vulnerability Management premium features](/defender-vulnerability-management/defender-vulnerability-management-capabilities) <sup>[4](#footnote4)</sup> | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | |
| [Malware scanning (agentless)](agentless-malware-scanning.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS and GCP |
| Machine secrets scanning (agentless) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS and GCP |
| [File integrity monitoring](file-integrity-monitoring-overview.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: |  |
| [Just-in-time virtual machine access](just-in-time-access-overview.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure and AWS |
| [Network map](protect-network-resources.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure |
| [Free data ingestion (500 MB)](data-ingestion-benefit.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: |  |

<sup><a name="footnote1"></a>1</sup> Software inventory discovery (provided by [Defender Vulnerability Management](/defender-vulnerability-management/tvm-software-inventory)) is integrated into Defender for Cloud. <br>
<sup><a name="footnote2"></a>2</sup> OS baseline misconfigurations for MCSB are included in the [free foundational posture management](concept-cloud-security-posture-management.md). <br>
<sup><a name="footnote3"></a>3</sup> To take advantage of Azure Update integration in Defender for Servers Plan 2, on-premises, AWS, and GCP machines should be onboarded with Azure Arc. [Learn more](enable-periodic-system-updates.md). <br>
<sup><a name="footnote4"></a>4</sup> Is only available in the [Defender portal](https://security.microsoft.com/homepage).

## Deployment scope

You should [enable Defender for Servers](tutorial-enable-servers-plan.md) at the subscription level, but you can enable and disable Defender for Servers at the resource level if you need deployment granularity, as follows:

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
