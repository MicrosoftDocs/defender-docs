---
title: Manage incidents using tasks in the Microsoft Defender portal
description: Create and assign tasks in the Microsoft Defender portal to investigate and resolve incidents collaboratively.
search.appverid: met150
ms.service: unified-secops-platform
ms.author: guywild
author: guywi-ms
ms.date: 09/04/2025
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: how-to

# customer intent: As a security operations analyst, I want to manage incidents using tasks in the Microsoft Defender portal so that I can improve collaboration, efficiency, and accountability in incident investigations.    
---

# Manage incidents using tasks in the Microsoft Defender portal

Use tasks in the Microsoft Defender portal to investigate and resolve incidents collaboratively across your operations teams. Managing incidents with tasks helps to improve efficiency in incident response and ensure accountability for investigation outcomes. 

This article explains how tasks work and how to use tasks to manage incidents in the Microsoft Defender portal.

## How tasks work

Divide your incident response into individual tasks that you can assign and track. Managing incidents with tasks facilitates comprehensive incident handling at scale, and is particularly useful when onboarding junior analysts, working with managed security service providers (MSSPs), or tracking work in compliance-oriented organizations.  

Use the incident's task list to assess what's been done and what needs to be done next. View your team's overall progress by looking at the status bar and task preview cards.

Each task can be categorized, prioritized, assigned, and tracked to ensure standardization, comprehensiveness, collaboration, and accountability. When closing a task, you can add *Closing notes* to document results from each task, making it easy for colleagues and supervisors to conduct full postmortems and reviews of investigations and draw lessons for future cases.

## Permissions required 

| Action | Permissions required |
|---|---|
| View tasks | **Read-only** permissions or **Security data basics (read)** under the **Security operations** permissions group in the Defender portal. |
| Create tasks | **All read and manage permissions** permissions or **Response (manage)** under the **Security operations** permissions group in the Defender portal. |

For more information about unified RBAC in the Defender portal, see [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac).

## View and manage tasks

To view and manage tasks:

1. Navigate to the incident page in the Microsoft Defender portal.
1. Open the **Tasks** side panel to see a list of all tasks associated with the incident.

:::image type="content" source="media/manage-incidents-using-tasks/add-task-page-defender-portal.png" alt-text="Screenshot showing the Add task pane in Microsoft Defender portal." lightbox="media/manage-incidents-using-tasks/add-task-page-defender-portal.png":::

## Create and assign tasks

To create a task:

1. Select an incident from the Sentinel (Azure portal) Incident queue.
1. Select **Task** to launch the side pane
1. Select **Add task**.

:::image type="content" source="media/manage-incidents-using-tasks/create-task-defender-portal.png" alt-text="Screenshot showing the Tasks side panel and incident details in Microsoft Defender portal." lightbox="media/manage-incidents-using-tasks/create-task-defender-portal.png":::



