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

# Isolation exclusions (preview)

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

* **Full isolation**: In full isolation mode, the device is completely isolated from the network, and no exceptions are allowed. All traffic is blocked, except for essential communications with the Defender agent. Exclusions aren't applied in full isolation mode.

   Full isolation mode is the most secure option, suitable for scenarios where a high level of containment is necessary.

* **Selective isolation**: Selective isolation mode allows administrators to apply exclusions to ensure that critical tools and network communications can still function, even while maintaining the device's isolated state.

## How to define and apply isolation exclusions

### Prerequisites

* Isolation exclusion is available on Windows (minimum client version 10.8470) and macOS (minimum client version 101.240902).
* Enabling isolation exclusion requires Security Admin permissions or above.
* Isolation exclusion must be enabled. To enable isolation exclusion, sign in to the [Microsoft Defender portal](https://security.microsoft.com) and go to **Settings** > **Endpoints** > **Advanced features** and enable **Isolation Rxclusion Rules** feature.

   :::image type="content" source="./media/isolation-exclusions/enable-exclusions.png" alt-text="Screenshot showing how to enable isolation exclusions." lightbox="./media/isolation-exclusions/enable-exclusions.png":::

   > [!NOTE]
   > Once the feature is enabled, the default exclusions for classic Teams and Outlook will no longer apply, and the exclusions list will start empty across all platforms.

### Step 1: Define global exclusions in settings

[[NEED AN INTRO STATEMENT ABOUT WHAT WE'RE GOING TO BE DOING]]

1. Navigate to **Settings** > **Endpoints** > **Isolation Exclusion Rules**.

1. Select the relevant OS tab (Windows or macOS).

1. Select **+ Add exclusion rule**

   :::image type="content" source="./media/isolation-exclusions/add-new-exclusion-rule.png" alt-text="Screenshot showing how to add a new isolation exclusion rule." lightbox="./media/isolation-exclusions/add-new-exclusion-rule.png":::

1. On the **Add new exclusion rule** page, fill in the parameters. Red asterisks denote mandatory parameters.

   :::image type="content" source="./media/isolation-exclusions/exclusion-rule-definition.png" alt-text="Screenshot showing the fields required for defining an isoation exclusion rule." lightbox="./media/isolation-exclusions/exclusion-rule-definition.png":::

   | Parameter | Description |
   |:-----|:-----|
   | **Rule name** | Provide a name for the rule. |
   | **Rule description** | Describe the purpose of the rule. |
   |**Process path** (Windows only) | The file path of an executable is simply its location on the endpoint. You can define one executable to be used in each rule.<br><br>Example: `C:\Windows\System\Notepad.exe or %WINDIR%\Notepad.exe.`<br><br>**Note**: Exclusion won't apply to any child processes created by the specified process. |
| **Service name** (Windows only) | Windows service short names can be used in cases you want to exclude a service (not an application) that is sending or receiving traffic. Service short names can be retrieved by running the *Get-Service* command from PowerShell. You can define one service to be used in each rule.<br><br>Example: termservice |
| **Package family name** | The Package Family Name (PFN) is a unique identifier assigned to Windows app packages. The PFN format follows this structure: `<Name>_<PublisherId>`<br><br>Package family names can be retrieved by running the *Get-AppxPackage* command from PowerShell. For example, to get the new Microsoft Teams PFN, run `Get-AppxPackage MSTeams`, and look for the value of the **PackageFamilyName** property.<br><br>Supported on:<br>- Windows 11 (24H2)<br>- Windows Server 2025<br>- Windows 11 (22H2) Windows 11, version 23H2 KB5050092<br>- Windows Server, Version 23H2<br>- Windows 10 22H2 - KB 5050081 |
| **Direction** | The connection direction (Inbound/Outbound). Examples:<br><br>**Outbound connection**: If the device initiates a connection, for instance, an HTTPS connection to a remote backend server, define only an outbound rule. Example: The device sends a request to 1.1.1.1 (outbound), then no inbound rule is needed, as the response from the server is automatically accepted as part of the connection.<br><br>**Inbound connection**: If the device is listening to incoming connections, define an **inbound rule**.|
| **Remote IP** | The IP(s) not subject to network isolation as per the rule.<br><br>Supported IP formats:<br>- IPv4/IPv6, with optional CIDR notation<br>- A list of IPs<br><br>Valid input examples:<br>- Single IP address: `1.1.1.1`<br>- IPV6 address: `2001:db8:85a3::8a2e:370:7334`<br>- IP address with CIDR notation (IPv4 or IPv6): `1.1.1.1/24`<br>&nbsp;&nbsp;This example defines a range of IP addresses. In this case, it includes all IPs from 1.1.1.0 to 1.1.1.255. The /24 represents the subnet mask, which specifies that the first 24 bits of the address are fixed, and the remaining 8 bits define the address range.| 

  1.	Save and apply changes.

**These global rules apply whenever selective isolation is enabled for a device.**

### Step 2: Apply selective isolation to a specific device

1.	Navigate to the device page in the portal.
1.	Select **Isolate device** and choose **Selective isolation**.
1.	Check **Use isolation exclusions** to apply defined exclusion rules.
1.	Select **Confirm**.

:::image type="content" source="./media/isolation-exclusions/apply-exclusion-rule.png" alt-text="Screenshot showing how to apply an exclusion rule to a device." lightbox="./media/isolation-exclusions/apply-exclusion-rule.png":::

Exclusions that were applied to a specific device can be later reviewed in the Action Center history.

:::image type="content" source="./media/isolation-exclusions/review-exclusions.png" alt-text="Screenshot showing exclusions in the Action Center history." lightbox="./media/isolation-exclusions/review-exclusions.png":::
 
### API Configuration

To trigger isolation with exclusions via API, set the IsolationType parameter to "Selective". See [Isolate machine API](/defender-endpoint/api/isolate-machine) for detail.
 
## Exclusion Logic

* All rules that match will be applied.
* Within a single rule, conditions use AND logic (all must match).
* Undefined conditions in a rule are treated as "any" (that is, unrestricted for that parameter).

   For example, if the following rules are defined:

   ```
   Rule 1: 

      Process path = c:\example.exe
      Remote IP = 1.1.1.1
      Direction = Outbound
      
   Rule 2:

      Process path = c:\example_2.exe
      Direction = Outbound

   Rule 3:

      Remote IP = 18.18.18.18
      Direction = Inbound

   ```
   * *example.exe* will only be able to initiate network connections to remote IP 1.1.1.1.
   * *example_2.exe* can initiate network connections to every IP address.
   * The device can receive inbound connection from IP address 18.18.18.18.

## Considerations and limitations

When a device is isolated, any new Isolation Exclusion Rules added from the portal won't apply to the currently isolated device. Instead, newly added exclusions will only take effect for future isolation requests.

If an exclusion needs to be applied to a device that is already isolated, the following steps must be taken:

1. Unisolate the device.
1.	Ensure the exclusion rule is in place.
1.	Reisolate the device for the updated exclusion rule to take effect.

This behavior ensures that isolation rules remain consistent throughout the duration of an active isolation session.

## Related content

- [Take response actions on a device](respond-machine-alerts.md)
- [Investigate files](investigate-files.md)
- [Manual response actions in Microsoft Defender for Endpoint Plan 1](defender-endpoint-plan-1.md#manual-response-actions)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]