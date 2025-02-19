--- 
title: 'Using Projects in Microsoft Defender Threat Intelligence (Defender TI)'
description: 'Learn how to manage projects using Microsoft Defender Threat Intelligence (Defender TI).'
author: alexroland24
ms.author: aroland
manager: dolmont
ms.service: threat-intelligence 
ms.topic: how-to 
ms.date: 01/15/2025
ms.custom: 
- template-overview
- cx-ti
- cx-mdti
---

# Using projects

Microsoft Defender Threat Intelligence (Defender TI)  lets you develop private personal or team projects to organize indicators of interest and indicators of compromise (IOCs) from an investigation. Projects contain a listing of all associated artifacts and a detailed history that retains the names, descriptions, collaborators, and monitoring profiles.

When you search an IP address, domain, or host in **Intel explorer** within the Microsoft Defender portal, and if that indicator is listed within a project you have access to, you can go to the **Projects** tab and navigate to the details of the project for more context about the indicator before reviewing the other data sets for more information. You can also view your private team projects in the Defender portal by going to **Threat intelligence** > **Intel projects**.

Visiting a project's details shows a listing of all associated artifacts and a detailed history that retains all the context described previously. You and other users within your organization no longer need to spend time communicating back and forth. You can build threat actor profiles within Defender TI, which can serve as a "living" set of indicators. As you discover or find new information, you can add it to that project.

Defender TI platform lets you develop multiple project types for organizing indicators of interest and IOCs from an investigation.

The project owner can add collaborators (users listed in their Azure tenant with a Defender TI premium license), who can then make any changes to the project as if they're the owner of the project. However, collaborators can't delete projects. Collaborators can view the projects shared with them in the **Shared projects** tab in the Intel projects page.

You can also download artifacts within a project by selecting the **Download** icon. This feature is a great way for threat hunting teams to use their findings from an investigation to block IOCs or build more detection rules within their security information and event management (SIEM) applications.

**Questions projects might help answer:**

- Has one of my fellow team members created a team project that includes this indicator?

   - If so, what other related IOCs have this team member captured, and what description and tags did they include to describe the type of investigation?

- When did this team member last edit the project?

:::image type="content" source="/defender/threat-intelligence/media/project-details.png" alt-text="Project details screenshot." lightbox="/defender/threat-intelligence/media/project-details.png":::

## Prerequisites

- A Microsoft Entra ID or personal Microsoft account. [Sign in or create an account](https://signup.microsoft.com/)
- A Defender TI premium license.

    > [!NOTE]
    > Users without a Defender TI premium license can still access our free Defender TI offering.


## Open Defender TI Intel projects page in the Microsoft Defender portal

The **Intel projects** page shows you the projects you own or that were shared with you by other Defender TI users in your tenant. 

1. Access the [Defender portal](https://security.microsoft.com/) and complete the Microsoft authentication process. [Learn more about the Defender portal](/defender-xdr/microsoft-365-defender-portal)
2. Navigate to **Threat intelligence** > **Intel projects**. 

## Creating a project

You can create a project in the Defender portal in two ways: 

1. To create a project from the **Intel projects** page, select **New project**.

    :::image type="content" source="/defender/threat-intelligence/media/new-project-01.png" alt-text="Create new project from Intel projects page." lightbox="/defender/threat-intelligence/media/new-project-01.png":::

2. To create a new project while performing an investigation in the **Intel explorer** page, perform an indicator search from the Intel explorer search then select **Add to project** > **Add new project** on the search results.

     :::image type="content" source="/defender/threat-intelligence/media/new-project-02.png" alt-text="Create new project from search results." lightbox="/defender/threat-intelligence/media/new-project-02.png":::

On the **New project** side panel that appears, fill out the required fields and select **Save**.

:::image type="content" source="/defender/threat-intelligence/media/new-project-03.png" alt-text="Add new project." lightbox="/defender/threat-intelligence/media/new-project-03.png":::

## Managing projects

Once you create a project, you can manage it in the **Intel projects** page. This page displays all the projects you can access and provides filtering mechanisms based on project properties. 

By default, the Intel projects page displays the team projects associated with all the Defender TI users in your tenant. You can choose to view just the personal projects you created or the projects that were shared with you to contribute to.

:::image type="content" source="/defender/threat-intelligence/media/manage-projects.png" alt-text="Managing projects." lightbox="/defender/threat-intelligence/media/manage-projects.png":::

- To view the details of a project, select the project's name. 
- To make changes to the project directly, select **Edit** on the top right corner of the project page. You can only edit projects if you have the sufficient access level to them. 
- To add artifacts manually on a project, select **Add artifact** on the top right corner of the project page.
- To delete a project, select **Remove project**. You can only delete the projects that you own.

## Best practices

When it comes to using Defender TI to investigate potential threats, we recommend running the following workflows as these steps enable you to gather strategic and operational intelligence before diving into tactical intelligence.

You perform various types of searches within Defender TI. As such, it's important to approach your intelligence gathering method in a way that presents you with broad results before diving into investigating specific indicators. For example, if you search an IP address in the Intel explorer page, what articles are associated with that IP address? What information do these articles present about the IP address that you wouldn't otherwise find navigating directly to the IP address' **Data** tab for dataset enrichment. For example, has this IP address been identified as a possible command-and-control (C2) server? Who is the threat actor? What other related IOCs are listed in the article, what tactics, techniques, and procedures (TTPs) is the threat actor using and who are they targeting?

In addition to performing various types of searches in Defender TI, you can collaborate with others on investigations. That said, you're encouraged to create projects, add indicators related to an investigation to a project and add collaborators to a project if more than one person is working on the same investigation. This helps reduce time spent analyzing the same IOCs and should result in a quicker workflow observed.