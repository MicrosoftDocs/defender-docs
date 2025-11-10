---
title: Security standards in Defender for Cloud
description: Learn about security standards in Microsoft Defender for Cloud, and how it helps ensure compliance with industry, regional, and global standards.
author: dcurwin
ms.author: dacurwin
ms.topic: concept-article
ms.date: 11/04/2025
#customer intent: As a cloud security professional, I want to understand how Defender for Cloud helps me meet regulatory compliance standards, so that I can ensure my organization is compliant with industry standards and regulations.
---

# Security standards in Microsoft Defender for Cloud

Microsoft Defender for Cloud helps you assess and monitor compliance with security, regulatory, and organizational requirements across Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP).

All frameworks, regulations, and benchmarks in Defender for Cloud are represented as security standards. Each standard defines a set of rules and assessment logic that Defender for Cloud continuously evaluates across your connected environments. The results of these evaluations appear in the Regulatory compliance dashboard, where you can track compliance state and investigate noncompliant resources.

## Compliance assessments

Each standard contains multiple controls that represent specific security requirements. Defender for Cloud automatically evaluates your resources against these controls and marks them as compliant, noncompliant, or unavailable for automated assessment.

If no relevant resources exist for a particular standard, it doesn’t appear in the dashboard, even if it’s assigned to the scope.

## View standards in the Regulatory compliance dashboard

The Regulatory compliance dashboard provides an overview of compliance posture across all connected clouds.

:::image type="content" source="media/concepts-regulatory-compliance-standards/compliance-standards.png" alt-text="Screenshot showing the regulatory compliance dashboard in Defender for Cloud." lightbox="media/concepts-regulatory-compliance-standards/compliance-standards.png":::

From the dashboard, you can:

- View all standards assigned to a selected scope.  
- Review the percentage of controls passed per standard.  
- Identify frameworks with the lowest compliance rate.  
- Drill down into failed controls and view affected resources.  
- Generate summary and audit reports.  
- Track compliance trends using [Azure Workbooks](custom-dashboards-azure-workbooks.md).

To learn more about using the Regulatory compliance dashboard, see [Improve regulatory compliance](regulatory-compliance-dashboard.md).

## Security Benchmarks in Microsoft Defender for Cloud

### Microsoft Cloud Security Benchmark (MCSB)

The Microsoft Cloud Security Benchmark (MCSB) is applied by default to all connected environments.  
It defines cloud-agnostic security principles and provides implementation guidance for Azure, AWS, and GCP.  

The latest version, **MCSB v2 (preview)**, introduces expanded guidance with risk-based controls and updated mappings for new workloads such as AI. 
 
Learn more about the [Microsoft Cloud Security Benchmark in Defender for Cloud](concept-regulatory-compliance.md).

### Default cloud-specific benchmarks

In addition to MCSB, Defender for Cloud applies default benchmarks that extend coverage for specific cloud providers:

- AWS: [AWS Foundational Security Best Practices Standard](https://docs.aws.amazon.com/securityhub/latest/userguide/fsbp-standard.html)  
- GCP: GCP Default benchmark  

### Custom standards

You can create custom standards that include built-in or custom recommendations to meet organizational security or compliance needs. Custom standards appear alongside built-in ones in the Regulatory compliance dashboard. 

Learn more about [creating custom standards and recommendations](create-custom-recommendations.md).

## Compliance controls

Each security standard consists of multiple compliance controls, which are logical groups of related security recommendations.

Defender for Cloud continually assesses the environment-in-scope against any compliance controls that can be automatically assessed. Based on assessments, it shows resources as being compliant or non-compliant with controls.

> [!NOTE]
> It's important to note that if standards have compliance controls that can't be automatically assessed, Defender for Cloud isn't able to decide whether a resource complies with the control. In this case, the control will show as greyed out. In addition, if a subscription has no relevant resources to a specific standard, the standard won't be shown in the regulatory compliance dashboard at all, even if it assigned.

## Regulatory and industry standards

Defender for Cloud includes predefined mappings to widely recognized security and compliance frameworks. These standards help organizations monitor adherence to external regulations and certification programs.

The following standards are available in Defender for Cloud:

|Standard|Cloud|
|------------|--------|
| APRA CPS 234 2019 | Azure, AWS |
| Australian Government ISM Protected | Azure |
| Australian Government Information Security Manual 12.2023 | AWS, GCP |
| AWS Foundational Security Best Practices | AWS |
| AWS Well Architected Framework 2024 | AWS |
| Brazil General Data Protection Law (LGPD) 2018 | Azure, AWS, GCP |
| California Consumer Privacy Act (CCPA) | AWS, GCP |
| Canada Federal PBMM 3.2020 | Azure, AWS, GCP |
| CIS Amazon Elastic Kubernetes Service (EKS) Benchmark | AWS |
| CIS AWS Foundations v3.0.0 | AWS |
| CIS Azure Foundations v2.1.0 | Azure |
| CIS Azure Kubernetes Service (AKS) Benchmark | Azure |
| CIS Controls v8.1 | Azure, AWS, GCP |
| CIS GCP Foundations v3.0 | GCP |
| CIS Google Cloud Platform Foundation Benchmark | GCP |
| CIS Google Kubernetes Engine (GKE) Benchmark | GCP |
| CIS Azure Foundations v3.0.0 (Preview) | Azure |
| CRI Profile | AWS, GCP |
| Criminal Justice Information Services Security Policy v5.9.5 | Azure, AWS, GCP |
| CSA Cloud Controls Matrix v4.0.12 | Azure, AWS, GCP |
| Cyber Essentials v3.1 | Azure, AWS, GCP |
| Cybersecurity Maturity Model Certification (CMMC) Level 2 v2.0 | Azure, AWS, GCP |
| DORA 2022 2554 (Preview) | Azure, AWS, GCP |
| EU 2022 2555 (NIS2) 2022 | Azure, AWS, GCP |
| EU General Data Protection Regulation (GDPR) 2016 679 | Azure, AWS, GCP |
| EU AI Act 2024 1689 (Preview) | Azure, AWS, GCP |
| FedRAMP ‘H’ & ‘M’ | Azure |
| FedRAMP High Baseline Rev5 | AWS, GCP |
| FedRAMP Moderate Baseline Rev5 | AWS, GCP |
| FFIEC CAT 2017 | Azure, AWS, GCP |
| HIPAA | Azure |
| HITRUST CSF v11.3.0 | Azure, AWS, GCP |
| HiTrust v11.3 | Azure, AWS |
| ISO IEC 27001:2022 | Azure, AWS, GCP |
| ISO IEC 27002:2022 | Azure, AWS, GCP |
| ISO IEC 27017:2015 | Azure, AWS, GCP |
| K ISMS P 2023 (Preview) | Azure, AWS, GCP |
| NCSC Cyber Assurance Framework (CAF) v3.2 | Azure, AWS, GCP |
| NIST 800 171 Rev3 | Azure, AWS, GCP |
| NIST CSF v2.0 | Azure, AWS, GCP |
| NIST SP 800 53 R5 | AWS |
| NIST SP 800 53 R5.1.1 | Azure, AWS, GCP |
| NIST SP 800 172 2021 | AWS, GCP |
| NZISM v3.7 | Azure, AWS, GCP |
| PCI DSS 3.2.1 | GCP |
| PCI DSS v4.0.1 | Azure, AWS, GCP |
| RMIT Malaysia | Azure |
| Sarbanes Oxley Act 2022 (SOX) | Azure, AWS, GCP |
| SOC 2023 | Azure, AWS, GCP |
| SOC 2 | Azure, GCP |
| Spanish ENS | Azure |
| SWIFT Customer Security Controls Framework 2024 | Azure, AWS, GCP |
| SWIFT CSP-CSCF v2020 | Azure, AWS, GCP |
| UK OFFICIAL and UK NHS | Azure |
| Reserve Bank of India - IT Framework for NBFC | Azure, AWS, GCP |

## Related content

- [Assign regulatory compliance standards](assign-regulatory-compliance-standards.md)
- [Improve regulatory compliance](regulatory-compliance-dashboard.md)
