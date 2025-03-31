---
title: Investigate OAuth application attack paths in Defender for Cloud Apps
description: Learn how to identify, analyze, and mitigate attack paths involving OAuth applications using Microsoft Defender for Cloud Apps and Security Exposure Management.
ms.topic: how-to
ms.date: 03/23/2025
---

# Investigate OAuth application attack paths in Defender for Cloud Apps

[Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management) helps you to manage your company's attack surface and exposure risk effectively. By combining assets and techniques, [attack paths](/security-exposure-management/review-attack-paths) illustrate the end-to-end paths that attackers can use to move from an entry point within your organization to your critical assets. This enables you to identify, prioritize, and mitigate the most significant risks to your exposed assets enhancing your organization overall security posture.
Microsoft Defender for Cloud Apps detected an increase in attackers using OAuth applications to access critical data in business-critical applications like Microsoft Teams, SharePoint, Outlook, and more. To support investigation and mitigation, these applications are integrated into the attack path and attack surface map views in Microsoft Security Exposure Management. By identifying, reducing, and managing these paths, you can minimize your attack surface and strengthen the security of your Microsoft 365 services.

### Prerequisites

To access the OAuth application attack path features in Exposure Management, ensure the following requirements are met:

- A Microsoft Defender for Cloud Apps license with [App Governance](app-governance-get-started.md) enabled.

- Microsoft 365 app connector must be activated. For information about connecting and about which of the app connectors provide security recommendations, see [Connect apps to get visibility and control with Microsoft Defender for Cloud Apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

For full functionality and visibility into attack path data, an E5 or Defender for Endpoint and Defender for Identity license are recommended.

### Required roles and permissions

> [!NOTE]
>  App Governance doesn't support Unified Role Based Access Control roles.

To access all Exposure Management features in the Defender portal make sure, you have the following permission enabled.  

|Permission |Actions |
|---------|---------|
|**Unified Role Based Access Control role**: “Exposure Management  |(read permissions) |


Make sure you have one of the following Microsoft Entra ID roles:

|Permission |Actions |
|---------|---------|
|**Global Admin**    | (read and write permissions)        |
|**Security Admin**    | (read and write permissions)        |
|**Security Operator**   | (read and limited write permissions)        |
|**Global Reader**    | (read permissions)        |
|**Security Reader**   | (read permissions)        |


>[!NOTE]
> Currently available in commercial cloud environments only. Microsoft Security Exposure Management data and capabilities are currently unavailable in U.S Government clouds - GCC, GCC High, DoD, and China Gov.


## View attack paths involving OAuth applications

For smaller organizations with a manageable number of attack paths, we recommend following this structured approach to investigate each attack path:

1. Go to Exposure Management > Attack surface > Attack paths.
   
1. Filter by 'Target type: AAD Service principal'

    :::image type="content" source="../../../GitHub/defender-docs-pr1/CloudAppSecurityDocs/media/saas-securty-initiative/Screenshot-of-the-attack-paths-aad-service-principal.png" alt-text="Screenshot of the attack path AAD service principal" lightbox="../../../GitHub/defender-docs-pr1/CloudAppSecurityDocs/media/saas-securty-initiative/Screenshot-of-the-attack-paths-aad-service-principal.png":::
 
1. To investigate an attack path, select the attack titled: "Device with high severity vulnerabilities allows lateral movement to service principal with sensitive permissions"

    :::image type="content" source="media/saas-securty-initiative/Screenshot-of-the-attack-path-name.png" alt-text="Screenshot of the attack path name":::

1. Select View in map to see the attack path

    :::image type="content" source="media/saas-securty-initiative/Screenshot-of-the-view-in-map-button.png" alt-text="Screenshot of the view in map button":::
  
1. Use the + sign to expand nodes and view detailed connections.

    :::image type="content" source="media/saas-securty-initiative/attack-surface-map.png" alt-text="Screenshot of the attack surface map":::
  
1. Hover or select on nodes and edges to explore extra data such as which permissions this service principal has.

    :::image type="content" source="media/saas-securty-initiative/Screenshot-of-the-permissions-set-for-service-principal.png" alt-text="Screenshot of the permissions set for the service principal":::

1. Copy the OAuth application's name and paste it into the search bar in the Applications page under Assets in the Defender portal.

     :::image type="content" source="media/saas-securty-initiative/Screenshot-of-the-oauth-applications-page.png" alt-text="Screenshot of the OAuth applications page":::
   
1. Click on the app name to investigate permissions and usage, for example, used or high privilege permissions.

    :::image type="content" source="media/saas-securty-initiative/Screenshot-of-permissions-assigned-to-the-oauth-app.png" alt-text="Screenshot of the permissions assigned to the Oauth app":::

If you determine the OAuth application should be disabled, you can disable it from the App Governance portal.

### Investigate choke points

For larger organizations with numerous attack paths that can't be manually investigated, we recommend using attack path data and utilizing the Choke Points experience as a prioritization tool. This approach allows you to:
- Identify assets connected with the most attack paths.
- Make informed decisions on which assets to prioritize for investigation.
- Filter by “Microsoft Entra OAuth app” to see which OAuth apps are involved in the most attack paths.
- Decide which OAuth applications to apply least privilege permissions to.

To get started:
1. Navigate to the Attack Paths > Choke Points page.
:::image type="content" source="media/saas-securty-initiative/Screenshot-of-the-choke-point-page.png" alt-text="Screenshot of the choke points page":::
    
1. Click on a choke point name to see more details about the top attack paths such as the name, entry point and target.
1. After you decide which Choke point to focus on, you can further investigate with the view blast radius.
1. Click on the View blast radius button.
1. Use the attack surface map to explore the data, check what assets are at risk, contextualize them in a broader network framework, and prioritize security focus.

1. Select an OAuth app that is displayed in the attack surface map. 
1. Copy the OAuth app name.
1. Go to the Applications inventory page to explore OAuth apps and get details on API permissions, privilege level, app origin, publisher, permission type, and services accessed. Select "Applications" under the "Assets" tab in the Defender XDR portal.
    

## Analyze attack surface map and hunt with queries

In the [Attack surface map](/security-exposure-management/cross-workload-attack-surfaces), you can see connections from user-owned apps, OAuth apps, and service principals. This relationship data is available in:

- ExposureGraphEdges table (shows connections)

- ExposureGraphNodes table (includes node properties like permissions)

Use the following Advanced Hunting query to identify all OAuth applications with critical permissions:

{ 
let RelevantNodes = ExposureGraphNodes
| where NodeLabel == "Microsoft Entra OAuth App" or NodeLabel == "serviceprincipal"
| project NodeId, NodeLabel, NodeName, NodeProperties;
ExposureGraphEdges
| where EdgeLabel == "has permissions to" or EdgeLabel == "can authenticate as"
| make-graph SourceNodeId --> TargetNodeId with RelevantNodes on NodeId
| graph-match (AppRegistration)-[canAuthAs]->(SPN)-[hasPermissionTo]->(Target)
        where AppRegistration.NodeLabel == "Microsoft Entra OAuth App" and
        canAuthAs.EdgeLabel == "can authenticate as" and
        SPN.NodeLabel == "serviceprincipal" and
        SPN.NodeProperties["rawData"]["criticalityLevel"]["criticalityLevel"] == 0 and
        hasPermissionTo.EdgeLabel == @"has permissions to" and
        Target.NodeLabel == "Microsoft Entra OAuth App" and
        Target.NodeName == "Microsoft Graph"
        project AppReg=AppRegistration.NodeLabel,
         canAuthAs=canAuthAs.EdgeLabel, SPN.NodeLabel, DisplayName=SPN.NodeProperties["rawData"]["accountDisplayName"],
         Enabled=SPN.NodeProperties["rawData"]["accountEnabled"], AppTenantID=SPN.NodeProperties["rawData"]["appOwnerOrganizationId"],
         hasPermissionTo=hasPermissionTo.EdgeLabel, Target=Target.NodeName,
         AppPerm=hasPermissionTo.EdgeProperties["rawData"]["applicationPermissions"]["permissions"]
| mv-apply AppPerm on (summarize AppPerm = make_list(AppPerm.permissionValue))
| project AppReg, canAuthAs, DisplayName, Enabled, AppTenantID, hasPermissionTo, Target, AppPerm`
} 

## Next steps

For more information, see:

[App governance in Microsoft Defender for Cloud Apps](/defender-cloud-apps/app-governance-manage-app-governance)

[Overview of attack surface management](/security-exposure-management/cross-workload-attack-surfaces)

[Overview of attack paths](/security-exposure-management/work-attack-paths-overview)

[!INCLUDE [Open support ticket](includes/support.md)]