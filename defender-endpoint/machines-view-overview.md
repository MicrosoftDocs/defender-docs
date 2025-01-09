---
title: Device inventory
description: Learn about the available features that you can use from the Devices list such as sorting, filtering, and exporting the list to enhance investigations.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.reviewer: yongrhee
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: conceptual
search.appverid: met150
ms.date: 10/30/2024
---

# Device inventory

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-machinesview-abovefoldlink)

The **Device inventory** shows a list of the devices in your network where alerts were generated. By default, the queue displays devices seen in the last 30 days. At a glance, you see information such as domain, risk level, OS platform, and other details for easy identification of devices most at risk.

> [!NOTE]
> The device inventory is available in Microsoft Defender XDR services. The available information might differ depending on your license. To get the most complete set of capabilities, use [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md).
>
> Risk Level, which can influence enforcement of Conditional Access and other security policies in Microsoft Intune, is now available for Windows devices.

There are several options you can choose from to customize the devices list view. On the top navigation you can:

- Add or remove columns.
- Export the entire list in CSV format.
- Select the number of items to show per page.
- Apply filters.

During the onboarding process, the **Devices list** is gradually populated with devices as they begin to report sensor data. Use this view to track your onboarded endpoints as they come online, or download the complete endpoint list as a CSV file for offline analysis.

> [!NOTE]
> If you export the devices list, it contains every device in your organization. It might take a significant amount of time to download, depending on how large your organization is. Exporting the list in CSV format displays the data in an unfiltered manner. The CSV file includes all devices in the organization, regardless of any filtering applied in the view itself.
>
> In addition, when you export the devices list, the antivirus status shows as `Not-Supported`. For antivirus status, use the recently released [Microsoft Defender Antivirus health report](device-health-microsoft-defender-antivirus-health.md) instead. This report allows you to export even more details.

The following image depicts the devices list:

:::image type="content" source="media/device-inventory.png" alt-text="The list of devices" lightbox="media/device-inventory.png":::

## Sort and filter the device list

You can apply the following filters to limit the list of alerts and get a more focused view.

### Device name

During the Microsoft Defender for Endpoint onboarding process, devices onboarded to Defender for Endpoint are gradually populated into the device inventory as they begin to report sensor data. The device inventory is also populated by devices that are discovered in your network through the device discovery process. The device inventory has the following tabs:

- **All devices**
- **Computers & mobile**: Enterprise endpoints (workstations, servers, and mobile devices).
- **Network devices**: Devices like routers and switches.
- **IoT/OT devices**: Enterprise internet of things (IoT) devices like printers and cameras, and operational technology (OT) devices like servers or packaging systems.
- **Uncategorized devices**: Devices that couldn't be properly classified.

## Navigate to the Device inventory page

In the Defender portal at <https://security.microsoft.com>, go to **Assets** \> **Devices**. Or, to go directly to the **Device inventory** page, use <https://security.microsoft.com/machines>.

## Device inventory overview

The device inventory opens on the **All devices** tab. You can see information such as device name, domain, risk level, exposure level, OS platform, criticality level, onboarding status, sensor health state, mitigation status, and other details for easy identification of devices most at risk.

The **Classify critical assets** card allows you to define device groups as business critical. You might also see the **Attack path warning** card, which takes you to Attack paths to examine if any of your assets are part of an attack path. For more information, see [Overview of attack paths](/security-exposure-management/work-attack-paths-overview).

> [!NOTE]
> Classify critical assets and attack path information is part of Microsoft Security Exposure Management, which is currently in public preview.

Use the **Onboarding Status** column to sort and filter by discovered devices, and devices that are already onboarded to Microsoft Defender for Endpoint.

:::image type="content" alt-text="Image of devices list with list of devices." source="media/device-inventory.png" lightbox="media/device-inventory.png":::

From the **Network devices** and **IoT/OT devices** tabs, you also see information such as vendor, model, and device type:

:::image type="content" alt-text="Image of network devices list." source="media/device-inventory-networkdevices.png" lightbox="media/device-inventory-networkdevices.png":::

> [!NOTE]
> Device discovery integration with [Microsoft Defender for IoT in the Defender portal (Preview)](/defender-for-iot/microsoft-defender-iot) is available to help locate, identify, and secure your complete OT/IOT asset inventory. Devices discovered with this integration appear on the **IoT/OT devices** tab.
>
> With Defender for IoT, you can also view and manage Enterprise IoT devices (like printers, smart TVs, and conferencing systems) as part of enterprise IoT monitoring. For more information, see [Enable Enterprise IoT security with Defender for Endpoint](/azure/defender-for-iot/organizations/eiot-defender-for-endpoint/).

At the top of each device inventory tab, the following device counts are available:

- **Total**: The total number of devices.
- **Critical assets**: The number of your business critical assets (**All devices** tab only).
- **High risk**: The number of devices that are identified as a higher risk to your organization.
- **High exposure**The number of devices with high exposure.
- **Not onboarded**: The number of devices that aren't yet onboarded. (**All devices** and **Computers & mobile** tabs only).
- **Newly discovered**: The number of newly discovered devices within the last 7 days (all tabs except **Computers & mobile**).

You can use this information to help you prioritize devices for security posture improvements.

## Explore the device inventory

There are several options to customize the device inventory view. On the top navigation for each tab you can:

- Search for a device by name.
- Search for a device by the most recently used IP or Mac address or IP address prefix.
- Add or remove columns.
- Export the entire list in CSV format for offline analysis.
- Select the date range to display.
- Apply filters.

> [!NOTE]
> If you export the device list to CSV, it contains every device in your organization, so it might take a long time to download the CSV file. The CSV file contains unfiltered data for all devices in the organization, regardless of any filters.

You can use the sort and filter functionality on each device inventory tab to get a more focused view. These controls also help you assess and manage the devices in your organization.

The counts on the top of each tab are updated based on the current view.

## Use filters to customize the device inventory views

The available device properties to use as filters vary based on the device inventory tab as described in the following table:

|Property|Tabs|Description|
|---|---|---|
|**Cloud platforms**|<ul><li>**All devices**</li><li>**Computers & mobile**</li></ul>|The cloud platform that the device belongs to. The available values are: <ul><li>**Azure**</li><li>**AWS**</li><li>**GCP**</li><li>**Arc**</li><li>**None**</li></ul>|
|**Criticality level**|<ul><li>**All devices**</li><li>**Computers & mobile**</li></ul>|The assigned criticality level of the device (how critical a device is for your organization). The available values are: <ul><li>**Very high**: The device is considered a business critical asset</li><li>**High**</li><li>**Medium**</li><li>**Low**</li><li>**None**</li></ul> <br/> For more information, see [Overview of critical asset management](/security-exposure-management/critical-asset-management).|
|**Device category**|**All devices**|The category value assigned to the device. Enter a value or select from the available values: <ul><li>**BMS**</li><li>**Computers and Mobile**</li><li>**IoT**</li><li>**Medical**</li><li>**Network Device**</li><li>**OT**</li><li>**Unknown**</li></ul>|
|**Device subtype**|<ul><li>**All devices**</li><li>**IoT/OT**</li></ul>|The subtype value assigned to the device. Enter a value or select an available value (for example, **Video conference**).|
|**Device type**|<ul><li>**All devices**</li><li>**IoT/OT**</li></ul>|The type value assigned to the device. Enter a value or select an available value (for example, **Audio and Video**).|
|**Device role**|All|The specific role of the device within the organization. For detailed descriptions of each role, see [Predefined classifications](/security-exposure-management/predefined-classification-rules-and-levels).|
|**Device value**|All|The assigned value of the device. The available values are **High** and **Low**.|
|**Discovery sources**|All|The source reporting on the device.|
|**Exclusion state**|All|The available values are **Not excluded** and **Excluded**. For more information, see [Exclude devices](exclude-devices.md).|
|**Exposure level**|All|The exposure level of the device based on pending security recommendations. The available values are: <ul><li>**High**</li><li>**Medium**</li><li>**Low**: Devices are less vulnerable to exploitation.</li><li>**No data available**: Possible causes for this value include: <ul><li>The device is inactive (stopped reporting for more than 30 days).</li><li>The OS on the device isn't supported. For more information, see [minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md).</li><li>The agent software on the device is stale (unlikely).</li></ul></li></ul>|
|**First seen**|All tabs except **Network devices**|How long ago the device was first seen on the network or when it was first reported by the Microsoft Defender for Endpoint sensor. The available values are **Last 7 days** or **Over 7 days ago**.|
|**Group**|<ul><li>**All devices**</li><li>**Computers & mobile**</li><li>**Network devices**</li></ul>|Device groups. Enter a value in the box.|
|**Internet facing**|<ul><li>**All devices**</li><li>**Computers & mobile**</li></ul>|Whether the device is internet facing. The available values are **Yes** and **No**.|
|**Managed by**|<ul><li>**All devices**</li><li>**Computers & mobile**</li></ul>|How the device is being managed. The available values are: <ul><li>**Intune**</li><li>**Intune**: Microsoft Intune, including co-management with Microsoft Configuration Manager via tenant attach.</li><li>**ConfigMgr**: Microsoft Configuration manager.</li><li>**MDE**: Microsoft Defender for Endpoint.</li><li>**Unknown**: This value is caused by one of the following conditions: <ul><li>An outdated version of Windows.</li><li>GPO management.</li><li>Non-Microsoft mobile device management (MDM).</li></ul></li></ul>|
|**Mitigation status**|<ul><li>**All devices**</li><li>**Computers & mobile**</li></ul>|The available values are **Contained** and **Isolated**.|
|**Model**|**All devices**|The model of the device. Enter a value or select from the available values.|
|**Onboarding status**|<ul><li>**All devices**</li><li>**Computers & mobile**</li></ul>|Whether the device is currently onboarded in Defender for Endpoint. Device discovery must be enabled for this filter to appear. The available values are: <ul><li>**Onboarded**: The device is onboarded to Defender for Endpoint.</li><li>**Can be onboarded**: The supported device was discovered, but it isn't currently onboarded. We highly recommend onboarding these devices.</li><li>**Unsupported**: The unsupported device was discovered.</li><li>**Insufficient info**: The system couldn't determine the supportability of the device.|
|**OS Platform**|<ul><li>**All devices**</li><li>**Computers & mobile**</li></ul>|The operating system on the device. The available values are: <ul><li>**Windows 11**</li><li>**Windows 10**</li><li>**Windows 8.1**</li><li>**Windows 8**</li><li>**Windows 7**</li><li>**Windows Server 2022**</li><li>**Windows Server 2019**</li><li>**Windows Server 2016**</li><li>**Windows Server 2012 R2**</li><li>**Windows Server 2008 R2**</li><li>**Linux**</li><li>**macOS**</li><li>**iOS**</li><li>**Android**</li><li>**Windows 10 WVD**</li><li>**Other**</li></ul>|
|**OS Version**|**All devices**|The version of the operating system, which includes Windows versions. On the **Computers & mobile** tab, the **Windows version** filter is also available.|
|**Risk level**|All|The overall risk assessment of the device based on a combination of factors, including the type and severity of active alerts on the device. The available values are: <ul><li>**High**</li><li>**Medium**</li><li>**Low**</li><li>**Informational**</li><li>**No known risk**</li></ul> <br/> Resolving active alerts, approving remediation activities, and suppressing subsequent alerts can lower the risk level.|
|**Sensor health state**|<ul><li>**All devices**</li><li>**Computers & mobile**</li></ul>|The available values for onboarded devices are: <ul><li>**Active**: Devices that are actively reporting sensor data to the service.</li><li>**Inactive**: Devices that stopped sending signals for more than seven days.</li><li>**Misconfigured**: Devices with impaired communications or devices that can't send sensor data. For more information on how to address issues on misconfigured devices, see, [Fix unhealthy sensors](fix-unhealthy-sensors.md)</li></ul>.|
|**Site**|<ul><li>**All devices**</li><li>**IoT/OT**</li></ul>|Used for Defender for IoT [site security](/defender-for-iot/site-security-overview) (requires a Defender for IoT license).|
|**Tags**|All|The grouping and tagging that you added to individual devices. For more information, see [Create and manage device tags](machine-tags.md).|
|**Transient device**|All|The available values are **No** and **Yes**. By default, transient devices are filtered to reduce inventory noise. For more information, see [Identifying transient devices](transient-device-tagging.md).|
|**Vendor**|**All devices**|The vendor of the device. Enter a value or select from the available values.|
|**Windows version**|**Computers & mobile**|The version of Windows. The **OS version** filter is also available. <br/> The value **Future version** for this property is caused by one of the following scenarios: <ul><li>A prerelease build of a future Windows release.</li><li>The build has no version name.</li><li>The build version name isn't yet supported</li></ul> <br/> The full OS version is visible on the device details page.|

## Use columns to customize the device inventory views

You can sort the entries by clicking on an available column header. Select :::image type="icon" source="media/m365-cc-sc-customize-icon.png" border="false"::: **Customize columns** to change the columns that are shown. The default values are marked with an asterisk (*):

- **All devices** tab:
  - **Name***
  - **IP***
  - **MAC address**
  - **Criticality level***
  - **Device category***
  - **Device role**
  - **Device type***
  - **Device subtype**
  - **Vendor**
  - **Model**
  - **Domain***
  - **Device AAD id***
  - **Risk level***
  - **Exposure level***
  - **OS platform***
  - **OS distribution**
  - **OS version***
  - **Sensor health state***
  - **Onboarding status***
  - **Discovery sources**
  - **First seen**
  - **Last device update***
  - **Tags***
  - **Exclusion state**
  - **Managed by***
  - **Managed by status***
  - **Mitigation status***
  - **Cloud platforms***

  Firmware information for OT devices is displayed in the **OS version** and **Model** columns.

- **Computers & mobile** tab:
  - **Name***
  - **Domain***
  - **Device AAD id***
  - **Device role**
  - **Device type**
  - **Device subtype**
  - **Risk level***
  - **Exposure level***
  - **OS platform***
  - **OS distribution**
  - **Windows version***
  - **MAC address**
  - **Criticality level***
  - **Sensor health state***
  - **Onboarding status***
  - **Discovery sources**
  - **Last device update***
  - **First seen**
  - **Tags***
  - **Exclusion state**
  - **Managed by***
  - **Managed by status***
  - **Mitigation status***
  - **Cloud platforms***

- **Network devices** tab
  - **IP***
  - **MAC address**
  - **Vendor***
  - **Model***
  - **Name***
  - **Discovery sources**
  - **Domain**
  - **Device type**
  - **Device subtype**
  - **Risk level***
  - **Exposure level***
  - **OS distribution***
  - **OS version***
  - **Last device update***
  - **First seen**
  - **Tags***
  - **Exclusion state**

- **IoT/OT devices** tab
  - **IP***
  - **MAC address***
  - **Name***
  - **Device type***
  - **Device subtype***
  - **Vendor***
  - **Model***
  - **Risk level***
  - **Exposure level***
  - **Discovery sources**
  - **OS distribution***
  - **OS version***
  - **First seen**
  - **Last device update***
  - **Domain**
  - **Tags***
  - **Exclusion state**

- **Uncategorized devices** tab:
  - **Name***
  - **Vendor***
  - **IP***
  - **Discovery sources**
  - **MAC address**
  - **Risk level**
  - **Exposure level**
  - **OS distribution***
  - **OS version***
  - **Last device update***
  - **First seen**
  - **Tags***
  - **Exclusion state**

> [!TIP]
> To see all columns, you likely need to do one or more of the following steps:
>
> - Horizontally scroll in your web browser.
> - Narrow the width of appropriate columns.
> - Zoom out in your web browser.

## Related articles

[Investigate devices in the Microsoft Defender for Endpoint Devices list](investigate-machines.md).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
