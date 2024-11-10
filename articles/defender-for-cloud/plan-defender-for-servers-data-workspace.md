---
title: Plan Defender for Servers data residency
description: Review data residency and workspace design for Microsoft Defender for Servers.
ms.topic: conceptual
ms.author: dacurwin
author: dcurwin
ms.date: 06/15/2023
ms.custom: references_regions
---
# Plan for data residency and workspaces in Defender for Servers

This article helps you understand how your data is stored in Microsoft Defender for Servers and how Log Analytics workspaces are used in Defender for Servers.

Defender for Servers is one of the paid plans provided by [Microsoft Defender for Cloud](defender-for-cloud-introduction.md).

## Before you begin

This article is the *second* article in the Defender for Servers planning guide series. Begin by [planning your deployment](plan-defender-for-servers.md).

## Understand data residency

Data residency refers to the physical or geographic location of your organization's data.

Before you deploy Defender for Servers, it's important for you to understand data residency for your organization:

- Review [general Azure data residency considerations](https://azure.microsoft.com/blog/making-your-data-residency-choices-easier-with-azure/).
- Review the table in the next section to understand where Defender for Cloud stores data.

### Storage locations

Understand where Defender for Cloud stores data and how you can work with your data:

**Data** | **Location**
--- | ---  
**Security alerts and recommendations** | - Stored in the Defender for Cloud back end and accessible via the Azure portal, Azure Resource Graph, and REST APIs.<br/><br/> - You can export the data to a Log Analytics workspace by using [continuous export](continuous-export.md).
**Machine information** | - Stored in a Log Analytics workspace.<br/><br/> - You can use either the default Defender for Cloud workspace or a custom workspace. Data is stored in accordance with the workspace location.

## Workspace considerations

Defender for Servers needs a Log Analytics workspace when:

You deploy Defender for Servers Plan 2.
You want to take advantage of free daily ingestion for specific data types. [Learn more](data-ingestion-benefit.md).
You're using file integrity monitoring. [Learn more](file-integrity-monitoring-overview.md).


## Next steps

After you understand how data is stored and when workspaces are needed, review [Defender for Server access roles](plan-defender-for-servers-roles.md).
