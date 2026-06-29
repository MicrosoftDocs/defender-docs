---
title: Create Workbooks for Microsoft Sentinel Solutions
description: Create interactive Microsoft Sentinel workbooks to visualize security data and publish them as part of a Sentinel solution.
ms.author: monaberdugo
author: mberdugo
ms.reviewer: tbeerthuis
ms.service: microsoft-sentinel
ms.topic: how-to
ms.date: 06/15/2026

#CustomerIntent: As an ISV partner, I want to create and publish workbooks for my Microsoft Sentinel solution so that I can provide insights to my customers.
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Create and publish workbooks for Microsoft Sentinel solutions

Workbooks are an integral feature of Microsoft Sentinel, a cloud-native security information and event management (SIEM) solution. Workbooks provide users with interactive, customizable dashboards that aggregate and visualize data from various sources. These dashboards enable organizations to gain deeper insights into their security posture and streamline their efforts in threat detection and response. By integrating data from various sources and facilitating collaboration among security teams, Microsoft Sentinel workbooks can play a pivotal role in strengthening an organization's overall security posture.

This article walks you through the process of creating and publishing workbooks for Microsoft Sentinel solutions.

## Use cases for Microsoft Sentinel workbooks

Microsoft Sentinel workbooks support several common security and reporting scenarios, including the following use cases:

- **Security operations center (SOC) monitoring**: In an SOC, Microsoft Sentinel workbooks are used to monitor and analyze security events in real time. SOC analysts can create workbooks that display key performance indicators (KPIs) such as incident response times, alert volumes, and threat detection rates. By having a centralized view of security metrics, SOC teams can optimize their workflows and improve incident management processes.

- **Compliance and audit reporting**: Organizations need to adhere to regulatory standards and audit requirements. Microsoft Sentinel workbooks help with generating compliance reports by visualizing data related to security controls, user activities, and policy enforcement. Organizations can customize these reports to align with specific regulatory frameworks, so they can more easily demonstrate compliance during audits.

- **Threat hunting**: Threat hunting involves proactively searching for signs of malicious activity within an organization's environment. Microsoft Sentinel workbooks aid threat hunters by providing visual representations of anomalous behaviors, attack patterns, and indicators of compromise (IOCs). Hunters can use these insights to uncover hidden threats, investigate suspicious activities, and take preventive actions before incidents escalate.

## Create a workbook

Before you begin, make sure you have a Microsoft Sentinel workspace, or create one during setup. Perform the following steps to create a workbook in Microsoft Sentinel:

1. Go to the [Azure portal](https://ms.portal.azure.com/) and select **Microsoft Sentinel** from the list of available services.

1. Select your designated workspace for your Microsoft Sentinel instance, or create a new one.

1. In the Microsoft Sentinel workspace, select the **Workbooks** tab.

1. You can either start with a prebuilt template or create a workbook from scratch:
    - To create a workbook from a template, browse through the available templates and select one that matches your needs. Templates provide a quick way to get started with commonly used visualizations and metrics.
    - To create a workbook from scratch, select the **+ New** button. In the blank workbook that opens, you can add your custom queries and visualizations.

1. Workbooks aggregate data from various sources. Use the **Add query** option to bring in data from connected data sources. You can write custom Kusto Query Language (KQL) queries to fetch and filter the data that you need.

1. When you have your data, you can add and customize visualizations to represent it effectively. Microsoft Sentinel offers various visualization options, including charts, tables, and graphs. Adjust the settings to match your specific requirements.

1. After you design your workbook, save it to your workspace.

## Publish your workbook by using a gallery template

To publish your workbook as a gallery template, perform the following steps:

1. Go to your workbook, select **Edit**, and then select **Advanced editor**.

1. Select the **Gallery Template** tab.

   :::image type="content" source="media/sentinel-workbook-creation/sentinel-workbook-edit-mode.png" alt-text="Screenshot that shows the Gallery Template tab in the edit mode of a Microsoft Sentinel workbook." lightbox="media/sentinel-workbook-creation/sentinel-workbook-edit-mode.png":::

1. Copy the gallery template from the Advanced editor and save it as a JSON file on your machine.

1. Add the following template identification properties to the end of your gallery template JSON. These properties set the template ID and schema reference so that Microsoft Sentinel can identify the workbook. Use the format `sentinel-<workbookName>` for the `fromTemplateId` value.

   ```json
    "styleSettings": {},
    "fromTemplateId": "sentinel-MyNewWorkbook",
    "$schema": "https://github.com/Microsoft/Application-Insights-Workbooks/blob/master/schema/workbook.json"
   ```

1. Save the JSON file and upload it to the **Workbooks** folder under your solution repository in GitHub. If the **Workbooks** folder doesn't exist, create it.

1. Capture two screenshots of your workbook: one in dark theme and one in light theme. They're used as preview images for your workbook.

   Be consistent with the file name conventions. The file name for the dark-theme image should contain the word *black*. The file name for the light-theme image should contain the word *white*.

   Upload these images to the [Workbooks preview images folder on GitHub](https://github.com/Azure/Azure-Sentinel/tree/master/Workbooks/Images/Preview).

1. You can optionally add a logo to display in the workbook. Upload the logo to the [Workbook logo images](https://github.com/Azure/Azure-Sentinel/tree/master/Workbooks/Images/Logos) folder on GitHub. The logo should be in SVG format. If you don't provide a logo, the default Microsoft Sentinel logo appears.

1. Add the following JSON metadata entry for your workbook in the [workbook metadata file (WorkbooksMetadata.json)](https://github.com/Azure/Azure-Sentinel/blob/master/Workbooks/WorkbooksMetadata.json). This file contains metadata for all the workbooks in the Microsoft Sentinel gallery. For more details, review the existing entries in WorkbooksMetadata.json.

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

## Related content

- [Publish solutions to Microsoft Sentinel](/azure/sentinel/publish-sentinel-solutions)
