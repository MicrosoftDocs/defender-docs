---
title: The Microsoft cloud security benchmark in Microsoft Defender for Cloud
description: Learn about the Microsoft cloud security benchmark in Microsoft Defender for Cloud.
ms.topic: conceptual
ms.date: 07/14/2025
zone_pivot_groups: defender-portal-experience
---

# Microsoft cloud security benchmark in Defender for Cloud

::: zone pivot="azure-portal"

Industry standards, regulatory standards, and benchmarks are represented in Microsoft Defender for Cloud as [security standards](security-policy-concept.md). These standards are assigned to scopes such as Azure subscriptions, AWS accounts, and GCP projects.

Defender for Cloud continuously assesses your hybrid cloud environment against these standards, and provides information about compliance in the **Regulatory compliance** dashboard (Azure portal experience).

When you onboard subscriptions and accounts to Defender for Cloud, the [Microsoft cloud security benchmark (MCSB)](/security/benchmark/azure/introduction) automatically starts to assess resources in scope.

This benchmark builds on the cloud security principles defined by the Azure Security Benchmark and applies these principles with detailed technical implementation guidance for Azure, for other cloud providers (such as AWS and GCP), and for other Microsoft clouds.

:::image type="content" source="media/concept-regulatory-compliance/microsoft-security-benchmark.png" alt-text="Image that shows the components that make up the Microsoft cloud security benchmark." lightbox="media/concept-regulatory-compliance/microsoft-security-benchmark.png":::

The compliance dashboard gives you a view of your overall compliance standing. Security for non-Azure platforms follows the same cloud-neutral security principles as Azure. Each control within the benchmark provides the same granularity and scope of technical guidance across Azure and other cloud resources.

:::image type="content" source="media/concept-regulatory-compliance/compliance-dashboard.png" alt-text="Screenshot of a sample regulatory compliance page in Defender for Cloud (Azure portal)." lightbox="media/concept-regulatory-compliance/compliance-dashboard.png":::

From the compliance dashboard, you're able to manage all of your compliance requirements for your cloud deployments, including automatic, manual, and shared responsibilities.

> [!NOTE]
> Shared responsibilities is only compatible with Azure.

## Next steps

- [Improve your regulatory compliance](regulatory-compliance-dashboard.md)
- [Customize the set of standards in your regulatory compliance dashboard](update-regulatory-compliance-packages.yml)

::: zone-end

::: zone pivot="defender-portal"

Industry standards, regulatory standards, and benchmarks are represented in Microsoft Defender for Cloud as [security standards](security-policy-concept.md). These standards are assigned to scopes such as Azure subscriptions, AWS accounts, and GCP projects.

In the Defender portal experience, Defender for Cloud continuously assesses your multicloud environment against these standards and presents compliance posture within the unified **Regulatory compliance** (exposure management) view alongside other security posture elements.

When you onboard subscriptions and accounts, the [Microsoft cloud security benchmark (MCSB)](/security/benchmark/azure/introduction) automatically begins assessment across Azure, AWS, and GCP resources in scope.

The MCSB builds on the Azure Security Benchmark and extends prescriptive guidance uniformly across clouds. The Defender portal surfaces this benchmark in a way that aligns with broader exposure management, initiative tracking, and risk-driven workflows.

:::image type="content" source="media/concept-regulatory-compliance/microsoft-security-benchmark.png" alt-text="Image that shows the components that make up the Microsoft cloud security benchmark." lightbox="media/concept-regulatory-compliance/microsoft-security-benchmark.png":::

The compliance experience provides:
- Aggregated multi-cloud control compliance
- Integrated linkage to exposure / secure score context
- Unified filtering by environment, scope (cloud scopes), and control family
- Streamlined remediation entry points

:::image type="content" source="media/concept-regulatory-compliance/compliance-dashboard.png" alt-text="Screenshot of a sample regulatory compliance page in Defender for Cloud (Defender portal)." lightbox="media/concept-regulatory-compliance/compliance-dashboard.png":::

Shared responsibility visualizations remain applicable only to Azure-specific controls; other clouds display provider-neutral responsibility guidance.

> [!NOTE]
> Shared responsibilities visualization applies only to Azure resources; for non-Azure clouds, equivalent contextual responsibility guidance might be simplified.

## Next steps

- [Improve your regulatory compliance](regulatory-compliance-dashboard.md)
- [Customize the set of standards in your regulatory compliance dashboard](update-regulatory-compliance-packages.yml)

::: zone-end
