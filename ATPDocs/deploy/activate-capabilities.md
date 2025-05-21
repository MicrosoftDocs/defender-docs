---
title: Activate Microsoft Defender for Identity capabilities directly on a domain controller 
description: Learn about the Microsoft Defender for Identity capabilities on domain controllers and how to activate them.
ms.date: 08/13/2024
ms.topic: how-to
---

# Activate Microsoft Defender for Identity capabilities directly on a domain controller

Microsoft Defender for Endpoint customers, who have already onboarded their domain controllers to Defender for Endpoint, can activate Microsoft Defender for Identity capabilities directly on a domain controller instead of using [Microsoft Defender for Identity classic sensor](deploy-defender-identity.md).

This article describes how to activate and test Microsoft Defender for Identity capabilities on your domain controller.

> [!IMPORTANT]
> The new Defender for Identity sensor (version 3.x) is recommended for customers looking to deploy core identity protections to new domain controllers running Windows Server 2019 or newer. For all other identity infrastructure, or for customers looking to deploy the most robust identity protections available from Microsoft Defender for Identity today, we recommend deploying the classic sensor [here](quick-installation-guide.md).

## Prerequisites

Before activating the Defender for Identity capabilities on your domain controller, make sure that your environment complies with the prerequisites in this section.

### Defender for Identity sensor conflicts

The configuration described in this article doesn't support side-by-side installation with an existing Defender for Identity sensor, and isn't recommended as a replacement for the Defender for Identity classic sensor.

Make sure that the domain controller where you're planning to activate Defender for Identity capabilities doesn't have a [Defender for Identity sensor](deploy-defender-identity.md) deployed.


### System requirements

Direct Defender for Identity capabilities are supported on domain controllers only, using the one of the following operating systems:

- Windows Server 2019 or above
- [March 2024 Cumulative Update](https://support.microsoft.com/topic/march-12-2024-kb5035857-os-build-20348-2340-a7953024-bae2-4b1a-8fc1-74a17c68203c) or later

> [!IMPORTANT]
>After installing the March 2024 Cumulative Update, LSASS might experience a memory leak on domain controllers when on-premises and cloud-based Active Directory Domain Controllers service Kerberos authentication requests.
>
> This issue is addressed in the out-of-band update [KB5037422](https://support.microsoft.com/en-gb/topic/march-22-2024-kb5037422-os-build-20348-2342-out-of-band-e8f5bf56-c7cb-4051-bd5c-cc35963b18f3).

### Permissions requirements 

To access the Defender for Identity **Activation** page, you must either be a [Security Administrator](/entra/identity/role-based-access-control/permissions-reference), or have the following Unified RBAC permissions:

- `Authorization and settings / System settings (Read and manage)`
- `Authorization and settings / Security setting (All permissions)`

For more information, see:

- [Unified role-based access control RBAC](../role-groups.md#unified-role-based-access-control-rbac)
- [Create a role to access and manage roles and permissions](/microsoft-365/security/defender/create-custom-rbac-roles#create-a-role-to-access-and-manage-roles-and-permissions)

## Configure Windows auditing

Defender for Identity detections rely on specific Windows Event Log entries to enhance detections and provide extra information about the users performing specific actions, such as NTLM sign-ins and security group modifications.

Configure Windows event collection on your domain controller to support Defender for Identity detections. For more information, see [Event collection with Microsoft Defender for Identity](event-collection-overview.md) and [Configure audit policies for Windows event logs](configure-windows-event-collection.md).

You might want to use the Defender for Identity PowerShell module to configure the required settings. For more information, see:

- [DefenderForIdentity Module](/powershell/module/defenderforidentity/)
- [Defender for Identity in the PowerShell Gallery](https://www.powershellgallery.com/packages/DefenderForIdentity/)

For example, the following command defines all settings for the domain, creates group policy objects, and links them.

```powershell
Set-MDIConfiguration -Mode Domain -Configuration All
```

# Onboarding steps

## Customers with domain controllers already onboarded to Defender for Endpoint 

### Activate Defender for Identity capabilities

Activate the Defender for Identity from the [Microsoft Defender portal](https://security.microsoft.com).

1. Navigate to **System** > **Settings** > **Identities** > **Activation**.

    The Activation Page now displays all servers from your device inventory, including those not currently eligible for the activation of the new Defender for Identity sensor. For each server you can find its activation state.

2. Select the domain controller where you want to activate the Defender for Identity capabilities and then select **Activate**. Confirm your selection when prompted. 

    :::image type="content" source="media/activate-capabilities/1.jpg" lightbox="media/activate-capabilities/1.jpg" alt-text="Screenshot that shows how to activate the new sensor.":::

    > [!NOTE]
    > You can choose to activate eligible domain controllers either automatically, where Defender for Identity activates them as soon as they're discovered, or manually, where you select specific domain controllers from the list of eligible servers.

3. When the activation is complete, a green success banner shows. In the banner, select **Click here to see the onboarded servers** to jump to the **Settings > Identities > Sensors** page, where you can check your sensor health.  

    :::image type="content" source="media/activate-capabilities/2.jpg" lightbox="media/activate-capabilities/2.jpg" alt-text="Screenshot that shows how to seethe onboarded servers.":::

## Customers without domain controllers onboarded to Defender for Endpoint 

### Connectivity requirements

Defender for Identity capabilities directly on domain controllers use Defender for Endpoint URL endpoints for communication, including simplified URLs.

For more information, see [Configure your network environment to ensure connectivity with Defender for Endpoint](/microsoft-365/security/defender-endpoint/configure-environment##enable-access-to-microsoft-defender-for-endpoint-service-urls-in-the-proxy-server).

### Onboard Defender for Identity capabilities 
Download the Defender for Identity onboarding package from the [Microsoft Defender portal] (https://security.microsoft.com) 

1. Navigate to **System** > **Settings** > **Identities** > **Activation**
2. Select Download onboarding package and save the file in a location you can access from your domain controller.
3. From the domain controller, extract the zip file you downloaded from the Microsoft Defender portal, and run the `DefenderForIdentityOnlyOnboardingScript.cmd` script as an Administrator. 
   
## Onboarding Confirmation 

To confirm the sensor has been onboarded: 

1. Navigate to **System** > **Settings** > **Identities** > **Sensors**.

2. Check that the onboarded domain controller is listed. 

> [!NOTE]
> The onboarding doesn't require a restart/reboot. The first time you activate Defender for Identity capabilities on your domain controller, it may take up to an hour for the first sensor to show as **Running** on the **Sensors** page. Subsequent activations are shown within five minutes.
> To check the onboarding on the local server you can also review the event log under **Applications and Services Logs** > **Microsoft** > **Windows** > **Sense** > **Operational**. You should receive an onboarding event: 

## Test activated capabilities

Defender for Identity capabilities on domain controllers currently support the following Defender for Identity functionality:

- Investigation features on the [ITDR dashboard](#check-the-itdr-dashboard), [identity inventory](#confirm-entity-page-details), and [identity advanced hunting data](#test-advanced-hunting-tables)
- [Security posture recommendations](#test-identity-security-posture-management-ispm-recommendations)
- [Alert detections](#test-alert-functionality)
- [Remediation actions](#test-remediation-actions)
- [Automatic attack disruption](/microsoft-365/security/defender/automatic-attack-disruption)

Use the following procedures to test your environment for Defender for Identity capabilities on a domain controller.

### Check the ITDR dashboard

In the Defender portal, select **Identities** > **Dashboard**, and review the details shown, checking for expected results from your environment.

For more information, see [Work with Defender for Identity's ITDR dashboard](../dashboard.md).

### Confirm entity page details

Confirm that entities, such as domain controllers, users, and groups, are populated as expected. 

In the Defender portal, check for the following details:

- **Device entities**: Select **Assets > Devices**, and select the machine for your new sensor. Defender for Identity events are shown on the device timeline.

- **User entities**: Select **Assets > Users** and check for users from a newly onboarded domain. Alternately, use the global search option to search for specific users. User details pages should include **Overview**, **Observed in organization**, and **Timeline** data.

- **Group entities**: Use the global search to find a user group, or pivot from a user or device details page where group details are shown. Check for details of group membership, view group users, and group timeline data.

   If no event data is found on the group timeline, you may need to create some manually. For example, do this by adding and removing users from the group in Active Directory.

For more information, see [Investigate assets](../investigate-assets.md).

### Test advanced hunting tables

In the Defender portal's **Advanced hunting** page, use the following sample queries to check that data appears in relevant tables as expected for your environment:

```kusto
IdentityDirectoryEvents
| where TargetDeviceName contains "DC_FQDN" // insert domain controller FQDN

IdentityInfo 
| where AccountDomain contains "domain" // insert domain

IdentityQueryEvents 
| where DeviceName contains "DC_FQDN" // insert domain controller FQDN
```

For more information, see [Advanced hunting in the Microsoft Defender portal](/microsoft-365/security/defender/advanced-hunting-microsoft-defender).


## Test Identity Security Posture Management (ISPM) recommendations

We recommend simulating risky behavior in a test environment to trigger supported assessments and verify that they appear as expected. For example:

1. Trigger a new **Resolve unsecure domain configurations** recommendation by setting your Active Directory configuration to a non-compliant state, and then returning it to a compliant state. For example, run the following commands:

    **To set a non-compliant state**

    ```powershell
    Set-ADObject -Identity ((Get-ADDomain).distinguishedname) -Replace @{"ms-DS-MachineAccountQuota"="10"}
    ```

    **To return it to a compliant state**:

    ```powershell
    Set-ADObject -Identity ((Get-ADDomain).distinguishedname) -Replace @{"ms-DS-MachineAccountQuota"="0"}
    ```

    **To check your local configuration**:

    ```powershell
    Get-ADObject -Identity ((Get-ADDomain).distinguishedname) -Properties ms-DS-MachineAccountQuota
    ```

1. In Microsoft Secure Score, select **Recommended Actions** to check for a new **Resolve unsecure domain configurations** recommendation. You might want to filter recommendations by the **Defender for Identity** product.

For more information, see [Microsoft Defender for Identity's security posture assessments](../security-assessment.md)

### Test alert functionality

Test alert functionality by simulating risky activity in a test environment. For example:

- Tag an account as a honeytoken account, and then try signing in to the honeytoken account against the activated domain controller.
- Create a suspicious service on your domain controller.
- Run a remote command on your domain controller as an administrator signed in from your workstation.

For more information, see [Investigate Defender for Identity security alerts in Microsoft Defender XDR](../manage-security-alerts.md).

### Test remediation actions

Test remediation actions on a test user. For example:

1. In the Defender portal, go to the user details page for a test user.

2. From the **Options** menu, select any of the available remediation actions.

3. Check Active Directory for the expected activity.

For more information, see [Remediation actions in Microsoft Defender for Identity](../remediation-actions.md).

# Offboarding steps

## Customers with domain controllers already onboarded to Defender for Endpoint 

### Deactivate Defender for Identity capabilities on your domain controller 

If you want to deactivate Defender for Identity capabilities on your domain controller, delete it from the **Sensors** page:

1. Navigate to **Settings** > **Identities** > **Sensors**
2. Select the domain controller where you want to deactivate Defender for Identity capabilities, select **Delete**, and confirm your selection.

    :::image type="content" source="media/activate-capabilities/3.jpg" lightbox="media/activate-capabilities/3.jpg" alt-text="Screenshot that shows how to deactivate a server.":::

Deactivating Defender for Identity capabilities from your domain controller doesn't remove the domain controller from Defender for Endpoint. For more information, see [Defender for Endpoint documentation](/microsoft-365/security/defender-endpoint/).

## Customers without domain controllers onboarded to Defender for Endpoint 

### Offboard Defender for Identity capabilities on your domain controller 
Download the Defender for Identity offboarding package from the [Microsoft Defender portal] (https://security.microsoft.com).

1. Navigate to **Settings** > **Identities** > **Activation**
2. Select Download offboarding package and save the file in a location you can access from your domain controller.
3. From the domain controller, extract the zip file you downloaded from the Microsoft Defender portal, and run the `DefenderForIdentityOnlyOffboardingScript_valid_until_YYYY-MM-DD.cmd` script as an Administrator.
4. To fully remove the sensor, navigate to **Settings** > **Identities** > **Sensors**, select the server and click Delete. 


## Next steps

For more information, see [Manage and update Microsoft Defender for Identity sensors](../sensor-settings.md).
