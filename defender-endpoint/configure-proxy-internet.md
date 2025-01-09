---
title: Configure your devices to connect to the Defender for Endpoint service using a proxy
description: Learn how to configure your devices to enable communication with the cloud service using a proxy.
search.appverid: met150
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.topic: conceptual
ms.subservice: onboard
ms.date: 07/01/2024
---

# STEP 2: Configure your devices to connect to the Defender for Endpoint service using a proxy

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://www.microsoft.com/WindowsForBusiness/windows-atp?ocid=docs-wdatp-configureendpointsscript-abovefoldlink)

> [!IMPORTANT]
> Devices that are configured for IPv6-only traffic are not supported.

> [!NOTE]
> To use the proxy correctly, configure these two different proxy settings in Defender for Endpoint:
> - [Endpoint Detection and Response (EDR)](/defender-endpoint/configure-proxy-internet)
> - [Microsoft Defender Antivirus](/defender-endpoint/configure-proxy-internet)

Depending on the operating system, the proxy to be used for Microsoft Defender for Endpoint can be configured automatically. You can use autodiscovery, an autoconfig file, or a method statically specific to Defender for Endpoint services running on the device.

- For Windows devices, see [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md) (in this article).
- For Linux devices, see [Configure Microsoft Defender for Endpoint on Linux for static proxy discovery](linux-static-proxy-configuration.md).
- For macOS devices, see [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md#network-connections).

The Defender for Endpoint sensor requires Microsoft Windows HTTP (`WinHTTP`) to report sensor data and communicate with the Defender for Endpoint service. The embedded Defender for Endpoint sensor runs in system context using the `LocalSystem` account.

> [!TIP]
> If you use forward proxies as a gateway to the Internet, you can use network protection to [investigate connection events that occur behind forward proxies](investigate-behind-proxy.md).

The `WinHTTP` configuration setting is independent of the Windows Internet (`WinINet`) browsing proxy settings (see [WinINet vs. WinHTTP](/windows/win32/wininet/wininet-vs-winhttp)). It can only discover a proxy server by using the following discovery methods:

- Autodiscovery methods:

  - Transparent proxy
  
  - Web Proxy Autodiscovery Protocol (WPAD)

    > [!NOTE]
    > If you're using Transparent proxy or WPAD in your network topology, you don't need special configuration settings. 

- Manual static proxy configuration:

  - Registry-based configuration
  
  - WinHTTP configured using netsh command: Suitable only for desktops in a stable topology (for example: a desktop in a corporate network behind the same proxy)

> [!NOTE]
> Microsoft Defender Antivirus and EDR proxies can be set independently. In the sections that follow, be aware of those distinctions.

## Configure the proxy server manually using a registry-based static proxy setting

Configure a registry-based static proxy for Defender for Endpoint detection and response (EDR) sensor to report diagnostic data and communicate with Defender for Endpoint services if a computer isn't permitted to directly connect to the Internet.

> [!NOTE]
> Always ensure to apply the latest updates to ensure successful connectivity to Defender for Endpoint services. 

The static proxy settings are configurable through group policy (GP), both settings under group policy values should be configured. The group policy is available in Administrative Templates.

- **Administrative Templates > Windows Components > Data Collection and Preview Builds > Configure Authenticated Proxy usage for the Connected User Experience and Telemetry Service**.

  Set it to **Enabled** and select **Disable Authenticated Proxy usage**.

  :::image type="content" source="media/atp-gpo-proxy1.png" alt-text="The Group Policy setting1 status pane" lightbox="media/atp-gpo-proxy1.png":::

- **Administrative Templates > Windows Components > Data Collection and Preview Builds > Configure connected user experiences and telemetry**:

  Enter the proxy information.

  :::image type="content" source="media/atp-gpo-proxy2.png" alt-text="The Group Policy setting2 status pane" lightbox="media/atp-gpo-proxy2.png":::


| Group Policy | Registry key | Registry entry | Value |
|:---|:---|:---|:---|
| Configure authenticated proxy usage for the connected user experience and the telemetry service | `HKLM\Software\Policies\Microsoft\Windows\DataCollection` | `DisableEnterpriseAuthProxy` | 1 (REG_DWORD) |
| Configure connected user experiences and telemetry | `HKLM\Software\Policies\Microsoft\Windows\DataCollection` | `TelemetryProxyServer` | ```servername:port or ip:port``` <br> <br> For example: ```10.0.0.6:8080``` (REG_SZ) |

> [!NOTE]
> If you are using `TelemetryProxyServer` setting on devices that are otherwise completely offline, meaning the operating system is unable to connect for the online certificate revocation list or Windows Update, then you must add the additional registry setting `PreferStaticProxyForHttpRequest` with a value of `1`.
>
> Parent registry path location for `PreferStaticProxyForHttpRequest` is `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection`.
>
> The following command can be used to insert the registry value in the correct location:
>
> ```console
> reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection" /v PreferStaticProxyForHttpRequest /t REG_DWORD /d 1 /f
> ```
>
> The registry value mentioned earlier is applicable only starting with MsSense.exe version `10.8210.*` and later, or version `10.8049.*` and later.

## Configure a static proxy for Microsoft Defender Antivirus

Microsoft Defender Antivirus [cloud-delivered protection](cloud-protection-microsoft-defender-antivirus.md) provides near-instant, automated protection against new and emerging threats. Connectivity is required for [custom indicators](indicators-overview.md) when Microsoft Defender Antivirus is your active anti-malware solution and [EDR in block mode](edr-in-block-mode.md), which provides a fallback option when a non-Microsoft solution didn't perform a block.

Configure the static proxy using the Group Policy available in Administrative Templates:

1. **Administrative Templates > Windows Components > Microsoft Defender Antivirus > Define proxy server for connecting to the network**. 

2. Set it to **Enabled** and define the proxy server. The URL must have either `http://` or `https://`. For supported versions for `https://`, see [Manage Microsoft Defender Antivirus updates](microsoft-defender-antivirus-updates.md).

   :::image type="content" source="media/proxy-server-mdav.png" alt-text="The proxy server for Microsoft Defender Antivirus" lightbox="media/proxy-server-mdav.png":::

3. Under the registry key `HKLM\Software\Policies\Microsoft\Windows Defender`, the policy sets the registry value `ProxyServer` as `REG_SZ`. 

   The registry value `ProxyServer` takes the following string format:

    `<server name or ip>:<port>`

    For example, `http://10.0.0.6:8080`

> [!NOTE]
> If you are using static proxy setting on devices that are otherwise completely offline, meaning the operating system is unable to connect for the online certificate revocation list or Windows Update, then it is required to add the additional registry setting `SSLOptions` with a DWORD value of `2`. The parent registry path location for `SSLOptions` is `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet`. For more information about the `SSLOptions`, see [Cloud Protection](/defender-endpoint/configure-network-connections-microsoft-defender-antivirus).
>
> For resiliency purposes and the real-time nature of cloud-delivered protection, Microsoft Defender Antivirus caches the last known working proxy. Ensure your proxy solution does not perform SSL inspection, as that breaks the secure cloud connection.
>
> Microsoft Defender Antivirus doesn't use the static proxy to connect to Windows Update or Microsoft Update for downloading updates. Instead, it uses a system-wide proxy if configured to use Windows Update, or the configured internal update source according to the [configured fallback order](manage-protection-updates-microsoft-defender-antivirus.md). If necessary, you can use **Administrative Templates > Windows Components > Microsoft Defender Antivirus > Define proxy auto-config (.pac)** for connecting to the network. If you need to set up advanced configurations with multiple proxies, use **Administrative Templates > Windows Components > Microsoft Defender Antivirus > Define addresses to bypass proxy server** and prevent Microsoft Defender Antivirus from using a proxy server for those destinations.
> 
> You can use PowerShell with the `Set-MpPreference` cmdlet to configure these options: 
>    - `ProxyBypass`
>    - `ProxyPacUrl` 
>    - `ProxyServer` 

## Configure the proxy server manually using `netsh` command

Use `netsh` to configure a system-wide static proxy.

> [!NOTE]
> This configuration affects all applications, including Windows services which use `WinHTTP` with default proxy.

1. Open an elevated command line:
   1. Go to **Start** and type `cmd`.
   1. Right-click **Command prompt** and select **Run as administrator**.

2. Enter the following command and press **Enter**:

   ```cmd
   netsh winhttp set proxy <proxy>:<port>
   ```

   For example: `netsh winhttp set proxy 10.0.0.6:8080`

3. To reset the `winhttp` proxy, enter the following command and press **Enter**:

   ```cmd
   netsh winhttp reset proxy
   ```

See [Netsh Command Syntax, Contexts, and Formatting](/windows-server/networking/technologies/netsh/netsh-contexts) to learn more.

### Windows devices running the previous MMA-based solution

For devices running Windows 7, Windows 8.1, Windows Server 2008 R2, and servers that aren't upgraded to Unified Agent and use the Microsoft Monitoring Agent (also known as Log Analytics Agent) to connect to the Defender for Endpoint service, you can either use a system-wide proxy setting, or configure the agent to connect through a proxy or a log analytics gateway.

- Configure the agent to use a proxy: [Proxy configuration](/azure/azure-monitor/agents/log-analytics-agent#proxy-configuration)
- Set up Azure Log Analytics (formerly known as OMS Gateway) to act as proxy or hub: [Azure Log Analytics Agent](/azure/azure-monitor/platform/gateway#download-the-log-analytics-gateway)

[Onboard previous versions of Windows](onboard-downlevel.md)

## Next step

[STEP 3: Verify client connectivity to Microsoft Defender for Endpoint service URLs](verify-connectivity.md)

## Related articles

- [Disconnected environments, proxies, and Microsoft Defender for Endpoint](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/disconnected-environments-proxies-and-microsoft-defender-for/ba-p/3710502)
- [Use Group Policy settings to configure and manage Microsoft Defender Antivirus](use-group-policy-microsoft-defender-antivirus.md)
- [Onboard Windows devices](onboard-windows-client.md)
- [Troubleshoot Microsoft Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)
- [Onboard devices without Internet access to Microsoft Defender for Endpoint](configure-environment.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
