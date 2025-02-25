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
description: Learn how to transition from the Report Message or the Report Phishing add-ins for all version of Outlook to the build in Report button all versions of Outlook.
ms.service: defender-office-365
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Exchange Online Protection</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Transition from the Microsoft Report Message or the Report Phishing add-ins

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

> [!IMPORTANT]
> The Microsoft Report Message and Report Phishing add-ins are now in maintenance mode and will eventually be deprecated. We recommend transitioning from the add-ins to the built-in **Report** button. The **Report** button is supported in virtuall all consumer and entrprise Outlook clients. For more information, see the [Frequently asked questions](frequently-asked-questions) section in this article.

The built-in **Report** button in [supported versions of Outlook](submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook) makes it easy for users to report false positives and false negatives to Microsoft for analysis. False positives are good email that was blocked or sent to the Junk Email folder. False negatives are unwanted email or phishing that was delivered to the Inbox.

Microsoft uses these user reported messages to improve the effectiveness of email protection technologies. For example, suppose people are reporting many messages as phishing using the **Report** button. This information surfaces in the Security Dashboard and other reports. This information probably indicates the anti-phishing policies in your organization need to be updated.

The following table describes the advantages of the built-in **Report** button over the Report Message and Report Phishing add-ins:

|Benefits|In-build report button|Report add-ins|
|---|:---:|:---:|
|Works out of the box|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Consistent across consumer and enterprise accounts|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Easily discoverable across Outlook clients|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Front and center across Outlook clients|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Multi-message reporting from Inbox|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Message reporting from preview panel|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Message reporting from reading window|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Message reporting from context menu|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Supports shared and delegate mailboxes|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Pre-reporting popup customization|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Pre-reporting popup localization|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Post-reporting popup customization|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Post-reporting popup localization|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|
|Works flawlessly with firewalls|:::image type="icon" source="media/feature_present_icon.png":::|:::image type="icon" source="media/feature_absent_icon.png":::|

The rest of this article describes how to remove the Report Message and Report Phishing add-ins.

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

## Remove the Report Message or Report Phishing add-ins

> [!TIP]
> It might take up to 24 hours for the add-in to disappear from your organization.
>
> If you delete the app registration for the add-in in Microsoft Entra ID, the add-in is also deleted from the organization.

1. In the Microsoft 365 admin center at <https://admin.microsoft.com>, expand **Show all** if necessary, and then go to **Settings** \> **Integrated apps**. Or, to go directly to the **Integrated apps** page, use <https://admin.microsoft.com/Adminportal/Home#/Settings/IntegratedApps>.

   > [!TIP]
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
     - **Assigned users** section: Select **Edit users** to go to the **Users** tab. Use this setting to limit the users who have the add-in.
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

## Frequently asked questions

### Q: Why are the add-ins being deprecated?

A: The add-ins are being deprecated for the following reasons:

- There are security issues with the add-in which makes them unsafe for the organization. Given Microsoft's commitment to safety, they need to be deprecated.
- The add-ins can't architecturally support functionality that customers keep asking for.

Therefore, we decided to move to the built-in **Report** button to better serve your requirements.

### Q: What do we mean by the add-ins are in maintenance mode?

A: It means that no improvement will be made to the add-ins. The add-ins will remain functional until they're deprecated. Naturally, any new improvement requests for the add-ins will be rejected.

### Q: Will there be further communication before the add-in are deprecated?
    Yes there will be further communication as we progress towards the add-in deprecation.

### Q: Some users in my organization are on an older client, which prevents us from migrating. What can I do?

A: We recommend you update clients in the Microsoft admin center or ask users to update their clients. Reach out to Microsoft Support if you have issues updating clients for users.

### Q: The Report phishing add-in offers a single report option but the built-in Report button has more options. What can I do?

A: This design was finalized after partnership with more than 50 customers and a Private Preview of approximately two and half years. Many customers who had this question are actually much more comfortable with the built-in **Report** button.

They transitioned completely to the built-in **Report** button. Users were instructed to use the default action (split) for reporting messages as phishing, and to use the side menu to report messages as other types (Junk or Not junk).

We recommend that you try the built-in **Report** button. If you're still facing issues, you can always reach out to us via Microsoft Support.

### Q: I can't scope the built-in Report button, which prevents me from rolling it out. What can I do?

A: This behavior is by design. We think the built-in **Report** button provides a base level of protection for all users, including shared and delegate mailboxes. Scoping the built-in **Report** button to a limited number of users can result in forgetting about those users, which leavs a security gap that can be exploited by attackers. Many customers totaling more than a million users migrated smoothly to the the built-in **Report** button smoothly without scoping ability. Instead, they scoped third-party add-in buttons or the Microsoft add-ins as they rolled out the built-in **Report** button across the organization.

If you're looking to scope the functionality for experimentation, we recommend using a test environment.

### Q: I want to see further improvements in the inbuild report button. What can I do?

A: Raise a design change request (DCR) via Microsoft support.

### Q: Is there a way to keep the add-in but remove the built-in Report button?

A: No. Unfortunately, due to the previously stated reasons, the add-ins will be deprecated. There's no way to keep the add-in and remove the built-in **Report** button. You can remove the add-in from the **Deployed apps** tab of the **Integrated apps** page as previously described.

### Q: What is the recommendation for moving from the add-ins to a third-party reporting add-in?

A: After you, remove the add-in from the integrated apps from the **Deployed apps** tab of the **Integrated apps** page as previously described, install the third-party add-in as per their instructions.

On the [User reported settings page](submissions-user-reported-messages-custom-mailbox.md) in the Defender portal, you need to do the following steps:

1. Select **Monitor reported messages in Outlook**.
2. Select **Use a non-Microsoft add-in button**.
3. In the **Reported message destination** section, configure the following options:
   - **Send reported messages to**: Select one of the following values:
     - **My reporting mailbox only**
     - **Microsoft and My reporting mailbox**
   - **Add an Exchange Online mailbox to send reported messages to**: Specify an existing internal reporting mailbox to hold user reported messages from third-party

### Q: I still have questions that aren't answered here. What can I do?

A: No worries. Just raise a support ticket via Microsoft support and we will get right back to you.
