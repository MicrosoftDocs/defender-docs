---
title: Contact Asset Filters
titleSuffix: Defender EASM contact asset filters 
description: This article outlines the filter functionality available in Microsoft Defender External Attack Surface Management for contact assets specifically, including operators and applicable field values.
author: danielledennis
ms.author: dandennis
ms.service: defender-easm
ms.date: 07/02/2026
ms.topic: how-to
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Use contact asset filters in Microsoft Defender EASM

The following filters specifically apply to contact assets. Use the contact-asset filters when searching for a specific contact. 

## Freeform filters  

The following filters require that the user manually enters the value with which they want to search.  This list is organized by the number of applicable operators for each filter, then alphabetically. Many of the manually entered values are case-sensitive.

|       Filter name  |     Description                                 |     Value format    |     Applicable operators                                                                                                                                                                                                                              |
|--------------------|-------------------------------------------------|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     Whois Email    |   The primary contact email in a Whois record.  |   name@domain.com   |   `Equals` `Not Equals` `Starts with` `Does not start with` `Matches` `Does Not Match` `In` `Not in` `Starts with in` `Does not start with in` `Matches in` `Does not match in` `Contains` `Does Not Contain` `Contains In` `Does Not Contain In` `Empty` `Not Empty`    |

## Related content

- [Understand asset details](understanding-asset-details.md)
- [Inventory filters](inventory-filters.md)
