---
title: Posture for Serverless Containers (Preview)
description: Learn how Defender CSPM in Microsoft Defender for Cloud provides inventory, recommendations, and attack path visibility for serverless containers.
ms.topic: concept-article
ms.date: 06/01/2026
author: ElazarK
ms.author: elkrieger
#customer intent: "As a cloud security administrator, I want to understand posture for serverless containers in Microsoft Defender for Cloud so that I can prioritize risk across supported serverless workloads."
---

# Posture for Serverless Containers (Preview)

Posture for Serverless Containers in Microsoft Defender for Cloud helps you assess and prioritize risk in serverless container environments where host-level agents aren't available.

In Defender CSPM, this capability extends posture coverage to supported serverless container resources and surfaces findings in the same experiences you already use, including inventory, recommendations, and attack path analysis. It helps your team find exposed workloads, understand broader risk, and focus remediation on the issues that matter most.

> [!NOTE]
> In preview, posture for serverless containers supports:
>
> - Azure Container Apps (ACA)
> - Azure Container Instances (ACI)
> - AWS - Amazon Elastic Container Service (ECS) Fargate

## What is posture for serverless containers?

Posture for Serverless Containers extends Defender Cloud Security Posture Management (CSPM) capabilities to serverless container platforms. It gives you a unified view of discovered resources, misconfiguration findings, vulnerability assessment findings, and attack path context for supported workloads.

This capability is posture-focused in preview. It is designed for serverless container environments where runtime and host telemetry are limited by the platform abstraction.

## Requirements and availability

To use posture for serverless containers:

- Enable [Defender CSPM](tutorial-enable-cspm-plan.md).
- Make sure supported workloads are present in your connected environments.
- Use a role with the required permissions:
  - **Security Reader** to view findings and posture state.
  - **Security Admin** to change settings and manage exemptions.
- Use commercial clouds only. This preview supports Azure and AWS and isn't available in sovereign or national clouds.

For cloud and platform availability details, see:

- [Defender for Cloud support matrix](support-matrix-defender-for-cloud.md#cloud-support)

## Key capabilities

Posture for Serverless Containers provides these capabilities in preview:

- Inventory visibility for supported serverless container resources.
- Security recommendations for misconfiguration findings and vulnerability assessment findings derived from image and control-plane context.
- Attack path analysis that helps prioritize high-risk relationships and exposure paths.

## How posture for serverless containers works

When you enable the Serverless Containers component in Defender CSPM settings, Defender for Cloud begins evaluating supported serverless container resources. Initial coverage can take up to 24 hours.

For enablement steps, see [Protect resources with Defender CSPM](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan).

### Inventory

Defender for Cloud discovers supported serverless container resources and shows them in inventory views so you can understand resource presence and coverage.

:::image type="content" source="media/posture-for-serverless-containers/serverless-inventory.png" alt-text="Screenshot of serverless container inventory." lightbox="media/posture-for-serverless-containers/serverless-inventory.png":::

After you filter your results, select any of the resources to view more details about its security posture, including any active security recommendations and their severity levels.

:::image type="content" source="media/posture-for-serverless-containers/serverless-posture-resource.png" alt-text="Screenshot that shows a sample serverless containers resource." lightbox="media/posture-for-serverless-containers/serverless-posture-resource.png":::

### Recommendations

Defender for Cloud generates posture recommendations based on control-plane configuration signals and container image metadata, including vulnerability assessment findings where applicable.

:::image type="content" source="media/posture-for-serverless-containers/serverless-container-recommendations.png" alt-text="Screenshot that shows the recommendations page filtered for serverless containers." lightbox="media/posture-for-serverless-containers/serverless-container-recommendations.png":::


To remediate findings, see [Remediate security recommendations in Microsoft Defender for Cloud](implement-security-recommendations.md).

### Attack path analysis

Defender for Cloud correlates supported findings into attack paths to help you prioritize remediation based on likely risk propagation.

:::image type="content" source="media/posture-for-serverless-containers/attack-path-serverless-containers.png" alt-text="Screenshot that shows attack paths filtered for serverless containers." lightbox="media/posture-for-serverless-containers/attack-path-serverless-containers.png":::

To learn how to investigate attack paths, see [How to manage attack path analysis](how-to-manage-attack-path.md).

### Cloud security explorer

Defender for Cloud's Cloud Security Explorer provides advanced filtering and querying capabilities that allow you to analyze the security posture of your serverless containers. You can create custom queries to identify specific misconfigurations or vulnerabilities across your workloads.

:::image type="content" source="media/posture-for-serverless-containers/serverless-containers-security-explorer.png" alt-text="Screenshot that shows how to search teh cloud security explorer for serverless containers.":::

Learn how to [build queries with cloud security explorer](how-to-manage-cloud-security-explorer.md).

## Limitations

In preview, posture for serverless containers has the following limitations:

- Posture-only coverage. Runtime threat detection and active response aren't included.
- Insights are based on control-plane signals and image metadata. Host and runtime process telemetry isn't used.
- Availability is limited to supported workloads in Azure and AWS clouds.

## Related content

- [Protect resources with Defender CSPM](tutorial-enable-cspm-plan.md)
- [Remediate security recommendations in Microsoft Defender for Cloud](implement-security-recommendations.md)
- [Serverless containers security recommendations](recommendations-reference-serverless-containers.md)