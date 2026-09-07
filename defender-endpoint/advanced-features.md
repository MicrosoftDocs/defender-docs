---
title: Configure advanced features in Microsoft Defender for Endpoint
description: Configure advanced Defender for Endpoint features such as EDR in block mode, tamper protection, live response, attack disruption, custom network indicators, and integrations with Intune, Defender for Cloud Apps, and Microsoft Purview.
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
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 2

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Configure advanced features in Defender for Endpoint

You can configure the following Defender for Endpoint advanced features depending on the Microsoft security products in your environment.

## Enable advanced features

To enable or disable an advanced feature in the Microsoft Defender portal:

1. Go to the [Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2077139) and sign in.

1. In the navigation pane, select **Settings** \> **Endpoints** \> **Advanced features**.

1. Select the advanced feature you want to configure and toggle the setting between **On** and **Off**.

1. Select **Save preferences**.

Use the following advanced features to get better protected from potentially malicious files and gain better insight during security investigations.

## Restrict correlation to within scoped device groups

The scoped device group correlation setting can be used for scenarios where local SOC operations would like to limit alert correlations only to device groups that they can access. When the scoped device group correlation setting is turned on, an incident composed of alerts that cross-device groups is no longer considered a single incident. The local SOC can then take action on the incident because they have access to one of the device groups involved. However, global SOC sees several different incidents by device group instead of one incident. We don't recommend turning on this setting unless doing so outweighs the benefits of incident correlation across the entire organization.

> [!NOTE]
>
> - Changing this setting impacts future alert correlations only.
> - Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2.

## Enable EDR in block mode

Endpoint detection and response (EDR) in block mode provides protection from malicious artifacts, even when Microsoft Defender Antivirus is running in passive mode. When EDR in block mode is turned on, it blocks malicious artifacts or behaviors that are detected on a device. EDR in block mode works behind the scenes to remediate malicious artifacts that are detected post breach.

## Automatically resolve alerts

Turn on the auto-resolve alerts setting to automatically resolve alerts where no threats were found or where detected threats were remediated. If you don't want to have alerts auto resolved, you'll need to manually turn off the feature.

> [!NOTE]
>
> - The result of the auto-resolve action may influence the Device risk level calculation which is based on the active alerts found on a device.
> - If a security operations analyst manually sets the status of an alert to "In progress" or "Resolved" the auto-resolve capability will not overwrite it.

<a name="allow-or-block-file"></a>
## Configure allow or block file settings

To use this feature, your organization must meet these requirements:

- Microsoft Defender Antivirus is the active antimalware solution.
- Cloud-based protection is enabled.

This feature lets you block harmful files in your network. When you block a file, devices in your organization can't read, write, or run it.

To turn on **Allow or block** files:

1. In the Microsoft Defender portal, select **Settings** \> **Endpoints** \> **General** \> **Advanced features** \> **Allow or block file**.

1. Toggle the setting between **On** and **Off**.

    a. :::image type="content" source="/defender/media/alloworblockfile.png" alt-text="The Endpoints screen" lightbox="/defender/media/alloworblockfile.png":::

1. Select **Save preferences** at the bottom of the page.

1. After you turn on this feature, you can [block files](respond-file-alerts.md#allow-or-block-file) from the **Add Indicator** tab on a file's profile page.

## Hide potential duplicate device records

Turn on this feature to hide duplicate device records so you see only the most accurate data for each device. Duplicates can happen for many reasons. For example, device discovery might scan your network and find a device that is already onboarded or was recently offboarded.

This feature matches duplicates by hostname and last seen time. It hides them from the Device Inventory, Microsoft Defender Vulnerability Management pages, and Public APIs for machine data. The most accurate record stays visible. Duplicates still appear in global search, advanced hunting, alerts, and incidents pages.

This setting is on by default and applies tenant wide. To show duplicate records, turn off the feature manually.

<a name="custom-network-indicators"></a>
## Configure custom network indicators

Turning on custom network indicators allows you to create indicators for IP addresses, domains, or URLs, which determine whether they'll be allowed or blocked based on your custom indicator list.

To use this feature, devices must be running Windows 10 version 1709 or later, or Windows 11.

For more information, see [Overview of indicators](indicators-overview.md).

> [!NOTE]
> Network protection leverages reputation services that process requests in locations that might be outside of the location you've selected for your Defender for Endpoint data.

<a name="tamper-protection"></a>
## Enable tamper protection

During cyber attacks, attackers might try to turn off security features like antivirus protection on your devices. They do this to access your data, install malware, or exploit your identity and devices. Tamper protection locks Microsoft Defender Antivirus and stops your security settings from being changed by apps or other methods.

For more information, including how to configure tamper protection, see [Protect security settings with tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md).

<a name="show-user-details"></a>
## Enable user details display

Turn on the show user details feature so that you can see user details stored in Microsoft Entra ID. Details include a user's picture, name, title, and department information when investigating user account entities. You can find user account information in the following views:

- Alert queue
- Device details page

For more information, see [Investigate a user account](investigate-user.md).

<a name="skype-for-business-integration"></a>
## Configure Skype for Business integration

Enabling the Skype for Business integration gives you the ability to communicate with users using Skype for Business, email, or phone. The Skype for Business integration can be handy when you need to communicate with the user and mitigate risks.

> [!NOTE]
> When a device is being isolated from the network, there's a pop-up where you can choose to enable Outlook and Skype communications which allows communications to the user while they are disconnected from the network. The Outlook and Skype communications option applies only when devices are in isolation mode.

<a name="microsoft-defender-for-cloud-apps"></a>
## Configure Microsoft Defender for Cloud Apps integration

Enabling the Microsoft Defender for Cloud Apps integration forwards Defender for Endpoint signals to Microsoft Defender for Cloud Apps to provide deeper visibility into cloud application usage. Forwarded data is stored and processed in the same location as your Defender for Cloud Apps data.

For more information, see [Microsoft Defender for Cloud Apps overview](/defender-cloud-apps/what-is-defender-for-cloud-apps).

<a name="web-content-filtering"></a>
## Configure web content filtering

Block access to websites containing unwanted content and track web activity across all domains. Before you deploy the [Microsoft Defender for Endpoint security baseline](https://devicemanagement.microsoft.com/#blade/Microsoft_Intune_Workflows/SecurityBaselineSummaryMenu/overview/templateType/2), ensure network protection is in block mode. To specify the web content categories you want to block, create a [web content filtering policy](https://security.microsoft.com/preferences2/web_content_filtering_policy).

<a name="unified-audit-log"></a>
## Enable the unified audit log

Search in Microsoft Purview enables your security and compliance team to view critical audit log event data to gain insight and investigate user activities. Whenever an audited activity is performed by a user or an admin, an audit record is generated and stored in the Microsoft 365 audit log for your organization. For more information, see the [Search the audit log](/purview/audit-search).

<a name="device-discovery"></a>
## Enable device discovery

Helps you find unmanaged devices connected to your corporate network without the need for extra appliances or cumbersome process changes. Using onboarded devices, you can find unmanaged devices in your network and assess vulnerabilities and risks. For more information, see [Device discovery](device-discovery.md).

> [!NOTE]
> You can always apply filters to exclude unmanaged devices from the device inventory list. You can also use the onboarding status column on API queries to filter out unmanaged devices.

## Download quarantined files

Backup quarantined files in a secure and compliant location so they can be downloaded directly from quarantine. The **Download file** button is always available in the file page. The download quarantined files setting is turned on by default. [Requirements for downloading quarantined files](respond-file-alerts.md#download-quarantined-files)

## Default to streamlined connectivity when onboarding devices in the Defender portal

This setting makes [streamlined connectivity](configure-device-connectivity.md) the default onboarding package for supported operating systems. You can still use the standard package, but you need to select it from the drop-down on the onboarding page.

<a name="live-response"></a>
## Enable live response

Turn on this feature so that users with the appropriate permissions can start a live response session on devices.

To assign roles for live response, see [Create and manage roles](user-roles.md).

<a name="live-response-for-servers"></a>
## Enable live response for servers

Turn on this feature so that users with the appropriate permissions can start a live response session on servers.

For more information about role assignments, see [Create and manage roles](user-roles.md).

<a name="live-response-unsigned-script-execution"></a>
## Allow unsigned script execution in live response

Enabling this feature allows you to run unsigned scripts in a live response session.

<a name="automatic-attack-disruption"></a>
## Configure automatic attack disruption

Automatic attack disruption stops attacks by containing compromised assets that the attacker controls. It limits lateral movement early, which reduces the cost and productivity loss from an attack. Security operations teams keep full control to investigate, fix issues, and bring assets back online. For more information, see [Automatic attack disruption in Microsoft Defender](/defender-xdr/automatic-attack-disruption).

## Share endpoint alerts with Microsoft Compliance Center

The endpoint alert sharing setting sends endpoint security alerts and their triage status to the Microsoft Purview portal. You can use these alerts to improve insider risk management policies and address internal risks before they cause harm. Forwarded data is stored in the same location as your Office 365 data.

After you set up the [policy indicators](/purview/insider-risk-management-settings-policy-indicators) in insider risk management settings, Defender for Endpoint shares alerts with insider risk management for applicable users.

<a name="microsoft-intune-connection"></a>
## Configure the Microsoft Intune connection

You can integrate Defender for Endpoint with [Microsoft Intune](/intune/intune-service/fundamentals/what-is-intune) to [enable device risk-based conditional access](/intune/intune-service/protect/advanced-threat-protection). When you [configure Conditional Access](configure-conditional-access.md), Defender for Endpoint shares device data with Intune to help enforce policies.

> [!IMPORTANT]
> You must enable this integration in both Intune and Defender for Endpoint. For detailed steps, see [Configure Conditional Access in Defender for Endpoint](configure-conditional-access.md).

This feature requires the following:

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

[Endpoint Attack Notifications](endpoint-attack-notifications.md) let Microsoft hunt for critical threats in your endpoint data. Threats are ranked by urgency and impact.

For proactive hunting across Microsoft Defender XDR, including threats that span email, collaboration, identity, cloud apps, and endpoints, [get started with Microsoft Defender Experts](https://aka.ms/DefenderExpertsForHuntingGetStarted).

<a name="related-topics"></a>
## Related content

- [Update data retention settings](preferences-setup.md)
- [Configure alert notifications](/defender-xdr/configure-email-notifications)
