---
title: Regulatory compliance in Defender for Cloud
description: Learn about regulatory compliance in Microsoft Defender for Cloud, and how it helps ensure compliance with industry, regional, and global standards.
author: dcurwin
ms.author: dacurwin
ms.topic: concept-article
ms.date: 09/09/2024
#customer intent: As a cloud security professional, I want to understand how Defender for Cloud helps me meet regulatory compliance standards, so that I can ensure my organization is compliant with industry standards and regulations.
---

# Regulatory compliance standards in Microsoft Defender for Cloud

Microsoft Defender for Cloud streamlines the regulatory compliance process by helping you to identify issues that are preventing you from meeting a particular compliance standard, or achieving compliance certification.

Industry standards, regulatory standards, and benchmarks are represented in Defender for Cloud as [security standards](security-policy-concept.md), and appear in the **Regulatory compliance** dashboard.

## Compliance controls

Each security standard consists of multiple compliance controls, which are logical groups of related security recommendations.

Defender for Cloud continually assesses the environment-in-scope against any compliance controls that can be automatically assessed. Based on assessments, it shows resources as being compliant or non-compliant with controls.

> [!NOTE]
> It's important to note that if standards have compliance controls that can't be automatically assessed, Defender for Cloud isn't able to decide whether a resource complies with the control. In this case, the control will show as greyed out. In addition, if a subscription has no relevant resources to a specific standard, the standard won't be shown in the regulatory compliance dashboard at all, even if it assigned.

## View compliance standards

The **Regulatory compliance** dashboard provides an interactive overview of compliance state.

:::image type="content" source="media/concepts-regulatory-compliance-standards/compliance-standards.png" alt-text="Screenshot showing the regulatory compliance dashboard." lightbox="media/concepts-regulatory-compliance-standards/compliance-standards.png":::

In the dashboard you can:

- Get a summary of standards controls that have been passed.
- Get of summary of standards that have the lowest pass rate for resources.
- Review standards that are applied within the selected scope.
- Review assessments for compliance controls within each applied standard.
- Get a summary report for a specific standard.
- Manage compliance policies to see the standards assigned to a specific scope.
- Run a query to create a custom compliance report
- [Create a "compliance over time workbook"](custom-dashboards-azure-workbooks.md) to track compliance status over time.
- Download audit reports.
- Review compliance offerings for Microsoft and third-party audits.

## Compliance standard details

For each compliance standard you can view:

- Scope for the standard.
- Each standard broken down into groups of controls and subcontrols.
- When you apply a standard to a scope, you can see a summary of compliance assessment for resources within the scope, for each standard control.
- The status of the assessments reflects compliance with the standard. There are three states:
  - A green circle indicates that resources in scope are compliant with the control.
  - A red circle indicates that resources are not compliant with the control.
  - Unavailable controls are those that can't be automatically assessed and thus Defender for Cloud is unable to access whether resources are compliant.

You can drill down into controls to get information about resources that have passed/failed assessments, and for remediation steps.

## Default compliance standards

By default, when you enable Defender for Cloud, the following standards are enabled:

- For **Azure**: [Microsoft Cloud Security Benchmark (MCSB)](concept-regulatory-compliance.md).
- For **AWS**: [Microsoft Cloud Security Benchmark (MCSB)](concept-regulatory-compliance.md) and [AWS Foundational Security Best Practices standard](https://docs.aws.amazon.com/securityhub/latest/userguide/fsbp-standard.html).
- For **GCP**: [Microsoft Cloud Security Benchmark (MCSB)](concept-regulatory-compliance.md) and **GCP Default**.

## Available compliance standards

The following standards are available in Defender for Cloud:

|Standards|Clouds|
| -------- | -------- |
|EU 2022 2555 (NIS2) 2022  |Azure, AWS, GCP|
|EU General Data Protection Regulation (GDPR) 2016 679  |Azure, AWS, GCP|
|NIST CSF v2.0  |Azure, AWS, GCP|
|NIST 800 171 Rev3  |Azure, AWS, GCP|
|NIST SP 800 53 R5.1.1  |Azure, AWS, GCP|
|PCI DSS v4.0.1  |Azure, AWS, GCP|
|CIS AWS Foundations v3.0.0  |AWS|
|CIS Azure Foundations v2.1.0  |Azure|
|CIS Controls v8.1  |Azure, AWS, GCP|
|CIS GCP Foundations v3.0  |GCP|
|CIS Google Cloud Platform Foundation Benchmark|GCP|
|CIS Azure Kubernetes Service (AKS) Benchmark|Azure|
|CIS Amazon Elastic Kubernetes Service (EKS) Benchmark|AWS|
|CIS Google Kubernetes Engine (GKE) Benchmark|GCP|
|HITRUST CSF v11.3.0  |Azure, AWS, GCP|
|SOC 2023  |Azure, AWS, GCP|
|SWIFT Customer Security Controls Framework 2024  |Azure, AWS, GCP|
|ISO IEC 27001:2022  |Azure, AWS, GCP|
|ISO IEC 27002:2022  |Azure, AWS, GCP|
|ISO IEC 27017:2015  |Azure, AWS, GCP|
|Cybersecurity Maturity Model Certification (CMMC) Level 2 v2.0  |Azure, AWS, GCP|
|AWS Well Architected Framework 2024  |AWS|
|Canada Federal PBMM 3.2020  |Azure, AWS, GCP|
|APRA CPS 234 2019  |Azure, AWS|
|CSA Cloud Controls Matrix v4.0.12  |Azure, AWS, GCP|
|Cyber Essentials v3.1  |Azure, AWS, GCP|
|Criminal Justice Information Services Security Policy v5.9.5  |Azure, AWS, GCP|
|FFIEC CAT 2017  |Azure, AWS, GCP|
|Brazilian General Data Protection Law (LGPD) 2018  |Azure, AWS, GCP|
|NZISM v3.7  |Azure, AWS, GCP|
|Sarbanes Oxley Act 2022 (SOX)  |Azure, AWS, GCP|
|NCSC Cyber Assurance Framework (CAF) v3.2  |Azure, AWS, GCP|
|Australian Government ISM Protected|Azure|
|FedRAMP ‘H’ & ‘M’|Azure|
|HIPAA|Azure|
|RMIT Malaysia  |Azure|
|SOC 2|Azure, GCP|
|Spanish ENS|Azure|
|California Consumer Privacy Act (CCPA)|AWS, GCP|
|UK OFFICIAL and UK NHS              |Azure|
|AWS Foundational Security Best Practices             |AWS|
|CRI Profile          |AWS, GCP|
|NIST SP 800-172|AWS, GCP|

## Related content

- [Assign regulatory compliance standards](update-regulatory-compliance-packages.yml)
- [Improve regulatory compliance](regulatory-compliance-dashboard.md)
