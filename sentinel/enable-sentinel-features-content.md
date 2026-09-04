---
title: Enable Microsoft Sentinel SIEM and Initial Features and Content
description: As the first step of your deployment, you enable Microsoft Sentinel, and then enable the health and audit feature, solutions, and content.
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: abhiag
ms.topic: how-to
ms.date: 07/01/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016


#Customer intent: As a security operations analyst, I want to enable and configure Microsoft Sentinel and its key features so that I can monitor and secure my organization's environment effectively.

---

# Enable Microsoft Sentinel SIEM and initial features and content

As part of the [Deployment guide for Microsoft Sentinel](deploy-overview.md), this procedure walks you through enabling Microsoft Sentinel, enabling the health and audit feature, and enabling the solutions and content you've identified according to your organization's needs. This article is intended for security architects and operations teams who have already completed workspace planning and are ready to activate the service. By the end of these steps, you'll have a functioning Microsoft Sentinel instance with health monitoring turned on and the solutions needed for your selected data sources deployed. This procedure covers initial enablement only; configuring data connectors, analytics rules, and other content is handled in subsequent steps of the deployment guide.

## Enable features and content

Use the following steps to enable Microsoft Sentinel features and content for your deployment.

|Step  |Description  |
|---------|---------|
|1. [Enable the Microsoft Sentinel service](quickstart-onboard.md#enable)     | In the Azure portal, enable Microsoft Sentinel to run on the Log Analytics workspace your organization planned as part of your workspace design.    </br></br>To onboard to Microsoft Sentinel by using the API, see the latest supported version of [Sentinel Onboarding States](/rest/api/securityinsights/sentinel-onboarding-states).   |
|2. [Enable health and audit](enable-monitoring.md)     |Enable health and audit at this stage of your deployment to make sure that the service's many moving parts are always functioning as intended and that the service isn't being manipulated by unauthorized actions. Learn more about the [health and audit](health-audit.md) feature.         |
|3. [Enable solutions and content](sentinel-solutions-deploy.md)     |When you planned your deployment, you identified which data sources you need to ingest into Microsoft Sentinel. Now, you want to enable the relevant solutions and content so that the data you need can start flowing into Microsoft Sentinel.         |

<a name="next-steps"></a>
## Next step

> [!div class="nextstepaction"]
> [Configure content](configure-content.md)