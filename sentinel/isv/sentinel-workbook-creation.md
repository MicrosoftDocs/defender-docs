---
title: Create Workbooks for Microsoft Sentinel Solutions
description: This article guides you through the process of creating and publishing workbooks for Microsoft Sentinel solutions.
ms.author: monaberdugo
author: mberdugo
ms.reviewer: tbeerthuis
ms.service: microsoft-sentinel
ms.topic: how-to
ms.date: 06/25/2026
ai-usage: ai-assisted

#CustomerIntent: As an ISV partner, I want to create and publish workbooks for my Microsoft Sentinel solution so that I can provide insights to my customers.
---

# Create and publish workbooks for Microsoft Sentinel solutions

Workbooks are an integral feature of Microsoft Sentinel, a cloud-native security information and event management (SIEM) solution. Workbooks provide users with interactive, customizable dashboards that aggregate and visualize data from various sources. These dashboards enable organizations to gain deeper insights into their security posture and streamline their efforts in threat detection and response. By integrating data from various sources and facilitating collaboration among security teams, Microsoft Sentinel workbooks can play a pivotal role in strengthening an organization's overall security posture.

This article walks you through the process of creating and publishing workbooks for Microsoft Sentinel solutions.

## Use cases for Microsoft Sentinel workbooks

- **Security operations center (SOC) monitoring**: In an SOC, Microsoft Sentinel workbooks are used to monitor and analyze security events in real time. SOC analysts can create workbooks that display key performance indicators (KPIs) such as incident response times, alert volumes, and threat detection rates. By having a centralized view of security metrics, SOC teams can optimize their workflows and improve incident management processes.

- **Compliance and audit reporting**: Organizations need to adhere to regulatory standards and audit requirements. Microsoft Sentinel workbooks help with generating compliance reports by visualizing data related to security controls, user activities, and policy enforcement. Organizations can customize these reports to align with specific regulatory frameworks, so they can more easily demonstrate compliance during audits.

- **Threat hunting**: Threat hunting involves proactively searching for signs of malicious activity within an organization's environment. Microsoft Sentinel workbooks aid threat hunters by providing visual representations of anomalous behaviors, attack patterns, and indicators of compromise (IOCs). Hunters can use these insights to uncover hidden threats, investigate suspicious activities, and take preventive actions before incidents escalate.

## Create a workbook

1. Go to the [Azure portal](https://ms.portal.azure.com/) and select **Microsoft Sentinel** from the list of available services.

1. Ensure that you have a designated workspace for your Microsoft Sentinel instance. You can either create a new workspace or select an existing one.

1. In the Microsoft Sentinel workspace, select the **Workbooks** tab.

1. You can either start with a prebuilt template or create a workbook from scratch:
    - To create a workbook from a template, browse through the available templates and select one that matches your needs. Templates provide a quick way to get started with commonly used visualizations and metrics.
    - To create a workbook from scratch, select the **+ New** button. In the blank workbook that opens, you can add your custom queries and visualizations.

1. Workbooks aggregate data from various sources. Use the **Add query** option to bring in data from connected data sources. You can write custom Kusto Query Language (KQL) queries to fetch and filter the data that you need.

1. When you have your data, you can add and customize visualizations to represent it effectively. Microsoft Sentinel offers various visualization options, including charts, tables, and graphs. Adjust the settings to match your specific requirements.

1. After you design your workbook, save it to your workspace.

## Publish your workbook by using a gallery template

1. Go to your workbook, select **Edit**, and then select **Advanced editor**.

1. Select the **Gallery Template** tab.

   :::image type="content" source="media/sentinel-workbook-creation/sentinel-workbook-edit-mode.png" alt-text="Screenshot that shows the Gallery Template tab in the edit mode of a Microsoft Sentinel workbook." lightbox="media/sentinel-workbook-creation/sentinel-workbook-edit-mode.png":::

1. Copy the gallery template and save it as JSON file on your machine.

1. Add the following properties to your gallery template. These properties identify the specific Microsoft Sentinel workbook that was opened. Use the format `sentinel-<workbookName>` for consistency.

   ```json
    "styleSettings": {},
    "fromTemplateId": "sentinel-MyNewWorkbook",
    "$schema": "https://github.com/Microsoft/Application-Insights-Workbooks/blob/master/schema/workbook.json"
   ```

1. Save the JSON file and upload it to the **Workbooks** folder under your solution repository in GitHub. If the **Workbooks** folder doesn't exist, create it.

1. Capture two screenshots of your workbook: one in dark theme and one in light theme. They're used as preview images for your workbook.

   Be consistent with the file name conventions. The file name for the dark-theme image should contain the word *black*. The file name for the light-theme image should contain the word *white*.

   Upload these images to [GitHub](https://github.com/Azure/Azure-Sentinel/tree/master/Workbooks/Images/Preview).

1. You can optionally add a logo to display in the workbook. Upload the logo to the [Logos](https://github.com/Azure/Azure-Sentinel/tree/master/Workbooks/Images/Logos) folder in GitHub. The logo should be in SVG format. If you don't provide a logo, the default Microsoft Sentinel logo appears.

1. Add the following section for your workbook in the [WorkbooksMetadata.json](https://github.com/Azure/Azure-Sentinel/blob/master/Workbooks/WorkbooksMetadata.json) file. This file contains metadata for all the workbooks in the Microsoft Sentinel gallery. For more details, you can look at the existing entries in the file.

   ```json
   {
    "workbookKey": "YourWorkbookKey", // in the format of "<Name>Workbook". Ensure that the key is unique across all workbooks
     "logoFileName": "",// If you have a logo, provide the filename here
     "description": "description of the workbook.", // Will be displayed on the workbooks blade next to the logo and preview mages
 
    "dataTypesDependencies": [ "Datatype" ],//The data type(s) that your workbook queries
     "dataConnectorsDependencies": [],//Relevant connectors
     "previewImagesFileNames": [ ],//The relative path of the preview images you saved under workbooks/images/previews
     "version": "1.0", // if this is a new workbook - this should be "1.0"
 
    "title": "Workbook title",//This should be the name of the workbook which will be displayed in the main workbooks blade - for example "Palo Alto overview"
     "templateRelativePath": "MyNewWorkbook.json",//The relative path of the JSON of the template (the gallery template you saved) 
     "subtitle": "",
 
    "provider": "Your company name" //Name of the company/author who owns the workbook and is responsible for providing support
    }
   ```

## Workbook attributes

The following sections provide a detailed walkthrough of the gallery template properties and the `WorkbooksMetadata.json` entry attributes.

> [!NOTE]
> `WorkbooksMetadata.json` is a shared JSON array that covers all solutions. A trailing comma, duplicate key, or mismatched bracket causes an immediate build failure, so validate the file with a JSON linter after editing.

### Template ID

The `fromTemplateId` attribute identifies the workbook template. It must start with `sentinel-` and be unique in the repository. It should match the `workbookKey` in `WorkbooksMetadata.json` minus the `Workbook` suffix. For example, `workbookKey: "ContosoWorkbook"` maps to `fromTemplateId: "sentinel-Contoso"`.

### Schema

The `$schema` attribute defines the workbook schema. Set it to `https://github.com/Microsoft/Application-Insights-Workbooks/blob/master/schema/workbook.json`.

### Workbook key

The `workbookKey` attribute is the unique key for the workbook entry in `WorkbooksMetadata.json`. It must be unique among all entries and use the format `<Name>Workbook`.

### Logo file name

The `logoFileName` attribute must match the logo file in your solution's `Logos/` folder.

### Description

The `description` attribute is a brief description shown on the Workbooks blade.

### Data types dependencies

The `dataTypesDependencies` attribute lists the table names that your workbook queries.

### Data connectors dependencies

The `dataConnectorsDependencies` attribute must match the `id` field in your connector JSON exactly. A mismatch is a common pull request (PR) review finding.

### Preview image file names

The `previewImagesFileNames` attribute lists the preview image filenames only, without a folder path. Place the files in `Solutions/<YourSolutionName>/Workbooks/Images/Preview/`, named `<WorkbookName>Black.png` for the dark theme and `<WorkbookName>White.png` for the light theme. Add a number suffix for each additional tab, such as `<WorkbookName>Black1.png` and `<WorkbookName>Black2.png`.

### Version

The `version` attribute is a string, not a number. Use `"1.0"` for a new workbook.

### Title

The `title` attribute is the display name shown in the Workbooks gallery.

### Template relative path

The `templateRelativePath` attribute is the workbook JSON filename only, without a folder path. For example, `CiscoISE.json`, not `Workbooks/CiscoISE.json`.

### Provider

The `provider` attribute is your company name.


## Related content

- [Publish solutions to Microsoft Sentinel](/azure/sentinel/publish-sentinel-solutions)
