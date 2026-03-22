---
title: Configure Conditional Access in Microsoft Defender for Endpoint
description: Learn about steps that you need to do in Intune, Microsoft Defender XDR, and Azure to implement Conditional Access
ms.service: defender-endpoint
ms.author: bagol
author: batamig
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
search.appverid: met150
ms.date: 01/05/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Configure Conditional Access in Microsoft Defender for Endpoint

This section guides you through all the steps you need to take to properly implement Conditional Access.

## Before you begin

> [!WARNING]
> It's important to note that Microsoft Entra registered devices aren't supported in this scenario. Only Intune enrolled devices are supported.

You need to make sure that all your devices are enrolled in Intune. You can use any of the following options to enroll devices in Intune:

- IT Admin: For more information on how to enable auto-enrollment, see [Enable Windows automatic enrollment](/intune/intune-service/enrollment/windows-enroll#enable-windows-automatic-enrollment).
- End user: For more information on how to enroll your Windows 10 and Windows 11 device in Intune, see [Enroll your Windows device in Intune](/intune/intune-service/user-help/enroll-windows-10-device).
- End-user alternative: For more information on joining a Microsoft Entra domain, see [How to: Plan your Microsoft Entra join implementation](/azure/active-directory/devices/azureadjoin-plan).

There are steps you'll need to take in the Microsoft Defender portal, the Intune portal, and Microsoft Entra admin center.

It's important to note the required roles to access these portals and implement Conditional Access:

- **Microsoft Defender portal**: You need to sign in with an appropriate role to turn on integration. See [Permission options](user-roles.md#permission-options).
- **Microsoft Intune admin center**: You need to sign in with Security Administrator rights with management permissions.
- **Microsoft Entra admin center**: You need to sign in as a Security Administrator or Conditional Access administrator.

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

You need a Microsoft Intune environment with Intune managed and Microsoft Entra joined Windows 10 and Windows 11 devices.

Take the following steps to enable Conditional Access as described in this article:

1. Turn on the Microsoft Intune connection in the Microsoft Defender portal.
2. Turn on the Defender for Endpoint integration in the Microsoft Intune admin center.
3. Create and assign the compliance policy in Intune.
4. Create a Microsoft Entra Conditional Access policy.

### Step 1: Turn on the Microsoft Intune connection

In the Microsoft Defender portal at <https://security.microsoft.com>, go to **System** \> **Settings** \> **Endpoints** \> **General** \> **Advanced features**. Or, to go directly to the **Advanced features** page, use <https://security.microsoft.com/securitysettings/endpoints/integration>.

On the **Advanced features** page, verify the **Microsoft Intune connection** setting is **On**. If necessary, slide the toggle to **On**, and then select **Save preferences**.

### Step 2: Turn on the Defender for Endpoint integration in Intune

1. In the Microsoft Intune admin center at <https://intune.microsoft.com>, select **Endpoint security** \> **Setup** section \> **Microsoft Defender for Endpoint**. Or, to go directly to the **Endpoint security \| Microsoft Defender for Endpoint** page, use <https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/atp>.

2. On the **Endpoint security \| Microsoft Defender for Endpoint** page, in the **Compliance policy evaluation** section, slide the **Connect Windows devices version 10.0.15063 and above to Microsoft Defender for Endpoint** toggle to **On**.

3. Select **Save** at the top of the page.

<a name='step-3-create-the-compliance-policy-in-intune'></a>

<a name='step-4-assign-the-policy'></a>

### Step 3: Create and assign the compliance policy in Intune

1. In the Microsoft Intune admin center at <https://intune.microsoft.com>, go to **Devices** \> **Manage devices** section \> **Compliance**. Or, to go directly to the **Devices \| Compliance** page, use <https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/compliance>.

2. On the **Policies** tab of the **Devices \| Compliance** page, select **Create policy**.

3. On the **Create a policy** flyout that opens, configure the following settings:
   - **Platform**: Select **Windows 10 and later**.
   - **Profile type**: Select **Windows 10/11 compliance policy**.

   Select **Create**.

4. The **Windows 10/11 compliance policy** wizard opens.  On the **Basics** tab, configure the following settings:
   - **Name**: Enter a unique, descriptive name for the policy.
   - **Description**: Enter an optional description.

   Select **Next**.

5. On the **Compliance settings** tab, expand **Microsoft Defender for Endpoint**. Set **Require the device to be at or under the Device Threat Level** to your preferred level:
   - **Clear**: This level is the most secure. The device cannot have any existing threats and still access company resources. If any threats are found, the device is evaluated as noncompliant.
   - **Low**: The device is compliant if only low-level threats exist. Devices with medium or high threat levels are not compliant.
   - **Medium**: The device is compliant if the threats found on the device are low or medium. If high-level threats are detected, the device is determined as noncompliant.
   - **High**: This level is the least secure, and allows all threat levels. So devices that with high, medium or low threat levels are considered compliant.

   Select **Next**.

6. On the **Actions for noncompliance** tab, the following settings are already configured (and you can't change them):
   - **Action**: Mark device noncompliant.
   - **Schedule (days after noncompliance)**: Immediately.

   You can add the following actions:

   - **Send email to end user**: The following options are available:
     - **Schedule (days after noncompliance)**: The default value is 0, but you can enter a different value up to 365.
     - **Message template**: Select **None selected** to find and select a template.
     - **Additional recipients (via email)**: Select **None selected** to find and select Microsoft Entra groups to notify.

   - **Add device to retire list**: The only available option is **Schedule (days after noncompliance)**: The default value is 0, but you can enter a different value up to 365.

   To delete an action, select **...** \> **Delete** on the entry. You might need to use the horizontal scroll bar to see **...**.

   When you're finished on the **Actions for noncompliance** tab, select **Next**.

7. On the **Assignments** tab, configure the following settings:
   - **Included groups** section: Select one of the following options:
     - **Add groups**: Select one or more groups to include.
     - **Add all users**
     - **Add all devices**
   - **Excluded groups**: Select **Add groups** to specify groups to exclude.

   When you're finished on the **Assignments** tab, select **Next**.

8. On the **Review + create** tab, review the settings, and then select **Create**.

<a name='step-5-create-a-microsoft-entra-conditional-access-policy'></a>

### Step 4: Create a Microsoft Entra Conditional Access policy

> [!TIP]
> The following procedure requires the [Conditional Access Administrator](/entra/identity/role-based-access-control/permissions-reference#conditional-access-administrator) role in Microsoft Entra ID.

1. In the Microsoft Intune admin center at <https://intune.microsoft.com>, go to **Entra ID** section \> **Conditional access**. Or, to go directly to the **Conditional Access \| Overview** page, use <https://entra.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Overview/menuId//fromNav/Identity>.

2. On the **Conditional Access \| Overview** page, select **Policies**. Or to go directly to the **Conditional Access \| Policies** page, use <https://entra.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies/menuId//fromNav/Identity>.

3. On the **Conditional Access \| Policies** page, select **New policy**.

4. Configure the following settings on the **New conditional access policy** page that opens:
   - **Name**: Enter a unique, descriptive name.
   - **Assignments** section: Configure the following settings:
     - **Users, agents or workload identities**: Select the link and then configure the following settings that appear:
       - **What does this policy apply to?**: Select **Users and groups**
       - **Include** tab: Select **All users**.
       - **Exclude** tab:
       - Select **Users and groups**, and then find and select your organization's [emergency 'break glass' admin accounts](/entra/identity/role-based-access-control/security-emergency-access).
       - If you use hybrid identity solutions like Microsoft Entra Connect or Microsoft Entra Connect Cloud Sync, select **Directory roles**, and then select **Directory Synchronization Accounts**.
     - **Target resources**: Select the link and then configure the following settings that appear:
       - **Select what this policy applies to**: Verify **Resources (formerly cloud apps)** is selected.
       - **Include** tab: Select **All resources (formerly 'All cloud apps')**.
   - **Access controls** section: Configure the following settings:
     - **Grant**: Select the link and then configure the following settings in the **Grant** flyout that opens:
       - Verify **Grant access** is selected, and then select **Require device to be marked as compliant**.

         When you're finished on the **Grant** flyout, select **Select**.

   - **Enable policy** section: Verify **Report-only** is selected.

   When you're finished on the  **New conditional access policy** page, select **Create**.

5. After confirming your settings using [policy impact or report-only mode](/entra/identity/conditional-access/concept-conditional-access-report-only#reviewing-results), modify the **Enable policy** setting in the policy from **Report-only** to **On**:

   To modify the policy, go the **Conditional Access \| Policies** page at <https://entra.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies/menuId//fromNav/Identity>, select the policy from the list by clicking on the **Policy name** value. On the **Policy details** tab of the details flyout that opens, select **Edit**.

> [!NOTE]
> You can use the Microsoft Defender for Endpoint app along with the **Approved Client app**, **App Protection policy**, and **Compliant Device** (Require device to be marked as compliant) controls in Microsoft Entra Conditional Access policies. No exclusion is required for the Microsoft Defender for Endpoint app while setting up Conditional Access. Although Microsoft Defender for Endpoint on Android & iOS (App ID `dd47d17a-3194-4d86-bfd5-c6ae6f5651e3`) isn't an approved app, it can report device security posture in all the three grant permissions.

For more information, see [Enforce compliance for Microsoft Defender for Endpoint with Conditional Access in Intune](/intune/intune-service/protect/advanced-threat-protection).
