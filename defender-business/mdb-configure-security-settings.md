---
title: Set up, review, and edit your security policies and settings in Microsoft Defender for Business
description: View and edit security policies and settings in Defender for Business
author: chrisda
ms.author: chrisda
ms.topic: overview
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 08/27/2025
ms.reviewer: efratka
ms.collection:
 - SMB
 - m365-security
 - m365solution-mdb-setup
 - highpri
 - tier1
---

# Set up, review, and edit your security policies and settings in Microsoft Defender for Business

This article walks you through how to review, create, or edit your security policies, and how to navigate advanced settings in [Microsoft Defender for Business](mdb-overview.md).

:::image type="content" source="media/mdb-setup-step6.png" alt-text="Visual depicting step 6 - Review and edit security policies in Defender for Business.":::

When you're setting up or maintaining Defender for Business, an important task is reviewing and configuring device policies:

- **Default policies**:
  - [Next-generation protection](mdb-next-generation-protection.md)
  - [Firewall protection](mdb-firewall.md)

- **Other policies**:
  - [Web content filtering](mdb-web-content-filtering.md)
  - [Controlled folder access](mdb-controlled-folder-access.md) (*requires Microsoft Intune*)
  - [Attack surface reduction rules](mdb-asr.md) (*ASR rules are configured in Intune*)

- **Settings for advanced features**:
  - [Turn on (or off) advanced features](mdb-portal-advanced-feature-settings.md#view-settings-for-advanced-features);
  - [Specifying which time zone to use in the Microsoft Defender portal](mdb-portal-advanced-feature-settings.md#view-and-edit-other-settings-in-the-microsoft-365-defender-portal); and
  - [Whether to receive preview features as they become available](/defender-xdr/preview).

## Choose where to manage security policies and devices

Before you create or edit security policies, you need to decide which portal to use:

- **Microsoft Defender portal** at <https://security.microsoft.com>.
- **Microsoft Intune admin center** at <https://intune.microsoft.com>.

The following table explains both options.

|Option|Description|
|---|---|
|Defender portal|A one-stop shop for managing company devices, security policies, and security settings in Defender for Business. With a simplified configuration process, you can use the Defender portal to: <ul><li>Onboard devices.</li><li>Access your security policies and settings.</li><li>Use the [Microsoft Defender Vulnerability Management dashboard](mdb-view-tvm-dashboard.md).</li><li>[view and manage incidents](mdb-view-manage-incidents.md)</li></ul>. **Note**: Currently, controlled folder access and attack surface reduction rules are set up and configured in the Microsoft Intune admin center.|
|Intune admin center|Although Defender for Business doesn't include Microsoft Intune, you can use the Intune admin center to: <ul><li>Manage your company devices and apps, including how they access your company data.</li><li>Onboard devices and access your security policies and settings in Intune.</li><li>Set up and configure attack surface reduction rules.</li></ul> If your company has Intune, you can continue using Intune to manage your devices and security policies. To learn more, see [Manage device security with endpoint security policies in Microsoft Intune](/intune/intune-service/protect/endpoint-security-policy)|

If you use Intune, and you attempt to view or edit security policies in the Defender portal by going to **Configuration management** \> **Device configuration**, you're prompted to choose whether to continue using Intune, or switch to using the Defender portal, as shown in the following screenshot:

:::image type="content" source="media/mdb-usingintune-switchquestion.png" alt-text="Screenshot showing the prompt to keep using Intune or switch to the Microsoft Defender portal.":::

In the preceding screenshot, **Use Defender for Business configuration instead** refers to using the Defender portal. The Defender portal provides a simplified configuration experience designed for small and medium-sized businesses. If you decide to use the Defender portal, you need to delete any existing security policies in Intune to avoid policy conflicts. For more information, see [I need to resolve a policy conflict](mdb-troubleshooting.yml#i-need-to-resolve-a-policy-conflict).

> [!NOTE]
> Policies you manage in the Defender portal are listed in the Intune admin center as **Antivirus** or **Firewall** policies. When you view your firewall policies in the Intune admin center, you see two policies listed: one policy for firewall protection and another for custom rules.
>
> You can export your list of policies from the Intune admin center.

## Next steps

1. [Review or edit your next-generation protection policies](mdb-next-generation-protection.md) to apply antivirus/antimalware protection, and enable network protection.
2. [Review or edit your firewall policies](mdb-firewall.md).
3. [Set up your web content filtering policy](mdb-web-content-filtering.md) and enable web protection automatically.
4. [Set up your controlled folder access policy](mdb-controlled-folder-access.md) for ransomware protection.
5. [Enable your attack surface reduction rules](mdb-asr.md).
6. [Review settings for advanced features and the Microsoft Defender portal](mdb-portal-advanced-feature-settings.md).
