---
title: Create custom detection rules in Microsoft Defender XDR
description: Learn how to create custom detections rules based on advanced hunting queries.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - m365initiative-m365-defender
  - tier2
ms.custom:
  - sfi-ga-nochange
  - cx-ti
  - cx-ah
  - sfi-image-nochange
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Defender for Endpoint Plan 2
ms.topic: how-to
ms.date: 04/16/2026
---

# Create custom detection rules

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Custom detection rules are rules you design and tweak by using [advanced hunting](advanced-hunting-overview.md) queries. By using these rules, you can proactively monitor various events and system states, including suspected breach activity and misconfigured endpoints. You can set them to run at regular intervals, generating alerts and taking response actions whenever there are matches.

## Required permissions for managing custom detections

To manage custom detections, you need roles that let you manage the data that these detections target. For example, to manage custom detections on multiple data sources (Microsoft Defender XDR and Microsoft Sentinel, or multiple Defender workloads), you need all the applicable Defender XDR and Sentinel roles. For more information, see the following sections.

### Microsoft Defender XDR
To manage custom detections on Microsoft Defender XDR data, you need to be assigned one of these roles:

- **Security settings (manage)** - Users with this [Microsoft Defender XDR permission](manage-rbac.md) can manage security settings in the Microsoft Defender portal.

- **Security Administrator** - Users with this [Microsoft Entra role](/azure/active-directory/roles/permissions-reference#security-administrator) can manage security settings in the Microsoft Defender portal and other portals and services.

- **Security Operator** - Users with this [Microsoft Entra role](/azure/active-directory/roles/permissions-reference#security-operator) can manage alerts and have global read-only access to security-related features, including all information in the Microsoft Defender portal. This role is sufficient for managing custom detections only if role-based access control (RBAC) is turned off in Microsoft Defender for Endpoint. If you have RBAC configured, you also need the **Manage Security Settings** permission for Defender for Endpoint.

You can manage custom detections that apply to data from specific Defender XDR solutions if you have the right permissions for them. For example, if you only have manage permissions for Microsoft Defender for Office 365, you can create custom detections using `Email*` tables but not `Identity*` tables.

Likewise, since the `IdentityLogonEvents` table holds authentication activity information from both Microsoft Defender for Cloud Apps and Defender for Identity, you need to have manage permissions for both services to manage custom detections querying that table.

> [!NOTE]
> To manage custom detections, Security Operators must have the Manage Security Settings permission in Microsoft Defender for Endpoint if RBAC is turned on.

### Microsoft Sentinel

To manage custom detections on Microsoft Sentinel data, you need to be assigned the **Microsoft Sentinel Contributor** role or higher. Users with this [Azure role](/azure/role-based-access-control/built-in-roles/security#microsoft-sentinel-contributor) can manage Microsoft Sentinel SIEM workspace data, including alerts and detections. You can assign this role on a specific primary workspace, Azure resource group, or an entire subscription.

### Manage required permissions

To manage required permissions, a Global Administrator can:

- Assign the Security Administrator or Security Operator role in [Microsoft 365 admin center](https://admin.microsoft.com/) under **Roles** > **Security Administrator**.
- Check RBAC settings for Microsoft Defender for Endpoint in [Microsoft Defender XDR](https://security.microsoft.com/) under **Settings** > **Permissions** > **Roles**. Select the corresponding role to assign the **manage security settings** permission.

> [!IMPORTANT]
> Use roles with the fewest permissions to help improve security for your organization. Global Administrator is a highly privileged role. Limit its use to emergency scenarios when you can't use an existing role.

> [!NOTE]
> A user also needs the appropriate permissions for the devices in the [device scope](#5-set-the-rule-scope) of a custom detection rule that they're creating or editing. A user can't edit a custom detection rule that is scoped to run on all devices if the user doesn't have permissions for all devices. 

## Create a custom detection rule

To create a custom detection rule, follow these steps:

1. [Prepare the query](#1-prepare-the-query)
1. [Create new rule and provide alert details](#2-create-new-rule-and-provide-alert-details)
1. [Define alert enrichment details](#3-define-alert-enrichment-details)
1. [Specify actions](#4-specify-actions)
1. [Set the rule scope](#5-set-the-rule-scope)
1. [Review and turn on the rule](#6-review-and-turn-on-the-rule)

### 1. Prepare the query

In the Microsoft Defender portal, go to **Advanced hunting** and select an existing query or create a new query. When you use a new query, run the query to identify errors and understand possible results.

> [!IMPORTANT]
> To prevent the service from returning too many alerts, each rule can generate only 150 alerts each time it runs. Before creating a rule, tweak your query to avoid alerting for normal, day-to-day activity.

#### Required columns in the query results


To create a custom detection rule by using Defender XDR data, the query must return the following columns:
1. `Timestamp` or `TimeGenerated` - This column sets the timestamp for generated alerts. The query shouldn't manipulate this column and should return it exactly as it appears in the raw event.
   
3. **For detections based on XDR tables**, a column or combination of columns that uniquely identify the event in these tables:
      - For Microsoft Defender for Endpoint tables, the `Timestamp`, `DeviceId`, and `ReportId` columns must appear in the same event
      - For Alert* tables, `Timestamp` must appear in the event
      - For Observation* tables, `Timestamp` and `ObservationId` must appear in the same event
      - For all others, `Timestamp` and `ReportId` must appear in the same event
4. A column that contains a strong identifier for an impacted asset. To map an impacted asset automatically in the wizard, project one of the following columns that contain a strong identifier for an impacted asset:
      - `DeviceId`
      - `DeviceName`
      - `RemoteDeviceName`
      - `RecipientEmailAddress`
      - `SenderFromAddress` (envelope sender or Return-Path address)
      - `SenderMailFromAddress` (sender address displayed by email client)
      - `SenderObjectId`
      - `RecipientObjectId`
      - `AccountObjectId`
      - `AccountSid`
      - `AccountUpn`
      - `InitiatingProcessAccountSid`
      - `InitiatingProcessAccountUpn`
      - `InitiatingProcessAccountObjectId`

> [!NOTE]
> Support for more entities will be added as new tables are added to the [advanced hunting schema](advanced-hunting-schema-tables.md).



Simple queries, such as those that don't use the `project` or `summarize` operator to customize or aggregate results, typically return these common columns.

There are various ways to ensure more complex queries return these columns. For example, if you prefer to aggregate and count by entity under a column such as `DeviceId`, you can still return `Timestamp` and `ReportId` by getting them from the most recent event involving each unique `DeviceId`.

> [!IMPORTANT]
> Avoid filtering custom detections by using the `Timestamp` column. The service prefilters data for custom detections based on the detection frequency.

The following sample query counts the number of unique devices (`DeviceId`) with antivirus detections and uses this count to find only the devices with more than five detections. To return the latest `Timestamp` and the corresponding `ReportId`, it uses the `summarize` operator with the `arg_max` function.

```kusto
DeviceEvents
| where ingestion_time() > ago(1d)
| where ActionType == "AntivirusDetection"
| summarize (Timestamp, ReportId)=arg_max(Timestamp, ReportId), count() by DeviceId
| where count_ > 5
```

> [!TIP]
> For better query performance, set a time filter that matches your intended run frequency for the rule. Since the least frequent run is _every 24 hours_, filtering for the past day covers all new data.

#### Custom column for Microsoft Sentinel scoping

If you configured [Microsoft Sentinel scoping](/azure/sentinel/scoping), the `SentinelScope_CF` custom field is available for use in queries and detection rules to reference scope in your analytics.

When you create custom detections and analytics rules, you must project the `SentinelScope_CF` column in your queries to make the triggered alerts visible to scoped analysts. If you don't project this column, alerts are unscoped and hidden from scoped users.

### 2. Create new rule and provide alert details

In the query editor, select **Create detection rule** and specify the following alert details:

- **Detection name** - Name of the detection rule; make it unique.
- **Frequency** - Interval for running the query and taking action. [See more guidance in the rule frequency section](#rule-frequency).
- **Lookback** - The time period covered by the query when the custom detection targets data from Microsoft Sentinel only. [See more guidance in the lookback section](#lookback). 
- **Alert title** - Title displayed with alerts triggered by the rule; make it unique and use plaintext. Strings are sanitized for security purposes, so HTML, Markdown, and other code don't work. Any URLs included in the title should follow the [percent-encoding format](https://en.m.wikipedia.org/wiki/Percent-encoding) for them to display properly.
- **Severity** - Potential risk of the component or activity identified by the rule.
- **Category** - Threat component or activity identified by the rule.
- **MITRE ATT&CK techniques** - One or more attack techniques identified by the rule as documented in the [MITRE ATT&CK framework](https://attack.mitre.org/). This section is hidden for certain alert categories, including malware, ransomware, suspicious activity, and unwanted software.
- **Threat analytics report** - Link the generated alert to an existing threat analytics report so that it appears in the [Related incidents](threat-analytics.md#set-up-custom-detections-and-link-them-to-threat-analytics-reports) tab in threat analytics.
- **Description** - More information about the component or activity identified by the rule. Strings are sanitized for security purposes, so HTML, Markdown, and other code don't work. Any URLs included in the description should follow the percent-encoding format for them to display properly.
- **Recommended actions** - Additional actions that responders might take in response to an alert.


#### Rule frequency

When you save a new rule, it runs and checks for matches from the past 30 days of data. The rule then runs again at fixed intervals, applying a [lookback period](#lookback) based on the frequency you choose:

- **Every 24 hours**
- **Every 12 hours**
- **Every 3 hours**
- **Every hour**
- **Continuous (NRT)** - Runs continuously, checking data from events as they're collected and processed in near real-time (NRT). For more information, see [Continuous (NRT) frequency](custom-detection-rules.md#continuous-nrt-frequency).
- **Custom** - Runs according to the frequency you selected. This option is available if the rule is based only on data that is ingested to Microsoft Sentinel. For more information, see [Custom frequency for Microsoft Sentinel data](#custom-frequency-for-microsoft-sentinel-data).

> [!TIP]
> Match the time filters in your query with the lookback period. Results outside of the lookback period are ignored.

When you edit a rule, the next run time scheduled according to the frequency you set applies the changes. The rule frequency is based on the event timestamp and not the ingestion time. Small delays might occur in specific runs, so the configured frequency isn't 100% accurate.


##### Continuous (NRT) frequency

Setting a custom detection to run in Continuous (NRT) frequency increases your organization's ability to identify threats faster. Using the Continuous (NRT) frequency has minimal to no impact on your resource usage. Consider using it for any qualified custom detection rule in your organization.

From the custom detection rules page, you can migrate custom detections rules that fit the Continuous (NRT) frequency by selecting **Migrate now**:

:::image type="content" source="media/custom-detection-rules/custom-detection-migrate-now.png" alt-text="Screenshot of the Migrate now button in advanced hunting." lightbox="media/custom-detection-rules/custom-detection-migrate-now.png":::


When you select **Migrate now**, you see a list of all compatible rules according to their KQL query. You can choose to migrate all or selected rules only:

:::image type="content" source="media/custom-detection-rules/custom-detection-compatible-queries.png" alt-text="Screenshot of the continuous frequency compatible queries in advanced hunting." lightbox="media/custom-detection-rules/custom-detection-compatible-queries.png":::

When you select **Save**, the selected rules' frequency is updated to Continuous (NRT) frequency.

###### Queries you can run continuously

You can run a query continuously as long as:

- The query references one table only.
- The query uses an operator from the list of **[Supported KQL features](/azure/azure-monitor/essentials/data-collection-transformations-structure#supported-kql-features)**. For the `matches regex` operator, regular expressions must be encoded as string literals and follow the string quoting rules. For example, the regular expression `\A` is represented in KQL as `"\\A"`. The extra backslash indicates that the other backslash is part of the regular expression `\A`.
- The query doesn't use joins, unions, or the `externaldata` operator.
- The query doesn't include any comments line or information.

###### Tables that support Continuous (NRT) frequency

Near real-time detections support the following tables:

|Microsoft Defender XDR| Microsoft Sentinel|
|----------------------|-------------------|
|<ul><li>`AlertEvidence`<li>`CloudAppEvents`<li>`DeviceEvents`<li>`DeviceFileCertificateInfo`<li>`DeviceFileEvents`<li>`DeviceImageLoadEvents`<li>`DeviceLogonEvents`<li>`DeviceNetworkEvents`<li>`DeviceNetworkInfo`<li>`DeviceInfo`<li>`DeviceProcessEvents`<li>`DeviceRegistryEvents`<li>`EmailAttachmentInfo`<li>`EmailEvents` (except `LatestDeliveryLocation` and `LatestDeliveryAction` columns)<li>`EmailPostDeliveryEvents`<li>`EmailUrlInfo`<li>`IdentityDirectoryEvents`<li>`IdentityLogonEvents`<li>`IdentityQueryEvents`<li>`UrlClickEvents`</ul>| <ul><li>`ABAPAuditLog_C`<li>`ABAPChangeDocsLog_CL`<li>`AuditLogs`<li>`AWSCloudTrail`<li>`AWSGuardDuty`<li>`AzureActivity`<li>`CommonSecurityLog`<li>`GCPAuditLogs`<li>`MicrosoftGraphActivityLogs`<li>`OfficeActivity`<li>`Okta_CL`<li>`OktaV2_CL`<li>`ProofpointPOD`<li>`ProofPointTAPClicksPermitted_CL`<li>`ProofPointTAPMessagesDelivered_CL`<li>`SecurityAlert`<li>`SecurityEvent`<li>`SigninLogs`</ul> 

> [!NOTE]
> Only generally available columns support **Continuous (NRT)** frequency.

###### Custom frequency for Microsoft Sentinel data

Microsoft Sentinel customers who onboard to Microsoft Defender can select **Custom** frequency when the rule is based only on data that Microsoft Sentinel ingests. 

When you select this frequency option, the **Run query every input** component appears. Type the desired frequency for the rule and use the dropdown to select the units: minutes, hours, or days. The supported range is any value from 5 minutes to 14 days. 

:::image type="content" source="media/custom-detection-rules/ah-custom-frequency.png" alt-text="Screenshot that shows the Custom frequency option in the Custom detections setup guide." lightbox="media/custom-detection-rules/ah-custom-frequency.png":::

> [!IMPORTANT]
>When you select a custom frequency, Defender fetches your data from Microsoft Sentinel. This condition means that: 
>1.	You must have data available in Microsoft Sentinel.
>1.	Defender XDR data doesn't support scoping, since Microsoft Sentinel doesn't support scoping.

#### Lookback

The lookback period of your custom detections can range from five minutes to 30 days, depending on the target data and frequency of your query.

If your custom detections include Defender XDR data, a fixed lookback period is applied depending on the rule frequency that you choose:
- For detections set to run **every 24 hours**, the lookback period is **30 days**.
- For detections set to run **every 12 hours**, the lookback period is **48 hours**.
- For detections set to run **every three hours**, the lookback period is **12 hours**.
- For detections set to run **hourly**, the lookback period is **four hours**.

If your custom detections target Microsoft Sentinel data only, you can customize the lookback period depending on the rule frequency that you set: 
- For detections set to run in frequencies **higher (more frequent) than one hour**, the lookback period is limited to **less than 48 hours**. 
- For detections set to run in frequencies **higher than one day**, the lookback can be set **up to 14 days**. 
- For detections set to run in frequencies of **one day or less**, the lookback can be set **up to 30 days**.  

> [!IMPORTANT]
> Custom detections evaluate `ingestion_time()` to account for ingestion delays. Because of this condition, events with `Timestamp` or `TimeGenerated` values older than the configured lookback period might still be included in the rule evaluation.
> 
> When the lookback period is longer than the frequency, duplicate events might occur. However, custom detections [group and deduplicate them automatically](#how-custom-detections-handle-duplicate-alerts) to reduce alert noise and fatigue.


### 3. Define alert enrichment details 
You can enrich alerts by providing and defining more details. When you enrich alerts, you can:
-	[Create a dynamic alert title and description](#create-a-dynamic-alert-title-and-description)
-	[Add custom details](#add-custom-details) to display in the alert side panel 
-	[Link entities](#link-entities)

#### Create a dynamic alert title and description
You can dynamically craft your alert’s title and description by using the results of your query to make them accurate and indicative. This feature can boost SOC analysts’ efficiency when triaging alerts and incidents, and when trying to quickly understand the essence of an alert.  

To dynamically configure the alert’s title or description, integrate them into the **Alert details** section by using the free text names of columns that are available in your query results and surrounding them with double curly brackets. 

For example: `User {{AccountName}} unexpectedly signed in from {{Location}}`

>[!NOTE]
>You can reference up to three columns in each field.

:::image type="content" source="media/custom-detection-rules/ah-dynamic-alert.png" alt-text="Screenshot that shows the dynamic alert title and description fields in the Custom detections wizard." lightbox="media/custom-detection-rules/ah-dynamic-alert.png":::

To help you decide on the exact column names you want to reference, select **Explore query and results**. This selection opens the Advanced hunting context pane on top of the rule creation wizard, where you can examine your query logic and its results. 

#### Add custom details

You can further enhance your SOC analysts’ productivity by showing important details in the alert side panel. You can surface events’ data in alerts that are constructed from those events. This feature gives your SOC analysts immediate event content visibility of their incidents, enabling them to triage, investigate, and draw conclusions faster. 

In the **Custom details** section, add key-value pairs corresponding to the details you want to surface: 
- In the **Key** field, enter a name of your choosing that appears as the field name in alerts. 
- In the **Parameter** field, choose the event parameter you wish to surface in the alerts from the dropdown list. This list is populated by values corresponding to the column names that your KQL query outputs. 
  
:::image type="content" source="media/custom-detection-rules/ah-custom-details.png" alt-text="Screenshot that shows the Custom details option in the Custom detections wizard." lightbox="media/custom-detection-rules/ah-custom-details.png":::

The following screenshot shows how the custom details surface in the alert side panel: 

:::image type="content" source="media/custom-detection-rules/ah-custom-details-panel.png" alt-text="Screenshot that shows the custom details as they appear in the alert side panel of the Defender portal." lightbox="media/custom-detection-rules/ah-custom-details-panel.png":::

>[!IMPORTANT]
>Custom details have the following limitations: 
>1.	Each rule is limited to up to 20 key-value pairs of custom details. 
>2.	The combined size limit for all custom details and their values in a single alert is 4 KB. If the custom details array exceeds this limit, the whole custom details array is dropped from the alert.  

#### Link entities

Identify the columns in your query results where you expect to find the main affected or impacted entity. For example, a query might return sender (`SenderFromAddress` or `SenderMailFromAddress`) and recipient (`RecipientEmailAddress`) addresses. Identifying which of these columns represent the main impacted entity helps the service aggregate relevant alerts, correlate incidents, and target response actions.

You can select only one column for each entity type (mailbox, user, or device). You can't select columns that aren't returned by your query.

##### Expanded entity mapping

You can link a wide range of entity types to your alerts. Linking more entities helps the correlation engine group alerts to the same incidents and to correlate incidents together. If you're a Microsoft Sentinel customer, this also means that you can map any entity from your third-party data sources that are ingested into Microsoft Sentinel.

For Microsoft Defender XDR data, the entities are automatically selected. If the data is from Microsoft Sentinel, you need to select the entities manually. 

>[!NOTE]
>Entities impact how alerts are grouped into incidents. Make sure to carefully review the entities to ensure high quality of incidents. For more information, see [Alert correlation and incident merging in the Microsoft Defender portal](alerts-incidents-correlation.md). 

The expanded **Entity mapping** section has two sections where you can select entities: 
-	**Impacted assets** – Add impacted assets that appear in the selected events. You can add the following types of assets: 
    - Account 
    - Device 
    - Mailbox 
    - Cloud application 
    - Azure resource 
    - Amazon Web Services resource 
    - Google Cloud Platform resource 
- **Related evidence** – Add nonassets that appear in the selected events. The supported entity types are: 
    - Process 
    - File 
    - Registry value 
    - IP 
    - OAuth application 
    - DNS 
    - Security group 
    - URL 
    - Mail cluster 
    - Mail message

>[!NOTE] 
>You can currently map only assets as impacted entities.

:::image type="content" source="media/custom-detection-rules/ah-link-entities.png" alt-text="Screenshot that shows the entity mapping options in the Custom detections wizard." lightbox="media/custom-detection-rules/ah-link-entities.png":::

After you select an entity type, select an identifier type that exists in the selected query results so you can use it to identify this entity. Each entity type has a list of supported identifiers, as shown in the relevant dropdown menu. To better understand each identifier, read the description displayed when you hover over it. 

After selecting the identifier, select a column from the query results that contains the selected identifier. Select **Explore query and results** to open the advanced hunting context panel. This option allows you to explore your query and results to make sure you choose the right column for the selected identifier.


### 4. Specify actions

If your custom detection rule uses Defender XDR data, it can automatically take actions on devices, files, users, or emails that the query returns.

:::image type="content" source="media/custom-detection-rules/ah-custom-actions.png" alt-text="Screenshot that shows actions for custom detections in the Microsoft Defender portal." lightbox="media/custom-detection-rules/ah-custom-actions.png":::

#### Actions on devices

Apply these actions to devices in the `DeviceId` column of the query results:

- **Isolate device** - Uses Microsoft Defender for Endpoint to apply full network isolation, preventing the device from connecting to any application or service. [Learn more about Microsoft Defender for Endpoint machine isolation](/windows/security/threat-protection/microsoft-defender-atp/respond-machine-alerts#isolate-devices-from-the-network).
- **Collect investigation package** - Collects device information in a ZIP file. [Learn more about the Microsoft Defender for Endpoint investigation package](/windows/security/threat-protection/microsoft-defender-atp/respond-machine-alerts#collect-investigation-package-from-devices).
- **Run antivirus scan** - Performs a full Microsoft Defender Antivirus scan on the device.
- **Initiate investigation** - Initiates an [automated investigation](m365d-autoir.md) on the device.
- **Restrict app execution** - Sets restrictions on device to allow only files that are signed with a Microsoft-issued certificate to run. [Learn more about app restrictions with Microsoft Defender for Endpoint](/defender-endpoint/respond-machine-alerts#restrict-app-execution).

#### Actions on files

- When selected, the **Allow/Block** action can be applied to the file. Blocking files is only allowed if you have *Remediate* permissions for files and if the query results identify a file ID, such as a SHA-1 hash. Once a file is blocked, other instances of the same file on all devices are also blocked. You can control which device group the blocking applies to, but not specific devices.

- When selected, the **Quarantine file** action can be applied to files in the `SHA1`, `InitiatingProcessSHA1`, `SHA256`, or `InitiatingProcessSHA256` column of the query results. This action deletes the file from its current location and places a copy in quarantine.

#### Actions on users

- When selected, the **Mark user as compromised** action takes on users in the `AccountObjectId`, `InitiatingProcessAccountObjectId`, or `RecipientObjectId` column of the query results. This action sets the user's risk level to "high" in Microsoft Entra ID, triggering corresponding [identity protection policies](/azure/active-directory/identity-protection/overview-identity-protection).

- Select **Disable user** to temporarily prevent a user from signing in.
- Select **Reset user authentication** to prompt the user to either change their password on their next sign-in session (for on-premises identities) or require them to sign in again (for Microsoft Entra identities).

- Both the **Disable user** and **Reset user authentication** options require the user security identifier (SID), which are in the columns `AccountSid`, `InitiatingProcessAccountSid`, `RequestAccountSid`, and `OnPremSid`.

- For Microsoft Entra identities, `AccountObjectId` parameter is needed for all actions.

For more information on user actions, see [Remediation actions in Microsoft Defender for Identity](/defender-for-identity/remediation-actions) and [Remediation actions in Microsoft Defender for Cloud Apps](/defender-cloud-apps/governance-actions).

#### Actions on emails

- If the custom detection yields email messages, you can select **Move to mailbox folder** to move the email to a selected folder (any of **Junk**, **Inbox**, or **Deleted items** folders). Specifically, you can move email results from quarantined items (for instance, in the case of false positives) by selecting the **Inbox** option.

   :::image type="content" source="media/custom-detection-rules/advanced-hunting-custom-quarantine-results.png" alt-text="Screenshot of the Inbox option under custom detections in the Microsoft Defender portal." lightbox="media/custom-detection-rules/advanced-hunting-custom-quarantine-results.png":::
    :::image type="content" source="media/custom-detection-rules/advanced-hunting-custom-quarantine-results.png" alt-text="Screenshot of the Inbox option under custom detections in the Microsoft Defender portal." lightbox="media/custom-detection-rules/advanced-hunting-custom-quarantine-results.png":::

- Alternatively, you can select **Delete email** and then choose to either move the emails to Deleted Items (**Soft delete**) or delete the selected emails permanently (**Hard delete**).

The columns `NetworkMessageId` and `RecipientEmailAddress` must be present in the output results of the query to apply actions to email messages.

### 5. Set the rule scope

Set the scope to specify which devices the rule covers. The scope influences rules that check devices and doesn't affect rules that check only mailboxes and user accounts or identities.

When setting the scope, select:

- All devices
- Specific device groups

The rule queries data only from devices in the scope. It takes actions only on those devices.

> [!NOTE]
> Users can create or edit a custom detection rule only if they have the corresponding permissions for the devices included in the scope of the rule. For example, admins can only create or edit rules that are scoped to all device groups if they have permissions for all device groups. 

### 6. Review and turn on the rule

After reviewing the rule, select **Create** to save it. The custom detection rule runs immediately. It runs again based on the configured frequency to check for matches, generate alerts, and take response actions.

> [!IMPORTANT]
> Regularly review custom detections for efficiency and effectiveness. For guidance on how to optimize your queries, see **[Advanced hunting query best practices](advanced-hunting-best-practices.md)**. To make sure you're creating detections that trigger true alerts, take time to review your existing custom detections by following the steps in **[Manage existing custom detection rules](custom-detection-manage.md)**.
>
> You maintain control over the broadness or specificity of your custom detections. Any false alerts generated by custom detections might indicate a need to modify certain parameters of the rules.

#### How custom detections handle duplicate alerts

An important consideration when creating and reviewing custom detection rules is alert noise and fatigue. Custom detections group and deduplicate events into a single alert. If a custom detection rule runs twice on an event that contains the same entities, custom details, and dynamic details, it creates one alert for both events. If the detection rule recognizes that the events are identical, it logs one of the events on the created alert and takes care of the duplicates. Duplicates can occur when the lookback period is longer than the frequency. If the events are different, the custom detection logs both events on the alert.

## See also

- [Custom detections overview](custom-detections-overview.md)
- [Manage custom detections](custom-detection-manage.md)
- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the advanced hunting query language](advanced-hunting-query-language.md)
- [Migrate advanced hunting queries from Microsoft Defender for Endpoint](advanced-hunting-migrate-from-mde.md)
- [Microsoft Graph security API for custom detections](/graph/api/resources/security-api-overview?view=graph-rest-beta&preserve-view=true#custom-detections)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
