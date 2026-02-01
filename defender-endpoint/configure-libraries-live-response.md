---
title: Configure libraries for live response in Microsoft Defender for Endpoint
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

# Configure libraries for live response in Microsoft Defender for Endpoint

Configure Microsoft Defender for Endpoint to use libraries for live response. This feature enables you to identify a group of individuals who will immediately be informed and can act on the notifications based on the event. The vulnerability information comes from [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management).

This option allows you to manage the libraries that are used during live response sessions on your endpoints. You can also add libraries in this view, instead of uploading them during a live response session. This can help streamline the live response process and ensure that the necessary libraries are readily available when needed.

You can also update, or remove libraries as needed to ensure that your live response capabilities are up to date and effective.

For more information about live response, see [Investigate entities on devices using live response](live-response.md).

## View libraries

To view the list of libraries available for live response:

1. In the Microsoft Defender portal, go to **Settings** > **Endpoints** > **Library management**.
1. Review the following information for each library:
   - **Name**: The name of the library.
   - **Type**: The type of library (for example, PowerShell or Python).
   - **Created by**: The user who uploaded the library.
   - **Creation date**: The date the library was uploaded.
   - **Updated by**: The user who last updated the library.
   - **Last updated date**: The date the library was last updated.
   - **Has parameters**: Indicates whether the library has parameters that can be configured during a live response session.
   - **Parameters description**: A description of the parameters for the library.

## Add libraries

To add a new library for live response:

1. In the **Library management** page, select **Upload**.
1. In the **Upload file to library** page, select **Upload file to library** on the right.

    The file name is displayed in the **File content** field.

1. In the **File description** field, optionally type a description for the library.
1. If you're uploading an updated version of an existing file, select **Overwrite file**. This replaces the existing file with the new version.
1. To add a description for the parameters of the library, select **File parameters**, and in the **Parameters description** field, type a description.
1. Select **Submit** to upload the library.

    The library is visible in the list of libraries. You can now use this library during live response sessions.

## Manage libraries

To manage existing libraries for live response, select one of the following options from the top menu:

- **Upload**: [Upload a new library](#add-libraries) or an updated version of an existing library.
- **Refresh**: Refresh the list of libraries to see the most up-to-date information.
- **View details**: View detailed information about a selected library, including its parameters and usage history.
- **View file**: View the contents of a selected library.
- **Download**: Download a selected library to your local device.
- **Delete**: Remove a selected library from the list.
- **Filter**: Filter the list of libraries based on specific criteria, such as type or creation date. 