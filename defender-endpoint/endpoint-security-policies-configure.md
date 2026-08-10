---
title: Manage endpoint security policies in Microsoft Defender for Endpoint
description: Learn how to manage Windows, macOS, and Linux endpoint security policies such as antivirus, firewall, endpoint detection and response in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier2
ms.topic: how-to
ms.date: 08/03/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
#customer intent: As a security administrator, I want to manage endpoint security policies in the Microsoft Defender portal so that I can protect enrolled and non-enrolled devices from one console.
ms.custom: sfi-ga-nochange, msecd-doc-authoring-1015
ai-usage: ai-assisted
---

# Manage endpoint security policies in Microsoft Defender for Endpoint

As a security administrator, you can create and manage endpoint security policies directly in the Microsoft Defender portal, without switching to the Microsoft Intune admin center. This approach has the following benefits:

- Work from a single console.
- Apply one policy to both Intune-enrolled devices and devices managed through [Defender for Endpoint security settings management](/intune/intune-service/protect/mde-security-integration) (devices onboarded to Defender for Endpoint but not enrolled in Intune).
- Manage security settings using Defender for Endpoint permissions rather than a full Intune administrator role.

To manage settings on devices that aren't enrolled in Intune, first enable security settings management. To learn why you'd use it and how to turn it on, including the enforcement scope and prerequisites, see [Manage Microsoft Defender for Endpoint on devices that aren't enrolled with Intune](/intune/intune-service/protect/mde-security-integration).

The **Endpoint security policies** page is available in the [Microsoft Defender portal](https://security.microsoft.com) at **Endpoints** \> **Configuration management** \> **Endpoint security policies**, or directly at <https://security.microsoft.com/policy-inventory>.

The following table lists the endpoint security policy types you can manage and the platforms that each type supports:

> [!NOTE]
> You can't use Endpoint security policy management on devices that are running a sensor delivered by the Microsoft Monitoring Agent (MMA). For more information on how to upgrade these devices, see [Use the Defender deployment tool to deploy Defender endpoint security](/defender-endpoint/onboard-downlevel#use-the-defender-deployment-tool-to-deploy-defender-endpoint-security).
>
> Also, only the **Microsoft Defender Antivirus** policy is supported on Windows 7 SP1 and Windows Server 2008 R2 SP1.

|Policy|Windows|macOS|Linux|
|---|:---:|:---:|:---:|
|[Attack surface reduction (ASR) rules](attack-surface-reduction-rules-overview.md)|Yes|||
|[Defender update controls](microsoft-defender-antivirus-updates.md)|Yes|||
|[Device control](device-control-overview.md)|Yes¹|||
|[Endpoint detection and response (EDR)](overview-endpoint-detection-response.md)|Yes|Yes|Yes|
|Microsoft Defender Antivirus|[Yes](microsoft-defender-antivirus-windows.md)|[Yes](microsoft-defender-endpoint-mac.md)|[Yes](microsoft-defender-endpoint-linux.md)|
|Microsoft Defender Antivirus exclusions|[Yes](microsoft-defender-antivirus-exclusions-overview.md)|[Yes](mac-exclusions.md)|[Yes](linux-exclusions.md)|
|[Microsoft Defender Firewall](/windows/security/operating-system-security/network-security/windows-firewall/)|Yes|||
|[Microsoft Defender Firewall rules](/windows/security/operating-system-security/network-security/windows-firewall/rules)|Yes|||
|[Microsoft Defender global exclusions (antivirus and EDR)](defender-endpoint-exclusions-overview.md)|||Yes|
|[Windows Security experience](/windows/security/operating-system-security/system-security/windows-defender-security-center/windows-defender-security-center)|Yes|||

¹ Device control policies are available in the Defender portal, but the policy applies only to devices enrolled in Microsoft Intune. It doesn't apply to devices managed through Defender for Endpoint security settings management (devices onboarded to Defender for Endpoint but not enrolled in Intune).

:::image type="content" source="media/endpoint-security-policies.png" alt-text="Screenshot of the Endpoint security policies page in the Microsoft Defender portal.":::

## Prerequisites

You need to be assigned permissions before you can do the procedures in this article.

- Your permissions must apply to all devices. If your role is scoped to specific device groups, you can't open the **Endpoint security policies** page.
- Regardless of which of the following options grants you access, the list of policies shown in the Microsoft Defender portal is scoped by your Intune role-based access control (RBAC) assignments.

You have the following options to assign the required permissions:

- [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac):
  - _Create and manage policies_: **Authorization and settings/Security settings/Core Security settings (manage)**
  - _Read-only access to policies_: **Authorization and settings/Security settings/Core Security settings (read)**

- [Microsoft Intune role-based access control (RBAC)](/intune/intune-service/fundamentals/role-based-access-control): Microsoft recommends the Intune built-in [Endpoint Security Manager](/intune/intune-service/fundamentals/role-based-access-control#built-in-roles) role to align the level of permissions between Intune and the Microsoft Defender portal.

- [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup>, **Security Administrator**, or **Intune Administrator** roles gives users the required permissions _and_ permissions for other features in Microsoft 365.

  > [!IMPORTANT]
  > <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

## Create an endpoint security policy

To create an endpoint security policy, follow these steps:

1. On the **Endpoint security policies** page in the Microsoft Defender portal at <https://security.microsoft.com/policy-inventory>, select :::image type="icon" source="media/defender-portal-icon-create.png" border="false"::: **Create new policy**.

   The tab you start on doesn't matter. You can create policies for any operating system on any tab.

1. In the **Create a new policy** flyout that opens, choose from the following options:
   - **Select platform**: Choose one of the following values:
     - **Windows**
     - **macOS**
     - **Linux**
   - After you select the platform, **Select template** appears. The available templates to select by platform are described in the table earlier in this article.

     After you select a template, select **Create policy**.

1. The new policy wizard opens. On the **Basics** page, configure the following settings:
   - **Name**: Enter a unique, descriptive name for the policy.
   - **Description**: Enter an optional description for the policy.

   When you're finished on the **Basics** page, select **Next**.

1. On the **Configuration settings** page, what you see depends on the policy platform and template.

   You can use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find settings.

   When you're finished on the **Configuration settings** page, select **Next**.

1. On the **Assignments** page, use the :::image type="icon" source="media/defender-portal-icon-search.png" border="false"::: **Search** box to find and select a group to assign the policy to.

   > [!IMPORTANT]
   > For devices managed through Defender for Endpoint security settings management (devices onboarded to Defender for Endpoint but not enrolled in Intune), assignments support device objects only. Assign the policy to Microsoft Entra device groups, not user groups, because user targeting isn't supported for these devices. For Intune-enrolled devices, you can assign the policy to user groups or device groups.

   After you select a group, the following information is shown on the page:

   - **Group**: The group name.
   - **Group members**: The number of affected devices and users.
   - **Target type**: You can select **Include (default)** or **Exclude** to include or exclude the members of the group from the policy.

   Repeat this step as many times as necessary.

   When you're finished on the **Assignments** page, select **Next**.

1. On the **Review + create** page, review your settings. Use the **Back** button to modify the settings.

   When you're finished on the **Review + create** page, select **Save**.

After the policy creation finishes, you're taken to the detailed settings of the policy as if you selected it on the **Endpoint security policies** page.

> [!NOTE]
> To use [scope tags](/intune/fundamentals/role-based-access-control/scope-tags) in the policy, you need to [create the policy in the Microsoft Intune admin center](/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies).

<a name="to-edit-an-endpoint-security-policy"></a>

## Edit an endpoint security policy

To modify an endpoint security policy, follow these steps:

1. On the **Endpoint security policies** page in the Defender portal, select an available tab:
   - **Windows policies**: <https://security.microsoft.com/policy-inventory> or <https://security.microsoft.com/policy-inventory?osPlatform=Windows>.
   - **macOS policies**: <https://security.microsoft.com/policy-inventory?osPlatform=Mac>.
   - **Linux policies**: <https://security.microsoft.com/policy-inventory?osPlatform=Linux>.

1. On the appropriate tab, select the policy by using any of the following methods:
   - Select the check box next to the policy, and then select the :::image type="icon" source="media/defender-portal-icon-edit.png" border="false"::: **Edit** action that appears.
   - Select the policy name (link). On the policy page that opens, select :::image type="icon" source="media/defender-portal-icon-edit.png" border="false"::: **Edit**.
   - Click anywhere in the row other than the check box or the policy name. In the policy details flyout that opens, select :::image type="icon" source="media/defender-portal-icon-edit.png" border="false"::: **Edit**.

1. The policy wizard opens as described in Step 3 in [Create an endpoint security policy](#create-an-endpoint-security-policy).

The steps to edit the policy are the same as when you create a policy.

## Verify endpoint security policies

To confirm that you successfully created a policy, verify the policy is listed on the appropriate tab of the **Endpoint security policies** page in the Defender portal at <https://security.microsoft.com/policy-inventory>.

Select the policy name (link) to open the policy page. The policy page summarizes the status of the policy. You can view the policy's status, which devices it applies to, and the assigned groups.

It can take up to 90 minutes for a policy to reach a device. To speed up the process for devices managed by Defender for Endpoint, use the **Policy sync** action on the device entity page:

1. On the appropriate tab of the **Device inventory** page in the Defender portal at <https://security.microsoft.com/machines>, select the **Name** value of the device.
1. On the [device entity page](/defender-xdr/entity-page-device) that opens, select :::image type="icon" source="media/defender-portal-icon-more-actions.png" border="false"::: **More actions** \> :::image type="icon" source="media/defender-portal-icon-sync.png" border="false"::: **Policy sync**.

The policy should be applied in about 10 minutes.

:::image type="content" source="media/policy-sync.png" alt-text="Screenshot of the Policy sync button in the actions menu.":::

During an investigation, you can also view the **Security policies** tab of the **Configuration management** tab on the device entity page to see the list of policies applied to a device. For more information, see [Investigating devices](investigate-machines.md).

:::image type="content" source="media/security-policies-list.png" alt-text="Screenshot of the Security policies tab on the device page listing applied policies.":::
