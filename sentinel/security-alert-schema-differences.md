---
title: Microsoft Sentinel alert schema differences between standalone and XDR connectors
description: Learn how alert schema, field mappings, and ingestion behavior differ between standalone connectors and the Microsoft Defender XDR connector in Microsoft Sentinel.
ms.author: guywild
author: guywi-ms
ms.reviewer: idpelleg
ms.topic: reference
ms.date: 06/17/2026

# customer intent: As a security analyst, I want to understand how alerts differ when ingested through the XDR connector so that I can update my queries, analytic rules, and workbooks accordingly.
---

# Alert schema differences: Standalone vs. Microsoft Defender XDR connector

This article explains the differences between alerts ingested through standalone connectors and alerts ingested through the Microsoft Defender XDR connector in Microsoft Sentinel.

Standalone connectors ingest alerts directly from the original security products, whereas the Microsoft Defender XDR connector ingests alerts through the Microsoft Defender XDR pipeline. This includes connectors such as Microsoft Defender for Office 365, Microsoft Defender for Endpoint, Microsoft Defender for Identity, Information Risk Management (IRM), Data Loss Prevention (DLP), Microsoft Defender for Cloud (MDC), and Microsoft Defender for Cloud Apps (MDA).

These differences can affect field mappings, derived field behavior, schema structure, alert ingestion, and connector behavior, which might impact your existing queries, analytic rules, workbooks, and automation. Review these differences before migrating to the XDR connector or onboarding Microsoft Sentinel to the Defender portal with Microsoft Defender XDR.

For the full alert schema, see the [Security alert schema reference](security-alert-schema.md).

## Standalone connector behavior after onboarding to the Defender portal

After you onboard Microsoft Sentinel to the Defender portal with Microsoft Defender XDR, alerts from Microsoft security products are routed through the Microsoft Defender XDR connector instead of standalone Microsoft security product alert connectors.

In a single-workspace environment, alerts from Microsoft security products continue to be available in Microsoft Sentinel, but are ingested through the Microsoft Defender XDR connector. This change can affect source-related fields, field mappings, schema behavior, queries, analytic rules, workbooks, and automation.

In a multi-workspace environment, the Microsoft Defender XDR connector is connected to the primary workspace only. To prevent duplicate tenant-based alerts across workspaces, standalone data connectors for Microsoft Defender for Office 365, Microsoft Entra ID Protection, Microsoft Defender for Cloud Apps, Microsoft Defender for Endpoint, and Microsoft Defender for Identity are automatically disconnected in secondary workspaces during onboarding.

As a result, tenant-based alerts from these Microsoft security products are available only in the primary workspace. Any queries, analytic rules, workbooks, automation rules, or integrations that depend on alerts from standalone Microsoft security product connectors in secondary workspaces no longer function as expected after onboarding.

Non-Microsoft data connectors aren't affected by this behavior.

For more information, see [Multiple Microsoft Sentinel workspaces in the Defender portal](workspaces-defender-portal.md#primary-and-secondary-workspaces).

## CompromisedEntity behavior

The CompromisedEntity field is handled differently across products when alerts are ingested through the XDR connector.

| Product | CompromisedEntity equivalent value in XDR alerts |
|---------|----------------------------------------|
| Microsoft Defender for Endpoint (MDE) | The device where `"LeadingHost": true` in the alert entities JSON |
| Microsoft Entra ID (Identity Protection) | Always set to the user’s UPN |
| Microsoft Defender for Identity (MDI) | Fixed string `"CompromisedEntity"` |

> [!NOTE]
> In MDE alerts, CompromisedEntity is derived from the device where `"LeadingHost": true`. In some alerts, this field might not be populated.

In MDI alerts, CompromisedEntity doesn't represent a host or user and is always the literal string `"CompromisedEntity"`.

## Field mapping changes

Some fields are renamed or use different value sets in alerts from the XDR connector.

| Product | Legacy field/property | XDR behavior |
|---------|-----------------------|--------------|
| MDE | ExtendedProperties.MicrosoftDefenderAtp.Category | Mapped to `ExtendedProperties.Category` |
| Microsoft Defender for Office (MDO) | ExtendedProperties.Status | Uses a different value set from legacy |
| Microsoft Defender for Office (MDO) | ExtendedProperties.InvestigationName | Not available |

## Structural schema transformations (MDI)

The standalone Microsoft Defender for Identity (MDI) connector sometimes used placeholder entities to store additional information. In the XDR connector, this information is folded into properties under the `resourceAccessEvents` collection.

| Legacy entity/property | XDR representation |
|------------------------|-------------------|
| ResourceAccessInfo.Time | `resourceAccessEvents[].AccessDateTime` |
| ResourceAccessInfo.IpAddress | `resourceAccessEvents[].IpAddress` |
| ResourceAccessInfo.ResourceIdentifier.AccountId | `resourceAccessEvents[].AccountId` |
| ResourceAccessInfo.ResourceIdentifier.ResourceName | `resourceAccessEvents[].ResourceIdentifier` |
| DomainResourceIdentifier | `resourceAccessEvents[].ResourceIdentifier` |

ResourceAccessInfo.ComputerId is no longer required because it's identical to the Host entity that ResourceAccessInfo is defined in.

## Alert ingestion filtering

Some alerts available through standalone connectors aren't ingested through the XDR connector.

| Product | Filtering behavior |
|---------|--------------------|
| Microsoft Defender for Cloud (MDC) | Informational severity alerts aren't ingested |
| Microsoft Entra ID | By default, alerts below High severity aren't ingested; customers can configure ingestion to include all severities |

## Scoping behavior (Microsoft Defender for Cloud)

Microsoft Defender for Cloud alerts use different scoping when ingested through the XDR connector.

| Standalone connector scope | XDR connector scope |
|------------------------|---------------------|
| Subscription level | Tenant level |

> [!NOTE]
> All MDC alerts are available in the primary workspace for the tenant. Alerts are scoped according to MDC subscription scopes within Defender XDR.

## Next steps

- [Create and manage analytic rules](create-analytics-rules.md)
- [Use workbooks in Microsoft Sentinel](monitor-your-data.md)