---
title: Remediate Defender for Endpoint EDR misconfigurations
description: Identify and remediate Defender for Endpoint EDR misconfigurations in Defender for Cloud
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 03/18/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how to review and remediate endpoint detection and response recommendations in order to ensure the security of my virtual machine.
---

# Remediate Defender for Endpoint EDR misconfigurations (agentless)

Microsoft Defender for Cloud provides agentless scanning of protected machines to:

- [Check that an endpoint detection and response (EDR) solution is installed on supported, connected machines and configured correctly. [Learn more]](integration-defender-for-endpoint.md).
- Detect whether there are EDR misconfigurations if you're using Microsoft Defender for Endpoint as an EDR solution. 


> [!NOTE]
>
> - Agentless scanning for EDR information replaces previous functionality that collected EDR solution information with the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)), in general availability (GA), or with the Azure Monitoring Agent (AMA), in preview.
> - The MMA is set to retire in August 2024. Data collection with the MMA will be deprecated in November 2024.
> -The  AMA data collect preview is now deprecated.

Defender for Cloud runs the following security checks for Defender for Endpoint EDR misconfigurations, and provides recommendations to fix them:

- `Both full and quick scans are out of 7 days`
- `Signature out of date`
- `Anti-virus is off or partially configured`


## Prerequisites

EDR recommendations are available when:

- [Defender for Cloud](connect-azure-subscription.md) is available in the Azure subscription.
- One of these Defender for Cloud plans is enabled:
  - [Defender for Servers Plan 2](tutorial-enable-servers-plan.md)
  - [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md)
- [Agentless scanning for machines](enable-agentless-scanning-vms.md#enabling-agentless-scanning-for-machines) is turned on. It's enabled by default in the plans, but if you need to turn it on manually, [follow these instructions](enable-agentless-scanning-vms.md).
- You're running Defender for Endpoint as an EDR solution on VMs.

## Investigate misconfiguration recommendations

1. In **Defender for Cloud** > **Recommendations**.

1. Search for and select one of the following recommendations:

    - `EDR configuration issues should be resolved on virtual machines`
    - `EDR configuration issues should be resolved on EC2s`
    - `EDR configuration issues should be resolved on GCP virtual machines`

    :::image type="content" source="media/endpoint-detection-response/configurable-solutions.png" alt-text="Screenshot that shows the recommendations that configure your endpoint detection and solution and remediate misconfigurations." lightbox="media/endpoint-detection-response/configurable-solutions.png":::

1. Select each of the security checks to review the affected resources.

    :::image type="content" source="media/endpoint-detection-response/affected-resources.png" alt-text="Screenshot that shows a selected security check and the affected resources." lightbox="media/endpoint-detection-response/affected-resources.png":::

1. Expand the **Affected resources** section

     :::image type="content" source="media/endpoint-detection-response/affected-resources-section.png" alt-text="Screenshot that shows you where you need to select on screen to expand the affected resources section.":::

1. Review the resource findngs.
    :::image type="content" source="media/endpoint-detection-response/resources-findings.png" alt-text="Screenshot that shows the findings of an affected unhealthy resource." lightbox="media/endpoint-detection-response/resources-findings.png":::

1. Drill into the security check, and follow the remediation steps.

    :::image type="content" source="media/endpoint-detection-response/security-check-remediation.png" alt-text="Screenshot that shows the additional details section.":::


After the process is completed, it can take up to 24 hours until your machine appears in the **Healthy resources** tab.
