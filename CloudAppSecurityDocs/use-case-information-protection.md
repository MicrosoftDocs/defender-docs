---
title: Automatically apply sensitivity labels from Microsoft Purview Information Protection | Microsoft Defender for Cloud Apps
description: This tutorial describes how to automatically apply sensitivity labels from Microsoft Purview Information Protection in Microsoft Defender for Cloud Apps.
ms.date: 08/08/2023
ms.topic: tutorial
---
# Tutorial: Automatically apply sensitivity labels from Microsoft Purview Information Protection



In a perfect world, all your employees understand the importance of information protection and work within your policies. But in a real world, it's probable a partner who works with accounting uploads a document to your OneDrive for Business repository with the wrong permissions. A week later you realize your enterprise's confidential information was leaked to your competition. Microsoft Defender for Cloud Apps helps you prevent this kind of disaster before it happens. This feature is available for Box, SharePoint and OneDrive for Business. Applying a sensitivity label is one of a long list of available [governance actions](governance-actions.md).

In this tutorial, you'll learn how to identify which public permissions are set on a document that's saved in your cloud storage, so you're alerted when a breach occurs. In addition, you can automatically apply your Microsoft Purview Information Protection **Confidential** sensitivity label to provide added encryption to files.

> [!div class="checklist"]
>
> - [Set up data protection](#set-up-data-protection)
> - [Validate your policy](#validate-your-policy)

## Enhanced data-level encryption protection

Defender for Cloud Apps integration with Microsoft Purview Information Protection enables an added level of protection by automatically encrypting files. When Microsoft Purview Information Protection encrypts files, applications that support Microsoft Purview Information Protection like Microsoft 365, know how to open the files and honors permissions set in the sensitivity labels. Use labels to apply specific protection rules. For example, set a file that can be opened but not shared, printed, forwarded, or edited.

This strong level of protection travels with the file. The file is still protected if you send the file, copy it, or store it in your online storage app. If one of your employees loses a thumb drive with the file on it, the file will be locked. Should someone try to open the file, the file owner will receive an alert. With Defender for Cloud Apps, you can apply protection automatically. For example, set all files that have credit card numbers, or were uploaded by the finance department and are shared externally, to be automatically protected with a sensitivity label.

## The threat

A user in your organization saves confidential customer information files to OneDrive for Business and sets it to be shared with everyone in the organization. The user doesn't realize that not only their immediate team, but the entire support staff has access to that OneDrive for Business account. This access includes vendors, partners, and visitors who occasionally stop into the office. Any person with access to your organization's OneDrive for Business account now has access to that information. Not only can that access be dangerous for your organization, it can be against personal information regulations in many countries/regions, causing potential legal issues.

## The solution

Use Defender for Cloud Apps with Microsoft Purview Information Protection to embed classification and protection information for persistent protection that follows your data — so it stays protected no matter where it's stored or who it's shared with. This protection enables you to share data safely with coworkers, customers, and partners. Define who can access data and what they can do with it. For instance, allow users to view and edit files but not print or forward. You can also add other [governance actions](governance-actions.md) supported by Defender for Cloud Apps to the files such as remove collaborators and remove sharing abilities.

## Prerequisites

- [Enable Defender for Cloud Apps and Microsoft Purview Information Protection](azip-integration.md) for your tenant.

## Set up data protection

Let's set up a policy that looks for credit card numbers in files stored in your OneDrive for Business account. When files are found, automatically apply a sensitivity label and control what happens to all files with that label.

1. Start protecting the data you store in OneDrive for Business by setting up a policy that will encrypt any sensitive data stored in a specific OneDrive for Business folder:

    1. In the Microsoft Defender Portal, under **Cloud Apps**, select [**Policies**](control-cloud-apps-with-policies.md) -> **Policy management**.

    1. Select **Create policy** > **File policy**.

    1. On the **Create file policy** page, enter *OneDrive data protection* in the **Policy name** box.

    1. In the **Files matching all of the following** area, create a filter to target your proprietary and sensitive data. For example:

        1. Select **Add a filter** and then select the **Select a filter** option > **Parent folder** > **equals** > **Select a folder**.
        1. In the **Select a folder** dialog, select a folder to watch, such as **Sales West**, and then select **Done**.
        1. Select **Add a filter** again and then select **Collaborators** > **Groups** > **contains** > **Finance**

    1. Define the inspection method to look for files containing credit card information:

        1. From the **Inspection method** dropdown, select **Data Classification Service**. 
        1. Select **Choose inspection type** > **Sensitive information type** > **Credit Card Number** > **Done**. When selecting your sensitive information type, enter **credit** in the **Search** box and press **ENTER** to filter the types listed.

    1. In the **Governance actions** area, expand the **Microsoft OneDrive for Business** dropdown, and select **Apply sensitivity label**. Select the label you want to apply, such as **Confidential - Finance**.

        [Defender for Cloud Apps is integrated with Microsoft Purview Information Protection](azip-integration.md), which allows you to select from your existing list of sensitivity labels to be used to protect the data.

    1. Select **Create**.

## Investigate your matches

After setting up your policy to watch for credit card information in the selected folder, do the following to investigate any matches found:

1. In the Microsoft Defender XDR **Cloud apps** navigation menu, select **Policies > Policy management**. 
1. Select the policy you'd created [earlier](#set-up-data-protection) and then select **View policy matches**.
1. Review the matches that were triggered for the policy. Select any specific file to expand for more details, including any other policies matched by the selected file.

## Validate your policy

1. To simulate an alert, create a file with a simulated credit card number in the OneDrive for Business folder you'd defined in your policy. 
1. Go to the policy report, where a new match should appear shortly.
1. You can select the match to see which files were protected. The match itself will be masked to protect the sensitive data.

>[!NOTE]
>
> - Defender for Cloud Apps currently supports automatic application of sensitivity labels on Box, GSuite, SharePoint and OneDrive for business.
> - When a document is labeled by Defender for Cloud Apps, visual markings, such as headers, footers, or watermarks, are not applied. For more information, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels).
>

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]
