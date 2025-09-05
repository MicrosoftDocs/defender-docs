---
title: Split incidents into tasks in the Microsoft Defender portal
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

# Split incidents into tasks in the Microsoft Defender portal

Use tasks in the Microsoft Defender portal to investigate and resolve incidents collaboratively across your operations teams. Managing incidents with tasks helps to improve efficiency in incident response and ensure accountability for investigation outcomes. 

This article explains how tasks work and how to use tasks to manage incidents in the Microsoft Defender portal.

## How tasks work

Divide your incident response into individual tasks that you can assign and track. 

Using tasks is particularly useful for: 

- Onboarding junior analysts
- Working with managed security service providers (MSSPs)
- Tracking work in compliance-oriented organizations

### Manage incident response with a unified view of tasks and Security Copilot insights 

Use the incident's task panel to assess what's been done and what needs to be done next. View your team's overall progress by looking at the status bar and task preview cards.

The task panel presents [Security Copilot summaries, guided responses, and reports](./security-copilot-in-microsoft-365-defender.md) side by side with tasks to provide a unified to-do list.  

Categorize, prioritize, assign, and track each task to ensure consistency, collaboration, and accountability. When you close a task, add Closing notes to document the outcome. These notes support thorough postmortems and help teams learn from each investigation.

## Permissions required 

| Action | Permissions required |
|---|---|
| View tasks | **Read-only** permissions or **Security data basics (read)** under the **Security operations** permissions group in the Defender portal. |
| Create tasks | **All read and manage permissions** permissions or **Response (manage)** under the **Security operations** permissions group in the Defender portal. |

For more information about unified RBAC in the Defender portal, see [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac).


## View and manage tasks

To view and manage tasks:

1. Select **Incidents** to open the Incident queue.
1. Open the **Tasks** side panel to see a list of all tasks associated with the incident.

   :::image type="content" source="media/manage-incidents-using-tasks/create-task-defender-portal.png" alt-text="Screenshot showing the Tasks side panel and incident details in Microsoft Defender portal." lightbox="media/manage-incidents-using-tasks/create-task-defender-portal.png":::
1. Select **Add task** to create a new task.

    :::image type="content" source="media/manage-incidents-using-tasks/add-task-page-defender-portal.png" alt-text="Screenshot showing the Add task pane in Microsoft Defender portal." lightbox="media/manage-incidents-using-tasks/add-task-page-defender-portal.png":::



