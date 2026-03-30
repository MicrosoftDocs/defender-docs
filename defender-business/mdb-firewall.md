---
title: Firewall in Microsoft Defender for Business
description: Learn about Windows Firewall settings in Defender for Business. Firewall can help prevent unwanted network traffic from flowing to your company devices.
search.appverid: MET150
author: chrisda
ms.author: chrisda
audience: Admin
ms.topic: overview
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 06/19/2024
ms.reviewer: nehabha
f1.keywords: NOCSH
ms.collection:
- SMB
- m365-security
- tier1
---

# Firewall in Microsoft Defender for Business

Defender for Business includes firewall capabilities through [Windows Firewall](/windows/security/operating-system-security/network-security/windows-firewall/). Firewall protection helps secure devices by establishing rules that determine what network traffic is permitted to flow to and from devices.

You can use firewall protection to specify whether to allow or to block connections on devices in various locations. For example, your firewall settings can allow inbound connections on devices that are connected to your company's internal network but prevent connections when the device is on a network with untrusted devices.

**This article describes**:

- [How to view or edit your firewall policies and custom rules](#view-or-edit-your-firewall-policies-and-custom-rules)
- [Default firewall settings in Defender for Business](#default-firewall-settings-in-defender-for-business)
- [Firewall settings you can configure in Defender for Business](#firewall-settings-you-can-configure-in-defender-for-business)

## View or edit your firewall policies and custom rules

Depending on whether you're using the Microsoft Defender portal or Intune to manage your firewall protection, use one of the following procedures.

### Use the Microsoft Defender portal to view or edit firewall policies

1. Go to the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)), and sign in.

2. In the navigation pane, choose **Device configuration**. Policies are organized by operating system and policy type.

3. Select an operating system tab (such as **Windows clients**).

4. Expand **Firewall** to view your list of policies.

5. Select a policy to view the details. To make changes or to learn more about policy settings, see the following articles:

   - [View or edit device policies](mdb-view-edit-create-policies.md)
   - [Firewall settings](mdb-firewall.md)
   - [Manage your custom rules for firewall policies](mdb-firewall.md)

### Use the Intune admin center to view or edit firewall policies

1. Go to [https://intune.microsoft.com](https://intune.microsoft.com) and sign in. You're now in the Intune admin center.

2. Select **Endpoint security**.

3. Select **Firewall** to view your policies in that category. Custom rules that are defined for firewall protection are listed as separate policies. To get help with managing your security settings in Intune, start with [Manage endpoint security in Microsoft Intune](/intune/intune-service/protect/endpoint-security).

## Manage your custom rules for firewall policies in Microsoft Defender for Business

You can use custom rules to define exceptions for your firewall policies. That is, you can use custom rules to block or allow specific connections.

### Create a custom rule for a firewall policy

1. Go to the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) and sign in.

2. Go to **Endpoints** \> **Device configuration**, and review the list of policies.

3. In the **Firewall** section, select an existing policy, or add a new policy.

4. On the **Configuration settings** step, review the settings. Make any needed changes to **Domain network**, **Public network**, and **Private network**.

5. To create a custom rule, follow these steps:

   1. Under **Custom rules**, choose **+ Add rule**. (You can have up to 150 custom rules.)

   2. On the **Create new rule** flyout, specify a name and description for the rule.

   3. Select a profile. (Your options include **Domain network**, **Public network**, or **Private network**.)

   4. In the **Remote address type** list, select either **IP** or **Application file path**.

   5. In the **Value** box, specify an appropriate value. Depending on what you selected in step 6d, you might specify an IP address, an IP address range, or an application file path. (See [Firewall settings](mdb-firewall.md).)

   6. On the **Create new rule** flyout, select **Create rule**.

6. On the **Configuration settings** screen, choose **Next**.

7. On the **Review your policy** screen, review the changes that were made to firewall policy settings. Make any needed changes, and then choose **Create policy**.

### Edit a custom rule for a firewall policy

1. Go to the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) and sign in.

2. Go to **Endpoints** \> **Device configuration**, and review the list of policies.

3. In the **Firewall** section, select an existing policy, or add a new policy.

4. Under **Custom rules**, review the list of rules.

5. Select a rule, and then choose **Edit**. Its flyout opens.

6. To edit your custom rule, follow these steps:

   1. On the **Edit rule** flyout, review and edit the rule's name and description.

   2. Review and if necessary, edit the rule's profile. (Your options include **Domain network**, **Public network**, or **Private network**.)

   3. In the **Remote address type** list, select either **IP** or **Application file path**.

   4. In the **Value** box, specify an appropriate value. Depending on what you selected in step 6c, you might specify an IP address, an IP address range, or an application file path. (See [Firewall settings](mdb-firewall.md).)

   5. Set **Enable rule** to **On** to make the rule active. Or, to disable the rule, set the switch to **Off**.

   6. On the **Edit rule** flyout, select **Update rule**.

7. On the **Configuration settings** screen, choose **Next**.

8. On the **Review your policy** screen, review the changes that were made to firewall policy settings. Make any needed changes, and then choose **Create policy**.

### Delete a custom rule

1. Go to the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) and sign in.

2. Go to **Endpoints** \> **Device configuration**, and review the list of policies.

3. In the **Firewall** section, select an existing policy, or add a new policy.

4. Under **Custom rules**, review the list of rules.

5. Select a rule, and then choose **Delete**. Its flyout opens.

6. On the confirmation screen, choose **Delete**.

## Default firewall settings in Defender for Business

Defender for Business includes default firewall policies and settings to help protect your company's devices from day one. As soon as your company's devices are onboarded to Defender for Business, your default firewall policy works as follows:

- Outbound connections from devices are allowed by default, regardless of location.
- When devices are connected to your company's network, all inbound connections are blocked by default.
- When devices are connected to a public network or a private network, all inbound connections are blocked by default.

In Defender for Business, you can define exceptions to block or allow incoming connections. You define these exceptions by creating [custom rules](#manage-your-custom-rules-for-firewall-policies-in-microsoft-defender-for-business).

## Firewall settings you can configure in Defender for Business

Defender for Business includes firewall protection through Windows Firewall. The following table lists settings that can be configured in Defender for Business.

|Setting|Description|
|---|---|
|**Domain network**|The domain network profile applies to your company's network. Firewall settings for your domain network apply to inbound connections that are initiated on other devices on the same network. By default, incoming connections are set to **Block all**.|
|**Public network**|The public network profile applies to networks that you can use in a public location, such as a coffee shop or airport. Firewall settings for public networks apply to inbound connections that are initiated on other devices on the same network. Because a public network can include devices that you don't know or don't trust, incoming connections are set to **Block all** by default.|
|**Private network**|The private network profile applies to networks in a private location, such as your home. Firewall settings for private networks apply to inbound connections that are initiated on other devices on the same network. In general, all devices on the same private network are assumed to be trusted devices. However, by default, incoming connections are set to **Block all**.|
|**Custom rules**|[Custom rules](mdb-firewall.md) let you block or allow specific connections. For example, you want to block all incoming connections on devices connected to a private network except for connections through a specific app on a device. Set **Private network** to block all incoming connections, and then add a custom rule to define the exception. <br/><br/> You can use custom rules to define exceptions for specific files, apps, or IP addresses. For example: <ul><li>**App file path**: `C:\Windows\System\Notepad.exe` or `%WINDIR%\Notepad.exe`.</li><li>**Single IPv4 or IPv6 address**: `192.168.11.0` or `fd12:3456:789a:1::1`.</li><li>**IPv4 or IPv6 Classless Inter-Domain Routing (CIDR)**: `192.168.1.0/24` or `fd12:3456:789a::/64`.</li><li>**IPv4 or IPv6 address range**: `192.168.1.0-192.168.1.9` or `fd12:3456:789a::1—fd12:3456:789a::ffff` (no spaces).|

## Next steps

- [Manage firewall settings in Defender for Business](mdb-firewall.md)
- [Learn more about Windows Firewall](/windows/security/operating-system-security/network-security/windows-firewall/)
- [View and manage incidents in Defender for Business](mdb-view-manage-incidents.md)
- [Respond to and mitigate threats in Defender for Business](mdb-respond-mitigate-threats.md)
- [Review remediation actions in the Action center](mdb-review-remediation-actions.md)
