---
title: Configure Azure Event Hubs for Microsoft Defender XDR event ingestion
description: Configure Azure Event Hubs to ingest streaming events from Microsoft Defender XDR for downstream integration and analysis.
ms.service: defender-xdr
ms.author: edbaynash
author: EdB-MSFT
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
ms.custom: admindeeplinkDEFENDER, msecd-doc-authoring-1014
ms.topic: how-to
ms.date: 06/16/2026
appliesto:
- Microsoft Defender XDR
ai-usage: ai-assisted
---

# Configure Azure Event Hubs to export Microsoft Defender XDR data

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!NOTE]
> **Try our new APIs using MS Graph security API**. Find out more at: [Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview).

Learn how to configure Azure Event Hubs so that your event hub namespace can ingest events from Microsoft Defender XDR.

## Set up the required Resource Provider in the Event Hubs subscription

Register the required resource provider in the Azure subscription where you plan to deploy Event Hubs.

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Select **Subscriptions** > **{ Select the subscription the event hubs will be deployed to }** > **Resource providers**.
1. Verify whether the **Microsoft.Insights** Provider is registered. Otherwise, register it.

:::image type="content" source="media/configure-event-hub/f893db7a7b1f7aa520e8b9257cc72562.png" alt-text="The list of service providers page in the Microsoft Azure portal" lightbox="media/configure-event-hub/f893db7a7b1f7aa520e8b9257cc72562.png":::

<a name='set-up-azure-active-directory-app-registration'></a>

## Set up Microsoft Entra App Registration

> [!NOTE]
> You must have Administrator role or Microsoft Entra ID must be set to allow non-Administrators to register apps. You must also have an Owner or User Access Administrator role to assign the service principal a role. For more information, see [Create a Microsoft Entra app & service principal in the portal - Microsoft identity platform](/azure/active-directory/develop/howto-create-service-principal-portal).

1. Create a new registration (which inherently creates a service principal) in
**Microsoft Entra ID** \> **App registrations** \> **New registration.**

1. Fill out the form with just the Name (no Redirect URI is required).

    :::image type="content" source="media/configure-event-hub/336bc84e6be23900c43232b4ef0c253c.png" alt-text="The application name display section in the Microsoft Azure portal" lightbox="media/configure-event-hub/336bc84e6be23900c43232b4ef0c253c.png":::


    :::image type="content" source="media/configure-event-hub/06ac04c4ff713c2065cec2ef2f99a294.png" alt-text="The Overview information section in the Microsoft Azure portal" lightbox="media/configure-event-hub/06ac04c4ff713c2065cec2ef2f99a294.png":::

1. Create a secret by clicking on **Certificates & secrets** \> **New client secret**:

    :::image type="content" source="media/configure-event-hub/d2ef88d3d2310d2c60c294b569cdf02e.png" alt-text="The Client secret section in the Microsoft Azure portal" lightbox="media/configure-event-hub/d2ef88d3d2310d2c60c294b569cdf02e.png":::

This client secret value is used by Microsoft Graph APIs to authenticate the Microsoft Entra app registration you created.

> [!WARNING]
> **You won't be able to access the client secret again so make sure to save it**.

## Set up Event Hubs namespace

Create an Event Hubs namespace and capture its Resource ID for use in the Microsoft Defender XDR export configuration.

1. Create an Event Hubs Namespace:

    Go **to Event Hub \> Add** and select the pricing tier, throughput units and Auto-Inflate (requires standard pricing and under features) appropriate for the load you're expecting. For more information, see [Pricing - Event Hubs \| Microsoft Azure](https://azure.microsoft.com/pricing/details/event-hubs/).

    > [!NOTE]
    > You can use an existing event-hub, but the throughput and scaling are set at the namespace level. Microsoft recommends to place an event-hub in its own namespace.

   :::image type="content" source="media/configure-event-hub/ebc4ca37c342ad1da75c4aee4018e51a.png" alt-text="The event hubs section in the Microsoft Azure portal" lightbox="media/configure-event-hub/ebc4ca37c342ad1da75c4aee4018e51a.png":::

1. You need the Resource ID of this Event Hubs Namespace. Go to your Azure Event Hubs namespace page \> Properties. Copy the text under Resource ID and record it for use during the Microsoft 365 Configuration.

    :::image type="content" source="media/configure-event-hub/759498162a4e93cbf17c4130d704d164.png" alt-text="The event hubs properties section in the Microsoft Azure portal" lightbox="media/configure-event-hub/759498162a4e93cbf17c4130d704d164.png":::

<a name="add-permissions"></a>
### Add role assignments for Event Hubs namespace access

You're required to add permissions to the following roles to entities that are involved in Event Hubs data management:

- **Contributor**: The permissions related to this role are added to entity who logs in to the Microsoft Defender portal.
- **Reader** and **Azure Event Hub data Receiver**: The permissions related to these roles are assigned to the entity who is already assigned the role of a **Service Principal** and logs in to the Microsoft Entra application.

To ensure that these roles are added, perform the following step:

Go to **Event Hub Namespace** \> **Access Control (IAM)** \> **Add** and verify under **Role assignments**.

:::image type="content" source="media/configure-event-hub/9c9c29137b90d5858920202d87680d16.png" alt-text="An application registration service principal section in the Microsoft Azure portal" lightbox="media/configure-event-hub/9c9c29137b90d5858920202d87680d16.png":::

## Set up Event Hubs

**Option 1:**

You can create Event Hubs within your Namespace and **all** the Event Types (Tables) you select to export are written into this **one** Event Hub.

**Option 2:**

Instead of exporting all the Event Types (Tables) into one Event Hub, you can export each table into different Event Hubs inside your Event Hubs Namespace (one Event Hub per Event Type).

In this option, Microsoft Defender XDR creates Event Hubs for you.

> [!NOTE]
> If you are using an Event Hub Namespace that is **not** part of an Event Hub Cluster, you're only able to choose up to 10 Event Types (Tables) to export in each Export Settings you define, due to an Azure limitation of 10 Event Hub per Event Hub Namespace.

For example:

:::image type="content" source="media/configure-event-hub/005c1f6c10c34420d387f594987f9ffe.png" alt-text="An event hubs section in the Microsoft Azure portal" lightbox="media/configure-event-hub/005c1f6c10c34420d387f594987f9ffe.png":::

If you choose Option 2 (one event hub per event type), skip the manual event hub creation steps below and go directly to the "Configure Microsoft Defender XDR to send email tables" section, where you configure the export settings in the Defender portal.

Create Event Hubs within your Namespace by selecting **Event Hub** \> **+ Event Hub**.

The Partition Count allows for more throughput via parallelism, so it's recommended to increase this number based on the load you're expecting. Default Message Retention and Capture values of 1 and Off are recommended.

:::image type="content" source="media/configure-event-hub/1db04b8ec02a6298d7cc70419ac6e6a9.png" alt-text="An event hubs creation section in the Microsoft Azure portal" lightbox="media/configure-event-hub/1db04b8ec02a6298d7cc70419ac6e6a9.png":::

For these Event Hubs (not namespace), you need to configure a Shared Access Policy with Send, Listen Claims. Click on your **Event Hub** \> **Shared access policies** \> **+ Add** and then give it a Policy name (not used elsewhere) and check **Send** and **Listen**.

:::image type="content" source="media/configure-event-hub/1867d13f46dc6a0f4cdae6cf00df24db.png" alt-text="The Shared access policies page in the Microsoft Azure portal" lightbox="media/configure-event-hub/1867d13f46dc6a0f4cdae6cf00df24db.png":::

<a name='configure-microsoft-365-defender-to-send-email-tables'></a>

## Configure Microsoft Defender XDR to send email tables

<a name='set-up-microsoft-365-defender-send-email-tables-to-splunk-via-event-hubs'></a>

### Set up Microsoft Defender XDR send Email tables to Splunk via Event Hubs

Use the following steps to configure Microsoft Defender XDR to export email tables to Splunk through Event Hubs.

1. Sign in to <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender XDR</a> with an account that meets all the following role requirements:

    - Contributor role at the Event Hubs *Namespace* Resource level or higher for the Event Hubs that you're be exporting to. An export error occurs when you try to save the settings without this permission.

    - Security Admin Role on the tenant tied to Microsoft Defender XDR and Azure.

      :::image type="content" source="media/configure-event-hub/55d5b1c21dd58692fb12a6c1c35bd4fa.png" alt-text="The Settings page of the Microsoft Defender portal" lightbox="media/configure-event-hub/55d5b1c21dd58692fb12a6c1c35bd4fa.png":::

1. Click on **Raw Data Export \> +Add**.

    Use the Event Hubs namespace Resource ID, event hub name, and client secret values you recorded in the earlier setup steps.

    **Name**: This value is local and should be whatever works in your environment.

    **Forward events to event hub**: Select this checkbox.

    **Event-Hub Resource ID**: Enter the Event Hubs namespace Resource ID you recorded during the namespace setup steps.

    **Event-Hub name**: If you created an Event Hubs inside your Event Hubs Namespace, paste the Event Hubs name you previously recorded.

    If you choose to let Microsoft Defender XDR create Event Hubs per Event Types (Tables) for you, leave the **Event-Hub name** field empty.

    **Event Types**: Select the Advanced Hunting tables that you want to forward to the Event Hubs and then on to your custom app. Alert tables are from Microsoft Defender XDR, Devices tables are from Microsoft Defender for Endpoint (EDR), and Email tables are from Microsoft Defender for Office 365. Email Events records all Email Transactions. The URL (Safe Links), Attachment (Safe Attachments), and Post Delivery Events (ZAP) are also recorded and can be joined to the Email Events on the NetworkMessageId field.

    :::image type="content" source="media/configure-event-hub/3b2ad64b6ef0f88cf0175f8d57ef8b97.png" alt-text="The Streaming API settings page in the Microsoft Azure portal" lightbox="media/configure-event-hub/3b2ad64b6ef0f88cf0175f8d57ef8b97.png":::

1. Make sure to click **Submit**.

### Verify that the events are being exported to the Event Hubs

You can verify that events are being sent to the Event Hubs by running a basic Advanced Hunting query. The query uses the `EmailEvents`, `EmailAttachmentInfo`, `EmailUrlInfo`, and `EmailPostDeliveryEvents` Advanced Hunting tables to confirm that email-related data is flowing through the export pipeline. Select **Hunting** \> **Advanced Hunting** \> **Query** and enter the following query:

```console
EmailEvents
|join kind=fullouter EmailAttachmentInfo on NetworkMessageId
|join kind=fullouter EmailUrlInfo on NetworkMessageId
|join kind=fullouter EmailPostDeliveryEvents on NetworkMessageId
|where Timestamp > ago(1h)
|count
```

This query shows you how many emails were received in the last hour joined across all the other tables. The query result also shows whether events are available that could be exported to the Event Hubs. If this count shows 0, then you won't see any data going out to the Event Hubs.

:::image type="content" source="media/configure-event-hub/c305e57dc6f72fa9eb035943f244738e.png" alt-text="The advanced hunting page in the Microsoft Azure portal" lightbox="media/configure-event-hub/c305e57dc6f72fa9eb035943f244738e.png":::

Once you've verified there's data to export, you can view the Event Hubs page to verify that messages are incoming. Exported messages can take up to one hour to appear in Event Hubs.

1. In Azure, go to **Event Hub** \> Click on the **Namespace** \> **Event Hub** \> Click on the **Event Hub**.
1. Under **Overview**, scroll down and in the Messages graph you should see Incoming Messages. If you don't see any results, then there are no messages for your custom app to ingest.

:::image type="content" source="media/configure-event-hub/e88060e315d76e74269a3fc866df047f.png" alt-text=" The Overview page in the Microsoft 365 Azure portal" lightbox="media/configure-event-hub/e88060e315d76e74269a3fc866df047f.png":::

<a name="related-topics"></a>
## Related content

- [Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
