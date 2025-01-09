---
title: Prerequisites and support in Microsoft Security Exposure Management
description: Review the prerequisites for Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/18/2024

---

# Prerequisites and support

This article describes the requirements and prerequisites for using Microsoft Security Exposure Management.

## Permissions

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

## Manage permissions with Microsoft Defender XDR Unified role-based access control (RBAC)

[Microsoft Defender XDR Unified role-based access control(RBAC)](/defender-xdr/manage-rbac) allows you to create custom roles with specific permissions for Exposure Management. These permissions are located under the **Security posture** category in Defender XDR Unified RBAC permissions model and are named:

- **Exposure Management (read)** for read-only access 
- **Exposure Management (manage)** for access to manage Exposure Management experiences

For more sensitive actions in Exposure Management, users need the **Core security settings (manage)** permission which is located under the **Authorization and settings** category.

To access Exposure Management data and actions, a custom role in Defender XDR Unified RBAC with any of the permissions mentioned here, shall be assigned to the **Microsoft Security Exposure Management** data source.

To learn more about using Microsoft Defender XDR Unified RBAC to manage your Secure Score permissions, see [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac).

The following table highlights what a user can access or perform with each of the permissions:

|Permission name|Actions|
| -------- | -------- |
|**Exposure Management (read)** |Access to all Exposure Management experiences and read access to all available data|
|**Exposure Management (manage)**|In addition to the read access, the user can set initiative target score, edit metric values, manage recommendations (might require additional permissions related to the specific actions needed to be taken)|
|**Core security settings (manage)**|Connect or change vendor to the External Attack Surface Management initiative|

For full Microsoft Security Exposure Management access, user roles need access to all Defender for Endpoint [device groups](/microsoft-365/security//defender-endpoint/machine-groups).
Users with restricted access to some of the organization's device groups can:

- Access global exposure insights data.
- View affected assets under metrics, recommendations, events, and initiatives history only within their scope.
- View devices in attack paths that are within their scope.
- Access the Security Exposure Management attack surface map and advanced hunting schemas (ExposureGraphNodes and ExposureGraphEdges) for the device groups they have access to.

> [!NOTE]
> Access with manage permissions to **Critical asset management**, under **System> Settings> Microsoft Defender XDR** requires users to have access to all Defender for Endpoint device groups.

## Access with Microsoft Entra ID roles

An alternative to managing access with Microsoft Defender XDR Unified RBAC permissions, access to Microsoft Security Exposure Management data and actions is also possible with [Microsoft Entra ID Roles](/entra/identity/role-based-access-control/custom-overview). You need a tenant with at least one Global Admin or Security Admin to create a Security Exposure Management workspace.

For full access, users need one of the following Microsoft Entra ID roles:

- **Global Admin** (read and write permissions)
- **Security Admin** (read and write permissions)
- **Security Operator** (read and limited write permissions)
- **Global Reader** (read permissions)
- **Security Reader** (read permissions)

Permission levels are summarized in the table.

| Action| Global Admin |Global Reader | Security Admin  | Security Operator | Security Reader |
|---------|---------|---------|---------|---------|---------|
| **Grant permissions to others** | ✔       |  -       |   -      | - | -|
|  **Onboard your organization to the Microsoft Defender External Attack Surface Management (EASM) initiative**   | ✔       |  ✔       |   ✔      | ✔ | ✔ |
|  **Mark initiative as a favorite**   | ✔       |  ✔       |   ✔      | ✔ | ✔ |
| **Set initiative target score** | ✔       |  -       |   ✔      | - | - |
|  **View general initiatives**  | ✔       |  ✔       |   ✔      | ✔ | ✔ |
|  **Share metric/Recommendations**   | ✔       |  ✔       |   ✔      | ✔ | ✔ |
| **Edit metric weight** | ✔       |  -       |   ✔     | - | - |
| **Export metric (PDF)** | ✔       |  ✔       |   ✔      | ✔ | ✔ |
|  **View metrics**  | ✔       |  ✔       |   ✔      | ✔ | ✔ |
| **Export assets (metric/recommendation)**  | ✔       |  ✔       |   ✔      | ✔ | ✔ |
|  **Manage recommendations**  |    ✔    | -  |  ✔  |   -      | - |
|  **View recommendations**  | ✔       |  ✔       |   ✔      | ✔ | ✔ |
|  **Export events**  | ✔       |  ✔       |   ✔      | ✔ | ✔ |
|  **Change criticality level**  | ✔       |  -       |   ✔      | ✔ | - |
| **Set critical asset rule** | ✔       |  -       |   ✔      | - | - |
|  **Create criticality rule**  | ✔       |    -    |   ✔      | - | - |
|  **Turn criticality rule on/off**  | ✔       |    -    |   ✔      | ✔ | - |
|  **Run a query on exposure graph data**  |    ✔    |   ✔     |  ✔       | ✔ | ✔ |
| **Configure data connectors** |  ✔    |      |   ✔   |    ✔  |      |
| **View data connectors**     |  ✔   |   ✔   |  ✔    |     ✔ |   ✔   |

## Browser requirements

You can access Security Exposure Management in the Microsoft Defender portal using Microsoft Edge, Internet Explorer 11, or any HTML 5 compliant web browser.

## Critical asset classification

- Before you start, learn about [critical asset management](critical-asset-management.md) in Security Exposure Management.
- [Review required permissions](prerequisites.md#permissions) for working with the critical assets.
- When classifying critical assets, we support devices running version 10.3740.XXXX of the Defender for Endpoint sensor or later. We recommended running a more recent sensor version, as listed on the Defender for Endpoint [What's New page](/defender-endpoint/windows-whatsnew).

    You can check which sensor version a device is running as follows:

  - On a specific device, browse to the MsSense.exe file in
C:\Program Files\Windows Defender Advanced Threat Protection. Right-click the file, and select **Properties**. On the **Details** tab, check the file version.
  - For multiple devices, it's easier to run an [advanced hunting Kusto query](/defender-xdr/advanced-hunting-query-language) to check device sensor versions, as follows:

    ``` DeviceInfo | project DeviceName, ClientVersion ```

## Getting support

To get support, select the Help question mark icon in the Microsoft Security toolbar.

:::image type="content" source="./media/microsoft-defender-portal-header.png" alt-text="Screenshot of the Microsoft Defender security portal Help button in the portal header bar.":::

You can also engage with the [Microsoft Tech community](https://techcommunity.microsoft.com/).  

## Next steps

[Start using Microsoft Security Exposure Management](get-started-exposure-management.md).
