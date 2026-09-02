---
title: View or edit policies in Microsoft Defender for Business
description: Learn how to view, edit, create, and delete cybersecurity policies in Defender for Business. Protect your devices with security policies.
author: chrisda
ms.author: chrisda
ms.topic: overview
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 06/10/2026
ms.reviewer: nehabha
ms.collection:
- SMB
- m365-security
- m365-initiative-defender-business
- tier1
---

# View or edit policies in Microsoft Defender for Business

In Defender for Business, security settings are configured through policies that are applied to devices. To help simplify your setup and configuration experience, Defender for Business includes several preconfigured policies to help protect your company's devices as soon as they're onboarded. There are other types of policies you can create as well (see [Set up, review, and edit your security policies and settings in Microsoft Defender for Business](mdb-configure-security-settings.md)).

This article describes how to view, edit, and create security policies in Defender for Business.

**This article includes**:

- [A list of default policies that are included in Defender for Business](#default-policies-in-defender-for-business) (Next-generation protection and firewall)
- [Extra policies that can be set up in Defender for Business](#policies-to-set-up-in-defender-for-business) (Web content filtering, controlled folder access, and attack surface reduction rules)
- [How to view existing policies](#view-your-existing-policies)
- [How to edit an existing policy](#edit-an-existing-policy)
- [How to create a new policy](#create-a-new-policy)

## Default policies in Defender for Business

In Defender for Business, there are two main types of default policies that are designed to protect your company's devices as soon as they're onboarded:

- **Next-generation protection policies**, which determine how Microsoft Defender Antivirus and other threat protection features are configured; and
- **Firewall policies**, which determine what network traffic is permitted to flow to and from your company's devices.

[Next-generation protection](mdb-next-generation-protection.md) includes robust antivirus and anti-malware protection for computers and mobile devices. The default policies are designed to protect your devices and users without hindering productivity. However, you can customize your policies to suit your business needs. For more information, see [Review or edit your next-generation protection policies](mdb-next-generation-protection.md).

[Firewall policies](mdb-firewall.md) help secure devices by establishing rules that determine what network traffic is permitted to flow to and from devices. You can use firewall protection to specify whether to allow or to block connections on devices in various locations. For example, your firewall settings can allow inbound connections on devices that are connected to your company's internal network, but prevent connections when the device is on a network with untrusted devices. For more information, see [Firewall](mdb-firewall.md).

## Policies to set up in Defender for Business

In addition to next-generation protection and firewall policies, there are three other types of policies to configure for the best protection with Defender for Business:

- [Web content filtering](mdb-web-content-filtering.md), which enables your security team to track and regulate access to websites based on content categories. Examples of categories include adult content, high bandwidth content, and legal liability content. When you set up your web content filtering policy, you enable web protection for your organization. For more information, see [Web content filtering](mdb-web-content-filtering.md).
- [Controlled folder access (CFA)](/defender-endpoint/controlled-folder-access-overview) allows only trusted apps to access protected folders on Windows devices. Think of this capability as ransomware mitigation. For more information, see [Deployment and configuration methods for CFA](/defender-endpoint/controlled-folder-access-overview#deployment-and-configuration-methods-for-cfa).
- [Attack surface reduction (ASR) rules](/defender-endpoint/attack-surface-reduction-rules-overview) target certain software behaviors that are often considered risky because attackers commonly abuse these behaviors through malware. Examples of such behaviors include launching executable files and scripts that attempt to download or run files. Attack surface reduction rules can constrain software-based risky behaviors, and help keep your organization safe. At a minimum, we recommend configuring the [standard protection rules](/defender-endpoint/attack-surface-reduction-rules-overview#asr-rules) to help protect your network without causing disruption for users. For more information, see [Deployment and configuration methods for ASR rules](/defender-endpoint/attack-surface-reduction-rules-overview#deployment-and-configuration-methods-for-asr-rules).

## View your existing policies

You can view your existing policies in either Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) or the Intune admin center ([https://intune.microsoft.com](https://intune.microsoft.com)) (if you're using Intune).

<a name='microsoft-365-defender-portal'></a>

## [**Microsoft Defender portal**](#tab/M365D)

1. Go to the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)), and sign in.

2. In the navigation pane, choose **Configuration management** \> **Device configuration**. Policies are organized by operating system (such as **Windows client**) and policy type (such as **Next-generation protection** and **Firewall**).

3. Select an operating system tab (for example, **Windows clients**), and then review the list of policies under each category (such as **Next-generation protection** and **Firewall**).

4. To view more details about a policy, select its name. A side pane opens that provides more information about that policy, such as which devices are protected by that policy.

## [**Intune admin center**](#tab/intune)

1. On the **Endpoint security \| Overview** page of the Microsoft Intune admin center at <https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/overview>, select the policy type from the **Manage** section of the navigation pane (for example, **Antivirus**, **Firewall**, or **Attack surface reduction**).

2. Any existing policies are listed for the policy type you selected. To view more details about a policy, select its name.

---

## Edit an existing policy

You can edit your existing policies in either Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) or the Intune admin center ([https://intune.microsoft.com](https://intune.microsoft.com)) (if you're using Intune).

<a name='microsoft-365-defender-portal'></a>

## [**Microsoft Defender portal**](#tab/M365D)

1. Go to the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)), and sign in.

2. In the navigation pane, choose **Device configuration**. Policies are organized by operating system (such as **Windows client**) and policy type (such as **Next-generation protection** and **Firewall**).

3. Select an operating system tab (for example, **Windows clients**), and then review the list of policies under the **Next-generation protection** and **Firewall** categories.

4. To edit a policy, select its name, and then choose **Edit**.

5. On the **General information** tab, review the information. If necessary, you can edit the description. Then choose **Next**.

6. On the **Device groups** tab, determine which device groups should receive this policy.

   - To keep the selected device group as it is, choose **Next**.
   - To remove a device group from the policy, select **Remove**.
   - To set up a new device group, select **Create new group**, and then set up your device group. (To get help with this task, see [Device groups](mdb-create-edit-device-groups.md).)
   - To apply the policy to another device group, select **Use existing group**.

   After you specify which device groups should receive the policy, choose **Next**.

7. On the **Configuration settings** tab, review the settings. If necessary, you can edit the settings for your policy. To get help with this task, see the following articles:

   - [Understand next-generation configuration settings](mdb-next-generation-protection.md)
   - [Firewall settings](mdb-firewall.md)

   After you specify your next-generation protection settings, choose **Next**.

8. On the **Review your policy** tab, review the general information, targeted devices, and configuration settings.

   - Make any needed changes by selecting **Edit**.
   - When you're ready to proceed, choose **Update policy**.

## [**Intune admin center**](#tab/intune)

To edit an existing endpoint security policy (for example, **Antivirus**, **Firewall**, or **Attack surface reduction**) in the Intune admin center, see <a href="/intune/intune-service/protect/endpoint-security-policy#modify-existing-policies" target="_blank">Modify existing policies</a> (opens in a new tab in the Intune documentation).

---

## Create a new policy

<a name='microsoft-365-defender-portal'></a>

## [**Microsoft Defender portal**](#tab/M365D)

1. Go to the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)), and sign in.

2. In the navigation pane, choose **Device configuration**. Policies are organized by operating system (such as **Windows client**) and policy type (such as **Next-generation protection** and **Firewall**).

3. Select an operating system tab (for example, **Windows clients**), and then review the list of **Next-generation protection** policies.

4. Under **Next-generation protection** or **Firewall**, select **+ Add**.

5. On the **General information** tab, take the following steps:

   1. Specify a name and description. This information helps you and your team identify the policy later on.
   2. Review the policy order, and edit it if necessary. (For more information, see [Policy order](mdb-policy-order.md).)
   3. Choose **Next**.

6. On the **Device groups** tab, either create a new device group, or use an existing group. Policies are assigned to devices through device groups. Here are some things to keep in mind:

   - Initially, you might only have your default device group, which includes the devices people in your company are using to access company data and email. You can keep and use your default device group.
   - Create a new device group to apply a policy with specific settings that are different from the default policy.
   - When you set up your device group, you specify certain criteria, such as the operating system version. Devices that meet the criteria are included in that device group, unless you exclude them.
   - All device groups, including the default and custom device groups that you define, are stored in Microsoft Entra ID.

   To learn more about device groups, see [Device groups](mdb-create-edit-device-groups.md).

7. On the **Configuration settings** tab, specify the settings for your policy, and then choose **Next**. For more information about the individual settings, see [Configuration settings for Defender for Business](mdb-next-generation-protection.md).

8. On the **Review your policy** tab, review the general information, targeted devices, and configuration settings.

   - Make any needed changes by selecting **Edit**.
   - When you're ready to proceed, choose **Create policy**.

## [**Intune admin center**](#tab/intune)

To configure a policy by using Microsoft Intune endpoint security policies, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When you create the policy, select the **Policy type**, **Platform**, and **Profile** for the protection you want to configure. For the full list of policy types, supported platforms, and available profiles, see [Available endpoint security policy types](/intune/intune-service/protect/endpoint-security-policy#available-endpoint-security-policy-types).

> [!IMPORTANT]
> Microsoft Defender for Endpoint management supports device objects only. Targeting users isn't supported. Assign the policy to Microsoft Entra device groups, not user groups.

The following profiles are the most relevant for Defender for Business:

- **Antivirus**: Set up your [next-generation protection policy](mdb-next-generation-protection.md), define [exclusions for Microsoft Defender Antivirus](/defender-endpoint/configure-exclusions-microsoft-defender-antivirus), or turn on [tamper protection](/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection).
- **Firewall**: Set up your [firewall protection policy](mdb-firewall.md), including [custom rules](mdb-firewall.md#manage-your-custom-rules-for-firewall-policies-in-microsoft-defender-for-business).
- **Attack surface reduction**: Set up [attack surface reduction (ASR) rules](/defender-endpoint/attack-surface-reduction-rules-configure#configure-asr-rules-and-exclusions-in-intune-using-endpoint-security-policies) or [controlled folder access (CFA)](/defender-endpoint/controlled-folder-access-configure#configure-cfa-in-intune-using-endpoint-security-policies).

---

## See also

- [Understand policy order](mdb-policy-order.md)
- [Set up your security policies and settings](mdb-configure-security-settings.md)
