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

# Remediate EDR recommendations (agentless)

Microsoft Defender for Cloud uses agentless scanning to provide recommendations that improve endpoint security. By remediating these recommendations, you can ensure that endpoint detection and response (EDR) solution are compliant and secure across all environments. EDR recommendations:

- Identify if an EDR solution is installed on multicloud machines.

- Identify gaps in the security configurations on any of the discovered EDR solutions.

- Remediate detected gaps in security configurations.

When Defender for Cloud discovers a supported EDR solution on a VM, agentless scanning checks:

- If a supported endpoint detection and response solution is enabled
- If Defender for Servers plan 2 is enabled on your subscription and the associated VMs
- If the supported solution is installed successfully.

If these checks present issues, the recommendation offers remediation steps.

> [!NOTE]
> - Endpoint protection recommendations currently generally available (GA) in the Defender for Servers and Defender CSPM plans, are provided using the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)). The MMA is set to retire in August 2024. Agentless machine scanning with the MMA will be deprecated in November 2024.
> - Endpoint protection recommendations are also currently available in preview using the Azure Monitoring Agent (AMA). The AMA preview is now deprecated.
> - The MMA and AMA functionality will be replaced with EDR recommendations provided by agentless machine scanning in Defender Servers Plan 2 and Defender CSPM. Agentless machine scanning is GA.

## Prerequisites

EDR recommendations are available if you have the following prerequisites in place:

- [Defender for Cloud](connect-azure-subscription.md) enabled on an Azure subscription.

- One of these Defender for Cloud plans enabled:
  - [Defender for Servers Plan 2](tutorial-enable-servers-plan.md)
  - [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md)

- [Agentless scanning for machines](enable-agentless-scanning-vms.md#enabling-agentless-scanning-for-machines) must be enabled in the plan. It's enabled by default, but if you need to turn it on manually, [follow these instructions](enable-agentless-scanning-vms.md).


## Identify enabled EDR solutions

To identify which solution is enabled on a VM:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select one of the following recommendations:

    - `EDR solution should be installed on Virtual Machines`
    - `EDR solution should be installed on EC2s`
    - `EDR solution should be installed on Virtual Machines (GCP)`

1. Select the **Healthy resources** tab.

1. The discovered endpoint detection and response column displays the solution that is detected.

    :::image type="content" source="media/endpoint-detection-response/discovered-solutions.png" alt-text="Screenshot of the Healthy resources tab, which shows where you can see which endpoint detection and response solution is enabled on your machine." lightbox="media/endpoint-detection-response/discovered-solutions.png":::

## Remediate discovery recommendations

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select one of the following recommendations:

    - `EDR solution should be installed on Virtual Machines`
    - `EDR solution should be installed on EC2s`
    - `EDR solution should be installed on Virtual Machines (GCP)`

    :::image type="content" source="media/endpoint-detection-response/identify-recommendations.png" alt-text="Screenshot of the recommendations page showing the identified endpoint solution recommendations." lightbox="media/endpoint-detection-response/identify-recommendations.png":::

1. Select the relevant recommendation.

1. The recommendation offers multiple recommended actions to resolve on each attached machine, select the relevant action to see the remediation steps:

    - [Enable Microsoft Defender for Endpoint integration](#enable-the-microsoft-defender-for-endpoint-integration). Alternatively, you can remediate this recommendation by installing any of the supported EDR solutions](#supported-solutions-and-platforms) on your virtual machine
    - [Upgrade Defender plan](#upgrade-defender-plan)
    - [Troubleshoot issues](#troubleshoot-unsuccessful-installation)

### Enable Microsoft Defender for Endpoint integration

This recommended action is available when:

- One of the [supported EDR solutions](#supported-solutions-and-platforms) wasn't detected on the VM.

- The VM can have Microsoft Defender for Endpoint installed on it as part of the offerings included with Defender for Servers.

Enable integration as follows:

1. Select the affected machine.

1. (Optional) Select multiple affected machines that have the `Enable Microsoft Defender for Endpoint integration` recommended action.

1. Select **Fix**.

    :::image type="content" source="media/endpoint-detection-response/enable-fix.png" alt-text="Screenshot that shows where the fix button is located." lightbox="media/endpoint-detection-response/enable-fix.png":::

1. Select **Enable**.

    :::image type="content" source="media/endpoint-detection-response/enable-endpoint.png" alt-text="Screenshot that shows the pop-up window from which to enable the Defender for Endpoint integration on.":::

Defender for endpoint is applied to all Windows and Linux servers within your subscription. After the process is completed, it can take up to 24 hours until your machine appears in the Healthy resources tab.

### Upgrade Defender plan

This recommended action is available when:

- One of the [supported EDR solution](#supported-solutions-and-platforms) wasn't detected on the VM.

- Defender for Servers plan 2 isn't enabled on the VM.

To enable Defender for Endpoint integration:

1. Select the affected machine.

1. (Optional) Select multiple affected machines that have the `Upgrade Defender plan` recommended action.

1. Select **Fix**.

    :::image type="content" source="media/endpoint-detection-response/upgrade-fix.png" alt-text="Screenshot that shows where the fix button is located on the screen." lightbox="media/endpoint-detection-response/upgrade-fix.png":::

1. Select a plan in the dropdown menu. Each plan comes with a cost, learn more about the cost on the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

1. Select **Enable**.

    :::image type="content" source="media/endpoint-detection-response/enable-plan.png" alt-text="Screenshot that shows the pop-up window that allows you to select which Defender for Servers plan to enable on your subscription.":::

After the process is completed, it can take up to 24 hours until your machine appears in the Healthy resources tab.

### Troubleshoot unsuccessful installation

This recommended action is available when:

- Defender for Endpoint is detected on your machine, but the installation was unsuccessful.

**To troubleshoot issues on your VM**:

1. Select the affected resource.

1. Select **Remediation steps**.

    :::image type="content" source="media/endpoint-detection-response/remediation-steps.png" alt-text="Screenshot that shows where the remediation steps are located in the recommendation." lightbox="media/endpoint-detection-response/remediation-steps.png":::

1. Follow the instructions to troubleshoot Microsoft Defender for Endpoint onboarding issues for [Windows](/microsoft-365/security/defender-endpoint/troubleshoot-onboarding) or [Linux](/microsoft-365/security/defender-endpoint/microsoft-defender-endpoint-linux).

After the process is completed, it can take up to 24 hours until your machine appears in the Healthy resources tab.

## Remediate misconfiguration recommendations

When Defender for Cloud finds misconfigurations in your endpoint detection and response solution, recommendations appear on the recommendations page. This recommendation is only applicable to VMs that have Defender for Endpoint enabled on them. These recommendations check for the following security checks:

- `Both full and quick scans are out of 7 days`
- `Signature out of date`
- `Anti-virus is off or partially configured`

Detect misconfigurations in EDR solutions as follows:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select one of the following recommendations:

    - `EDR configuration issues should be resolved on virtual machines`
    - `EDR configuration issues should be resolved on EC2s`
    - `EDR configuration issues should be resolved on GCP virtual machines`

    :::image type="content" source="media/endpoint-detection-response/configurable-solutions.png" alt-text="Screenshot that shows the recommendations that configure your endpoint detection and solution and remediate misconfigurations." lightbox="media/endpoint-detection-response/configurable-solutions.png":::

1. Select the relevant recommendation.

1. Select a security check to review the affected resources.

    :::image type="content" source="media/endpoint-detection-response/affected-resources.png" alt-text="Screenshot that shows a selected security check and the affected resources." lightbox="media/endpoint-detection-response/affected-resources.png":::

1. Select each security check to review all affected resources.

1. Expand the affected resources section.

    :::image type="content" source="media/endpoint-detection-response/affected-resources-section.png" alt-text="Screenshot that shows you where you need to select on screen to expand the affected resources section.":::

1. Select an unhealthy resource to review its findings.

    :::image type="content" source="media/endpoint-detection-response/resources-findings.png" alt-text="Screenshot that shows the findings of an affected unhealthy resource." lightbox="media/endpoint-detection-response/resources-findings.png":::

1. Select the security check to see additional information and the remediation steps.

    :::image type="content" source="media/endpoint-detection-response/security-check-remediation.png" alt-text="Screenshot that shows the additional details section.":::

1. Follow the remediation steps.

After the process is completed, it can take up to 24 hours until your machine appears in the Healthy resources tab.
