---
title: Review and remediate endpoint detection and response recommendations (agentless)
description: Identify and remediate security gaps in endpoint detection and response solutions on your virtual machine with Defender for Cloud recommendations.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 03/18/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how to review and remediate endpoint detection and response recommendations in order to ensure the security of my virtual machine.
---

# Remediate EDR solutions (agentless)

Microsoft Defender for Cloud provides agentless scanning of protected machines to [check that an endpoint detection and response (EDR) solution is installed](integration-defender-for-endpoint.md#assessing-edr-solutions). 

The EDR solution might be Microsoft Defender for Endpoint (integrated by default into Defender for Cloud), or a [supported third-party EDR solution](integration-defender-for-endpoint.md#supported-edr-solutions).

Based on EDR solution findings, Defender for Cloud provides [recommendations](integration-defender-for-endpoint.md#edr-solution-recommendations) to remediate any issues, and ensure that EDR solutons are installed and running correctly on VMs.


> [!NOTE]
>
> - Agentless scanning for EDR solution information replaces previous functionality that collected EDR solution information with the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)), in general availability (GA), or with the Azure Monitoring Agent (AMA), in preview.
> - The MMA is set to retire in August 2024. Data collection with the MMA will be deprecated in November 2024.
> - AMA preview support is now deprecated.


## Prerequisites

EDR recommendations are available when:

- [Defender for Cloud](connect-azure-subscription.md) is available in the Azure subscription.
- One of these Defender for Cloud plans is enabled:
  - [Defender for Servers Plan 2](tutorial-enable-servers-plan.md)
  - [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md)
- [Agentless scanning for machines](concept-agentless-data-collection.md) is turned on. It's enabled by default in the plans, but if you need to turn it on manually, [follow these instructions](enable-agentless-scanning-vms.md).


## Investigate EDR solution recommendations
.

1. In  **Defender for Cloud** > **Recommendations**.

1. Search for and select one of the following recommendations:

    - `EDR solution should be installed on Virtual Machines`
    - `EDR solution should be installed on EC2s`
    - `EDR solution should be installed on Virtual Machines (GCP)`

1. In the recommendation details, select the **Healthy resources** tab.

1. The EDR solution deployed on the machine is displayed in the **Discovered EDRs** column.

    :::image type="content" source="media/endpoint-detection-response/discovered-solutions.png" alt-text="Screenshot of the Healthy resources tab, which shows where you can see which endpoint detection and response solution is enabled on your machine." lightbox="media/endpoint-detection-response/discovered-solutions.png":::

## Remediate EDR solution recommendations

1. Select the relevant recommendation.

    :::image type="content" source="media/endpoint-detection-response/identify-recommendations.png" alt-text="Screenshot of the recommendations page showing the identified endpoint solution recommendations." lightbox="media/endpoint-detection-response/identify-recommendations.png":::

1. Select the relevant action to see the remediation steps.


## Enable Defender for Endpoint integration

This recommended action is available when Defender for Endpoint, or an [supported third-party EDR solution](integration-defender-for-endpoint.md#supported-edr-solutions) wasn't detected on the VM.


To enable Defender for Endpoint on the machine: 

1. Select the affected machine. You can also select multiple machines with the `Enable Microsoft Defender for Endpoint integration` recommended action.

1. Select **Fix**.

    :::image type="content" source="media/endpoint-detection-response/enable-fix.png" alt-text="Screenshot that shows where the fix button is located." lightbox="media/endpoint-detection-response/enable-fix.png":::

1. In **Enable EDR solution**, select **Enable**. With this setting enabled, the Defender for Endpoint sensor is automatically installed on all Windows and Linux servers in the subscription.

    After the process is completed, it can take up to 24 hours until your machine appears in the **Healthy resources** tab. 

    :::image type="content" source="media/endpoint-detection-response/enable-endpoint.png" alt-text="Screenshot that shows the pop-up window from which to enable the Defender for Endpoint integration on.":::


### Upgrade Defender plan

This recommended action is available when:

- One of the [supported third-party EDR solutions](integration-defender-for-endpoint.md#supported-edr-solutions) wasn't detected on the VM.
- One of the supported plans (Defender for Servers Plan 2 or Defender CSPM) isn't enabled for the VM.

To fix the recommendation.

1. Select the affected machine. You can also select multiple machines with the `Upgrade Defender plan` recommended action.

1. Select **Fix**.

    :::image type="content" source="media/endpoint-detection-response/upgrade-fix.png" alt-text="Screenshot that shows where the fix button is located on the screen." lightbox="media/endpoint-detection-response/upgrade-fix.png":::

1. In **Enable EDR solution**, select a plan in the dropdown menu. Each plan comes with a cost.[Learn more about pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

1. Select **Enable**.

    :::image type="content" source="media/endpoint-detection-response/enable-plan.png" alt-text="Screenshot that shows the pop-up window that allows you to select which Defender for Servers plan to enable on your subscription.":::

After the process is completed, it can take up to 24 hours until your machine appears on the **Healthy resources** tab.

### Troubleshoot issues

This recommended action is available when Defender for Endpoint is detected on a machine but wasn't onboarded properly.


1. Select the affected VM.

1. Select **Remediation steps**.

    :::image type="content" source="media/endpoint-detection-response/remediation-steps.png" alt-text="Screenshot that shows where the remediation steps are located in the recommendation." lightbox="media/endpoint-detection-response/remediation-steps.png":::

1. Follow the instructions to troubleshoot onboarding issues for [Windows](/defender-endpoint/troubleshoot-onboarding) or [Linux](/defender-endpoint/microsoft-defender-endpoint-linux).

After the process is completed, it can take up to 24 hours until your machine appears in the Healthy resources tab.


