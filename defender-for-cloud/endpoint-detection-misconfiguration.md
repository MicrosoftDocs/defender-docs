---
title: Investigate Defender for Endpoint misconfiguration recommendations (agentless)
description: Use agentless scanning to identify and investigate Defender for Endpoint configuration issues, such as outdated signatures, disabled antivirus, or overdue scans.
ms.topic: how-to
ms.date: 06/02/2026
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how to review endpoint detection and response configuration recommendations in order to ensure the security of my virtual machine.
---

# Investigate Defender for Endpoint misconfiguration recommendations (agentless)

Defender for Cloud uses agentless scanning with Defender for Endpoint integration to surface endpoint detection and response (EDR) misconfiguration recommendations for protected machines. Investigating and remediating these findings helps maintain endpoint protection health and keeps machine posture aligned with Defender for Cloud risk reduction workflows.

Microsoft Defender for Cloud integrates with [Microsoft Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) to identify endpoint detection and response configuration issues for machines.

As part of these [integrated capabilities](integration-defender-for-endpoint.md), Defender for Cloud uses agentless scanning to evaluate whether Defender for Endpoint is configured correctly on protected machines. Examples of these checks include:

- `Both full and quick scans are out of 7 days`
- `Signature out of date`
- `Anti-virus is off or partially configured`

When misconfigurations are found, Defender for Cloud generates recommendations. Complete remediation actions in Microsoft Defender for Endpoint or on the affected machine.

> [!NOTE]
>
> - Defender for Cloud uses agentless scanning to assess endpoint detection and response (EDR) settings.
> - Agentless scanning replaces the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)), which was previously used to collect machine data.
> - The use of MMA is retired. Scanning using the MMA was deprecated in November 2024.

## Prerequisites

Before you start, make sure that: 

- [Defender for Cloud](connect-azure-subscription.md) is enabled on your subscription with one of the following plans:
    - [Defender for Servers Plan 2](tutorial-enable-servers-plan.md)
    - [Defender cloud security posture management (Defender CSPM)](tutorial-enable-cspm-plan.md)
- [Agentless scanning for machines](concept-agentless-data-collection.md) is enabled. If needed, you can [enable agentless scanning manually](enable-agentless-scanning-vms.md).
- Defender for Endpoint is running as the EDR solution on the virtual machines.

## Investigate misconfiguration recommendations

To investigate and remediate misconfiguration recommendations for Defender for Endpoint, perform the following steps:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Defender for Cloud**.

1. In the Defender for Cloud menu, select **Recommendations**.

1. Search for and select one of the following recommendations:

    - `EDR configuration issues should be resolved on virtual machines`
    - `EDR configuration issues should be resolved on EC2s`
    - `EDR configuration issues should be resolved on GCP virtual machines`

    :::image type="content" source="media/endpoint-detection-response/configurable-solutions.png" alt-text="Screenshot that shows the recommendations that configure your endpoint detection and solution and remediate misconfigurations." lightbox="media/endpoint-detection-response/configurable-solutions.png":::

1. Select a security check to review the affected resources.

    :::image type="content" source="media/endpoint-detection-response/affected-resources.png" alt-text="Screenshot that shows a selected security check and the affected resources." lightbox="media/endpoint-detection-response/affected-resources.png":::

1. Expand **Affected resources**.

     :::image type="content" source="media/endpoint-detection-response/affected-resources-section.png" alt-text="Screenshot that shows you where you need to select on screen to expand the affected resources section.":::

1. Review the resource findings.
    :::image type="content" source="media/endpoint-detection-response/resources-findings.png" alt-text="Screenshot that shows the findings of an affected unhealthy resource." lightbox="media/endpoint-detection-response/resources-findings.png":::

1. Drill into the security check to view the remediation steps provided with the recommendation, and complete the remediation in Defender for Endpoint or on the affected machine.

    :::image type="content" source="media/endpoint-detection-response/security-check-remediation.png" alt-text="Screenshot that shows the additional details section.":::

After remediation is complete, it can take up to 24 hours for the machine to appear in the **Healthy resources** tab.

## Next step

> [!div class="nextstepaction"]
> [Verify that machines have an EDR solution configured](endpoint-detection-response.md)

