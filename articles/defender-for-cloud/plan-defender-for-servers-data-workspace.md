---
title: Plan Defender for Servers data residency
description: Review data residency and workspace design for Microsoft Defender for Servers.
ms.topic: conceptual
ms.author: dacurwin
author: dcurwin
ms.date: 06/15/2023
ms.custom: references_regions
---
# Understand data storage and workspaces

This article helps you understand how data is stored in Microsoft Defender for Cloud, and when you need a Log Analytics workspace.

Defender for Servers is one of the paid plans provided by [Microsoft Defender for Cloud](defender-for-cloud-introduction.md).

## Before you begin

This article is the *fifth* article in the Defender for Servers planning guide. Before you begin, review the earlier articles:

1. Start [planning your deployment](plan-defender-for-servers.md).
1. Review [Defender for Servers access roles](plan-defender-for-servers-roles.md).
1. Select a [Defender for Servers plan](plan-defender-for-servers-select-plan.md)
1. Understand how [Defender for Servers collects data for assessment and when you need a workspace](plan-defender-for-servers-agents.md).


## Understand data residency

Before you deploy Defender for Servers, learn how Defender for Cloud stores data. 

- Review [general Azure data residency considerations](https://azure.microsoft.com/blog/making-your-data-residency-choices-easier-with-azure/).
- Posture data collected by Defender for Cloud is stored in the Defender for Cloud backend. Data is routed based on the tenant location. European tenants are stored in a Europe location.
- Defender for Cloud's threat protection data including security alerts might be processed in the same region as the cloud resource, and later routed to the MDC backend.
- Data collected by the Defender for Endpoint agent for [file integrity monitoring](file-integrity-monitoring-overview.md) is stored for access and analysis in a Log Analytics workspace.
- You can export data to a Log Analytics workspace using [continuous export](continuous-export.md).




## Next steps

Learn how to [scale a Defender for Server deployment](plan-defender-for-servers-scale.md).
