---
title: Configure library management for live response in Microsoft Defender for Endpoint
description: Use Microsoft Defender for Endpoint to configure libraries for live response.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
search.appverid: met150
ms.date: 02/01/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# Configure the live response library in Microsoft Defender for Endpoint

The **Library management** page in the Microsoft Defender portal allows you to manage files used during live response sessions on your endpoints. You can also add, view, and delete files in the library, instead of uploading them during a live response session.

This article describes how to view, add, and manage libraries for live response.

For more information about live response, see [Investigate entities on devices using live response](live-response.md).

## View files in the library

To view the list of files available for live response:

1. In the Microsoft Defender portal, navigate to **Settings** > **Endpoints** > **Library management**.
1. Review the following information for each file:
   - **Name**: The name of the file.
   - **Type**: The type of file (for example, PowerShell or Python).
   - **Created by**: The user who uploaded the file.
   - **Creation date**: The date the file was uploaded.
   - **Updated by**: The user who last updated the file.
   - **Last updated date**: The date the file was last updated.
   - **Has parameters**: Indicates whether the file has parameters that can be configured during a live response session.
   - **Parameters description**: A description of the parameters for the file.

## Upload files to the library

To add a new file for live response:

1. In the **Library management** page, select **Upload**.
1. In the **Upload file to library** page, select **Upload file to library** on the right.

    The file name is displayed in the **File content** field.

1. In the **File description** field, optionally type a description for the file.
1. If you're uploading an updated version of an existing file, select **Overwrite file**. This replaces the existing file with the new version.
1. To add a description for the parameters of the file, select **File parameters**, and in the **Parameters description** field, type a description.
1. Select **Submit** to upload the file.

    The file is visible in the list of files. You can now use this file during live response sessions.

## Manage files in the library

The following options are available for managing existing files in the library:

| Option | Description | Available from |
|--------|-------------|----------------|
| **Upload** | [Upload a new file](#upload-files-to-the-library) or an updated version of an existing file. | Top menu |
| **Refresh** | Refresh the list of files to see the most up-to-date information. | Top menu |
| **View details** | View detailed information about a selected file, including its parameters and usage history. :::image type="content" source="media/library-management-file-details.png" alt-text="Library management page - view details for a file"::: | Top menu, Right-click menu |
| **View file** | View the contents of a selected file. When you view a file, you can select **Download** to download the file, or **Analyze** to open Copilot script analysis. The analysis provides a description of the actions the script takes, and more information, including the methods used and output. | Top menu, Right-click menu |
| **Download** | Download a selected file to your local device. | Top menu, Right-click menu |
| **Delete** | Remove a selected file from the list. | Top menu, Right-click menu |
| **Filter** | Filter the list of files based on specific criteria, such as type or creation date. | Top menu |