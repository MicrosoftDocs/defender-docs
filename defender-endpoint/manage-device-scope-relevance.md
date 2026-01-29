---
title: Manage device scope and relevance in Microsoft Defender for Endpoint
description: Control which devices are relevant to your security operations through automatic tagging and manual exclusion
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: how-to
search.appverid: met150
ms.date: 01/29/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Manage device scope and relevance

Not all devices discovered in your network require the same level of security attention. Some devices are transient (temporary guests, test devices), while others might be permanently out of scope for vulnerability management (isolated lab environments, decommissioned systems). Managing device scope ensures your security team focuses on devices that matter.

This article explains how to control which devices Defender for Endpoint treats as relevant to your security operations.

## Why manage device scope?

Accurate device scope management provides:

- **Focused security operations**: Reduce noise from irrelevant devices in your alerts and investigations
- **Accurate risk metrics**: Ensure exposure scores and secure scores reflect your actual production environment
- **Efficient resource use**: Avoid investigating or remediating devices that don't require security attention
- **Better reporting**: Generate reports that reflect your true security posture without noise from test or transient devices

## Two approaches to managing scope

Defender for Endpoint provides two complementary mechanisms for managing device relevance:

| Approach | Type | Impact | Use when |
|----------|------|--------|----------|
| **Transient device tagging** | Automatic | Filters devices from inventory view by default | Devices appear briefly or irregularly on the network (guests, test devices, temporary VMs) |
| **Device exclusion** | Manual | Removes devices from vulnerability management visibility, exposure scores, and reports | Devices are permanently out of scope for vulnerability management (lab devices, decommissioned systems, duplicate entries) |

## Automatic scope management: Transient device tagging

### What is transient device tagging?

Transient device tagging automatically identifies and tags devices that appear intermittently on your network. These devices are typically:

- Guest devices connecting temporarily
- Test devices used sporadically
- Virtual machines that spin up and down
- Devices that don't maintain persistent network presence

Transient tagging doesn't delete devices from your inventory—it simply tags them so you can filter them out by default.

### How transient tagging works

- **Automatic detection**: An internal algorithm identifies transient devices based on network appearance patterns
- **Excluded device types**: Servers, network devices, printers, industrial devices, surveillance equipment, smart facility devices, and smart appliances are never tagged as transient
- **Default filtering**: Transient devices are filtered out of the device inventory view by default
- **Configurable visibility**: You can adjust filters to show or hide transient devices as needed

> [!IMPORTANT]
> Transient device tagging is automatic and cannot be disabled. However, you can control whether transient devices are visible in your inventory by adjusting filter settings.

### View transient devices

To see which devices are tagged as transient:

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Assets** > **Devices**.
2. Select the **Filter** icon.
3. In the **Transient device** filter, select **Yes** to view only transient devices, or select **No** to exclude them.

You can also add the **Transient device** column to your inventory view to see the transient status of all devices.

## Manual scope management: Device exclusion

### What is device exclusion?

Device exclusion allows you to manually remove specific devices from vulnerability management visibility. Excluded devices:

- Don't appear in vulnerability management reports
- Don't contribute to exposure scores or secure scores
- Don't show discovered vulnerabilities or software inventory
- Remain in the device inventory but are marked as excluded

> [!WARNING]
> Excluded devices remain connected to the network and can still present security risks. Device exclusion only affects visibility in vulnerability management—it doesn't prevent attacks or reduce actual risk. Use exclusion only for devices you've determined are truly out of scope.

### When to use device exclusion

Use manual device exclusion for:

| Scenario | Reason |
|----------|--------|
| **Lab or test environments** | Devices intentionally isolated from production that don't require vulnerability tracking |
| **Decommissioned devices** | Devices scheduled for removal that no longer need active vulnerability management |
| **Duplicate device entries** | Multiple entries for the same physical device due to reimaging or other issues |
| **Permanently offline devices** | Devices that won't return to the network but remain in inventory for historical purposes |
| **Specialty devices with custom security** | Devices with alternative security controls where vulnerability management doesn't apply |

### When NOT to use device exclusion

Don't exclude devices that are:

- **Active on your network**: Excluding active devices creates blind spots in your security posture
- **Temporarily unavailable**: Use transient filtering instead for devices that come and go
- **Managed by different teams**: Consider using device tags and filters rather than exclusion

> [!IMPORTANT]
> If you attempt to exclude an active device, Defender for Endpoint displays a warning and asks for confirmation. Excluding active devices is not recommended.

### How to exclude devices

#### Exclude a single device

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Assets** > **Devices**.
2. Select the device you want to exclude.
3. In the device flyout or on the device page, select **Exclude**.
4. Select a justification:
   - Inactive device
   - Duplicate device
   - Device doesn't exist
   - Out of scope
   - Other
5. Type a note explaining the reason for exclusion.
6. Select **Exclude device**.

:::image type="content" source="media/exclude-device.png" alt-text="Screenshot of the exclude device dialog with justification options.":::

#### Exclude multiple devices

1. In the **Device inventory**, select multiple devices using the checkboxes.
2. From the action bar, select **Exclude**.
3. Choose a justification and add a note.
4. Select **Exclude devices**.

If you select devices with mixed exclusion statuses, the dialog shows how many are already excluded. You can re-exclude devices, but the new justification will override previous values.

:::image type="content" source="media/exclude-device-bulk.png" alt-text="Screenshot of bulk device exclusion showing multiple selected devices.":::

> [!NOTE]
> It can take up to 10 hours for devices to be fully excluded from vulnerability management views and data.

### View and manage excluded devices

To see which devices are excluded:

1. In the **Device inventory**, select the **Filter** icon.
2. Use the **Exclusion state** filter to view:
   - **Not excluded**: Normal devices
   - **Excluded**: Devices removed from vulnerability management

You can also add the **Exclusion state** column to your inventory view.

### Stop excluding a device

If you need to restore a device to active vulnerability management:

1. In the **Device inventory**, select the excluded device.
2. In the device flyout, select **Exclusion details**.
3. Select **Stop exclusion**.

:::image type="content" source="media/exclusion-details.png" alt-text="Screenshot showing exclusion details with option to stop exclusion.":::

Once you stop exclusion, vulnerability data for that device will reappear in vulnerability management pages, reports, and advanced hunting. Changes may take up to 8 hours to take effect.

## Decision guide: Which approach to use

Use this guide to determine the best approach for managing device scope:

| Your situation | Recommended approach | Why |
|----------------|---------------------|-----|
| Devices appear and disappear frequently (guests, test VMs) | Use transient filtering (automatic) | The system detects these patterns automatically; no manual action needed |
| Permanent lab or sandbox environment | Exclude devices manually | These devices won't benefit from vulnerability management and skew your metrics |
| Devices scheduled for decommissioning | Exclude devices manually | Removes them from exposure calculations while maintaining historical records |
| Duplicate device entries after reimaging | Exclude duplicate manually | Cleans up inventory and ensures accurate device counts |
| Devices offline for extended periods | First check if transient-tagged; if not, consider exclusion | Transient tagging may already handle this; manual exclusion if they'll never return |
| Active devices you want to ignore temporarily | Use device filters or tags | Never exclude active devices; use inventory filters or custom tags instead |
| Devices managed by different business units | Use device tags and filters | Maintain visibility while enabling targeted views; don't exclude |

## Impact on visibility and metrics

Understanding how each approach affects your visibility:

| Impact area | Transient tagging | Device exclusion |
|-------------|-------------------|------------------|
| **Device inventory** | Hidden by default (can be shown) | Visible but marked as excluded |
| **Vulnerability management pages** | Visible (if filter disabled) | Not visible |
| **Exposure score** | Included | Not included |
| **Secure score** | Included | Not included |
| **Advanced hunting** | Visible in queries | Not visible in vulnerability tables |
| **Vulnerability reports** | Included | Not included |
| **Security recommendations** | Included | Not included |

## Common scenarios

### Scenario 1: Conference room guest network

**Situation**: Your office has a guest network where visitor devices appear briefly and then disappear.

**Solution**: Use transient device tagging (automatic). These devices will be automatically tagged and filtered out of your default inventory view. No manual action required.

### Scenario 2: Isolated development lab

**Situation**: Your organization maintains a lab environment completely isolated from production. These devices should not contribute to production security metrics.

**Solution**: Exclude these devices manually. Add a justification like "Out of scope - isolated development lab" so other admins understand why they're excluded.

### Scenario 3: Device reimaging creates duplicates

**Situation**: After reimaging devices, you notice duplicate entries in your inventory for the same physical hardware.

**Solution**: Identify the obsolete entries and exclude them with the "Duplicate device" justification. The current, active device should remain in normal scope.

### Scenario 4: Legacy devices pending retirement

**Situation**: You have devices scheduled for decommissioning in the next quarter but they're still showing vulnerabilities.

**Solution**: Exclude with "Inactive device" or "Out of scope" justification. Include notes about the planned decommissioning date in the exclusion note.

## Best practices

- **Review regularly**: Periodically review both transient-tagged and excluded devices to ensure they're still appropriately categorized
- **Document decisions**: Always add meaningful notes when excluding devices to help future administrators understand the context
- **Use tags for temporary grouping**: If you need to temporarily ignore devices but maintain visibility, use device tags and filters rather than exclusion
- **Monitor exclusions**: Track who is excluding devices and why to prevent inappropriate removals from security visibility
- **Test before excluding at scale**: When excluding multiple devices, test with a small group first to ensure you're not removing critical devices from tracking

## Next steps

- [Create and manage device tags](machine-tags.md) to organize devices into meaningful groups
- [View your device inventory](machines-view-overview.md) with appropriate filters applied
- [Target devices for security actions](targeting-devices.md) using tags and device groups

## See also

- [Device inventory](machines-view-overview.md)
- [Create and manage device tags](machine-tags.md)
- [Advanced hunting overview](/defender-xdr/advanced-hunting-overview)
