---
title: Configure advanced features in Microsoft Defender for Endpoint
description: Learn how to enable and manage advanced Microsoft Defender for Endpoint features and integrations available in the Microsoft Defender portal.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: yongrhee
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
ms.subservice: onboard
ms.date: 06/17/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 2

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---
# Configure advanced features in Defender for Endpoint


Depending on the Microsoft security products that you use, you can integrate Defender for Endpoint with the advanced features described in this article.

## Enable advanced features

1. Go to the [Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2077139) and sign in. 

1. In the navigation pane, select **Settings** \> **Endpoints** \> **Advanced features**.

1. Select the advanced feature you want to configure and toggle the setting between **On** and **Off**.

1. Select **Save preferences**.

Use the following advanced features to get better protected from potentially malicious files and gain better insight during security investigations.

## Restrict correlation to within scoped device groups

The scoped device group correlation setting can be used for scenarios where local SOC operations would like to limit alert correlations only to device groups that they can access. When this setting is turned on, an incident composed of alerts that cross-device groups are no longer considered a single incident. The local SOC can then take action on the incident because they have access to one of the device groups involved. However, global SOC sees several different incidents by device group instead of one incident. We don't recommend turning on this setting unless doing so outweighs the benefits of incident correlation across the entire organization.

> [!NOTE]
> - Changing this setting impacts future alert correlations only.
>
> - Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2.

## Enable EDR in block mode

Endpoint detection and response (EDR) in block mode provides protection from malicious artifacts, even when Microsoft Defender Antivirus is running in passive mode. When turned on, EDR in block mode blocks malicious artifacts or behaviors that are detected on a device. EDR in block mode works behind the scenes to remediate malicious artifacts that are detected post breach.

## Automatically resolve alerts

Turn on the auto-resolve alerts setting to automatically resolve alerts where no threats were found or where detected threats were remediated. If you don't want to have alerts auto resolved, you'll need to manually turn off the feature.

> [!NOTE]
> - The result of the auto-resolve action may influence the Device risk level calculation which is based on the active alerts found on a device.
> - If a security operations analyst manually sets the status of an alert to "In progress" or "Resolved" the auto-resolve capability will not overwrite it.

<a name="allow-or-block-file"></a>
## Configure allow or block file settings

Blocking is only available if your organization fulfills these requirements:

- Uses Microsoft Defender Antivirus as the active antimalware solution and,
- The cloud-based protection feature is enabled

The allow or block file feature enables you to block potentially malicious files in your network. Blocking a file will prevent it from being read, written, or executed on devices in your organization.

To turn **Allow or block** files on:

1. In the Microsoft Defender portal, in the navigation pane, select **Settings** \> **Endpoints** \> **General** \> **Advanced features** \> **Allow or block file**.

1. Toggle the setting between **On** and **Off**.
 
    a. :::image type="content" source="/defender/media/alloworblockfile.png" alt-text="The Endpoints screen" lightbox="/defender/media/alloworblockfile.png":::

1. Select **Save preferences** at the bottom of the page.

1. After turning on this feature, you can [block files](respond-file-alerts.md#allow-or-block-file) via the **Add Indicator** tab on a file's profile page.

## Hide potential duplicate device records

By enabling the hide potential duplicate device records feature, you can ensure that you're seeing the most accurate information about your devices by hiding potential duplicate device records. There are different reasons duplicate device records might occur, for example, the device discovery capability in Microsoft Defender for Endpoint might scan your network and discover a device that's already onboarded or has recently been offboarded.

The hide potential duplicate device records feature identifies potential duplicate devices based on their hostname and last seen time. The duplicate devices will be hidden from multiple experiences in the portal, such as, the Device Inventory, Microsoft Defender Vulnerability Management pages, and Public APIs for machine data, leaving the most accurate device record visible. However, the duplicates will still be visible in global search, advanced hunting, alerts, and incidents pages.

The hide potential duplicate device records setting is turned on by default and is applied tenant wide. If you don't want to hide potential duplicate device records, you'll need to manually turn off the feature.

<a name="custom-network-indicators"></a>
## Configure custom network indicators

Turning on custom network indicators allows you to create indicators for IP addresses, domains, or URLs, which determine whether they'll be allowed or blocked based on your custom indicator list.

To use this feature, devices must be running Windows 10 version 1709 or later, or Windows 11. 

For more information, see [Overview of indicators](indicators-overview.md).

> [!NOTE]
> Network protection leverages reputation services that process requests in locations that might be outside of the location you've selected for your Defender for Endpoint data.

<a name="tamper-protection"></a>
## Enable tamper protection

During some kinds of cyber attacks, bad actors try to disable security features, such as antivirus protection, on your machines. Bad actors like to disable your security features to get easier access to your data, to install malware, or to otherwise exploit your data, identity, and devices. Tamper protection essentially locks Microsoft Defender Antivirus and prevents your security settings from being changed through apps and methods.

For more information, including how to configure tamper protection, see [Protect security settings with tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md).

<a name="show-user-details"></a>
## Enable user details display

Turn on the show user details feature so that you can see user details stored in Microsoft Entra ID. Details include a user's picture, name, title, and department information when investigating user account entities. You can find user account information in the following views:

- Alert queue
- Device details page

For more information, see [Investigate a user account](investigate-user.md).

<a name="skype-for-business-integration"></a>
## Configure Skype for Business integration

Enabling the Skype for Business integration gives you the ability to communicate with users using Skype for Business, email, or phone. This activation can be handy when you need to communicate with the user and mitigate risks.

> [!NOTE]
> When a device is being isolated from the network, there's a pop-up where you can choose to enable Outlook and Skype communications which allows communications to the user while they are disconnected from the network. This setting applies to Skype and Outlook communication when devices are in isolation mode.

<a name="microsoft-defender-for-cloud-apps"></a>
## Configure Microsoft Defender for Cloud Apps integration

Enabling this setting forwards Defender for Endpoint signals to Microsoft Defender for Cloud Apps to provide deeper visibility into cloud application usage. Forwarded data is stored and processed in the same location as your Defender for Cloud Apps data.

For more information, see [Microsoft Defender for Cloud Apps overview](/defender-cloud-apps/what-is-defender-for-cloud-apps).

<a name="web-content-filtering"></a>
## Configure web content filtering

Block access to websites containing unwanted content and track web activity across all domains. To specify the web content categories you want to block, create a [web content filtering policy](https://security.microsoft.com/preferences2/web_content_filtering_policy). Ensure you've network protection in block mode when deploying the [Microsoft Defender for Endpoint security baseline](https://devicemanagement.microsoft.com/#blade/Microsoft_Intune_Workflows/SecurityBaselineSummaryMenu/overview/templateType/2).

<a name="unified-audit-log"></a>
## Enable the unified audit log

Search in Microsoft Purview enables your security and compliance team to view critical audit log event data to gain insight and investigate user activities. Whenever an audited activity is performed by a user or an admin, an audit record is generated and stored in the Microsoft 365 audit log for your organization. For more information, see the [Search the audit log](/purview/audit-search).

<a name="device-discovery"></a>
## Enable device discovery

Helps you find unmanaged devices connected to your corporate network without the need for extra appliances or cumbersome process changes. Using onboarded devices, you can find unmanaged devices in your network and assess vulnerabilities and risks. For more information, see [Device discovery](device-discovery.md).

> [!NOTE]
> You can always apply filters to exclude unmanaged devices from the device inventory list. You can also use the onboarding status column on API queries to filter out unmanaged devices.

## Download quarantined files

Backup quarantined files in a secure and compliant location so they can be downloaded directly from quarantine. The **Download file** button will always be available in the file page. This setting is turned on by default. [Learn more about requirements](respond-file-alerts.md#download-quarantined-files)

## Default to streamlined connectivity when onboarding devices in the Defender portal

The streamlined connectivity setting will set the default onboarding package to [streamlined connectivity](configure-device-connectivity.md) for applicable operating systems. You still have the option to use the standard onboarding package within the onboarding page, but you must specifically select it in the drop-down.


<a name="live-response"></a>
## Enable live response

Turn on this feature so that users with the appropriate permissions can start a live response session on devices.

For more information about role assignments, see [Create and manage roles](user-roles.md).

<a name="live-response-for-servers"></a>
## Enable live response for servers

Turn on this feature so that users with the appropriate permissions can start a live response session on servers.

For more information about role assignments, see [Create and manage roles](user-roles.md).

<a name="live-response-unsigned-script-execution"></a>
## Allow unsigned script execution in live response

Enabling this feature allows you to run unsigned scripts in a live response session.

## Automatic attack disruption

Automatic attack disruption disrupts attacks by automatically containing compromised assets that the attacker is using. It limits lateral movement early on, thereby reducing the overall impact of an attack, both on the associated costs and on  loss of productivity. At the same time, it leaves security operations teams in complete control of investigating, remediating, and bringing assets back online. For more information, see [Automatic attack disruption in Microsoft Defender](/defender-xdr/automatic-attack-disruption).

## Share endpoint alerts with Microsoft Compliance Center

This setting forwards endpoint security alerts and their triage status to Microsoft Purview portal, allowing you to enhance insider risk management policies with alerts and remediate internal risks before they cause harm. Forwarded data is processed and stored in the same location as your Office 365 data.

After configuring the [Security policy violation indicators](/microsoft-365/compliance/insider-risk-management-settings#indicators) in the insider risk management settings, Defender for Endpoint alerts will be shared with insider risk management for applicable users.

## Microsoft Intune connection

Defender for Endpoint can be integrated with [Microsoft Intune](/intune/intune-service/fundamentals/what-is-intune) to [enable device risk-based conditional access](/intune/intune-service/protect/advanced-threat-protection). When you [turn on this feature](configure-conditional-access.md), you'll be able to share Defender for Endpoint device information with Intune, enhancing policy enforcement.

> [!IMPORTANT]
> You'll need to enable the integration on both Intune and Defender for Endpoint to use this feature. For more information on specific steps, see [Configure Conditional Access in Defender for Endpoint](configure-conditional-access.md).

This feature is only available if you've the following prerequisites:

- A licensed tenant for Enterprise Mobility + Security E3, and Windows E5 (or Microsoft 365 Enterprise E5)
- An active Microsoft Intune environment, with Intune-managed Windows devices [Microsoft Entra joined](/azure/active-directory/devices/concept-azure-ad-join/).

<a name="authenticated-telemetry"></a>
## Enable authenticated telemetry

You can **Turn on** Authenticated telemetry to prevent spoofing telemetry into your dashboard.

<a name="preview-features"></a>
## Enable preview features

Learn about new features in the Defender for Endpoint preview release. 

Try upcoming features by turning on the preview experience. You'll have access to upcoming features, which you can provide feedback on to help improve the overall experience before features are generally available.

If you already have preview features turned on, manage your settings from the main Defender XDR settings. 

For more information, see [Microsoft Defender XDR preview features](/defender-xdr/preview)

<a name="endpoint-attack-notifications"></a>
## Configure Endpoint Attack Notifications

[Endpoint Attack Notifications](endpoint-attack-notifications.md) enable Microsoft to actively hunt for critical threats to be prioritized based on urgency and impact over your endpoint data. 

For proactive hunting across the full scope of Microsoft Defender XDR, including threats that span email, collaboration, identity, cloud applications, and endpoints, [learn more](https://aka.ms/DefenderExpertsForHuntingGetStarted) about Microsoft Defender Experts.

<a name="related-topics"></a>
## Related content

- [Update data retention settings](preferences-setup.md)
- [Configure alert notifications](/defender-xdr/configure-email-notifications)


