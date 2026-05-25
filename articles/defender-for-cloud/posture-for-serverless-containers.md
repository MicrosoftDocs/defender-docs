---
title: Posture for Serverless Containers (Preview)
description: Learn how serverless containers posture in Microsoft Defender for Cloud provides inventory, recommendations, and attack path visibility for serverless workloads.
ms.topic: concept-article
#customer intent: ["As a cloud security administrator, I want to understand posture for serverless containers in Microsoft Defender for Cloud so that I can prioritize risk across supported serverless workloads."]
ms.date: 05/25/2026
author: ElazarK
ms.author: elkrieger
---

# Posture for Serverless Containers (Preview)

Posture for Serverless Containers in Microsoft Defender for Cloud helps you assess and prioritize risk in serverless container environments where host-level agents are not available.

In Microsoft Defender for Cloud, this capability extends Defender Cloud Security Posture Management (CSPM) into serverless container resources and surfaces findings in the same posture experiences you already use, including inventory, recommendations, and attack path analysis. In Defender for Containers, it adds posture context for supported serverless container platforms so your team can find exposure faster, understand likely impact, and focus remediation work on the highest-risk issues first.

> [!NOTE]
> In preview, posture for serverless containers supports:
>
> - Azure Container Apps (ACA)
> - Azure Container Instances (ACI)
> - Amazon Web Services (AWS) - ECS Fargate

## What is posture for serverless containers?

Posture for Serverless Containers extends Defender Cloud Security Posture Management (CSPM) capabilities to serverless container abstractions. It gives you a unified view of inventory, misconfiguration findings, vulnerability assessment findings, and attack path context for supported workloads.

This capability is posture-focused in preview and is designed for environments where host-level runtime sensors are not available.

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
- [Defender for Containers support matrix](support-matrix-defender-for-containers.md)

## Key capabilities

Posture for Serverless Containers provides these capabilities in preview:

- Inventory visibility for supported serverless container resources.
- Security recommendations for misconfiguration findings and vulnerability assessment findings derived from image and control-plane context.
- Attack path analysis that helps prioritize high-risk relationships and exposure paths.

## How posture for serverless containers works

When you enable the serverless containers component in Defender CSPM settings, Defender for Cloud begins evaluating supported serverless container resources. Initial coverage can take up to 24 hours.

For enablement steps, see [Enable posture for serverless containers (Preview)](defender-for-containers-enable-plan.md#enable-posture-for-serverless-containers-preview).

### Inventory

Defender for Cloud discovers supported serverless container resources and shows them in inventory views so you can understand resource presence and coverage.

<!-- TODO: Add screenshot placeholder - inventory view for posture for serverless containers. -->

### Recommendations

Defender for Cloud generates posture recommendations based on control-plane configuration signals and container image metadata, including vulnerability assessment findings where applicable.

To remediate findings, see [Remediate security recommendations in Microsoft Defender for Cloud](implement-security-recommendations.md).

<!-- TODO: Add screenshot placeholder - recommendations view for posture for serverless containers. -->

### Attack path analysis

Defender for Cloud correlates supported findings into attack paths to help you prioritize remediation based on likely risk propagation.

To learn how to investigate attack paths, see [How to manage attack path analysis](how-to-manage-attack-path.md).

<!-- TODO: Add screenshot placeholder - attack path view for posture for serverless containers. -->

## Limitations

In preview, posture for serverless containers has the following limitations:

- Posture-only coverage. Runtime threat detection and active response aren't included.
- Insights are based on control-plane signals and image metadata. Host and runtime process telemetry isn't used.
- Availability is limited to supported workloads in Azure and AWS commercial clouds.

## Related content

- [Enable Defender for Containers in Microsoft Defender for Cloud](defender-for-containers-enable-plan.md)
- [Defender for Containers support matrix](support-matrix-defender-for-containers.md)
- [Remediate security recommendations in Microsoft Defender for Cloud](implement-security-recommendations.md)
