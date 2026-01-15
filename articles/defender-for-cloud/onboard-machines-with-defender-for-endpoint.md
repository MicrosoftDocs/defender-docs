---
title: Onboard non-Azure servers with Defender for Endpoint
description: Learn how to connect your non-Azure machines directly to Microsoft Defender for Cloud with Microsoft Defender for Endpoint.
ms.topic: quickstart
ms.date: 05/01/2025
author: Elazark
ms.author: elkrieger

---

# Connect your non-Azure servers to Microsoft Defender for Cloud with Defender for Endpoint

Microsoft Defender for Cloud lets you onboard on-premises and multicloud servers through Microsoft Defender for Endpoint. This setup protects non-Azure machines without the need for any additional agents and shows all servers, Azure and non-Azure, in one unified security view.

> [!NOTE]
> To connect your non-Azure machines via Azure Arc, see [Connect your non-Azure machines to Microsoft Defender for Cloud with Azure Arc](quickstart-onboard-machines.md).

## How it works

Direct onboarding is a native integration between Defender for Endpoint and Defender for Cloud. When enabled, non-Azure servers with Defender for Endpoint appear in Defender for Cloud under the selected subscription.

Defender for Cloud uses the selected subscription for licensing, billing, alerts, and security insights. This subscription doesn’t support Azure management capabilities such as Azure Policy or Guest Configuration. Use other tools to manage security settings, such as antivirus policies, attack surface reduction rules, and updates.

### Manage security settings

| Server type | Management options |
| ------------ | ------------------ |
| **Windows Server** | [Defender for Endpoint security settings management](/defender-endpoint/mde-security-settings-management) <br/> [Configuration Manager](/intune/configmgr/protect/deploy-use/defender-advanced-threat-protection) <br/> [Group Policy](/defender-endpoint/use-group-policy-microsoft-defender-antivirus) <br/> [PowerShell](/powershell/module/defender/) <br/> [WMI](/defender-endpoint/use-wmi-microsoft-defender-antivirus) |
| **Linux Server** | [Defender for Endpoint security settings management](/defender-endpoint/mde-security-settings-management) <br/> [Configure security settings in Defender for Endpoint on Linux](/defender-endpoint/linux-preferences) |

## Availability

This capability is **generally available (GA)** and supports on-premises servers and multicloud VMs.

Supported operating systems include all Windows Server and Linux server versions supported by Defender for Endpoint. For OS-specific requirements, see:

- [Supported Windows Server versions](/microsoft-365/security/defender-endpoint/minimum-requirements#supported-windows-versions)
- [Supported Linux server versions](/microsoft-365/security/defender-endpoint/microsoft-defender-endpoint-linux#system-requirements)

This capability works with both:
- **Defender for Servers Plan 1 (P1)**
- **Defender for Servers Plan 2 (P2)** (with [limitations](#current-limitations))

## Enable direct onboarding

When you enable direct onboarding, Defender for Cloud applies the setting to both existing and new servers onboarded to Defender for Endpoint in the same Microsoft Entra tenant. After you enable it, your servers appear under the selected subscription, and their alerts, vulnerability data, and inventory integrate with Defender for Cloud.

Before you begin:

- Make sure you have the required permissions:
    - **Subscription Owner** permissions on the subscription you select for onboarding.
    - **Microsoft Entra Security Administrator** (or higher) permissions on the tenant.
- If your tenant already has a Defender for Endpoint for Servers license, [indicate it](faq-defender-for-servers.yml#can-i-get-a-discount-if-i-already-have-a-microsoft-defender-for-endpoint-license-) in Defender for Cloud
- Review the [current limitations](#current-limitations)

### Enable in the Defender for Cloud portal

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Defender for Cloud**.

1. Go to **Environment settings** > **Direct onboarding**.

1. Toggle direct onboarding to **On**.

1. Select the subscription you want to use for servers onboarded through Defender for Endpoint.

1. Select **Save**.

:::image type="content" source="./media/onboard-machines-with-defender-for-endpoint/direct-onboarding-subscription.png" alt-text="Screenshot showing the Direct onboarding toggle in Defender for Cloud portal." lightbox="./media/onboard-machines-with-defender-for-endpoint/direct-onboarding-subscription.png":::

Non-Azure servers might take up to 24 hours to appear in the selected subscription.

### Deploy Defender for Endpoint on your servers

Deploy the Defender for Endpoint agent the same way on Windows and Linux servers, with or without direct onboarding. See [Onboard servers to Defender for Endpoint](/defender-endpoint/onboard-server) for more information.

## Current limitations

- **Plan support** – Direct onboarding provides all Defender for Servers Plan 1 features. Some Defender for Servers Plan 2 features still require Azure Arc. If you enable Plan 2, directly onboarded servers gain Plan 1 + [Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management-capabilities) features.
- **Multicloud support** – Direct onboarding supports AWS and GCP VMs using the Defender for Endpoint agent. However, if you also connect your AWS or GCP account to Defender for Servers via multicloud connectors, we still recommend using Azure Arc.
- **Simultaneous onboarding** – Defender for Cloud automatically correlates servers onboarded through multiple methods. Older Defender for Endpoint agent versions might limit this behavior and, in rare cases, cause duplicate billing. Ensure agents meet or exceed these minimum versions:

  |Operating System|Minimum agent version|
  | -------- | -------- |
  |Windows Server 2019 and later | 10.8555|
  |Windows Server 2016 or Windows 2012 R2 <br/>([modern, unified solution](/defender-endpoint/onboard-server#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2))|10.8560|
  |Linux (AMD64)|30.101.23052.009|
  |Linux (ARM64)|30.101.25022.004|

## Next steps

After onboarding your non-Azure servers, you can monitor their security posture and connection status in Defender for Cloud:

- [Explore and manage your resources with asset inventory](asset-inventory.md)
