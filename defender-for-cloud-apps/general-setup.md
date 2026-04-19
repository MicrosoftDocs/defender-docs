---
title: Basic setup
description: Set up your Defender for Cloud Apps environment and enable the Unified Identity Inventory integration to get a centralized view of identities.
ms.date: 04/15/2026
ms.topic: how-to
ms.custom: msecd-doc-authoring-106
---
# Basic setup for Defender for Cloud Apps



The following procedure gives you instructions for customizing your Microsoft Defender for Cloud Apps environment.

## Prerequisites

For portal access requirements, see [Portal access](network-requirements.md#portal-access).

## Set up your Defender for Cloud Apps environment

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.

1. Under **System** -> **Organization details**, it's important that you provide an **Organization display name** for your organization.

1. Provide an **Environment name** (tenant). This information is especially important if you manage more than one tenant.

1. (Optional) Upload a **Logo** file to be displayed in email notifications and web pages sent from the system. The logo must be a .PNG file with a maximum size of 150 x 50 pixels, on a transparent background.

   Logos are stored in publicly accessible storage. The source URL for your image is protected and stored internally. 

   Providing this image is voluntary, it’s up to you to decide if you want to share this data with us. You can also choose to delete this image at anytime and it will be deleted from our storage. This decision does not affect the security of your organization or your users in any way.

1. Make sure you add a list of your **Managed domains** to identify internal users. Adding managed domains is a crucial step. Defender for Cloud Apps uses the managed domains to determine which users are internal, external, and where files should and shouldn't be shared. This information is used for reports and alerts.

    * Users in domains that aren't configured as internal are marked as external. External users aren't scanned for activities or files.

1. If you're integrating with Microsoft Purview Information Protection, see [Microsoft Purview Information Protection Integration](azip-integration.md) for information.

    * To work with Microsoft Purview Information Protection integration, you must enable the [App connector for Microsoft 365](./connect-office-365.md).

## Enable Unified Identity Inventory integration

Enable the Unified Identity Inventory integration to ingest cloud app accounts into the [Unified Identity Inventory](/defender-for-identity/identity-inventory), providing a centralized view of identities across your environment. With this integration, you get access to unified identity experiences including the identity timeline and response, improved identity correlation, and identity-centric protection.

Review the following important considerations before enabling this setting:

- As Microsoft Defender moves toward a fully unified identity platform, some Defender for Cloud Apps data pipelines remain separate. These improvements **don't currently affect the following Defender for Cloud Apps capabilities**:
  - Built-in detections
  - UEBA (User and Entity Behavior Analytics)
  - Scoped deployment
  - Governance actions
  - Defender for Cloud Apps policies
  - Activity log
  - Cloud discovery user enrichment and anonymization
  - RBAC scoping

  These features continue to use the Cloud Application Accounts inventory. For more information, see the relevant Defender for Cloud Apps documentation.
- The existing **Cloud Apps Accounts view remains available** to ensure backward compatibility.
- After you enable it, **this integration can't be disabled**.

<!-- TODO: Confirm with Itai whether the fwlink (https://go.microsoft.com/fwlink/?LinkId=2359589) is live and what it points to. -->

### Prerequisites

To view the configuration page, you need any read or write role.

To change the configuration, you need one of the following roles:

- **Microsoft Entra ID roles**: Global Administrator, Security Administrator, or Cloud App Administrator
- **Defender for Cloud Apps built-in roles**: Global administrator

> [!TIP]
> Use the least-privileged role that's sufficient for the task. Security Administrator or Cloud App Administrator is preferred over Global Administrator. If Global Administrator access is needed, consider using [Privileged Identity Management (PIM)](/entra/id-governance/privileged-identity-management/pim-configure) for just-in-time access.

### Steps

1. In the Microsoft Defender portal, select **Settings**. Then choose **Cloud Apps**.

1. Under **System**, select **Identity Inventory Integration**.

1. On the **Unified Identity Inventory Integration** page, select the **Enable Unified Identity Inventory Integration** checkbox.

   > [!NOTE]
   > If Defender for Cloud Apps scoping is enabled for your tenant, the checkbox is unavailable.

1. Select **Confirm**.

After the integration is enabled, SaaS and cloud accounts are ingested into the Unified Identity Inventory. These accounts appear in the **Human identities** tab on the [Identity inventory](/defender-for-identity/identity-inventory) page.


## Next steps

> [!div class="nextstepaction"]
> [Set up cloud discovery](set-up-cloud-discovery.md)

[!INCLUDE [Open support ticket](includes/support.md)]
