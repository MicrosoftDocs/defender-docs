---
title: The Microsoft cloud security benchmark in Microsoft Defender for Cloud
description: Learn about the Microsoft cloud security benchmark in Microsoft Defender for Cloud.
ms.topic: conceptual
ms.date: 10/29/2025
---

# Microsoft cloud security benchmark in Defender for Cloud

Microsoft Defender for Cloud presents industry standards, regulatory standards, and benchmarks as [security standards](security-policy-concept.md). These standards are assigned to scopes such as Azure subscriptions, AWS accounts, and GCP projects, and are assessed continuously in the **Regulatory compliance** dashboard.

When Defender for Cloud is enabled, the [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction) assesses resources in scope. This benchmark builds on the cloud security principles defined by the Azure Security Benchmark and applies these principles with detailed technical implementation guidance for Azure, for other cloud providers (such as AWS and GCP), and for other Microsoft clouds.

**MCSB v2 (preview)** is also available and can be enabled from the Regulatory compliance dashboard. This version introduces expanded guidance with additional risk-based controls, expanded Azure Policy mappings, and coverage for emerging workloads such as artificial intelligence (AI).

:::image type="content" source="media/concept-regulatory-compliance/microsoft-security-benchmark.png" alt-text="Image that shows the components that make up the Microsoft cloud security benchmark." lightbox="media/concept-regulatory-compliance/microsoft-security-benchmark.png":::

The compliance dashboard provides a dedicated benchmark view to help you monitor resource compliance against benchmark controls. Non-Azure platforms follow the same cloud-neutral security principles as Azure. Each control provides a consistent level of technical implementation guidance across Azure and other cloud resources.

:::image type="content" source="media/concept-regulatory-compliance/compliance-dashboard.png" alt-text="Screenshot of a sample regulatory compliance page in Defender for Cloud." lightbox="media/concept-regulatory-compliance/compliance-dashboard.png":::

From the compliance dashboard, you're able to manage all of your compliance requirements for your cloud deployments, including automatic, manual, and shared responsibilities.

> [!NOTE]
> Shared responsibilities is only compatible with Azure.

## Next steps

- [Improve your regulatory compliance](regulatory-compliance-dashboard.md)
- [Customize the set of standards in your regulatory compliance dashboard](assign-regulatory-compliance-standards.md)