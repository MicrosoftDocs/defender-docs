---
title: Enable DMARC reporting for Microsoft Online Email Routing Address (MOERA) and parked domains
description: The steps to configure DMARC for MOERA and parked domains.
ms.service: defender-office-365
author: chrisda
ms.author: chrisda
ms.localizationpriority: medium
ms.collection: 
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.date: 07/02/2026
ms.custom: sfi-ga-nochange, msecd-doc-authoring-1016
ai-usage: ai-assisted
---

# Enable DMARC reporting for Microsoft Online Email Routing Address (MOERA) and parked domains

Best practice for domain email security protection is to protect yourself from spoofing using Domain-based Message Authentication, Reporting, and Conformance (DMARC). Enabling DMARC for your domains should be the first step. For instructions, see [Set up DMARC to validate the From address domain for cloud senders](../email-authentication-dmarc-configure.md).

This article explains how to configure DMARC for your `onmicrosoft.com` (MOERA) domain and parked custom domains, which aren't covered in [Set up DMARC to validate the From address domain for cloud senders](../email-authentication-dmarc-configure.md). These domains aren't used for email, but could be exploited by attackers if the domains remain unprotected:

- Your `onmicrosoft.com` domain, also known as the Microsoft Online Email Routing Address (MOERA) domain.
- Parked custom domains that you're currently not using for email yet.

<a name="what-you-need"></a>
## Prerequisites

Before you begin, make sure you have the following items:

- Microsoft 365 admin center and access to your DNS provider hosting your domains.
- Sufficient permissions as a Global Administrator<sup>\*</sup> to make the appropriate changes in the Microsoft 365 admin center.
- 10 minutes to complete the steps in this article.

> [!IMPORTANT]
> <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

<a name="activate-dmarc-for-moera-domain"></a>
## Activate DMARC for a MOERA domain

Use the following steps to add a DMARC TXT record for your MOERA domain in the Microsoft 365 admin center:

1. Open the Microsoft 365 admin center at <https://admin.microsoft.com>.
1. On the left-hand navigation, select **Show All**.
1. Expand **Settings** and press **Domains**.
1. Select your tenant domain (for example, contoso.onmicrosoft.com).
1. On the page that loads, select **DNS records**.
1. Select **+ Add record**.
1. A flyout opens. Ensure that the selected Type is **TXT (Text)**.
1. Add `_dmarc` as **TXT name**.
1. Add your specific DMARC value. For more information, see [Syntax for DMARC TXT records](../email-authentication-dmarc-configure.md#syntax-for-dmarc-txt-records).
1. Press **Save**.

<a name="active-dmarc-for-parked-domains"></a>
## Activate DMARC for parked domains

Use the following steps to add a DMARC TXT record for your parked custom domains:

1. Check if SPF is already configured for your parked domain. For instructions, see [SPF TXT records for custom cloud domains](../email-authentication-spf-configure.md#spf-txt-records-for-custom-domains-in-microsoft-365).
1. Contact your DNS Domain provider.
1. Ask to add this DMARC txt record with your appropriate email addresses: `v=DMARC1; p=reject; rua=mailto:d@rua.contoso.com;ruf=mailto:d@ruf.contoso.com`.

## Next Steps

Wait until the DNS changes propagate, and then try to spoof the MOERA domain or any parked custom domain where you added the DMARC record. Check whether the spoofing attempt is blocked based on the DMARC record you added for the domain you tested, and verify that you receive a DMARC report.

<a name="more-information"></a>
## Related content

[Set up SPF to identify valid email sources for your custom cloud domains](../email-authentication-spf-configure.md).

[Set up DMARC to validate the From address domain for cloud senders](../email-authentication-dmarc-configure.md).
