---
title: Configure static proxy discovery for Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr
description: Configure static proxy discovery for Microsoft Defender for Endpoint on Linux using the HTTPS_PROXY environment variable during installation and after deployment.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
- mde-linux
ms.topic: how-to
ms.subservice: linux
ms.date: 06/17/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---
# Configure Microsoft Defender for Endpoint on Linux for static proxy discovery


Microsoft Defender for Endpoint can discover a proxy server using the `HTTPS_PROXY` environment variable. The `HTTPS_PROXY` environment variable must be configured **both** at installation time and after the product has been installed.

<a name="installation-time-configuration"></a>
## Configure static proxy discovery during installation

During installation, the `HTTPS_PROXY` environment variable must be passed to the package manager. The package manager can read this variable in any of the following ways:

- The `HTTPS_PROXY` variable is defined in `/etc/environment` with the following line:

  ```bash
  HTTPS_PROXY="http://proxy.server:port/"
  ```

- The `HTTPS_PROXY` variable is defined in the package manager global configuration. For example, in Ubuntu 18.04, you can add the following line to `/etc/apt/apt.conf.d/proxy.conf`:

  ```bash
  Acquire::https::Proxy "http://proxy.server:port/";
  ```

  > [!CAUTION]
  > The above two methods could define the proxy to use for other applications on your system. Use this method with caution, or only if this is meant to be a global configuration.

- The `HTTPS_PROXY` variable is prepended to the installation or uninstallation commands. For example, with the APT package manager, prepend the variable as follows when installing Microsoft Defender for Endpoint:

  ```bash
  HTTPS_PROXY="http://proxy.server:port/" apt install mdatp
  ```

  > [!NOTE]
  > Don't add sudo between the environment variable definition and apt, otherwise the variable won't be propagated.

The `HTTPS_PROXY` environment variable may similarly be defined during uninstallation.

Installation and uninstallation won't necessarily fail if a proxy is required but not configured. However, telemetry won't be submitted, and the operation could take longer due to network timeouts.

<a name="post-installation-configuration"></a>
## Configure static proxy discovery after installation

After installation, configure Defender for Endpoint with a static proxy. You can configure Defender for Endpoint with a static proxy in two ways: 

<a name="1-using-mdatp-command-line-tool"></a>
### Method 1: Configure static proxy discovery using the mdatp command-line tool

Run the following command on the endpoint to configure proxy for Defender for Endpoint.

```bash
mdatp config proxy set --value http://address:port
```

<a name="2-using-managed-configuration"></a>
### Method 2: Configure static proxy discovery using managed configuration

Set the proxy in the managed configuration at `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`. This is an example of the json schema:

```json
{
  "cloudService":{
    "proxy": "http://proxy.server:port/"
  }
}
```

A management tool of choice can be used to deploy the managed configuration in `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`. Please check [Set preferences for Microsoft Defender for Endpoint on Linux](./linux-preferences.md) for more details on managed configuration.



