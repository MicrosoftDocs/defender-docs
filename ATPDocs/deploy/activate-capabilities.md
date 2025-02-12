---
title: Activate Microsoft Defender for Identity capabilities directly on a domain controller 
description: Learn about the Microsoft Defender for Identity capabilities on domain controllers and how to activate them.
ms.date: 08/13/2024
ms.topic: how-to
---

# Activate Microsoft Defender for Identity capabilities directly on a domain controller

Microsoft Defender for Endpoint customers, who've already onboarded their domain controllers to Defender for Endpoint, can activate Microsoft Defender for Identity capabilities directly on a domain controller instead of using a [Microsoft Defender for Identity sensor](deploy-defender-identity.md).

This article describes how to activate and test Microsoft Defender for Identity capabilities on your domain controller.

> [!IMPORTANT]
> Information in this article relates to a feature that is currently in limited availablility for a select set of use cases. If you weren't directed to use the Defender for Identity **Activation** page, use our [main deployment guide](deploy-defender-identity.md) instead.
>

## Prerequisites

Before activating the Defender for Identity capabilities on your domain controller, make sure that your environment complies with the prerequisites in this section.

### Defender for Identity sensor conflicts

The configuration described in this article doesn't support side-by-side installation with an existing Defender for Identity sensor, and isn't recommended as a replacement for the Defender for Identity sensor.

Make sure that the domain controller where you're planning to activate Defender for Identity capabilities doesn't have a [Defender for Identity sensor](deploy-defender-identity.md) deployed.


### System requirements

Direct Defender for Identity capabilities are supported on domain controllers only, using the one of the following operating systems:

- Windows Server 2019
- Windows Server 2022

You must also have the [March 2024 Cumulative Update](https://support.microsoft.com/topic/march-12-2024-kb5035857-os-build-20348-2340-a7953024-bae2-4b1a-8fc1-74a17c68203c) installed.

> [!IMPORTANT]
>After installing the March 2024 Cumulative Update, LSASS might experience a memory leak on domain controllers when on-premises and cloud-based Active Directory Domain Controllers service Kerberos authentication requests.
>
> This issue is addressed in the out-of-band update [KB5037422](https://support.microsoft.com/en-gb/topic/march-22-2024-kb5037422-os-build-20348-2342-out-of-band-e8f5bf56-c7cb-4051-bd5c-cc35963b18f3).

### Defender for Endpoint onboarding

Your domain controller must be onboarded to Microsoft Defender for Endpoint.

For more information, see [Onboard a Windows server](/microsoft-365/security/defender-endpoint/onboard-windows-server).

### Required permissions

To access the Defender for Identity **Activation** page, you must either be a [Security Administrator](/entra/identity/role-based-access-control/permissions-reference), or have the following Unified RBAC permissions:

- `Authorization and settings / System settings (Read and manage)`
- `Authorization and settings / Security setting (All permissions)`

For more information, see:

- [Unified role-based access control RBAC](../role-groups.md#unified-role-based-access-control-rbac)
- [Create a role to access and manage roles and permissions](/microsoft-365/security/defender/create-custom-rbac-roles#create-a-role-to-access-and-manage-roles-and-permissions)

### Connectivity requirements

Defender for Identity capabilities directly on domain controllers use Defender for Endpoint URL endpoints for communication, including simplified URLs.

For more information, see [Configure your network environment to ensure connectivity with Defender for Endpoint](/microsoft-365/security/defender-endpoint/configure-environment##enable-access-to-microsoft-defender-for-endpoint-service-urls-in-the-proxy-server).

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

## Activate Defender for Identity capabilities

After ensuring that your environment is completely configured, activate the  Microsoft Defender for Identity capabilities on your domain controller.

1. In the [Defender portal](https://security.microsoft.com), select **Settings > Identities > [Activation](https://security.microsoft.com/settings/identities?tabid=onboarding)**.

    The **Activation** page lists any detected and eligible domain controllers.

1. Select the domain controller where you want to activate the Defender for Identity capabilities and then select **Activate**. Confirm your selection when prompted.

When the activation is complete, a green success banner shows. In the banner, select **Click here to see the onboarded servers** to jump to the **Settings > Identities > Sensors** page, where you can check your sensor health.

## Test activated capabilities

The first time you activate Defender for Identity capabilities on your domain controller, it may take up to an hour for the first sensor to show as **Running** on the **Sensors** page. Subsequent activations show within five minutes.

Defender for Identity capabilities on domain controllers currently support the following Defender for Identity functionality:

- Investigation features on the [ITDR dashboard](#check-the-itdr-dashboard), [identity inventory](#confirm-entity-page-details), and [identity advanced hunting data](#test-advanced-hunting-tables)
- [Specified security posture recommendations](#test-identity-security-posture-management-ispm-recommendations)
- [Specified alert detections](#test-alert-functionality)
- [Remediation actions](#test-remediation-actions)
- [Automatic attack disruption](/microsoft-365/security/defender/automatic-attack-disruption)

Use the following procedures to test your environment for Defender for Identity capabilities on a domain controller.

### Check the ITDR dashboard

In the Defender portal, select **Identities > Dashboard** and review the details shown, checking for expected results from your environment.

For more information, see [Work with Defender for Identity's ITDR dashboard (Preview)](../dashboard.md).


### Confirm entity page details

Confirm that entities, such as domain controllers, users, and groups, are populated as expected. 

In the Defender portal, check for the following details:

- **Device entities**: Select **Assets > Devices**, and select the machine for your new sensor. Defender for Identity events are shown on the device timeline.

- **User entities**. Select **Assets > Users** and check for users from a newly onboarded domain. Alternately, use the global search option to search for specific users. User details pages should include **Overview**, **Observed in organization**, and **Timeline** data.

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


### Test Identity Security Posture Management (ISPM) recommendations

Defender for Identity capabilities on domain controllers support the following ISPM assessments:

- [**Install Defender for Identity Sensor on all Domain Controllers**](../security-assessment-unmonitored-domain-controller.md)
- [**Microsoft LAPS usage**](../security-assessment-laps.md)
- [**Resolve unsecure domain configurations**](../security-assessment-unsecure-domain-configurations.md)
- **Set a honeytoken account**
- [**Unsecure account attributes**](../security-assessment-unsecure-account-attributes.md)
- [**Unsecure SID History attributes**](../security-assessment-unsecure-sid-history-attribute.md)

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

The following alerts are supported by Defender for Identity capabilities on domain controllers:

:::row:::
   :::column span="":::
    - [Account enumeration reconnaissance](../reconnaissance-discovery-alerts.md#account-enumeration-reconnaissance-external-id-2003)
    - [Active Directory attributes Reconnaissance using LDAP](../reconnaissance-discovery-alerts.md#active-directory-attributes-reconnaissance-ldap-external-id-2210)
    - [Exchange Server Remote Code Execution (CVE-2021-26855)](../lateral-movement-alerts.md#exchange-server-remote-code-execution-cve-2021-26855-external-id-2414)
    - [Honeytoken user attributes modified](../persistence-privilege-escalation-alerts.md#honeytoken-user-attributes-modified-external-id-2427)
    - [Honeytoken was queried via LDAP](../reconnaissance-discovery-alerts.md#honeytoken-was-queried-via-ldap-external-id-2429)
    - [Honeytoken authentication activity](../credential-access-alerts.md#honeytoken-authentication-activity-external-id-2014)
    - [Honeytoken group membership changed](../persistence-privilege-escalation-alerts.md#honeytoken-group-membership-changed-external-id-2428) 
    - [Remote code execution attempt](../other-alerts.md#remote-code-execution-attempt-external-id-2019)
    - [Security principal reconnaissance (LDAP)](../credential-access-alerts.md#security-principal-reconnaissance-ldap-external-id-2038)
    - [Suspicious service creation](../other-alerts.md#suspicious-service-creation-external-id-2026)
    - [Suspected NTLM relay attack (Exchange account)](../lateral-movement-alerts.md#suspected-ntlm-relay-attack-exchange-account-external-id-2037)
   :::column-end:::
   :::column span="":::
    - [Suspicious modification of the Resource Based Constrained Delegation attribute by a machine account](../persistence-privilege-escalation-alerts.md#suspicious-modification-of-the-resource-based-constrained-delegation-attribute-by-a-machine-account--external-id-2423)
    - [Suspicious additions to sensitive groups](../persistence-privilege-escalation-alerts.md#suspicious-additions-to-sensitive-groups-external-id-2024)
    - [Suspicious modification of a dNSHostName attribute (CVE-2022-26923)](../persistence-privilege-escalation-alerts.md#suspicious-modification-of-a-dnshostname-attribute-cve-2022-26923--external-id-2421)
    - [Suspicious modification of a sAMNameAccount attribute (CVE-2021-42278 and CVE-2021-42287)](../credential-access-alerts.md#suspicious-modification-of-a-samnameaccount-attribute-cve-2021-42278-and-cve-2021-42287-exploitation-external-id-2419)
    - [Suspected DCShadow attack (domain controller promotion)](../other-alerts.md#suspected-dcshadow-attack-domain-controller-promotion-external-id-2028)
    - [Suspected DFSCoerce attack using Distributed File System Protocol](../credential-access-alerts.md#suspected-dfscoerce-attack-using-distributed-file-system-protocol-external-id-2426) 
    - [Suspected DCShadow attack (domain controller replication request)](../other-alerts.md#suspected-dcshadow-attack-domain-controller-replication-request-external-id-2029)
    - [Suspected account takeover using shadow credentials](../credential-access-alerts.md#suspected-account-takeover-using-shadow-credentials-external-id-2431)
    - [Suspected SID-History injection](../persistence-privilege-escalation-alerts.md#suspected-sid-history-injection-external-id-1106)
    - [Suspected AD FS DKM key read](../credential-access-alerts.md#suspected-ad-fs-dkm-key-read-external-id-2413)
   :::column-end:::
:::row-end:::


Test alert functionality by simulating risky activity in a test environment. For example:

- Tag an account as a honeytoken account, and then try signing in to the honeytoken account against the activated domain controller.
- Create a suspicious service on your domain controller.
- Run a remote command on your domain controller as an administrator signed in from your workstation.

For more information, see [Investigate Defender for Identity security alerts in Microsoft Defender XDR](../manage-security-alerts.md).

### Test remediation actions

Test remediation actions on a test user. For example:

1. In the Defender portal, go to the user details page for a test user.

1. From the options menu, select any or all of the following, one at a time:

    - **Disable user in AD**
    - **Enable user in AD**
    - **Force password reset**

1. Check Active Directory for the expected activity.

> [!NOTE]
> The current version does not collect the User Account Control (UAC) flags correctly. So disabled users, would still appear as Enabled in the portal.


For more information, see [Remediation actions in Microsoft Defender for Identity](../remediation-actions.md).

## Deactivate Defender for Identity capabilities on your domain controller

If you want to deactivate Defender for Identity capabilities on your domain controller, delete it from the **Sensors** page:

1. In the Defender portal, select **Settings > Identities > Sensors**.
1. Select the domain controller where you want to deactivate Defender for Identity capabilities, select **Delete**, and confirm your selection.

Deactivating Defender for Identity capabilities from your domain controller doesn't remove the domain controller from Defender for Endpoint. For more information, see [Defender for Endpoint documentation](/microsoft-365/security/defender-endpoint/).

## Next steps

For more information, see [Manage and update Microsoft Defender for Identity sensors](../sensor-settings.md).
