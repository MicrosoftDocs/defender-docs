---
title: Edit vulnerable Certificate Authority setting (ESC6) | Microsoft Defender for Identity
description: This article provides an overview of Microsoft Defender for Identity's vulnerable Certificate Authority setting report.
ms.date: 11/20/2023
ms.topic: how-to
---

# Security assessment: Edit vulnerable Certificate Authority setting (ESC6)  (Preview)

This article describes Microsoft Defender for Identity's **Vulnerable Certificate Authority setting** report.

## What are vulnerable Certificate Authority settings?

Each certificate is associated with an entity through its subject field. However, a certificate also includes a *Subject Alternative Name* (SAN) field, which allows the certificate to be valid for multiple entities.

The SAN field is commonly used for web services hosted on the same server, supporting the use of a single HTTPS certificate instead of separate certificates for each service. When the specific certificate is also valid for authentication, by containing an appropriate EKU, such as *Client Authentication*, it can be used to authenticate several different accounts.

Unprivileged users that can specify the users in the SAN settings can lead to immediate compromise, and post a great risk to your organization.

If the AD CS `editflags` > `EDITF_ATTRIBUTESUBJECTALTNAME2` flag is turned on, each user can specify the SAN settings for their certificate request. This, in turn affects all certificate templates, whether they have the `Supply in the request` option turned on or not.

If there's a template where the `EDITF_ATTRIBUTESUBJECTALTNAME2` setting is turned on, and the template is valid for authentication, an attacker can enroll a certificate that can impersonate any arbitrary account.

## Prerequisites

This assessment is available only to customers who installed a sensor on an AD CS server. For more information, see [New sensor type for Active Directory Certificate Services (AD CS)](whats-new.md#new-sensor-type-for-active-directory-certificate-services-ad-cs).

## How do I use this security assessment to improve my organizational security posture?

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> for editing vulnerable Certificate Authority settings.  For example:

    :::image type="content" source="media/secure-score/vulnerable-certificate-authority-settings.png" alt-text="Screenshot of the Edit vulnerable Certificate Authority setting (ESC6) recommendation." lightbox="media/secure-score/vulnerable-certificate-authority-settings.png":::

1. Research why the `EDITF_ATTRIBUTESUBJECTALTNAME2` setting is turned on.

1. Turn off the setting by running:

    ```cmd
    certutil -setreg policy\EditFlags -EDITF_ATTRIBUTESUBJECTALTNAME2
    ```

1. Restart the service by running:

    ```cmd
    net stop certsvc & net start certsvc
    ```

Make sure to test your settings in a controlled environment before turning them on in production.

[!INCLUDE [secure-score-note](../includes/secure-score-note.md)]


## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
