---
title: Surface custom details in Microsoft Sentinel alerts
description: Extract and surface custom event details in alerts in Microsoft Sentinel analytics rules, for better and more complete incident information
ms.author: guywild
author: guywi-ms
ms.reviewer: idpelleg
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016


#Customer intent: As a security analyst, I want to surface custom event details in alerts so that I can triage, investigate, and respond to incidents more efficiently.

---

# Surface custom event details in alerts in Microsoft Sentinel 

[Scheduled query analytics rules](detect-threats-custom.md) analyze **events** from data sources connected to Microsoft Sentinel, and produce **alerts** when the contents of these events are significant from a security perspective. These alerts are further analyzed, grouped, and filtered by Microsoft Sentinel's various engines and distilled into **incidents** that warrant a SOC analyst's attention. However, when the analyst views the incident, only the properties of the component alerts themselves are immediately visible. Getting to the actual content - the information contained in the events - requires doing some digging.

Using the **custom details** feature in the **analytics rule wizard**, you can surface event data in the alerts that are constructed from those events, making the event data part of the alert properties. In effect, this gives you immediate event content visibility in your incidents, enabling you to triage, investigate, draw conclusions, and respond with much greater speed and efficiency.

Use this procedure to add or modify custom details in an existing scheduled query analytics rule. These steps are part of the analytics rule creation wizard but are treated here independently.

[!INCLUDE [unified-soc-preview](includes/unified-soc-preview.md)]

## How to surface custom event details

Perform the following steps to surface custom event details in an analytics rule.

1. Enter the **Analytics** page in the portal through which you access Microsoft Sentinel:

    # [Microsoft Defender portal](#tab/defender)

    From the Microsoft Defender navigation menu, expand **Microsoft Sentinel**, then **Configuration**. Select **Analytics**.

    # [Microsoft Azure portal](#tab/azure)

    From the **Configuration** section of the Microsoft Sentinel navigation menu, select **Analytics**.

    ---

1. Select a scheduled query rule and click **Edit**. Or create a new rule by clicking **Create > Scheduled query rule** at the top of the screen.

1. Click the **Set rule logic** tab.

1. In the **Alert enrichment** section, expand **Custom details**.

    :::image type="content" source="media/surface-custom-details-in-alerts/alert-enrichment.png" alt-text="Find and select custom details":::

1. In the expanded **Custom details** section, add key-value pairs for the details you want to surface:

    1. In the **Key** field, enter a name of your choosing that will appear as the field name in alerts.

    1. In the **Value** field, choose the event parameter you wish to surface in the alerts from the drop-down list. This list will be populated by values corresponding to the fields in the tables that are the subject of the rule query.
    
        :::image type="content" source="media/surface-custom-details-in-alerts/custom-details.png" alt-text="Add custom details":::

1. To surface more details, click **Add new** and enter a **Key** name and select a **Value** from the drop-down list for each additional key-value pair.

    If you change your mind, or if you made a mistake, you can remove a custom detail by clicking the trash can icon next to the **Value** drop-down list for that detail.

1. When you have finished defining custom details, click the **Review and create** tab. Once the rule validation is successful, click **Save**.

    > [!NOTE]
    > 
    > **Service limits**
    > - You can define **up to 20 custom details** in a single analytics rule. Each custom detail can contain **up to 50 values**.
    >
    > - The combined size limit for all custom details and their values in a single alert is **2 KB**. Values in excess of this limit are dropped.

<a name="next-steps"></a>
## Related content

Learn more about alert enrichment and analytics rules in Microsoft Sentinel:

- Explore the other ways to enrich your alerts:
    - [Map data fields to entities in Microsoft Sentinel](map-data-fields-to-entities.md)
    - [Customize alert details in Microsoft Sentinel](customize-alert-details.md)
- Get the complete picture on [scheduled query analytics rules](detect-threats-custom.md).
- Learn more about [entities in Microsoft Sentinel](entities.md).
