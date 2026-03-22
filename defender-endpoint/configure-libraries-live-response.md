---
title: Manage the live response file library in Microsoft Defender for Endpoint
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
ms.date: 03/19/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# Manage the live response file library in Microsoft Defender for Endpoint

The **Library management** page in the Microsoft Defender portal allows you to manage files used during Microsoft Defender for Endpoint live response sessions. You can also add, view, and delete files in the library, instead of uploading them during a live response session.

This article describes how to view, add, and manage libraries for live response.

For more information about live response, see [Investigate entities on devices using live response](live-response.md).

## View the list of files

The **Library management** page shows a list of files used during live response sessions on your endpoints.

:::image type="content" source="media/configure-libraries-live-response/library-management-view-all-files.png" alt-text="Screenshot of the library management page - viewing details for a file" lightbox="media/configure-libraries-live-response/library-management-view-all-files.png":::

To view the list of files available for live response:

1. In the Microsoft Defender portal, navigate to **Settings** > **Endpoints** > **Library management**.
1. Review the following information for each file:
   - **Name**: The name of the file.
   - **Type**: The file extension, representing the file type.
   - **Created by**: The user who uploaded the file.
   - **Creation date**: The date the file was uploaded.
   - **Updated by**: The user who last updated the file.
   - **Last updated date**: The date the file was last updated.
   - **Has parameters**: Indicates whether the file has parameters that can be configured during a live response session.
   - **Parameters description**: A description of the parameters for the file.

## Upload files

To add a new file for live response:

1. Select **Upload** from the menu.
1. In the **Upload file to library** page, select **Upload file to library** on the right.

    The file name is displayed in the **File content** field.

1. In the **File description** field, optionally type a description for the file.
1. If you're uploading an updated version of an existing file, select **Overwrite file**. This replaces the existing file with the new version.
1. To add a description for the parameters of the file, select **File parameters**, and in the **Parameters description** field, type a description.
1. Select **Submit** to upload the file.

    The file is visible in the list of files. You can now use this file during live response sessions.

## View file details

To view a file's details, select **View details** from the menu, or right-click the file, and select **View details**. A detailed pane opens, displaying information about the file, including its parameters and usage history.

:::image type="content" source="media/configure-libraries-live-response/library-management-file-details.png" alt-text="Screenshot of the library management page - viewing file details":::

## View and analyze files

To view and analyze a file:

1. Right-click the file and select **View file** or double-click the file row.
1. Select **Download** to download the file, or **Analyze** to open Copilot script analysis.

    > [!NOTE]
    > You need a [Microsoft Security Copilot license](https://www.microsoft.com/security/pricing/microsoft-security-copilot) to analyze the files. If you don't have this license, you can only view files.
    
    The analysis provides a description of the actions the script takes, and more information, including the methods used and output.

    :::image type="content" source="media/configure-libraries-live-response/library-management-view-analyze-file.png" alt-text="Screenshot of the library management page - view and analyze a file" lightbox="media/configure-libraries-live-response/library-management-view-analyze-file.png":::

## Manage files

The following options are available for managing existing files in the library:

| Option | Description | Available from |
|--------|-------------|----------------|
| **Upload** | [Upload a new file](#upload-files) or an updated version of an existing file. | Top menu |
| **Refresh** | Refresh the list of files to see the most up-to-date information. | Top menu |
| **View details** | [View detailed information](#view-file-details) about a selected file.  | Top menu, right-click menu |
| **View file** | [View the file's contents](#view-and-analyze-files). | Top menu, right-click menu |
| **Analyze** | [Analyze a file](#view-and-analyze-files) to get a description of the actions the script takes. | View file window |
| **Download** | Download a selected file to your local device. | Top menu, right-click menu, view file window |
| **Delete** | Remove a selected file from the list. | Top menu, right-click menu |
| **Filter** | Filter the list of files based on specific criteria, such as type or creation date. | Top menu |

## Audit logging

Library management actions are tracked in the Microsoft Defender [audit log](/defender-xdr/microsoft-xdr-auditing). Defender tracks actions such as upload, download, delete, or listing files, and you can view details on these actions in the audit log. This provides visibility into how library files are managed across your organization.

To view audit logs for library management actions:

1. In the Microsoft Defender portal, select **Settings** > **Audit**.
1. Search for audit logs using the following criteria:
   - **Activities - friendly names**: **Ran live response session**
   - **Record Types**: **MSDEResponseActions**

    :::image type="content" source="media/configure-libraries-live-response/library-management-audit-search.png" alt-text="Screenshot of the audit log search criteria for library management actions":::

1. Review the results to see the library management actions performed, including the user, timestamp, and a description of the action. For example, the action description may be: **Library management - downloaded file** or **Library management - created file**, with specific details about the file involved in the action.

    :::image type="content" source="media/configure-libraries-live-response/library-management-audit-result.png" alt-text="Screenshot of the audit log showing library management actions":::