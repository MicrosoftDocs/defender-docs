---
title: What's new archive
description: This article lists Microsoft Defender for Identity release notes for versions and features released over 6 months ago.
ms.date: 05/15/2023
ms.topic: reference
---

# What's new archive for Microsoft Defender for Identity

This article lists Microsoft Defender for Identity release notes for versions and features released over 6 months ago.

For information about the latest versions and features, see [What's new in Microsoft Defender for Identity](whats-new.md).

> [!NOTE]
> Starting June 15 2022, Microsoft will no longer support the Defender for Identity sensor on devices running Windows Server 2008 R2. We recommend that you identify any remaining Domain Controllers (DCs) or AD FS servers that are still running Windows Server 2008 R2 as an operating system and make plans to update them to a supported operating system.
>
>For the two months after June 15 2022, the sensor will continue to function. After this two-month period, starting August 15, 2022, the sensor will no longer function on Windows Server 2008 R2 platforms. More details can be found at: <https://aka.ms/mdi/2008r2>

## July 2023

### Defender for Identity release 2.209

This version includes improvements and bug fixes for cloud services and the Defender for Identity sensor.

### Search for Active Directory groups in Microsoft Defender XDR (Preview)

The Microsoft Defender XDR global search now supports searching by Active Directory group name. Any groups found are shown in the results on a separate **Groups** tab. Select an Active Directory group from your search results to see more details, including:

:::row:::
   :::column span="":::
      - Type
      - Scope
      - Domain
      - SAM name
      - SID
   :::column-end:::
   :::column span="":::
      - Group creation time
      - The first time an activity by the group was observed
      - Groups that contain the selected group
      - A list of all group members
   :::column-end:::
:::row-end:::

For example:

:::image type="content" source="media/whats-new/group-search.png" alt-text="Screenshot of the Groups tab in the Microsoft Defender XDR global search." lightbox="media/whats-new/group-search.png":::

For more information, see [Microsoft Defender for Identity in Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-security-center-mdi?bc=/defender-for-identity/breadcrumb/toc.json&toc=/defender-for-identity/TOC.json).

### New security posture reports

Defender for Identity's identity security posture assessments proactively detect and recommend actions across your on-premises Active Directory configurations.

The following new security posture assessments are now available in Microsoft Secure Score:

- [Remove access rights on suspicious accounts with the Admin SDHolder permission](security-assessment-remove-suspicious-access-rights.md)
- [Remove nonadmin accounts with DCSync permissions](security-assessment-non-admin-accounts-dcsync.md)
- [Remove local admins on identity assets](security-assessment-remove-local-admins.md)
- [Start your Defender for Identity deployment](security-assessment-deploy-defender-for-identity.md)

For more information, see [Microsoft Defender for Identity's security posture assessments](security-assessment.md).

### Automatic redirection for the classic Defender for Identity portal

The Microsoft Defender for Identity portal experience and functionality are converged into Microsoft’s extended detection and response (XDR) platform, Microsoft Defender XDR. As of July 6, 2023, customers using the classic Defender for Identity portal are automatically redirected to Microsoft Defender XDR, with no option to revert back to the classic portal.

For more information, see our [blog post](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/leveraging-the-convergence-of-microsoft-defender-for-identity-in/ba-p/3856321) and [Microsoft Defender for Identity in Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-security-center-mdi).

### Defender for Identity report downloads and scheduling in Microsoft Defender XDR (Preview)

Now you can download and schedule periodic Defender for Identity reports from the Microsoft Defender portal, creating parity in report functionality with the legacy [classic Defender for Identity portal](classic-reports.md).

Download and schedule reports in Microsoft Defender XDR from the **Settings > Identities > Report management** page. For example:

:::image type="content" source="media/whats-new/report-management.png" alt-text="Screenshot of the Report management page." lightbox="media/whats-new/report-management.png":::

For more information, see [Microsoft Defender for Identity reports in Microsoft Defender XDR](reports.md).

### Defender for Identity release 2.208

- This version includes improvements and bug fixes for cloud services and the Defender for Identity sensor.

### Defender for Identity release 2.207

- This version provides the new **AccessKeyFile** installation parameter. Use the **AccessKeyFile** parameter during a silent installation of a Defender for Identity sensor, to set the workspace Access Key from a provided text path. For more information, see [Install the Microsoft Defender for Identity sensor](install-sensor.md#defender-for-identity-sensor-silent-installation).

- This version includes improvements and bug fixes for cloud services and the Defender for Identity sensor.

## June 2023

### Defender for Identity release 2.206

- This version includes improvements and bug fixes for cloud services and the Defender for Identity sensor.

### Advanced hunting with an enhanced IdentityInfo table

- For tenants with Defender for Identity deployed, the Microsoft 365 **IdentityInfo** advanced hunting table now includes more attributes per identity, and identities detected by the Defender for Identity sensor from your on-premises environment.

For more information, see the [Microsoft Defender XDR advanced hunting documentation](/microsoft-365/security/defender/advanced-hunting-identityinfo-table).

### Defender for Identity release 2.205

- This version includes improvements and bug fixes for internal sensor infrastructure.

## May 2023

### Enhanced Active Directory account control highlights

The Microsoft Defender XDR **Identity** > user details page now includes new Active Directory account control data.

On the user details **Overview** tab, we've added the new **Active Directory account controls** card to highlight important security settings and Active directory controls. For example, use this card to learn whether a specific user is able to bypass password requirements or has a password that never expires.

For example:

:::image type="content" source="media/whats-new/uac-flags.png" alt-text="Screenshot of the UAC flags card on a user details page.":::

For more information, see the [User-Account-Control attribute](/windows/win32/adschema/a-useraccountcontrol) documentation.

### Defender for Identity release 2.204

Released May 29, 2023

- New health alert for VPN (radius) integration data ingestion failures. For more information, see [Microsoft Defender for Identity sensor health alerts](health-alerts.md#radius-accounting-vpn-integration-data-ingestion-failures).

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.203

Released May 15, 2023

- New health alert for verifying that ADFS Container Auditing is configured correctly. For more information, see [Microsoft Defender for Identity sensor health alerts](health-alerts.md#auditing-on-the-adfs-container-is-not-enabled-as-required).

- The Microsoft Defender 365 **Identity** page includes UI updates for the lateral movement path experience. No functionality was changed. For more information, see [Understand and investigate Lateral Movement Paths (LMPs) with Microsoft Defender for Identity](understand-lateral-movement-paths.md).

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Identity timeline enhancements

The identity **Timeline** tab now contains new and enhanced features! With the updated timeline, you can now filter by *Activity type*, *Protocol*, and *Location*, in addition to the original filters. You can also export the timeline to a CSV file and find additional information about activities associated with MITRE ATT&CK techniques. For more information, see [Investigate users in Microsoft Defender XDR](/microsoft-365/security/defender/investigate-users).

### Alert tuning in Microsoft Defender XDR

Alert tuning, now available in Microsoft Defender XDR, allows you to adjust your alerts and optimize them. Alert tuning reduces false positives, allows your SOC teams to focus on high-priority alerts, and improves threat detection coverage across your system.

In Microsoft Defender XDR, create rule conditions based on evidence types, and then apply your rule on any rule type that matches your conditions. For more information, see [Tune an alert](/microsoft-365/security/defender/investigate-alerts#public-preview-tune-an-alert).

## April 2023

### Defender for Identity release 2.202

Released April 23, 2023

- New health alert for verifying that Directory Services Configuration Container Auditing is configured correctly, as described in the [health alerts page](health-alerts.md#auditing-on-the-configuration-container-is-not-enabled-as-required).
- New workspaces for AD tenants mapped to New Zealand are created in the Australia East region. For the most current list of regional deployment, see [Defender for Identity components](architecture.md#defender-for-identity-components).
- Version includes improvements and bug fixes for internal sensor infrastructure.

## March 2023

### Defender for Identity release 2.201

Released March 27, 2023

- We're in the process of disabling the SAM-R honeytoken alert. While these types of accounts should never be accessed or queried, certain legacy systems might use these accounts as part of their regular operations. If this functionality is necessary for you, you can always create an advanced hunting query and use it as a custom detection. We're also reviewing the LDAP honeytoken alert over the coming weeks, but remains functional for now.

- We fixed detection logic issues in the [Directory Services Object Auditing health alert](health-alerts.md#directory-services-object-auditing-is-not-enabled-as-required) for non-English operating systems, and for Windows 2012 with Directory Services schemas earlier than version 87.

- We removed the prerequisite of configuring a Directory Services account for the sensors to start. For more information, see [Microsoft Defender for Identity Directory Service account recommendations](directory-service-accounts.md).

- We no longer require logging 1644 events. If you have this registry setting enabled, you can remove it. For more information, see  [Event ID 1644](configure-windows-event-collection.md#legacy-configurations).

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.200

Released March 16, 2023

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.199

Released March 5, 2023

- Some exclusions for the **Honeytoken was queried via SAM-R** alert weren't functioning properly. In these instances, alerts were being triggered even for excluded entities. This error has now been fixed.

- **Updated NTLM protocol name for the Identity Advanced Hunting tables**: The old protocol name `Ntlm` is now listed as the new protocol name `NTLM` in Advanced Hunting Identity tables: IdentityLogonEvents, IdentityQueryEvents, IdentityDirectoryEvents.
If you're currently using the `Ntlm` protocol in case-sensitive format from the Identity event tables, you should change it to `NTLM`.

- Version includes improvements and bug fixes for internal sensor infrastructure.

## February 2023

### Defender for Identity release 2.198

Released February 15, 2023

- **Identity timeline is now available as part of the new Identity page in Microsoft Defender XDR**: The updated User page in Microsoft Defender XDR now has a new look and feel, with an expanded view of related assets and a new dedicated timeline tab. The timeline represents activities and alerts from the last 30 days, and it unifies the user’s identity entries across all available workloads (Defender for Identity/Defender for Cloud Apps/Defender for Endpoint). By using the timeline, you can easily focus on activities that the user performed (or were performed on them), in specific timeframes. For more information, see [Investigate users in Microsoft Defender XDR](/microsoft-365/security/defender/investigate-users)

- **Further improvements for honeytoken alerts**: In [release 2.191](whats-new-archive.md#defender-for-identity-release-2191), we introduced several new scenarios to the honeytoken activity alert.  

  Based on customer feedback, we've decided to split the honeytoken activity alert into five separate alerts:

  - Honeytoken user was queried via SAM-R.
  - Honeytoken user was queried via LDAP.
  - Honeytoken user authentication activity
  - Honeytoken user had attributes modified.
  - Honeytoken group membership changed.

  Additionally, we have added exclusions for these alerts, providing a customized experience for your environment.

  We're looking forward to hearing your feedback so we can continue to improve.

- New security alert - **Suspicious certificate usage over Kerberos protocol (PKINIT).**: Many of the techniques for abusing Active Directory Certificate Services (AD CS) involve the use of a certificate in some phase of the attack. Microsoft Defender for Identity now alerts users when it observes such suspicious certificate usage. This behavioral monitoring approach provides comprehensive protection against AD CS attacks, triggering an alert when a suspicious certificate authentication is attempted against a domain controller with a Defender for Identity sensor installed. For more information, see [Microsoft Defender for Identity now detects suspicious certificate usage](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/microsoft-defender-for-identity-now-detects-suspicious/ba-p/3743335).
- **Automatic attack disruption**: Defender for Identity now works together with Microsoft Defender XDR to offer Automated Attack Disruption. This integration means that, for signals coming from Microsoft Defender XDR, we can trigger the **Disable User** action. These actions are triggered by high-fidelity XDR signals, combined with insights from the continuous investigation of thousands of incidents by Microsoft’s research teams. The action suspends the compromised user account in Active Directory and syncs this information to Microsoft Entra ID. For more information about automatic attack disruption, read [the blog post by Microsoft Defender XDR](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/what-s-new-in-xdr-at-microsoft-ignite/ba-p/3648872).

  You can also exclude specific users from the automated response actions. For more information, see [Configure Defender for Identity automated response exclusions](automated-response-exclusions.md).
- **Remove learning period**: The alerts generated by Defender for Identity are based on various factors such as profiling, deterministic detection, machine learning, and behavioral algorithms that it has learned about your network. The full learning process for Defender for Identity can take up to 30 days per domain controller. However, there might be instances where you would like to receive alerts even before the full learning process has been completed. For example, when you install a new sensor on a domain controller or when you're evaluating the product, you might want to get alerts immediately. In such cases, you can turn off the learning period for the affected alerts by enabling the **Remove learning period** feature. For more information, see [Advanced settings](advanced-settings.md).

- **New way of sending alerts to M365D**: A year ago, we announced that all of [Microsoft Defender for Identity experiences are available in the Microsoft Defender portal](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/all-microsoft-defender-for-identity-features-now-available-in/ba-p/3130037).  Our primary alert pipeline is now gradually switching from *Defender for Identity > Defender for Cloud Apps > Microsoft Defender XDR* to *Defender for Identity > Microsoft Defender XDR*. This integration means that status updates in Defender for Cloud Apps **will not be** reflected in Microsoft Defender XDR and vice versa. This change should significantly reduce the time it takes for alerts to appear in the Microsoft Defender portal. As part of this migration, all Defender for Identity policies will no longer be available in the Defender for Cloud Apps portal as of March 5. As always, we recommend using the Microsoft Defender portal for all Defender for Identity experiences.

- Version includes improvements and bug fixes for internal sensor infrastructure.

## January 2023

### Defender for Identity release 2.197

Released January 22, 2023

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.196

Released January 10, 2023

- New health alert for verifying that Directory Services Object Auditing is configured correctly, as described in the [health alerts page](health-alerts.md#directory-services-object-auditing-is-not-enabled-as-required).

- New health alert for verifying that the sensor’s power settings are configured for optimal performance, as described in the [health alerts page](health-alerts.md#power-mode-is-not-configured-for-optimal-processor-performance).

- We've added [MITRE ATT&CK](https://attack.mitre.org/) information to the IdentityLogonEvents, IdentityDirectoryEvents and IdentityQueryEvents tables in Microsoft Defender XDR Advanced Hunting.  In the **AdditionalFields** column, you can find details about the Attack Techniques and the Tactic (Category) associated with some of our logical activities.

- Since all major Microsoft Defender for Identity features are now available in the Microsoft Defender portal, the portal redirection setting is automatically enabled for each tenant starting January 31, 2023. For more information, see [Redirecting accounts from Microsoft Defender for Identity to Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-security-mdi-redirection#what-to-expect).

## December 2022

### Defender for Identity release 2.195

Released December 7, 2022

- Defender for Identity data centers are now also deployed in the Australia East region. For the most current list of regional deployment, see [Defender for Identity components](architecture.md#defender-for-identity-components).

- Version includes improvements and bug fixes for internal sensor infrastructure.

## November 2022

### Defender for Identity release 2.194

Released November 10, 2022

- New health alert for verifying that Directory Services Advanced Auditing is configured correctly, as described in the [health alerts page](health-alerts.md#directory-services-advanced-auditing-is-not-enabled-as-required).

- Some of the changes introduced in [Defender for Identity release 2.191](#defender-for-identity-release-2191) regarding honeytoken alerts were not enabled properly. Those issues have been resolved now.

- From the end of November, manual integration with Microsoft Defender for Endpoint is no longer supported. However, we highly recommend using the Microsoft Defender portal (<https://security.microsoft.com>) which has the integration built in.

- Version includes improvements and bug fixes for internal sensor infrastructure.

## October 2022

### Defender for Identity release 2.193

Released October 30, 2022

- **New security alert: Abnormal Active Directory Federation Services (AD FS) authentication using a suspicious certificate**  
This new technique is linked with the infamous NOBELIUM actor and was dubbed "MagicWeb" – it allows an adversary to implant a backdoor on compromised AD FS servers, which will enable impersonation as any domain user and thus access to external resources.
To learn more about this attack, read [this blog post](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/protect-your-environment-against-hybrid-identity-attacks/ba-p/3646450).

- Defender for Identity can now use the LocalSystem account on the domain controller to perform remediation actions (enable/disable user, force user reset password), in addition to the gMSA option that was available before. This enables out of the box support for remediation actions. For more information, see [Microsoft Defender for Identity action accounts](deploy/manage-action-accounts.md).

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.192

Released October 23, 2022

- New health alert for verifying that the NTLM Auditing is enabled, as described in the [health alerts page](health-alerts.md#ntlm-auditing-is-not-enabled).

- Version includes improvements and bug fixes for internal sensor infrastructure.

## September 2022

### Defender for Identity release 2.191

Released September 19, 2022

- **More activities to trigger honeytoken alerts**  
Microsoft Defender for Identity offers the ability to define honeytoken accounts, which are used as traps for malicious actors. Any authentication associated with these honeytoken accounts (normally dormant), triggers a honeytoken activity (external ID 2014) alert. New for this version, any LDAP or SAMR query against these honeytoken accounts will trigger an alert. In addition, if event 5136 is audited, an alert will be triggered when one of the attributes of the honeytoken was changed or if the group membership of the honeytoken was changed.

 For more information, see [Configure Windows Event collection](configure-windows-event-collection.md).

### Defender for Identity release 2.190

Released September 11, 2022

- **Updated assessment: Unsecure domain configurations**  
The unsecure domain configuration assessment available through Microsoft Secure Score now assesses the domain controller LDAP signing policy configuration and alerts if it finds an unsecure configuration. For more information, see [Security assessment: Unsecure domain configurations](security-assessment-unsecure-domain-configurations.md).

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.189

Released September 4, 2022

- Version includes improvements and bug fixes for internal sensor infrastructure.

## August 2022

### Defender for Identity release 2.188

Released August 28, 2022

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.187

Released August 18, 2022

- We have changed some of the logic behind how we trigger the [Suspected DCSync attack (replication of directory services) (external ID 2006)](domain-dominance-alerts.md#suspected-dcsync-attack-replication-of-directory-services-external-id-2006) alert. This detector now covers cases where the source IP address seen by the sensor appears to be a NAT device.

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.186

Released August 10, 2022

- Health alerts will now show the sensor's fully qualified domain name (FQDN) instead of the NetBIOS name.

- New health alerts are available for capturing component type and configuration, as described in the [health alerts page](health-alerts.md#sensor-has-issues-with-packet-capturing-component).

- Version includes improvements and bug fixes for internal sensor infrastructure.

## July 2022

### Defender for Identity release 2.185

Released July 18, 2022

- An issue was fixed where [Suspected Golden Ticket usage (nonexistent account) (external ID 2027)](domain-dominance-alerts.md#suspected-golden-ticket-usage-nonexistent-account-external-id-2027) would wrongfully detect macOS devices.

- User actions: We've decided to divide the **Disable User** action on the user page into two different actions:
  - Disable User – which disables the user on the Active Directory level
  - Suspend User – which disables the user on the Microsoft Entra ID level

  We understand that the time it takes to sync from Active Directory to Microsoft Entra ID can be crucial, so now you can choose to disable users in one after the other, to remove the dependency on the sync itself. Note that a user disabled only in Microsoft Entra ID will be overwritten by Active Directory, if the user is still active there.

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.184

Released July 10, 2022

- **New security assessments**  
Defender for Identity now includes the following new security assessment:
  - Unsecure domain configurations  
Microsoft Defender for Identity continuously monitors your environment to identify domains with configuration values that expose a security risk, and reports on these domains to assist you in protecting your environment. For more information, see [Security assessment: Unsecure domain configurations](security-assessment-unsecure-domain-configurations.md).

- The Defender for Identity installation package will now install the Npcap component instead of the WinPcap drivers. For more information, see [WinPcap and Npcap drivers](/defender-for-identity/technical-faq#winpcap-and-npcap-drivers).

- Version includes improvements and bug fixes for internal sensor infrastructure.

## June 2022

### Defender for Identity release 2.183.15436.10558 (Hotfix)

Released June 20, 2022 (updated July 4, 2022)

- New security alert: Suspected DFSCoerce attack using Distributed File System Protocol  
In response to the publishing of a recent attack tool that leverages a flow in the DFS protocol, Microsoft Defender for Identity will trigger a security alert whenever an attacker is using this attack method. To learn more about this attack, [read the blog post](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/how-microsoft-defender-for-identity-protects-against-dfscoerce/ba-p/3562912).

### Defender for Identity release 2.183

Released June 20, 2022

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.182

Released June 4, 2022

- A new **About** page for Defender for Identity is available. You can find it in the [Microsoft Defender portal](https://security.microsoft.com), under **Settings** -> **Identities** -> **About**. It provides several important details about your Defender for Identity instance, including the instance name, version, ID and the geolocation of your instance. This information can be helpful when troubleshooting issues and opening support tickets.
- Version includes improvements and bug fixes for internal sensor infrastructure.

## May 2022

### Defender for Identity release 2.181

Released May 22, 2022

- You can now take [remediation actions](remediation-actions.md) directly on your on-premises accounts, using Microsoft Defender for Identity.
  - **Disable user** – This temporarily prevents a user from logging in to the network. It can help prevent compromised users from moving laterally and attempting to exfiltrate data or further compromise the network.
  - **Reset user password** – This prompts the user to change their password at the next sign-in, ensuring that this account can't be used for further impersonation attempts.

  These actions can be performed from several locations in Microsoft Defender XDR: the user page, the user page side panel, advanced hunting, and even custom detections. This requires setting up a privileged gMSA account that Microsoft Defender for Identity will use to perform the actions. For more information about the requirements, see [Microsoft Defender for Identity action accounts](deploy/manage-action-accounts.md).

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.180

Released May 12, 2022

- New security alert: Suspicious modification of a dNSHostName attribute (CVE-2022-26923)  
In response to the publishing of a recent CVE, Microsoft Defender for Identity will trigger a security alert whenever an attacker is trying to exploit CVE-2022 -26923. To learn more about this attack, read [the blog post](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/detecting-dnshostname-spoofing-with-microsoft-defender-for/ba-p/3352349).

- In version 2.177, we released additional LDAP activities that can be covered by Defender for Identity. However, we found a bug that causes the events not to be presented and ingested in the Defender for Identity portal. This has been fixed in this release. From version 2.180 onward, when you enable event ID 1644 you don't just get visibility into LDAP activities over Active Directory Web Services, but also other LDAP activities will include  the user who performed the LDAP activity on the source computer. This applies for security alerts and logical activities that are based on LDAP events.

- As a response to the recent KrbRelayUp exploitation, we've released a silent detector to help us evaluate our response to this exploitation. The silent detector will allow us to evaluate the effectiveness of the detection, and gather information based on events we're collecting. If this detection will be shown to be in high quality, we'll release a new security alert in the next version.

- We've renamed **Remote code execution over DNS** to **Remote code execution attempt over DNS**, as it better reflects the logic behind these security alerts.

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.179

Released May 1, 2022

- Version includes improvements and bug fixes for internal sensor infrastructure.

## April 2022

### Defender for Identity release 2.178

Released April 10, 2022

- Version includes improvements and bug fixes for internal sensor infrastructure.

## March 2022

### Defender for Identity release 2.177

Released March 27, 2022

- Microsoft Defender for Identity can now monitor additional LDAP queries in your network. These LDAP activities are sent over the Active Directory Web Service protocol and act like normal LDAP queries. To have visibility into these activities, you need to enable event 1644 on your domain controllers. This event covers LDAP activities in your domain and is primarily used to identify expensive, inefficient, or slow Lightweight Directory Access Protocol (LDAP) searches that are serviced by Active Directory domain controllers. For more information, see 
[Legacy configurations](configure-windows-event-collection.md#legacy-configurations).

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.176

Released March 16, 2022

- Beginning with this version, when installing the sensor from a new package, the sensor's version under **Add/Remove Programs** will appear with the full version number (for example, 2.176.x.y), as opposed to the static 2.0.0.0 that was previously shown. It will continue to show that version (the one installed through the package) even though the version will be updated through the automatic updates from the Defender for Identity cloud services. The real version can be seen in the [sensor settings page](https://security.microsoft.com/settings/identities?tabid=sensor) in the portal, in the executable path or in the file version.

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.175

Released March 6, 2022

- Version includes improvements and bug fixes for internal sensor infrastructure.

## February 2022

### Defender for Identity release 2.174

Released February 20, 2022

- We've added the **shost** FQDN of the account involved in the alert to the message sent to the SIEM.  For more information, see [Microsoft Defender for Identity SIEM log reference](cef-format-sa.md).

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.173

Released February 13, 2022

- All Microsoft Defender for Identity features now available in the Microsoft Defender portal. For more information, see [this blog post](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/all-microsoft-defender-for-identity-features-now-available-in/ba-p/3130037).

- This release fixes [issues when installing the sensor on Windows Server 2019 with KB5009557 installed, or on a server with hardened EventLog permissions](troubleshooting-known-issues.md#problem-installing-the-sensor-on-windows-server-2019-with-kb5009557-installed-or-on-a-server-with-hardened-eventlog-permissions).

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.172

Released February 8, 2022

- Version includes improvements and bug fixes for internal sensor infrastructure.

## January 2022

### Defender for Identity release 2.171

Released January 31, 2022

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.170

Released January 24, 2022

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.169

Released January 17, 2022

- We're happy to release the ability to configure an action account for Microsoft Defender for Identity. This is the first step in the ability to take actions on users directly from the product. As first step, you can define the gMSA account Microsoft Defender for Identity will use to take the actions. We highly recommend you start creating these users to enjoy the Actions feature once it's live. For more information, see [Manage action accounts](deploy/manage-action-accounts.md).

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.168

Released January 9, 2022

- Version includes improvements and bug fixes for internal sensor infrastructure.

## December 2021

### Defender for Identity release 2.167

Released December 29, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.166

Released December 27, 2021

- Version includes a new security alert: [Suspicious modification of a sAMNameAccount attribute (CVE-2021-42278 and CVE-2021-42287 exploitation) (external ID 2419)](compromised-credentials-alerts.md#suspicious-modification-of-a-samnameaccount-attribute-cve-2021-42278-and-cve-2021-42287-exploitation-external-id-2419).  
In response to the publishing of recent CVEs, Microsoft Defender for Identity will trigger a security alert whenever an attacker is trying to exploit CVE-2021-42278 and CVE-2021-42287. To learn more about this attack, [read the blog post](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/sam-name-impersonation/ba-p/3042699).
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.165

Released December 6, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

## November 2021

### Defender for Identity release 2.164

Released November 17, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.163

Released November 8, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.162

Released November 1, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

## September 2021

### Defender for Identity release 2.161

Released September 12, 2021

- Version includes new monitored activity: gMSA account password was retrieved by a user. For more information, see [Microsoft Defender for Identity monitored activities](monitored-activities.md#monitored-user-activities-domain-controller-based-user-operations)
- Version includes improvements and bug fixes for internal sensor infrastructure.

## August 2021

### Defender for Identity release 2.160

Released August 22, 2021

- Version includes various improvements and covers more scenarios according to the latest changes in the PetitPotam exploitation.
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.159

Released August 15, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.
- Version includes an improvement to the newly published alert: Suspicious network connection over Encrypting File System Remote Protocol (external ID 2416).  
We extended the support for this detection to trigger when a potential attacker communicating over an encrypted EFS-RPCchannel. Alerts triggered when the channel is encrypted will be treated as a Medium severity alert, as opposed to High when it’s not encrypted. To learn more about the alert, see [Suspicious network connection over Encrypting File System Remote Protocol (external ID 2416)](lateral-movement-alerts.md#suspicious-network-connection-over-encrypting-file-system-remote-protocol-external-id-2416).

### Defender for Identity release 2.158

Released August 8, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.
- Version includes a new security alert: Suspicious network connection over Encrypting File System Remote Protocol (external ID 2416).  
In this detection, Microsoft Defender for Identity will trigger a security alert whenever an attacker is trying to exploit the EFS-RPC against the domain controller. This attack vector is associated with the recent PetitPotam attack. To learn more about the alert, see [Suspicious network connection over Encrypting File System Remote Protocol (external ID 2416)](lateral-movement-alerts.md#suspicious-network-connection-over-encrypting-file-system-remote-protocol-external-id-2416).

- Version includes a new security alert: Exchange Server Remote Code Execution (CVE-2021-26855) (external ID 2414)  
In this detection, Microsoft Defender for Identity will trigger a security alert whenever an attacker tries to change the "msExchExternalHostName" attribute on the Exchange object for remote code execution. To learn more about this alert, see [Exchange Server Remote Code Execution (CVE-2021-26855) (external ID 2414)](lateral-movement-alerts.md#exchange-server-remote-code-execution-cve-2021-26855-external-id-2414). This detection relies on Windows event 4662, so it must be enabled beforehand. For information on how to configure and collect this event, see [Configure Windows Event collection](configure-windows-event-collection.md), and follow the instructions for [Enable auditing on an Exchange object](configure-windows-event-collection.md#enable-auditing-on-an-exchange-object).

### Defender for Identity release 2.157

Released August 1, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

## July 2021

### Defender for Identity release 2.156

Released July 25, 2021

- Starting from this version, we are adding the Npcap driver executable to the sensor installation package. For more information, see [WinPcap and Npcap drivers](/defender-for-identity/technical-faq#winpcap-and-npcap-drivers).
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.155

Released July 18, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.154

Released July 11, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.
- Version includes added improvements and detections for the print spooler exploitation known as PrintNightmare detection, to cover more attack scenarios.

### Defender for Identity release 2.153

Released July 4, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.
- Version includes a new security alert: Suspected Windows Print Spooler service exploitation attempt (CVE-2021-34527 exploitation) (external ID 2415).

  In this detection, Defender for Identity triggers a security alert whenever an attacker tries to exploit the Windows Print Spooler Service against the domain controller. This attack vector is associated with the print spooler exploitation, and is known as PrintNightmare. [Learn more](lateral-movement-alerts.md#suspected-exploitation-attempt-on-windows-print-spooler-service-external-id-2415) about this alert.

## June 2021

### Defender for Identity release 2.152

Released June 27, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.151

Released June 20, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.150

Released June 13, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

## May 2021

### Defender for Identity release 2.149

Released May 31, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.148

Released May 23, 2021

- If you [configure and collect](configure-windows-event-collection.md) event ID 4662, Defender for Identity will report which user made the [Update Sequence Number (USN)](/powershell/module/activedirectory/get-adreplicationuptodatenessvectortable#description) change to various Active Directory object properties. For example, if an account password is changed, and event 4662 is enabled, the event will record who changed the password.
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.147

Released May 9, 2021

- Based on customer feedback, we're increasing the default number of allowed sensors from 200 to 350, and the Directory Services credentials from 10 to 30.
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.146

Released May 2, 2021

- Email notifications for both health issues and security alerts will now have the investigation URL for both Microsoft Defender for Identity and Microsoft Defender XDR.

- Version includes improvements and bug fixes for internal sensor infrastructure.

## April 2021

### Defender for Identity release 2.145

Released April 22, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.144

Released April 12, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

## March 2021

### Defender for Identity release 2.143

Released March 14, 2021

- We've added Windows Event 4741 to detect *computer accounts added to Active Directory* activities. [Configure the new event](configure-windows-event-collection.md) to be collected by Defender for Identity. Once configured, collected events will be available to view in the activity log as well as the Microsoft Defender XDR Advanced Hunting.
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.142

Released March 7, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

## February 2021

### Defender for Identity release 2.141

Released February 21, 2021

- **New security alert: Suspected AS-REP Roasting attack (external ID 2412)**  
Defender for Identity's *Suspected AS-REP Roasting attack (external ID 2412)* security alert is now available. In this detection, a Defender for Identity security alert is triggered when an attacker targets accounts with disabled Kerberos preauthentication, and attempts to obtain Kerberos TGT data. The attacker's intent might be to extract the credentials from the data using offline password cracking attacks. For more information, see [Kerberos AS-REP Roasting exposure (external ID 2412)](compromised-credentials-alerts.md#suspected-as-rep-roasting-attack-external-id-2412).
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.140

Released February 14, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

## January 2021

### Defender for Identity release 2.139

Released January 31, 2021

- We've updated the severity for the Suspected Kerberos SPN exposure to high to better reflect the impact of the alert. For more information about the alert, see [Suspected Kerberos SPN exposure (external ID 2410)](compromised-credentials-alerts.md#suspected-kerberos-spn-exposure-external-id-2410)
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.138

Released January 24, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.137

Released January 17, 2021

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.136

Released January 3, 2021

- Defender for Identity now supports installing sensors on Active Directory Federation Services (AD FS) servers. Installing the sensor on [compatible AD FS Servers](deploy/active-directory-federation-services.md) extends Microsoft Defender for Identity visibility into hybrid environment by monitoring this critical infrastructure component. We also refreshed some of our existing detections ([Suspicious service creation](domain-dominance-alerts.md#suspicious-service-creation-external-id-2026), [Suspected Brute Force attack (LDAP)](compromised-credentials-alerts.md#suspected-brute-force-attack-ldap-external-id-2004), [Account enumeration reconnaissance](reconnaissance-alerts.md#account-enumeration-reconnaissance-external-id-2003)) to work on AD FS data as well. To start deployment of the Microsoft Defender for Identity sensor for AD FS server, [download the latest deployment package](install-sensor.md) from the sensor configuration page.
- Version includes improvements and bug fixes for internal sensor infrastructure.

## December 2020

### Defender for Identity release 2.135

Released December 20, 2020

- We've improved our [Active Directory attributes reconnaissance (LDAP) (external ID 2210)](reconnaissance-alerts.md#active-directory-attributes-reconnaissance-ldap-external-id-2210) alert to also detect techniques used to obtain the information needed in order to generate security tokens, such as seen as part of the [Solorigate campaign](https://aka.ms/solorigate).
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.134

Released December 13, 2020

- Our [recently released NetLogon detector](#azure-atp-release-2127) has been enhanced to also work when the Netlogon channel transaction occurs over an encrypted channel. For more information about the detector, see [Suspected Netlogon privilege elevation attempt](compromised-credentials-alerts.md#suspected-netlogon-priv-elev-2411).
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.133

Released December 6, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

## November 2020

### Defender for Identity release 2.132

Released November 17, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Defender for Identity release 2.131

Released November 8, 2020

- **New security alert: Suspected Kerberos SPN exposure (external ID 2410)**  
Defender for Identity's *Suspected Kerberos SPN exposure (external ID 2410)* security alert is now available. In this detection, a Defender for Identity security alert is triggered when an attacker enumerates service accounts and their respective SPNs, and then requests Kerberos TGS tickets for the services. The attacker's intent might be to extract the hashes from the tickets and save them for later use in offline brute force attacks. For more information, see [Kerberos SPN exposure](compromised-credentials-alerts.md#suspected-kerberos-spn-exposure-external-id-2410).
- Version includes improvements and bug fixes for internal sensor infrastructure.

## October 2020

### Defender for Identity release 2.130

Released October 25, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.129

Released October 18, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

## September 2020

### Azure ATP release 2.128

Released September 27, 2020

- **Modified email notifications configuration**  
We are removing the **Mail notification** toggles for turning on email notifications. To receive email notifications, simply add an address. For more information, see [Set notifications](notifications.md).
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.127

Released September 20, 2020

- **New security alert: Suspected Netlogon privilege elevation attempt (external ID 2411)**  
Azure ATP's *Suspected Netlogon privilege elevation attempt (CVE-2020-1472 exploitation) (external ID 2411)* security alert is now available. In this detection, an Azure ATP security alert is triggered when an attacker establishes a vulnerable Netlogon secure channel connection to a domain controller, using the Netlogon Remote Protocol ([MS-NRPC](/openspecs/windows_protocols/ms-nrpc/ff8f970f-3e37-40f7-bd4b-af7336e4792f)), also known as *Netlogon Elevation of Privilege Vulnerability*. For more information, see [Suspected Netlogon privilege elevation attempt](compromised-credentials-alerts.md#suspected-netlogon-priv-elev-2411).
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.126

Released September 13, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.125

Released September 6, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

## August 2020

### Azure ATP release 2.124

Released August 30, 2020

- **New security alerts**  
Azure ATP security alerts now include the following new detections:
  - **Active Directory attributes reconnaissance (LDAP) (external ID 2210)**  
In this detection, an Azure ATP security alert is triggered when an attacker is suspected of successfully gaining critical information about the domain for use in their attack kill chain. For more information, see [Active Directory attributes reconnaissance](reconnaissance-alerts.md#active-directory-attributes-reconnaissance-ldap-external-id-2210).
  - **Suspected rogue Kerberos certificate usage (external ID 2047)**  
In this detection, an Azure ATP security alert is triggered when an attacker that has gained control over the organization by compromising the certificate authority server is suspected of generating certificates that can be used as backdoor accounts in future attacks, such as moving laterally in your network. For more information, see [Suspected rogue Kerberos certificate usage](lateral-movement-alerts.md#suspected-rogue-kerberos-certificate-usage-external-id-2047).
  - **Suspected golden ticket usage (ticket anomaly using RBCD) (external ID 2040)**  
Attackers with domain admin rights can compromise the KRBTGT account. Using the KRBTGT account, they can create a Kerberos ticket-granting ticket (TGT) that provides authorization to any resource.  
This forged TGT is called a "Golden Ticket" because it allows attackers to achieve lasting network persistence using Resource Based Constrained Delegation (RBCD). Forged Golden Tickets of this type have unique characteristics this new detection is designed to identify.
For more information, see [Suspected golden ticket usage (ticket anomaly using RBCD)](domain-dominance-alerts.md#suspected-golden-ticket-usage-ticket-anomaly-using-rbcd-external-id-2040).
- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.123

Released August 23, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.122

Released August 16, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.121

Released August 2, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

## July 2020

### Azure ATP release 2.120

Released July 26, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.119

Released July 5, 2020

- **Feature enhancement: New *Excluded domain controllers* tab in Excel report**  
To improve the accuracy of our domain controller coverage calculation, we will be excluding domain controllers with external trusts from the calculation toward achieving 100% coverage. Excluded domain controllers will be surfaced in the new *excluded domain controllers* tab in the domain coverage Excel report download. For information about downloading the report, see [Domain controller status](/defender-for-identity/sensor-settings#domain-controller-status).
- Version includes improvements and bug fixes for internal sensor infrastructure.

## June 2020

### Azure ATP release 2.118

Released June 28, 2020

- **New security assessments**  
Azure ATP security assessments now include the following new assessments:
  - **Riskiest lateral movement paths**  
    This assessment continuously monitors your environment to identify **sensitive** accounts with the riskiest lateral movement paths that expose a security risk, and reports on these accounts to assist you in managing your environment. Paths are considered risky if they have three or more non-sensitive accounts that can expose the sensitive account to credential theft by malicious actors. For more information, see [Security assessment: Riskiest lateral movement paths (LMP)](/defender-for-identity/security-assessment-riskiest-lmp).
  - **Unsecure account attributes**  
    This assessment Azure ATP continuously monitors your environment to identify accounts with attribute values that expose a security risk, and reports on these accounts to assist you in protecting your environment. For more information, see [Security assessment: Unsecure account attributes](/defender-for-identity/security-assessment-unsecure-account-attributes).

- **Updated sensitivity definition**  
We are expanding our sensitivity definition for on-premises accounts to include entities that are allowed to use Active Directory replication.

### Azure ATP release 2.117

Released June 14, 2020

- **Feature enhancement: Additional activity details available in the unified SecOps experience**  
We've extended the device information we send to Defender for Cloud Apps including device names, IP addresses, account UPNs and used port. For more information about our integration with Defender for Cloud Apps, see [Using Azure ATP with Defender for Cloud Apps](/defender-for-identity/deploy-defender-identity).

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.116

Released June 7, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

## May 2020

### Azure ATP release 2.115

Released May 31, 2020

- **New security assessments**  
Azure ATP security assessments now include the following new assessments:
  - **Unsecure SID History attributes**  
    This assessment reports on SID History attributes that can be used by malicious attackers to gain access to your environment. For more information, see [Security assessment: Unsecure SID History attributes](/defender-for-identity/security-assessment-unsecure-sid-history-attribute).
  - **Microsoft LAPS usage**  
    This assessment reports on local administrator accounts not using Microsoft's "Local Administrator Password Solution" (LAPS) to secure their passwords. Using LAPS simplifies password management and also helps defend against cyberattacks. For more information, see [Security assessment: Microsoft LAPS usage](/defender-for-identity/security-assessment-laps).

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.114

Released May 17, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.113

Released May 5, 2020

- **Feature enhancement: Enriched Resource Access Activity with NTLMv1**  
Starting from this version, Azure ATP now provides information for resource access activities showing whether the resource uses NTLMv1 authentication. This resource configuration is unsecure and poses a risk that malicious actors can force the application to their advantage. For more information about the risk, see [Legacy protocols usage](/defender-for-identity/security-assessment-legacy-protocols).

- **Feature enhancement: Suspected Brute Force attack (Kerberos, NTLM) alert**  
Brute Force attack is used by attackers to gain a foothold into your organization and is a key method for threat and risk discovery in Azure ATP. To help you focus on the critical risks to your users, this update makes it easier and faster to analyze and remediate risks, by limiting and prioritizing the volume of alerts.

## March 2020

### Azure ATP release 2.112

Released Mar 15, 2020

- **New Azure ATP instances automatically integrate with Microsoft Defender for Cloud Apps**  
When creating an Azure ATP instance (formerly instance), the integration with Microsoft Defender for Cloud Apps is enabled by default. For more information about the integration, see [Using Azure ATP with Microsoft Defender for Cloud Apps](/defender-for-identity/deploy-defender-identity).

- **New monitored activities**  
The following activity monitors are now available:
  - Interactive Logon with Certificate
  - Failed Logon with Certificate
  - Delegated Resource Access

    Learn more about which [activities Azure ATP monitors](monitored-activities.md), and how to [filter and search monitored activities](/defender-for-identity/monitored-activities) in the portal.

- **Feature enhancement: Enriched Resource Access Activity**  
Starting from this version, Azure ATP now provides information for resource access activities showing whether the resource is trusted for unconstrained delegation. This resource configuration is unsecure and poses a risk that malicious actors can force the application to their advantage. For more information about the risk, see [Security assessment: Unsecure Kerberos delegation](/defender-for-identity/security-assessment-unconstrained-kerberos).

- **Suspected SMB packet manipulation (CVE-2020-0796 exploitation) - (preview)**  
Azure ATP's [Suspected SMB packet manipulation](lateral-movement-alerts.md) security alert is now in public preview. In this detection, an Azure ATP security alert is triggered when SMBv3 packet suspected of exploiting the [CVE-2020-0796](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2020-0796) security vulnerability are made against a domain controller in the network.

### Azure ATP release 2.111

Released Mar 1, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

## February 2020

### Azure ATP release 2.110

Released Feb 23, 2020

- **New security assessment: Unmonitored domain controllers**  
Azure ATP security assessments now include a report on unmonitored domain controllers, servers without a sensor, to help you in managing full coverage of your environment. For more information, see [Unmonitored domain controllers](/defender-for-identity/security-assessment-unmonitored-domain-controller).

### Azure ATP release 2.109

Released Feb 16, 2020

- **Feature enhancement: Sensitive entities**  
Starting from this version (2.109), machines identified as Certificate Authority, DHCP, or DNS Servers by Azure ATP are now automatically tagged as **Sensitive**.

### Azure ATP release 2.108

Released Feb 9, 2020

- **New feature: Support for group Managed Service Accounts**  
Azure ATP now supports using group Managed Service Accounts (gMSA) for improved security when connecting Azure ATP sensors to your Microsoft Entra forests. For more information about using gMSA with Azure ATP sensors, see [Connect to your Active Directory Forest](/defender-for-identity/directory-service-accounts#prerequisites).

- **Feature enhancement: Scheduled report with too much data**  
When a scheduled report has too much data, the email now informs you of the fact by displaying the following text: There was too much data during the specified period to generate a report. This replaces the previous behavior of only discovering the fact after clicking the report link in the email.

- **Feature enhancement: Updated domain controller coverage logic**  
We've updated our domain controller coverage report logic to include additional information from Microsoft Entra ID, resulting in a more accurate view of domain controllers without sensors on them. This new logic should also have a positive effect on the corresponding Microsoft Secure Score.

### Azure ATP release 2.107

Released Feb 3, 2020

- **New monitored activity: SID history change**  
SID history change is now a monitored and filterable activity. Learn more about which [activities Azure ATP monitors](monitored-activities.md), and how to [filter and search monitored activities](/defender-for-identity/monitored-activities) in the portal.

- **Feature enhancement: Closed or suppressed alerts are no longer reopened**  
Once an alert is closed or suppressed in the Azure ATP portal, if the same activity is detected again within a short period of time, a new alert is opened. Previously, under the same conditions, the alert was reopened.

- **TLS 1.2 required for portal access and sensors**  
TLS 1.2 is now required to use Azure ATP sensors and the cloud service. Access to the Azure ATP portal will no longer be possible using browsers that do not support TLS 1.2.

## January 2020

### Azure ATP release 2.106

Released Jan 19, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.105

Released Jan 12, 2020

- Version includes improvements and bug fixes for internal sensor infrastructure.

## December 2019

### Azure ATP release 2.104

Released Dec 23, 2019

- **Sensor version expirations eliminated**  
Azure ATP sensor deployment and sensor installation packages no longer expire after a number of versions and now only update themselves once. The result of this feature is that previously downloaded sensor installation packages can now be installed even if they are older than our max number of lapsed versions.

- **Confirm compromise**  
You can now confirm compromise of specific Microsoft 365 users and set their risk level to **high**. This workflow allows your security operations teams another response capability to reduce their security incidents Time-To-Resolve thresholds. Learn more about [how to confirm compromise](/cloud-app-security/tutorial-ueba?branch=pr-en-us-1204#phase-4-protect-your-organization) using Azure ATP and Defender for Cloud Apps.

- **New experience banner**  
On Azure ATP portal pages where a new experience is available in the Defender for Cloud Apps portal, new banners are displayed describing what's available with access links.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.103

Released Dec 15, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.102

Released Dec 8, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

## November 2019

### Azure ATP release 2.101

Released Nov 24, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.100

Released Nov 17, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.99

Released November 3, 2019

- **Feature enhancement:  Added user interface notification of Defender for Cloud Apps portal availability to the Azure ATP portal**  
Ensuring all users are aware of the availability of the enhanced features available using the Defender for Cloud Apps portal, notification was added for the portal from the existing Azure ATP alert timeline.

- Version includes improvements and bug fixes for internal sensor infrastructure.

## October 2019

### Azure ATP release 2.98

Released October 27, 2019

- **Feature enhancement: Suspected brute force attack alert**  
Improved the [Suspected brute force attack (SMB)](compromised-credentials-alerts.md#suspected-brute-force-attack-smb-external-id-2033) alert using additional analysis, and improved detection logic to reduce **benign true positive (B-TP)** and **false positive (FP)** alert results.

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.97

Released October 6, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

## September 2019

### Azure ATP release 2.96

Released September 22, 2019

- **Enriched NTLM authentication data using Windows Event 8004**  
Azure ATP sensors are now able to automatically read and enrich the NTLM authentications activities with your accessed server data when NTLM auditing is enabled, and Windows Event 8004 is turned on. Azure ATP parses Windows Event 8004 for NTLM authentications in order to enrich the NTLM authentication data used for Azure ATP threat analysis and alerts. This enhanced capability provides resource access activity over NTLM data as well as enriched failed logon activities including the destination computer which the user attempted but failed to access.

  Learn more about NTLM authentication activities [using Windows Event 8004](configure-windows-event-collection.md#configure-ntlm-auditing).

- Version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.95

Released September 15, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.94

Released September 8, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.93

Released September 1, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

## August 2019

### Azure ATP release 2.92

Released August 25, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.91

Released August 18, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.90

Released August 11, 2019

- Version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.89

Released August 4, 2019

- **Sensor method improvements**  
To avoid excess NTLM traffic generation in creation of accurate Lateral Movement Path (LMP) assessments, improvements have been made to Azure ATP sensor methods to rely less on NTLM usage and make more significant use of Kerberos.

- **Alert enhancement: Suspected Golden Ticket usage (nonexistent account)**  
SAM name changes have been added to the supporting evidence types listed in this type of alert. To learn more about the alert, including how to prevent this type of activity and remediate, see  [Suspected Golden Ticket usage (nonexistent account)](domain-dominance-alerts.md#suspected-golden-ticket-usage-nonexistent-account-external-id-2027).

- **General availability: Suspected NTLM authentication tampering**  
The [Suspected NTLM authentication tampering](lateral-movement-alerts.md#suspected-ntlm-authentication-tampering-external-id-2039) alert is no longer in preview mode and is now generally available.

- Version includes improvements and bug fixes for internal sensor infrastructure.

## July 2019

### Azure ATP release 2.88

Released July 28, 2019

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.87

Released July 21, 2019

- **Feature enhancement: Automated Syslog event collection for Azure ATP standalone sensors**  
Incoming Syslog connections for Azure ATP standalone sensors are now fully automated, while removing the toggle option from the configuration screen. These changes have no effect on outgoing Syslog connections.

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.86

Released July 14, 2019

- **New security alert: Suspected NTLM authentication tampering (external ID 2039)**  
Azure ATP's new [Suspected NTLM authentication tampering](lateral-movement-alerts.md#suspected-ntlm-authentication-tampering-external-id-2039) security alert is now in public preview.    In this detection, an Azure ATP security alert is triggered when use of "man-in-the-middle" attack is suspected of successfully bypassing NTLM Message Integrity Check (MIC), a security vulnerability detailed in Microsoft [CVE-2019-040](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2019-1040). These types of attacks attempt to downgrade NTLM security features and successfully authenticate, with the ultimate goal of making successful lateral movements.

- **Feature enhancement: Enriched device operating system identification**  
Until now, Azure ATP provided entity device operating system information based on the available attribute in Active Directory. Previously, if operating system information was unavailable in Active Directory, the information was also unavailable on Azure ATP entity pages. Starting from this version, Azure ATP now provides this information for devices where Active Directory doesn't have the information, or are not registered in Active Directory, by using enriched device operating system identification methods.

    The addition of enriched device operating system identification data helps identify unregistered and non-Windows devices, while simultaneously aiding in your investigation process. For learn more about Network Name Resolution in Azure ATP, see [Understanding Network Name Resolution (NNR)](nnr-policy.md).  

- **New feature: Authenticated proxy - preview**  
Azure ATP now supports authenticated proxy. Specify the proxy URL using the sensor command line and specify Username/Password to use proxies that require authentication. For more information about how to use authenticated proxy, see [Configure the proxy](configure-proxy.md).

- **Feature enhancement: Automated domain synchronizer process**  
The process of designating and tagging domain controllers as domain synchronizer candidates during setup and ongoing configuration is now fully automated. The toggle option to manually select domain controllers as domain synchronizer candidates is removed.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.85

Released July 7, 2019

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.84

Released July 1, 2019

- **New location support: Azure UK data center**  
Azure ATP instances are now supported in the Azure UK data center. To learn more about creating Azure ATP instances and their corresponding data center locations, see [Step 1 of Azure ATP installation](/defender-for-identity/deploy-defender-identity).

- **Feature enhancement: New name and features for the Suspicious additions to sensitive groups alert (external ID 2024)**  
The **Suspicious additions to sensitive groups** alert was previously named the **Suspicious modifications to sensitive groups** alert. The external ID of the alert (ID 2024) remains the same. The descriptive name change more accurately reflects the purpose of alerting on additions to your **sensitive** groups. The enhanced alert also features new evidence and improved descriptions. For more information, see [Suspicious additions to sensitive groups](domain-dominance-alerts.md#suspicious-additions-to-sensitive-groups-external-id-2024).  

- **New documentation feature: Guide for moving from Advanced Threat Analytics to Azure ATP**  
This new article includes prerequisites, planning guidance, as well as configuration and verification steps for moving from ATA to Azure ATP service. For more information, see [Move from ATA to Azure ATP](migrate-from-ata-overview.md).

- This version also includes improvements and bug fixes for internal sensor infrastructure.

## June 2019

### Azure ATP release 2.83

Released June 23, 2019

- **Feature enhancement: Suspicious service creation alert (external ID 2026)**  
This alert now features an improved alert page with additional evidence and a new description. For more information, see [Suspicious service creation security alert](domain-dominance-alerts.md#suspicious-service-creation-external-id-2026).

- **Instance naming support: Support added for digit only domain prefix**  
Support added for Azure ATP instance creation using initial domain prefixes that only contain digits. For example, use of digit only initial domain prefixes such as  123456.contoso.com are now supported.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.82

Released June 18, 2019

- **New public preview**  
Azure ATP's identity threat investigation experience is now in **Public Preview**, and available to all Azure ATP protected tenants. See [Azure ATP Microsoft Defender for Cloud Apps investigation experience](/defender-for-identity/deploy-defender-identity) to learn more.

- **General availability**  
Azure ATP support for untrusted forests is now in general availability. See [Azure ATP multi-forest](deploy/multi-forest.md) to learn more.

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.81

Released June 10, 2019

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.80

Released June 2, 2019

- **Feature enhancement: Suspicious VPN connection alert**  
This alert now includes enhanced evidence and texts for better usability. For more information about alert features, and suggested remediation steps and prevention, see the [Suspicious VPN connection alert description](compromised-credentials-alerts.md#suspicious-vpn-connection-external-id-2025).

- This version also includes improvements and bug fixes for internal sensor infrastructure.

## May 2019

### Azure ATP release 2.79

Released May 26, 2019

- **General availability: Security principal reconnaissance (LDAP) (external ID 2038)**

    This alert is now in GA (general availability). For more information about the alert,  alert features and suggested remediation and prevention, see the [Security principal reconnaissance (LDAP) alert description](reconnaissance-alerts.md#security-principal-reconnaissance-ldap-external-id-2038)

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.78

Released May 19, 2019

- **Feature enhancement: Sensitive entities**  
Manual Sensitive tagging for Exchange Servers

    You can now manually tag entities as Exchange Servers during configuration.

    To manually tag an entity as an Exchange Server:

    1. In the Azure ATP portal, select **Configuration**.
    2. Under **Detection**, select **Entity tags**, then select **Sensitive**.
    3. Select **Exchange Servers** and then add the entity you wish to tag.

    After tagging a computer as an Exchange Server, it will be tagged as Sensitive and display that it was tagged as an Exchange Server.  The Sensitive tag will appear in the computer's entity profile, and the computer will be considered in all detections that are based on Sensitive accounts and Lateral Movement Paths.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.77

Released May 12, 2019

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.76

Released May 6, 2019

- This version includes improvements and bug fixes for internal sensor infrastructure.

## April 2019

### Azure ATP release 2.75

Released April 28, 2019

- **Feature enhancement: Sensitive entities**  
Starting from this version (2.75), machines identified as Exchange Servers by Azure ATP are now automatically tagged as **Sensitive**.  

    Entities that are automatically tagged as **Sensitive** because they function as Exchange Servers list this classification as the reason they are tagged.

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.74

Releasing April 14, 2019

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.73

Released April 10, 2019

- This version includes improvements and bug fixes for internal sensor infrastructure.

## March 2019

### Azure ATP release 2.72

Released March 31, 2019

- **Feature enhancement: Lateral Movement Path (LMP) scoped depth**  
Lateral movement paths (LMPs) are a key method for threat and risk discovery in Azure ATP. To help keep focus on the critical risks to your most sensitive users, this update makes it easier and faster to analyze and remediate risks to the sensitive users on each LMP, by limiting the scope and depth of each graph displayed.

    See [Lateral Movement Paths](/defender-for-identity/understand-lateral-movement-paths) to learn more about how Azure ATP uses LMPs to surface access risks to each entity in your environment.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.71

Released March 24, 2019

- **Feature enhancement: Network Name Resolution (NNR) health alerts**  
Health alerts were added for confidence levels associated with Azure ATP security alerts that are based on NNR. Each health alert includes actionable and detailed recommendations to help resolve low NNR success rates.

    See [What is Network Name Resolution](nnr-policy.md) to learn more about how Azure ATP uses NNR and why it's important for alert accuracy.

- **Server support: Support added for Server 2019 with use of KB4487044**  
Support added for use of Windows Server 2019, with a patch level of KB4487044. Use of Server 2019 without the patch is not supported, and is blocked starting from this update.

- **Feature enhancement: User-based alert exclusion**  
Extended alert exclusion options now allow for excluding specific users from specific alerts. Exclusions can help avoid situations where use or configuration of certain types of internal software repeatedly triggered benign security alerts.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.70

Released March 17, 2019

- **Feature enhancement: Network Name Resolution (NNR) confidence level added to multiple alerts**  Network Name Resolution or (NNR) is used to help positively identify the source entity identity of suspected attacks. By adding the NNR confidence levels to Azure ATP alert evidence lists, you can now instantly assess and understand the level of NNR confidence related to the possible sources identified, and remediate appropriately.

    NNR confidence level evidence was added to the following alerts:
  - [Network mapping reconnaissance (DNS)](reconnaissance-alerts.md#network-mapping-reconnaissance-dns-external-id-2007)
  - [Suspected identity theft (pass-the-ticket)](lateral-movement-alerts.md#suspected-identity-theft-pass-the-ticket-external-id-2018)
  - [Suspected NTLM relay attack (Exchange account)-preview](lateral-movement-alerts.md#suspected-ntlm-relay-attack-exchange-account-external-id-2037)
  - [Suspected DCSync attack (replication of directory services)](domain-dominance-alerts.md#suspected-dcsync-attack-replication-of-directory-services-external-id-2006)

- **Additional health alert scenario: Azure ATP sensor service failed to start**  
In instances where the Azure ATP sensor failed to start due to a network capturing driver issue, a sensor health alert is now triggered. [Troubleshooting Azure ATP sensor with Azure ATP logs](troubleshooting-using-logs.md) for more information about Azure ATP logs and how to use them.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.69

Released March 10, 2019

- **Feature enhancement: Suspected identity theft (pass-the-ticket) alert**   This alert now features new evidence showing the details of connections made by using remote desktop protocol (RDP). The added evidence makes it easy to remediate the known issue of (B-TP) Benign-True Positive alerts caused by use of Remote Credential Guard over RDP connections.

- **Feature enhancement: Remote code execution over DNS alert**  
This alert now features new evidence showing your domain controller security update status, informing you when updates are required.

- **New documentation feature: Azure ATP Security alert MITRE ATT&CK Matrix&trade;**  
To explain and make it easier to map the relationship between Azure ATP security alerts and the familiar MITRE ATT&CK Matrix, we've added the relevant MITRE techniques to Azure ATP security alert listings. This additional reference makes it easier to understand the suspected attack technique potentially in use when an Azure ATP security alert is triggered. Learn more about the [Azure ATP security alert guide](/defender-for-identity/alerts-overview).  

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.68

Released March 3, 2019

- **Feature enhancement: Suspected brute force attack (LDAP) alert**  
Significant usability improvements were made to this security alert including a revised description, provision of additional source information, and guess attempt details for faster remediation.  
Learn more about [Suspected brute force attack (LDAP)](compromised-credentials-alerts.md#suspected-brute-force-attack-ldap-external-id-2004) security alerts.

- **New documentation feature: Security alert lab**  
To explain the power of Azure ATP in detecting the real threats to your working environment, we've added a new **Security alert lab** to this documentation. The **Security alert lab** helps you quickly set up a lab or testing environment, and explains the best defensive posturing against common, real-world threats and attacks.  

    The [step-by-step lab](/defender-for-identity/what-is) is designed to ensure you spend minimal time building, and more time learning about your threat landscape and available Azure ATP alerts and protection. We're excited to hear your feedback.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

## February 2019

### Azure ATP release 2.67

Released February 24, 2019

- **New security alert: Security principal reconnaissance (LDAP) – (preview)**  
Azure ATP's [Security principal reconnaissance (LDAP) - preview](reconnaissance-alerts.md#security-principal-reconnaissance-ldap-external-id-2038) security alert is now in public preview.    In this detection, an Azure ATP security alert is triggered when security principal reconnaissance is used by attackers to gain critical information about the domain environment. This information helps attackers map the domain structure, as well as identify privileged accounts for use in later steps in their attack kill chain.

    Lightweight Directory Access Protocol (LDAP) is one the most popular methods used for both legitimate and malicious purposes to query Active Directory. LDAP focused security principal reconnaissance is commonly used as the first phase of a Kerberoasting attack. Kerberoasting attacks are used to get a target list of Security Principal Names (SPNs), which attackers then attempt to get Ticket Granting Server (TGS) tickets for.

- **Feature enhancement: Account enumeration reconnaissance (NTLM) alert**  
Improved **Account enumeration reconnaissance (NTLM)** alert using additional analysis, and improved detection logic to reduce **B-TP** and **FP** alert results.

- **Feature enhancement: Network mapping reconnaissance (DNS) alert**  
New types of detections added to Network mapping reconnaissance (DNS) alerts. In addition to detecting suspicious AXFR requests, Azure ATP now detects suspicious types of requests originating from non-DNS servers using an excessive number of requests.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.66

Released February 17, 2019

- **Feature enhancement: Suspected DCSync attack (replication of directory services) alert**  
Usability improvements were made to this security alert including a revised description, provision of additional source information, new infographic, and more evidence.
Learn more about [Suspected DCSync attack (replication of directory services)](domain-dominance-alerts.md#suspected-dcsync-attack-replication-of-directory-services-external-id-2006) security alerts.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.65

Released February 10, 2019

- **New security alert: Suspected NTLM relay attack (Exchange account) – (preview)**  
Azure ATP's [Suspected NTLM relay attack (Exchange account) - preview](lateral-movement-alerts.md#suspected-ntlm-relay-attack-exchange-account-external-id-2037) security alert is now in public preview.    In this detection, an Azure ATP security alert is triggered when use of Exchange account credentials from a suspicious source is identified. These types of attacks attempt to leverage NTLM relay techniques to gain domain controller exchange privileges and are known as **ExchangePriv**. Learn more about the **ExchangePriv** technique from the [ADV190007 advisory](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/ADV190007) first published January 31, 2019, and the [Azure ATP alert response](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/How-to-win-the-latest-security-race-over-NTLM-relay/ba-p/334511).  

- **General availability: Remote code execution over DNS**  
This alert is now in GA (general availability). For more information and alert features, see the [Remote code execution over DNS alert description page](lateral-movement-alerts.md#remote-code-execution-attempt-over-dns-external-id-2036).

- **General availability: Data exfiltration over SMB**  
This alert is now in GA (general availability). For more information and alert features, see the [Data exfiltration over SMB alert description page](exfiltration-alerts.md#data-exfiltration-over-smb-external-id-2030).

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.64

Released February 4, 2019

- **General availability: Suspected Golden Ticket usage (ticket anomaly)**  
This alert is now in GA (general availability). For more information and alert features, see the [Suspected Golden Ticket usage (ticket anomaly) alert description page](domain-dominance-alerts.md#suspected-golden-ticket-usage-ticket-anomaly-external-id-2032).

- **Feature enhancement: Network mapping reconnaissance (DNS)**  
Improved alert detection logic deployed for this alert to minimize false-positives and alert noise. This alert now has a learning period of eight days before the alert will possibly trigger for the first time. For more information about this alert, see [Network mapping reconnaissance (DNS) alert description page](reconnaissance-alerts.md#network-mapping-reconnaissance-dns-external-id-2007).

    **Due to the enhancement of this alert, the nslookup method should no longer be used to test Azure ATP connectivity during initial configuration.**

- **Feature enhancement:**  
This version includes redesigned alert pages, and new evidence, providing better alert investigation.
  - [Suspected brute force attack (SMB)](compromised-credentials-alerts.md#suspected-brute-force-attack-smb-external-id-2033)
  - [Suspected Golden Ticket usage (time anomaly) alert description page](domain-dominance-alerts.md#suspected-golden-ticket-usage-time-anomaly-external-id-2022)
  - [Suspected overpass-the-hash attack (Kerberos)](lateral-movement-alerts.md#suspected-overpass-the-hash-attack-kerberos-external-id-2002)
  - [Suspected use of Metasploit hacking framework](compromised-credentials-alerts.md#suspected-use-of-metasploit-hacking-framework-external-id-2034)
  - [Suspected WannaCry ransomware attack](compromised-credentials-alerts.md#suspected-wannacry-ransomware-attack-external-id-2035)

- This version also includes improvements and bug fixes for internal sensor infrastructure.

## January 2019

### Azure ATP release 2.63

Released January 27, 2019

- **New feature: Untrusted forest support – (preview)**  
Azure ATP's support for sensors in untrusted forests is now in public preview.
From the Azure ATP portal **Directory services** page, configure additional sets of credentials to enable Azure ATP sensors to connect to different Active Directory forests, and report back to the Azure ATP service. See [Azure ATP multi-forest](deploy/multi-forest.md) to learn more.

- **New feature: Domain controller coverage**  
Azure ATP now provides coverage information for Azure ATP monitored domain controllers.  
From the Azure ATP portal **Sensors** page, view the number of the monitored and unmonitored domain controllers detected by Azure ATP in your environment. Download the monitored domain controller list for further analysis, and to build an action plan. See the [Domain controller monitoring](/defender-for-identity/sensor-settings) how-to guide to learn more.

- **Feature enhancement: Account enumeration reconnaissance**  
The Azure ATP account enumeration reconnaissance detection now detects and issues alerts for enumeration attempts using Kerberos and NTLM. Previously, the detection only worked for attempts using Kerberos. See [Azure ATP reconnaissance alerts](reconnaissance-alerts.md#account-enumeration-reconnaissance-external-id-2003) to learn more.

- **Feature enhancement: Remote code execution attempt alert**
  - All remote execution activities, such as service creation, WMI execution, and the new **PowerShell** execution, were added to the profile timeline of the destination machine. The destination machine is the domain controller the command was executed on.
  - **PowerShell** execution was added to the list of remote code execution activities listed in the entity profile alert timeline.
  - See [Remote code execution attempt](domain-dominance-alerts.md#remote-code-execution-attempt-external-id-2019) to learn more.  

- **Windows Server 2019 LSASS issue and Azure ATP**  
In response to customer feedback regarding Azure ATP usage with domain controllers running Windows Server 2019, this update includes additional logic to avoid triggering the reported behavior on Windows Server 2019 machines. Full support for Azure ATP sensor on Windows Server 2019 is planned for a future Azure ATP update, however installing and running Azure ATP on Windows Servers 2019 is **not** currently supported. See [Azure ATP sensor requirements](prerequisites.md#) to learn more.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.62

Released January 20, 2019

- **New security alert: Remote code execution over DNS – (preview)**  
Azure ATP's [Remote code execution over DNS](lateral-movement-alerts.md#remote-code-execution-attempt-over-dns-external-id-2036) security alert is now in public preview.    In this detection, an Azure ATP security alert is triggered when DNS queries suspected of exploiting security vulnerability [CVE-2018-8626](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2018-8626) are made against a domain controller in the network.

- **Feature Enhancement: 72 hour delayed sensor update**  
Changed option to delay sensor updates on selected sensors to 72 hours (instead of the previous 24-hour delay) after each release update of Azure ATP. See [Azure ATP sensor update](/defender-for-identity/sensor-settings) for configuration instructions.

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.61

Released January 13, 2019

- **New Security Alert: Data exfiltration over SMB - (preview)**  
Azure ATP's [Data exfiltration over SMB](exfiltration-alerts.md) security alert is now in public preview. Attackers with domain admin rights can compromise the KRBTGT account. Using the KRBTGT account, attackers can create a Kerberos ticket granting ticket (TGT) that provide authorization to any resource.

- **Feature Enhancement: Remote code execution attempt** security alert  
A new alert description and additional evidence were added to help make the alert easier to understand, and provide better investigation workflows.

- **Feature Enhancement: DNS query logical activities**  
Additional query types were added to [Azure ATP monitored activities](monitored-activities.md) including: **TXT**, **MX**, **NS**, **SRV**, **ANY**, **DNSKEY**.

- **Feature Enhancement: Suspected Golden Ticket usage (ticket anomaly) and Suspected Golden Ticket usage (nonexistent account)**  
Improved detection logic has been applied to both alerts to reduce the number of FP alerts, and deliver more accurate results.

- **Feature Enhancement: Azure ATP Security Alert documentation**  
Azure ATP security alert documentation has been enhanced and expanded to include better alert descriptions, more accurate alert classifications, and explanations of evidence, remediation, and prevention. Get familiar with the new security alert documentation design using the following links:
  - [Azure ATP Security Alerts](/defender-for-identity/alerts-overview)
  - [Understanding security alerts](understanding-security-alerts.md)
    - [Reconnaissance phase alerts](reconnaissance-alerts.md)
    - [Compromised credential phase alerts](compromised-credentials-alerts.md)
    - [Lateral movement phase alerts](lateral-movement-alerts.md)
    - [Domain dominance phase alerts](domain-dominance-alerts.md)
    - [Exfiltration phase alerts](exfiltration-alerts.md)
  - [Investigate a computer](/defender-for-identity/investigate-assets)
  - [Investigate a user](/defender-for-identity/investigate-assets)

- This version also includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.60

Released January 6, 2019

- This version includes improvements and bug fixes for internal sensor infrastructure.

## December 2018

### Azure ATP release 2.59

Released December 16, 2018

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.58

Released December 9, 2018

- **Security Alert Enhancement: Unusual Protocol Implementation alert split**  
Azure ATP's series of Unusual Protocol Implementation security alerts that previously shared 1 externalId (2002), are now split into four distinctive alerts, with a corresponding unique external ID.

#### New alert externalIds

> |New security alert name|Previous security alert name|Unique external ID|
> |---------|----------|---------|
> |Suspected brute force attack (SMB)|Unusual protocol implementation (potential use of malicious tools such as Hydra)|2033
> |Suspected overpass-the-hash attack (Kerberos)|Unusual Kerberos protocol implementation (potential overpass-the-hash attack)|2002|
> |Suspected use of Metasploit hacking framework|Unusual protocol implementation (potential use of Metasploit hacking tools)|2034
> |Suspected WannaCry ransomware attack|Unusual protocol implementation (potential WannaCry ransomware attack)|2035
> |

- **New monitored activity: File copy through SMB**  
Copying of files using SMB is now a monitored and filterable activity. Learn more about which [activities Azure ATP monitors](monitored-activities.md), and how to [filter and search monitored activities](/defender-for-identity/monitored-activities) in the portal.

- **Large Lateral Movement Path image enhancement**  
When viewing large lateral movement paths, Azure ATP now highlights only the nodes connected to a selected entity,  instead of blurring the other nodes. This change introduces a significant improvement in large LMP rendering speed.

- This version includes improvements and bug fixes for internal sensor infrastructure.

### Azure ATP release 2.57

Released December 2, 2018

- **New Security Alert: Suspected Golden ticket usage- ticket anomaly (preview)**  
Azure ATP's [Suspected Golden Ticket usage - ticket anomaly](/defender-for-identity/alerts-overview) security alert is now in public preview.    Attackers with domain admin rights can compromise the KRBTGT account. Using the KRBTGT account, attackers can create a Kerberos ticket granting ticket (TGT) that provides authorization to any resource.

    This forged TGT is called a "Golden Ticket" because it allows attackers to achieve lasting network persistence. Forged Golden Tickets of this type have unique characteristics this new detection is designed to identify.

- **Feature Enhancement: Automated Azure ATP instance (instance) creation**  
From today, Azure ATP *instances* are renamed Azure ATP *instances*. Azure ATP now supports one Azure ATP instance per Azure ATP account. Instances for new customers are created using the instance creation wizard in the [Azure ATP portal](https://portal.atp.azure.com). Existing Azure ATP instances are converted automatically to Azure ATP instances with this update.  

  - Simplified instance creation for faster deployment and protection using [create your Azure ATP instance](/defender-for-identity/deploy-defender-identity).
  - All [data privacy and compliance](privacy-compliance.md) remains the same.

  To learn more about Azure ATP instances, see [Create your Azure ATP instance](/defender-for-identity/deploy-defender-identity).

- This version includes improvements and bug fixes for internal sensor infrastructure.

## November 2018

### Azure ATP release 2.56

Released November 25, 2018

- **Feature Enhancement: Lateral Movement Paths (LMPs)**  
Two additional features are added to enhance Azure ATP Lateral Movement Path (LMP) capabilities:

  - LMP history is now saved and discoverable per entity, and when using LMP reports.
  - Follow an entity in an LMP via the activity timeline, and investigate using additional evidence provided for discovery of potential attack paths.

  See [Azure ATP Lateral Movement Paths](/defender-for-identity/understand-lateral-movement-paths) to learn more about how to use and investigate with enhanced LMPs.

- **Documentation enhancements: Lateral Movement Paths, Security Alert names**  
Additions and updates were made to Azure ATP articles describing Lateral Movement Path descriptions and features, name mapping was added for all instances of old security alert names to new names and externalIds.
  - See [Azure ATP Lateral Movement Paths](/defender-for-identity/understand-lateral-movement-paths), [Investigate  Lateral Movement Paths](/defender-for-identity/understand-lateral-movement-paths), and [Security Alert Guide](/defender-for-identity/alerts-overview) to learn more.

- This version includes improvements and bug fixes for internal sensor infrastructure.

For details of each Defender for Identity release prior to (and including) release 2.55, see the [Defender for Identity release reference](/defender-for-identity/whats-new).

## Next steps

> [!div class="nextstepaction"]
> [What's new in Microsoft Defender for Identity](whats-new.md)
