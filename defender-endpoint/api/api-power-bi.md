---
title: Create Power BI reports with Microsoft Defender for Endpoint APIs
ms.reviewer: yongrhee
description: Create a Power Business Intelligence (BI) report on top of Microsoft Defender for Endpoint APIs.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: how-to
ms.subservice: reference
ms.custom: api, msecd-doc-authoring-1016
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender for Endpoint
ai-usage: ai-assisted
---

# Create custom reports using Power BI

[!INCLUDE [Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!INCLUDE [Improve request performance](../../includes/improve-request-performance.md)]

Create Power BI reports on top of Defender for Endpoint APIs.

The first example demonstrates how to connect Power BI to Advanced Hunting API, and the second example demonstrates a connection to our OData APIs, such as Machine Actions or Alerts.

## Connect Power BI to Advanced Hunting API

Perform the following steps to connect Power BI to the Advanced Hunting API and build a report from query results.

1. Open Microsoft Power BI.

2. Select **Get Data** \> **Blank Query**.

   :::image type="content" source="../media/power-bi-create-blank-query.png" alt-text="The Blank Query option under the Get Data menu item" lightbox="../media/power-bi-create-blank-query.png":::

3. Select **Advanced Editor**.

   :::image type="content" source="../media/power-bi-open-advanced-editor.png" alt-text="The Advanced Editor menu item" lightbox="../media/power-bi-open-advanced-editor.png":::

4. Copy the code snippet below and paste it in the editor. This query uses the Advanced Hunting API to retrieve up to 20 `DeviceEvents` entries where the action type contains "Anti", and maps the response schema to Power BI data types:

   ```dax
       let
           AdvancedHuntingQuery = "DeviceEvents | where ActionType contains 'Anti' | limit 20",

           HuntingUrl = "https://api.security.microsoft.com/api/advancedqueries",

           Response = Json.Document(Web.Contents(HuntingUrl, [Query=[key=AdvancedHuntingQuery]])),

           TypeMap = #table(
               { "Type", "PowerBiType" },
               {
                   { "Double",   Double.Type },
                   { "Int64",    Int64.Type },
                   { "Int32",    Int32.Type },
                   { "Int16",    Int16.Type },
                   { "UInt64",   Number.Type },
                   { "UInt32",   Number.Type },
                   { "UInt16",   Number.Type },
                   { "Byte",     Byte.Type },
                   { "Single",   Single.Type },
                   { "Decimal",  Decimal.Type },
                   { "TimeSpan", Duration.Type },
                   { "DateTime", DateTimeZone.Type },
                   { "String",   Text.Type },
                   { "Boolean",  Logical.Type },
                   { "SByte",    Logical.Type },
                   { "Guid",     Text.Type }
               }),

           Schema = Table.FromRecords(Response[Schema]),
           TypedSchema = Table.Join(Table.SelectColumns(Schema, {"Name", "Type"}), {"Type"}, TypeMap , {"Type"}),
           Results = Response[Results],
           Rows = Table.FromRecords(Results, Schema[Name]),
           Table = Table.TransformColumnTypes(Rows, Table.ToList(TypedSchema, (c) => {c{0}, c{2}}))

       in Table
   ```

5. Select **Done**.

6. Select **Edit Credentials**.

   :::image type="content" source="../media/power-bi-edit-credentials.png" alt-text="The Edit Credentials menu item" lightbox="../media/power-bi-edit-credentials.png":::

7. Select **Organizational account** \> **Sign in**.

   :::image type="content" source="../media/power-bi-set-credentials-organizational.png" alt-text="The Sign in option in the Organizational account menu item" lightbox="../media/power-bi-set-credentials-organizational.png":::

8. Enter your credentials and wait to be signed in.

9. Select **Connect**.

   :::image type="content" source="../media/power-bi-set-credentials-organizational-cont.png" alt-text="The sign-in confirmation message in the Organizational account menu item" lightbox="../media/power-bi-set-credentials-organizational-cont.png":::

Now the results of your query appear as a table and you can start to build visualizations on top of it! You can duplicate this table, rename it, and edit the Advanced Hunting query inside to get any data you would like.

## Connect Power BI to OData APIs

The only difference between the Advanced Hunting API example and the OData API example is the query inside the editor.

1. Open Microsoft Power BI.

2. Select **Get Data** \> **Blank Query**.

   :::image type="content" source="../media/power-bi-create-blank-query.png" alt-text="The Blank Query option under the Get Data menu item" lightbox="../media/power-bi-create-blank-query.png":::

3. Select **Advanced Editor**.

   :::image type="content" source="../media/power-bi-open-advanced-editor.png" alt-text="The Advanced Editor menu item" lightbox="../media/power-bi-open-advanced-editor.png":::

4. Copy the following code, and paste it in the editor. This query uses the OData API to retrieve all **Machine Actions** from your organization, which you can use to build reports on response activities such as device isolation or antivirus scans:

   ```dax
       let

           Query = "MachineActions",

           Source = OData.Feed("https://api.security.microsoft.com/api/" & Query, null, [Implementation="2.0", MoreColumns=true])
       in
           Source
   ```

   You can do the same for **Alerts** and **Machines**. You also can use OData queries for queries filters. See [Using OData Queries](exposed-apis-odata-samples.md).

## Power BI dashboard samples in GitHub

See the [Power BI report templates](https://github.com/microsoft/MicrosoftDefenderATP-PowerBI).

## Related articles

- [Defender for Endpoint APIs](apis-intro.md)
- [Advanced Hunting API](run-advanced-query-api.md)
- [Using OData Queries](exposed-apis-odata-samples.md)
