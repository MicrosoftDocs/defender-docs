---
title: Migrate servers from Microsoft Defender for Endpoint to Microsoft Defender for Servers
description: Learn how to migrate servers from Microsoft Defender for Endpoint for servers to Microsoft Defender for Servers.
author: limwainstein
ms.author: lwainstein
ms.topic: how-to
ms.service: defender-endpoint
ms.subservice: onboard
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
ms.custom: migrationguides, msecd-doc-authoring-1016
ms.date: 07/03/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
---

# Migrate servers from Microsoft Defender for Endpoint to Microsoft Defender for Servers

This article describes how to migrate your servers from Defender for Endpoint to Defender for Servers. Before you begin, review the [prerequisites](#before-you-enable-defender-for-cloud) and migration steps for your server type.

[Defender for Endpoint](microsoft-defender-endpoint.md) is an endpoint security platform. It helps organizations prevent, detect, and respond to advanced threats. With a Defender for Endpoint for servers license, you can onboard a server to Defender for Endpoint.

[Defender for Servers](/azure/defender-for-cloud/defender-for-servers-overview) is part of [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction). Defender for Cloud provides cloud security posture management (CSPM) and cloud workload protection (CWP). It finds weak spots in your cloud setup and helps protect workloads across multicloud and hybrid environments.

Both products offer server protection, but Defender for Servers is our primary solution to protect servers.

## How do I migrate my servers from Defender for Endpoint to Defender for Cloud?

If you have servers onboarded to Defender for Endpoint, the migration steps depend on the machine type. However, all machines share a set of prerequisites. Defender for Cloud is a subscription-based service in the [Microsoft Azure portal](https://portal.azure.com). You must enable Defender for Cloud and a Defender for Servers plan (Plan 1 or Plan 2) on your Azure subscriptions.

### Before you enable Defender for Cloud

Before you enable Defender for Cloud, it's important to know how to manage antivirus policies and define any needed exclusions. See the following articles:

- <a href="/intune/intune-service/protect/mde-security-integration" target="_blank" rel="noopener noreferrer">Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus</a>
- [Manage Microsoft Defender Antivirus in your business](configuration-management-reference-microsoft-defender-antivirus.md)
- [Defender for Endpoint exclusions](defender-endpoint-exclusions-overview.md)
- [Managing exclusions reference](defender-endpoint-exclusions-configuration-reference.md)
- [Troubleshoot performance issues related to real-time protection](troubleshoot-performance-issues.md)
- [Review event logs and error codes to troubleshoot issues with Microsoft Defender Antivirus](troubleshoot-microsoft-defender-antivirus.yml)

### Enable Defender for Servers for Azure VMs and non-Azure machines

To enable Defender for Servers for Azure VMs and non-Azure servers connected through [Azure Arc-enabled servers](/azure/azure-arc/servers/overview), follow this guidance:

1. If you aren't already using Azure, plan your environment following the [Azure Well-Architected Framework](/azure/architecture/framework/).
1. Enable [Defender for Cloud](/azure/defender-for-cloud/get-started) on your subscription.

1. [Enable a Defender for Servers plan on your subscription](/azure/defender-for-cloud/enable-enhanced-security). In case you're using Defender for Servers Plan 2, make sure to also enable it on the Log Analytics workspace your machines are connected to. Enabling Defender for Servers Plan 2 on the Log Analytics workspace lets you use optional features, like [File Integrity Monitoring](/azure/defender-for-cloud/file-integrity-monitoring-overview).

1. Make sure the [Defender for Endpoint integration](/azure/defender-for-cloud/integration-defender-for-endpoint) is enabled on your subscription. If you have preexisting Azure subscriptions, you might see one or both opt-in buttons for **Allow MDE access to EWACS data** and **Allow MDE Unified Agent for EWACS** as shown in the following image:

   :::image type="content" source="media/mde-integration.png" alt-text="Screenshot that shows how to enable Defender for Endpoint integration." lightbox="media/mde-integration.png":::

   If you see either of these opt-in buttons in your environment, make sure to enable integration for both. On new subscriptions, both options are enabled by default, and the buttons don't appear.

1. If you plan to use Azure Arc, check that the connectivity requirements are met. Defender for Cloud requires all on-premises and non-Azure machines to connect through the Azure Arc agent. Azure Arc doesn't support every operating system that Defender for Endpoint supports. For planning help, see [Azure Arc deployments](/azure/azure-arc/servers/plan-at-scale-deployment).

1. (*Recommended*) If you want to see vulnerability findings in Defender for Cloud, make sure to enable [vulnerability assessment](/azure/defender-for-cloud/monitoring-components?tabs=autoprovision-va#vulnerability-assessment) in Defender for Cloud.

   :::image type="content" source="media/enable-threat-and-vulnerability-management.png" alt-text="Screenshot that shows how to enable vulnerability management." lightbox="media/enable-threat-and-vulnerability-management.png"::: 

## How do I migrate existing Azure VMs to Defender for Cloud?

For Azure VMs, no extra steps are required. These devices are automatically onboarded to Defender for Cloud because of the native integration between the Azure platform and Defender for Cloud.

See [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint).

## How do I migrate on-premises machines to Defender for Servers?

For on-premises machines, you have several onboarding options:

- Use direct onboarding in Defender for Cloud. See [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint).
- Create a connection to Azure using Azure Arc. See [Connect your non-Azure machines to Microsoft Defender for Cloud](/azure/defender-for-cloud/quickstart-onboard-machines).

## How do I migrate VMs from AWS or GCP environments?

If you're using Amazon Web Services (AWS) or Google Cloud Platform (GCP), follow these steps to migrate those VMs:

1. Create a multicloud connector on your subscription. To learn more, see [AWS accounts](/azure/defender-for-cloud/quickstart-onboard-aws?pivots=env-settings) or [GCP projects](/azure/defender-for-cloud/quickstart-onboard-gcp?pivots=env-settings).

1. On the connector, turn on Defender for Servers for [AWS connectors](/azure/defender-for-cloud/quickstart-onboard-aws?pivots=env-settings#prerequisites) or [GCP connectors](/azure/defender-for-cloud/quickstart-onboard-gcp?pivots=env-settings#configure-the-servers-plan).

1. Turn on autoprovisioning on the connector for the Azure Arc agent, the Defender for Endpoint extension, and Vulnerability Assessment. If you use Defender for Servers Plan 2, also turn on agentless machine scanning.

   :::image type="content" source="media/select-plans-aws-gcp.png" alt-text="Screenshot that shows how to enable autoprovisioning for Azure Arc agent." lightbox="media/select-plans-aws-gcp.png":::
   
To learn more about multicloud support and onboarding non-Azure machines, see [Defender for Cloud's multicloud capabilities](https://aka.ms/mdcmc) and [Connect your non-Azure machines to Microsoft Defender for Cloud](/azure/defender-for-cloud/quickstart-onboard-machines).

## What happens once all migration steps are completed?

After you complete the migration steps, Defender for Cloud deploys the Defender for Endpoint extension for Windows (`MDE.Windows`) or Linux (`MDE.Linux`) to your Azure VMs and Arc-connected non-Azure machines. This includes VMs in AWS and GCP.

The extension serves as a management interface. It wraps the Defender for Endpoint install scripts inside the operating system and reports its status to the Azure management plane. If Defender for Endpoint is already installed, the process detects it and connects it to Defender for Cloud by adding Defender for Endpoint service tags.

Some devices might run Windows Server 2012 R2 or Windows Server 2016 with the legacy, Log Analytics-based Defender for Endpoint solution. For these devices, Defender for Cloud deploys the Defender for Endpoint [unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2). It then stops and disables the legacy process (`MsSense.exe`) on those machines.

## See also

For more details, see these related articles:

- [Defender for Cloud: Enable Defender for Endpoint integration](/azure/defender-for-cloud/enable-defender-for-endpoint)
- [Defender for Cloud: Agentless machine scanning](/azure/defender-for-cloud/concept-agentless-data-collection)
- [Defender for Cloud: Remediate Defender for Endpoint misconfigurations (agentless)](/azure/defender-for-cloud/endpoint-detection-misconfiguration)
- [Onboard servers through Microsoft Defender for Endpoint's onboarding experience](onboard-server.md)



