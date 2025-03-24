---
title: Migrate servers to Microsoft Defender for Servers
description: Learn how to migrate servers from Microsoft Defender for Endpoint for servers to Microsoft Defender for Servers.
author: denisebmsft
ms.author: deniseb
manager: deniseb
audience: ITPro
ms.topic: conceptual
ms.service: defender-endpoint
ms.subservice: onboard
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
ms.custom: migrationguides
ms.date: 03/24/2025
search.appverid: met150
---

# Migrate servers to Microsoft Defender for Servers

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

This article describes how to migrate your servers from Defender for Endpoint for servers to Defender for Servers.

[Defender for Endpoint](microsoft-defender-endpoint.md) is an enterprise endpoint security platform designed to help enterprise networks prevent, detect, investigate, and respond to advanced threats. The Defender for Endpoint for servers license enables you to onboard a server to Defender for Endpoint.

[Defender for Servers](/azure/defender-for-cloud/defender-for-servers-overview) is part of the [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction) offering, a solution for cloud security posture management (CSPM) and cloud workload protection (CWP) that finds weak spots across your cloud configuration. Defender for Cloud also helps strengthen the overall security posture of your environment, and can protect workloads across multicloud and hybrid environments from evolving threats.

While both Defender for Endpoint and Defender for Servers offer server protection capabilities, Defender for Servers is our primary solution to protect servers.

## How do I migrate my servers from Defender for Endpoint to Defender for Cloud?

If you have servers onboarded to Defender for Endpoint, the migration process varies depending on machine type, but there's a set of shared prerequisites. 

Defender for Cloud is a subscription-based service in the Microsoft Azure portal. Therefore, Defender for Cloud and the underlying plans like Defender for Servers Plan 2 need to be enabled on Azure subscriptions.

To enable Defender for Servers for Azure VMs and non-Azure machines connected through [Azure Arc-enabled servers](/azure/azure-arc/servers/overview), follow this guideline:

1. If you aren't already using Azure, plan your environment following the [Azure Well-Architected Framework](/azure/architecture/framework/).

2. Enable [Defender for Cloud](/azure/defender-for-cloud/get-started) on your subscription.

3. Enable a Defender for Servers plan on your [subscription](/azure/defender-for-cloud/enable-enhanced-security). In case you're using Defender for Servers Plan 2, make sure to also enable it on the Log Analytics workspace your machines are connected to. It enables you to use optional features like File Integrity Monitoring, Adaptive Application Controls, and more.

4. Make sure the [Defender for Endpoint integration](/azure/defender-for-cloud/integration-defender-for-endpoint?tabs=windows) is enabled on your subscription. If you have preexisting Azure subscriptions, you might see one (or both) of the two opt-in buttons shown in the following image:

     :::image type="content" source="media/mde-integration.png" alt-text="Screenshot that shows how to enable Defender for Endpoint integration." lightbox="media/mde-integration.png":::

   If you have any of these buttons in your environment, make sure to enable integration for both. On new subscriptions, both options are enabled by default. In this case, you don't see these buttons in your environment.

5. If you're planning to use Azure Arc, make sure the connectivity requirements are met. Defender for Cloud requires all on-premises and non-Azure machines to be connected via the Azure Arc agent. In addition, Azure Arc doesn't support all Defender for Endpoint supported operating systems. To help with your planning process, see [Azure Arc deployments](/azure/azure-arc/servers/plan-at-scale-deployment).

6. *Recommended:* If you want to see vulnerability findings in Defender for Cloud, make sure to enable [Microsoft Defender Vulnerability Management](/azure/defender-for-cloud/enable-data-collection?tabs=autoprovision-va) for Defender for Cloud.

   :::image type="content" source="media/enable-threat-and-vulnerability-management.png" alt-text="Screenshot that shows how to enable vulnerability management." lightbox="media/enable-threat-and-vulnerability-management.png"::: 

## How do I migrate existing Azure VMs to Defender for Cloud?

For Azure VMs, no extra steps are required. These devices are automatically onboarded to Defender for Cloud because of the native integration between the Azure platform and Defender for Cloud.

## How do I migrate on-premises machines to Defender for Servers?

You have several options. 

- Use direct onboarding in Defender for Cloud. See [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint).
- Create a connection to Azure using Azure Arc. See [Connect your non-Azure machines to Microsoft Defender for Cloud](/azure/defender-for-cloud/quickstart-onboard-machines).

## How do I migrate VMs from AWS or GCP environments?

1. Create a new multicloud connector on your subscription. For more information on connector, see [AWS accounts](/azure/defender-for-cloud/quickstart-onboard-aws?pivots=env-settings) or [GCP projects](/azure/defender-for-cloud/quickstart-onboard-gcp?pivots=env-settings).

2. On your multicloud connector, enable Defender for Servers on [AWS](/azure/defender-for-cloud/quickstart-onboard-aws?pivots=env-settings#prerequisites) or [GCP](/azure/defender-for-cloud/quickstart-onboard-gcp?pivots=env-settings#configure-the-servers-plan) connectors.

3. Enable autoprovisioning on the multicloud connector for the Azure Arc agent, Defender for Endpoint extension, Vulnerability Assessment and, optionally, Log Analytics extension.

   :::image type="content" source="media/select-plans-aws-gcp.png" alt-text="Screenshot that shows how to enable autoprovisioning for Azure Arc agent." lightbox="media/select-plans-aws-gcp.png":::

   For more information, see [Defender for Cloud's multicloud capabilities](https://aka.ms/mdcmc).

## What happens once all migration steps are completed?

After you complete the relevant migration steps, Defender for Cloud deploys the `MDE.Windows` or `MDE.Linux` extension to your Azure VMs and non-Azure machines connected through Azure Arc (including VMs in AWS and GCP compute).

The extension acts as a management and deployment interface, which orchestrates and wraps the Defender for Endpoint installation scripts inside the operating system and reflect its provisioning state to the Azure management plane. The installation process recognizes an existing Defender for Endpoint installation and connects it to Defender for Cloud by automatically adding Defender for Endpoint service tags.

In case you have devices running Windows Server 2012 R2 or Windows Server 2016, and those devices are provisioned with the legacy, Log Analytics-based Defender for Endpoint solution, Defender for Cloud's deployment process deploys the Defender for Endpoint [unified solution](configure-server-endpoints.md#functionality-in-the-modern-unified-solution). After successful deployment, it stops and disables the legacy Defender for Endpoint process on these machines.

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
