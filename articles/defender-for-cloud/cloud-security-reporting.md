---
title: Cloud security reporting in Microsoft Defender portal (Preview)
description: Learn how to create, customize, and export cloud security reports in Microsoft Defender portal, including built-in reports and custom report options.
ms.topic: how-to
ms.date: 04/27/2026
ms.author: dlanger
author: dlanger
---

# Cloud security reporting in Microsoft Defender portal (Preview)

Microsoft Defender portal provides integrated reporting capabilities for cloud security data, enabling you to create, customize, and share security insights across your organization.

You can view built-in reports, create custom reports tailored to your needs, and export reports to PDF for sharing with stakeholders. These capabilities help you understand your cloud security posture and communicate security insights effectively.

## Capabilities

Cloud security reporting enables you to:

- View built-in cloud security reports such as **CNAPP Executive Summary** and **Cloud Posture**
- Customize existing reports by duplicating and modifying sections, cards, and layout
- Create custom reports from scratch by defining sections and selecting relevant cards
- Export reports to PDF for sharing with stakeholders
- Control report access using visibility settings (Private, Tenant-level access, or Public)
- Filter and organize reports by type (built-in or custom) and visibility

## Prerequisites

Before using cloud security reporting, ensure the following requirements are met:

### Environment requirements

- A Microsoft Defender for Cloud paid plan is enabled
- Preview features are enabled in the Microsoft Defender portal

### Required roles and permissions

You must have at least one of the following roles:

- Global Administrator
- Security Administrator
- Global Reader
- Security Reader
- Security Operator

Or one of the following permissions:

- Core_SecuritySettingsRead
- SecOps_BasicsRead
- Posture_SecureScoreRead
- Core_SecuritySettingsManage
- SecOps_AlertsManage
- Posture_SecureScoreManage

### Supported cloud environments

- Available in commercial clouds (Azure, AWS, and GCP)
- Not available in sovereign clouds

## Access cloud security reports

To access cloud reporting:

1. Go to the **Reporting** page in the Microsoft Defender portal.
. Select the **Cloud** tab.

:::image type="content" source="media/cloud-security-reporting/reports-cloud.png" alt-text="Screenshot of Microsoft Defender Reports page with the Cloud tab selected, showing Unified security summary and Query resources reports." lightbox="media/cloud-security-reporting/reports-cloud.png":::

## View built-in reports

Microsoft Defender for Cloud includes **built-in reports** that provide predefined, out-of-the-box views of your cloud security posture. These reports help security teams and stakeholders quickly understand risk, coverage, and compliance across environments without requiring custom queries or workbooks.

Built-in reports are designed for high-level visibility and decision-making and combine data from secure score, recommendations, vulnerabilities, alerts, and regulatory compliance.

**To view a built-in report:**

1. From the **Reporting** page, select the **Cloud** tab.
1. Select a report such as **CNAPP Executive Summary** or **Cloud Posture**.
1. Review the report sections and cards to understand your security posture.

    :::image type="content" source="media/cloud-security-reporting/built-in-cloud-reports.png" alt-text="Screenshot of Microsoft Defender Reporting page, Cloud tab selected, showing built-in reports CNAPP Executive summary and Cloud posture." lightbox="media/cloud-security-reporting/built-in-cloud-reports.png":::

### CNAPP Executive summary report

The **CNAPP Executive summary** report provides a consolidated, high-level summary of cloud-native application protection platform (CNAPP) signals across your environment. It is designed for security leaders and stakeholders who need a quick, holistic view of cloud risk, coverage, and trends.

#### Overview

Provides a high-level snapshot of key security indicators, including:

- **Threat detection** – The number and severity distribution of active security alerts.
- **Cloud secure score** – An overall percentage score representing alignment with security best practices.
- **Security coverage** – The number of assessed assets and how many are protected by enabled security plans.

:::image type="content" source="media/cloud-security-reporting/executive-summary-report.png" alt-text="Screenshot of CNAPP Executive summary showing threat detection, cloud secure score, and security coverage cards with view buttons." lightbox="media/cloud-security-reporting/executive-summary-report.png":::

#### Secure score

Shows how the cloud secure score changes over time, including:

- Overall secure score trend.
- Secure score breakdown by workload, helping identify areas with higher risk or slower improvement.

#### Vulnerability management

Provides insights into vulnerability exposure and remediation, including:

- Vulnerabilities over time, grouped by severity.
- Top detected cloud CVEs.
- Top security recommendations related to vulnerabilities.
- Visual insights showing vulnerability distribution across environments and resource types.

#### Security recommendations

Displays detected security recommendations across the environment, highlighting configuration gaps and best practice deviations that can be remediated to reduce risk.

#### Investigation & response

Summarizes detection and response activity, including:

- Trends in security alerts by severity.
- Alert response status, such as resolved, in progress, or dismissed alerts.

#### Regulatory compliance

Shows compliance posture across supported regulatory frameworks, highlighting non-compliant standards and areas that require attention.

#### When to use this report

Use the **CNAPP Executive summary** report when you need to:

- Get a quick, executive-level view of overall cloud security risk
- Monitor trends in secure score, vulnerabilities, and alerts over time
- Review security posture and coverage across multiple workloads and environments
- Support leadership briefings and high-level security reviews

### Cloud posture report

The **Cloud posture** report provides a centralized view of your overall cloud security posture across environments and workloads. It helps you assess security risk, track progress over time, and prioritize remediation efforts.

#### Overview

Summarizes the current security posture, including:

- **Cloud secure score**, showing overall alignment with security best practices.
- **New cloud secure score impact**, highlighting the potential score improvement from addressing outstanding recommendations.
- **Defender CSPM plan coverage**, showing which environments are protected by Defender CSPM.

:::image type="content" source="media/cloud-security-reporting/cloud-posture-report.png" alt-text="Screenshot of Cloud posture report showing cloud secure score, Defender CSPM plan coverage, and security posture trends over time." lightbox="media/cloud-security-reporting/cloud-posture-report.png":::

#### Security posture

Shows how the cloud secure score evolves over time, helping you track improvement or regression in your security posture.

The report also provides secure score breakdowns by:

- **Environment**, such as subscriptions or accounts.
- **Workload**, including compute, containers, databases, and networking.

These views help identify environments or workload types with higher risk exposure.

#### Recommendations

Highlights actionable security recommendations and remediation status, including:

- Most common recommendations by criticality.
- Recommendations with the highest potential risk reduction.

This section helps prioritize remediation efforts based on impact.

#### Regulatory compliance

Displays compliance posture against supported regulatory standards and frameworks, helping identify compliance gaps and track progress toward regulatory requirements.

#### When to use this report

Use the **Cloud posture** report when you need to:

- Monitor overall security posture and secure score progress
- Identify high-risk environments or workload types
- Prioritize remediation based on recommendation impact
- Track compliance posture across regulatory frameworks

For deeper analysis and custom reporting, you can export data to workbooks, Log Analytics, or external reporting tools.

## Create a custom report

You can create custom reports to address specific reporting needs.

**To create a custom report:**

1. From the **Reporting** page, select **Create report**.
1. Enter the report details:
   - **Name**: Provide a descriptive name
   - **Description**: Add context about the report purpose
1. Add content to your report:
   - Create sections to organize information
   - Add cards to display specific data
   - Edit card titles as needed
   - Adjust card sizes for optimal layout

    :::image type="content" source="media/cloud-security-reporting/report-add-card.png" alt-text="Screenshot of Add card panel in a report showing secure score charts, filter options, and a search bar.":::

1. Select **Save**.

## Duplicate and edit a report

You can duplicate existing reports and customize them to create variations.

**To duplicate and edit a report:**

1. From the **Reporting** page, select a report.
1. Select **Duplicate**.

    :::image type="content" source="media/cloud-security-reporting/duplicate-report.png" alt-text="Screenshot of a report selection page with CNAPP Executive summary checked, Cloud posture unchecked, and Duplicate button visible.":::

1. In the dialog, configure the new report:
   - Enter a name
   - Add a description
   - Set visibility

    :::image type="content" source="media/cloud-security-reporting/duplicate-report-settings.png" alt-text="Screenshot of the Report details dialog with fields for Name, Description, visibility set to Private, and Duplicate and Cancel buttons." lightbox="media/cloud-security-reporting/duplicate-report-settings.png":::

1. Select **OK** to create the duplicate.
1. Open the duplicated report and make your changes:
   - Reorder sections
   - Add or remove cards
   - Modify card titles and sizes
1. Select **Save** to preserve your changes.

## Export a report

You can export reports to PDF for sharing or archival purposes.

**To export a report:**

1. Open the report you want to export.
1. Select **Export to PDF**.
1. Wait for the export to complete.
1. The PDF file downloads to your local device.

:::image type="content" source="media/cloud-security-reporting/export-report.png" alt-text="Screenshot of an Export to PDF dialog in a report, showing upload logo option, Export to PDF and Cancel buttons." lightbox="media/cloud-security-reporting/export-report.png":::

## Filter reports

You can filter the reports list to find specific reports.

**To filter reports:**

1. From the **Reporting** page, use the filter options:
   - **Report type**: Select Built-in or Custom
   - **Visibility**: Select Private, Tenant-level access, or Public
1. The reports list updates to show only matching reports.

## Manage report visibility

Report visibility controls who can access each report in your organization.

### Visibility options

- **Private**: Only you (the report creator) can view the report
- **Tenant-level access**: Available to users with permissions to view tenant-level data
- **Public**: Available to users with minimal permissions

:::image type="content" source="media/cloud-security-reporting/report-visibility.png" alt-text="Screenshot of Microsoft Defender Experts Reports page with the Visible to filter set to Private and the Apply button highlighted." lightbox="media/cloud-security-reporting/report-visibility.png":::

### Update report visibility

**To change a report's visibility:**

1. Open the report.
2. Select **Settings** or **Edit**.
3. Change the visibility setting.
4. Select **Save**.

> [!NOTE]
> Users can only see reports that match their permission levels. Users cannot expand visibility beyond their allowed levels.

## Limitations

- Visibility follows a one-way hierarchy: **Private → Tenant-level access → Public**
- Once a report is set to a broader visibility level, it cannot be reverted to a more restricted level
- To reduce visibility, duplicate the report and configure the desired visibility on the new copy

## Related content

- [Cloud overview dashboard](cloud-infrastructure-dashboard.md)
- [Export alerts and recommendations](continuous-export.md)
- [Download a CSV report](export-alerts-to-csv.md)
- [Generate threat intelligence reports](threat-intelligence-reports.md)
- [Create custom dashboards with Azure Workbooks](custom-dashboards-azure-workbooks.md)
- [Add Defender for Cloud data to Power BI](add-data-power-bi.md)
