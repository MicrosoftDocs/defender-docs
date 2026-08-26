---
title: Set up multiple workspaces and tenants in Microsoft Sentinel
description: If you've defined that your environment needs multiple workspaces, you now set up your multiple workspace architecture in Microsoft Sentinel.
author: EdB-MSFT
ms.topic: how-to
ms.date: 07/01/2026
ms.author: edbaynash
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016

#Customer intent: As a security architect, I want to use Microsoft Sentinel across multiple workspaces so that I can efficiently monitor and analyze security data across my entire organization.

---

# Set up multiple workspaces and tenants in Microsoft Sentinel

If your environment requires a multiple workspace architecture, you can set it up as part of your Microsoft Sentinel deployment. For more information on planning considerations, see [Prepare for multiple workspaces and tenants in Microsoft Sentinel](prepare-multiple-workspaces.md).

In this article, you learn how to set up Microsoft Sentinel to extend across multiple workspaces and tenants. This article is part of the [Deployment guide for Microsoft Sentinel](deploy-overview.md).

## Options for using multiple workspaces

[!INCLUDE [unified-soc-preview-without-alert](includes/unified-soc-preview-without-alert.md)]

After you set up your environment to extend across workspaces, you can:

- **Manage and monitor your cross-workspace architecture**: Query and analyze your data across workspaces and tenants.

  - If you're onboarding to the Microsoft Defender portal, see [Multiple Microsoft Sentinel workspaces in the Defender portal](workspaces-defender-portal.md) and [Microsoft Defender multitenant management](/defender-xdr/mto-overview).
  - To work in the Azure portal, see [Extend Microsoft Sentinel across workspaces and tenants](extend-sentinel-across-workspaces-tenants.md).

- **Manage multiple workspaces**:  Centrally manage multiple workspaces within one or more tenants.

  - For the Defender portal, see [Multiple Microsoft Sentinel workspaces in the Defender portal](workspaces-defender-portal.md) and [Microsoft Defender multitenant management](/defender-xdr/mto-overview).
  - To work in the Azure portal, see [Centrally manage multiple Microsoft Sentinel workspaces with workspace manager](workspace-manager.md)  within one or more Azure tenants.

For each tenant, the Defender portal allows you to connect to one primary workspace and multiple secondary workspaces for Microsoft Sentinel (preview). For more information, see [Microsoft Defender multitenant management](/defender-xdr/mto-overview).

## Next steps

Now that you've set up Microsoft Sentinel to extend across multiple workspaces and tenants, continue with the next step in the deployment guide.

> [!div class="nextstepaction"]
>>[Enable User and Entity Behavior Analytics (UEBA)](enable-entity-behavior-analytics.md)
