---
title: Custom functions in the advanced hunting schema
description: Learn about writing your own custom functions for hunting 
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords: 
  - NOCSH
ms.author: dansimp
author: schmurky
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
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
ms.date: 03/28/2025
---

# Use custom functions

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**
- Microsoft Defender XDR

> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

## Types of functions
A function is a type of query in advanced hunting that you can use in other queries as if it's a command. You can create your own custom functions so you can reuse any query logic when you hunt in your environment.

There are three different types of functions in advanced hunting:

![Function types](/defender/media/advanced-hunting-custom-fxns/function-types.png)

- **Built-in functions** – Prebuilt functions included with Microsoft Defender XDR advanced hunting. These functions are available in all advanced hunting instances and can't be modified.
- **Shared functions** – Custom functions that users create. All users in a specific tenant can access these functions. Users can modify and control these functions.
- **My functions** – Custom functions that a user creates. Only the user who created these functions can view and modify them.

## Write your own custom function

To create a function from the current query in the editor:

1. Select **Save** and then **Save as function**.
  ![Save as function](/defender/media/advanced-hunting-custom-fxns/save-as-function.png)

1. In the **Save as function** flyout panel, provide the following information:

    - **Name** - Name of the function. Can contain only numbers, English letters, and underscores. To avoid accidentally using Kusto keywords, begin or end function names with an underscore or begin with a capital letter.
    - **Location** - The folder in which you want to save the function, either shared or private.
    - **Description** - A description that helps other users understand the purpose of the function and how it works.
    - **Parameters** - Add a parameter for each variable in the function that requires a value when it's used. For more information, see [Add parameters to your custom function](#add-parameters-to-your-custom-function).

    ![Save as function dialog box](/defender/media/advanced-hunting-custom-fxns/save-as-function-dialog-box.png)

1. Select **Save**.

### Add parameters to your custom function

You can add parameters to a function so that you can provide the arguments or values for certain variables when calling the function. This feature allows the same function to be used in different queries, each with different values for the parameters. 

To add parameters when saving your custom function, select **Add parameter**, then enter the following properties:
  - **Type** - Data type for the value
  - **Name** - The name that must be used in the query to replace the parameter value
  - **Default value** - Value to use for the parameter if you don't provide a value

Parameters are listed in the order you create them, with parameters that have no default value listed before those that have a default value.

### Create custom functions with tabular parameters

Create custom functions that use tabular parameters. With tabular parameters, you can pass entire tables as inputs. This approach lets you build more modular, reusable, and expressive logic across your hunting queries. This capability is especially useful for complex hunting scenarios that require structured data inputs.

To create tabular parameters for your custom function:
1. Select **Add parameter** and then choose **table** as its **Type**.
1. Enter a **Name** and **Default value** for the table.

      ![Table parameter in custom functions](/defender/media/advanced-hunting-custom-fxns/save-as-function-table.png)
1. Map each column that your query references to the table. Select **Add column**, then enter the column's properties.

      ![Add column details in table parameter](/defender/media/advanced-hunting-custom-fxns/save-as-function-column.png)

> [!NOTE]
>- You can save a function with more than one table. 
>- If your query doesn't reference any columns in the table parameter, you can still save and run the function without mapping any columns. 
>- You can set tabular and scalar parameters in the same function.
  
## Use a custom function
Use a function in a query by typing its name along with values for any parameter, just as you would type in a command. The output of the function can either be returned as results or piped to another command.

Add a function to the current query by double-clicking on its name or selecting the three dots to the right of the function and selecting **Open in query editor**. 

If a query requires arguments, provide them using the following syntax: *function_name(parameter 1, parameter 2, ...)*

![Open in query editor](/defender/media/advanced-hunting-custom-fxns/open-in-query-editor.png)

> [!NOTE]
> You can't use functions inside another function.

## Work with function codes
You can view the code of a function to understand how it works or to modify its code. Select the three dots to the right of the function and select **Load function code** to open a new tab with the function code. 

![Load function code](/defender/media/advanced-hunting-custom-fxns/load-function-code.png)

## Edit a custom function

Edit the properties of a function by selecting the three dots to the right of the function and selecting **Edit details**. Make any modifications that you want to the properties and parameters of the function, then select **Save**.

![Edit function code](/defender/media/advanced-hunting-custom-fxns/edit-function.png)

If the function code is already loaded in the editor, you can also select **Save** to apply any changes to the code or properties of the function.

> [!NOTE]
> Once a function is in use in a saved query or a detection rule, you can't edit the function to expand its scope. For example, if you saved a function that queries identity tables, and this function is used in a detection rule, you can't edit the function to include a device table after the fact. To do that, you can save a new function. Product scoping can be narrowed for the same function but not extended.

## Delete a custom function

You can delete functions from **My functions** and functions you created in **Shared functions**. You can't delete functions that you didn't create, unless you have security data manage permissions.

To delete a function, select the three dots to the right of the function and select **Delete**.

![Screenshot that shows how to delete a custom function.](/defender/media/advanced-hunting-custom-fxns/delete-function.png)
## See also

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Get more query examples](advanced-hunting-shared-queries.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
