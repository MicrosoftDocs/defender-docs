---
title: Configure Conditional Access in Microsoft Defender for Endpoint
description: Learn about steps that you need to do in Intune, Microsoft Defender XDR, and Azure to implement Conditional Access
ms.service: defender-endpoint
ms.author: bagol
author: batamig
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
search.appverid: met150
ms.date: 06/25/2024
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

- IT Admin: For more information on how to enable auto-enrollment, see [Enable Windows automatic enrollment](/mem/intune/enrollment/windows-enroll#enable-windows-automatic-enrollment).
- End user: For more information on how to enroll your Windows 10 and Windows 11 device in Intune, see [Enroll your Windows device in Intune](/mem/intune/user-help/enroll-windows-10-device).
- End-user alternative: For more information on joining a Microsoft Entra domain, see [How to: Plan your Microsoft Entra join implementation](/azure/active-directory/devices/azureadjoin-plan).

There are steps you'll need to take in the Microsoft Defender portal, the Intune portal, and Microsoft Entra admin center.

It's important to note the required roles to access these portals and implement Conditional Access:

- **Microsoft Defender portal** - You'll need to sign into the portal with an appropriate role to turn on integration. See [Permission options](user-roles.md#permission-options).
- **Intune** - You'll need to sign in to the portal with Security Administrator rights with management permissions.
- **Microsoft Entra admin center** - You'll need to sign in as a Security Administrator or Conditional Access administrator.

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

You'll need a Microsoft Intune environment, with Intune managed and Microsoft Entra joined Windows 10 and Windows 11 devices.

Take the following steps to enable Conditional Access:

- Step 1: Turn on the Microsoft Intune connection from Microsoft Defender XDR
- Step 2: Turn on the Defender for Endpoint integration in Intune
- Step 3: Create the compliance policy in Intune
- Step 4: Assign the policy 
- Step 5: Create a Microsoft Entra Conditional Access policy

### Step 1: Turn on the Microsoft Intune connection

1. In the navigation pane, select **Settings** \> **Endpoints** \> **General** \> **Advanced features** \> **Microsoft Intune connection**.

2. Toggle the Microsoft Intune setting to **On**.

3. Click **Save preferences**.

### Step 2: Turn on the Defender for Endpoint integration in Intune

1. Sign in to the [Intune portal](https://intune.microsoft.com)

2. Select **Endpoint Security** \> **Microsoft Defender for Endpoint**.

3. Set **Connect Windows 10.0.15063+ devices to Microsoft Defender Advanced Threat Protection** to **On**.

4. Click **Save**.

### Step 3: Create the compliance policy in Intune

1. In the [Azure portal](https://portal.azure.com), select **All services**, filter on **Intune**, and select **Microsoft Intune**.

2. Select **Device compliance** \> **Policies** \> **Create policy**.

3. Enter a **Name** and **Description**.

4. In **Platform**, select **Windows 10 and later**.

5. In the **Device Health** settings, set **Require the device to be at or under the Device Threat Level** to your preferred level:

   - **Secured**: This level is the most secure. The device cannot have any existing threats and still access company resources. If any threats are found, the device is evaluated as noncompliant.
   - **Low**: The device is compliant if only low-level threats exist. Devices with medium or high threat levels are not compliant.
   - **Medium**: The device is compliant if the threats found on the device are low or medium. If high-level threats are detected, the device is determined as noncompliant.
   - **High**: This level is the least secure, and allows all threat levels. So devices that with high, medium or low threat levels are considered compliant.

6. Select **OK**, and **Create** to save your changes (and create the policy).

### Step 4: Assign the policy

1. In the [Azure portal](https://portal.azure.com), select **All services**, filter on **Intune**, and select **Microsoft Intune**.

2. Select **Device compliance** \> **Policies**> select your Microsoft Defender for Endpoint compliance policy.

3. Select **Assignments**.

4. Include or exclude your Microsoft Entra groups to assign them the policy.

5. To deploy the policy to the groups, select **Save**. The user devices targeted by the policy are evaluated for compliance.

<a name='step-5-create-an-azure-ad-conditional-access-policy'></a>

### Step 5: Create a Microsoft Entra Conditional Access policy

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com) as at least a [Conditional Access Administrator](/entra/identity/role-based-access-control/permissions-reference#conditional-access-administrator).
1. Browse to **Entra ID** > **Conditional Access** > **Policies**.
1. Select **New policy**.
1. Give your policy a name. We recommend that organizations create a meaningful standard for the names of their policies.
1. Under **Assignments**, select **Users or workload identities**.
   1. Under **Include**, select **All users**
   1. Under **Exclude**: 
      1. Select **Users and groups** 
         1. Choose your organization's emergency access or break-glass accounts.
         1. If you use hybrid identity solutions like Microsoft Entra Connect or Microsoft Entra Connect Cloud Sync, select **Directory roles**, then select **Directory Synchronization Accounts**
1. Under **Target resources** > **Resources (formerly cloud apps)** > **Include**, select **All resources (formerly 'All cloud apps')**.
1. Under **Access controls** > **Grant**.
   1. Select **Require device to be marked as compliant**.
   1. Select **Select**.
1. Confirm your settings and set **Enable policy** to **Report-only**.
1. Select **Create** to create to enable your policy.

After confirming your settings using [policy impact or report-only mode](/entra/identity/conditional-access/concept-conditional-access-report-only#reviewing-results), move the **Enable policy** toggle from **Report-only** to **On**.

> [!NOTE]
> You can use the Microsoft Defender for Endpoint app along with the **Approved Client app** , **App Protection policy** and **Compliant Device** (Require device to be marked as compliant) controls in Microsoft Entra Conditional Access policies. There's no exclusion required for the Microsoft Defender for Endpoint app while setting up Conditional Access. Although Microsoft Defender for Endpoint on Android & iOS (App ID - dd47d17a-3194-4d86-bfd5-c6ae6f5651e3) isn't an approved app, it is able to report device security posture in all the three grant permissions. 

For more information, see [Enforce compliance for Microsoft Defender for Endpoint with Conditional Access in Intune](/mem/intune/protect/advanced-threat-protection).



[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]

