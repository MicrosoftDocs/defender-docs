---
title: The Microsoft cloud security benchmark in Microsoft Defender for Cloud
description: Learn about the Microsoft cloud security benchmark in Microsoft Defender for Cloud.
ms.topic: conceptual
ms.date: 10/29/2025
---

# Microsoft cloud security benchmark in Defender for Cloud

Industry standards, regulatory standards, and benchmarks are represented in Microsoft Defender for Cloud as [security standards](security-policy-concept.md). These standards are assigned to scopes such as Azure, AWS, and GCP.

Defender for Cloud continuously assesses your hybrid cloud environment against these standards, and provides information about compliance in the **Regulatory compliance** dashboard.

When you onboard to Defender for Cloud, [Microsoft cloud security benchmark v2 (public preview) (MCSB)](/security/benchmark/azure/introduction) automatically starts to assess resources.

This benchmark builds on the cloud security principles defined by the Azure Security Benchmark and applies these principles with detailed technical implementation guidance for Azure, for other cloud providers (such as AWS and GCP), and for other Microsoft clouds. It provides risk-based guidance and includes controls to secure emerging workloads such as artificial intelligence (AI).

:::image type="content" source="media/concept-regulatory-compliance/microsoft-security-benchmark.png" alt-text="Image that shows the components that make up the Microsoft cloud security benchmark." lightbox="media/concept-regulatory-compliance/microsoft-security-benchmark.png":::

The compliance dashboard provides a dedicated benchmark view to help you monitor resource compliance against benchmark controls. The benchmark includes expanded control coverage and Azure Policy mappings. Non-Azure platforms follow the same cloud-neutral security principles as Azure. Each control provides a consistent level of technical guidance across Azure and other cloud resources.

From the compliance dashboard, you're able to manage all of your compliance requirements for your cloud deployments, including automatic, manual, and shared responsibilities.

> [!NOTE]
> Shared responsibilities is only compatible with Azure.

## Next steps

- [Improve your regulatory compliance](regulatory-compliance-dashboard.md)
- [Customize the set of standards in your regulatory compliance dashboard](assign-regulatory-compliance-standards.md)
