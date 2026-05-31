---
title: Planning multicloud security compliance requirements guidance AWS standards GCP standards
description: Learn about determining compliance requirements in multicloud environment with Microsoft Defender for Cloud.
ms.topic: how-to
author: ElazarK
ms.author: elkrieger
ms.date: 05/31/2026
---

# Determine compliance requirements

This article is part of a series to provide guidance as you design a cloud security posture management (CSPM) and cloud workload protection platform (CWPP) solution across multicloud resources with Microsoft Defender for Cloud.

## Goal

Identify compliance requirements in your organization as you design your multicloud solution.

## Get started

Defender for Cloud continually assesses your resource configuration against compliance controls and best practices in the standards and benchmarks applied in your subscriptions.

- By default, every subscription has the [Azure Security Benchmark](/security/benchmark/azure/introduction) assigned. This benchmark contains Microsoft Azure security and compliance best practices based on common compliance frameworks.
- Amazon Web Services (AWS) standards include AWS Foundational Security Best Practices, the Center for Internet Security (CIS) AWS Foundations Benchmark v1.2.0, and the Payment Card Industry Data Security Standard (PCI DSS) v3.2.1.
- Google Cloud Platform (GCP) standards include GCP Default, GCP CIS benchmarks v1.1.0 and v1.2.0, GCP International Organization for Standardization (ISO) 27001, GCP National Institute of Standards and Technology (NIST) SP 800-53, and PCI DSS v3.2.1.
- By default, every subscription that contains the AWS connector has the AWS Foundational Security Best Practices assigned.
- Every subscription with the GCP connector has the GCP Default benchmark assigned.
- For AWS and GCP, the compliance monitoring freshness interval is 4 hours.

After you enable enhanced security features, you can add other compliance standards to the dashboard. Regulatory compliance is available when you enable at least one Defender plan on the subscription where the multicloud connector is located.

Additionally, you can create custom standards and assessments to align with your organizational requirements. For guidance, see [Custom standards and assessments for AWS](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/custom-assessments-and-standards-in-microsoft-defender-for-cloud/ba-p/3066575) and [Custom standards and assessments for GCP](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/custom-assessments-and-standards-in-microsoft-defender-for-cloud/ba-p/3251252).

## Next steps

In this article, you learned how to determine your compliance requirements when designing a multicloud security solution. Continue to the next step to [determine ownership requirements](plan-multicloud-security-determine-ownership-requirements.md).
