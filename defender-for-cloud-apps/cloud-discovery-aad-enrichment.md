---
title: Enrich cloud discovery data with Microsoft Entra usernames
description: This article provides information about how to enrich Defender for Cloud Apps Discovery data with Microsoft Entra usernames.
ms.date: 07/03/2026
ms.topic: how-to
ms.reviewer: Mravela
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016
ai-usage: ai-assisted
---
# Enrich cloud discovery data with Microsoft Entra usernames



Cloud discovery data can now be enriched with Microsoft Entra username data. When you enable cloud discovery user enrichment, the username received in discovery traffic logs is matched and replaced by the Microsoft Entra username. Cloud discovery enrichment enables the following features:

- You can investigate Shadow IT usage by Microsoft Entra user. The user will be shown with its UPN.
- You can correlate the Discovered cloud app use with the API collected activities.
- You can then create custom reports based on Microsoft Entra user groups. For example, a Shadow IT report for a specific Marketing department.

> [!NOTE]
> As Microsoft Defender moves toward a fully unified identity platform, some Defender for Cloud Apps data pipelines remain separate. Cloud discovery user enrichment uses a separate data pipeline that isn't yet integrated with the [Identity inventory](/defender-for-identity/identity-inventory). Correlations defined in the Identity inventory don't affect cloud discovery user enrichment. For a full list of affected features, see [Enable Identity inventory integration](/defender-cloud-apps/general-setup#enable-identity-inventory-integration).

## Prerequisites

Before you enable user data enrichment, make sure the following prerequisites are met:

- Data source must provide username information
- [Microsoft 365 app connector](./connect-office-365.md) connected

<a name="enabling-user-data-enrichment"></a>
## Enable user data enrichment

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.

1. Under **Cloud Discovery**, select **User enrichment**.

1. In the **User enrichment** tab, select **Enrich discovered user identifiers with Microsoft Entra ID usernames**. This option enables Defender for Cloud Apps to use Microsoft Entra ID data to enrich usernames by default.

    > [!TIP]
    > The **Enrich discovered user identifiers with Microsoft Entra ID usernames** option enriches discovery traffic log usernames with Microsoft Entra ID data.

    ![Screenshot of the User enrichment tab with the option to enrich discovered user identifiers with Microsoft Entra ID usernames.](media/discovery-enrichment.png) 
   
## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]
