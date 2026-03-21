---
title: Deploy and manage device control in Microsoft Defender for Endpoint with Microsoft Intune           
description: Learn how to deploy and manage device control in Defender for Endpoint using Microsoft Intune
author: limwainstein
ms.author: lwainstein
ms.date: 12/18/2025
ms.topic: overview
ms.service: defender-endpoint
ms.subservice: asr
audience: ITPro
ms.collection: 
- m365-security
- tier2
- mde-asr
ms.custom: 
- partner-contribution
ms.reviewer: joshbregman
search.appverid: MET150
f1.keywords: NOCSH
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business

---

# Deploy and manage device control in Microsoft Defender for Endpoint with Microsoft Intune

If you're using Intune to manage Defender for Endpoint settings, you can use it to deploy and manage device control capabilities. Different aspects of device control are managed differently in Intune, as described in the following sections.

## Configure and manage device control in Intune

1. In the Microsoft Intune admin center at <https://intune.microsoft.com>, go to **Endpoint security** \> **Manage** section \> **Attack surface reduction**. Or, to go directly to the **Endpoint security \| Attack surface reduction** page, use <https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/asr>.

2. On the **Policies** tab of the **Endpoint security \| Attack surface reduction** page, select **Create policy**.

3. On the **Create a profile** flyout that opens, configure the following settings:
   - **Platform**: Select **Windows**. Currently, device control isn't supported on Windows Server, even though **This policy applies to** shows it.
   - **Profile**: Select **Device Control**.

   When you're finished on the **Endpoint security \| Attack surface reduction** page, select **Create.

4. The **Create Policy** wizard opens. On the **Basics** tab, configure the following settings:
   - **Name**: Enter a unique, descriptive name for the policy.
   - **Description**: Enter an optional description.

   Select **Next**.

5. On the **Configuration settings** tab, configure some or all of the following settings:
   - **Defender**: See [Allow Full Scan Removable Drive Scanning](/windows/client-management/mdm/policy-csp-defender#allowfullscanremovabledrivescanning) settings.
   - **Device Control**: Configure custom policies with reusable settings. See the [Device control profiles](#device-control-profiles) section later in this article and [Device control overview: Rules](device-control-policies.md#rules)..
   - **Device Installation Restrictions**: See [Device Installation](/windows/client-management/mdm/policy-csp-deviceinstallation?WT.mc_id=Portal-fx) settings.
   - **Removable Storage Access**: See [Removable Storage Access](/windows/client-management/mdm/policy-csp-admx-removablestorage) settings.
   - **Data Protection**: See [Allow Direct Memory Access](/windows/client-management/mdm/policy-csp-dataprotection) settings.
   - **Dma Guard**: See [Device Enumeration Policy](/windows/client-management/mdm/policy-csp-dmaguard?WT.mc_id=Portal-fx) settings.
   - **Storage**: See [Removable Disk Deny Write Access](/windows/client-management/mdm/policy-csp-Storage#removablediskdenywriteaccess) settings.
   - **Connectivity**: See [Allow USB Connection](/windows/client-management/mdm/policy-csp-Connectivity#allowusbconnection)** and [Allow Bluetooth](/windows/client-management/mdm/policy-csp-Connectivity#allowbluetooth) settings.
   - **Bluetooth**: Settings related to Bluetooth connections and services. See [Policy CSP - Bluetooth](/windows/client-management/mdm/policy-csp-Bluetooth?WT.mc_id=Portal-fx).
   - **System**: See [Allow Storage Card](/windows/client-management/mdm/policy-csp-System#allowstoragecard) settings.

   > [!TIP]
   > You don't need to configure all available settings at once. Consider starting with **Device Control** settings as described in the next section.

   :::image type="content" source="media/intune-device-control-policy-create-config-settings.png" alt-text="Screenshot of Intune user interface for device control policies." lightbox="media/intune-device-control-policy-create-config-settings.png":::

   When you'r finished on the **Configuration settings** tab, select **Next**.

6. On the **Scope tags** tab, the scope tag named **Default** is select by default, but you can remove it and select other existing [scope tags](/intune/intune-service/fundamentals/scope-tags). When you're finished, select **Next**.

7. On the **Assignments** tab, specify groups of users or devices to receive your policy. For more information, see [Assign policies in Intune](/intune/intune-service/configuration/device-profile-assign).

8. On the **Review + create** tab, review your settings, and make any needed changes.
   When you're ready, select **Create** to create your device control policy.

## Device control profiles

In Intune, each row in the **Device Control** section represents a device control policy. You can add and remove policies using **+ Add** and **– Remove**. The name of the policy appears in the warning to users, and in advanced hunting and reports.

After you select **+ Add**, the following settings are available:

- **Included Devices**: The reusable setting that the policy applies to.
- **Excluded Devices**: The reusable setting that's excluded from the policy.
- **Access**: The permissions allowed and the behavior for device control that comes into force when the policy applies.

:::image type="content" source="media/device-control-profile.png" alt-text="The screenshot that shows the page on which you can configure the settings for the Device Control capability." lightbox="media/device-control-profile.png":::

For information on how to add the reusable groups of settings that are included in the row of each device control policy, see [Add reusable groups to a Device Control profile](/intune/intune-service/protect/reusable-settings-groups#add-reusable-groups-to-a-device-control-profile).

You can add audit policies, and you can add Allow/Deny policies. We always recommended adding an Allow and/or Deny policy when adding an audit policy so you don't experience unexpected results.  

> [!IMPORTANT]
> If you only configure audit policies, the permissions are inherited from the default enforcement setting.
>
> The order in the which policies are listed in the user interface isn't preserved for policy enforcement. The best practice is to use **Allow/Deny policies**. Ensure that the **Allow/Deny policies** option is non-intersecting by explicitly adding devices to be excluded. Using Intune's graphical interface, you cannot change the default enforcement. If you change the default enforcement to `Deny`, and create an `Allow` policy to be applied specific devices, all devices are blocked except for any devices that are set in the `Allow` policy.

## Defining Settings with OMA-URI

> [!IMPORTANT]
> Using Intune OMA-URI to configure device control requires the *Device Configuration* workload to be managed by Intune, if the device is co-managed with Configuration Manager. For more information, see [How to switch Configuration Manager workloads to Intune](/intune/configmgr/comanage/how-to-switch-workloads).

In the following table, identify the setting you want to configure, and then use the information in the OMA-URI and data type & values columns. Settings are listed in alphabetical order.

|Setting|OMA-URI, data type, & values|
|---|---|
|**Device control default enforcement** <br/> Default enforcement establishes what decisions are made during device control access checks when none of the policy rules match | `./Vendor/MSFT/Defender/Configuration/DefaultEnforcement` <br/><br/> Integer: <br/>- `DefaultEnforcementAllow` = `1` <br/> - `DefaultEnforcementDeny` = `2`|
|**Device types** <br/> Device types, identified by their Primary IDs, with device control protection turned on. You must specify the product family IDs, separated by a pipe. When selecting multiple devices types you need to ensure the string is all one word with no spaces. A configuration that does not follow this syntax will cause unexpected behavior.|`./Vendor/MSFT/Defender/Configuration/SecuredDevicesConfiguration` <br/><br/> String: <br/> - `RemovableMediaDevices`<br/> - `CdRomDevices`<br/> - `WpdDevices`<br/> - `PrinterDevices`|
|**Enable device control** <br/> Enable or disable device control on the device|`./Vendor/MSFT/Defender/Configuration/DeviceControlEnabled` <br/><br/> Integer: <br/> - Disable = `0` <br/> - Enable = `1`|

### Creating policies with OMA-URI

:::image type="content" source="media/create-policy-with-oma-uri.png" alt-text="The screenshot that shows the page on which you can create a policy with OMA-URI." lightbox="media/create-policy-with-oma-uri.png":::

When you create policies with OMA-URI in Intune, create one XML file for each policy. As a best practice, use the Device Control Profile or Device Control Rules Profile to author custom policies.

In the **Add Row** pane, specify the following settings:

- In the **Name** field, type `Allow Read Activity`.
- In the **OMA-URI** field, type `./Vendor/MSFT/Defender/Configuration/DeviceControl/PolicyRules/%7b[PolicyRule Id]%7d/RuleData`. (You could use the PowerShell command `New-Guid` to generate a new Guid, and replace `[PolicyRule Id]`.)
- In the **Data Type** field, select **String (XML file)**, and use **Custom XML**.

You can use parameters to set conditions for specific entries. Here's a [group example XML file for Allow Read access for each removable storage](https://github.com/microsoft/mdatp-devicecontrol/blob/main/windows/device/Intune%20OMA-URI/Allow%20Read.xml).

> [!NOTE]
> Comments using XML comment notation `<!-- COMMENT -->` can be used in the Rule and Group XML files, but they must be inside the first XML tag, not the first line of the XML file.

### Creating groups with OMA-URI

:::image type="content" source="media/create-group-with-oma-uri.png" alt-text="The screenshot that shows the page on which you can create a group with OMA-URI." lightbox="media/create-group-with-oma-uri.png":::

When you create groups with OMA-URI in Intune, create one XML file for each group. As a best practice, use reusable settings to define groups.

In the **Add Row** pane, specify the following settings:

- In the **Name** field, type `Any Removable Storage Group`.
- In the **OMA-URI** field, type `./Vendor/MSFT/Defender/Configuration/DeviceControl/PolicyGroups/%7b[GroupId]%7d/GroupData`. (To get your GroupID, in the Intune admin center, go to **Groups**, and then select **Copy the Object ID**. Or, you could use the PowerShell command `New-Guid` to generate a new Guid, and replace `[GroupId]`.)
- In the **Data Type** field, select **String (XML file)**, and use **Custom XML**.

> [!NOTE]
> Comments using XML comment notation `<!-- COMMENT -- >` can be used in the Rule and Group XML files, but they must be inside the first XML tag, not the first line of the XML file.

## Configure removable storage access control using OMA-URI

1. Go to the [Microsoft Intune admin center](https://intune.microsoft.com) and sign in.

1. Choose **Devices** > **Configuration profiles**. The **Configuration profiles** page appears. 

1. Under the **Policies** tab (selected by default), select **+ Create**, and choose **+ New policy** from the drop-down that appears. The **Create a profile** page appears.

1. In the **Platform** list, select **Windows 10, Windows 11, and Windows Server** from the **Platform** drop-down list, and choose **Templates** from the **Profile type** drop-down list.

1. Once you choose **Templates** from the **Profile type** drop-down list, the **Template name** pane is displayed, along with a search box (to search the profile name).

1. Select **Custom** from the **Template name** pane, and select **Create**.

1. Create a row for each setting, group, or policy by implementing Steps 1-5.

## View device control groups (Reusable settings)

In Intune, device control groups appear as reusable settings.

1. Go to the [Microsoft Intune admin center](https://intune.microsoft.com) and sign in.

1. Go to **Endpoint Security** > **Attack Surface Reduction**. 

1. Select the **Reusable Settings** tab.

## See also

- [Device control in Defender for Endpoint](device-control-overview.md)
- [Device control policies and settings](device-control-policies.md)
- [Device Control for macOS](mac-device-control-overview.md)
