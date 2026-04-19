---
title: Connect apps to get visibility and control 
description: This article describes the process for connecting apps with API connectors to apps in your organization's cloud.
ms.date: 04/19/2026
ms.topic: how-to
ms.reviewer: Shweta Choudhary
---

# Connect apps to get visibility and control with Microsoft Defender for Cloud Apps

App connectors use the APIs of app providers to enable greater visibility and control by Microsoft Defender for Cloud Apps over the apps you connect to.

Microsoft Defender for Cloud Apps uses the APIs provided by the cloud provider. All communication between Defender for Cloud Apps and connected apps is encrypted using HTTPS. Each service has its own framework and API limitations such as throttling, API limits, dynamic time-shifting API windows, and others. Microsoft Defender for Cloud Apps worked with the services to optimize the usage of the APIs and to provide the best performance. Taking into account different limitations services impose on the APIs, the Microsoft Defender for Cloud Apps engines use the allowed capacity. Some operations, such as scanning all files in the tenant, require numerous APIs so they're spread over a longer period. Expect some policies to run for several hours or several days.

> [!IMPORTANT]
> Starting **September 1, 2024**, we'll be deprecating the **Files** page from Microsoft Defender for Cloud Apps. At that point, create and modify Information Protection policies and find malware files from the **Cloud apps > Policies > Policy Management** page. For more information, see [File policies in Microsoft Defender for Cloud Apps](data-protection-policies.md).

## Multi-instance support

Defender for Cloud Apps supports multiple instances of the same connected app. For example, if you have more than one instance of Salesforce (one for sales, one for marketing) you can connect both to Defender for Cloud Apps. You can manage the different instances from the same console to create granular policies and deeper investigation. This support applies only to API connected apps, not to Cloud Discovered apps, or Proxy connected apps.

> [!NOTE]
> Multi-instance isn't supported for Microsoft 365 and Azure.

## How it works

Defender for Cloud Apps is deployed with system admin privileges to allow full access to all objects in your environment.

The App Connector flow is as follows:

1. Defender for Cloud Apps scans and saves authentication permissions.
1. Defender for Cloud Apps requests the user list. The first time the request is done, it might take some time until the scan completes. After the user scan is over, Defender for Cloud Apps moves on to activities and files. As soon as the scan starts, some activities will be available in Defender for Cloud Apps.
1. After completion of the user request, Defender for Cloud Apps periodically scans users, groups, activities, and files. All activities will be available after the first full scan.

This connection might take some time depending on the size of the tenant, the number of users, and the size and number of files that need to be scanned.

Depending on the app to which you're connecting, API connection enables the following items:

- **Account information** - Visibility into users, accounts, profile information, status (suspended, active, disabled) groups, and privileges.
- **Audit trail** - Visibility into user activities, admin activities, sign-in activities.
- **Account governance** - Ability to suspend users, revoke passwords, etc.
- **App permissions** - Visibility into issued tokens and their permissions.
- **App permission governance** - Ability to remove tokens.
- **Data scan** - Scanning of unstructured data using two processes -periodically (every 12 hours) and in real-time scan (triggered each time a change is detected).
- **Data governance** - Ability to quarantine files, including files in trash, and overwrite files.

The following tables list, per cloud app, which abilities are supported with App connectors:

>[!NOTE]
>Since not all app connectors support all abilities, some rows might be empty.

### Users and activities

|   App                | List accounts                        | List groups                          | List privileges                      | Log on activity                      | User activity                               | Administrative activity   |
| ----------------- | ------------------------------------ | ------------------------------------ | ------------------------------------ | ------------------------------------ | ------------------------------------------- | ------------------------- |
| [Asana](protect-asana.md)  | ✔ |  |  | ✔ | ✔| |
| [Atlassian](protect-atlassian.md)         | ✔ |  |  | ✔ | ✔ | ✔ |
| [AWS](protect-aws.md)               | ✔                                    |                                      |                                      | ✔                                    | Not applicable                              | ✔                         |
| [Azure](protect-azure.md)             | ✔                                    | ✔                                    |                                      | ✔                                    |  ✔                                          |                        |
|   [Box](protect-box.md)             | ✔                                    | ✔                                    | ✔                                    | ✔                                    | ✔                                           | ✔                         |
|  [Citrix ShareFile](protect-citrix-sharefile.md)  |  |  |  |   |
| [DocuSign](protect-docusign.md)          | Supported with DocuSign Monitor|  |  | Supported with DocuSign Monitor | Supported with DocuSign Monitor | Supported with DocuSign Monitor |
| [Dropbox](protect-dropbox.md)           | ✔                                    | ✔                                    | ✔                                    | ✔                                    | ✔                                           | ✔                         |
| [Egnyte](protect-egnyte.md)  | ✔ |  | ✔ | ✔ | ✔ | ✔ |
| [GitHub](protect-github.md)            | ✔                                    |                                      | ✔                                    |                                      | ✔                                           | ✔                         |
| [GCP](protect-gcp.md)               | Subject Google Workspace  connection | Subject Google Workspace  connection | Subject Google Workspace  connection | Subject Google Workspace  connection | ✔                                           | ✔                         |
| [Google  Workspace](protect-google-workspace.md) | ✔                                    | ✔                                    | ✔                                    | ✔                                    | ✔ - requires Google Business or  Enterprise | ✔                         |
| [Microsoft 365](protect-office-365.md)        | ✔                                    | ✔                                    | ✔                                    | ✔                                    | ✔                                           | ✔                         |
| [Miro](protect-miro.md)  | ✔ |  |  | ✔ | ✔| |
| [Mural](protect-mural.md)  | ✔ |  |  | ✔ | ✔| |
| [NetDocuments](protect-netdocuments.md)  | ✔ |  | ✔ |  | ✔ | ✔ |
| [Okta](protect-okta.md)              | ✔                                    |                                      | Not supported by provider            | ✔                                    | ✔                                           | ✔                         |
| [OneLogin](protect-onelogin.md) | ✔ | | ✔ | ✔ | ✔ | ✔ |
| [ServiceNow](protect-servicenow.md)      | ✔                                    | ✔                                    | ✔                                    | ✔                                    | Partial                                     | Partial                   |
| [Salesforce](protect-salesforce.md)        | Supported with Salesforce Shield                                        |Supported with Salesforce Shield                                       | Supported with Salesforce Shield                                   | Supported with Salesforce Shield                                    | Supported with Salesforce Shield            | Supported with Salesforce Shield                             |
| [Slack](protect-slack.md) | ✔ |  | ✔ | ✔ | ✔ | ✔ |
| [Smartsheet](protect-smartsheet.md) | ✔ | | ✔ |  | ✔ | ✔ |
| [Webex](protect-webex.md)             | ✔                                    |                                      | ✔                                    |                                    | ✔                                           |  Not supported by provider |
| [Workday](protect-workday.md)           | ✔                                    | Not supported by provider            | Not supported by provider            | ✔                                    | ✔                                           | Not supported by provider |
|[Workplace by Meta](protect-workplace.md)|✔||✔|✔|✔|✔|
| [Zendesk](protect-zendesk.md) | ✔ |  | ✔ | ✔ | ✔ | ✔ |
| [Zoom](protect-zoom.md)  |  |  |  |   |

### User, app governance, and security configuration visibility

|  App      | User governance     | View app permissions   | Revoke app permissions    | SaaS Security Posture Management (SSPM) |
| --------- | ------------------- | ---------------------- | ------------------------- | --------------------------------------- |
| [Asana](protect-asana.md)  |  |  |  |  |
| [Atlassian](protect-atlassian.md)         |  |  |  | ✔ |
| [AWS](protect-aws.md)               |                                      | Not applicable            | Not applicable            |             |
| [Azure](protect-azure.md)             |                                      |                           | Not supported by provider |  |
|  [Box](protect-box.md)                | ✔                                    | Not supported by provider |                           |                           |
| [Citrix ShareFile](protect-citrix-sharefile.md)          |  |  | | ✔|
| [DocuSign](protect-docusign.md)           |  |  | | ✔|
| [Dropbox](protect-dropbox.md)           |                                      |                           |                            |     ✔                       |
| [Egnyte](protect-egnyte.md) | | | | |
| [GitHub](protect-github.md)              |                                      | ✔                         |                           | ✔|
| [GCP](protect-gcp.md)                 | Subject Google Workspace  connection | Not applicable            | Not applicable            |             |
| [Google  Workspace](protect-google-workspace.md) | ✔                                    | ✔                         | ✔                         |✔|
| [Microsoft 365](protect-office-365.md)      | ✔                                    | ✔                         | ✔                         | ✔                 |
| [Miro](protect-miro.md)  |  |  |  |  |
| [Mural](protect-mural.md)  |  |  |  |  |
| [NetDocuments](protect-netdocuments.md)  |  |  |  | Preview |
| [Okta](protect-okta.md)              |                                      | Not applicable            | Not applicable            | ✔|
|  [OneLogin](protect-onelogin.md) | |  |  |  |
| [ServiceNow](protect-servicenow.md)      |               |                           |                           | ✔ |
| [Salesforce](protect-salesforce.md)        | ✔                                    |                          | ✔                         | ✔ |
| [Slack](protect-slack.md) |  |  |  |  |
| [Smartsheet](protect-smartsheet.md) | | | | |
| [Webex](protect-webex.md)             |                                      | Not applicable            | Not applicable            |             |
| [Workday](protect-workday.md)           | Not supported by provider            | Not applicable            | Not applicable            |             |
|[Workplace by Meta](protect-workplace.md)||||Preview|
| [Zendesk](protect-zendesk.md)  |  |  |  | ✔ |
|  [Zoom](protect-zoom.md)   |  |  |  | Preview  |

### Information protection

|     App              | DLP - Periodic backlog scan       | DLP - Near real-time scan                | Sharing control           | File governance           | Apply sensitivity labels from Microsoft Purview Information Protection |
| ----------------- | ------------------------- | ---------------------------------------- | ------------------------- | ------------------------- | ------------------------------------------ |
| [Asana](protect-asana.md)   |  |  |  |  |  |
| [Atlassian](protect-atlassian.md)         |  |  |  |  |  |
|  [AWS](protect-aws.md)                |                           | ✔ - S3 Bucket discovery only             | ✔                         | ✔                         | Not applicable                             |
| [Azure](protect-azure.md)              |                           |                                          |                           |                           |                                            |
| [Box](protect-box.md)                | ✔                         | ✔                                        | ✔                         | ✔                         | ✔                                          |
| [Citrix ShareFile](protect-citrix-sharefile.md)  |  |  |  |   |
| [DocuSign](protect-docusign.md)           |  |  |  |  |  |
| [Dropbox](protect-dropbox.md)            | ✔                         | ✔                                        | ✔                         | ✔                         |                                            |
| [Egnyte](protect-egnyte.md)  |  |  |  |  | |
|  [GitHub](protect-github.md)             |                           |                                          |                           |                           |                                            |
| [GCP](protect-gcp.md)               | Not applicable            | Not applicable                           | Not applicable            | Not applicable            | Not applicable                             |
| [Google  Workspace](protect-google-workspace.md) | ✔                         | ✔ - requires Google Business  Enterprise | ✔                         | ✔                         | ✔                                          |
| [Okta](protect-okta.md)               | Not applicable            | Not applicable                           | Not applicable            | Not applicable            | Not applicable                             |
| [Miro](protect-miro.md)   |  |  |  |  |  |
| [Mural](protect-mural.md)   |  |  |  |  |  |
| [NetDocuments](protect-netdocuments.md)  |  |  |  |  |  |
| [Okta](protect-okta.md)               | Not applicable            | Not applicable                           | Not applicable            | Not applicable            | Not applicable                             |
| [OneLogin](protect-onelogin.md) |  |  |  |  |  |
| [ServiceNow](protect-servicenow.md)      | ✔                         | ✔                                        | Not applicable            |                           |                                            |
|  [Salesforce](protect-salesforce.md)         | ✔                         | ✔                                        |                           | ✔                         |                                            |
|  [Slack](protect-slack.md) |  |  | |  | |
|  [Smartsheet](protect-smartsheet.md)  | | | | | |
|  [Webex](protect-webex.md)             | ✔                         | ✔                                        | ✔                         | ✔                         | Not applicable                             |
|  [Workday](protect-workday.md)            | Not supported by provider | Not supported by provider                | Not supported by provider | Not supported by provider | Not applicable                             |
|[Workplace by Meta](protect-workplace.md)||||||
| [Zendesk](protect-zendesk.md)  |  |  |  |  | Preview |
| [Zoom](protect-zoom.md)   |  |  |  |   |

## Prerequisites

- When working with the [Microsoft 365 connector](protect-office-365.md), you'll need a license for each service where you want to view security recommendations. For example, to view recommendations for Microsoft Forms, you'll need a license that supports Forms.

- For some apps, it might be necessary to allow list IP addresses to enable Defender for Cloud Apps to collect logs and provide access for the Defender for Cloud Apps console. For more information, see [Network requirements](network-requirements.md).

> [!NOTE]
> To get updates when URLs and IP addresses are changed, subscribe to the RSS as explained in: [Microsoft 365 URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges).

## Enable app connectors

To enable an app connector for the first time, configure an API connection for the specific cloud app you want to connect. See the individual connector guides for each app for detailed instructions.


1. In the Microsoft Defender portal, go to **Cloud Apps** > **Connected apps**.
2. Select **Connect an app** or **Add a new connector**.
3. Choose the cloud app you want to connect.
4. Follow the instructions in the corresponding app-specific API connector guide. These instructions include the required permissions and authentication steps.

Each cloud app has its own enablement process based on the APIs it supports.


### ExpressRoute

Defender for Cloud Apps is deployed in Azure and fully integrated with [ExpressRoute](/azure/expressroute/expressroute-introduction). All interactions with the Defender for Cloud Apps apps and traffic sent to Defender for Cloud Apps, including upload of discovery logs, is routed via ExpressRoute for improved latency, performance, and security.
For more information about  Microsoft Peering, see [ExpressRoute circuits and routing domains](/azure/expressroute/expressroute-circuit-peerings).

## Disable app connectors

> [!NOTE]
>
> - Before disabling an app connector, make sure you have the connection details available as you'll need them if you want to re-enable the connector.
> - These steps can't be used to disable conditional access app control apps and security configuration apps.

To disable connected apps:

1. Go to**Connected apps**.
1. Select **Disable App connector**.
1. Select **Disable App connector instance** to confirm the action.

Once disabled, the connector instance stops consuming data from the connector.

## Re-enable app connectors

To re-enable connected apps:

1. Go to **Connected apps** 
1. Select **Edit settings**. This starts the process to add a connector.
1. Add the connector using the steps in the relevant API connector guide. For example, if you're re-enabling GitHub, use the steps in [Connect GitHub Enterprise Cloud to Microsoft Defender for Cloud Apps](protect-github.md#connect-github-enterprise-cloud-to-microsoft-defender-for-cloud-apps).


## Troubleshoot missing activities after you connect an app

If expected activities don't show after you connect an app, use the following checks to determine where the data should be available and whether additional configuration is required.

> [!IMPORTANT]
> Missing activity doesn't always indicate connector failure. First confirm whether the activity is expected in Defender for Cloud Apps, Microsoft Entra logs, Microsoft 365 audit logs, or Advanced Hunting.

**1. Confirm the connector is healthy**
Verify that the app connector is connected successfully and that there are no configuration warnings or permission issues.
 
### Step 2: Check ingestion delay expectations
Some connectors have expected latency before activities appear. Validate whether the connector has a documented ingestion delay before treating missing activity as an issue.
 
**3. Confirm that the connector supports activity ingestion**

Not all connectors support activity ingestion. Check whether the connector supports activity collection under the [Users and activities section](#users-and-activities)


**4. Review connector-specific activity options**

For connectors that support selectable activity types, confirm that the required options are enabled. For example, if you're investigating sign-in activity, verify that the connector is configured to collect the relevant sign-in data.

**5. Verify scoped deployment settings**
If scoped deployment is enabled, confirm that the account performing the activity is included in the current scoped deployment rules. Activities generated by excluded users or groups or app won't be ingested. Link
Also verify whether account identifiers are being matched correctly across connected applications, especially when different identifier formats are used. 

**6. Validate the expected logging surface**
Not all events appear in the same place. Depending on the activity type, validate the event in the appropriate source:
|Event  |Source  |
|---------|---------|
|Defender for Cloud Apps policy administration changes     |  Microsoft Defender for Cloud Apps Activity log       |
|Microsoft Entra sign-in events     |  Microsoft Entra sign-in logs       |
|Identity-related investigation data     |  Advanced Hunting identity tables       |

**7. Apply filters before concluding that data is missing**

Use filters such as:
- Time range
- User or administrator
- Activity type
- App or workload

**8. Check for known scope limitations**
Some activities might not be fully represented in every logging surface. If an event is missing from one source, confirm whether that activity is documented as available in another source.
Important: Missing activity in one portal doesn't always indicate connector failure. First confirm whether the activity is expected in Defender for Cloud Apps, Microsoft Entra logs, Microsoft 365 audit logs, or Advanced Hunting.

### Investigate further

Investigate further when:

- The connector shows a healthy state but no expected data appears in any supported logging surface.
- Required activity options are turned on, but the event is still absent after a reasonable validation period.
- The same activity type is consistently unavailable across multiple checks

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)
