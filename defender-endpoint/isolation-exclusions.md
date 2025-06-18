---
title: Isolation exclusions in Microsoft Defender for Endpoint
description: Learn about to exclude specific processes, IP addresses, or services from network isolation when applying selective isolation action to devices.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
manager: orspod
audience: ITPro
ms.collection: 
- m365-security
- tier2
- mde-edr
ms.topic: how-to
ms.subservice: edr
search.appverid: met150
ms.date: 03/04/2025
---

# Isolation exclusions

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**

- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)

[!include[Prerelease information](../includes/prerelease.md)]

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

Isolation exclusion refers to the ability to exclude specific processes, IP addresses, or services from network isolation when applying selective isolation action to devices.

Network isolation in Microsoft Defender for Endpoint (MDE) restricts a compromised device's communication to prevent threat spread, but certain critical services, like management tools or security solutions, might need to remain operational.

Isolation exclusions allow designated processes or endpoints to bypass this restriction, ensuring essential functions (for example, remote remediation or monitoring) continue while limiting broader network exposure.

> [!WARNING]
> **Any exclusion weakens device isolation and increases security risks. To minimize risk, configure exclusions only when strictly necessary**.

Regularly review and update exclusions to align with security policies.

## Isolation modes

There are two modes of isolation: **full isolation** and **selective isolation**.

* **Full isolation**:

   * In this mode, the device is completely isolated from the network, and no exceptions are allowed. All traffic is blocked, except for essential communications with the Defender agent.
   * Exclusions aren't applied in full isolation mode. This is the most secure option, suitable for scenarios where a high level of containment is necessary.

* **Selective isolation**:

   * Selective isolation allows administrators to apply exclusions to ensure that critical tools and network communications can still function, even while maintaining the device's isolated state.

## How to Use

### Prerequisites

* Available on Windows (minimum client version 10.8470) and macOS (minimum client version 101.240902)
* Requires Global or Security Admin permissions.
* Once the feature is enabled, the default exclusions for classic Teams and Outlook will no longer apply, and the exclusions list will start empty across all platforms.
* Opt in to the new feature in the advanced features page:

:::image type="content" source="./media/isolation-exclusions/exclusions1.png" alt-text="Screenshot of exclusions1.":::

### Configuration steps

#### Defining Global Exclusions in Settings

1. Navigate to **Settings** > **Endpoints** > **Isolation Exclusion Rules**.

1. Select the relevant OS tab (Windows or macOS).

1.	Add:

   * **Remote IP Address** (IPv4/IPv6 with optional CIDR notation/list of IPs)

      * **Valid input examples**:

         * Single IP address: 1.1.1.1

         * IPv6 address: 2001:db8:85a3::8a2e:370:7334

         * IP address with CIDR notation (IPv4 or IPv6): 1.1.1.1/24

            This defines a range of IP addresses. In this case, it includes all IPs from 1.1.1.0 to 1.1.1.255. The /24 represents the subnet mask, which specifies that the first 24 bits of the address are fixed, and the remaining 8 bits define the address range.

   * **Connection Direction** (Inbound/Outbound)

      Example:

      * Outbound connection: If the device initiates a connection, for instance, an HTTPS connection to a remote backend server, define only an outbound rule.

         Example: The device sends a request to 1.1.1.1 (outbound), then no inbound rule is needed, as the response from the server is automatically accepted as part of the connection.
      * Inbound connection: If the device is listening to incoming connections, define an **inbound rule**.

   * **Process Path** (Windows only)

      * The file path of an executable is simply its location on the endpoint. You can define one executable to be used in each rule.

         For example: `C:\Windows\System\Notepad.exe or %WINDIR%\Notepad.exe.`

      * Exclusion won't apply to any child processes created by this process.

   * **Service Name** (Windows only)

      Windows service short names can be used in cases you want to exclude a service (not an application), that is sending or receiving traffic. Service short names can be retrieved by running the Get-Service command from PowerShell. You can define one service to be used in each rule.

      Example: termservice

   * The **Package Family Name (PFN)** is a unique identifier assigned to Windows app packages. The PFN format follows this structure: `<Name>_<PublisherId>` 

      Package family names can be retrieved by running the *Get-AppxPackage* command from PowerShell. For example, fetching new Microsoft Teams PFN:
      
      Run Get-AppxPackage *teams*

      Fetch PackageFamilyName property - Should be MSTeams_8wekyb3d8bbwe

      Supported on:
     
      * Windows 11 (24H2)
      * Windows Server 2025
      * Windows 11 (22H2) Windows 11, version 23H2 KB5050092
      * Windows Server, Version 23H2
      * Windows 10 22H2 - KB 5050081
  
1.	Save and apply changes.

**These global rules apply whenever selective isolation is enabled for a device.**
 
:::image type="content" source="./media/isolation-exclusions/exclusions2.png" alt-text="Screenshot of exclusions2.":::

:::image type="content" source="./media/isolation-exclusions/exclusions3.png" alt-text="Screenshot of exclusions3.":::
 
#### Applying Selective Isolation to a Specific Device

1.	Navigate to the device page in the portal.
1.	Select Isolate device and choose Selective Isolation.
1.	Check Use isolation exclusions to apply defined exclusion rules.
1.	Confirm the action.

:::image type="content" source="./media/isolation-exclusions/exclusions4.png" alt-text="Screenshot of exclusions4.":::

Exclusions that were applied to a specific device can be later reviewed in the Action Center history.

:::image type="content" source="./media/isolation-exclusions/exclusions5.png" alt-text="Screenshot of exclusions5.":::
 
#### API Configuration

To trigger isolation with exclusions via API, set IsolationType param = “Selective”.
 
## Exclusion Logic

* Within a single rule, conditions use AND logic (all must match).
* Between different rules, conditions use OR logic (any matching rule applies).
* Undefined conditions are treated as "any" (that is, unrestricted for that parameter).

   For example, if the following rules are defined:

   ```
   Rule 1: 

      process path = c:\example.exe
      Ip = 1.1.1.1
      Direction - Out
      
   Rule 2:

      process path = c:\example_2.exe
      Direction - Out

   Rule 3:

      Ip address: 18.18.18.18
      Direction - In

   ```
   * example.exe will only be able to initiate network connections to remote IP 1.1.1.1.
   * example_2.exe can initiate network connections to every IP address.
   * The device can receive inbound connection from Ip address 18.18.18.18.

## Limitations

* Only supports Windows and macOS.
* Process Path and Service Name exclusions are Windows-only.

When a device is isolated, any new Isolation Exclusion Rules added from the portal won't apply to the currently isolated device. Instead, newly added exclusions will only take effect for future isolation requests.

If an exclusion needs to be applied to a device that is already isolated, the following steps must be taken:

1. Unisolate the device.
1.	Ensure the exclusion rule is in place.
1.	Reisolate the device for the updated exclusion rule to take effect.

This behavior ensures that isolation rules remain consistent throughout the duration of an active isolation session.

## Related articles

- [Take response actions on a device](respond-machine-alerts.md)
- [Investigate files](investigate-files.md)
- [Manual response actions in Microsoft Defender for Endpoint Plan 1](defender-endpoint-plan-1.md#manual-response-actions)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]