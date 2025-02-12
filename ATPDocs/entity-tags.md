---
title: Entity tags in Microsoft Defender for Identity
description: Learn about when to use entity tags with Microsoft Defender for Identity and how to apply them in Microsoft Defender XDR.
ms.date: 09/03/2023
ms.topic: how-to
#CustomerIntent: As a Defender for Identity customer, I want to learn how to apply entity tags so that I can identify sensitive accounts in Microsoft Defender XDR.
---

# Defender for Identity entity tags in Microsoft Defender XDR

This article describes how to apply Microsoft Defender for Identity entity tags, for sensitive, Exchange server, or honeytoken accounts.

- You must tag sensitive accounts for Defender for Identity detections that rely on an entity's sensitivity status, like sensitive group modification detections and lateral movement paths.

    While Defender for Identity automatically tags Exchange servers as high-value, sensitive assets, you can also manually tag devices as Exchange servers.

- Tag honeytoken accounts to set traps for malicious actors. Since honeytoken accounts are usually dormant, any authentication associated with a honeytoken account triggers an alert.

## Prerequisites

To set Defender for Identity entity tags in Microsoft Defender XDR, you'll need Defender for Identity [deployed in your environment](deploy-defender-identity.md), and administrator or user access to Microsoft Defender XDR.

For more information, see [Microsoft Defender for Identity role groups](role-groups.md).

## Tag entities manually

This section describes how to tag an entity manually, such as for a honeytoken account, or if your entity hasn't been automatically tagged as *Sensitive*.

1. Sign into [Microsoft Defender XDR](https://security.microsoft.com) and select **Settings** > **Identities**.

1. Select the type of tag you want to apply: **Sensitive**, **Honeytoken**, or **Exchange server**.

    The page lists the entities already tagged in your system, listed on separate tabs for each entity type:

    - The *Sensitive* tag supports users, devices, and groups.
    - The *Honeytoken* tag supports users and devices.
    - The *Exchange server* tag supports devices only.

1. To tag additional entities, select the **Tag ...** button, such as **Tag users**. A pane opens on the right listing the available entities for you to tag. 

1. Use the search box to find your entity if you need to. Select the entities you want to tag, and then select **Add selection**. 

For example:

:::image type="content" source="media/entity-tags/tag-entities.png" alt-text="Screenshot of tagging user accounts as sensitive." lightbox="media/entity-tags/tag-entities.png":::

## Default sensitive entities

The groups in the following list are considered **Sensitive** by Defender for Identity. Any entity that is a member of one of these Active Directory groups, including nested groups and their members, is automatically considered sensitive:

- Administrators
- Power Users
- Account Operators
- Server Operators
- Print Operators
- Backup Operators
- Replicators
- Network Configuration Operators
- Incoming Forest Trust Builders
- Domain Admins
- Domain Controllers
- Group Policy Creator Owners
- Read-only Domain Controllers
- Enterprise Read-only Domain Controllers
- Schema Admins
- Enterprise Admins
- Microsoft Exchange Servers

  > [!NOTE]
  > Until September 2018, Remote Desktop Users were also automatically considered sensitive by Defender for Identity. Remote Desktop entities or groups added after this date are no longer automatically marked as sensitive while Remote Desktop entities or groups added before this date may remain marked as Sensitive. This Sensitive setting can now be changed manually.

In addition to these groups, Defender for Identity identifies the following high value asset servers and automatically tags them as **Sensitive**:

- Certificate Authority Server
- DHCP Server
- DNS Server
- Microsoft Exchange Server


## Related content

For more information, see [Investigate Defender for Identity security alerts in Microsoft Defender XDR](manage-security-alerts.md).
