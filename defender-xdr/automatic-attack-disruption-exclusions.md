---
title: Exclude assets from automated response in attack disruption
description: Exclude identities and devices from automatic attack disruption responses in Microsoft Defender XDR to prevent automated containment of selected assets.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection: 
  - m365-security
  - tier1
  - usx-security
  - usx-security
ms.topic: how-to
ms.date: 08/07/2026
appliesto:
- Microsoft Defender XDR
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015

#customer intent: As a security administrator, I want to learn how to exclude specific assets from being automatically contained by automatic attack disruption in Microsoft Defender XDR, so that I can prevent disruptions to critical assets while still maintaining security.
---

# Exclude assets from automated responses in automatic attack disruption

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Use exclusion policies to prevent [automatic attack disruption](automatic-attack-disruption.md) in Microsoft Defender XDR from applying selected responses to specific assets.

Automatic attack disruption and exclusion policies work together to contain active cyber threats. Automatic attack disruption is a built-in, AI-powered capability that analyzes attacker intent and identifies compromised assets. It can isolate devices or disable user accounts to stop an ongoing attack. Exclusion policies let security teams exempt specific assets or actions from these responses. For example, you can prevent critical servers from being isolated or critical accounts from being disabled to avoid unintended business disruption. You can [remove exclusions](#remove-exclusions) at any time to include assets in automated responses again.

> [!CAUTION]
> Excluding assets from automated responses isn't recommended. It can reduce the effectiveness of automatic attack disruption in protecting your environment from sophisticated, high-impact attacks.

## Prerequisites

The permissions required to manage attack disruption exclusions depend on whether [Microsoft Defender XDR Unified role-based access control (RBAC)](manage-rbac.md) is enabled for the relevant workload.

### Device exclusions

The following table lists the permissions required to manage device exclusions.

| Unified RBAC for endpoints | Required permission |
| --- | --- |
| **Disabled** | Security Administrator or Global Administrator role in [Microsoft Entra ID](https://entra.microsoft.com) or the [Microsoft 365 admin center](https://admin.microsoft.com). |
| **Enabled** | Security Operator (or higher) global Microsoft Entra role, **or** the [Core security settings (manage)](custom-permissions-details.md) permission in Unified RBAC. |

For information about enabling Unified RBAC, see [Activate Microsoft Defender XDR Unified RBAC](activate-defender-rbac.md).

### Identity exclusions

The following table lists the permissions required to manage identity exclusions.

| Unified RBAC for identities or endpoints | Required permission |
| --- | --- |
| **Disabled** (both identities and endpoints) | Security Administrator or Global Administrator role in [Microsoft Entra ID](https://entra.microsoft.com) or the [Microsoft 365 admin center](https://admin.microsoft.com). |
| **Enabled** (for identities or endpoints) | Security Operator (or higher) global Microsoft Entra role, **or** the [Core security settings (manage)](custom-permissions-details.md) permission in Unified RBAC. |

> [!NOTE]
> A Security Reader can view exclusions and tags but can't edit them.

## Exclusion types and approaches

You can [exclude specific assets](#exclude-assets), or you can configure [broad policy-driven rules](#policy-applications-and-exclusions-preview) based on your operational needs.

### Exclude assets

**[User account exclusions](#exclude-user-accounts)** prevent specific user identities from being automatically disabled when an attack is detected. Use this for service accounts, emergency admin accounts, or identities that support critical business processes.

**[Device group exclusions](#exclude-device-groups)** allow you to set automation levels for groups of devices, controlling whether and how devices respond to detected threats. Use this to balance security with business continuity for critical infrastructure, legacy systems, or devices running mission-critical applications.

**[IP exclusions](#exclude-ip-addresses)** prevent specific IP addresses or ranges from being automatically contained. Use this for critical infrastructure IP ranges, legacy systems, or external services that your organization relies on.

#### Exclude user accounts

Exclude user accounts to prevent critical service accounts, emergency admin accounts, or identities supporting critical business processes from being automatically disabled during an attack. This helps maintain business continuity for essential functions while disruption actions continue against other compromised accounts.

To exclude a user account from automated responses:

1. Go to the [Microsoft Defender portal](https://security.microsoft.com) and sign in.

1. Go to **Settings** > **Microsoft Defender XDR**.

To exclude one or more user accounts from automated responses, follow these steps:

1. Under **Automated response**, select **Identities**.

1. Select **Add user exclusion**. A flyout pane appears.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-identity-add-small.png" alt-text="Screenshot of the Identities page in automated response settings for attack disruption" lightbox="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-identity-add.png":::

1. In the flyout pane, enter the user account names in the **Select users** box and select the user accounts you want to exclude.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-identity-flyout-small.png" alt-text="Screenshot of the flyout pane for adding and selecting user exclusions" lightbox="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-identity-flyout.png":::

1. Select **Exclude users** to save the exclusion.

#### Exclude device groups

Exclude device groups to protect critical infrastructure, legacy systems, or devices running mission-critical applications from automatic containment or isolation. This approach lets you keep disruption enabled for most of your environment while carving out specific device groups that require different handling due to operational dependencies.

> [!CAUTION]
> Excluding device groups from automated responses also impacts [automated investigation and response](m365d-autoir.md) actions.

To exclude a device group from automated responses:

1. Go to the [Microsoft Defender portal](https://security.microsoft.com) and sign in.

1. Go to **Settings** \> **Microsoft Defender XDR**.

1. Under **Automated responses**, select **Devices**.

1. In the **Device groups** tab, choose a device group by selecting the checkbox next to the group name from the list to configure attack disruption automation settings.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-device-select-small.png" alt-text="Screenshot of the Device groups tab in automated response settings for attack disruption" lightbox="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-device-select.png":::

1. In the flyout pane, select the appropriate automation level for the device group. You can choose from any of the following automation levels appropriate for your device group:
   - **Full - remediate threats automatically**: Automatically contain devices when a threat is detected.
   - **Semi - require approval for core folders**: Automatically investigate devices when an alert is received and apply     remediation actions except to items within core system folders. Remediation actions for the core folders require approval.
   - **Semi - require approval for non-temp folders**: Automatically investigate and apply remediation to actions within temp and download folders when an alert is received. All other remediation actions require approval.
   - **Semi - require approval for all folders**: Automatically investigate devices when an alert is received. All  remediation actions require approval.
   - **No automated response**: No automated investigation or response is taken for devices in this group.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-device-flyout-small.png" alt-text="Screenshot of the flyout pane for configuring device group automation levels" lightbox="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-device-flyout.png":::

1. Select **Save** to save the automation level for the device group.

#### Exclude IP addresses

Exclude IP addresses to prevent critical infrastructure IP ranges, legacy systems, or external services from being automatically blocked. This approach is useful for protecting network resources that your organization depends on but might not have the flexibility to respond to automated containment.

To exclude an IP address from automated responses:

1. Go to the [Microsoft Defender portal](https://security.microsoft.com) and sign in.

1. Go to **Settings** > **Microsoft Defender XDR**.

1. Under **Automated responses**, select **Devices**.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/attack-disrupt-devices-tab.png" alt-text="Screenshot of the Devices page in automated response settings for attack disruption" lightbox="media/automatic-attack-disruption-exclusions/attack-disrupt-devices-tab.png":::

1. In the **Policy application** tab, select **Exclude IP** to exclude an IP address.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-ip-add.png" alt-text="Screenshot of the IPs tab in automated response settings for attack disruption" lightbox="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-ip-add-big.png":::

1. In the flyout pane, enter the IP address/IP range/IP subnet you want to exclude. You can add multiple IP addresses and IP subnets by separating them with a comma.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-ip-flyout-small.png" alt-text="Screenshot of the flyout pane for adding IP address exclusions" lightbox="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-ip-flyout.png":::

1. Add a name and note for the exclusion. Select **Create** to save the exclusion.

### Policy applications and exclusions (Preview)

When automatic attack disruption detects with high confidence that a user or device is compromised, it automatically applies containment policies to managed devices in your organization. These policies help contain the threat and stop it from spreading across your environment.

Policy application exclusions give you granular control over how automatic attack disruption enforcement policies are applied in your environment. They let you define devices that shouldn't receive specific disruption policies. This flexibility protects sensitive, operationally critical, or exception-based systems without fully disabling automatic attack disruption.

Policy applications and exclusions allow you to:

- Manage protections for multiple devices as a group using dynamic tags
- Keep most disruption controls active while selectively disabling specific protections
- Maintain centralized control over which disruption policy controls are enabled or excluded for each tagged group of devices

First create a tag or use an existing tag to define the devices. Then create a rule that applies to that tag. For example, you might create a tag for all servers in a specific department and then create a policy application that applies to that tag. By default, all policy controls are enabled. By configuring a policy application for tagged devices, you can keep disruption enabled and exclude only specific controls for that group.

#### Create a tag

Create a tag to group devices together for a policy application.

To create a tag go to Asset rule management in the Microsoft Defender portal and select **Create tag**. Provide a name and description for the tag, then define dynamic rules to automatically include devices in the tag based on device properties such as device type, operating system, or other attributes.

#### Create a policy application

1. Go to the [Microsoft Defender portal](https://security.microsoft.com) and sign in.

1. Go to **Settings** > **Microsoft Defender XDR**.

To create a policy application rule for tagged devices, follow these steps:

1. Under **Automated responses**, select **Devices**.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/attack-disrupt-devices-tab.png" alt-text="Screenshot of the Devices page in automated response settings for attack disruption" lightbox="media/automatic-attack-disruption-exclusions/attack-disrupt-devices-tab.png":::

1. In the **Policy application** tab, select **Create rule**.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/policy-application-create-rule.png" alt-text="Screenshot of the Policy application tab in automated response settings for attack disruption" lightbox="media/automatic-attack-disruption-exclusions/policy-application-create-rule.png":::

1. Provide a name and description for the policy and select **Next**.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/create-new-exclusion.png" alt-text="Screenshot of the policy application creation page in automated response settings" lightbox="media/automatic-attack-disruption-exclusions/create-new-exclusion.png":::

1. Select a tag to apply the policy to, and then select **Next**.

1. Configure the disruption controls you want to disable for the tagged devices, and then select **Next**.

   :::image type="content" source="media/automatic-attack-disruption-exclusions/policy-application-select-controls.png" alt-text="Screenshot of selecting controls to disable for a policy application rule" lightbox="media/automatic-attack-disruption-exclusions/policy-application-select-controls.png":::

1. Review and submit the policy application.

<!---
> [!IMPORTANT]
>
> - When device membership changes, policy enforcement updates after inventory refresh. Tag updates and exclusion enforcement can take up to one hour.
> - When new controls are introduced, they are added to exclusion configurations as disabled. Automatic enablement behavior then depends on rollout stage, such as General Availability (GA), Public Preview, or Private Preview.
--->

## Remove exclusions

Removing an exclusion allows the asset to be included in automated responses for attack disruption again. When an exclusion is removed, the asset is no longer excluded from automated responses and can be automatically contained if it's involved in an attack that triggers attack disruption.

In the Microsoft Defender portal, go to **Settings** > **Microsoft Defender XDR** > **Automated response**. Then use the appropriate tab to remove an exclusion:

- Go to the **Identities** page. Select the user account you want to remove from the list and then select **Remove**.

:::image type="content" source="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-user-remove.png" alt-text="Screenshot of the remove option for an excluded user on the Identities page":::

- Go to the **Devices** page and navigate to the **IPs** tab. Select the IP address you want to remove from the list and then select **Remove exclusion**.

:::image type="content" source="media/automatic-attack-disruption-exclusions/attack-disrupt-exclude-ip-remove.png" alt-text="Screenshot of the remove exclusion option for an IP in the IPs tab":::

- Device group exclusions can be configured in the **Device groups** tab. Select the device group you want to configure from the list and choose the appropriate exclusion from the flyout pane. Select **Save** to save the exclusion.

To edit or remove a policy application, go to the **Policy application** tab and select the tag with the policy application you want to remove. Select **Edit** or **Delete**.

<!---
:::image type="content" source="media/automatic-attack-disruption-exclusions/remove-policy.png" alt-text="Screenshot of the removal option for a policy application in the Policy application tab"::: --->

## Opting out of automatic attack disruption

Opting out of attack disruption can greatly increase security risk. Instead of opting out entirely, consider [excluding specific entities](automatic-attack-disruption-exclusions.md#exclude-user-accounts) to limit automated responses only for selected assets.

If you must opt out of attack disruption, open a support case in the Microsoft Defender portal with the subject *Attack disruption opt-out*. In your request, specify that you wish to opt out of attack disruption and include a brief explanation about your decision. This feedback helps us improve the feature and better understand customer needs. By opting out, you still receive alerts related to attack disruption but no automated actions are taken.

<a name="see-also"></a>
## Related content

For more information about attack disruption, see the following article:

- [View details and results of automated attack disruption actions](autoad-results.md)

[!INCLUDE [Microsoft Defender join tech community](../includes/defender-m3d-techcommunity.md)]
