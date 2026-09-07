---
title: Best practices for graph mapping in advanced hunting
description: Learn how to prepare advanced hunting query results and map them to nodes and edges to build a readable, well-enriched graph in Microsoft Defender.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier2
ms.custom:
  - cx-ti
  - cx-ah
ms.topic: best-practice
ms.date: 07/02/2026
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
ai-usage: ai-assisted
---

# Best practices for graph mapping in advanced hunting

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Learn how to turn advanced hunting query results into enriched nodes and meaningful relationships when you [visualize query results as a graph](advanced-hunting-query-results.md#visualize-query-results-as-a-graph).

> [!TIP]
> **Key idea**: The visual builder generates the mapping automatically. Focus on selecting result columns that identify each entity, label it clearly, and explain its relationships.

## Prepare the query results

Design the final query output before opening the mapping builder. It should provide the following information:

- A strong, stable identifier for every entity, such as `DeviceId`, `SHA256`, `AlertId`, or `AccountObjectId`.
- An optional friendly label, such as `DeviceName`, that makes the graph easy to read.
- Any additional identifiers or context you want available when inspecting a node.
- Relationship-specific details, such as `RemotePort` or `InitiatingProcessFileName`.

For every relationship, the source and target identifiers must appear in the same result row. Every column selected in the builder must exist in the final query output and contain the expected values.

## Create the nodes in the builder

Add a node for each entity represented in the query results, then configure these fields:

| Builder field | What to select |
|--|--|
| Type name | A recognized entity name when you want Defender enrichment. Other names are allowed, but they render as generic nodes. |
| Node identifier column | The strongest column that uniquely identifies the entity. Defender also uses this value to look up enrichment data. |
| Display name column | An optional human-readable label. Use it for presentation only, not as a substitute for a strong identifier. |
| Additional columns | Other useful identifiers and entity context. These values are displayed when the node is inspected. |

> [!NOTE]
> **Entity enrichment**: When a node uses a supported type and a valid identifier, selecting it in the graph opens the corresponding Defender entity pane.

### Recognized entity types and identifiers

| Type name(s) | Preferred node identifier |
|--|--|
| Device, Machine | `DeviceId` (Sense device ID) |
| IPAddress, IP, RemoteIP, LocalIP | The corresponding IP address column |
| File | `SHA256`; otherwise `SHA1` |
| Url | URL |
| Alert | `AlertId` |
| Host | Hostname |
| User, Account | `AccountObjectId`; otherwise `AccountSid`, then `AccountUpn` |

> [!TIP]
> When multiple identifiers are available, use the preferred one as the node identifier and include the others under **Additional columns**.

## Connect the nodes with edges

After creating the nodes, add an edge for each relationship and configure these fields:

| Builder field | What to select |
|--|--|
| Relationship label | A short, meaningful description such as `ConnectedTo`, `Downloaded`, or `Triggered`. |
| Source node | The entity where the relationship starts. |
| Target node | The entity where the relationship ends. |
| Additional columns | Context that describes the relationship rather than either entity. |
| Condition | An optional rule that determines whether the edge is created for each result row. |

The source and target must reference nodes already created in the builder. Choose the direction deliberately so the graph reads naturally, and keep relationship details on the edge instead of duplicating them on both nodes.

### Add a condition when the relationship is conditional

Each edge supports one optional condition. For every result row, the edge is created only when that condition is true.

1. **Column**—select the query-result column to evaluate.
1. **Operator**—choose `equals`, `not equals`, `contains`, `not empty`, or `is empty`.
1. **Value**—enter the comparison value for `equals`, `not equals`, and `contains`. No value is used with `not empty` or `is empty`.

| Operator | Value required? | Use it when... |
|--|--|--|
| `equals` | Yes | The column must match the supplied value. |
| `not equals` | Yes | The column must differ from the supplied value. |
| `contains` | Yes | The column must contain the supplied value. |
| `not empty` | No | The column must contain a value. |
| `is empty` | No | The column must not contain a value. |

> [!TIP]
> **Example**: Set the condition to `RemoteIP` **not empty** to create `ConnectedTo` edges only for rows that contain a remote IP address.

If the decision requires several checks, create one derived column in the query and apply the edge condition to that column.

## Worked example: device communicating with an IP address

Assume the query returns `DeviceId`, `DeviceName`, `RemoteIP`, `RemotePort`, and `InitiatingProcessFileName`.

| Builder item | Configuration |
|--|--|
| Machine node | Type: `Machine`; Identifier: `DeviceId`; Display name: `DeviceName` |
| IP node | Type: `IP`; Identifier: `RemoteIP`; Display name: `RemoteIP` |
| ConnectedTo edge | Source: `Machine`; Target: `IP`; Additional columns: `RemotePort`, `InitiatingProcessFileName`; Condition: `RemoteIP` not empty |

This mapping produces readable device-to-IP connections, enables entity enrichment, and keeps the connection details attached to the relationship.

## Final checklist

- Use a recognized type name when an enriched entity pane is expected.
- Select the strongest available identifier and follow the documented precedence.
- Keep the display name readable, but do not rely on it for identity.
- Confirm every selected column is returned and populated by the query.
- Keep node columns entity-specific and edge columns relationship-specific.
- Make sure every edge points between existing nodes in the intended direction.
- For a conditional edge, verify that its column, operator, and required value describe exactly when the relationship should exist.
- Render the graph and select each supported node to confirm that the expected Defender entity pane opens.
