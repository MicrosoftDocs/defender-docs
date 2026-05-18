---
title: Configure Windows event auditing
description: Configure Windows event auditing for Defender for Identity sensors. Learn automatic, manual, and PowerShell methods to enable required audit policies.
ms.date: 05/07/2026
ms.topic: how-to
ms.custom: msecd-doc-authoring-106
ms.reviewer: rlitinsky
ai-usage: ai-assisted
---

# Configure Windows event auditing

Configure Windows event auditing to enable Defender for Identity detections. The sensor parses specific Windows event logs from your domain controllers, AD FS servers, AD CS servers, and Microsoft Entra Connect servers. For the correct events to be audited and included in the Windows event log, these servers need the correct advanced audit policy settings.

Configure auditing using one of these methods:

- [Automatic configuration](#configure-defender-for-identity-to-collect-windows-events-automatically) for sensor v3.x on domain controllers (recommended)
- [Manual configuration](#configure-windows-event-collection-manually) for sensor v2.x, servers that aren't domain controllers, or if you opted out of automatic auditing
- [PowerShell configuration](#configure-windows-event-collection-using-powershell)
- [Required Windows events](#required-windows-events) for all server types

Defender for Identity generates health alerts when it detects incorrect Windows event auditing configurations. For more information, see [Microsoft Defender for Identity health alerts](../health-alerts.md).

If you configure auditing properly, it has minimal effect on server performance.

## Configure Defender for Identity to collect Windows events automatically

If you're deploying sensor v3.x on domain controllers, use automatic Windows auditing. This is the recommended approach; it requires no manual configuration and handles all auditing settings for you.

### Turn on automatic Windows auditing

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings**, and then **Identities**.
1. In the **General** section, select **Advanced features**.
1. Turn on **Automatic Windows auditing configuration**.

### What automatic auditing configures

When enabled, the sensor automatically:

- Checks current Windows event auditing configuration.
- Identifies any gaps in the configuration.
- Applies any necessary changes, including all of the steps in the manual configuration:
    - **Directory services advanced auditing**: Adds audit entries to the domain root object's System Access Control List (SACL) to enable required directory service auditing.
    - **NTLM auditing**: Uses standard Windows Registry APIs to configure the required NTLM auditing registry values.
    - **Domain object auditing**: Modifies the SACL on the Configuration partition to capture changes to directory service configuration objects.
    - **ADFS auditing**: Adds audit entries to the object's System Access Control List (SACL) of the AD FS configuration container, to enable auditing of AD FS-related directory objects.
    - **Windows audit policy**: Configures the local Windows audit policies using the Windows Local Security Authority (LSA) audit policy APIs.
- Applies auditing settings directly to the local system policy of the domain controller.
- Sends health alerts about the configuration state.
- Runs once every 24 hours.

> [!NOTE]
> - Automatic Windows event auditing is supported for domain controllers that use the Defender for Identity sensor version 3.x only. It doesn't apply to v2.x domain controllers or to AD FS, AD CS, and Microsoft Entra Connect servers that aren't domain controllers. For those servers, [configure Windows event auditing manually](#configure-windows-event-collection-manually).
> - If you don't turn on automatic Windows auditing, you **must** configure Windows event auditing either [manually](#configure-windows-event-collection-manually) or by using [PowerShell](#configure-windows-event-collection-using-powershell).
> - GPO settings can conflict with local settings set by the sensor.

## Required Windows events

This section lists the Windows events that the Defender for Identity sensor requires. The specific events depend on the server type where the sensor is installed.

### Required AD FS events

The following events are required for AD FS servers:

- 1202: The Federation Service validated a new credential
- 1203: The Federation Service failed to validate a new credential
- 4624: An account was successfully logged on
- 4625: An account failed to log on

For more information, see [Configure auditing on an AD FS server](#configure-auditing-on-an-ad-fs-server).

### Required AD CS events

The following events are required for AD CS servers:

- 4870: Certificate Services revoked a certificate
- 4882: The security permissions for Certificate Services changed
- 4885: The audit filter for Certificate Services changed
- 4887: Certificate Services approved a certificate request and issued a certificate
- 4888: Certificate Services denied a certificate request
- 4890: The certificate manager settings for Certificate Services changed
- 4896: One or more rows have been deleted from the certificate database

For more information, see [Configure auditing on an AD CS server](#configure-auditing-on-an-ad-cs-server).

### Required Microsoft Entra Connect events

The following event is required for Microsoft Entra Connect servers:

- 4624: An account was successfully logged on

For more information, see [Configure auditing on Microsoft Entra Connect](#configure-auditing-on-microsoft-entra-connect).

### Other required Windows events

The following general Windows events are required for all Defender for Identity sensors on domain controllers:

- 4662: An operation was performed on an object
- 4726: User Account Deleted
- 4728: Member Added to Global Security Group
- 4729: Member Removed from Global Security Group
- 4730: Global Security Group Deleted
- 4732: Member Added to Local Security Group
- 4733: Member Removed from Local Security Group
- 4741: Computer Account Added
- 4743: Computer Account Deleted
- 4753: Global Distribution Group Deleted
- 4756: Member Added to Universal Security Group
- 4757: Member Removed from Universal Security Group
- 4758: Universal Security Group Deleted
- 4763: Universal Distribution Group Deleted
- 4776: Domain Controller Attempted to Validate Credentials for an Account (NTLM)
- 5136: A directory service object was modified
- 7045: New Service Installed
- 8004: NTLM Authentication

For more information, see [Configure NTLM auditing](#configure-ntlm-auditing) and [Configure domain object auditing](#configure-domain-object-auditing).

### Event collection for standalone sensors

If you're working with a standalone Defender for Identity sensor, configure event collection manually by using one of the following methods:

- [Listen for security information and event management (SIEM) events on your Defender for Identity standalone sensor](configure-event-collection.md). Defender for Identity supports User Datagram Protocol (UDP) traffic from your SIEM system or your syslog server.
- [Configure Windows event forwarding to your Defender for Identity standalone sensor](configure-event-forwarding.md). When you're forwarding syslog data to a standalone sensor, make sure not to forward *all* syslog data to your sensor.

> [!IMPORTANT]
> Defender for Identity standalone sensors don't support the collection of Event Tracing for Windows (ETW) log entries that provide the data for multiple detections. For full coverage of your environment, deploy the Defender for Identity sensor.

For more information, see the product documentation for your SIEM system or your syslog server.

## Check your current configuration

Before configuring Windows event collection manually, you can run a PowerShell script to check your current configuration and generate a report of any adjustments you need to make:

1. Download the [Defender for Identity PowerShell module](https://www.powershellgallery.com/packages/DefenderForIdentity/).  
1. Run the Defender for Identity `New-MDIConfigurationReport` PowerShell module to generate a report of your current Windows event auditing configuration.

    ```powershell
        New-MDIConfigurationReport -Path "C:\Reports" -Mode Domain -Identity "DOMAIN\ServiceAccountName" -OpenHtmlReport
    ```

    Where:
    - `Path` is the directory where the report is saved.
    - `Mode` indicates where the settings are collected from.
        - In `Domain` mode, the settings are collected from the Group Policy objects (GPOs). When using `-Mode Domain`, include the `-Identity` parameter to avoid an interactive prompt.
        - In `LocalMachine` mode, the settings are collected from the local machine.
    - `OpenHtmlReport` opens the HTML report after the report is generated.
    For example, to generate a report and open it in your default browser, run the following command:

    ```powershell
    New-MDIConfigurationReport -Path "C:\Reports" -Mode Domain -OpenHtmlReport
    ```

    For more information, see [New-MDIConfigurationReport](/powershell/module/defenderforidentity/new-mdiconfigurationreport?view=defenderforidentity-latest&preserve-view=true).

1. Review the report and make any necessary adjustments before configuring Windows event collection.

## Configure Windows event collection manually

This section includes instructions for manually configuring Windows event collection. Use these steps if you're deploying sensor v2.x, deploying on AD FS, AD CS, or Entra Connect servers that aren't domain controllers, or if you opted out of automatic auditing for sensor v3.x.

> [!NOTE]
> **Known issue:** In some v3 sensor environments, health alerts about Windows event auditing might persist even when auditing is correctly configured. This primarily occurs with manual auditing configuration, such as using Group Policy or PowerShell. The sensor remains healthy and detections aren't affected. To resolve, enable **Automatic Windows auditing configuration** in the Defender for Identity portal under **Settings** > **Advanced features**.

The following sections describe configuration for each server type:

- [Configure auditing on a domain controller](#configure-auditing-on-a-domain-controller)
- [Configure auditing on an AD FS server](#configure-auditing-on-an-ad-fs-server)
- [Configure auditing on an AD CS server](#configure-auditing-on-an-ad-cs-server)
- [Configure auditing on Microsoft Entra Connect](#configure-auditing-on-microsoft-entra-connect)
- [Configure auditing on the Configuration container](#configure-auditing-on-the-configuration-container)

### Configure auditing on a domain controller

To configure auditing on a domain controller, complete the following steps:

- [Configure Directory Services Advanced Auditing](#configure-directory-services-advanced-auditing)
- [Configure NTLM auditing](#configure-ntlm-auditing)
- [Configure Domain object auditing](#configure-domain-object-auditing)
- [Configure object-level auditing on the AD FS configuration folder](#configure-object-level-auditing-on-the-ad-fs-configuration-folder)


#### Configure Directory Services Advanced Auditing

This section describes how to modify your domain controller's Audit (Premium) Policy settings for Defender for Identity.

1. Sign in to the server as **Domain Administrator**.
1. Open the Group Policy Management Editor from **Server Manager** > **Tools** > **Group Policy Management**.
1. Expand **Domain Controllers Organizational Units**, right-click **Default Domain Controllers Policy**, and then select **Edit**.

    :::image type="content" source="../media/configure-windows-event-collection/advanced-audit-policy-check-step-1.png" alt-text="Screenshot of the pane for editing the default policy for domain controllers.":::

    > [!NOTE]
    > Use the Default Domain Controllers policy or a dedicated GPO to set these policies.

1. Go to **Computer Configuration** > **Policies** > **Windows Settings** > **Security Settings**. Depending on the policy you want to enable, do the following:

    1. Go to **Advanced Audit Policy Configuration** > **Audit Policies**.

        :::image type="content" source="../media/configure-windows-event-collection/advanced-audit-policy-check-step-2.png" alt-text="Screenshot of selections for opening an audit policy.":::


    1. Under **Audit Policies**, edit each of the following policies and select **Configure the following audit events** for both **Success** and **Failure** events.

        | Audit policy | Subcategory | Triggers event IDs |
        | --- |---|---|
        | **Account Logon** | **Audit Credential Validation** | 4776 |
        | **Account Management** | **Audit Computer Account Management**<sup>[*](#failure)</sup> | 4741, 4743 |
        | **Account Management** | **Audit Distribution Group Management**<sup>[*](#failure)</sup> | 4753, 4763 |
        | **Account Management** | **Audit Security Group Management**<sup>[*](#failure)</sup> | 4728, 4729, 4730, 4732, 4733, 4756, 4757, 4758 |
        | **Account Management** | **Audit User Account Management** | 4726 |
        | **DS Access** | **Audit Directory Service Changes**<sup>[*](#failure)</sup> | 5136  |
        | **System** | **Audit Security System Extension**<sup>[*](#failure)</sup> | 7045 |
        | **DS Access** | **Audit Directory Service Access** | 4662 - For this event, you must also [configure domain object auditing](#configure-domain-object-auditing).  |

        > [!NOTE]
        > <a name=failure>*</a> These subcategories don't support failure events. Add them for auditing purposes in case they're implemented in the future. For more information, see [Audit Computer Account Management](/windows/security/threat-protection/auditing/audit-computer-account-management), [Audit Security Group Management](/windows/security/threat-protection/auditing/audit-security-group-management), and [Audit Security System Extension](/windows/security/threat-protection/auditing/audit-security-system-extension).

    1. To configure **Audit Security Group Management**, under **Account Management**, select **Audit Security Group Management**, and then select **Configure the following audit events** for both **Success** and **Failure** events.

        :::image type="content" source="../media/configure-windows-event-collection/advanced-audit-policy-check-step-4.png" alt-text="Screenshot of the audit security group management properties log.":::

1. From an elevated command prompt, enter `gpupdate`.
1. After you apply the policy via GPO, confirm that the new events appear in the Event Viewer, under **Windows Logs** > **Security**.

    To test your audit policies from the command line, run the following command:

    ```cmd
    auditpol.exe /get /category:*
    ```

For more information, see the [auditpol reference documentation](/windows-server/administration/windows-commands/auditpol).


#### Configure NTLM auditing

When a Defender for Identity sensor parses Windows event 8004, it enriches Defender for Identity NTLM authentication activities with the server-accessed data. This section describes the configuration steps for auditing Windows event 8004.

> [!NOTE]
> Apply domain group policies to collect Windows event 8004 *only* to domain controllers.

To configure NTLM auditing:

1. Open **Group Policy Management**, and go to **Default Domain Controllers Policy** > **Local Policies** > **Security Options**.

1. Configure the specified security policies as follows:

    | Security policy setting | Value |
    |---|---|
    | **Network security: Restrict NTLM: Outgoing NTLM traffic to remote servers** | Audit all |
    | **Network security: Restrict NTLM: Audit NTLM authentication in this domain** | Enable all |
    | **Network security: Restrict NTLM: Audit Incoming NTLM Traffic** | Enable auditing for all accounts |

1. To configure **Outgoing NTLM traffic to remote servers**, under **Security Options**, double-click **Network security: Restrict NTLM: Outgoing NTLM traffic to remote servers**, and then select **Audit all**.

:::image type="content" source="../media/advanced-audit-policy-check-step-3.png" alt-text="Screenshot of the audit configuration for outgoing NTLM traffic to remote servers." border="false":::

#### Configure domain object auditing

To collect events for object changes, such as for event 4662, you must also configure object auditing on the user, group, computer, and other objects. The following procedure describes how to enable auditing in the Active Directory domain.

To configure domain object auditing:

1. Go to the **Active Directory Users and Computers** console.
1. Select the domain that you want to audit.
1. Select the **View** menu, and then select **Advanced Features**.
1. Right-click the domain and select **Properties**.

    :::image type="content" source="../media/configure-windows-event-collection/container-properties.png" alt-text="Screenshot of selections for opening container properties.":::

1. Go to the **Security** tab, and then select **Advanced**.

    :::image type="content" source="../media/configure-windows-event-collection/security-advanced.png" alt-text="Screenshot of the dialog for opening advanced security properties.":::

1. In **Advanced Security Settings**, select the **Auditing** tab, and then select **Add**.

    :::image type="content" source="../media/configure-windows-event-collection/auditing-tab.png" alt-text="Screenshot of the Auditing tab in the Advanced Security Settings dialog.":::

1. Choose **Select a principal**.

    :::image type="content" source="../media/configure-windows-event-collection/select-a-principal.png" alt-text="Screenshot of the button for selecting a principal.":::

1. Under **Enter the object name to select**, enter **Everyone**. Then select **Check Names** > **OK**.

    :::image type="content" source="../media/configure-windows-event-collection/select-everyone.png" alt-text="Screenshot of entering an object name of Everyone.":::

1. Go back to **Auditing Entry**. You need to create a separate auditing entry for **each** of the following object types:

    - **Descendant User Objects**
    - **Descendant Group Objects**
    - **Descendant Computer Objects**
    - **Descendant msDS-GroupManagedServiceAccount Objects**
    - **Descendant msDS-ManagedServiceAccount Objects**
    - **Descendant msDS-DelegatedManagedServiceAccount Objects** <sup>1</sup>

    > [!IMPORTANT]
    > Auditing must be configured for **all** of the listed object types, not just user objects. Configuring auditing for only one object type results in incomplete detection coverage.

    For each object type, make the following selections:

    1. For **Type**, select **Success**.
    1. For **Applies to**, select the object type from the list.
    1. Under **Permissions**, scroll down and select the **Clear all** button.

        :::image type="content" source="../media/clear-all.png" alt-text="Screenshot of the button for clearing all permissions.":::

    1. Scroll back up and select **Full Control**. All the permissions are selected.

    1. Clear the selection for the **List contents**, **Read all properties**, and **Read permissions** permissions, and then select **OK**. This step sets all the **Properties** settings to **Write**.

        :::image type="content" source="../media/configure-windows-event-collection/select-permissions.png" alt-text="Screenshot of selecting permissions.":::

        Now, all relevant changes to directory services appear as 4,662 events when they're triggered.

> [!NOTE]
>
> - You can assign auditing permissions to **All descendant objects**, using only the object types detailed in the previous step.
> - The **msDS-DelegatedManagedServiceAccount** class is relevant only for domains running at least one Windows Server 2025 domain controller.


#### Configure Object-level auditing on the AD FS configuration folder

1. Go to the **Active Directory Users and Computers** console, and select the domain where you want to enable the logs.
1. Go to **Program Data** > **Microsoft** > **ADFS**.

    :::image type="content" source="../media/configure-windows-event-collection/adfs-container.png" alt-text="Screenshot of a container for Active Directory Federation Services.":::

   
1. Right-click **ADFS** and select **Properties**.
1. Go to the **Security** tab and select **Advanced** > **Advanced Security Settings**. Then go to the **Auditing** tab and select **Add** > **Select a principal**.
1. Under **Enter the object name to select**, enter **Everyone**. Then select **Check Names** > **OK**.
1. Return to **Auditing Entry**. Make the following selections:

   - For **Type**, select **All**.
   - For **Applies to**, select **This object and all descendant objects**.
   - Under **Permissions**, scroll down and select **Clear all**. Scroll up and select **Read all properties** and **Write all properties**.
      
    :::image type="content" source="../media/configure-windows-event-collection/audit-adfs.png" alt-text="Screenshot of the auditing settings for Active Directory Federation Services.":::
    
   
1. Select **OK**.

### Configure auditing on an AD FS server

This section describes how to modify your Active Directory Federation Services (AD FS) audit configurations for Defender for Identity.

#### Configure a Group Policy for event auditing

1. Create a group policy to apply to your Active Directory Federation Services (AD FS).
1. Configure the following auditing settings:

   1. Go to **Computer Configuration\Policies\Windows Settings\Security Settings\Advanced Audit Policy Configuration\Audit Policies\Object Access\Audit Application Generated**.
   
   1. Select the checkboxes to configure audit events for **Success** and **Failure**.  

   :::image type="content" source="media/configure-windows-event-collection/group-policy-management-editor.png" alt-text="Screenshot of the advanced auditing audit policy configuration.":::


#### Configure AD FS event auditing in AD FS Management

1. Select **Start** > **Programs** > **Administrative Tools** > **AD FS Management**.
1. Go to **Actions** > **Edit Federation Service Properties**.
1. Select the **Events** tab.
1. Select the **Success audits** and **Failure audits** check boxes.
1. Select **OK**.

    :::image type="content" source="media/configure-windows-event-collection/federation-services-dialog.png" alt-text="Screenshot that shows the Federation service properties page." lightbox="media/configure-windows-event-collection/federation-services-dialog.png":::

   
#### Configure Verbose logging for AD FS events

Sensors running on AD FS servers must have the auditing level set to **Verbose** for relevant events. 

Use the following PowerShell command to configure the auditing level to **Verbose**:

```powershell
Set-AdfsProperties -AuditLevel Verbose
```

### Configure auditing on an AD CS server

If you're working with a dedicated server that has Active Directory Certificate Services (AD CS) configured, configure auditing as follows to view dedicated alerts and Secure Score reports:

1. Create a group policy to apply to your AD CS server. Edit it and configure the following auditing settings:

   1. Go to **Computer Configuration\Policies\Windows Settings\Security Settings\Advanced Audit Policy Configuration\Audit Policies\Object Access\Audit Certification Services**.

   1. Select the checkboxes to configure audit events for **Success** and **Failure**.

    :::image type="content" source="../media/configure-windows-event-collection/group-policy-management-editor.png" alt-text="Screenshot of configuring audit events for Active Directory Certificate Services in the Group Policy Management Editor.":::

1. Configure auditing on the certificate authority (CA) using one of the following methods:

   - **To configure CA auditing using PowerShell, run:**

```powershell
certutil -setreg CA\AuditFilter 127 
Restart-Service certsvc
```

This command updates the CA audit settings and restarts the Certificate Services service so the changes take effect.

   - **To configure CA auditing in the Defender portal:**

     1. Select **Start** > **Certification Authority (MMC Desktop application)**. Right-click your CA's name and select **Properties**.

        :::image type="content" source="../media/configure-windows-event-collection/certification-authority.png" alt-text="Screenshot of the Certification Authority dialog.":::

     1. Select the **Auditing** tab, select all the events that you want to audit, and then select **Apply**.

        :::image type="content" source="../media/configure-windows-event-collection/auditing.png" alt-text="Screenshot of the Auditing tab for certificate authority properties.":::

> [!NOTE]
> Configuring **Start and Stop Active Directory Certificate Services** event auditing might cause restart delays when you're dealing with a large AD CS database. Consider removing irrelevant entries from the database. Alternatively, don't enable this specific type of event.

### Configure auditing on Microsoft Entra Connect

To configure auditing on Microsoft Entra Connect servers:

1. Create a group policy to apply to your Microsoft Entra Connect servers. 
1. Edit the group policy and configure the following auditing settings:

   1. Go to **Computer Configuration\Policies\Windows Settings\Security Settings\Advanced Audit Policy Configuration\Audit Policies\Logon/Logoff\Audit Logon**.

   1. Select the checkboxes to configure audit events for **Success** and **Failure**.

    :::image type="content" source="media/configure-windows-event-collection/success-and-failure.png" alt-text="Screenshot of the Group Policy Management Editor.":::

### Configure auditing on the configuration container<a name="enable-auditing-on-an-exchange-object"></a>

You need the configuration container audit only for environments that currently have or previously had Microsoft Exchange. These environments have an Exchange container located within the domain's Configuration section.

1. Open the ADSI Edit tool. 
1. Select **Start** > **Run**, enter `ADSIEdit.msc`, and then select **OK**.
1. In the **Action** menu, select **Connect to**.
1. Go to **Connection Settings** > **Select a well known Naming Context**, > **Configuration** and select **OK**.
1. Expand the **Configuration** container to show the **Configuration** node, which begins with **"CN=Configuration,DC=..."**.

    :::image type="content" source="../media/cn-configuration.png" alt-text="Screenshot of selections for opening properties for the CN Configuration node.":::

1. Right-click the **Configuration** node and select **Properties**.

    :::image type="content" source="../media/configure-windows-event-collection/configuration-properties.png" alt-text="Screenshot of selections for opening properties for the Configuration node.":::
    

1. Select the **Security** tab, and then select **Advanced**.
1. In **Advanced Security Settings**, select the **Auditing** tab, and then select **Add**.
1. Choose **Select a principal**.
1. Under **Enter the object name to select**, enter **Everyone**. Then select **Check Names** > **OK**.
1. Return to **Auditing Entry**. Make the following selections:
    - For **Type**, select **All**.
    - For **Applies to**, select **This object and all descendant objects**.
    - Under **Permissions**, scroll down and select **Clear all**. Scroll up and select **Write all properties**.

    :::image type="content" source="../media/configure-windows-event-collection/audit-configuration.png" alt-text="Screenshot of the auditing settings for the Configuration container.":::
    
1. Select **OK**.

## Configure Windows event collection using PowerShell

For more information, see the [Defender for Identity PowerShell reference](/powershell/module/defenderforidentity/new-mdiconfigurationreport):
- [Set-MDIConfiguration](/powershell/module/defenderforidentity/set-mdiconfiguration)
- [Get-MDIConfiguration](/powershell/module/defenderforidentity/get-mdiconfiguration)

The following commands show how to modify your domain controller's Audit (Premium) Policy settings for Defender for Identity by using PowerShell.

**To view your audit policies:**

```powershell
Get-MDIConfiguration [-Mode] <String> [-Configuration] <String[]>
```

Where:

- `Mode` specifies whether to use `Domain` or `LocalMachine` mode. In `Domain` mode, the settings come from the Group Policy objects. In `LocalMachine` mode, the settings come from the local machine.
- `Configuration` specifies which configuration to get. Use `All` to get all configurations.

**To configure your settings:**

```powershell
Set-MDIConfiguration [-Mode] <String> [-Configuration] <String[]> [-CreateGpoDisabled] [-SkipGpoLink] [-Force]
```

Where:

- `Mode` specifies whether to use `Domain` or `LocalMachine` mode. In `Domain` mode, the settings come from the Group Policy objects. In `LocalMachine` mode, the settings come from the local machine.
- `Configuration` specifies which configuration to set. Use `All` to set all configurations.
- `CreateGpoDisabled` specifies if the GPOs are created and kept as disabled.
- `SkipGpoLink` specifies that GPO links aren't created.
- `Force` specifies that the configuration is set or GPOs are created without validating the current state.

The following command defines all settings for the domain, creates group policy objects, and links them.

```powershell
Set-MDIConfiguration -Mode Domain -Configuration All
```

## Update legacy configurations

Defender for Identity no longer requires logging 1,644 events. If you enabled either of the following settings, remove them from the registry.

```reg
Windows Registry Editor Version 5.00
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NTDS\Diagnostics]
"15 Field Engineering"=dword:00000005

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NTDS\Parameters]
"Expensive Search Results Threshold"=dword:00000001
"Inefficient Search Results Threshold"=dword:00000001
"Search Time Threshold (msecs)"=dword:00000001
```

## Related content

For more information, see:

- [Windows security auditing](/windows/security/threat-protection/auditing/security-auditing-overview)
- [Advanced security audit policies](/windows/security/threat-protection/auditing/advanced-security-auditing)
