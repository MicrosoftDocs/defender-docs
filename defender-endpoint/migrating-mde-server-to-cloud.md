---
title: Migrate servers from Microsoft Defender for Endpoint to Microsoft Defender for Servers
description: Learn how to migrate servers from Microsoft Defender for Endpoint for servers to Microsoft Defender for Servers.
author: emmwalshh
ms.author: ewalsh
manager: deniseb
audience: ITPro
ms.topic: how-to
ms.service: defender-endpoint
ms.subservice: onboard
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
ms.custom: migrationguides
ms.date: 03/26/2025
search.appverid: met150
---

# Migrate servers from Microsoft Defender for Endpoint to Microsoft Defender for Servers

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

This article describes how to migrate your servers from Defender for Endpoint to Defender for Servers.

[Defender for Endpoint](microsoft-defender-endpoint.md) is an enterprise endpoint security platform designed to help organizations prevent, detect, investigate, and respond to advanced threats. The Defender for Endpoint for servers license enables you to onboard a server to Defender for Endpoint.

[Defender for Servers](/azure/defender-for-cloud/defender-for-servers-overview) is part of the [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction) offering, a solution for cloud security posture management (CSPM) and cloud workload protection (CWP) that finds weak spots across your cloud configuration. Defender for Cloud also helps strengthen the overall security posture of your environment, and can protect workloads across multicloud and hybrid environments from evolving threats.

While both Defender for Endpoint for servers and Defender for Servers offer server protection capabilities, Defender for Servers is our primary solution to protect servers.

## How do I migrate my servers from Defender for Endpoint to Defender for Cloud?

If you have servers onboarded to Defender for Endpoint, the migration process varies depending on machine type, but there's a set of shared prerequisites. Defender for Cloud is a subscription-based service in the [Microsoft Azure portal](https://portal.azure.com). Therefore, Defender for Cloud and underlying plans like Defender for Servers Plan 1 or Plan 2 need to be enabled on Azure subscriptions.

### Before you enable Defender for Cloud

Before you enable Defender for Cloud, it's important to know how to manage antivirus policies and define any needed exclusions. See the following articles:

- [Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus](mde-security-settings-management.md)
- [Manage Microsoft Defender Antivirus in your business](configuration-management-reference-microsoft-defender-antivirus.md)
- [Defender for Endpoint exclusions](navigate-defender-endpoint-antivirus-exclusions.md)
- [Managing exclusions reference](managing-exclusions.md)
- [Troubleshoot performance issues related to real-time protection](troubleshoot-performance-issues.md)
- [Review event logs and error codes to troubleshoot issues with Microsoft Defender Antivirus](troubleshoot-microsoft-defender-antivirus.yml)

### Enable Defender for Servers for Azure VMs and non-Azure machines

To enable Defender for Servers for Azure VMs and non-Azure servers connected through [Azure Arc-enabled servers](/azure/azure-arc/servers/overview), follow this guidance:

1. If you aren't already using Azure, plan your environment following the [Azure Well-Architected Framework](/azure/architecture/framework/).

2. Enable [Defender for Cloud](/azure/defender-for-cloud/get-started) on your subscription.

3. [Enable a Defender for Servers plan on your subscription](/azure/defender-for-cloud/enable-enhanced-security). In case you're using Defender for Servers Plan 2, make sure to also enable it on the Log Analytics workspace your machines are connected to. It enables you to use optional features, like [File Integrity Monitoring](/azure/defender-for-cloud/file-integrity-monitoring-overview).

4. Make sure the [Defender for Endpoint integration](/azure/defender-for-cloud/integration-defender-for-endpoint) is enabled on your subscription. If you have preexisting Azure subscriptions, you might see one or both of the two opt-in buttons shown in the following image:

   :::image type="content" source="media/mde-integration.png" alt-text="Screenshot that shows how to enable Defender for Endpoint integration." lightbox="media/mde-integration.png":::

   If you have either of these buttons in your environment, make sure to enable integration for both. On new subscriptions, both options are enabled by default, and you don't see these buttons in your environment.

5. If you're planning to use Azure Arc, make sure the connectivity requirements are met. Defender for Cloud requires all on-premises and non-Azure machines to be connected using the Azure Arc agent. In addition, Azure Arc doesn't support all Defender for Endpoint supported operating systems. For help with your planning process, see [Azure Arc deployments](/azure/azure-arc/servers/plan-at-scale-deployment).

6. (*Recommended*) If you want to see vulnerability findings in Defender for Cloud, make sure to enable [vulnerability assessment](/azure/defender-for-cloud/monitoring-components?tabs=autoprovision-va#vulnerability-assessment) in Defender for Cloud.

   :::image type="content" source="media/enable-threat-and-vulnerability-management.png" alt-text="Screenshot that shows how to enable vulnerability management." lightbox="media/enable-threat-and-vulnerability-management.png"::: 

## How do I migrate existing Azure VMs to Defender for Cloud?

For Azure VMs, no extra steps are required. These devices are automatically onboarded to Defender for Cloud because of the native integration between the Azure platform and Defender for Cloud.

See [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint).

## How do I migrate on-premises machines to Defender for Servers?

You have several options. 

- Use direct onboarding in Defender for Cloud. See [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint).
- Create a connection to Azure using Azure Arc. See [Connect your non-Azure machines to Microsoft Defender for Cloud](/azure/defender-for-cloud/quickstart-onboard-machines).

## How do I migrate VMs from AWS or GCP environments?

If you're using Amazon Web Services (AWS) or Google Cloud Platform (GCP), follow these steps to migrate those VMs:

1. Create a new multicloud connector on your subscription. For more information about this connector, see [AWS accounts](/azure/defender-for-cloud/quickstart-onboard-aws?pivots=env-settings) or [GCP projects](/azure/defender-for-cloud/quickstart-onboard-gcp?pivots=env-settings).

2. On your multicloud connector, enable Defender for Servers on [AWS](/azure/defender-for-cloud/quickstart-onboard-aws?pivots=env-settings#prerequisites) or [GCP](/azure/defender-for-cloud/quickstart-onboard-gcp?pivots=env-settings#configure-the-servers-plan) connectors.

3. Enable autoprovisioning on the multicloud connector for the Azure Arc agent, Defender for Endpoint extension, and Vulnerability Assessment. For Defender for Servers Plan 2, enable agentless machine scanning.

   :::image type="content" source="media/select-plans-aws-gcp.png" alt-text="Screenshot that shows how to enable autoprovisioning for Azure Arc agent." lightbox="media/select-plans-aws-gcp.png":::
   
For more information, see the following resources:

- [Defender for Cloud's multicloud capabilities](https://aka.ms/mdcmc)
- [Connect your non-Azure machines to Microsoft Defender for Cloud](/azure/defender-for-cloud/quickstart-onboard-machines)

## What happens once all migration steps are completed?

After you complete the relevant migration steps, Defender for Cloud deploys the `MDE.Windows` or `MDE.Linux` extension to your Azure VMs and non-Azure machines connected through Azure Arc (including VMs in AWS and GCP compute).

The extension acts as a management and deployment interface, which orchestrates and wraps the Defender for Endpoint installation scripts inside the operating system and reflects its provisioning state to the Azure management plane. The installation process recognizes an existing Defender for Endpoint installation and connects it to Defender for Cloud by automatically adding Defender for Endpoint service tags.

In case you have devices running Windows Server 2012 R2 or Windows Server 2016, and those devices are provisioned with the legacy, Log Analytics-based Defender for Endpoint solution, Defender for Cloud's deployment process deploys the Defender for Endpoint [unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2). After successful deployment, it stops and disables the legacy Defender for Endpoint process (`MsSense.exe`) on these machines.

## See also

- [Defender for Cloud: Enable Defender for Endpoint integration](/azure/defender-for-cloud/enable-defender-for-endpoint)
- [Defender for Cloud: Agentless machine scanning](/azure/defender-for-cloud/concept-agentless-data-collection)
- [Defender for Cloud: Remediate Defender for Endpoint misconfigurations (agentless)](/azure/defender-for-cloud/endpoint-detection-misconfiguration)
- [Onboard servers through Microsoft Defender for Endpoint's onboarding experience](onboard-server.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
