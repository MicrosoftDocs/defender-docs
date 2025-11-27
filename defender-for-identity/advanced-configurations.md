---
title: Configure advandced settings | Microsoft Defender for Identity
description: This article describes how to configure advanced settings of deploying a Microsoft Defender for Identity sensor.
ms.date: 11/05/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Microsoft Defender for Identity advanced configurations

## Automatic Windows event auditing (Preview)

Defender for Identity uses specific Windows event log entries to enhance detections and provide extra information about the users performing specific actions, such as NTLM sign-ins and security group modifications. 
This article describes how to configure the advanced audit policy settings to avoid gaps in the event logs and incomplete Defender for Identity coverage.

Defender for Identity generates health issues when it detects incorrect windows event auditing configurations. For more information, see [Microsoft Defender for Identity health alerts](../health-alerts.md).

Defender for Identity sensor v3.x supports automatic Windows event auditing on your domain controllers. This feature applies the required Windows event auditing settings to new sensors and fixes misconfigurations on existing ones.

Automatic windows event auditing runs periodically to check and maintain proper audit settings on your Domain Controllers. 

When automatic windows event auditing is enabled, it:

- Checks current audit configuration, and verifies that the current configurations are correct.
- Identifies gap and determines what's missing or needs adjustment.
- Applies changes to settings that aren't properly set, leaving existing configurations intact.
- Adds audit entries to the domain root object's System Access Control List (SACL) to enable required directory service auditing.
- Adds audit entries to the object's System Access Control List (SACL) of the AD FS configuration container, to enable auditing of AD FS-related directory objects.
- Modifies the SACL on the Configuration partition to capture changes to directory service configuration objects.
- Uses standard Windows Registry APIs to configure the required NTLM auditing registry values.
- Configures local Windows audit policy using Windows Local Security Authority (LSA) audit policy APIs.
- Sends health alerts about the configuration state.

If you don't select automatic Windows auditing configuration, you must [manually configure Windows event auditing](configure-windows-event-collection.md) in the Defender portal or using PowerShell.

### Enable Automatic Windows event auditing
 
To turn on automatic windows auditing:
1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings**, and then **Identities**. 
1. In the **General** section, select **Advanced features**.
1. Turn on **Automatic Windows auditing configuration**.​

## Disable Automatic Windows event auditing 
When you turn off automatic windows auditing, Defender for Identity stops checking and applying the required audit settings on your domain controllers. Any configurations applied by automatic windows auditing remain unchanged.

To turn off automatic windows auditing:
1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings**, and then **Identities**. 
1. In the **General** section, select **Advanced features**.
1. Turn off **Automatic Windows auditing configuration**.​



- [Event collection with Microsoft Defender for Identity](event-collection-overview.md)
- [Windows security auditing](/windows/security/threat-protection/auditing/security-auditing-overview)
- [Advanced security audit policies](/windows/security/threat-protection/auditing/advanced-security-auditing)

## Next step

> [!div class="step-by-step"]
> [What are Defender for Identity roles and permissions?](../role-groups.md)
