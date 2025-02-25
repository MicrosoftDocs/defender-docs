---
title: Transition from Report Message or the Report Phishing add-ins
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: Admin
ms.reviewer: dhagarwal
ms.topic: how-to
ms.date: 02/24/2025
ms.localizationpriority: medium
search.appverid:
  - MET150
  - MOE150
ms.assetid: 4250c4bc-6102-420b-9e0a-a95064837676
ms.collection:
  - m365-security
  - tier2
description: Learn how to transition from the Report Message or the Report Phishing add-ins for all version of outlook, for individual users, or for your entire organization.
ms.service: defender-office-365
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Exchange Online Protection</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Transitioning from the Microsoft Report Message or the Report Phishing add-ins

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

> [!CAUTION]
> The report message and report phish add-ins are in maintenance mode and will be deprecated in the near future (around a year down the line). It is advised to transition from the add-ins to the built-in report button which is supported virtually on all outlook clients across consumer and enterprise. If you have questions, please check out the [FAQs](frequently-asked-questions) section.

The built-in **Report** button in [supported versions of Outlook](submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook) make it easy for users to report false positives and false negatives to Microsoft for analysis. False positives are good email that was blocked or sent to the Junk Email folder. False negatives are unwanted email or phishing that was delivered to the Inbox.

Microsoft uses these user-reported messages to improve the effectiveness of email protection technologies. For example, suppose that people are reporting many messages using the Report button. This information surfaces in the Security Dashboard and other reports. Your organization's security team can use this information as an indication that anti-phishing policies might need to be updated.

## What do you need to know before you begin?

- You need to be assigned permissions before you can do the procedures in this article. You have the following options:
  - [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac) (If **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell): **Security operations/Security data/Response (manage)** or **Security operations/Security data/Read-only**.
  - [Email & collaboration permissions in the Microsoft Defender portal](mdo-portal-permissions.md): Membership in the **Organization Management** role group.
  - [Exchange Online permissions](/Exchange/permissions-exo/permissions-exo): Membership in the **Organization Management** role group.
  - [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership in the **Global Administrator**<sup>\*</sup> role gives users the required permissions _and_ permissions for other features in Microsoft 365.

    > [!IMPORTANT]
    > <sup>\*</sup> Microsoft recommends that you use roles with the fewest permissions. Using lower permissioned accounts helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

- For organizational removals, the organization needs to be configured to use OAuth authentication. For more information, see [Determine if Centralized Deployment of add-ins works for your organization](/Microsoft-365/admin/manage/centralized-deployment-of-add-ins).

- For more information on how to report a message using reporting in Outlook, see [Report false positives and false negatives in Outlook](submissions-outlook-report-messages.md).

## Advantages of the in-build report button over the add-ins 

> [!div class="mx-tdBreakAll"]
> | Benefits | In-build report button | Report add-ins        |
> | :-------------------: | :-------------------: |:---------------:|
> | centered column  | centerd column | centered column |
> | Works out of the box | :::image type="icon" source="media/feature_present_icon.png":::       | :::image type="icon" source="media/feature_absent_icon.png":::         |
> | Consistent across consumer & enterprise account  | :::image type="icon" source="media/feature_present_icon.png":::  | :::image type="icon" source="media/feature_absent_icon.png":::              |
> | Easily discoverable across outlook clients | :::image type="icon" source="media/feature_present_icon.png"::: | :::image type="icon" source="media/feature_absent_icon.png":::             |
> | Front & center across outlook clients | :::image type="icon" source="media/feature_present_icon.png"::: | :::image type="icon" source="media/feature_absent_icon.png":::              |
> | Support multi-message reporting from inbox | :::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
> | Support messages reporting from preview panel |:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
> | Support message reporting from reading window |:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
> | Support message reporting from context menu | :::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
> | Supports shared and delegate mailbox  | :::image type="icon" source="media/feature_present_icon.png":::  | :::image type="icon" source="media/feature_absent_icon.png":::          |
> | Support pre-reporting popup customization  | :::image type="icon" source="media/feature_present_icon.png":::  | :::image type="icon" source="media/feature_absent_icon.png":::             |
> | Support pre-reporting popup localization  | :::image type="icon" source="media/feature_present_icon.png":::   | :::image type="icon" source="media/feature_absent_icon.png":::             |
> | Support post-reporting popup customization  | :::image type="icon" source="media/feature_present_icon.png":::               | :::image type="icon" source="media/feature_absent_icon.png":::              |
> | Support post-reporting popup localization  | :::image type="icon" source="media/feature_present_icon.png":::                | :::image type="icon" source="media/feature_absent_icon.png":::            |
> | Work flawlessly with firewalls | :::image type="icon" source="media/feature_present_icon.png"::: | :::image type="icon" source="media/feature_absent_icon.png":::|


## Admin instructions

Removing the Report Message or Report Phishing add-ins for the organization.

> [!NOTE]
> It could take up to 24 hours for the add-in to disappear in your organization.
>
> If you delete the app registration for the add-in in Azure, the add-in is also deleted from the organization.

###  Scoping and removing the Report Message or Report Phishing add-ins

1. In the Microsoft 365 admin center at <https://admin.microsoft.com>, expand **Show all** if necessary, and then go to **Settings** \> **Integrated apps**. Or, to go directly to the **Integrated apps** page, use <https://admin.microsoft.com/Adminportal/Home#/Settings/IntegratedApps>.

   > [!NOTE]
   > Admins in Microsoft 365 Government Community Cloud (GCC) or GCC High or DoD need to use the Microsoft 365 admin center at https://portal.office365.us/adminportal/home#/Settings/AddIns and than select Settings > Add-ins  
   >
   > Although the screenshots in the remaining steps show the **Report Phishing** add-in, the steps are identical for the **Report Message** add-in.

2. On the **Deployed apps** tab of the **Integrated apps** page, select the **Report Message** add-in or the **Report Phishing** add-in by doing one of the following steps:

   - In the **Name** column, select the icon or text for the add-in. This selection takes you to the **Overview** tab in the details flyout as described in the next steps.
   - In the **Name** column, select **⋮** **Edit row**, and then select :::image type="icon" source="media/m365-cc-sc-add-internal-icon.png" border="false"::: **Edit users** to go to the **Users** tab in the details flyout as described in the next step.
   - In the **Name** column, select **⋮** **Edit row**, and then select :::image type="icon" source="media/m365-cc-sc-show-trends-icon.png" border="false"::: **Check usage data** to go to the **Usage** tab in the details flyout as described in the next step.

   > [!div class="mx-imgBorder"]
   > :::image type="content" source="media/microsoft-365-admin-center-select-report-phish-add-in.png" alt-text="Select the Report Phishing add-in on the Integrated apps page in the Microsoft 365 admin center." lightbox="media/microsoft-365-admin-center-select-report-phish-add-in.png":::

3. The details flyout that opens contains the following tabs:

   - **Overview** tab:
     - **Basic info** section:
       - **Status**
       - **Type**: Add-in
       - **Test deployment**: **Yes** or **No**, depending on the option you selected when you or the selection you change on the **Users** tab.
       - **Description**
       - **Host product**: Outlook
     - **Actions** section: Select **Remove app** to remove the app.
     - **Assigned users** section: Select **Edit users** to go to the **Users** tab. This can be used to scope the users who have the add-in.
     - **Usage** section: Select **Check usage data** to got to the **Usage** tab.

     > [!div class="mx-imgBorder"]
     > :::image type="content" source="media/microsoft-365-admin-center-report-phish-add-in-details-overview-tab.png" alt-text="The Overview tab on the details flyout of the Report Phishing add-in in the Microsoft 365 admin center." lightbox="media/microsoft-365-admin-center-report-phish-add-in-details-overview-tab.png":::

    > [!div class="mx-imgBorder"]
     > :::image type="content" source="media/microsoft-365-admin-center-report-phish-add-in-remove-overview-tab.png" alt-text="The tab on the removal flyout of the Report Phishing add-in in the Microsoft 365 admin center." lightbox="media/microsoft-365-admin-center-report-phish-add-in-remove-overview-tab.png":::

    > [!div class="mx-imgBorder"]
     > :::image type="content" source="media/microsoft-365-admin-center-report-phish-addin-remove-complete-tab.png" alt-text="The flyout showcasing the removal of the Report Phishing add-in in the Microsoft 365 admin center." lightbox="media/microsoft-365-admin-center-report-phish-addin-remove-complete-tab.png":::

   - **Users** tab:
     - **Is this a test deployment?**: Leave the toggle at :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **No**, or set the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Yes**.
     - **Assign users** section: Select one of the following values:
       - **Just me**
       - **Entire organization**
       - **Specific users/groups**: Find and select users and groups in the search box. After each selection, the user or group appears in the **Added users** section that appears below the search box. To remove a selection, select :::image type="icon" source="media/m365-cc-sc-remove-icon.png" border="false"::: on the entry.

     - **Email notification** section: **Send email notification to assigned users** and **View email sample** aren't selectable.

     If you made any updates on this tab, select **Update** to save your changes.

     > [!div class="mx-imgBorder"]
     > :::image type="content" source="media/microsoft-365-admin-center-report-phish-add-in-details-users-tab.png" alt-text="The Users tab on the details flyout of the Report Message add-in in the Microsoft 365 admin center." lightbox="media/microsoft-365-admin-center-report-phish-add-in-details-users-tab.png":::

   - **Usage** tab: The chart and details table shows the number of active users over time.
     - Filter the **Date range** to **7 days**, **30 days** (default), or **90 days**.
     - In the **Report** column, select :::image type="icon" source="media/m365-cc-sc-download-icon.png" border="false"::: **Download** to download the information filtered by **Date range** to the file named **UsageData.csv**.

   When you're finished viewing the information on the tabs, select :::image type="icon" source="media/m365-cc-sc-close-icon.png" border="false"::: **Close** to close the details flyout.


## Frequently Asked Questions (FAQs)

1. Why are the add-ins being deprecated? 
    The add-ins are being deprecated due to two reasons
    1. There are security issues with the add-in which makes them unsafe for the organization. Given Microsoft's commitment to safety, they need to be deprecated. 
    1. The add-ins architecturally cannot support the functionality which you keep asking Microsoft about. Thus, Microsoft decided to move to the in-build report button which will serve your requirements better.

1. What do we mean by the add-ins are in maintenance mode?
    It means that no improvement will be made to the add-ins and the add-ins will just remain functional till they are deprecated. So, naturally any new improvement request specifically for the add-ins will be rejected. 

1. How was this decided

1. When will the add-ins be deprecated by?
    We are looking sometime next calendar year (2026) for deprecating the add-ins. This time is being provided so that you can transition from the add-ins.

1. Will there be further communication before the add-in are deprecated?
    Yes there will be further communication as we progress towards the add-in deprecation.

1. Some users in my organization are on an older client, which is preventing us from migrating. What shall I do?
    The recommendation is to ask your users to update their client or you update the clients using the microsoft admin center for your users. Please reachout to Microsoft support if you are having issues to update clients for your users. 

1. I am on the report phishing add-in which offers a single report option but the inbuild report button has more options. What shall I do?
    This design was finalized after partnership with more than 50 customers and private preview of around 2.5 years. A lot of customers who were having this question, are actually much more comfortable with the inbuild report button. They have trained their end users to use the default action on inbuild report button (split) for reporting messages as phish and using the side menu to report messages as other types (junk, not junk). They have transitioned completely to the inbuild report button We will recommend to give it a try and if you are still facing issues, you can always reach out to us via Microsoft support.

1. I cannot scope the inbuild report button and this is preventing from a rollout. What shall I do?
    This is by design as Microsoft thinks this provides a base level of protection for all user, shared and delegate mailbox across the organization. Sometimes, while scoping, customers can forgot to add a user, thus leaving a security gap in the organization which can be exploited at times by attackers. Numerous customers with more than a million user base have been able to migrate smoothly without the scoping ability. They scoped the third-party add-in button or the report add-ins to users as they rolled out the inbuild report button across the organization.
    If you were just looking to scope the functionality to play around with it, Microsoft recommendation is to use a test environment. 

1. I would like to see further improvements in the inbuild report button. What shall I do?
   You can always raise a Design change request (DCR) via Microsoft support. 

1. You still have questions which is not listed here?
    No worries. Just raise a support ticket via Microsoft support and we will get right back to you.
