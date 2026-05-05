---
title: Microsoft Defender for Endpoint on Linux static proxy discovery
ms.reviewer: gopkr
description: Describes how to configure Microsoft Defender for Endpoint on Linux, for static proxy discovery.
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
ms.date: 10/11/2024
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Configure Microsoft Defender for Endpoint on Linux for static proxy discovery


Microsoft Defender for Endpoint can discover a proxy server using the `HTTPS_PROXY` environment variable. This setting must be configured **both** at installation time and after the product has been installed.

## Installation time configuration

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

## Post installation configuration

After installation, configure Defender for Endpoint with a static proxy. This can be done in two ways: 

### 1. Using mdatp command-line tool

Run the following command on the endpoint to configure proxy for Defender for Endpoint.

```bash
mdatp config proxy set --value http://address:port
```

### 2. Using managed configuration

Set the proxy in the managed configuration at `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`. This is an example of the json schema:

```json
{
  "cloudService":{
    "proxy": "http://proxy.server:port/"
  }
}
```

A management tool of choice can be used to deploy the above configuration. Please check [Set preferences for Microsoft Defender for Endpoint on Linux](./linux-preferences.md) for more details on managed configuration.



