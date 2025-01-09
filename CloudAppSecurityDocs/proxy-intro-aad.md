---
title: Conditional Access app control | Microsoft Defender for Cloud Apps
description: Learn how Microsoft Defender for Cloud Apps provides Conditional Access app control.
ms.date: 02/29/2024
ms.topic: conceptual
---
# Conditional Access app control in Microsoft Defender for Cloud Apps

In today's workplace, it's not enough to know what happened in your cloud environment after the fact. You need to stop breaches and leaks in real time. You also need to prevent employees from intentionally or accidentally putting your data and organization at risk.

You want to support users in your organization while they use the best cloud apps available and bring their own devices to work. However, you also need tools to protect your organization from data leaks and theft in real time. Microsoft Defender for Cloud Apps integrates with any identity provider (IdP) to deliver this protection with [access](access-policy-aad.md) and [session](session-policy-aad.md) policies.

For example:

- **Use access policies to:**

  - Block access to Salesforce for users of unmanaged devices.
  - Block access to Dropbox for native clients.

- **Use session policies to**:

  - Block downloads of sensitive files from OneDrive to unmanaged devices.
  - Block uploads of malware files to SharePoint Online.

Microsoft Edge users benefit from [direct, in-browser protection](in-browser-protection.md). A lock :::image type="icon" source="media/in-browser-protection/lock.png" border="false"::: icon on the browser's address bar indicates this protection.

Users of other browsers are redirected via reverse proxy to Defender for Cloud Apps. Those browsers display an `*.mcas.ms` suffix in the link's URL. For example, if the app URL is `myapp.com`, the app URL is updated to `myapp.com.mcas.ms`.

This article describes Conditional Access app control in Defender for Cloud Apps through [Microsoft Entra Conditional Access](/entra/identity/conditional-access/overview) policies.

## Activities in Conditional Access app control

Conditional Access app control uses access policies and session policies to monitor and control user app access and sessions in real time, across your organization.

Each policy has conditions to define *who* (which user or group of users), *what* (which cloud apps), and *where* (which locations and networks) the policy is applied to. After you determine the conditions, route your users first to Defender for Cloud Apps. There, you can apply the access and session controls to help protect your data.

Access and session policies include the following types of activities:

|Activity |Description |
|---------|---------|
|**Prevent data exfiltration** |Block the download, cut, copy, and print of sensitive documents on (for example) unmanaged devices. |
| **Require authentication context** |Reevaluate Microsoft Entra Conditional Access policies when a sensitive action occurs in the session, such as requiring multifactor authentication. |
|**Protect on download** |Instead of blocking the download of sensitive documents, require documents to be labeled and encrypted when you integrate with Microsoft Purview Information Protection. This action helps protect the document and restrict user access in a potentially risky session. |
|**Prevent upload of unlabeled files** |Ensure that the upload of unlabeled files that have sensitive content is blocked until the user classifies the content. Before a user uploads, distributes, or uses a sensitive file, the file must have the label that your organization's policy defined. |
|**Block potential malware** |Help protect your environment from malware by blocking the upload of potentially malicious files. Any file that a user tries to upload or download can be scanned against Microsoft Threat Intelligence and blocked instantaneously. |
|**Monitor user sessions for compliance** |Investigate and analyze user behavior to understand where, and under what conditions, session policies should be applied in the future. Risky users are monitored when they sign in to apps, and their actions are logged from within the session. |
|**Block access** |Granularly block access for specific apps and users, depending on several risk factors. For example, you can block them if they're using client certificates as a form of device management. |
|**Block custom activities** |Some apps have unique scenarios that carry risk. An example is sending messages that have sensitive content in apps like Microsoft Teams or Slack. In these kinds of scenarios, scan messages for sensitive content and block them in real time. |

For more information, see:

- [Create Microsoft Defender for Cloud Apps access policies](access-policy-aad.md)
- [Create Microsoft Defender for Cloud Apps session policies](session-policy-aad.md)

## Usability

Conditional Access app control doesn't require you to install anything on the device, so it's ideal when you're monitoring or controlling sessions from unmanaged devices or partner users.

Defender for Cloud Apps uses patented heuristics to identify and control user activities in the target app. The heuristics are designed to optimize and balance security with usability.

In some rare scenarios, blocking activities on the server side renders the app unusable, so organizations secure these activities only on the client side. This approach makes them potentially susceptible to exploitation by malicious insiders.

## System performance and data storage

Defender for Cloud Apps uses Azure datacenters around the world to provide optimized performance through geolocation. A user's session might be hosted outside a particular region, depending on traffic patterns and their location. However, to help protect user privacy, these datacenters don't store any session data.

Defender for Cloud Apps proxy servers don't store data at rest. When we cache content, we follow the requirements laid out in [RFC 7234 (HTTP caching)](https://tools.ietf.org/html/rfc7234) and cache only public content.

## Supported apps and clients

Apply session and access controls to any interactive single sign-on that uses the SAML 2.0 authentication protocol. Access controls are also supported for built-in mobile and desktop client apps.

Additionally, if you're using Microsoft Entra ID apps, apply session and access controls to:

- Any interactive single sign-on that uses the OpenID Connect authentication protocol.
- Apps hosted on-premises and configured with the [Microsoft Entra application proxy](/entra/identity/app-proxy/application-proxy).

Microsoft Entra ID apps are also automatically onboarded for Conditional Access app control, whereas apps that use other IdPs must be [onboarded manually](conditional-access-app-control-how-to-overview.md).

Defender for Cloud Apps identifies apps by using data from the cloud app catalog. If you customized apps with plug-ins, you must add any associated custom domains to the relevant app in the catalog. For more information, see [Find your cloud app and calculate risk scores](risk-score.md).

> [!NOTE]
> You can't use installed apps that have *noninteractive* sign-in flows, such as the Authenticator app and other built-in apps, with access controls. Our recommendation in that case is to craft an access policy in the Microsoft Entra admin center in addition to Microsoft Defender for Cloud Apps access policies.

## Scope of support for session control

Although session controls are built to work with any browser on any major platform on any operating system, we support the latest versions of the following browsers:

- [Microsoft Edge](https://www.microsoft.com/edge)
- [Google Chrome](https://www.google.com/chrome/)
- [Mozilla Firefox](https://www.mozilla.org/firefox/)
- [Apple Safari](https://www.apple.com/safari/)

Microsoft Edge users benefit from in-browser protection, without redirecting to a reverse proxy. For more information, see [In-browser protection with Microsoft Edge for Business (preview)](in-browser-protection.md).

## App support for TLS 1.2+

Defender for Cloud Apps uses Transport Layer Security (TLS) 1.2+ protocols to provide encryption. Built-in client apps and browsers that don't support TLS 1.2+ aren't accessible when you configure them with session control.

However, software as a service (SaaS) apps that use TLS 1.1 or earlier appear in the browser as using TLS 1.2+ when you configure them with Defender for Cloud Apps.

## Related content

- [Known limitations in Conditional Access app control](caac-known-issues.md)
- [Troubleshooting access and session controls](troubleshooting-proxy.md)
