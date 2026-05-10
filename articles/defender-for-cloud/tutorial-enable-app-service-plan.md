---
title: Protect your applications with Microsoft Defender for App Service
description: Learn how to enable the Microsoft Defender for App Service plan on your Azure subscription to detect threats targeting your web apps and APIs.
ms.topic: install-set-up-deploy
ms.date: 05/10/2026
author: ElazarK
ms.author: elkrieger
#customer intent: As an Azure administrator, I want to enable Microsoft Defender for App Service so that I can detect threats targeting my web applications.
---

# Protect your applications with Microsoft Defender for App Service

Microsoft Defender for App Service uses cloud scale to identify attacks that target applications running on [Azure App Service](https://azure.microsoft.com/services/app-service/). Requests to Azure applications pass through gateways that inspect and log traffic before routing it to your environment. This data helps identify exploits and attackers, and it helps learn new patterns.

When you enable Defender for App Service, you get these capabilities:

- **Secure** - Defender for App Service assesses the resources covered by your App Service plan and generates security recommendations based on its findings. Use the detailed instructions in these recommendations to harden your App Service resources.

- **Detect** - Defender for App Service detects many threats to your App Service resources by monitoring:
  - The virtual machine (VM) instance in which your App Service is running, and its management interface
  - The requests and responses sent to and from your App Service apps.
  - The underlying sandboxes and VMs.
  - App Service internal logs - available because of the visibility that Azure has as a cloud provider.

As a cloud-native solution, Defender for App Service can identify attack methods that apply to multiple targets. From a single host, it's hard to identify a distributed attack from a small subset of Internet Protocol (IP) addresses that crawl similar endpoints across multiple hosts.

Together, the log data and infrastructure can show the full attack story, from a new attack in the wild to compromises on customer machines. Even if you deploy Microsoft Defender for App Service after a web app is exploited, it might still detect ongoing attacks.

Learn more about Defender for Cloud pricing on the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

## Prerequisites

- Use an Azure subscription. If you don't have one, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- Enable [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- Use an App Service plan that runs on one of these tiers: Standard, Premium v2, Premium v3, or Isolated (App Service Environment v1, v2, or v3).

- Free, Shared, and Basic App Service plans aren't supported by Defender for App Service.

  For more information on App Service plans and tiers, see [Azure App Service plans](/azure/app-service/overview-hosting-plans).

- For billing details, note that Defender for App Service billing applies to supported plans only: Standard, Premium v2, Premium v3, and Isolated (App Service Environment v1, v2, v3). Billing is calculated according to the total compute instances in supported plans.

- For deep alert investigation, consider enabling diagnostic settings on your App Service resources so you can review HTTP traffic, application events, and platform activity during incidents. Consider your expected log volume and destination because these diagnostics can incur additional storage costs. For investigation guidance specific to Defender for App Service, see [App Service diagnostics for alert investigation](defender-for-app-service-introduction.md#app-service-diagnostics-for-alert-investigation). For setup steps and destination options, see [Enable diagnostic logging for apps in Azure App Service](/azure/app-service/troubleshoot-diagnostic-logs).

## Enable the Defender for App Service plan

When you enable Defender for Cloud, you can add the Defender for App Service plan to your subscription to get security monitoring and threat detection for your web apps and application programming interfaces (APIs).

To enable Defender for App Service on your subscription:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. On the Defender plans page, toggle the App Service plan to **On**.

    :::image type="content" source="media/tutorial-enable-app-service-plan/enable-app-service.png" alt-text="Screenshot of the Microsoft Defender for Cloud Environment settings page showing the Defender plans section with the App Service plan toggle switched to On." lightbox="media/tutorial-enable-app-service-plan/enable-app-service.png":::

1. Select **Save**.

## Next step

- [Overview of Defender for App Service to protect your Azure App Service web apps and APIs](defender-for-app-service-introduction.md)
