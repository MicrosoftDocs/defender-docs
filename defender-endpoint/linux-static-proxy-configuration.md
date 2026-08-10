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
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---
# Configure Microsoft Defender for Endpoint on Linux for static proxy discovery


Microsoft Defender for Endpoint can discover a proxy server using the `HTTPS_PROXY` environment variable. The `HTTPS_PROXY` environment variable must be configured **both** at installation time and after the product has been installed.

<a name="installation-time-configuration"></a>
## Configure static proxy discovery during installation

During installation, the `HTTPS_PROXY` environment variable must be passed to the Linux package manager (such as APT, YUM, or Zypper) that installs the Defender for Endpoint package. The package manager reads this variable so it can download packages through the specified proxy. You can configure the variable in any of the following ways:

- The `HTTPS_PROXY` variable is defined in `/etc/environment` with the following line. This sets the proxy globally so that all processes, including the package manager, can route traffic through the specified proxy server:

  ```bash
  HTTPS_PROXY="http://proxy.server:port/"
  ```

- The `HTTPS_PROXY` variable is defined in the package manager global configuration. This setting routes package downloads through the specified HTTPS proxy during installation. For example, in Ubuntu 18.04, you can add the following line to `/etc/apt/apt.conf.d/proxy.conf`:

  ```bash
  Acquire::https::Proxy "http://proxy.server:port/";
  ```

  > [!CAUTION]
  > Defining `HTTPS_PROXY` in `/etc/environment` or in the package manager global configuration could define the proxy for other applications on your system. Use either of these methods with caution, and only if you intend the proxy setting to be global.

- The `HTTPS_PROXY` variable is prepended to the installation or uninstallation commands. This approach applies the proxy setting only for that single command invocation without affecting other applications. For example, with the APT package manager, prepend the variable as follows when installing Microsoft Defender for Endpoint:

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

Run the following command on the endpoint to set the Defender for Endpoint runtime proxy through the `mdatp` CLI, enabling ongoing cloud connectivity through the specified proxy server.

```bash
mdatp config proxy set --value http://address:port
```

<a name="2-using-managed-configuration"></a>
### Method 2: Configure static proxy discovery using managed configuration

Set the proxy in the managed configuration at `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`. This approach is suited for centrally managed deployments where a management tool distributes the configuration file. The following example shows the JSON schema for setting the cloud service proxy:

```json
{
  "cloudService":{
    "proxy": "http://proxy.server:port/"
  }
}
```

A management tool of choice can be used to deploy the managed configuration in `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`. For details about the managed configuration file format and deployment, see [Set preferences for Microsoft Defender for Endpoint on Linux](./linux-preferences.md).



