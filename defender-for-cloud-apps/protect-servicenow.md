---
title: Protect your ServiceNow environment | Microsoft Defender for Cloud Apps
description: Connect ServiceNow to Microsoft Defender for Cloud Apps with the API connector to monitor user activity and detect anomalous behavior and sensitive data exposure.
ms.date: 06/16/2026
ms.topic: how-to
ms.reviewer: AmitMishaeli 
ms.custom: sfi-image-nochange, msecd-doc-authoring-1014
ai-usage: ai-assisted
---

# How Defender for Cloud Apps helps protect your ServiceNow environment

As a major CRM cloud provider, ServiceNow incorporates large amounts of sensitive information about customers, internal processes, incidents, and reports inside your organization. Being a business-critical app, ServiceNow is accessed and used by people inside your organization and by others outside of it (such as partners and contractors) for various purposes. In many cases, a large proportion of your users accessing ServiceNow have low awareness of security and might put your sensitive information at risk by unintentionally sharing sensitive data. In other instances, malicious actors might gain access to your most sensitive customer-related assets.

Connecting ServiceNow to Defender for Cloud Apps improves insights into your users' activities. It also helps detect threats using machine-learning anomaly detection and information protection, such as identifying when sensitive customer data is uploaded to ServiceNow.

[!INCLUDE [security-posture-management-connector](includes/security-posture-management-connector.md)]


## Main threats

Connecting ServiceNow to Defender for Cloud Apps helps you address the following threats:

- Compromised accounts and insider threats
- Data leakage
- Insufficient security awareness
- Unmanaged bring your own device (BYOD)

## How Defender for Cloud Apps helps to protect your environment

Defender for Cloud Apps helps protect your ServiceNow environment in the following ways:

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Discover, classify, label, and protect regulated and sensitive data stored in the cloud](best-practices.md#discover-classify-label-and-protect-regulated-and-sensitive-data-stored-in-the-cloud)
- [Enforce DLP and compliance policies for data stored in the cloud](best-practices.md#enforce-dlp-and-compliance-policies-for-data-stored-in-the-cloud)
- [Limit exposure of shared data and enforce collaboration policies](best-practices.md#limit-exposure-of-shared-data-and-enforce-collaboration-policies)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

<a name="saas-security-posture-management"></a>
## SaaS security posture management for ServiceNow

[Connect ServiceNow](#connect-servicenow-to-microsoft-defender-for-cloud-apps) to automatically get security recommendations for ServiceNow in Microsoft Secure Score.

In Secure Score, select **Recommended actions** and filter by **Product** = **ServiceNow**. For example, recommendations for ServiceNow include:

- *Enable MFA*
- *Activate the explicit role plugin*
- *Enable high security plugin*
- *Enable script request authorization*

For more information, see:
-	[Security posture management for SaaS apps](security-saas.md)
-	[Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score
)

## Control ServiceNow with built-in policies and policy templates

You can use the following built-in policy templates to detect and notify you about potential threats:

> [!IMPORTANT]
> File policies retire on January 6, 2027. To maintain file-based data protection for this app, [migrate to Microsoft Purview DLP or auto-labeling policies](migrate-file-policies-to-purview.md).

| Type | Name |
| ---- | ---- |
| Built-in anomaly detection policy | [Activity from anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)<br />[Activity from infrequent country](anomaly-detection-policy.md#activity-from-infrequent-country)<br />
[Activity from suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)<br />[Impossible travel](anomaly-detection-policy.md#impossible-travel)<br />[Activity performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)<br />[Multiple failed login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)<br />[Ransomware detection](anomaly-detection-policy.md#ransomware-activity)<br />[Unusual multiple file download activities](anomaly-detection-policy.md#unusual-activities-by-user) |
| Activity policy template | Logon from a risky IP address<br />Mass download by a single user|
| File policy template | Detect a file shared with an unauthorized domain<br />Detect a file shared with personal email addresses<br />Detect files with PII/PCI/PHI |

For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

In addition to monitoring for potential threats, you can apply and automate the following ServiceNow governance actions to remediate detected threats. These actions are performed through Microsoft Entra ID, Microsoft's cloud identity service:

| Type | Action |
| ---- | ---- |
| User governance | - Notify user on alert (via Microsoft Entra ID)<br />- Require user to sign in again (via Microsoft Entra ID)<br />- Suspend user (via Microsoft Entra ID) |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Protect ServiceNow in real time

Review our best practices for [securing and collaborating with external users](best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls) and [blocking and protecting the download of sensitive data to unmanaged or risky devices](best-practices.md#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices).


## Connect ServiceNow to Microsoft Defender for Cloud Apps

The following section provides instructions for connecting Microsoft Defender for Cloud Apps to your existing ServiceNow account using the app connector API. The ServiceNow app connector gives you visibility into and control over ServiceNow use. For information about how Defender for Cloud Apps protects ServiceNow, see [Protect ServiceNow](protect-servicenow.md).

[!INCLUDE [security-posture-management-connector](includes/security-posture-management-connector.md)]

### Prerequisites

- In order to connect ServiceNow with Defender for Cloud Apps, 
 - Your ServiceNow instance must support API access. 
 - You must have an admin role.
 - The admin account used to make the connection must have permissions to use the API.

Defender for Cloud Apps supports the following ServiceNow versions:
- Eureka
- Fiji
- Geneva
- Helsinki
- Istanbul
- Jakarta
- Kingston
- London
- Madrid
- New York
- Orlando
- Paris
- Quebec
- Rome
- San Diego
- Tokyo  
- Utah
- Vancouver
- Washington
- Xanadu
- Yokohama
- Zurich
- Australia

For more information, see [ServiceNow OAuth applications documentation](https://docs.servicenow.com/bundle/paris-platform-administration/page/administer/security/concept/c_OAuthApplications.html#c_OAuthApplications).

> [!TIP]
> We recommend deploying ServiceNow  using OAuth app tokens, available for Fuji and later releases. For more information, see [Configure OAuth applications in ServiceNow](https://docs.servicenow.com/bundle/paris-platform-administration/page/administer/security/concept/c_OAuthApplications.html#c_OAuthApplications).
>
> For earlier releases, a [legacy connection mode](#legacy-servicenow-connection) is used that uses usernames and passwords The username and password provided are only used for API token generation and aren't saved after the initial connection process.
>

### How to connect ServiceNow to Defender for Cloud Apps using OAuth

Perform the following steps to create an OAuth profile in ServiceNow and connect it to Defender for Cloud Apps:

1. Sign in with an Admin account to your ServiceNow account.

   > [!NOTE]
   > For earlier releases, a [legacy connection mode](#legacy-servicenow-connection) is available based on user/password. The username/password provided are only used for API token generation and aren't saved after the initial connection process.

1. Create a new OAuth profile and then select  **Create an OAuth API endpoint for external clients**.
1. Fill in the following **Application Registries New record** fields:
   1. Enter a name for your OAuth profile, for example, CloudAppSecurity.
      
   1. Copy the **Client ID**. You'll need it later.
      
   1. In the **Client Secret** field, enter a string. If left empty, a random secret is generated automatically. Copy and save it for later.
      
   1. Increase the **Access Token Lifespan** to at least 3,600.
      
   1. Change the **Scope Restriction** value to **Broadly Scoped**.
      
1. Select the name of the OAuth that was defined, and change the **Refresh Token Lifespan** to **7,776,000 seconds** (90 days).
   
1. Establish an internal procedure to ensure that the connection remains active.
    1. Make sure to revoke the old refresh token before the expected expiration of the refresh token.
    1. In the Microsoft Defender Portal, edit the existing connector, using the same client ID and client secret. This will generate a new refresh token. 

    > [!NOTE]
    > This is a recurring process every 90 days. Without this, the ServiceNow connection will stop working.

### Connect ServiceNow to Microsoft Defender for Cloud Apps

To complete the connection in the Microsoft Defender Portal, follow these steps:

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**.

1. In the **App connectors** page, select **+Connect an app**, and then **ServiceNow**.

    :::image type="content" source="media/connect-servicenow.png" alt-text="Screenshot that shows where to find the ServiceNow connector in the Defender portal.":::

   
1. In the next window, give the connection a name and select **Next**.
1. In the **Enter details** page, select **Connect using OAuth token (recommended)**. Select **Next**.

    :::image type="content" source="media/servicenow-app-connector-details-screenshot.png" alt-text="Screenshot of the ServiceNow App Connector Details Dialog.":::
   
1. To find your ServiceNow user name, in the ServiceNow portal, go to **Users** and then locate your name in the table. (Optional) To use a non-admin user for this step, create a non-admin user by following the steps in the below section.
     
1. In the **OAuth Details** page, enter your **Client ID** and **Client Secret**. Select **Next**.

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**. Make sure the status of the connected App Connector is **Connected**.

After connecting ServiceNow, you'll receive events for 1 hour prior to connection.

### Optional: Create a non-admin user

#### Step 1: Create custom access control lists (ACLs) in ServiceNow

1. Sign in to ServiceNow with an administrator account.
1. Open the **Elevate Roles** menu and enable both **admin** and **security_admin**. These elevated roles are required to create ACLs for certain tables.
1. Navigate to **Access Control (ACL)** configuration.
1. Create a **Read** ACL for each of the following tables:
   - sys_user
   - sys_user_group
   - sys_user_grmember
   - sys_user_has_role
   - sys_properties
   - v_plugin
   - sysevent_script_action
   - sys_attachment
   - sys_attachment_doc
   - sysevent
   - syslog_transaction
   - incident
   - sys_user_role_contains
1. For each ACL, set **Type** = **record**, **Operation** = **read**, **Name** = the table name, and **Required Role** = a custom role such as **custom_table_access**.
1. Use the same custom role across all ACLs to simplify management.

#### Step 2: Create a non-admin user

1. In ServiceNow, go to **User Administration** > **Users**.
1. Create a new user account.
1. Record the username and password for later use in the integration setup.
1. Open the newly created user profile.
1. Scroll to the **Roles** section.
1. Assign the custom role created in Step 1 (for example, **custom_table_access**) to the user.

### Legacy ServiceNow connection

To connect ServiceNow with Defender for Cloud Apps, you must have admin-level permissions and make sure the ServiceNow instance supports API access.

1. Sign in with an Admin account to your ServiceNow account.

1. Create a new service account for Defender for Cloud Apps and attach the Admin role to the newly created account.

1. Make sure the REST API plug-in is turned on.


   
## Next steps

- If you have any problems connecting the app, see [Troubleshooting App Connectors](troubleshooting-api-connectors-using-error-messages.md).

- [Control cloud apps with policies](control-cloud-apps-with-policies.md)
