---
title: Ingest Data to Microsoft Sentinel Data Lake
description: Learn how to populate the Microsoft Sentinel data lake with sample ISV telemetry using KQL jobs so you can query and test security signals immediately.
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: smarapareddy
ms.date: 06/22/2026
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1012

#customer intent: As an ISV developer, I want to ingest telemetry data into the Microsoft Sentinel data lake so that I can query and analyze security signals in my agent.
---

# Ingest Data to Microsoft Sentinel Data Lake

Ingest sample IdentityDrift telemetry and supporting tables into the Sentinel data lake. You can query this data in the subsequent articles in this series.

This article is part of a series that walks you through ingesting test data to the data lake, [developing an agent](build-agent-security-copilot.md), and [publishing](publish-agent-to-security-store.md) the example *IdentityDrift* platform solution. The solution includes a Security Copilot agent that correlates identity, endpoint, and cloud security signals to automate threat investigations.

## Typical production approach for ISVs

ISVs should use the following approach to ingest data into Sentinel:

1. **Develop a Data Connector**
    - Create a Sentinel data connector using the [Sentinel Connector Builder Agent](/azure/sentinel/create-custom-connector-builder-agent) in VS Code with GitHub Copilot. This AI-assisted approach reduces development time from weeks to hours and uses natural language prompts to build polling configurations, data collection rules, connector definitions, and schemas.
    - For pull-based data sources, use [Codeless Connector Framework (CCF)](/azure/sentinel/create-codeless-connector).
    - For push-based data sources, use [CCF Push](/azure/sentinel/create-push-codeless-connector).
1. **Ingest data to data lake** Stream telemetry through the connector into Sentinel's data lake
1. **Use Sentinel platform** Use [Sentinel platform capabilities](https://www.microsoft.com/security/business/siem-and-xdr/microsoft-sentinel#Capabilities) for data exploration, Graph, MCP server, and Security Copilot agents.

**Alternative:** If a connector already exists for your data source, see the [Sentinel Data Connectors Reference](/azure/sentinel/data-connectors-reference) to enable it and start ingesting the data.

## Lab approach: Ingest sample data via KQL Jobs

Use **KQL Jobs** to populate data lake with sample records. This approach:

- **Mirrors the actual data schema** Sample data adheres to the same schema as connector‑ingested data, letting you populate the data lake and test agent logic immediately.
- **Represents realistic attack scenarios** Mock data reproduces the attack patterns and correlations you'd investigate in production.

### Prerequisites

- You must first onboard to the data lake. See the [Sentinel data lake Onboarding guide](sentinel-data-lake-onboarding.md).

### Required permissions

- You must have the  **Security Administrator** or **Security Operator** role.

### Create a KQL job

To create a new KQL job, follow these steps:

1. In the Defender portal, navigate to **Sentinel > Data lake exploration > Jobs**.
1. Select **Create job**, then  **Create a new KQL job** 

1. **Job name** - Enter a unique job name, for example *CommonSecurity_ID_logs*1
1. **Job Description** - Provide context and purpose of the job, for example *Generate logs for IdentityDrift vendor to ingest to CommonSecurity_ID_logs*1
1. **Select workspace** - Select the destination workspace
1. Under **"Create a new table"** and enter a table name, for example *CommonSecurity_ID*. Tables created by KQL jobs automatically have the suffix `_KQL_CL` appended.
1. Select **Next**
1. Copy the KQL query from the relevant [Data ingest KQL](#data-ingest-kql) tab into the query field.
   > [!TIP]
   > If the **Next** button is greyed out, you must choose a workspace using the **Selected Workspace** button.

1. Select **Next** to proceed to the scheduling page.

### Schedule the job

To set a run schedule for the job:

1. On the **Schedule the query job** page, select your execution option:
   - **Scheduled job** - Job runs on a schedule you specify and ingest sample data periodically.

Schedule Job option to have recurring records added to the table.

**For scheduled jobs:**

1. Select **Schedule** option
1. Enter the following details:
   - **Repeat frequency** - Select: By minute, Hourly, Daily, Weekly, or Monthly
   - **Repeat every** - How often the job runs based on selected frequency
   - **From date** - Select date and enter time for the job to start.
   - **To date** - Select when the schedule finishes. Select **Set job to run indefinitely** to continue without end date

### Review and submit

To review and submit the job:

1. Select **Next** to review job details.
1. Review all settings.
1. Select **Submit** to create the job.

### Data ingest KQL

To ingest data into the SigninLogs, AADRiskyUsers, CommonSecurity_ID_Logs, DeviceProcessEvents, and SecurityAlerts tables, repeat the steps to create a KQL job, using the KQL queries in each tab below.

### [AADRiskyUsers](#tab/aadriskyusers)

Use the following query in your KQL job to ingest sample risky user data into the AADRiskyUsers table in the Sentinel data lake.

```kql
datatable(
    TimeGenerated:datetime,
    CorrelationId:string,
    Id:string,
    IsDeleted:bool,
    IsProcessing:bool,
    OperationName:string,
    RiskDetail:string,
    RiskLastUpdatedDateTime:datetime,
    RiskLevel:string,
    RiskState:string,
    UserDisplayName:string,
    UserPrincipalName:string
)
[
    datetime(2026-03-05T14:22:00Z), "riskcorr-identity-047", "a7d2f8c1-4e2b-48f3-9a06-2e5c7b3d9f1a", false, false, "RiskyUserDetected", "adminConfirmedUserCompromised", datetime(2026-02-28T10:15:00Z), "high", "confirmedCompromised", "U1291", "u1291@contoso.onmicrosoft.com",
    datetime(2026-03-05T15:18:00Z), "riskcorr-identity-052", "b9e4a6d2-7f3c-41b8-a2e5-3f6c8d1e2b4a", false, false, "RiskyUserUpdated",  "anonymousIpAddress",             datetime(2026-02-27T14:42:00Z), "medium", "atRisk",              "U3415", "u3415@contoso.onmicrosoft.com",
    datetime(2026-03-05T16:33:00Z), "riskcorr-identity-059", "c5f1b7e3-9d4a-42c1-b8f6-5e7d9c2a3f5b", false, false, "RiskyUserUpdated",  "userPerformedSecuredPasswordReset", datetime(2026-02-26T11:20:00Z), "medium", "remediated",          "U2847",   "u2847@contoso.onmicrosoft.com",
];
```

### [CommonSecurity_ID_Logs](#tab/commonsecurityidlogs)

Use the following query in your KQL job to ingest sample identity drift logs into the CommonSecurity_ID_Logs table in the Sentinel data lake.

```kql
datatable(
    TimeGenerated: datetime,
    SourceUserName: string,
    SourceIP: string,
    DestinationHostName: string,
    DeviceCustomString1: string,
    DeviceCustomString1Label: string,
    AdditionalExtensions: string
)
[
    // u1291 – MFA-approved privileged access to AKS
    datetime(2026-03-05T09:20:48Z),
    "u1291@contoso.onmicrosoft.com",
    "185.92.44.17",
    "prod-aks-eastus",
    "MFA Approved",
    "Authentication Status",
    "User accessed Kubernetes cluster with ClusterAdmin role",
    // u1291 – privilege escalation detected
    datetime(2026-03-05T09:22:36Z),
    "u1291@contoso.onmicrosoft.com",
    "185.92.44.17",
    "prod-aks-eastus",
    "Privilege Escalation",
    "Authentication Status",
    "RoleBinding created granting cluster-admin privileges",
    // u2847 – sensitive workload interaction
    datetime(2026-03-05T11:50:14Z),
    "u2847@contoso.onmicrosoft.com",
    "185.92.44.17",
    "prod-aks-eastus",
    "Sensitive Access",
    "Authentication Status", 	
    "kubectl exec executed on workload with known ingress vulnerability",
    // u3415 – service-level access to backup storage
    datetime(2026-03-05T10:45:02Z),
    "u3415@contoso.onmicrosoft.com",
    "10.10.5.24",
    "stgprodbackup01",
    "Access Allowed",
    "Authentication Status",
    "Service account accessed production backup storage"
]
```

### [DeviceProcessEvents](#tab/deviceprocessevents)

Use the following query in your KQL job to ingest sample device process events into the DeviceProcessEvents table in the Sentinel data lake.

```kql    
datatable(
    TimeGenerated:datetime,
    DeviceName:string,
    DeviceId:string,
    ActionType:string,
    FileName:string,
    FolderPath:string,
    ProcessId:long,
    ProcessCommandLine:string,
    ProcessIntegrityLevel:string,
    AccountName:string,
    AccountDomain:string,
    InitiatingProcessFileName:string,
    InitiatingProcessCommandLine:string,
    InitiatingProcessAccountName:string,
    InitiatingProcessAccountDomain:string
)
[
    // Record 1 – Azure CLI authentication and subscription context
    datetime(2026-03-05T09:23:15.445Z),
    "WIN-DESKTOP-CONTOSO-401",
    "d7e2f9c3a5b1e8d4c6f2",
    "ProcessCreated",
    "az.exe",
    @"C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\wbin\",
    4156,
    "az login",
    "Medium",
    "u1291",
    "contoso.onmicrosoft.com",
    "powershell.exe",
    "powershell.exe -Command az login",
    "u1291",
    "contoso.onmicrosoft.com",
    // Record 2 – AKS credential retrieval (kubectl context setup)
    datetime(2026-03-05T10:47:22.831Z),
    "WIN-DESKTOP-CONTOSO-502",
    "c3a4b8d2e7f1a5c9e6d4",
    "ProcessCreated",
    "az.exe",
    @"C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\wbin\",
    5843,
    "az aks get-credentials --resource-group rg-prod --name prod-aks-eastus",
    "Medium",
    "u3415",
    "contoso.onmicrosoft.com",
    "cmd.exe",
    "cmd.exe /c az aks get-credentials --resource-group rg-prod --name prod-aks-eastus",
    "u3415",
    "contoso.onmicrosoft.com",
    // Record 3 – Kubernetes workload inspection
    datetime(2026-03-05T11:52:09.567Z),
    "WIN-DESKTOP-CONTOSO-603",
    "b9c1d5e8f2a4c6d9e1f3",
    "ProcessCreated",
    "kubectl.exe",
    @"C:\Program Files\Kubernetes\",
    6521,
    "kubectl get pods -A",
    "High",
    "u2847",
    "contoso.onmicrosoft.com",
    "explorer.exe",
    "explorer.exe",
    "u2847",
    "contoso.onmicrosoft.com"
]
```

### [SecurityAlerts](#tab/securityalerts)

Use the following query in your KQL job to ingest sample security alerts into the SecurityAlerts table in the Sentinel data lake.

```kql
datatable(
    TimeGenerated: datetime,
    DisplayName: string,
    AlertName: string,
    AlertSeverity: string,
    Description: string,
    ProviderName: string,
    VendorName: string,
    AlertType: string,
    ConfidenceLevel: string,
    IsIncident: bool,
    CompromisedEntity: string,
    ExtendedProperties: dynamic,
    Entities: dynamic,
    ProductName: string
)
[
    // AKS – malware execution blocked after privilege escalation activity
    datetime(2026-03-05T09:24:10Z),
    "Microsoft Defender for Cloud Kubernetes malware execution blocked",
    "Kubernetes malware execution blocked on node",
    "High",
    "Malware execution was detected and blocked on a Kubernetes node. The activity occurred shortly after privileged access and RBAC changes were performed on the cluster, increasing confidence of malicious intent.",
    "Azure Security Center",
    "Microsoft",
    "K8S.NODE_MalwareBlocked",
    "High",
    true,
    "prod-aks-eastus",
    dynamic({
        "ClusterName": "prod-aks-eastus",
        "Namespace": "prod",
        "NodeRole": "Worker",
        "DetectionSource": "microsoftDefenderForContainers",
        "SuspiciousActivity": "Malware execution in container runtime",
        "RelatedContext": "Recent ClusterAdmin access and RoleBinding creation detected"
    }),
    dynamic([
        {
            "Type": "KubernetesCluster",
            "Name": "prod-aks-eastus",
            "CloudPlatform": "Azure"
        },
        {
            "Type": "Host",
            "HostName": "prod-aks-eastus"
        }
    ]),
    "Azure Security Center",
    // AKS – binary drift blocked on vulnerable workload
    datetime(2026-03-05T11:51:58Z),
    "Microsoft Defender for Cloud Kubernetes binary drift blocked",
    "Kubernetes workload binary drift blocked",
    "Medium",
    "Execution of a workload binary that drifted from the original container image was detected and blocked. The affected workload resides in a production Kubernetes cluster and is associated with a workload previously accessed via kubectl exec.",
    "Azure Security Center",
    "Microsoft",
    "K8S.NODE_DriftBlocked",
    "Medium",
    true,
    "prod-aks-eastus",
    dynamic({
        "ClusterName": "prod-aks-eastus",
        "Namespace": "prod",
        "Workload": "ingress-controller",
        "DriftType": "Binary drift from image baseline",
        "DetectionSource": "microsoftDefenderForContainers"
    }),
    dynamic([
        {
            "Type": "KubernetesCluster",
            "Name": "prod-aks-eastus",
            "CloudPlatform": "Azure"
        },
        {
            "Type": "Host",
            "HostName": "prod-aks-eastus"
        }
    ]),
    "Azure Security Center"
];
```

### [SigninLogs](#tab/signinlogs)

Use the following query in your KQL job to ingest sample sign-in logs into the SigninLogs table in the Sentinel data lake.


```kql
datatable(
    TimeGenerated: datetime,
    UserPrincipalName: string,
    UserId: string,
    AppDisplayName: string,
    ClientAppUsed: string,
    AuthenticationRequirement: string,
    ConditionalAccessStatus: string,
    RiskLevelAggregated: string,
    RiskState: string,
    RiskDetail: string,
    Location: dynamic,
    IPAddress: string,
    DeviceDetail: dynamic,
    Status: dynamic
)
[
    // Normal sign-in from known device and location (baseline)
    datetime(2026-03-08T14:10:00Z),
    "u1291@contoso.onmicrosoft.com",
    "9214593d-65f8-43fd-c4a5-f80aty691141",
    "Microsoft Teams",
    "Browser",
    "singleFactorAuthentication",
    "success",
    "low",
    "none",
    "noRiskDetected",
    dynamic({"countryOrRegion":"US","state":"Texas","city":"Dallas"}),
    "20.81.45.10",
    dynamic({"deviceId":"device-jm-001","operatingSystem":"Windows 11","browser":"Edge","isCompliant":true,"isManaged":true}),
    dynamic({"errorCode":0,"failureReason":"None"}),
    // Identity drift: new device and new geographic location
    datetime(2026-03-08T14:18:00Z),
    "u1291@contoso.onmicrosoft.com",
    "9214593d-65f8-43fd-c4a5-f80aty691141",
    "Azure Portal",
    "Browser",
    "multiFactorAuthentication",
    "success",
    "medium",
    "atRisk",
    "newDevice",
    dynamic({"countryOrRegion":"Germany","state":"Berlin","city":"Berlin"}),
    "91.198.174.22",
    dynamic({"deviceId":"unknown","operatingSystem":"Linux","browser":"Chrome","isCompliant":false,"isManaged":false}),
    dynamic({"errorCode":0,"failureReason":"MFA required due to unfamiliar sign-in"}),
    // Identity drift: impossible travel detected
    datetime(2026-03-08T14:21:00Z),
    "u3415@contoso.onmicrosoft.com",
    "8214593d-75e8-4efd-c4a5-f80aty691131",
    "Microsoft 365",
    "Browser",
    "multiFactorAuthentication",
    "success",
    "high",
    "confirmedCompromised",
    "impossibleTravel",
    dynamic({"countryOrRegion":"China","state":"Beijing","city":"Beijing"}),
    "101.226.4.6",
    dynamic({"deviceId":"unknown","operatingSystem":"macOS","browser":"Safari","isCompliant":false,"isManaged":false}),
    dynamic({"errorCode":0,"failureReason":"Impossible travel detected"}),
    // Identity drift: sign-in blocked by Conditional Access
    datetime(2026-03-08T14:25:00Z),
    "u1291@contoso.onmicrosoft.com",
    "3214593d-65f8-53fd-c4a5-c80aty691441",
    "Azure DevOps",
    "Browser",
    "singleFactorAuthentication",
    "failure",
    "high",
    "atRisk",
    "anomalousToken",
    dynamic({"countryOrRegion":"Russia","state":"Moscow","city":"Moscow"}),
    "185.199.108.153",
    dynamic({"deviceId":"unknown","operatingSystem":"Windows 10","browser":"Firefox","isCompliant":false,"isManaged":false}),
    dynamic({"errorCode":53003,"failureReason":"Access blocked by Conditional Access policy"})
];
```

---

## Next steps

Your data lake is now populated with sample telemetry from IdentityDrift, Microsoft Entra ID, and Microsoft Defender. Use this data to test and develop your Security Copilot agent.
See [Use an MCP tool in Visual Studio Code](../datalake/sentinel-mcp-use-tool-visual-studio-code.md) to explore [Sentinel MCP Server tools](../datalake/sentinel-mcp-tools-overview.md#available-collections) and query the data using prompts. 

Before proceeding to building Security Copilot Agent for IdentityDrift use case, explore the MCP server with the following prompts to query the sample data ingested in this step to learn how to query the data from Sentinel data lake using Sentinel MCP. 

Sample prompts for Sentinel MCP via VS Code Chat:

- Search for tables related to "identity" or "signin" in my workspace.
- Show me process execution events for user u1291 in DeviceProcessEvents_KQL_CL — what commands did they run?
- Correlate activity for u1291@contoso.onmicrosoft.com: check their sign-in risk in SigninLogs_KQL_CL, their access in CommonSecurity_ID_KQL_CL, and any process execution in DeviceProcessEvents_KQL_CL. Summarize the attack chain.

> [!div class="nextstepaction"]
> Continue to [Build a Security Copilot agent](build-agent-security-copilot.md) 
