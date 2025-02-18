---
title: Deploy Microsoft Defender for Storage
description: Learn how to enable the Defender for Storage on your Azure subscription for Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.date: 10/10/2024
---

# Deploy Microsoft Defender for Storage

Microsoft Defender for Storage is an Azure-native solution. It offers an advanced layer of intelligence for detecting and mitigating threats in storage accounts. It uses [Microsoft Threat Intelligence](https://www.microsoft.com/insidetrack/blog/microsoft-uses-threat-intelligence-to-protect-detect-and-respond-to-threats/), Microsoft Defender Antimalware technologies, and Sensitive Data Discovery. It protects Azure Blob Storage, Azure Files, and Azure Data Lake Storage services. The service provides a comprehensive alert suite, near real-time malware scanning (as an add-on), and sensitive data threat detection at no extra cost. This allows you to quickly detect, assess, and respond to potential security threats with detailed information. It helps prevent major impacts on your data and workload, including malicious file uploads, sensitive data exfiltration, and data corruption.

With Microsoft Defender for Storage, organizations can customize their protection and enforce consistent security policies by enabling it on subscriptions and storage accounts with granular control and flexibility.

   > [!TIP]
   > If you're currently using Microsoft Defender for Storage classic, consider [migrating to the new plan](defender-for-storage-classic-migrate.md), which offers several benefits over the classic plan.

Check out the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/) to learn about pricing and regional availability.

## Prerequisites

Before you enable Microsoft Defender for Storage, ensure you have the necessary permissions and prerequisites in place. For more information, see [Prerequisites for Microsoft Defender for Storage](support-matrix-defender-for-storage.md).

## Set up and configure Microsoft Defender for Storage

To enable and configure Microsoft Defender for Storage and ensure maximum protection and cost optimization, the following configuration options are available:

- Enable/disable Microsoft Defender for Storage at the subscription and storage account levels.
- Enable/disable the malware scanning or sensitive data threat detection configurable features.
- Set a monthly cap ("capping") on the malware scanning per storage account per month for controlling costs (default value is 5,000 GB).
- Configure methods to set up response to malware scanning results.
- Configure methods for saving malware scanning results logging.

> [!TIP]
> The malware scanning feature has advanced configurations to help security teams support different workflows and requirements.

- [Override subscription-level settings to configure specific storage accounts](advanced-configurations-for-malware-scanning.md#override-defender-for-storage-subscription-level-settings) with custom configurations that differ from the settings configured at the subscription level.

There are several ways to enable and configure Defender for Storage:

- Using the [Azure built-in policy](defender-for-storage-policy-enablement.md) (the recommended method),
- Programmatically using Infrastructure as Code templates, including
  - [Terraform](defender-for-storage-infrastructure-as-code-enablement.md?tabs=enable-subscription#terraform-template)
  - [Bicep](defender-for-storage-infrastructure-as-code-enablement.md?tabs=enable-subscription#bicep-template)
  - [ARM](defender-for-storage-infrastructure-as-code-enablement.md?tabs=enable-subscription#azure-resource-manager-template) templates
- Using the [Azure portal](defender-for-storage-azure-portal-enablement.md?tabs=enable-subscription)
- Using [PowerShell](defender-for-storage-powershell-enablement.md??tabs=enable-subscription)
- Directly with the [REST API](defender-for-storage-rest-api-enablement.md?tabs=enable-subscription).

We recommend enabling Defender for Storage via a policy. This method facilitates enablement at scale and ensures a consistent security policy is applied across all existing and future storage accounts within the defined scope, such as entire management groups. This keeps the storage accounts protected with Defender for Storage according to the organization's defined configuration.

## Next steps

- Learn how to [enable and Configure the Defender for Storage plan at scale with an Azure built-in policy](defender-for-storage-policy-enablement.md).
