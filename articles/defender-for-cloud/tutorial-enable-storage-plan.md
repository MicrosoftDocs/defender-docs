---
title: Deploy Microsoft Defender for Storage
description: Learn how to enable Microsoft Defender for Storage on your Azure subscription for Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.date: 05/13/2025
---

# Deploy Microsoft Defender for Storage

Microsoft Defender for Storage is an Azure-native solution. It offers an advanced layer of intelligence for detecting and mitigating threats in storage accounts. It uses [Microsoft Defender Threat Intelligence](https://www.microsoft.com/security/business/siem-and-xdr/microsoft-defender-threat-intelligence/), Microsoft Defender Antivirus technologies, and sensitive data discovery. It helps protect the Azure Blob Storage, Azure Files, and Azure Data Lake Storage services.

Defender for Storage provides a comprehensive alert suite, near-real-time malware scanning (as an add-on), and sensitive-data threat detection at no extra cost. You can use these features to quickly detect, assess, and respond to potential security threats with detailed information. This ability helps prevent major impacts on your data and workload, including malicious file uploads, sensitive data exfiltration, and data corruption.

Organizations can customize their protection and enforce consistent security policies by enabling Defender for Storage on subscriptions and storage accounts with granular control and flexibility.

> [!TIP]
> If you're currently using the classic Defender for Storage plan, consider [migrating to the new plan](defender-for-storage-classic-migrate.md). The new plan offers several benefits over the classic plan.

To learn about pricing and regional availability, check out the [Microsoft Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also estimate costs by using the [Defender for Cloud cost calculator](cost-calculator.md).

## Prerequisites

Before you enable Defender for Storage, ensure that you have the necessary permissions and other prerequisites in place. For more information, see [Prerequisites for Microsoft Defender for Storage](support-matrix-defender-for-storage.md).

## Setup and configuration options

To enable and configure Defender for Storage and to ensure maximum protection and cost optimization, you can use these available options:

- Enable or disable Defender for Storage at the subscription level or the storage account level.
- Enable or disable the configurable features for malware scanning and sensitive-data threat detection.
- Set a monthly cap on the malware scanning per storage account per month for controlling costs. (The default value is 10,000 GB.)
- Configure methods to set up a response to malware scanning results.
- Configure methods for logging malware scanning results. The malware scanning feature has advanced configurations to help security teams support various workflows and requirements.
- [Override subscription-level settings to configure specific storage accounts](advanced-configurations-for-malware-scanning.md#override-defender-for-storage-subscription-level-settings). You can use custom configurations that differ from the settings configured at the subscription level.

## Deployment methods

There are several ways to enable and configure Defender for Storage. The following links provide direct access to enablement pages for each supported deployment method:

- [Azure built-in policy](defender-for-storage-policy-enablement.md) (recommended)
- Infrastructure as code (IaC) templates, including:
  - [Terraform](defender-for-storage-infrastructure-as-code-enablement.md?tabs=enable-subscription#terraform-template)
  - [Bicep](defender-for-storage-infrastructure-as-code-enablement.md?tabs=enable-subscription#bicep-template)
  - [Azure Resource Manager](defender-for-storage-infrastructure-as-code-enablement.md?tabs=enable-subscription#azure-resource-manager-template)
- [Azure portal](defender-for-storage-azure-portal-enablement.md?tabs=enable-subscription)
- [Azure PowerShell](defender-for-storage-powershell-enablement.md??tabs=enable-subscription)
- [REST API](defender-for-storage-rest-api-enablement.md?tabs=enable-subscription)

We recommend that you enable Defender for Storage via a policy. This method facilitates enablement at scale. It also ensures that a consistent security policy is applied across all existing and future storage accounts within the defined scope, such as entire management groups. This approach keeps the storage accounts protected with Defender for Storage according to your organization's defined configuration.

## View your current coverage

Defender for Cloud provides access to [workbooks](custom-dashboards-azure-workbooks.md) through [Azure workbooks](/azure/azure-monitor/visualize/workbooks-overview). Workbooks are customizable reports that provide insights into your security posture.

The [coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook) helps you understand your current coverage by showing which plans are enabled on your subscriptions and resources.

## Related content

- Learn how to [enable and configure the Defender for Storage plan at scale by using an Azure built-in policy](defender-for-storage-policy-enablement.md).
