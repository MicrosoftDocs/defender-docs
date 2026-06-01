---
title: Posture for Serverless Containers (Preview)
description: Learn how Microsoft Defender for Cloud uses Defender cloud security posture management (Defender CSPM) to provide inventory, recommendations, and attack path visibility for serverless containers.
ms.topic: concept-article
ms.date: 06/01/2026
author: ElazarK
ms.author: elkrieger
#customer intent: "As a cloud security administrator, I want to understand posture for serverless containers in Microsoft Defender for Cloud so that I can prioritize risk across supported serverless workloads."
---

# Posture for Serverless Containers (Preview)

Posture for Serverless Containers in Microsoft Defender for Cloud helps you assess and prioritize risk in serverless container environments where host-level agents aren't available.

In Defender cloud security posture management (Defender CSPM), this capability extends posture coverage to supported serverless container resources and surfaces findings in the same experiences you already use. These experiences include inventory, recommendations, and attack path analysis. This visibility helps your team find exposed workloads, understand broader risk, and focus remediation on the issues that matter most.

> [!NOTE]
> In preview, posture for serverless containers supports:
>
> - Azure Container Apps (ACA)
> - Azure Container Instances (ACI)
> - Amazon Elastic Container Service (ECS) on AWS Fargate

## What is posture for serverless containers?

Posture for Serverless Containers extends Defender CSPM capabilities to serverless container platforms. It gives you a unified view of discovered resources, misconfiguration findings, vulnerability assessment findings, and attack path context for supported workloads.

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

:::image type="content" source="media/posture-for-serverless-containers/serverless-inventory.png" alt-text="Cloud asset inventory view filtered to serverless containers, showing Azure Container Apps, Azure Container Instances, and Amazon ECS on AWS Fargate resources." lightbox="media/posture-for-serverless-containers/serverless-inventory.png":::

After you filter your results, select a resource to view details about its security posture, including active security recommendations and their severity levels.

:::image type="content" source="media/posture-for-serverless-containers/serverless-posture-resource.png" alt-text="Resource details page for a serverless container workload showing posture state, active recommendations, and severity indicators." lightbox="media/posture-for-serverless-containers/serverless-posture-resource.png":::

### Recommendations

Defender for Cloud generates posture recommendations based on control-plane configuration signals and container image metadata, including vulnerability assessment findings where applicable.

:::image type="content" source="media/posture-for-serverless-containers/serverless-container-recommendations.png" alt-text="Recommendations page filtered to serverless container resources, showing recommendation names, severity levels, and affected resource counts." lightbox="media/posture-for-serverless-containers/serverless-container-recommendations.png":::


To remediate findings, see [Remediate security recommendations in Microsoft Defender for Cloud](implement-security-recommendations.md).

### Attack path analysis

Defender for Cloud correlates supported findings into attack paths to help you prioritize remediation based on likely risk propagation.

:::image type="content" source="media/posture-for-serverless-containers/attack-path-serverless-containers.png" alt-text="Attack path analysis view filtered to serverless containers, showing connected exposed resources and risk propagation paths." lightbox="media/posture-for-serverless-containers/attack-path-serverless-containers.png":::

To learn how to investigate attack paths, see [How to manage attack path analysis](how-to-manage-attack-path.md).

### Cloud security explorer

Defender for Cloud's Cloud Security Explorer provides advanced filtering and querying capabilities that allow you to analyze the security posture of your serverless containers. You can create custom queries to identify specific misconfigurations or vulnerabilities across your workloads.

:::image type="content" source="media/posture-for-serverless-containers/serverless-containers-security-explorer.png" alt-text="Cloud Security Explorer query view with filters and query results for serverless container posture findings.":::

Learn how to [build queries with Cloud Security Explorer](how-to-manage-cloud-security-explorer.md).

## Limitations

In preview, posture for serverless containers has the following limitations:

- Posture-only coverage. Runtime threat detection and active response aren't included.
- Insights are based on control-plane signals and image metadata. Host and runtime process telemetry isn't used.
- Availability is limited to supported workloads in Azure and AWS clouds.

## Related content

- [Protect resources with Defender CSPM](tutorial-enable-cspm-plan.md)
- [Remediate security recommendations in Microsoft Defender for Cloud](implement-security-recommendations.md)
- [Serverless containers security recommendations](recommendations-reference-serverless-containers.md)