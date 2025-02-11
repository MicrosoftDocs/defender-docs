---
title: Network requirements 
description: This article describes the IP addresses and ports you need to open to work with Defender for Cloud Apps.
ms.date: 02/29/2024
ms.topic: reference
---

# Network requirements



This article provides a list of ports and IP addresses you need to allow and allowlist to work with Microsoft Defender for Cloud Apps.

In order to stay up to date on IP ranges, it's recommended to refer to the following Azure service tags for Microsoft Defender for Cloud Apps services. The latest IP ranges are found in the service tag. For more information, see [Azure IP ranges](https://azureipranges.azurewebsites.net/).

| Service tag name    |    Defender for Cloud Apps services included   |
|:---|:---|
| MicrosoftCloudAppSecurity | Portal access, Access and session controls, SIEM agent connection, App connector, Mail server, Log collector. |

The following tables list the current static IP ranges covered by the MicrosoftCloudAppSecurity service tag. For latest list, refer to the [Azure service tags](/azure/virtual-network/service-tags-overview) documentation.


## View your data center

Some of the requirements below depend on which data center you're connected to.

To see which data center you're connecting to, do the following steps:

1. In the Microsoft Defender Portal, select **System > Settings > Cloud Apps > System > About**.

1. In the **About** screen, you can see the region and the data center.

    ![View your data center.](media/data-center.png)

## Portal access

To use Defender for Cloud Apps in the Microsoft Defender Portal, add **outbound port 443** for the following IP addresses and DNS names to your firewall's allowlist:

```ini
cdn.cloudappsecurity.com
cdn-discovery.cloudappsecurity.com
adaproddiscovery.azureedge.net
*.s-microsoft.com
*.msecnd.net
dev.virtualearth.net
flow.microsoft.com
static2.sharepointonline.com
*.blob.core.windows.net
discoveryresources-cdn-prod.cloudappsecurity.com
discoveryresources-cdn-gov.cloudappsecurity.com

```

Additionally, the following items should be allowed, depending on which data center you use:

|Data center|IP addresses|DNS name|
|----|----|----|
|US1|13.64.26.88, 13.64.29.32, 13.80.125.22, 13.91.91.243, 40.74.1.235, 40.74.6.204, 51.143.58.207, 52.137.89.147, 52.183.75.62, 23.101.201.123, 20.228.186.154|\*.us.portal.cloudappsecurity.com|
|US2|13.80.125.22, 20.36.222.59, 20.36.222.60, 40.74.1.235, 40.74.6.204, 51.143.58.207, 52.137.89.147, 52.183.75.62, 52.184.165.82, 20.15.114.156, 172.202.90.196|\*.us2.portal.cloudappsecurity.com|
|US3|13.80.125.22, 40.74.1.235, 40.74.6.204, 40.90.218.196, 40.90.218.198, 51.143.58.207, 52.137.89.147, 52.183.75.62, 20.3.226.231, 4.255.218.227|*.us3.portal.cloudappsecurity.com|
|EU1|13.80.125.22, 40.74.1.235, 40.74.6.204, 40.119.154.72, 51.143.58.207, 52.137.89.147, 52.157.238.58, 52.174.56.180, 52.183.75.62, 20.71.203.39, 137.116.224.49|\*.eu.portal.cloudappsecurity.com|
|EU2|13.80.125.22, 40.74.1.235, 40.74.6.204, 40.81.156.154, 40.81.156.156, 51.143.58.207, 52.137.89.147, 52.183.75.62, 20.0.210.84, 20.90.9.64|*.eu2.portal.cloudappsecurity.com|
|Gov US1|13.72.19.4, 52.227.143.223|*.us1.portal.cloudappsecurity.us|
|GCC| 52.227.23.181, 52.227.180.126| *.us1.portal.cloudappsecuritygov.com |

> [!NOTE]
> For portal access, instead of a wildcard (\*), you can choose to open only your specific tenant URL. For example, based on the screenshot above you can open: `contoso.us.portal.cloudappsecurity.com`. To determine your tenant URL, see the earlier section [View your data center](#view-your-data-center), and look for **API URL**.

## Access and session controls

Access and session control regions help provide a faster user experience and increase uptime.

Users are likely to be served from the closest region. For example, a user with a UK IP address is probably to be served by the UK West region.

When there's a high load or outage, the user may be served from a different region.

Configure your firewall for Conditional Access app control using the settings relevant to your environment. Microsoft Edge users benefit from in-browser protection. Access and session controls are applied in other browsers using a reverse proxy.

For more information, see [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md) and [In-browser protection with Microsoft Edge for Business (Preview)](in-browser-protection.md).

### Commercial customers

For commercial customers, to enable Defender for Cloud Apps reverse proxy, add **outbound port 443** for the following IP addresses and DNS names to your firewall's allowlist:




```ini
*.cas.ms
*.mcas.ms
*.admin-mcas.ms
```

Additionally, the following IP addresses, used by our reverse proxy regions, should be allowed for both inbound and outbound connections:

>[!NOTE]
>
> - Inbound IP addresses are used to receive incoming connections from end users by the proxy.
>
> - Outbound IP addresses are used to establish connections from the proxy to the applications.

|  | **IP Addresses** | **DNS Name** |
|--|--|--|
| **Session controls** | Australia Southeast: 40.81.58.184, 40.81.58.180, 20.40.163.96, 20.40.163.88, 40.81.62.221, 40.81.62.206, 20.40.160.184, 20.40.163.130, 20.11.210.40, 4.198.66.78, 4.198.66.135, 20.190.102.146, 4.198.66.126, 4.198.66.117, 4.198.66.105, 4.198.66.90, 20.92.29.167, 4.198.66.94, 4.198.66.92, 4.198.154.86<br /><br />Brazil South: 191.235.123.114, 191.235.121.164, 191.235.122.101, 191.235.119.253, 191.233.23.29, 191.234.216.181, 191.233.21.52, 191.234.216.10, 20.226.100.200, 191.235.57.180, 191.235.58.203, 191.235.58.201, 191.235.58.255, 191.235.59.0, 20.206.229.223, 191.235.58.56, 191.235.58.85, 191.235.54.192, 191.235.55.73, 20.206.75.66<br /><br />Canada Central: 40.82.187.211, 40.82.187.164, 52.139.18.234, 52.139.20.118, 40.82.187.199, 40.82.187.179, 52.139.19.215, 52.139.18.236, 4.205.74.7, 20.175.142.143, 20.175.143.220, 20.175.140.191, 20.175.140.128, 20.175.140.185, 20.175.143.233, 20.175.151.201, 20.175.142.19, 20.175.142.34, 20.175.151.166, 20.104.25.35<br /><br />Central India: 20.193.137.191, 20.193.137.153, 20.193.138.1, 20.193.136.234, 20.193.131.246, 20.193.131.250, 20.193.131.247, 20.193.131.248, 20.219.218.134, 20.204.236.74, 20.204.236.213, 20.204.236.115, 20.204.235.50, 20.219.226.117, 20.219.226.224, 20.204.236.147, 20.204.235.230, 20.204.236.17, 20.204.236.111, 20.235.115.136<br /><br />North Europe: 52.156.205.222, 52.156.204.99, 52.155.166.50, 52.142.127.127, 52.155.181.183, 52.155.168.45, 52.156.202.7, 52.142.124.23, 68.219.99.63, 20.166.182.182, 20.166.182.163, 20.166.182.165, 4.231.129.246, 20.166.182.193, 4.231.129.248, 20.54.22.195, 20.166.182.159, 20.166.182.171, 20.166.182.204, 40.127.131.206<br /><br />Southeast Asia: 40.65.170.125, 40.65.170.123, 52.139.245.40, 52.139.245.48, 40.119.203.158, 40.119.203.209, 20.184.61.67, 20.184.60.77, 20.187.114.178<br /><br />West Europe: 52.157.233.49, 52.157.235.27, 51.105.164.234, 51.105.164.241, 20.229.66.63, 20.76.151.201, 20.76.199.32, 20.76.199.126, 20.76.199.12, 20.76.198.169, 20.76.198.91, 20.76.199.14, 20.76.199.49, 20.93.194.151, 20.76.198.36, 20.160.197.20<br /><br />UK West: 40.81.121.140, 40.81.121.135, 51.137.137.121, 51.137.137.118, 20.90.50.115, 20.90.53.162, 20.90.53.126, 20.68.124.199, 20.90.53.127, 20.68.122.206, 20.90.53.132, 20.90.49.200, 51.142.187.141, 51.142.187.196, 20.90.53.133, 20.254.168.148<br /><br />East US: 104.45.170.196, 104.45.170.182, 52.151.238.5, 52.151.237.243, 104.45.170.173, 104.45.170.176, 52.224.188.157, 52.224.188.168, 20.168.249.164, 20.237.16.198, 20.124.59.146, 20.237.18.20, 20.121.150.131, 20.237.16.199, 20.237.22.162, 20.237.18.21, 20.237.22.163, 20.237.23.162, 20.124.59.116, 172.173.135.148<br /><br />West US 2: 52.156.88.173, 52.149.61.128, 52.149.61.214, 52.149.63.211, 20.190.7.24, 20.190.6.224, 20.190.7.239, 20.190.7.233<br /><br />West US 3: 20.106.103.34, 20.150.153.126, 20.118.150.70, 20.150.157.146, 20.150.153.110, 20.118.145.8, 20.150.152.101, 20.150.157.211, 20.150.158.183, 20.106.80.235, 20.106.81.123, 20.14.38.249, 20.14.38.222, 20.163.100.176<br /><br />East Asia: 20.195.89.219, 20.195.89.186, 20.239.27.66, 20.195.89.166, 20.239.26.193, 20.195.89.213, 20.195.89.72, 20.195.89.128, 20.195.89.62, 20.195.89.56, 20.205.119.72<br /><br />France Central: 51.103.95.227, 20.74.94.42, 20.74.94.220, 20.74.94.113, 20.74.115.131, 20.74.94.109, 20.74.95.102, 20.74.114.253, 20.74.94.73, 20.74.94.136, 20.74.94.139, 51.103.31.141                                                                                                | *.mcas.ms<br/>\*.admin-mcas.ms |
| **Access controls** | Australia Southeast: 20.42.228.161, 20.211.237.204, 4.198.66.78, 4.198.66.135, 20.190.102.146, 4.198.66.126, 4.198.66.117, 4.198.66.105, 4.198.66.90, 20.92.29.167, 4.198.66.94, 4.198.66.92, 4.198.154.86<br /><br />Brazil South: 191.235.228.36, 104.41.37.185, 20.201.80.33, 104.41.37.185, 191.235.57.180, 191.235.58.203, 191.235.58.201, 191.235.58.255, 191.235.59.0, 20.206.229.223, 191.235.58.56, 191.235.58.85, 191.235.54.192, 191.235.55.73, 20.206.75.66<br /><br />North Europe: 68.219.99.39, 20.166.182.182, 20.166.182.163, 20.166.182.165, 4.231.129.246, 20.166.182.193, 4.231.129.248, 20.54.22.195, 20.166.182.159, 20.166.182.171, 20.166.182.204, 40.127.131.206<br /><br />West Europe: 13.69.81.118, 20.103.48.225, 13.69.81.118, 20.76.151.201, 20.76.199.32, 20.76.199.126, 20.76.199.12, 20.76.198.169, 20.76.198.91, 20.76.199.14, 20.76.199.49, 20.93.194.151, 20.76.198.36, 20.160.197.20<br /><br />Southeast Asia: 20.43.132.128, 20.24.14.233, 20.195.116.193, 20.187.116.207<br /><br />UK West: 51.137.163.32, 20.90.50.109, 20.90.53.162, 20.90.53.126, 20.68.124.199, 20.90.53.127, 20.68.122.206, 20.90.53.132, 20.90.49.200, 51.142.187.141, 51.142.187.196, 20.90.53.133, 20.254.168.148<br /><br />East US: 20.49.104.46, 40.117.113.165, 52.249.211.17, 40.117.113.165, 20.237.16.198, 20.124.59.146, 20.237.18.20, 20.121.150.131, 20.237.16.199, 20.237.22.162, 20.237.18.21, 20.237.22.163, 20.237.23.162, 20.124.59.116, 172.173.135.148<br /><br /> France Central: 20.111.40.153, 20.74.94.42, 20.74.94.220, 20.74.94.113, 20.74.115.131, 20.74.94.109, 20.74.95.102, 20.74.114.253, 20.74.94.73, 20.74.94.136, 20.74.94.139, 51.103.31.141<br /><br />West US 2: 20.115.232.7<br /><br />Canada Central: 20.48.202.161, 4.205.74.15, 20.175.142.143, 20.175.143.220, 20.175.140.191, 20.175.140.128, 20.175.140.185, 20.175.143.233, 20.175.151.201, 20.175.142.19, 20.175.142.34, 20.175.151.166, 20.104.25.35<br /><br />East Asia: 20.187.116.207, 20.195.89.219, 20.195.89.186, 20.239.27.66, 20.195.89.166, 20.239.26.193, 20.195.89.213, 20.195.89.72, 20.195.89.128, 20.195.89.62, 20.195.89.56, 20.205.119.72<br /><br /> West US 3: 20.150.143.88, 20.150.153.126, 20.118.150.70, 20.150.157.146, 20.150.153.110, 20.118.145.8, 20.150.152.101, 20.150.157.211, 20.150.158.183, 20.106.80.235, 20.106.81.123, 20.14.38.249, 20.14.38.222, 20.163.100.176<br /><br />Central India: 20.235.81.243, 20.204.236.74, 20.204.236.213, 20.204.236.115, 20.204.235.50, 20.219.226.117, 20.219.226.224, 20.204.236.147, 20.204.235.230, 20.204.236.17, 20.204.236.111, 20.235.115.136| \*.access.mcas.ms<br/> |
| **SAML proxy** | North Europe: 20.50.64.15, 40.127.131.206<br /><br />East US: 20.49.104.26, 172.173.135.148<br /><br />West US 2: 20.42.128.102<br /><br />West US 2: 20.163.100.176| \*.us.saml.cas.ms \*.us2.saml.cas.ms \*.us3.saml.cas.ms \*.eu.saml.cas.ms *.eu2.saml.cas.ms |

### US Government offerings

For US Government GCC High customers, to enable Defender for Cloud Apps reverse proxy, add **outbound port 443** for the following DNS names to your firewall's allowlist:




```ini
*.mcas-gov.us
*.admin-mcas-gov.us
```

Additionally, the following IP addresses, used by our reverse proxy regions, should be allowed for both inbound and outbound connections:

>[!NOTE]
>
> - Inbound IP addresses are used to receive incoming connections from end users by the proxy.
>
> - Outbound IP addresses are used to establish connections from the proxy to the applications.

For **US Government GCC High** customers:

||IP addresses|DNS name|
|----|----|----|
|**Session controls**|US Gov Arizona: 52.244.144.65, 52.244.43.90, 52.244.43.225, 52.244.215.117, 52.235.134.195, 52.126.54.167, 52.126.55.65 <br /><br />US Gov Virginia: 13.72.27.223, 13.72.27.219, 13.72.27.220, 13.72.27.222, 20.141.230.137, 52.235.179.167, 52.235.184.112|\*.mcas-gov.us<br/>\*.admin-mcas-gov.us|
|**Access controls**|US Gov Arizona: 52.244.215.83, 52.244.212.197, 52.127.2.97, 52.126.54.254, 52.126.55.65, 52.235.156.231, 52.235.156.197, 52.235.157.183, 52.235.156.9, 52.235.156.225, 52.235.157.175, 52.235.157.131, 52.235.157.11, 52.126.39.112, 52.235.156.151 <br /><br />US Gov Virginia: 13.72.27.216, 13.72.27.215, 52.127.50.130, 52.235.179.123, 52.245.252.18, 52.245.252.131, 52.245.252.191, 52.245.253.12, 52.245.253.58, 52.245.253.229, 52.245.254.39, 52.245.254.51, 52.245.254.212, 52.245.254.245, 52.235.184.112, 52.235.184.112|\*.access.mcas-gov.us<br/>\*.access.cloudappsecurity.us|
|**SAML proxy**|US Gov Arizona: 20.140.49.129, 52.126.55.65<br /><br />US Gov Virginia: 52.227.216.80, 52.235.184.112|\*.saml.cloudappsecurity.us|

For **US Government GCC** customers:

||IP addresses|DNS name|
|----|----|----|
|**Session controls**|US Gov Arizona: 52.235.147.86, 52.126.49.55, 52.126.48.233 <br /><br /> US Gov Virginia: 52.245.225.0, 52.245.224.229, 52.245.224.234, 52.245.224.228, 20.141.230.215, 52.227.10.254, 52.126.48.233, 52.227.3.207 | \*.mcas-gov.ms<br/>\*.admin-mcas-gov.ms|
|**Access controls** |US Gov Arizona: 52.127.2.97, 52.235.143.220, 52.126.48.233, 52.126.33.153, 52.126.39.65, 52.235.138.253, 52.235.139.4, 52.235.139.36, 52.235.139.75, 52.235.139.92, 52.235.139.103, 52.235.139.134, 52.235.139.141 <br /><br />US Gov Virginia: 52.245.224.235, 52.245.224.227, 52.127.50.130, 52.245.222.168, 52.245.222.172, 52.245.222.180, 52.245.222.209, 52.245.223.38, 52.245.223.72, 52.245.223.177, 52.245.223.181, 52.245.223.182, 52.245.223.190, 23.97.12.140, 52.227.3.207  | \*.access.mcas-gov.ms|
|**SAML proxy** |US Gov Arizona: 52.126.48.233 <br /> US Gov Virginia: 52.227.216.80, 52.126.48.233, 52.227.3.207 | \*.saml.cloudappsecuritygov.com|

## SIEM agent connection

To enable Defender for Cloud Apps to connect to your SIEM, add **outbound port 443** for the following IP addresses to your firewall's allowlist:

|Data center|IP addresses|
|----|----|
|US1|13.64.26.88, 13.64.29.32, 13.80.125.22, 13.91.91.243, 40.74.1.235, 40.74.6.204, 51.143.58.207, 52.137.89.147, 52.183.75.62, 23.101.201.123, 20.228.186.154|
|US2|13.80.125.22, 20.36.222.59, 20.36.222.60, 40.74.1.235, 40.74.6.204, 51.143.58.207, 52.137.89.147, 52.183.75.62, 52.184.165.82, 20.15.114.156, 172.202.90.196|
|US3|13.80.125.22, 40.74.1.235, 40.74.6.204, 40.90.218.196, 40.90.218.198, 51.143.58.207, 52.137.89.147, 52.183.75.62, 20.3.226.231, 4.255.218.227|
|EU1|13.80.125.22, 40.74.1.235, 40.74.6.204, 40.119.154.72, 51.143.58.207, 52.137.89.147, 52.157.238.58, 52.174.56.180, 52.183.75.62, 20.71.203.39, 137.116.224.49|
|EU2|13.80.125.22, 40.74.1.235, 40.74.6.204, 40.81.156.154, 40.81.156.156, 51.143.58.207, 52.137.89.147, 52.183.75.62, 20.0.210.84, 20.90.9.64|
|Gov US1|13.72.19.4, 52.227.143.223|
|GCC| 52.227.23.181, 52.227.180.126|

> [!NOTE]
>
> - If you didn't specify a proxy when you set up the Defender for Cloud Apps SIEM agent, you need to allow http connections on port 80 for the URLs listed on the [Azure TLS certificate changes](/azure/security/fundamentals/tls-certificate-changes#will-this-change-affect-me) page. This is used for checking certificate revocation status when you connect to Defender for Cloud Apps.
> - A genuine Microsoft Defender for Cloud Apps certificate usage is required for the SIEM agent connection.

## App connector

For some third-party apps to be accessed by Defender for Cloud Apps, these IP addresses may be used. The IP addresses enable Defender for Cloud Apps to collect logs and provide access for the Defender for Cloud Apps console.

> [!NOTE]
> You may see these IP addresses in activity logs from the vendor because Defender for Cloud Apps performs governance actions and scans from these IP addresses.

To connect to third-party apps, enable Defender for Cloud Apps to connect from these IP addresses:

|Data center|IP addresses|
|----|----|
|US1|13.64.26.88, 13.64.29.32, 13.64.30.76, 13.64.30.117, 13.64.30.118, 13.64.31.116, 13.64.196.27, 13.64.198.19, 13.64.198.97, 13.64.199.41, 13.68.76.47, 13.86.176.189, 13.86.176.211, 13.91.61.249, 13.91.91.243, 13.91.98.185, 13.93.216.68, 13.93.233.42, 40.118.211.172, 104.42.54.148, 104.209.35.177, 40.83.194.192, 40.83.194.193, 40.83.194.194, 40.83.194.195, 40.83.194.196, 40.83.194.197, 40.83.194.198, 40.83.194.199, 40.83.194.200, 40.83.194.201, 40.83.194.202, 40.83.194.203, 40.83.194.204, 40.83.194.205, 40.83.194.206, 40.83.194.207, 13.64.16.134, 13.64.16.130, 13.64.16.131, 13.64.16.136, 13.64.16.133, 13.64.16.137, 13.64.16.132, 13.64.16.129, 13.64.16.138, 13.64.16.135, 20.245.106.190, 20.245.106.217, 20.253.255.143, 20.253.255.153, 20.253.255.130, 20.253.255.157, 20.66.8.42, 20.253.255.134, 20.253.255.128, 20.253.255.146, 20.237.121.229, 20.237.122.187, 20.232.229.26, 20.232.228.132, 20.232.228.47, 20.232.228.143, 20.232.228.80, 20.232.228.94, 20.232.228.153, 20.232.228.85, 13.86.219.235, 13.86.219.238, 13.86.219.239, 13.86.219.236, 13.86.219.249, 13.86.219.247, 13.86.219.231, 13.86.219.228, 13.86.219.244, 13.86.219.233, 13.86.219.232, 13.86.219.237, 13.86.219.230, 13.86.219.241, 13.86.219.234, 13.86.219.250, 13.86.219.248, 13.86.219.240, 13.86.219.226, 13.86.219.227, 13.86.219.245, 13.86.219.229, 13.86.219.225, 13.86.219.246, 13.86.219.243, 13.86.219.242, 13.86.219.224, 23.101.201.123, 20.228.186.154|
|US2|13.68.76.47, 20.36.222.59, 20.36.222.60, 40.67.152.91, 40.67.154.160, 40.67.155.146, 40.67.159.55, 40.84.2.83, 40.84.4.93, 40.84.4.119, 52.184.165.82, 52.232.224.227, 52.232.225.84, 104.42.54.148, 104.46.116.211, 104.46.116.211, 104.46.121.72, 104.46.121.72, 104.46.122.189, 104.46.122.189, 20.57.54.192, 20.57.54.193, 20.57.54.194, 20.57.54.195, 20.57.54.196, 20.57.54.197, 20.57.54.198, 20.57.54.199, 20.57.54.200, 20.57.54.201, 20.57.54.202, 20.57.54.203, 20.57.54.204, 20.57.54.205, 20.57.54.206, 20.57.54.207, 20.85.63.179, 20.85.63.177, 20.85.63.185, 20.85.63.183, 20.85.63.180, 20.85.63.184, 20.85.63.182, 20.85.63.178, 20.85.63.181, 20.85.63.186, 20.96.151.151, 20.96.151.147, 20.96.151.153, 20.96.151.149, 20.96.151.148, 20.96.151.145, 20.96.151.144, 20.96.151.146, 20.96.151.152, 20.96.151.150, 20.96.83.110, 20.96.87.32, 20.7.102.52, 20.22.87.7, 20.7.102.59, 20.7.101.234, 20.7.102.51, 20.7.102.40, 20.7.96.98, 20.7.102.54, 52.154.237.66, 52.154.234.32, 20.12.128.213, 20.12.130.50, 20.12.130.20, 20.221.93.63, 20.12.128.239, 20.221.93.52 ,20.12.128.152, 20.12.130.57, 20.15.114.156, 172.202.90.196|
|US3|13.68.76.47, 40.90.218.196, 40.90.218.197, 40.90.218.198, 40.90.218.203, 40.90.220.190, 40.90.220.196, 51.143.120.236, 51.143.120.242, 104.42.54.148, 52.156.123.128, 52.156.123.129, 52.156.123.130, 52.156.123.131, 52.156.123.132, 52.156.123.133, 52.156.123.134, 52.156.123.135, 52.156.123.136, 52.156.123.137, 52.156.123.138, 52.156.123.139, 52.156.123.140, 52.156.123.141, 52.156.123.142, 52.156.123.143, 20.115.249.168, 20.115.249.160, 20.115.249.161, 20.115.249.169, 20.115.249.164, 20.115.249.166, 20.115.249.165, 20.115.249.170, 20.115.249.163, 20.115.249.167, 20.115.170.133, 20.115.170.129, 20.115.170.131, 20.115.170.128, 20.115.170.135, 20.115.170.137, 20.115.170.132, 20.115.170.136, 20.115.170.130, 20.115.170.134, 20.112.52.85, 20.112.52.87, 20.112.52.80, 20.112.52.83, 20.112.52.81, 20.112.52.82, 20.112.52.86, 20.112.52.88, 20.112.52.84, 20.112.52.89, 20.64.198.145, 20.64.198.151, 20.64.198.149, 20.64.198.146, 20.64.198.147, 20.64.198.150, 20.64.198.148, 20.64.198.153, 20.64.198.144, 20.64.198.152, 20.115.170.117, 20.115.170.112, 20.115.170.113, 20.115.170.120, 20.115.170.114, 20.115.170.121, 20.115.170.116, 20.115.170.115, 20.115.170.118, 20.115.170.119, 20.190.20.133, 20.64.193.51, 20.99.133.17, 20.99.133.32, 20.99.133.43, 20.99.133.83, 20.99.132.218, 20.99.133.64, 20.99.133.71, 20.99.133.63, 20.69.33.38, 20.69.33.177, 20.165.241.40, 20.165.243.11, 20.165.243.57, 20.165.143.180, 20.165.240.158, 20.165.143.148, 20.165.241.61, 20.165.240.156, 172.179.162.236, 52.183.56.43, 52.229.14.50, 52.229.14.55, 52.183.60.99, 52.229.14.79, 52.183.60.44, 52.191.128.12, 52.183.66.205, 52.229.14.25, 52.229.14.48, 52.229.14.72, 52.183.60.91, 52.229.14.29, 52.229.14.88, 52.183.56.41, 52.183.63.140, 52.229.14.39, 52.183.56.92, 52.229.14.86, 52.229.14.37, 52.229.14.70, 52.191.128.16, 52.229.14.59, 52.229.14.91, 52.229.14.32, 52.229.14.65, 20.3.226.231, 4.255.218.227|
|EU1|13.80.22.71, 13.95.29.177, 13.95.30.46, 40.67.219.133, 40.114.217.8, 40.114.217.8, 40.115.24.65, 40.115.24.65, 40.115.25.50, 40.115.25.50, 40.119.154.72, 51.105.55.62, 51.105.179.157, 51.137.200.32, 52.157.232.110, 52.157.233.92, 52.157.233.133, 52.157.238.58, 52.157.239.110, 52.174.56.180, 20.73.240.208, 20.73.240.209, 20.73.240.210, 20.73.240.211, 20.73.240.212, 20.73.240.213, 20.73.240.214, 20.73.240.215, 20.73.240.216, 20.73.240.217, 20.73.240.218, 20.73.240.219, 20.73.240.220, 20.73.240.221, 20.73.240.222, 20.73.240.223, 20.101.177.19, 20.101.177.21, 20.101.177.18, 20.101.177.20, 20.101.177.17, 20.101.177.16, 20.101.177.23, 20.101.177.25, 20.101.177.22, 20.101.177.24, 20.101.177.27, 20.101.177.30, 20.101.177.31, 20.101.177.26, 20.101.177.28, 20.101.177.29, 20.101.250.216, 20.101.251.166, 20.23.198.95, 20.23.198.34, 20.23.198.132, 20.23.198.198, 20.23.199.120, 20.23.198.119, 20.23.198.195, 20.23.198.244, 20.166.184.39, 20.166.184.36, 40.127.213.98, 40.127.213.99, 40.127.213.91, 40.127.213.90, 40.127.213.75, 40.127.213.67, 40.127.213.74, 40.127.213.66, 20.71.203.39, 137.116.224.49|
|EU2|40.81.152.171, 40.81.152.172, 40.81.156.153, 40.81.156.154, 40.81.156.155, 40.81.156.156, 51.105.55.62, 51.137.200.32, 51.145.108.227, 51.145.108.250, 20.58.119.224, 20.58.119.225, 20.58.119.226, 20.58.119.227, 20.58.119.228, 20.58.119.229, 20.58.119.230, 20.58.119.231, 20.58.119.232, 20.58.119.233, 20.58.119.234, 20.58.119.235, 20.58.119.236, 20.58.119.237, 20.58.119.238, 20.58.119.239, 20.108.77.57, 20.108.77.54, 20.108.77.49, 20.108.77.53, 20.108.77.52, 20.108.77.55, 20.108.77.51, 20.108.77.58, 20.108.77.50, 20.108.77.56, 20.26.34.120, 20.108.140.27, 20.108.139.189, 20.108.140.32, 20.108.140.44, 20.108.140.64, 20.108.139.112, 20.108.139.147, 20.108.139.131, 20.108.140.55, 20.108.139.199, 20.108.139.236, 20.108.139.172, 20.108.139.132, 20.108.139.213, 20.108.139.145, 20.26.179.11, 20.26.179.32, 4.234.34.182, 4.234.34.92, 4.234.34.186, 4.234.34.124, 4.234.34.202, 4.234.34.86, 4.234.34.91, 4.234.34.123, 20.254.173.207, 20.254.174.189, 51.11.108.110, 51.11.108.92, 51.11.108.75, 51.11.108.101, 51.11.108.72, 51.11.108.103, 51.11.108.107, 51.11.108.85, 20.0.210.84, 20.90.9.64|
|Gov US1|52.227.138.248, 52.227.142.192, 52.227.143.223, 20.141.237.150, 20.141.168.108, 20.141.229.90, 52.245.229.181, 20.141.169.206, 20.141.66.57, 52.245.248.176, 20.141.83.238, 52.235.172.25, 20.141.65.135, 20.141.168.228, 20.141.228.42, 20.141.229.9, 20.141.169.251, 20.141.70.136, 20.141.225.225, 20.158.9.149, 20.158.10.67, 20.158.10.226, 20.158.10.234, 20.158.11.18, 20.158.11.199, 20.158.11.236, 20.158.11.239, 20.158.11.244, 20.158.33.105, 20.158.33.122, 20.158.33.126, 52.245.254.197, 52.243.227.26, 52.243.227.27, 52.243.227.32, 52.243.227.33, 52.243.227.48, 52.243.227.49, 52.243.227.66, 52.243.227.67, 52.243.227.72, 52.243.227.73, 52.243.227.80, 52.243.227.81, 52.243.227.96|
|GCC|52.227.23.181, 52.227.180.126, 20.141.235.17, 20.141.236.69, 52.245.248.46, 20.141.235.182, 52.245.248.186, 20.141.236.251, 20.141.238.58, 20.141.238.71, 52.245.248.137, 52.245.249.102, 20.141.236.184, 52.245.249.161, 20.141.236.160, 52.245.249.166, 52.245.249.194, 20.141.237.71, 52.245.212.156, 52.245.233.180, 20.141.93.154, 20.141.93.206, 20.141.94.107, 20.141.94.119, 20.141.94.127, 20.141.94.248, 20.141.95.95, 20.141.95.101, 20.141.95.166, 20.141.95.176, 20.141.143.35, 20.141.143.56, 20.141.143.153, 52.243.225.220, 52.243.226.58, 52.243.226.194, 52.243.226.195, 52.243.226.216, 52.243.226.217, 52.243.226.230, 52.243.226.231, 52.243.231.139, 52.243.231.186, 52.243.231.212, 52.243.232.76, 52.245.182.218|

## Mail server

To enable notifications to be sent from the default template and settings, add these IP addresses to your anti-spam allowlist. The Defender for Cloud Apps dedicated email IP addresses are:

- 65.55.234.192/26
- 207.46.50.192/26
- 65.55.52.224/27
- 94.245.112.0/27
- 111.221.26.0/27
- 207.46.200.0/27

## Log collector

To enable cloud discovery features using a log collector and detect Shadow IT in your organization, open the following items:

- Allow the log collector to receive inbound FTP and Syslog traffic as configured for the data sources.
- Allow the log collector to initiate outbound traffic to the Defender for Cloud Apps APIs (for example `<mytenant>.us2.cloudappsecurity.com`) on port 443 and access to port 53 (DNS services). To find your tenant URL, see [View your data center](#view-your-data-center).
- Allow the log collector to initiate outbound traffic to the Azure blob storage on port 443:

  | Data center |                        URL                                 |
  |-------------|------------------------------------------------------------|
  |     US1     | `https://adaprodconsole.blob.core.windows.net/`             |
  |     US2     | `https://prod03use2console1.blob.core.windows.net/`         |
  |     US3     | `https://prod5usw2console1.blob.core.windows.net/`          |
  |     EU1     | `https://prod02euwconsole1.blob.core.windows.net/`          |
  |     EU2     | `https://prod4uksconsole1.blob.core.windows.net/`           |
  |   Gov US1   | `https://gprd1usgvconsole1.blob.core.usgovcloudapi.net/`   |
  |     GCC     | `https://gccm1usgvconsole1.blob.core.usgovcloudapi.net/`    |

> [!NOTE]
>
> - If your firewall requires a static IP address access list and doesn't support allowing based on URL, allow the log collector to initiate outbound traffic to the [Microsoft Azure datacenter IP ranges](https://www.microsoft.com/download/details.aspx?id=56519) on port 443.
> - If you didn't specify a proxy when you set up the log collector, you need to allow http connections on port 80 for the URLs listed on the [Azure TLS certificate changes](/azure/security/fundamentals/tls-certificate-changes#will-this-change-affect-me) page. This is used for checking certificate revocation status when you connect to the Defender for Cloud Apps APIs.

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]
