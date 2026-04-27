---
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

:::image type="content" source="media/cloud-security-reporting/reports-cloud.webp" alt-text="Screenshot of Microsoft Defender Reports page with the Cloud tab selected, showing Unified security summary and Query resources reports." lightbox="media/cloud-security-reporting/reports-cloud.webp":::---

## View built-in reports

Built-in reports provide predefined views of your cloud security data.

**To view a built-in report:**

1. From the **Reporting** page, select the **Cloud** tab.
1. Select a report such as **CNAPP Executive Summary** or **Cloud Posture**.
1. Review the report sections and cards to understand your security posture.

    :::image type="content" source="media/cloud-security-reporting/cnapp-report.png" alt-text="Screenshot of Microsoft Defender Reporting page, Cloud tab selected, showing built-in reports CNAPP Executive summary and Cloud posture." lightbox="media/cloud-security-reporting/cnapp-report.png":::

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

    :::image type="content" source="media/cloud-security-reporting/report-add-card.webp" alt-text="Screenshot of Add card panel in a report showing secure score charts, filter options, and a search bar.":::

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

:::image type="content" source="media/cloud-security-reporting/export-report.webp" alt-text="Screenshot of an Export to PDF dialog in a report, showing upload logo option, Export to PDF and Cancel buttons." lightbox="media/cloud-security-reporting/export-report.webp":::

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

:::image type="content" source="media/cloud-security-reporting/report-visibility.webp" alt-text="Screenshot of Microsoft Defender Experts Reports page with the Visible to filter set to Private and the Apply button highlighted." lightbox="media/cloud-security-reporting/report-visibility.webp":::

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

## Next steps

- Explore built-in reports to understand your cloud security posture
- Create custom reports tailored to your organization's needs
- Share reports with stakeholders using PDF export

## Related content

- [Cloud overview dashboard](cloud-infrastructure-dashboard.md)
- [Generate threat intelligence reports](threat-intelligence-reports.md)