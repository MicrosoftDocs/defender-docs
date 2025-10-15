---  
title: Compare Microsoft Sentinel analytics rules and Microsoft Defender custom detections
titleSuffix: Microsoft Security  
description: Compare the different features supported by Microsoft Sentinel analytics rules and Microsoft Defender custom detections. 
author: poliveria 
ms.service: microsoft-sentinel  
ms.topic: conceptual
ms.custom: sentinel-graph
ms.date: 10/15/2025
ms.author: pauloliveria  

ms.collection: ms-security

#Customer intent: As a Microsoft Sentinel user, I want to understand the diffence between analytics rules and custom detections features as the latter becomes the unified feature for creating rules across Microsoft Sentinel SIEM and Microsoft Defender XDR.
---
# Feature comparison: Microsoft Sentinel analytics rules and Microsoft Defender custom detections

This article lists and compares the different features supported by Microsoft Sentinel analytics rules and Microsoft Defender [custom detections](/defender-xdr/custom-detections-overview). It also provides additional information, such as plans to support any analytics rules capabilities that aren't available in custom detections, if applicable. 

>[!IMPORTANT]
> **Custom detections** is now the best place to create new threat detection rules across Microsoft Sentinel Security Information and Event Management (SIEM) and Microsoft Defender XDR. It lets you create new rules across Microsoft Sentinel SIEM and Defender XDR with enhanced capabilities like flexible entity mapping, dynamic alert titles and descriptions, and customizable alert frequencies. For more information, read this blog post.

## Configuration

| **Feature** | **Analytics rules** | **Custom detections** | **Status and plan for custom detections** |
|---|---|---|---|
| **Advanced entity mapping** |  Supported |  Supported |  |
| **Automatic mapping of Defender XDR entities** |  |  Supported |  |
| **Allow to enrich entities with extra properties** |  Supported |  | Still open; custom detections only supports one identifier per linked entity. Gap will be closed. |
| **Dynamic alert properties** |  Supported | Partially supported | Dynamic alert titles and descriptions are supported. Gap will be closed. |
| **Custom details** |  Supported |  Supported |  |
| **MITRE tactics and techniques** |  Supported | Partially supported | Gap will be closed. |
| **Control alert grouping and limit group of alerts by time** |  Supported |  | Not finalized; in Microsoft Defender, correlation engine takes care of the alerts' grouping logic. |
| **OOTB alert de-duplication** |  |  Supported |  |
| **Re-open closed matching incidents** |  Supported |  | Not finalized; usage of this feature is low. |
| **Events grouping control** |  Supported | Partially supported | No plans to support the same configuration as analytics rules. Custom detections groups events to alerts based on predefined logic. It groups alerts with the same custom details, dynamic details, and entities; otherwise, it creates one alert per event.  |
| **Suppression control** |  Supported |  | Not finalized; usage of this feature is low. |
| **Threshold Control** |  Supported |  | Not finalized; usage of this feature is low. |
| **Create alert without incident** |  Supported |  | Still open; custom detections will support a similar capability. |
| **NRT on Sentinel data** |  Supported |  | Still open; in private preview. |
| **NRT with more than one table** |  Supported |  | Still open; gap will be closed. |
| **Support built-in XDR functions** |  |  Supported |  |
| **Support custom KQL functions** |  Supported |  | Still open; gap will be closed  |
| **Support querying Defender XDR tables without ingesting into Sentinel** |  |  Supported |  |

## Advanced hunting

| **Feature** | **Analytics rules** | **Custom detections** | **Status and plan for Custom detections** |
|---|---|---|---|
| **Determine start time** |  Supported |  | Not finalized; usage of this feature is low. |
| **Flexible lookback** |  Supported | Partially supported | Analytics rules supports flexible lookback (up to 14 days for rules with frequency of one hour and lower) while custom detections supports 30 days with one-day frequency. Parity with analytics rules is planned. |
| **Long lookback period of 30 days** |  |  Supported |  |
| **NRT streaming** |  |  Supported |  |

## Management

| **Feature** | **Analytics rules** | **Custom detections** | **Status and plan for Custom detections** |
|---|---|---|---|
| **Import/export** |  Supported |  | Still open; gap will be closed. |
| **Content hub integration** |  Supported |  | Still open; gap will be closed. |
| **Repositories integration** |  Supported |  | |
| **Rules on secondary workspace** |  Supported |  | Still open; gap will be closed. |
| **Cross workspace detections using the workspace() operator** |  Supported |  | Still open; gap will be closed. |
| **API** |  Supported | Partially supported | Not all capabilities are available through API, and API is in Beta. Gap will be closed. |
| **CICD templates (AMR, Bicep)** |  Supported |  | Still open; gap will be closed. |
| **Migration experience integration** |  Supported |  | Still open; gap will be closed. |
| **MITRE page integration** |  Supported |  | Still open; gap will be closed. |
| **Support content distribution in MTO** |  |  Supported |  |

## Automation

| **Feature** | **Analytics rules** | **Custom detections** | **Plan for Custom detections** |
|---|---|---|---|
| **Support native 1P action** |  |  Supported |  |
| **Sentinel automation rules with incident trigger** |  Supported |  | Still open; gap will be closed. |
| **Sentinel automation rules with alert trigger** |  Supported |  | Still open; gap will be closed. |

## Health and audit

| **Feature** | **Analytics rules** | **Custom detections** | **Plan for Custom detections** |
|---|---|---|---|
| **Health logs** |  Supported |  | Still open; gap will be closed. |
| **Audit logs** |  Supported | Partially supported | Currently exposed in CloudAppEvents table for Microsoft Defender for Cloud Applications users.  |
| **Overcome ingestion delay** |  |  Supported | Custom detections take into consideration both ingestion delay and creation delay. |

## Quality control

| **Feature** | **Analytics rules** | **Custom detections** | **Status and plan for Custom detections** |
|---|---|---|---|
| **Health UX - Insights panel** |  Supported |  | Not finalized |
| **Rerun on interval** |  Supported |  | Still open; gap will be closed. |
| **Rule results simulation** |  Supported |  | Still open; gap will be closed. |
| **Health and quality workbooks** |  Supported |  | Still open; gap will be closed. |

## Related content
- [Threat detection in Microsoft Sentinel](threat-detection.md)
- [Advanced hunting with Microsoft Sentinel data in Microsoft Defender portal](/defender-xdr/advanced-hunting-microsoft-defender?toc=%2Fazure%2Fsentinel%2FTOC.json&bc=%2Fazure%2Fsentinel%2Fbreadcrumb%2Ftoc.json)
- [Custom detections overview](/defender-xdr/custom-detections-overview)
- [Create custom detection rules](/defender-xdr/custom-detection-rules)