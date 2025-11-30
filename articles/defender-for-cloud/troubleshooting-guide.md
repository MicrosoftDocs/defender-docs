---
title: Microsoft Defender for Cloud troubleshooting guide
description: This guide is for IT professionals, security analysts, and cloud admins who need to troubleshoot problems related to Microsoft Defender for Cloud.
author: Elazark
ms.author: elkrieger
ms.topic: conceptual
ms.date: 05/06/2025
---

# Microsoft Defender for Cloud troubleshooting guide

This guide is for IT professionals, information security analysts, and cloud administrators whose organizations need to troubleshoot problems related to Microsoft Defender for Cloud.

> [!TIP]
> When you're facing a problem or need advice from our support team, the **Diagnose and solve problems** section of the Azure portal is a good place to look for solutions.
>
> :::image type="content" source="media/release-notes/solve-problems.png" alt-text="Screenshot of the Azure portal that shows the page for diagnosing and solving problems in Defender for Cloud." lightbox="media/release-notes/solve-problems.png":::

## Use the audit log to investigate problems

The first place to look for troubleshooting information is the [audit log](/azure/azure-monitor/essentials/platform-logs-overview) for the failed component. In the audit log, you can see details like:

- Which operations were performed.
- Who initiated the operation.
- When the operation occurred.
- The status of the operation.

The audit log contains all write operations (`PUT`, `POST`, `DELETE`) performed on your resources, but not read operations (`GET`).

## Troubleshoot improperly working antimalware protection

The guest agent is the parent process of everything that the [Microsoft Antimalware](/azure/security/fundamentals/antimalware) extension does. When the guest agent process fails, the Microsoft Antimalware protection that runs as a child process of the guest agent might also fail.

Here are some troubleshooting tips:

- If the target VM was created from a custom image, make sure that the creator of the VM installed a guest agent.
- If the target is a Linux VM, installing the Windows version of the antimalware extension will fail. The Linux guest agent has specific OS and package requirements.
- If the VM was created with an old version of the guest agent, the old agent might not have the ability to automatically update to the newer version. Always use the latest version of the guest agent when you create your own images.
- Some third-party administration software might disable the guest agent or block access to certain file locations. If third-party administration software is installed on your VM, make sure that the antimalware agent is on the exclusion list.
- Make sure that firewall settings and a network security group aren't blocking network traffic to and from the guest agent.
- Make sure that no access control lists are preventing disk access.
- The guest agent needs sufficient disk space to function properly.

By default, the Microsoft Antimalware user interface is disabled. But you can [enable the Microsoft Antimalware user interface](/archive/blogs/azuresecurity/enabling-microsoft-antimalware-user-interface-post-deployment) on Azure Resource Manager VMs.

## Troubleshoot problems with loading the dashboard

If you experience problems with loading the workload protection dashboard, make sure that the user who first enabled Defender for Cloud on the subscription and the user who wants to turn on data collection have the *Owner* or *Contributor* role on the subscription. If so, users with the *Reader* role on the subscription can see the dashboard, alerts, recommendations, and policy.

## Troubleshoot connector problems for the Azure DevOps organization

If you can't onboard your Azure DevOps organization, try the following troubleshooting tips:

- Make sure you're using a non-preview version of the [Azure portal](https://portal.azure.com); the authorize step doesn't work in the Azure preview portal.

- It's important to know which account you're signed in to when you authorize the access, because that will be the account that the system uses for onboarding. Your account can be associated with the same email address but also associated with different tenants. Make sure that you select the right account/tenant combination. If you need to change the combination:

  1. On your [Azure DevOps profile page](https://app.vssps.visualstudio.com/profile/view), use the dropdown menu to select another account.

     :::image type="content" source="./media/troubleshooting-guide/authorize-select-tenant.png" alt-text="Screenshot of the Azure DevOps profile page that's used to select an account." lightbox="media/troubleshooting-guide/authorize-select-tenant.png":::

  1. After you select the correct account/tenant combination, go to **Environment settings** in Defender for Cloud and edit your Azure DevOps connector. Reauthorize the connector to update it with the correct account/tenant combination. You should then see the correct list of organizations on the dropdown menu.

- Ensure that you have the *Project Collection Administrator* role on the Azure DevOps organization that you want to onboard.

- Ensure that the **Third-party application access via OAuth** toggle is **On** for the Azure DevOps organization. [Learn more about enabling OAuth access](/azure/devops/organizations/accounts/change-application-access-policies).

## Contact Microsoft support

You can also find troubleshooting information for Defender for Cloud at the [Defender for Cloud Q&A page](/answers/topics/azure-security-center.html).

If you need more assistance, you can open a new support request on the Azure portal. On the **Help + support** page, select **Create a support request**.

:::image type="content" source="media/troubleshooting-guide/troubleshooting-guide-fig2.png" alt-text="Screenshot of selections for creating a support request in the Azure portal." lightbox="media/troubleshooting-guide/troubleshooting-guide-fig2.png":::

## See also

- Learn how to [manage and respond to security alerts](manage-respond-alerts.md) in Defender for Cloud.
- Learn about [alert validation](alert-validation.md) in Defender for Cloud.
- Review [common questions](faq-general.yml) about using Defender for Cloud.
