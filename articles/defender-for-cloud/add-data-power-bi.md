---
title: Add Defender for Cloud data to Power BI
description: Learn how to connect Power BI to Microsoft Defender for Cloud to gain enhanced value from the data collected by Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/12/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how to connect Power BI to Microsoft Defender for Cloud so that I can gain enhanced value from the data collected by Defender for Cloud.
---

# Add Defender for Cloud data to Power BI

By connecting Microsoft Defender for Cloud's data with Microsoft Power BI, you can easily monitor and analyze your security metrics. The integration allows you to visualize security insights and quickly identify potential threats and vulnerabilities. This article guides you through the steps to connect Defender for Cloud data to Power BI, helping you transform complex security information into clear, actionable insights.

## Prerequisites

- [Download and install Power BI Desktop](https://www.microsoft.com/power-platform/products/power-bi/desktop).

- Ensure you have the correct [permissions to access Azure Resource Graph](/azure/governance/resource-graph/overview#permissions-in-azure-resource-graph).

## Connect Power BI to Azure Resource Graph

Before you can connect Defender for Cloud's data to Power BI, you must first connect Power BI to Azure Resource Graph.

1. On your desktop open Power BI Desktop.

1. Select **Blank report**.

1. Select **Get data** > **more**.

    :::image type="content" source="media/add-data-power-bi/get-data-more.png" alt-text="Screenshot of the Power BI Desktop main screen that shows where the get data button is located and the more option." lightbox="media/add-data-power-bi/get-data-more.png":::

1. Search for and select **Azure Resource Graph**.

1. Select **Connect**.

## Query Defender for Cloud data in to Power BI

Once Power BI Desktop is connected to Azure Resource Graph, you can use Azure Resource Graph to query various data sources from Defender for Cloud into Power BI.

The queries provided on this page are examples that provide results. Azure Resource Graph allows you to query a wide range of data that you can create and customize to return results that suit your specific requirements. 

1. Copy and paste one of the provided queries into the query editor in Power BI Desktop.

    ### [Recommendations by risk](#tab/Recommendations-by-risk)
    
    This query retrieves security recommendations by risk from MDC, allowing you to analyze assessments and identify areas that need attention.
    
    ```kusto
    securityresources 
            | where type =~ "microsoft.security/assessments"
            | extend assessmentType = iff(type == "microsoft.security/assessments", tostring(properties.metadata.assessmentType), dynamic(null))
            | where (type == "microsoft.security/assessments" and (assessmentType in~ ("BuiltIn", "CustomerManaged")))
            | extend assessmentTypeSkimmed = iff(type == "microsoft.security/assessments", case(
                        tostring(properties.metadata.assessmentType) == "BuiltIn", "BuiltIn",
                        tostring(properties.metadata.assessmentType) == "BuiltInPolicy", "BuiltIn",
                        tostring(properties.metadata.assessmentType) == "CustomPolicy", "Custom",
                        tostring(properties.metadata.assessmentType) == "CustomerManaged", "Custom",
                        tostring(properties.metadata.assessmentType) == "ManualCustomPolicy", "Custom",
                        tostring(properties.metadata.assessmentType) == "ManualBuiltInPolicy", "BuiltIn",
                        dynamic(null)
                    ), dynamic(null))
            | extend assessmentId = tolower(id)
            | extend assessmentKey = iff(type == "microsoft.security/assessments", name, dynamic(null))
            | extend source = iff(type == "microsoft.security/assessments", trim(' ', tolower(tostring(properties.resourceDetails.Source))), dynamic(null))
            | extend statusCode = iff(type == "microsoft.security/assessments", tostring(properties.status.code), dynamic(null))
            | extend resourceId = iff(type == "microsoft.security/assessments", trim(" ", tolower(tostring(case(source =~ "azure", properties.resourceDetails.Id,
                (type == "microsoft.security/assessments" and (source =~ "aws" and isnotempty(tostring(properties.resourceDetails.ConnectorId)))), properties.resourceDetails.Id,
                (type == "microsoft.security/assessments" and (source =~ "gcp" and isnotempty(tostring(properties.resourceDetails.ConnectorId)))), properties.resourceDetails.Id,
                source =~ "aws", properties.resourceDetails.AzureResourceId,
                source =~ "gcp", properties.resourceDetails.AzureResourceId,
                extract("^(?i)(.+)/providers/Microsoft.Security/assessments/.+$",1,id)
                )))), dynamic(null))
            | extend resourceName = iff(type == "microsoft.security/assessments", tostring(coalesce(properties.resourceDetails.ResourceName, properties.additionalData.CloudNativeResourceName, properties.additionalData.ResourceName, properties.additionalData.resourceName, split(resourceId, '/')[-1], extract(@"(.+)/(.+)", 2, resourceId))), dynamic(null))
            | extend resourceType = iff(type == "microsoft.security/assessments", tolower(properties.resourceDetails.ResourceType), dynamic(null))
            | extend riskLevelText = iff(type == "microsoft.security/assessments", tostring(properties.risk.level), dynamic(null))
            | extend riskLevel = iff(type == "microsoft.security/assessments", case(riskLevelText =~ "Critical", 4,
                      riskLevelText =~ "High", 3,
                      riskLevelText =~ "Medium", 2,
                      riskLevelText =~ "Low", 1,
                      0), dynamic(null))
            | extend riskFactors = iff(type == "microsoft.security/assessments", iff(isnull(properties.risk.riskFactors), dynamic([]), properties.risk.riskFactors), dynamic(null))
            | extend attackPaths = array_length(iff(type == "microsoft.security/assessments", iff(isnull(properties.risk.attackPathsReferences), dynamic([]), properties.risk.attackPathsReferences), dynamic(null)))           
            | extend displayName = iff(type == "microsoft.security/assessments", tostring(properties.displayName), dynamic(null))
            | extend statusCause = iff(type == "microsoft.security/assessments", tostring(properties.status.cause), dynamic(null))
            | extend isExempt = iff(type == "microsoft.security/assessments", iff(statusCause == "Exempt", tobool(1), tobool(0)), dynamic(null))
            | extend statusChangeDate = tostring(iff(type == "microsoft.security/assessments", todatetime(properties.status.statusChangeDate), dynamic(null)))
            | project assessmentId,
                        statusChangeDate,
                        isExempt,
                        riskLevel,
                        riskFactors,
                        attackPaths,
                        statusCode,
                        displayName,
                        resourceId,               
                        assessmentKey,
                        resourceType,
                        resourceName,
                        assessmentTypeSkimmed               
                | join kind=leftouter (
                    securityresources
                    | where type == 'microsoft.security/assessments/governanceassignments'
                    | extend assignedResourceId = tolower(iff(type == "microsoft.security/assessments/governanceassignments", tostring(properties.assignedResourceId), dynamic(null)))
                    | extend dueDate = iff(type == "microsoft.security/assessments/governanceassignments", todatetime(properties.remediationDueDate), dynamic(null))
                    | extend owner = iff(type == "microsoft.security/assessments/governanceassignments", iff(isempty(tostring(properties.owner)), "unspecified", tostring(properties.owner)), dynamic(null))
                    | extend governanceStatus = iff(type == "microsoft.security/assessments/governanceassignments", case(
                                isnull(todatetime(properties.remediationDueDate)), "NoDueDate",
                                todatetime(properties.remediationDueDate) >= bin(now(), 1d), "OnTime",
                                "Overdue"
                            ), dynamic(null))
                    | project assignedResourceId, dueDate, owner, governanceStatus
                ) on $left.assessmentId == $right.assignedResourceId
                | extend completionStatusNumber = case(governanceStatus == "Overdue", 5,
                                                           governanceStatus == "OnTime", 4,
                                                           statusCode == "Unhealthy", 3, 
                                                           isExempt, 7,
                                                           1)
                    | extend completionStatus = case(completionStatusNumber == 5, "Overdue",
                                                     completionStatusNumber == 4, "OnTime",
                                                     completionStatusNumber == 3, "Unassigned",
                                                     completionStatusNumber == 7, "Exempted",
                                                     "Completed")
                | where completionStatus in~ ("OnTime","Overdue","Unassigned")
                | project-away assignedResourceId, governanceStatus, isExempt
                           | order by riskLevel desc, attackPaths desc, displayName
    ```
    ### [Attack Paths](#tab/attack-paths)
       
    Use this query to fetch attack path data, providing insights into potential attack vectors within your cloud environment.
    
    ```kusto
    securityresources
    | where type == "microsoft.security/attackpaths"
    | extend riskCategories = tostring(properties.riskCategories)
    | extend riskCategories = tostring(split(riskCategories, "[")[1])
    | extend riskCategories = tostring(split(riskCategories, "]")[0])
    | extend riskCategory = iff('{riskCategories}' == "All", riskCategories, '{riskCategories}')
    | where riskCategories has(riskCategory)
    | project apId = name, apTemplate = tostring(properties.displayName), riskCategories
    | summarize Path_Count = count() by Attack_Path = apTemplate, riskCategories
    | project Attack_Path, Path_Count, riskCategories
    ```
     
    ### [Secure Score](#tab/secure-score)
       
    This query retrieves secure score data, helping you understand your overall security posture and prioritize remediation efforts.
       
    ```Kusto
    securityresources 
    | where type == "microsoft.security/securescores" 
    | where name == "ascScore"
    | extend environment = tostring(properties.environment)
    | extend scopeMaxScore = toint(properties.score.max)
    | extend scopeWeight = toint(properties.weight)
    | extend scopeScorePerc = round(todouble(properties.score.percentage), 0)
    ```
       
    ### [Governance](#tab/governance)
    
    Use this query to get data on governance rules, enabling you to manage compliance and governance policies effectively.
    
    ```kusto
    securityresources         
    | where type == "microsoft.security/assessments"
    | where isnull(properties.resourceDetails.AwsResourceId) and isnull(properties.resourceDetails.GcpResourceId)
    | extend DisplayName = tostring(properties.displayName)
    | where isempty(DisplayName) == false
    | join kind=leftouter   (securityresources         
    | where type == "microsoft.security/assessments/governanceassignments"
    | extend  assignedResourceId = tostring(todynamic(properties).assignedResourceId)
    | extend remediationDueDate = todatetime(properties.remediationDueDate)
    | project id = assignedResourceId, governanceassignmentsProperties = todynamic(properties), remediationDueDate) on id
    | extend hasAssignment = isempty( governanceassignmentsProperties) == false and isnull( governanceassignmentsProperties) == false
    | extend assignmentStatus = iif(tostring(properties.status.code) == "Unhealthy",iif(hasAssignment == true, iif(bin(remediationDueDate, 1d) < bin(now(), 1d), "Overdue", "Ontime"), "Unassigned") , "Completed")
    | summarize count() by assignmentStatus
    ```
    
    ### [Compliance](#tab/compliance)
    
    This query retrieves compliance data from MDC, which is essential for maintaining and demonstrating adherence to various regulatory requirements.
    
    ```kusto
    securityresources
    | where type == "microsoft.security/regulatorycompliancestandards/regulatorycompliancecontrols/regulatorycomplianceassessments" | extend scope = properties.scope
    | where isempty(scope) or  scope in~("Subscription", "MultiCloudAggregation")
    | parse id with * "regulatoryComplianceStandards/" complianceStandardId "/regulatoryComplianceControls/" complianceControlId "/regulatoryComplianceAssessments" *
    | extend complianceStandardId = replace( "-", " ", complianceStandardId)
    | extend Status = properties.state
    ```
    ---

1. Select **Ok**.

    :::image type="content" source="media/add-data-power-bi/select-ok.png" alt-text="Screenshot that shows where to enter the Azure Resource Graph query and where the Ok button is located." lightbox="media/add-data-power-bi/select-ok.png":::

    > [!NOTE]
    > By default, Resource Graph limits any query to returning only 1000 records. This control protects both you and the service from unintentional queries that would result in large data sets. If you want query results not to be truncated by the 1000 records limit, set the value of the "Advanced Option - $resultTruncated (optional)" to FALSE.
    >
    > :::image type="content" source="media/add-data-power-bi/advanced-options-false.png" alt-text="Screenshot that shows where the advanced options are located and how to set it to false." lightbox="media/add-data-power-bi/advanced-options-false.png":::

1. Select **Load**.

With Azure Resource Graph, you have the flexibility to retrieve and analyze any data available within your Defender for Cloud environment, ensuring comprehensive and tailored insights. Once your data is added to Power BI, you can create visualizations and dashboards to monitor and manage your security posture effectively.

## Next step

> [!div class="nextstep"]
> [Learn how to create visualizations in Power BI](/power-bi/fundamentals/service-get-started)
