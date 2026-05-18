---
title: Enable your attack surface reduction rules in Microsoft Defender for Business
description: Get an overview of attack surface reduction capabilities, including attack surface reduction rules, in Microsoft Defender for Business
author: chrisda
ms.author: chrisda
ms.date: 07/23/2024
ms.topic: how-to
ms.service: defender-business
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier1
ms.reviewer: efratka
---

# Enable your attack surface reduction rules in Microsoft Defender for Business

_Attack surfaces_ are all the places and ways the network and devices in your organization are vulnerable to attacks. For example:

- Unsecured devices.
- Unrestricted access to URLs on company devices.
- Unrestricted running of apps or scripts on company devices.

To help protect your network and devices, Microsoft Defender for Business includes several attack surface reduction capabilities, including _attack surface reduction (ASR) rules_. This article describes how to set up your attack surface reduction rules and describes attack surface reduction capabilities.

## Standard protection ASR rules

There are lots of attack surface reduction rules available. You don't have to set them all up at once. And, you can set up some rules in audit mode just to see how they work for your organization, and change them to work in block mode later. That said, we recommend enabling the following standard protection rules as soon as possible:

- [Block credential stealing from the Windows local security authority subsystem](/defender-endpoint/attack-surface-reduction-rules-reference#block-credential-stealing-from-the-windows-local-security-authority-subsystem)
- [Block abuse of exploited vulnerable signed drivers](/defender-endpoint/attack-surface-reduction-rules-reference#block-abuse-of-exploited-vulnerable-signed-drivers)
- [Block persistence through WMI event subscription](/defender-endpoint/attack-surface-reduction-rules-reference#block-persistence-through-wmi-event-subscription)

These rules help protect your network and devices but shouldn't cause disruption for users. Use Intune to set up your attack surface reduction rules.

## Set up ASR rules using Intune

1. In the [Microsoft Intune admin center](https://intune.microsoft.com/), go to **Endpoint security** \> **Attack surface reduction**.

2. Choose **Create policy** to create a new policy.

   - For **Platform**, choose **Windows 10, Windows 11, and Windows Server**.
   - For Profile, select **Attack Surface Reduction Rules**, and then choose **Create**.

3. Set up your policy as follows:

   1. Specify a name and description, and then choose **Next**.

   2. For at least the following three rules, set each one to **Block**:

      - **Block credential stealing from the Windows local security authority subsystem**
      - **Block persistence through WMI event subscription**
      - **Block abuse of exploited vulnerable signed drivers**

      Then choose **Next**.

   3. On the **Scope tags** step, choose **Next**.

   4. On the **Assignments** step, choose the users or devices to receive the rules, and then choose **Next**. (We recommend selecting **Add all devices**.)

   5. On the **Review + create** step, review the information, and then choose **Create**.

> [!TIP]
> You can initially set up rules in audit mode to see detections without actually blocking the processes or files. For more information about attack surface reduction rules, see [Attack surface reduction rules deployment overview](/defender-endpoint/attack-surface-reduction-rules-deployment).

## View your attack surface reduction report

Defender for Business includes an attack surface reduction report that shows how attack surface reduction rules are working for you.

1. In the [Microsoft Defender portal](https://security.microsoft.com), in the navigation pane, choose **Reports**.

2. Under **Endpoints**, choose **Attack surface reduction rules**. The report opens and includes three tabs:

   - **Detections**, where you can view detections that occurred as a result of attack surface reduction rules
   - **Configuration**, where you can view data for standard protection rules or other attack surface reduction rules
   - **Add exclusions**, where you can add items to be excluded from attack surface reduction rules (use exclusions sparingly; every exclusion reduces your level of security protection)

To learn more about attack surface reduction rules, see the following articles:

- [Attack surface reduction rules overview](/defender-endpoint/attack-surface-reduction)
- [Attack surface reduction rules report](/defender-endpoint/attack-surface-reduction-rules-report)
- [Attack surface reduction rules reference](/defender-endpoint/attack-surface-reduction-rules-reference)
- [Attack surface reduction rules deployment overview](/defender-endpoint/attack-surface-reduction-rules-deployment)

## Attack surface reduction capabilities in Defender for Business

Attack surface reduction rules are available in Defender for Business. The following table summarizes attack surface reduction capabilities in Defender for Business. Notice how other capabilities, such as next-generation protection and web content filtering, work together with your attack surface reduction capabilities.

|Capability|How to set it up|
|---|---|
|**Attack surface reduction rules** <br/> Prevent specific actions commonly associated with malicious activity from running on Windows devices.|[Enable your standard protection attack surface reduction rules](#standard-protection-asr-rules) (section in this article).|
|**Controlled folder access** <br/> Allow only trusted apps to access protected folders on Windows devices. Think of this capability as ransomware mitigation.|[Set up controlled folder access policy in Microsoft Defender for Business](mdb-controlled-folder-access.md).|
|**Network protection** <br/> Prevent users from accessing dangerous domains through applications on their Windows and Mac devices. Network protection is also a key component of [web content filtering](mdb-web-content-filtering.md).|Enabled by default when devices are onboarded to Defender for Business and [next-generation protection policies](mdb-next-generation-protection.md) are applied. Default policies are configured with the recommended security settings.|
|**Web protection** <br/> Integrates with web browsers and works with network protection to protect against web threats and unwanted content. Web protection includes web content filtering and web threat reports.|[Set up Web content filtering in Microsoft Defender for Business](mdb-web-content-filtering.md).|
|**Firewall protection** <br/> Determines the network traffic permitted to flow to or from your organization's devices.|Enabled by default when devices are onboarded to Defender for Business and [firewall policies in Defender for Business](mdb-firewall.md) are applied.|

## Next steps

- [Review settings for advanced features and the Microsoft Defender portal](mdb-portal-advanced-feature-settings.md).
- [Use your vulnerability management dashboard](mdb-view-tvm-dashboard.md)
- [View and manage incidents](mdb-view-manage-incidents.md)
- [View reports](mdb-reports.md)
