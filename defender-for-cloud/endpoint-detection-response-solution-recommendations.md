---
title: Remediate EDR solution recommendations
description: Identify and remediate security gaps in endpoint detection and response solutions on your virtual machine with Defender for Cloud recommendations.
ms.topic: how-to
ms.date: 07/03/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1013
#customer intent: As a user, I want to learn how to review and remediate endpoint detection and response recommendations in order to ensure the security of my virtual machine.
---

# Remediate EDR solution recommendations

Microsoft Defender for Cloud helps improve security posture for supported machines with endpoint detection and response (EDR). Defender for Cloud:

- Works with [Microsoft Defender for Endpoint](integration-defender-for-endpoint.md) as a built-in EDR solution.
- Scans Azure virtual machines (VMs), AWS machines, and GCP machines to check whether an EDR solution is installed and running. The EDR solution can be Defender for Endpoint or a [supported non-Microsoft solution](detect-endpoint-detection-response-solutions.md#supported-edr-solutions).

Based on scan results, Defender for Cloud provides [recommendations](detect-endpoint-detection-response-solutions.md) to help you install and run EDR solutions correctly. This article describes how to fix those recommendations.

> [!NOTE]
>
> - Defender for Cloud uses agentless scanning to assess EDR settings.
> - Agentless scanning replaces the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)), which was previously used to collect machine data.
> - Scanning using the MMA was deprecated in November 2024.
> - To exempt resources from these EDR assessments, ensure that the **Azure CSPM initiative is assigned**. This initiative is enabled by default when Defender cloud security posture management (Defender CSPM) is turned on.

## Prerequisites

Before you investigate or remediate EDR solution recommendations, make sure you meet these requirements.

**Requirement** | **Details**
--- | ---
**Plan** | [Defender for Cloud](connect-azure-subscription.md) must be available in the Azure subscription and one of these plans must be enabled:<br/><br/>- [Defender for Servers Plan 2](tutorial-enable-servers-plan.md)<br/>- [Defender cloud security posture management (Defender CSPM)](tutorial-enable-cspm-plan.md)
**Agentless scanning** | [Agentless scanning for machines](concept-agentless-data-collection.md) must be turned on. Agentless scanning is enabled by default in both Defender for Servers Plan 2 and Defender CSPM. If you need to turn it on manually, see [Enable agentless scanning for VMs](enable-agentless-scanning-vms.md).

## Investigate EDR solution recommendations

To review EDR recommendations for your machines:

1. In **Defender for Cloud**, open **Recommendations**.

1. Search for and select one of these recommendations:

    - `EDR solution should be installed on Virtual Machines`
    - `EDR solution should be installed on EC2s`
    - `EDR solution should be installed on Virtual Machines (GCP)`

1. In the recommendation details, select the **Healthy resources** tab.

1. Find the EDR solution for each machine in the **Discovered EDRs** column.

    :::image type="content" source="media/endpoint-detection-response/discovered-solutions.png" alt-text="Screenshot of the Healthy resources tab, which shows where you can see which endpoint detection and response solution is enabled on your machine." lightbox="media/endpoint-detection-response/discovered-solutions.png":::

## Remediate EDR solution recommendations

To remediate EDR solution recommendations:

1. Select the relevant recommendation.

    :::image type="content" source="media/endpoint-detection-response/identify-recommendations.png" alt-text="Screenshot of the recommendations page showing the identified endpoint solution recommendations." lightbox="media/endpoint-detection-response/identify-recommendations.png":::

1. Select one of the listed recommended actions to see the remediation steps for that action.

## Enable Defender for Endpoint integration

The **Enable Microsoft Defender for Endpoint integration** action appears when Defender for Endpoint can be installed on a machine. This action is available only when no [supported non-Microsoft EDR solution](detect-endpoint-detection-response-solutions.md) is detected on the machine.

Enable Defender for Endpoint on the machine as follows:

1. Select the affected machine. You can also select multiple machines with the `Enable Microsoft Defender for Endpoint integration` recommended action.

1. Select **Fix**.

    :::image type="content" source="media/endpoint-detection-response/enable-fix.png" alt-text="Screenshot that shows where the fix button is located." lightbox="media/endpoint-detection-response/enable-fix.png":::

1. In **Enable EDR solution**, select **Enable**. This installs the Defender for Endpoint sensor on all Windows and Linux servers in the subscription.

    After the process completes, it can take up to 24 hours for your machine to appear in the **Healthy resources** tab.

    :::image type="content" source="media/endpoint-detection-response/enable-endpoint.png" alt-text="Screenshot that shows the pop-up window from which to enable the Defender for Endpoint integration on.":::

<a name="turn-on-a-plan"></a>
## Turn on the required Defender plan

The **Upgrade Defender plan** action is available when:

- A [supported non-Microsoft EDR solution](detect-endpoint-detection-response-solutions.md) isn't detected on the machine.
- A required plan (Defender for Servers Plan 2 or Defender CSPM) isn't turned on for the machine.

Fix the recommendation as follows:

1. Select the affected machine. You can also select multiple machines with the `Upgrade Defender plan` recommended action.

1. Select **Fix**.

    :::image type="content" source="media/endpoint-detection-response/upgrade-fix.png" alt-text="Screenshot that shows where the fix button is located on the screen." lightbox="media/endpoint-detection-response/upgrade-fix.png":::

1. In **Enable EDR solution**, select a plan in the dropdown menu. Each plan has a cost. See [Defender for Cloud pricing details](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

1. Select **Enable**.

    :::image type="content" source="media/endpoint-detection-response/enable-plan.png" alt-text="Screenshot that shows the pop-up window that allows you to select which Defender for Servers plan to enable on your subscription.":::

After the process completes, it can take up to 24 hours for your machine to appear on the **Healthy resources** tab.

## Troubleshoot Defender for Endpoint onboarding

The **Troubleshoot onboarding** action appears when Defender for Endpoint is found on a machine but didn't onboard correctly.

1. Select the affected VM.

1. Select **Remediation steps**.

    :::image type="content" source="media/endpoint-detection-response/remediation-steps.png" alt-text="Screenshot that shows where the remediation steps are located in the recommendation." lightbox="media/endpoint-detection-response/remediation-steps.png":::

1. Fix onboarding issues for your platform:
    - [Troubleshoot onboarding for Windows](/defender-endpoint/troubleshoot-onboarding)
    - [Troubleshoot onboarding for Linux](/defender-endpoint/microsoft-defender-endpoint-linux)

After you finish, it can take up to 24 hours for your machine to show on the **Healthy resources** tab.

