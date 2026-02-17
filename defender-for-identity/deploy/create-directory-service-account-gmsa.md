---
title: Configure a gMSA directory service account for Defender for Identity
description: Create and configure a group managed service account (gMSA) for use as the Directory service account in Microsoft Defender for Identity.
ms.date: 10/12/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Configure a gMSA directory service account for Defender for Identity

This article describes how to create a [group managed service account (gMSA)](/windows-server/security/group-managed-service-accounts/getting-started-with-group-managed-service-accounts) to use as a Microsoft Defender for Identity directory service account entry.

## Prerequisites

- Make sure you have permissions to create gMSAs and security groups in Active Directory.

- Assign permissions that allow the sensor to retrieve the gMSA password.

- Choose how to configure password retrieval:

    - Assign the gMSA account directly to each of the sensors.

    - Use a group that contains all the sensors that need to use the gMSA account.

- Choose the appropriate group based on your deployment:

    - **Single-forest, single-domain deployment**: Use the built-in Domain Controllers security group if you're not installing sensors on Active Directory Federation Services (AD FS) or Active Directory Certificate Services (AD CS) servers.

    - **Forest with multiple domains**: If you use a single Directory service account (DSA), we recommend creating a universal group and adding each of the domain controllers and AD FS or AD CS servers to the universal group.

- In multi-forest or multi-domain environments, make sure the domain where you create the gMSA trusts the sensors’ computer accounts.

- Create a universal group in each domain that includes all sensors computer accounts so that all sensors can retrieve the gMSAs' passwords, and perform the cross-domain authentications.


## Create the gMSA account

1. If you've never used a gMSA account before, you might need to generate a new root key for the Microsoft Group Key Distribution Service (KdsSvc) within Active Directory. This step is required only once per forest.
    To generate a new root key for immediate use, run the following command:

    ```powershell
    Add-KdsRootKey -EffectiveImmediately
    ```

1. Run the PowerShell commands as an administrator. This script will: 
    - Create a gMSA account.
    - Create a group for the gMSA account.
    - Add the specified computer accounts to that group.

1. Before running the script: 

    - Update the variable values to match your environment.
    - Make sure to give each gMSA a unique name for each forest or domain.

```powershell
# Variables:
# Specify the name of the gMSA you want to create:
$gMSA_AccountName = 'mdiSvc01'
# Specify the name of the group you want to create for the gMSA,
# or enter 'Domain Controllers' to use the built-in group when your environment is a single forest, and will contain only domain controller sensors.
$gMSA_HostsGroupName = 'mdiSvc01Group'
# Specify the computer accounts that will become members of the gMSA group and have permission to use the gMSA. 
# If you are using the 'Domain Controllers' group in the $gMSA_HostsGroupName variable, then this list is ignored
$gMSA_HostNames = 'DC1', 'DC2', 'DC3', 'DC4', 'DC5', 'DC6', 'ADFS1', 'ADFS2'

# Import the required PowerShell module:
Import-Module ActiveDirectory

# Set the group
if ($gMSA_HostsGroupName -eq 'Domain Controllers') {
    $gMSA_HostsGroup = Get-ADGroup -Identity 'Domain Controllers'
} else {
    $gMSA_HostsGroup = New-ADGroup -Name $gMSA_HostsGroupName -GroupScope DomainLocal -PassThru
    $gMSA_HostNames | ForEach-Object { Get-ADComputer -Identity $_ } |
        ForEach-Object { Add-ADGroupMember -Identity $gMSA_HostsGroupName -Members $_ }
}

# Create the gMSA:
New-ADServiceAccount -Name $gMSA_AccountName -DNSHostName "$gMSA_AccountName.$env:USERDNSDOMAIN" `
 -PrincipalsAllowedToRetrieveManagedPassword $gMSA_HostsGroup
```


## Refresh Kerberos tickets after changing group membership

The Kerberos ticket has a list of groups that an entity is a member of when the ticket is issued. If you add a computer account to the universal group after it already received a Kerberos ticket, it can't retrieve the gMSA's password until it gets a new ticket.

To refresh the Kerberos ticket, you can:

- **Wait for new Kerberos ticket to be issued**. Kerberos tickets are typically valid for 10 hours.

- **Reboot the server** to request a new Kerberos ticket with the new group membership.

- **Purge the existing Kerberos tickets** to force the domain controller to request a new Kerberos ticket. Run the following command to purge the tickets, from an administrator command prompt on the domain controller: `klist purge -li 0x3e7`

## Grant required directory service account permissions

[!INCLUDE [dsa-permissions](../includes/dsa-permissions.md)]

## Verify that the gMSA account has the required rights

The Defender for Identity sensor service, *Azure Advanced Threat Protection Sensor*, runs as a *LocalService* that impersonates the DSA account. If the *Log on as a service* policy is configured but the permission wasn't granted to the gMSA account, the impersonation fails. In that case, you see the following health issue: **Directory services user credentials are incorrect.**

If you see this alert, check to see if the *Log on as a service policy* is configured either in a Group Policy setting or in a Local Security Policy.

### Check the Local Security Policy

1. Run `secpol.msc` 
1. Select **Local Policies** > **User Rights Assignment**
1. Open the **Log on as a service policy** setting. 

    :::image type="content" source="../media/log-on-as-a-service.png" alt-text="Screenshot of the log on as a service property.":::

1. Once the policy is enabled, add the gMSA account to the list of accounts that can log on as a service.

### Check the Group Policy setting

1. Run `rsop.msc` 
1. Go to **Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> Log on as a service.**

    :::image type="content" source="../media/log-on-as-a-service-gpmc.png" alt-text="Screenshot of the Log on as a service policy in the Group Policy Management Editor." lightbox="../media/log-on-as-a-service-gpmc.png":::

1. Once the setting is configured, add the gMSA account to the list of accounts that can log on as a service in the Group Policy Management Editor.

> [!NOTE]
> If you use the Group Policy Management Editor to configure the **Log on as a service** setting, make sure to add both **NT Service\All Services** and the gMSA account you created.

## Configure a Directory service account in Microsoft Defender XDR

To connect your sensors with your Active Directory domains, configure Directory service accounts in Microsoft Defender XDR.

1. In [Microsoft Defender XDR](https://security.microsoft.com/), go to **Settings > Identities**.

    :::image type="content" source="../media/settings-identities.png" alt-text="Screenshot that shows the settings page and how to access the Defender for Identity page." lightbox="../media/settings-identities.png":::

1. Select **Directory service accounts** to see which accounts are associated with which domains. 

    :::image type="content" source="../media/directory-service-accounts.png" alt-text="Screenshot that shows the Directory service accounts page in the Defender portal." lightbox="../media/directory-service-accounts.png":::


1. Select **Add credentials** 
1. Enter the following details:
   - **Account name**
   - **Domain**
   - **Password**  
1. You can choose if it's a **Group managed service account** (gMSA), or if it belongs to a **Single label domain**. 

    :::image type="content" source="../media/new-directory-service-account.png" alt-text="Screenshot of the added credentials pane." lightbox="../media/new-directory-service-account.png":::    

    |Field|Comments|
    |---|---|
    |**Account name** (required)|Enter the read-only AD username. For example: **DefenderForIdentityUser**. <br><br>- You must use a **standard** AD user or gMSA account. <br>- **Don't** use the UPN format for your username. <br>- When using a gMSA, the user string should end with the `$` sign. For example: `mdisvc$`<br /><br>**NOTE:** We recommend that you avoid using accounts assigned to specific users.|
    |**Password** (required for standard AD user accounts)|For AD user accounts only, generate a strong password for the read-only user. For example: `PePR!BZ&}Y54UpC3aB`.|
    |**Group managed service account** (required for gMSA accounts)|For gMSA accounts only, select **Group managed service account**.|
    |**Domain** (required)|Enter the domain for the read-only user. For example: **contoso.com**. <br><br>It's important that you enter the complete FQDN of the domain where the user is located. For example, if the user's account is in domain corp.contoso.com, you need to enter `corp.contoso.com` not `contoso.com`. <br><br>For more information, see [Microsoft support for Single Label Domains](/troubleshoot/windows-server/networking/single-label-domains-support-policy).|

1. Select **Save**.
1. (Optional) Select an account to open the details pane and view its settings.


    :::image type="content" source="../media/account-settings.png" alt-text="Screenshot of an account details pane." lightbox="../media/account-settings.png":::


> [!NOTE]
> You can use the same procedure to change the password for standard Active Directory user accounts. 
> gMSA accounts don't require passwords.

## Troubleshooting

For more information, see [Sensor failed to retrieve the gMSA credentials](../troubleshooting-known-issues.md#sensor-failed-to-retrieve-group-managed-service-account-gmsa-credentials).


