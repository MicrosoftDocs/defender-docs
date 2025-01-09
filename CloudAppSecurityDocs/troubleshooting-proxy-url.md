---
title: Troubleshooting - What is mcas.ms, mcas-gov.us, or mcas-gov.ms? | Microsoft Defender for Cloud Apps
description: Learn about the `mcas.ms`, `mcas-gov.us`, and `mcas-gov.ms` URL suffixes used by Microsoft Defender for Cloud Apps and Conditional Access app control.
ms.date: 05/15/2024
ms.topic: troubleshooting
---

# Troubleshooting - What is `*.mcas.ms`, `*.mcas-gov.us`, or `*.mcas-gov.ms`?



This article provides information about the `mcas.ms`, `mcas-gov.us`, and `mcas-gov.ms` URL suffixes used by Microsoft Defender for Cloud Apps and Conditional Access app control.

## Our system flagged a new domain name system (DNS) entry or generated certificate for `*.mcas.ms`, `*.mcas-gov.us`, or `*.mcas-gov.ms`, but we don't use Defender for Cloud Apps

This is normal behavior and results from Defender for Cloud Apps protecting your environment in a browser other than Microsoft Edge. Even if your organization doesn't use Defender for Cloud Apps, when someone visits your site or service from an environment that does, and they use a browser other than Microsoft Edge, their URLs are rewritten to protect their access.

For example, Contoso protects its environment using conditional access app control provided by Defender for Cloud Apps. When a Contoso user visits `fabrikam.com` from Google Chrome, the user is automatically redirected to `fabrikam.com.mcas.ms`. As a result, Fabrikam's phishing team sees a new DNS entry and certificate for `fabrikam.com.mcas.ms`.

So even though Fabrikam doesn't actually use Defender for Cloud Apps, they see the DNS entry or certificate because Contoso does.

> [!NOTE]
> You may also see the following domains in the transparency logs:
>
> - `*.admin-rs-mcas.ms`
> - `*.rs-mcas.ms`
> - `*.admin-rs-mcas-df.ms`
> - `*.rs-mcas-df.ms`
> - `*.admin-mcas.ms`
> - `*.mcas.ms`
> - `*.admin-mcas-df.ms`
> - `*.mcas-df.ms`
> - `*.admin-mcas-gov.us`
> - `*.mcas-gov.us`
> - `*.admin-mcas-gov-df.us`
> - `*.mcas-gov-df.us`
> - `*.admin-mcas-gov.ms`
> - `*.mcas-gov.ms`
> - `*.admin-mcas-gov-df.ms`
> - `*.mcas-gov-df.ms`

## Here's why you see `*.mcas.ms`, `*.mcas-gov.us`, or `*.mcas-gov.ms` in your URL

This kind of URL is expected and indicates that your organization applies extra security controls to protect business-critical data.

They do this by using Defender for Cloud Apps, a solution for protecting your organization's cloud environment, to replace all relevant URLs and cookies relating to cloud apps that you use.

So when you try accessing a cloud app such as Salesforce, SharePoint Online, or AWS, you notice that its URL is suffixed with `.mcas.ms`, `.mcas-gov.us`, or `.mcas-gov.ms`. For example, when using the XYZ app, the URL you're used to seeing changes from `XYZ.com` to `XYZ.com.mcas.ms`.

If the URL doesn't exactly match one of the replacement patterns, such as `<app_site>.com` isn't replaced with `<app_site>.com.mcas.ms`, or if you have other concerns, contact your IT department.

If you don't recognize the remaining portion of the URL, such as **myurl.com**.mcas.ms, as associated with any of your business apps, we recommend that you investigate the issue further and consider blocking the URL to avoid any potential security risks.

> [!NOTE]
> Microsoft Edge users benefit from in-browser protection, and are not redirected to a reverse proxy. Your URLs retain their original syntax in Microsoft Edge, even when access and sessions are protected by Defender for Cloud Apps. For more information, see [In-browser protection with Microsoft Edge for Business (Preview)](in-browser-protection.md).

## Related content

- [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md)
- [Troubleshooting access and session controls for admin users](troubleshooting-proxy.md)
- [Troubleshooting access and session controls for end-users](troubleshooting-proxy-end-users.md)