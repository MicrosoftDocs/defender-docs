---
title: Alert schema differences: Legacy vs. XDR connector
description: Explains the schema differences between alerts from legacy connectors and the XDR connector in Microsoft Sentinel.
author: guywi-ms
ms.topic: reference
ms.date: 09/04/2025
ms.author: guywild

#Customer intent: As a security analyst, I want to understand the schema differences between alerts from legacy connectors and the XDR connector in Microsoft Sentinel so that I can update my queries, analytic rules, and workbooks when migrating.

---

# Alert schema differences: Legacy vs. XDR connector

This page describes differences between alerts ingested through legacy connectors and the Extended Detection and Response (XDR) connector in Microsoft Sentinel. Schema changes might affect your existing queries, analytic rules, and workbooks. To migrate to the XDR connector, review these differences.

To view the full alert schema, go to the [Security alert schema reference](./security-alert-schema.md).

> [!NOTE]
> Fields marked as *Not available* don't appear in alerts ingested through the XDR connector. If your queries, analytic rules, or workbooks use these fields, they won’t return results and should be updated.


## Microsoft Defender for Endpoint (MDE)

| Legacy field/property                         | XDR behavior                  |
|-----------------------------------------------|-------------------------------|
| ExtendedProperties.MicrosoftDefenderAtp.Category | ExtendedProperties.Category (field renamed) |
| CompromisedEntity                             | Not available                 |
| MicrosoftDefenderAtp.Category                 | Not available                 |

---

## Microsoft Defender for Office (MDO)

| Legacy field/property             | XDR behavior                                        |
|----------------------------------|-----------------------------------------------------|
| ExtendedProperties.InvestigationName | Not available                                     |
| ExtendedProperties.Status        | Different value set (values differ from legacy)     |
| Nonsecurity alerts              | Not included (XDR ingests only security alerts)            |

---

## Azure Active Directory Identity Protection (AADIP)

| Legacy field/property | XDR behavior                                |
|-----------------------|---------------------------------------------|
| CompromisedEntity     | Not available                               |
| Alerts                | Filtered (only high-risk alerts are ingested) |

## Microsoft Cloud App Security (MCAS)

- No schema differences identified.

## Microsoft Defender for Identity (MDI)

| Legacy field/property  | XDR behavior   |
|------------------------|----------------|
| CompromisedEntity      | Not available  |
| ResourceAccessInfo     | Not available  |
| DomainResourceIdentifier | Not available |

## Microsoft Information Protection (IRM)

- We haven't documented schema differences yet.

## Microsoft Defender for Cloud (MDC)

The Microsoft Defender for Cloud connector doesn't have field-level schema differences. 

However, it uses different scoping in XDR:

- **Legacy connector:** subscription level  
- **XDR connector:** tenant level

## What’s next

- [Create and manage analytic rules](./create-analytics-rules.md)  
- [Use workbooks in Microsoft Sentinel](./monitor-your-data.md)   
