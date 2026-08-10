---
title: Transition from a Legacy On-premises Management Console to the Cloud
description: Migrate from the legacy on-premises management console to the cloud-based Defender for IoT architecture. Learn the updated architecture approach, key retirement considerations, and planning guidance for the transition.
ms.topic: how-to
ms.date: 06/12/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Transition from a legacy on-premises management console to the cloud

This article describes how to transition from the on-premises management console to the cloud.

> [!IMPORTANT]
> The on-premises management console won't be supported or available for download after January 1st, 2025. For more information, see [on-premises management console retirement](on-premises-management-console-retirement.md).
>

Our [current architecture guidance](#architecture-guidance) is designed to be more efficient, secure, and reliable than using the legacy on-premises management console. The updated guidance has fewer components, which makes it easier to maintain and troubleshoot. The smart sensor technology used in the new architecture allows for on-premises processing, reducing the need for cloud resources and improving performance. The updated guidance keeps your data within your own network, providing better security than cloud computing.

## Architecture guidance

If you're an existing customer using an on-premises management console to manage your OT sensors, we recommend transitioning to the updated architecture guidance. The following image shows a graphical representation of the transition steps to the new recommendations:

:::image type="content" source="../media/on-premises-architecture/transition-new.png" alt-text="Diagram of the transition from a legacy on-premises management console to the newer recommendations." border="false":::

## How to manage the transition period

The following stages describe how sensor connectivity changes during the transition period:

- **In your legacy configuration**, all sensors are connected to the on-premises management console.
- **During the transition period**, your sensors remain connected to the on-premises management console while you connect any sensors possible to the cloud.
- **After fully transitioning**, you'll remove the connection to the on-premises management console, keeping cloud connections where possible. Any sensors that must remain air-gapped are accessible directly from the sensor UI.

## Transition your architecture

Use the following steps to transition from the legacy on-premises management console architecture to the updated deployment model:

1. For each of your OT sensors, identify the legacy integrations in use and the permissions currently configured for on-premises security teams. For example, what backup systems are in place? Which user groups access the sensor data?

1. Connect your sensors to on-premises, Azure, and other cloud resources, as needed for each site. For example, connect to an on-premises SIEM, proxy servers, backup storage, and other partner systems. You may have multiple sites and adopt a hybrid approach, where only specific sites are kept completely air-gapped or isolated using data-diodes.

    For more information, see the information linked in the [air-gapped deployment procedure](air-gapped-deploy.md#deployment-steps), as well as the following cloud resources:

    - [Provision sensors for cloud management](provision-cloud-management.md)
    - [OT threat monitoring in enterprise SOCs](../concept-sentinel-integration.md)
    - [Securing IoT devices in the enterprise](../concept-enterprise.md)

1. Set up permissions and update procedures for accessing your sensors to match the new deployment architecture.

1. Review and validate that all security use cases and procedures have transitioned to the new architecture.

1. After your transition is complete, decommission the on-premises management console.

## Next step

> [!div class="step-by-step"]
> [Maintain OT network sensors from the sensor console](../how-to-manage-individual-sensors.md)