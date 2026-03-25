---
title: Streamline incident response using tasks in the Microsoft Defender portal (Preview)
description: Create and manage tasks in the Microsoft Defender portal to investigate and resolve incidents collaboratively.
search.appverid: met150
ms.service: microsoft-defender
ms.author: guywild
author: guywi-ms
ms.date: 09/04/2025
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: how-to

# customer intent: As a security operations analyst, I want to manage incidents using tasks in the Microsoft Defender portal so that I can improve collaboration, efficiency, and accountability in incident investigations.    
ms.subservice: unified-security-operations
---

# Streamline incident response using tasks in the Microsoft Defender portal (Preview)

Use tasks in the Microsoft Defender portal to investigate and resolve incidents collaboratively across your operations teams. Breaking incidents into actionable tasks boosts operational efficiency and reinforces accountability throughout the process.

This article explains how tasks work and how to use tasks to manage incidents in the Microsoft Defender portal.

## How tasks work

Break down investigations into clear, actionable steps and assign them across your team. 

Using tasks is particularly useful for: 

- Onboarding junior analysts
- Working with managed security service providers (MSSPs)
- Tracking work in compliance-oriented organizations

The task panel presents tasks alongside [Security Copilot summaries, guided responses, and reports](./security-copilot-in-microsoft-365-defender.md) to provide a comprehensive view of progress and remaining actions required to close the incident.  

Categorize, prioritize, assign, and track each task to ensure consistency, collaboration, and accountability. When you close a task, add Closing notes to document the outcome. These notes support thorough postmortems and help teams learn from each investigation.

## Permissions required 

| Action | Permissions required |
|---|---|
| View tasks | **Read-only** permissions or **Security data basics (read)** under the **Security operations** permissions group in the Defender portal. |
| Create tasks | **All read and manage permissions** permissions or **Response (manage)** under the **Security operations** permissions group in the Defender portal. |

For more information about unified RBAC in the Defender portal, see [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac).


## View and manage tasks

To view and manage tasks:

1. From the Defender portal menu, select **Incidents & alerts** > **Incidents** to open the Incident queue.
1. Select an incident from the queue.
1. Select **Tasks** to open the **Tasks** side panel, which lists all of the tasks and Security Copilot insights associated with the incident.

   :::image type="content" source="media/split-incidents-into-tasks/task-pane-defender-portal.png" alt-text="Screenshot showing the Tasks side panel and incident details in Microsoft Defender portal." lightbox="media/split-incidents-into-tasks/task-pane-defender-portal.png":::  

1. To create a new task, select **Add task**.

    :::image type="content" source="media/split-incidents-into-tasks/add-task-page-defender-portal.png" alt-text="Screenshot showing the Add task pane in Microsoft Defender portal." lightbox="media/split-incidents-into-tasks/add-task-page-defender-portal.png":::

    Fill in the task details and select **Save**.

1. To update a task's status, select a status from the **Status** dropdown on task preview card.

   :::image type="content" source="media/split-incidents-into-tasks/update-task-status-defender-portal.png" alt-text="Screenshot showing the Update task status dropdown in Microsoft Defender portal." lightbox="media/split-incidents-into-tasks/update-task-status-defender-portal.png":::

1. To edit or delete a task, select the ellipsis (**...**) > **Edit** or **Delete**.

## Automate and synchronize tasks created in Microsoft Sentinel using the Azure portal

When you onboard Microsoft Sentinel to the Defender portal, the Defender portal automatically synchronizes tasks you create in Sentinel using the Azure portal. 

> [!IMPORTANT]
> Synchronization is one-way - tasks you create in the Defender portal aren't synchronized back to Microsoft Sentinel.

The Defender portal doesn't yet support automatic task creation, but you can continue to use [task automation rules](/azure/sentinel/create-tasks-automation-rule), [Logic App playbooks](/azure/sentinel/automation/create-tasks-playbook), or the [Incident Tasks REST API](/rest/api/securityinsights/incident-tasks) in Azure to create tasks, which are synchronized to the Defender portal.

## Related content

- [Incidents and alerts in the Microsoft Defender portal](./incidents-overview.md)
- [Microsoft Copilot in Microsoft Defender](./security-copilot-in-microsoft-365-defender.md)
- [Use tasks to manage incidents in Microsoft Sentinel in the Azure portal](/azure/sentinel/incident-tasks)
