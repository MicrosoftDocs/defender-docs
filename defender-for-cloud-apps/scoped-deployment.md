---
title: Scope your deployment to include or exclude users or user groups.
description: This article provides information about how to scope your Defender for Cloud Apps deployment, including and excluding specific users or groups.
ms.date: 01/29/2023
ms.topic: how-to
---

# Scope your deployment to specific users or user groups



Microsoft Defender for Cloud Apps enables you to scope your deployment. Scoping allows you to select certain user groups to be monitored for apps or excluded from monitoring.

> [!NOTE]
> Scoped Deployment **does not** reduce the number of files, Oauth applications and User accounts that are scanned. It only reduce the number of **user activities** based on the selected user group.
## Include or exclude user groups

You may not want to use Microsoft Defender for Cloud Apps for all the users in your organization. Scoping is especially useful when you want to limit your deployment because of license restrictions. You may also need to limit because of compliance regulations requiring you not monitor users from certain countries/regions. For example, use scoped deployment to only monitor US-based employees. Alternatively, you can avoid showing any activities for your users based in Germany.

- To scope your deployment, you must first [import user groups](user-groups.md) to Microsoft Defender for Cloud Apps. By default, you'll see the following groups:

  - **Application** user group -  A built-in group that enables you to see activities performed by Microsoft 365 and Microsoft Entra applications.

  - **External users** group - All users who aren't members of any of the managed domains you configured for your organization.

- Setting an include rule will automatically exclude all groups not within the included group. For example, if you set a rule to include all members of the US-office groups, any groups who aren't part of that group won't be monitored.

- Excluded user groups override included user groups. Meaning that if you include the user group "UK-employees" but exclude "Marketing", marketing members from the UK won't be monitored even if they're members of the group **UK-employees**.

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **System**, select **Scoped deployment and privacy**.

1. To scope your deployment to include or exclude specific groups, you must first [import user groups](user-groups.md) into Microsoft Defender for Cloud Apps.

1. To set specific groups to be monitored by Microsoft Defender for Cloud Apps, in the **Include** tab, select **+Add rule**.

1. In the **Create new include rule** dialog, do the following steps:

    1. Under **Type rule name**, give the rule a descriptive name.
    1. Under **Select user groups**, select all the groups you want to monitor with Defender for Cloud Apps.
    1. Select whether you want to apply this rule to all connected apps or only to **Specific apps**. If you select **Specific apps**, the rule will only affect monitoring of the apps you select. For example, if you select the group **UI team users** and **Box**, Defender for Cloud Apps will only monitor Box activity for users in your UI team users group and for all other apps, Defender for Cloud Apps will monitor all activities for all users.

        ![include rule.](media/include-rule.png)

1. To set specific groups to be excluded from monitoring, in the **Exclude** tab, select **+Add rule**.

1. In the **Create new Exclude rule** dialog, set the following parameters:

    1. Under **Type rule name**, give the rule a descriptive name.
    Under **Select user groups**, select all the groups you don't want Defender for Cloud Apps to monitor.
    1. Select whether you want to apply this rule to all connected apps or only to **Specific apps**. If you select **Specific apps**, Defender for Cloud Apps will stop monitoring the group you selected only for the apps you select. That means that if you select the group **UI team users** and **Active Directory**, Defender for Cloud Apps will monitor all user activity except Active Directory activities that are performed by UI team users.

       ![exclude rule.](media/exclude-rule.png)

## Example results for include and exclude rules

The include and exclude rules you create work together to scope the overall monitoring performed by Microsoft Defender for Cloud Apps. Here's an example of include and exclude rules you can create, and the final result of what Microsoft Defender for Cloud Apps monitors after these rules are running.

If you create the following rules:

- Exclude user group "Germany all users"
- Include for user group "Global sales" only Microsoft 365 activities
- Include for user group "Sales managers" only Power BI activities
- Salesforce is connected to Microsoft Defender for Cloud Apps and no rules are set for it

The following user activities are monitored:

|User|Group membership|Activities monitored|
|----|----|----|
|Adriana|Germany all users<br />Global sales<br />Sales managers|None|
|Alain|Global sales|Microsoft 365 and all subapps except Power BI|
|Cornel|Global sales<br />Sales managers|Microsoft 365 and all subapps|
|Raymond|Sales managers|Power BI only|

> [!NOTE]
> Other apps will not be affected by the group scoping in these rules.
> In the example, for Salesforce, all activities are monitored for all user groups.

## Next steps

> [!div class="nextstepaction"]
> [Set up cloud discovery](set-up-cloud-discovery.md)

[!INCLUDE [Open support ticket](includes/support.md)]  
