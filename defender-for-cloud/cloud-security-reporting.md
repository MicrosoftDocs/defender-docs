---
title: Cloud security reporting in Microsoft Defender portal
description: Learn how to create, customize, and export cloud security reports in Microsoft Defender portal, including built-in reports and custom report options.
ms.topic: how-to
ms.date: 07/03/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1013
---

# Cloud security reporting in Microsoft Defender portal

Microsoft Defender portal provides integrated reporting capabilities for cloud security data, enabling you to create, customize, and share security insights across your organization.

You can view built-in reports, create custom reports tailored to your needs, and export reports to PDF for sharing with stakeholders. Built-in reports, custom reports, and PDF export enable you to generate and manage reports based on cloud security data and tailor them to your organization's needs.

<a name="capabilities"></a>
## Cloud security reporting capabilities

Cloud security reporting enables you to:

- View built-in cloud security reports such as **CNAPP Executive Summary** and **Cloud Posture**
- Customize existing reports by duplicating and modifying sections, cards, and layout
- Create custom reports from scratch by defining sections and selecting relevant cards
- Customize cards in custom reports to display data that matches your reporting needs
- Export reports to PDF for sharing with stakeholders
- Control report access using visibility settings (Private, Tenant-level access, or Public)
- Filter and organize reports by type (built-in or custom) and visibility

## Prerequisites

Before using cloud security reporting, ensure the following requirements are met:

### Environment requirements

The following environment requirement must be met:

- A Microsoft Defender for Cloud paid plan is enabled

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

Cloud security reporting is available in the following cloud environments:

- Available in commercial clouds (Azure, AWS, and GCP)
- Not available in sovereign clouds

## Access cloud security reports

To access cloud reporting:

1. Go to the **Reporting** page in the Microsoft Defender portal.
1. Select the **Cloud** tab.

:::image type="content" source="media/cloud-security-reporting/reports-cloud.png" alt-text="Screenshot of Microsoft Defender Reports page with the Cloud tab selected, showing Unified security summary and Query resources reports." lightbox="media/cloud-security-reporting/reports-cloud.png":::

## View built-in reports

Microsoft Defender for Cloud includes **built-in reports** that provide predefined views of cloud security data. These reports help security teams and stakeholders quickly understand risk, coverage, and compliance across environments.

**To view a built-in report:**

1. From the **Reporting** page, select the **Cloud** tab.
1. Select a report such as **CNAPP Executive Summary** or **Cloud Posture**.

    :::image type="content" source="media/cloud-security-reporting/built-in-cloud-reports.png" alt-text="Screenshot of Microsoft Defender Reporting page, Cloud tab selected, showing built-in reports CNAPP Executive summary and Cloud posture." lightbox="media/cloud-security-reporting/built-in-cloud-reports.png":::

### CNAPP Executive summary report

The **CNAPP Executive summary** report provides a consolidated, high-level summary of cloud-native application protection platform (CNAPP) signals across your environment. It is designed for security leaders and stakeholders who need a quick, holistic view of cloud risk, coverage, and trends.

#### Overview

The Overview section provides a high-level snapshot of key security indicators across your cloud environment.

:::image type="content" source="media/cloud-security-reporting/executive-summary-report.png" alt-text="Screenshot of CNAPP Executive summary showing threat detection, cloud secure score, and security coverage cards with view buttons." lightbox="media/cloud-security-reporting/executive-summary-report.png":::

#### Secure score

This section shows how the cloud secure score changes over time, with breakdowns that help identify areas with higher risk or slower improvement.

#### Vulnerability management

This section provides insights into vulnerability exposure and remediation across your cloud environments.

#### Security recommendations

This section displays detected security recommendations across the environment, highlighting configuration gaps and best practice deviations that can be remediated to reduce risk.

#### Investigation & response

This section summarizes detection and response activity across your environment.

#### Regulatory compliance

This section shows compliance posture across supported regulatory frameworks, highlighting non-compliant standards and areas that require attention.

#### When to use this report

Use the **CNAPP** (cloud-native application protection platform) **Executive summary** report when you need to:

- Get a quick, executive-level view of overall cloud security risk
- Monitor trends in secure score, vulnerabilities, and alerts over time
- Review security posture and coverage across multiple workloads and environments
- Support leadership briefings and high-level security reviews

### Cloud posture report

The **Cloud posture** report provides a centralized view of your overall cloud security posture across environments and workloads. It helps you assess security risk, track progress over time, and prioritize remediation efforts.

#### Overview

This section summarizes the current security posture, including the cloud secure score and Defender CSPM plan coverage across your environments.

:::image type="content" source="media/cloud-security-reporting/cloud-posture-report.png" alt-text="Screenshot of Cloud posture report showing cloud secure score, Defender CSPM plan coverage, and security posture trends over time." lightbox="media/cloud-security-reporting/cloud-posture-report.png":::

#### Security posture

This section shows how the cloud secure score evolves over time, with breakdowns by environment and workload to help identify areas with higher risk exposure.

#### Recommendations

This section highlights actionable security recommendations and remediation status to help prioritize remediation efforts based on impact.

#### Regulatory compliance

This section displays compliance posture against supported regulatory standards and frameworks, helping identify compliance gaps and track progress toward regulatory requirements.

#### When to use this report

Use the **Cloud posture** report when you need to:

- Monitor overall security posture and secure score progress
- Identify high-risk environments or workload types
- Prioritize remediation based on recommendation impact
- Track compliance posture across regulatory frameworks

## Create a custom report

You can create custom reports to address specific reporting needs.

**To create a custom report:**

1. From the **Reporting** page, select **Create report**.
1. Enter the report details:
   - **Name**: Provide a descriptive name
   - **Description**: Add context about the report purpose
   - **Visibility**: Configure the visibility settings
1. Add content to your report:
   - Create sections to organize information
   - Add cards to display specific data
   - Customize cards that are labeled **Customizable** to configure additional options
   - Edit card titles as needed
   - Adjust card sizes for optimal layout

    :::image type="content" source="media/cloud-security-reporting/report-add-card.png" alt-text="Screenshot of Add card panel in a report showing secure score charts, filter options, and a search bar.":::

1. Select **Save**.

## Customize cards in a custom report

When building or editing a custom report, you can browse the card catalog and configure each card before adding it to your report. Cards labeled **Customizable** support additional configuration options, such as filters for workload or recommendation category.

**To add and customize a card:**

1. In your custom report, select **+ Add card**.

    :::image type="content" source="media/cloud-security-reporting/add-card.png" alt-text="Screenshot of the Add card panel showing available cloud security cards including Cloud secure score over time, Cloud secure score by workload, Cloud threat detection, and Total cloud security alerts." lightbox="media/cloud-security-reporting/add-card.png":::

1. In the **Add card** panel, browse or search the catalog. Use the **Product area** and **Chart type** filters to narrow the list.
1. Select **+** on a card to open the **Add card to report** dialog.

    :::image type="content" source="media/cloud-security-reporting/customize-card.png" alt-text="Screenshot of the Add card to report dialog showing card name, description, section, position, card size, and custom fields options for the Cloud secure score over time card." lightbox="media/cloud-security-reporting/customize-card.png":::

1. Configure the card settings:
   - **Card name**: Edit the display name for the card.
   - **Description**: Add context that appears below the card title.
   - **Section**: Assign the card to an existing section or create a new one.
   - **Position**: Choose where in the report the card appears.
   - **Card size**: Select 1/6, 1/3, 1/2, 2/3, or Full width.
   - **Custom fields**: Available for cards labeled **Customizable**. Configure filters such as workload or recommendation category to tailor the card's data.
1. Select **Add** to insert the card into the report.

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

<a name="visibility-options"></a>
### Review report visibility options

The following visibility options are available for reports:

- **Private**: Only you can view this report.
- **Tenant-level access**: Users who have permission to view data across the entire tenant can view this report.
- **Public**: All users within your tenant can view this report.

:::image type="content" source="media/cloud-security-reporting/report-visibility.png" alt-text="Screenshot of Microsoft Defender Experts Reports page with the Visible to filter set to Private and the Apply button highlighted." lightbox="media/cloud-security-reporting/report-visibility.png":::

### Update report visibility

**To change a report's visibility:**

1. Open the report.
2. Select **Settings** or **Edit**.
3. Change the visibility setting.
4. Select **Save**.

## Related content

- [Cloud overview dashboard](cloud-infrastructure-dashboard.md)
- [Export alerts and recommendations](continuous-export.md)
- [Download a CSV report](export-alerts-to-csv.md)
- [Generate threat intelligence reports](threat-intelligence-reports.md)
- [Create custom dashboards with Azure Workbooks](custom-dashboards-azure-workbooks.md)
- [Add Defender for Cloud data to Power BI](add-data-power-bi.md)
