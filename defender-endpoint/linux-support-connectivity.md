---
title: Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr
description: Learn how to troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
- mde-linux
ms.topic: troubleshooting-general
ms.subservice: linux
ms.date: 04/27/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux


## Run the connectivity test

To test if Microsoft Defender for Endpoint on Linux can communicate with the cloud using the current network settings, run a connectivity test from the command line:

```bash
mdatp connectivity test
```

Expected output:

```console
Testing connection with https://cdn.x.cp.wd.microsoft.com/ping ... [OK]
Testing connection with https://eu-cdn.x.cp.wd.microsoft.com/ping ... [OK]
Testing connection with https://wu-cdn.x.cp.wd.microsoft.com/ping ... [OK]
Testing connection with https://x.cp.wd.microsoft.com/api/report ... [OK]
Testing connection with https://winatp-gw-cus.microsoft.com/test ... [OK]
Testing connection with https://winatp-gw-eus.microsoft.com/test ... [OK]
Testing connection with https://winatp-gw-weu.microsoft.com/test ... [OK]
Testing connection with https://winatp-gw-neu.microsoft.com/test ... [OK]
Testing connection with https://winatp-gw-ukw.microsoft.com/test ... [OK]
Testing connection with https://winatp-gw-uks.microsoft.com/test ... [OK]
Testing connection with https://eu-v20.events.data.microsoft.com/ping ... [OK]
Testing connection with https://us-v20.events.data.microsoft.com/ping ... [OK]
Testing connection with https://uk-v20.events.data.microsoft.com/ping ... [OK]
Testing connection with https://v20.events.data.microsoft.com/ping ... [OK]
```

If the connectivity test fails, check if the device has Internet access. Also check to see if a proxy or firewall blocks network connections. For more information, see [Verify that devices can connect to Defender for Endpoint cloud services](mde-linux-prerequisites.md#verify-if-devices-can-connect-to-defender-for-endpoint-cloud-services).

Check to see if the connection is under SSL or HTTPS inspection. If so, add Microsoft Defender for Endpoint to the allow list.

Failures with curl error 35 or 60 typically indicate certificate pinning rejection caused by TLS/SSL inspection. For diagnostic steps and resolution, see [TLS/SSL inspection](#tlsssl-inspection). 


## TLS/SSL inspection

Microsoft Defender for Endpoint on Linux doesn't support TLS/SSL inspection.

| Symptom or error                                            | What it indicates                          | Required action                                               |
| ----------------------------------------------------------- | ------------------------------------------ | ------------------------------------------------------------- |
| `curl error 60`                                             | Certificate validation failure.             | TLS/SSL inspection is active. Configure a bypass.                 |
| `CERTIFICATE_VERIFY_FAILED`                                 | Certificate chain has been replaced.        | TLS/SSL inspection is active. Configure a bypass.                 |
| `HTTP 502 Bad Gateway`                                      | TLS session disrupted by proxy or firewall. | TLS/SSL inspection is active. Configure a bypass. |


To verify whether TLS/SSL inspection is enabled, run the following commands:

```bash
curl -v https://winatp-gw-weu.microsoft.com 2>&1 | grep "issuer"
curl -v https://packages.microsoft.com 2>&1 | grep "issuer"
```

Review the certificate issuer in the output. The issuer must be Microsoft, not your proxy certificate authority (CA). If it reflects your organization’s proxy or firewall certificate authority (CA), TLS/SSL inspection is active and breaking Microsoft Defender for Endpoint connectivity.

Make sure to exempt all Microsoft Defender for Endpoint service domains from TLS/SSL inspection on your proxy or firewall. After you apply the changes, run:


```bash
sudo systemctl restart mdatp
mdatp connectivity test
```

## Troubleshooting steps for environments without proxy or with transparent proxy

To test that a connection isn't blocked in an environment without a proxy or with a transparent proxy, run the following command in the terminal:

```bash
curl -w ' %{url_effective}\n' 'https://x.cp.wd.microsoft.com/api/report' 'https://cdn.x.cp.wd.microsoft.com/ping'
```

The output from this command should be similar to:

```console
OK https://x.cp.wd.microsoft.com/api/report
OK https://cdn.x.cp.wd.microsoft.com/ping
```

## Troubleshooting steps for environments with static proxy

> [!WARNING]
> PAC, WPAD, and authenticated proxies aren't supported. Ensure that you're using only a static proxy or transparent proxy.
>
> For security reasons, SSL inspection and intercepting proxies aren't supported. Configure an exception for SSL inspection and your proxy server to directly pass through data from Defender for Endpoint on Linux to the relevant URLs without interception. Adding your interception certificate to the global store doesn't allow for interception.

If a static proxy is required, add a proxy parameter to the above command, where `proxy_address:port` correspond to the proxy address and port:

```bash
curl -x http://proxy_address:port -w ' %{url_effective}\n' 'https://x.cp.wd.microsoft.com/api/report' 'https://cdn.x.cp.wd.microsoft.com/ping'
```

Use the same proxy address and port as configured in the `/lib/system/system/mdatp.service` file. Check your proxy configuration if you see errors from the preceding commands.

To set the proxy for mdatp, use the following command:

```bash
mdatp config proxy set --value http://address:port 
```

If the command succeeds, try another connectivity test from the command line:

```bash
mdatp connectivity test
```

If the problem persists, contact customer support.

## Resources

For more information about how to configure the product to use a static proxy, see [Configure Microsoft Defender for Endpoint for static proxy discovery](linux-static-proxy-configuration.md).



