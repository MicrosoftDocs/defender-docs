---
title: Custom functions in the advanced hunting schema
description: Learn about writing your own custom functions for hunting 
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.custom: 
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: how-to
ms.date: 01/23/2026
---

# Use custom functions

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**
- Microsoft Defender XDR

> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

A function is a type of query in advanced hunting that you can use in other queries as if it were a command. By creating your own custom functions, you can reuse any query logic when you hunt in your environment.

This article explains the different types of functions available in advanced hunting, and the steps for creating and using custom functions.

## Types of functions

Advanced hunting includes three different types of functions:

![Function types](media/advanced-hunting-custom-functions/function-types.png)

- **Built-in functions** – Prebuilt functions included with Microsoft Defender XDR advanced hunting. All advanced hunting instances provide these functions, and you can't modify them.
- **Shared functions** – Custom functions that users create. All users in a specific tenant can access these functions. Users can modify and control these functions.
- **My functions** – Custom functions that a user creates. Only the user who created these functions can view and modify them.

### Custom functions imported from Microsoft Sentinel log analytics

Microsoft Sentinel customers who previously created and saved custom functions in their [Log analytics workspace](/azure/azure-monitor/logs/log-analytics-workspace-overview) can access these functions in the Defender portal, under **Shared functions** > **Sentinel workspace functions**. You can use these functions for workbooks, analytics rules, and running advanced hunting queries in the Defender portal, but not in custom detection rules.

For more information about custom detections in the Defender portal, see [Create custom detection rules](custom-detection-rules.md).

> [!NOTE]
> When creating a new function in advanced hunting, you can't use the same name as the ones imported and saved in the **Sentinel workspace functions**.


## Write your own custom function

To create a function from the current query in the editor:

1. Select **Save** and then **Save as function**.
  ![Save as function](media/advanced-hunting-custom-functions/save-as-function.png)

1. In the **Save as function** flyout panel, provide the following information:

    - **Name** - Name of the function. Can contain only numbers, English letters, and underscores. To avoid accidentally using Kusto keywords, begin or end function names with an underscore or begin with a capital letter.
    - **Location** - The folder in which you want to save the function, either shared or private.
    - **Description** - A description that helps other users understand the purpose of the function and how it works.
    - **Parameters** - Add a parameter for each variable in the function that requires a value when it's used. For more information, see [Add parameters to your custom function](#add-parameters-to-your-custom-function).

    ![Save as function dialog box](media/advanced-hunting-custom-functions/save-as-function-dialog-box.png)

1. Select **Save**.

> [!IMPORTANT]
> You can use custom functions you create in advanced hunting in custom detection rules and advanced hunting queries, as long as you don't save the function in a Microsoft Sentinel workspace.
>
>If you create a custom function and save it in a Microsoft Sentinel workspace, you can use it in workbooks and analytics rules on any Microsoft Sentinel content in this workspace, but not in custom detection rules.

### Add parameters to your custom function

Add parameters to a function so you can provide the arguments or values for certain variables when calling the function. By using this feature, you can use the same function in different queries, each with different values for the parameters. 

To add parameters when saving your custom function, select **Add parameter**, and then enter the following properties:
  - **Type** - Data type for the value
  - **Name** - The name that you must use in the query to replace the parameter value
  - **Default value** - Value to use for the parameter if you don't provide a value

List parameters in the order you create them. List parameters that don't have a default value before those that have a default value.

### Create custom functions with tabular parameters

Create custom functions that use tabular parameters. By using tabular parameters, you can pass entire tables as inputs. This approach lets you build more modular, reusable, and expressive logic across your hunting queries. This capability is especially useful for complex hunting scenarios that require structured data inputs.

To create tabular parameters for your custom function:
1. Select **Add parameter** and then choose **table** as its **Type**.
1. Enter a **Name** and **Default value** for the table.
1. Map each column that your query references to the table. Select **Add column**, and then enter the column's properties.

![Table parameter in custom functions](media/advanced-hunting-custom-functions/save-as-function-table.png)

> [!NOTE]
>- You can save a function with more than one table. 
>- If your query doesn't reference any columns in the table parameter, you can still save and run the function without mapping any columns. 
>- You can set tabular and scalar parameters in the same function.
  
## Use a custom function
Use a function in a query by typing its name along with values for any parameter, just as you would type in a command. The output of the function can either be returned as results or piped to another command.

Add a function to the current query by double-clicking on its name or selecting the three dots to the right of the function and selecting **Open in query editor**. 

If a query requires arguments, provide them by using the following syntax: *function_name(parameter 1, parameter 2, ...)*

![Open in query editor](media/advanced-hunting-custom-functions/open-in-query-editor.png)

> [!NOTE]
> You can't use functions inside another function.

## Work with function codes
You can view the code of a function to understand how it works or to modify its code. Select the three dots to the right of the function and select **Load function code** to open a new tab with the function code. 

![Load function code](media/advanced-hunting-custom-functions/load-function-code.png)

## Edit a custom function

Edit the properties of a function by selecting the three dots to the right of the function and selecting **Edit details**. Make any modifications that you want to the properties and parameters of the function, and then select **Save**.

![Edit function code](media/advanced-hunting-custom-functions/edit-function.png)

If the function code is already loaded in the editor, you can also select **Save** to apply any changes to the code or properties of the function.

> [!NOTE]
> Once a function is in use in a saved query or a detection rule, you can't edit the function to expand its scope. For example, if you saved a function that queries identity tables, and this function is used in a detection rule, you can't edit the function to include a device table after the fact. To make the change, save a new function. You can narrow product scoping for the same function but you can't extend it.

## Delete a custom function

You can delete functions from **My functions** and functions you created in **Shared functions**. You can't delete functions that you didn't create, unless you have security data manager permissions.

To delete a function, select the three dots to the right of the function and select **Delete**.

![Screenshot that shows how to delete a custom function.](media/advanced-hunting-custom-functions/delete-function.png)
## See also

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Get more query examples](advanced-hunting-shared-queries.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
