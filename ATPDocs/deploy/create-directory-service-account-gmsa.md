---
title: Configure a DSA for Defender for Identity with a gMSA
description: Learn how to configure a Directory Service Account for Defender for Identity with a group managed service account (gMSA).
ms.date: 12/11/2023
ms.topic: how-to
---

# Configure a Directory Service Account for Defender for Identity with a gMSA

This article describes how to create a [group managed service account (gMSA)](/windows-server/security/group-managed-service-accounts/getting-started-with-group-managed-service-accounts) for use as a Defender for Identity DSA entry. 

For more information, see [Directory Service Accounts for Microsoft Defender for Identity](../directory-service-accounts.md).
 
>[!TIP]
>In multi-forest, multi-domain environments, we recommend creating the gMSAs with a unique name for each forest or domain. Also, create a universal group in each domain, containing all sensors' computer accounts so that all sensors can retrieve the gMSAs' passwords, and perform the cross-domain authentications.

## Prerequisites: Grant permissions to retrieve the gMSA account's password

Before you create the gMSA account, consider how to assign permissions to retrieve the account's password.

When using a gMSA entry, the sensor needs to retrieve the gMSA's password from Active Directory. This can be done either by assigning to each of the sensors or by using a group.

- **In a single-forest, single-domain deployment**, if you aren't planning to install the sensor on any AD FS / AD CS servers, you can use the built-in Domain Controllers security group.

- **In a forest with multiple domains**, when using a single DSA account, we recommend creating a universal group and adding each of the domain controllers and AD FS / AD CS servers to the universal group.
 
If you add a computer account to the universal group after the computer received its Kerberos ticket, it won't be able to retrieve the gMSA's password until it receives a new Kerberos ticket. The Kerberos ticket has a list of groups that an entity is a member of when the ticket is issued.

In such scenarios, do one of the following:

- **Wait for new Kerberos ticket to be issued**. Kerberos tickets are normally valid for 10 hours.

- **Reboot the server**. When the server is rebooted, a new Kerberos ticket is requested with the new group membership.

- **Purge the existing Kerberos tickets**. This forces the domain controller to request a new Kerberos ticket. 

    To purge the tickets, from an administrator command prompt on the domain controller, run the following command: `klist purge -li 0x3e7`

## Create the gMSA account

This section describes how to create a specific group that can retrieve the account's password, create a gMSA account, and then test that the account is ready to use.

>[!NOTE]
> If you have never used gMSA accounts before, you might need to generate a new root key for the Microsoft Group Key Distribution Service (KdsSvc) within Active Directory. This step is required only once per forest.
>
> To generate a new root key for immediate use, run the following command:
> ```powershell
> Add-KdsRootKey -EffectiveImmediately
> ```

Update the following code with variable values for your environment. Then, run the PowerShell commands as an administrator:

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

## Grant required DSA permissions

[!INCLUDE [dsa-permissions](../includes/dsa-permissions.md)]

## Verify that the gMSA account has the required rights

The Defender for Identity sensor service, *Azure Advanced Threat Protection Sensor*, runs as a *LocalService* and performs impersonation of the DSA account. The impersonation will fail if the *Log on as a service* policy is configured but the permission hasn't been granted to the gMSA account. In such cases, you'll see the following health issue: **Directory services user credentials are incorrect.**

If you see this alert, we recommend checking to see if the *Log on as a service policy* is configured. If you need to configure the *Log on as a service* policy, do so either in a Group Policy setting or in a Local Security Policy.

- **To check the Local Policy**, run `secpol.msc` and select **Local Policies**. Under **User Rights Assignment**, go to the **Log on as a service policy** setting. For example:

    :::image type="content" source="../media/log-on-as-a-service.png" alt-text="Screenshot of the log on as a service properties.":::

    If the policy is enabled, add the gMSA account to the list of accounts that can log on as a service.

- **To check if the setting is configured in a Group Policy**: Run `rsop.msc` and see if the **Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> Log on as a service** policy is selected. For example:
    
    :::image type="content" source="../media/log-on-as-a-service-gpmc.png" alt-text="Screenshot of the Log on as a service policy in the Group Policy Management Editor." lightbox="../media/log-on-as-a-service-gpmc.png":::

    If the setting is configured, add the gMSA account to the list of accounts that can log on as a service in the Group Policy Management Editor.

> [!NOTE]
> If you use the Group Policy Management Editor to configure the **Log on as a service** setting, make sure you add both **NT Service\All Services** and the gMSA account you created.

## Configure a Directory Service account in Microsoft Defender XDR

To connect your sensors with your Active Directory domains, you'll need to configure Directory Service accounts in Microsoft Defender XDR.

1. In [Microsoft Defender XDR](https://security.microsoft.com/), go to **Settings > Identities**. For example:

    [![Screenshot of the Identities settings in Microsoft Defender XDR.](../media/settings-identities.png)](../media/settings-identities.png#lightbox)

1. Select **Directory Service accounts**. You'll see which accounts are associated with which domains. For example:

    [![Screenshot of the Directory Service accounts page.](../media/directory-service-accounts.png)](../media/directory-service-accounts.png#lightbox)

1. To add Directory Service account credentials, select **Add credentials** and enter the **Account name**, **Domain**, and **Password** of the account you created earlier. You can also choose if it's a **Group managed service account** (gMSA), and if it belongs to a **Single label domain**. For example:

    [![Screenshot of the add credentials pane.](../media/new-directory-service-account.png)](../media/new-directory-service-account.png#lightbox)

    |Field|Comments|
    |---|---|
    |**Account name** (required)|Enter the read-only AD username. For example: **DefenderForIdentityUser**. <br><br>- You must use a **standard** AD user or gMSA account. <br>- **Don't** use the UPN format for your username. <br>- When using a gMSA, the user string should end with the `$` sign. For example: `mdisvc$`<br /><br>**NOTE:** We recommend that you avoid using accounts assigned to specific users.|
    |**Password** (required for standard AD user accounts)|For AD user accounts only, generate a strong password for the read-only user. For example: `PePR!BZ&}Y54UpC3aB`.|
    |**Group managed service account** (required for gMSA accounts)|For gMSA accounts only, select **Group managed service account**.|
    |**Domain** (required)|Enter the domain for the read-only user. For example: **contoso.com**. <br><br>It's important that you enter the complete FQDN of the domain where the user is located. For example, if the user's account is in domain corp.contoso.com, you need to enter `corp.contoso.com` not `contoso.com`. <br><br>For more information, see [Microsoft support for Single Label Domains](/troubleshoot/windows-server/networking/single-label-domains-support-policy).|

1. Select **Save**.
1. (Optional) If you select an account, a details pane will open with the settings for that account. For example:

    [![Screenshot of an account details pane.](../media/account-settings.png)](../media/account-settings.png#lightbox)

> [!NOTE]
> You can use this same procedure to change the password for standard Active Directory user accounts. There is no password set for gMSA accounts.

## Troubleshooting

For more information, see [Sensor failed to retrieve the gMSA credentials](../troubleshooting-known-issues.md#sensor-failed-to-retrieve-group-managed-service-account-gmsa-credentials).

## Next step

> [!div class="step-by-step"]
> [Configure SAM-R to enable lateral movement path detection in Microsoft Defender for Identity »](remote-calls-sam.md)
