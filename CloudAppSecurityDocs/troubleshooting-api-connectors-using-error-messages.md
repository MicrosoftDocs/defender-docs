---
title: Troubleshoot App Connector error messages 
description: This article provides a list of API App connector error messages as well as resolution recommendations for each.
ms.date: 01/29/2023
ms.topic: conceptual
---
# Troubleshooting App Connector error messages



This article provides a list of API App connector error messages and resolution recommendations for each error.

## Troubleshooting

App connector errors can be seen in the app connector dialog after attempting to connect a cloud app using the API App connector.

> [!div class="mx-tableFixed"]
>
> |Error message|Relevant app|Description|Resolution|
> |----|----|----|------------|
> |HttpRequestFailure: Server returned: 500 Internal server error|All apps|There was an error in the app.|Check the status of the app|
> |Service timeout|All apps|A timeout was detected in the connection between Defender for Cloud Apps and the app. This could be due to a problem with the app.|Try again later.|
> |Get events: Request failed with status code 402. Payment Required. Audit Log Entitlement validation failed|Atlassian|The Atlassian subscription doesn't have 'Atlassian Access' plan which is required to monitor events.|Please enable 'Atlassian Access' plan on your Atlassian subscription.|
> |NullPointerException|AWS|Internal error|Contact support|
> |AuthFatalFailureException: com.box.boxjavalibv2.exceptions.BoxServerException: {"error":"invalid_grant","error_description":"Invalid refresh token"}|Box|The Box refresh token is not valid|Follow the process to connect Box to Defender for Cloud Apps again.|
> |BoxRestException: Failed to parse response.|Box|Internal error|Click the Test now link again to test the connection to Box.|
> |ContextManagerServiceException: com.adallom.adalib.httputils.exceptions.TokenRefreshException: {"error":"invalid_grant","error_description":"Invalid refresh token"}'|Box|The Box refresh token is not valid|Follow the process to connect Box to Defender for Cloud Apps again.|
> |BoxServerException: User cannot access this feature without having an enterprise|Box|The Box account is not an Enterprise account.|Upgrade your Box license to the Enterprise version of Box and then follow the process to connect Box to Defender for Cloud Apps again.|
> |BoxServerException: Unauthorized - Cannot authorize with this service|Box|The Box admin deleted the Defender for Cloud Apps application in Box.|Follow the process to connect Box to Defender for Cloud Apps again.|
> |HttpRequestFailure: Server returned: 401 Unauthorized|Exchange Online|User or password are incorrect|Make sure the username and password are correct and Follow the process to connect Exchange Online to Defender for Cloud Apps again.|
> |HttpRequestFailure: Server returned: 404 Not Found|Exchange Online|The user you are using to log into Exchange Online does not have a primary mailbox in Exchange Online (for example, a user who does not exist in Microsoft Entra ID or a user exists in Microsoft Entra ID, but does not have an Exchange Online license).|Follow the process to connect Exchange Online to Defender for Cloud Apps again using a new admin account.|
> |GoogleJsonResponseException: 401 Unauthorized|Google Workspace|Access denied. You are not authorized to read activity records. The user you log into Google Workspace with must be an admin user.|Follow the process to connect Google Workspace to Defender for Cloud Apps again using an admin account.|
> |GoogleJsonResponseException: 403 Forbidden|Google Workspace|Problem running the Google Workspace API.|If you just deployed the Defender for Cloud Apps App Connector for Google Workspace, check the following: If you clicked Unlimited, make sure that your Google Workspace account is really unlimited. If it is not, run the App Connector again and un-select the option for an unlimited account. Check that the scopes you defined during setup are correct. If this is not a new deployment and you see this error, it may be that you reached the API limit for today and Google Workspace events will be renewed tomorrow.|
> |TokenResponseException: 400 Bad Request|Google Workspace|Either the connection to Google Workspace did not complete or is expired.|Follow the process to connect Google Workspace to Defender for Cloud Apps again.|
> |HttpRequestFailure: Server returned: 401 Unauthorized|Okta|The Okta token is not valid.|Follow the process to connect Okta to Defender for Cloud Apps again.|
> |IOException:|Okta|Internal error|Contact support|
> |HttpRequestFailure: Server returned: 404 Not Found|Okta|Internal error|Contact support|
> |HttpRequestFailure: Server returned: 400 Bad Request: {"error":{"code":"AF20012","message":"Specified tenant ID (Tenant_ID goes here) is incorrectly configured in the system."|Microsoft 365 |No assigned Microsoft 365 licenses were found. |Assign at least one Microsoft 365 license to your tenant.|
> |Microsoft.Office.Compliance.Audit.DataServiceException: Tenant 998cea7e-35cd-46a5-ab3c-8ec88a45d7d5 does not exist or {"error":"code":"AF20023","message":"The subscription was disabled."|Microsoft 365|Audit logging is not enabled in Microsoft 365|Enable audit logging in Microsoft 365. [Learn more](./connect-office-365.md#how-to-connect-microsoft-365-to-defender-for-cloud-apps)|
> |HttpRequestFailure: Server returned: 401 Unauthorized|Microsoft 365|Internal problem|Click the Test now link again|
> |TokenRefreshException: {"error":"invalid_grant","error_description":"AADSTS70002: Error validating credentials. AADSTS70008: The provided authorization code or refresh token is expired. Send a new interactive authorization request for this user and resource.|Microsoft 365|Token expired|Follow the process to connect Microsoft 365 to Defender for Cloud Apps again.|
> |SocketTimeoutException: Read timed out|Microsoft 365|Internal error|Click the Test now link again|
> |NullPointerException|Microsoft 365|Internal error|Contact support|
> |IgniteException|Microsoft 365|Domain or user are not valid|Reset your settings and follow the process to connect Microsoft 365 to Defender for Cloud Apps again.|
> |ContextManagerServiceException: com.adallom.adalib.httputils.exceptions.TokenRefreshException: {"error":"invalid_grant","error_description":"AADSTS70002: Error validating credentials. AADSTS70008: The provided authorization code or refresh token is expired. Send a new interactive authorization request for this user and resource.|Microsoft 365|Domain or user are not valid|Reset your settings and follow the process to connect Microsoft 365 to Defender for Cloud Apps again.|
> |HttpRequestFailure: Server returned: 400 Bad Request|Microsoft 365|Internal error|Click the Test now link again in a few minutes, if it does not work, follow the process to connect Microsoft 365 to Defender for Cloud Apps again.|
> |SocketTimeoutException: Read timed out|Salesforce|Internal error|Click the Test now link again to test the connection to Salesforce.|
> |HttpRequestFailure: Server returned: 400 Bad Request|Salesforce|Either the connection to Salesforce did not complete or is expired.|Follow the process to connect Salesforce to Defender for Cloud Apps again.|
> |Get Permissions: NoHttpResponseException: `*******.salesforce.com:443` failed to respond|Salesforce|IP restriction on customer ENV.|In the Salesforce portal, under **Setup** > **Session Settings**, clear the **Lock sessions to the IP address from which they originated** check box.|
> |team_not_authorized|Slack|Slack Discovery API is not enabled.|Contact Slack support and ask to enable Discovery API.|
> |RuntimeException: com.adallom.adalib.httputils.exceptions.HttpRequestFailure: Server returned: 403 Forbidden|ServiceNow|Permissions are incorrect|Follow the process to connect ServiceNow to Defender for Cloud Apps again using an admin account.|
> |Get events: {"code":403,"serverResponse"<br />Get users: {"code":403,"serverResponse"<br />…<br />"body":"{"error":"permission denied"}"|Workday|Insufficient permission to access audit logs and/or user endpoints|Verify all permissions are in place. [Learn more](./connect-workday.md#prerequisites)|
> |"code":400,"serverResponse"<br />…<br />body":"{"error":"invalid_grant"}|Workday|Authentication issue|Account used to set up the instance may be locked or disabled. To verify, view the Workday account and select **View Sign-on History**. You may see an authentication failure message in the report specifying that the System Account is disabled. [Learn more](./connect-workday.md#how-to-connect-workday-to-defender-for-cloud-apps-using-oauth)|
> |"code":401,"serverResponse":<br />…<br />body":"{"error":"invalid_client"}"|Workday|Client token validity issue|OAuth 2.0 REST API Client token not valid. The token may have expired, or may be incorrect. Generate another token and assign it to the connected instance. [Learn more](./connect-workday.md#how-to-connect-workday-to-defender-for-cloud-apps-using-oauth)|
> |Get user: Success Get events: Request failed with status code 403|Zendesk|The Zendesk user that is configuring the integration is no longer a Zendesk admin, or your Zendesk license is unsupported.|Upgrade the Zendesk user who configured the connector to admin (from Zendesk admin portal), or check [here](./connect-zendesk.md#prerequisites) to see if your Zendesk license is supported.|

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]
