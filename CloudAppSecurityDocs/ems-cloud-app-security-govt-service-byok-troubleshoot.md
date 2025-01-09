---
title: Troubleshooting data encryption with your own key
description: This article provides a list of problems that can prevent Defender for Cloud Apps from accessing your Azure Key Vault key used to encrypt collected data at rest.
ms.date: 01/29/2023
ms.topic: conceptual
---


# Troubleshooting data encryption with your own key

This article provides a list of problems that can prevent Defender for Cloud Apps from accessing your Azure Key Vault key used to encrypt collected data at rest.

> [!IMPORTANT]
> If there is a problem accessing your Azure Key Vault key, Defender for Cloud Apps will fail to encrypt your data and your tenant will be lock down within an hour. When your tenant is locked down, all access to it will be blocked until the cause has been resolved. Once your key is accessible again, full access to your tenant will be restored

## Troubleshooting

The following table lists the possible scenarios that can cause data encryption to fail and the actions you can take to resolve them:

| Scenario | Actions |
| --- | --- |
| <a name="missing-kv-key-permissions"></a>**Missing Key Vault or key permissions** | In the selected Key Vault, under access policy, make sure that the following key permissions are selected:<br />Under **Key management operations**<br />- List<br />Under **Cryptographic operations**<br />- Wrap key<br />- Unwrap key<br /><br />For the selected key, make sure you are using an RSA encryption and that the following operations are permitted:<br />- Wrap key<br />- Unwrap key<br /> |
| <a name="firewall-block"></a>**Azure Key Vault firewall blocking access to key** | In the selected Key Vault, make sure that the firewall is configured with the following IP addresses:<br />- 13.66.200.132<br />- 23.100.71.251<br />- 40.78.82.214<br />- 51.105.4.145<br />- 52.166.166.111 |
| <a name="key-not-enabled"></a>**Encryption key is not enabled** | In the selected key's settings, make sure that the key is enabled.<br />![Screenshot showing key enable option.](media/cloud-app-security-byok/byok-kv-key-enabled.PNG) |
| <a name="key-not-active"></a>**Encryption key is not active** | In the selected key's settings, make sure that the activation date and time is prior to the current date and time.<br />![Screenshot showing key activation date.](media/cloud-app-security-byok/byok-kv-key-activation-date.PNG) |
| <a name="key-expired"></a>**Encryption key has expired** | In the selected key's settings, make sure that the expiration date and time has not passed.<br />![Screenshot showing key expiration date.](media/cloud-app-security-byok/byok-kv-key-expiration-date.PNG) |
| <a name="key-not-found"></a>**Encryption key not found or deleted** | Verify that the selected key exists in your Key Vault. If key was deleted, recover and enable it again. If the key was moved to another Key Vault, move it back to the selected Key Vault. |

If you run into any problems, we're here to help. To get assistance or support for your product issue, please [open a support ticket](./support-and-ts.md).

## Next steps

- [Microsoft Defender for Cloud Apps for US Government offerings](editions-cloud-app-security-gcc.md)
