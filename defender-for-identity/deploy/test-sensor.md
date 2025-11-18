---
title: Validate the Microsoft Defender for Identity sensor deployment on domain controllers
description: Learn about how to check that the Microsoft Defender for Identity sensors have been onboarded correctly.
ms.date: 06/10/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Validate the Defender for Identity sensor deployment on domain controllers 

Use the following procedures to check that your sensors are working.
Note that the first time you activate the sensor on your domain controller, it might take up to an hour for the first sensor to show as **Running** on the **Sensors** page. Subsequent activations show within five minutes.

## Check the ITDR dashboard

1. In the Defender portal, select **Identities** > **Dashboard**, and review the details shown, checking for expected results from your environment.

For more information, see [Work with Defender for Identity's ITDR dashboard](../dashboard.md).

## Confirm entity page details

Confirm that entities, such as domain controllers, users, and groups, are populated as expected. 

In the Defender portal, check for the following details:

- **Device entities**: Select **Assets > Devices**, and select the machine for your new sensor. Defender for Identity events are shown on the device timeline.

- **User entities**: Select **Assets > Users** and check for users from a newly onboarded domain. Alternately, use the global search option to search for specific users. User details pages should include **Overview**, **Observed in organization**, and **Timeline** data.

- **Group entities**: Use the global search to find a user group, or pivot from a user or device details page where group details are shown. Check for details of group membership, view group users, and group timeline data.

If no event data is found on the group timeline, you may need to create some manually. You can do this by, for example, adding and removing users from the group in Active Directory.

For more information, see [Investigate assets](../investigate-assets.md).

## Test advanced hunting tables

1. In the Defender portal's **Advanced hunting** page, use the following sample queries to check that data appears in relevant tables as expected for your environment:

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

1. Trigger a new **Resolve unsecure domain configurations** recommendation by setting your Active Directory configuration to a noncompliant state, and then returning it to a compliant state. For example, run the following commands:

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

## Test alert functionality

Test alert functionality by simulating risky activity in a test environment. For example:

- Tag an account as a honeytoken account, and then try signing in to the honeytoken account against the activated domain controller.
- Create a suspicious service on your domain controller.
- Run a remote command on your domain controller as an administrator signed in from your workstation.

For more information, see [Investigate Defender for Identity security alerts in Microsoft Defender XDR](../manage-security-alerts.md).

## Test remediation actions

Test remediation actions on a test user. For example:

1. In the Defender portal, go to the user details page for a test user.

1. From the **Options** menu, select any of the available remediation actions.

1. Check Active Directory for the expected activity.

For more information, see [Remediation actions in Microsoft Defender for Identity](../remediation-actions.md).


## Next steps

For more information, see [Manage and update Microsoft Defender for Identity sensors](../sensor-settings.md).
