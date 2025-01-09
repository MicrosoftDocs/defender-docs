---
title: Commonly used information protection policies | Microsoft Defender for Cloud Apps
description: This article outlines the steps to configure many information protection policies in Defender for Cloud Apps.
ms.date: 05/15/2024
ms.topic: conceptual
---
# Commonly used Microsoft Defender for Cloud Apps information protection policies



Defender for Cloud Apps file policies allow you to enforce a wide range of automated processes. Policies can be set to provide information protection, including continuous compliance scans, legal eDiscovery tasks, and DLP for sensitive content shared publicly.

Defender for Cloud Apps can monitor any file type based on more than 20 metadata filters, for example, access level, and file type. For more information, see [File policies](data-protection-policies.md).

## Detect and prevent external sharing of sensitive data

Detect when files with personally identifying information or other sensitive data are stored in a Cloud service and shared with users who are external to your organization that violates your company's security policy and creates a potential compliance breach.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **File policy**.

1. Set the filter **Access Level** equals **Public (Internet) / Public / External**.

1. Under **Inspection method**, select **Data Classification Service (DCS)**, and under **Select type** select the type of sensitive information you want DCS to inspect.

1. Configure the **Governance** actions to be taken when an alert is triggered. For example, you can create a governance action that runs on detected file violations in Google Workspace in which you select the option to **Remove external users** and **Remove public access**.

1. Create the file policy.

## Detect externally shared confidential data

Detect when files that are labeled **Confidential** and are stored in a cloud service are shared with external users, violating company policies.

### Prerequisites

- You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

- Enable [Microsoft Purview Information Protection integration](azip-integration.md).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **File policy**.

1. Set the filter **Sensitivity label** to **Microsoft Purview Information Protection** equals the **Confidential** label, or your company's equivalent.

1. Set the filter **Access Level** equals **Public (Internet) / Public / External**.

1. Optional: Set the **Governance** actions to be taken on files when a violation is detected. The governance actions available vary between services.

1. Create the file policy.

## Detect and encrypt sensitive data at rest

Detect files containing personally identifying information and other sensitive data that is share in a cloud app and apply sensitivity labels to limit access only to employees in your company.

### Prerequisites

- You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

- Enable [Microsoft Purview Information Protection integration](azip-integration.md).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **File policy**.

1. Under **Inspection method**, select **Data Classification Service (DCS)** and under **Select type** select the type of sensitive information you want DCS to inspect.

1. Under **Governance actions**, check **Apply sensitivity label** and select the sensitivity label that your company uses to restrict access to company employees.

1. Create the file policy.

> [!NOTE]
> The ability to apply a sensitivity label directly in Defender for Cloud Apps is currently only supported for Box, Google Workspace, SharePoint online and OneDrive for Business.

## Detect data access from an unauthorized location

Detect when files are accessed from an unauthorized location, based on your organization's common locations, to identify a potential data leak or malicious access.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **Activity policy**.

1. Set the filter **Activity type** to the file and folder activities that interest you, such as **View**, **Download**, **Access**, and **Modify**.

1. Set the filter **Location** does not equal, and then enter the countries/regions from which your organization expects activity.

    - Optional: You can use the opposite approach and set the filter to **Location** equals if your organization blocks access from specific countries/regions.

1. Optional: Create **Governance** actions to be applied to detected violation (availability varies between services), such as  **Suspend user**.

1. Create the Activity policy.

## Detect and protect confidential data store in a non-compliant SP site

Detect files that are labeled as confidential and are stored in a non-compliant SharePoint site.

### Prerequisites

Sensitivity labels are configured and used inside the organization.

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **File policy**.

1. Set the filter **Sensitivity label** to **Microsoft Purview Information Protection** equals the **Confidential** label, or your company's equivalent.

1. Set the filter **Parent folder** does not equal, and then under **Select a folder** choose all the compliant folders in your organization.

1. Under **Alerts** select **Create an alert for each matching file**.

1. Optional: Set the **Governance** actions to be taken on files when a violation is detected. The governance actions available vary between services. For example, Set **Box** to **Send policy-match digest to file owner** and **Put in admin quarantine**.

1. Create the file policy.

## Detect externally shared source code

Detect when files that contain content that might be source code are shared publicly or are shared with users outside of your organization.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **File policy**.

1. Select and apply the policy template **Externally shared source code**

1. Optional: Customize the list of file **Extensions** to match your organization's source code file extensions.

1. Optional: Set the **Governance** actions to be taken on files when a violation is detected. The governance actions available vary between services. For example, in Box, **Send policy-match digest to file owner** and **Put in admin quarantine**.

1. Select and apply the policy template.

## Detect unauthorized access to group data

Detect when certain files that belong to a specific user group are being accessed excessively by a user who is not part of the group, which could be a potential insider threat.

### Prerequisites

You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **Activity policy**.

1. Under **Act on**, select **Repeated activity** and customize the **Minimum repeated activities** and set a **Timeframe** to comply with your organization's policy.

1. Set the filter **Activity type** to the file and folder activities that interest you, such as **View**, **Download**, **Access**, and **Modify**.

1. Set the filter **User** to **From group** equals and then select the relevant user groups.

    > [!NOTE]
    > [User groups can be imported manually](user-groups.md) from supported apps.

1. Set the filter **Files and folders** to **Specific files or folders** equals and then choose the files and folders that belong to the audited user group.

1. Set the **Governance** actions to be taken on files when a violation is detected. The governance actions available vary between services. For example, you can choose to **Suspend user**.

1. Create the file policy.

## Detect publicly accessible S3 buckets

Detect and protect against potential data leaks from AWS S3 buckets.

### Prerequisites

You must have an AWS instance connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **File policy**.

1. Select and apply the policy template **Publicly accessible S3 buckets (AWS)**.

1. Set the **Governance** actions to be taken on files when a violation is detected. The governance actions available vary between services. For example, set AWS to **Make private** which would make the S3 buckets private.

1. Create the file policy.

## Detect and protect GDPR related data across file storage apps

Detect files that are shared in cloud storage apps and contain personally identifying information and other sensitive data that are bound by a GDPR compliance policy. Then, automatically apply sensitivity labels to limit access only to authorized personnel.

### Prerequisites

- You must have at least one app connected using [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).

- [Microsoft Purview Information Protection integration](azip-integration.md) is enabled and GDPR label is configured in Microsoft Purview

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **File policy**.

1. Under **Inspection method**, select **Data Classification Service (DCS)**, and under **Select type** select one or more information types that comply with the GDPR compliance, for example: EU debit card number, EU drivers license number, EU national/regional identification number, EU passport number, EU SSN, SU tax identification number.

1. Set the **Governance** actions to be taken on files when a violation is detected, by selecting **Apply sensitivity label** for each supported app.

1. Create the file policy.

> [!NOTE]
> Currently, **Apply sensitivity label** is only supported for Box, Google Workspace, SharePoint online and OneDrive for business.

## Block downloads for external users in real time

Prevent company data from being exfiltrated by external users, by blocking file downloads in real time, using the Defender for Cloud Apps [session controls](proxy-intro-aad.md).

### Prerequisites

Make sure your app is a SAML-based app that uses Microsoft Entra ID for single sign-on, or is onboarded to Defender for Cloud Apps for Conditional Access app control.

For more information on supported apps, see [Supported apps and clients](proxy-intro-aad.md#supported-apps-and-clients).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **Session policy**.

1. Under **Session control type**, select **Control file download (with inspection)**.

1. Under **Activity filters**, select **User** and set it to **From group** equals **External users**.

    >[!NOTE]
    > You don't need to set any app filters to enable this policy to apply to all apps.

1. You can use the **File filter** to customize the file type. This gives you more granular control over what type of files the session policy controls.

1. Under **Actions**, select **Block**. You can select **Customize block message** to set a custom message to be sent to your users so they understand the reason the content is blocked and how they can enable it by applying the right sensitivity label.

1. Select **Create**.

## Enforce read-only mode for external users in real time

Prevent company data from being exfiltrated by external users, by blocking print and copy/paste activities in real time, using the Defender for Cloud Apps [session controls](proxy-intro-aad.md).

### Prerequisites

Make sure your app is a SAML-based app that uses Microsoft Entra ID for single sign-on, or is onboarded to Defender for Cloud Apps for Conditional Access app control.

For more information on supported apps, see [Supported apps and clients](proxy-intro-aad.md#supported-apps-and-clients).

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new  **Session policy**.

1. Under **Session control type**, select **Block activities**.

1. In the **Activity source** filter:

    1. Select **User** and set **From group** to **External users**.

    1. Select **Activity type** equals **Print** and **Cut/copy item**.

    > [!NOTE]
    > You don't need to set any app filters to enable this policy to apply to all apps.

1. Optional: Under **Inspection method**, select the type of inspection to apply and set the necessary conditions for the DLP scan.

1. Under **Actions**, select **Block**. You can select **Customize block message** to set a custom message to be sent to your users so they understand the reason the content is blocked and how they can enable it by applying the right sensitivity label.

1. Select **Create**.

## Block upload of unclassified documents in real time

Prevent users from uploading unprotected data to the cloud, by using the Defender for Cloud Apps [session controls](proxy-intro-aad.md).

### Prerequisites

- Make sure your app is a SAML-based app that uses Microsoft Entra ID for single sign-on, or is onboarded to Defender for Cloud Apps for Conditional Access app control.

For more information on supported apps, see [Supported apps and clients](proxy-intro-aad.md#supported-apps-and-clients).

- Sensitivity labels from Microsoft Purview Information Protection must be configured and used inside your organization.

### Steps

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Policies** -> **Policy management**. Create a new **Session policy**.

1. Under **Session control type**, select **Control file upload (with inspection)** or **Control file download (with inspection)**.

   >[!NOTE]
   > You don't need to set any filters to enable this policy to apply to all users and apps.

1. Select the file filter **Sensitivity label** does not equal and then select the labels your company uses to tag classified files.

1. Optional: Under **Inspection method**, select the type of inspection to apply and set the necessary conditions for the DLP scan.

1. Under **Actions**, select **Block**. You can select **Customize block message** to set a custom message to be sent to your users so they understand the reason the content is blocked and how they can enable it by applying the right sensitivity label.

1. Select **Create**.

> [!NOTE]
> For the list of file types that Defender for Cloud Apps currently supports for sensitivity labels from Microsoft Purview Information Protection, see [Microsoft Purview Information Protection integration prerequisites](azip-integration.md#prerequisites).

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]
