---
title: How do I pilot and deploy Defender for Office 365?
description: How to pilot and deploy Microsoft Defender for Office 365 in your production Microsoft 365 tenant.
search.appverid: met150
ms.service: defender-xdr
f1.keywords:
  - NOCSH
ms.author: dansimp
author: dansimp
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection:
  - m365-security
  - m365solution-scenario
  - m365solution-evalutatemtp
  - zerotrust-solution
  - highpri
  - tier1
ms.topic: conceptual
ms.date: 05/31/2024
---

# Pilot and deploy Defender for Office 365

**Applies to:**
- Microsoft Defender XDR


This article provides a workflow for piloting and deploying Microsoft Defender for Office 365 in your organization. You can use these recommendations to onboard Microsoft Defender for Office 365 as an individual cybersecurity tool or as part of an end-to-end solution with Microsoft Defender XDR.

This article assumes you have a production Microsoft 365 tenant and are piloting and deploying Microsoft Defender for Office 365 in this environment. This practice will maintain any settings and customizations you configure during your pilot for your full deployment.

Defender for Office 365 contributes to a Zero Trust architecture by helping to prevent or reduce business damage from a breach. For more information, see the [Prevent or reduce business damage from a breach](/security/zero-trust/adopt/prevent-reduce-business-damage-breach) business scenario in the Microsoft Zero Trust adoption framework.

## End-to-end deployment for Microsoft Defender XDR

This is article 3 of 6 in a series to help you deploy the components of Microsoft Defender XDR, including investigating and responding to incidents.

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-office-365.svg" alt-text="A diagram that shows Microsoft Defender for Office 365 in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-office-365.svg" border="false":::

The articles in this series correspond to the following phases of end-to-end deployment:

| Phase | Link |
|---|---|
| A. Start the pilot | [Start the pilot](pilot-deploy-overview.md#start-the-pilot)|
| B. Pilot and deploy Microsoft Defender XDR components | - [Pilot and deploy Defender for Identity](pilot-deploy-defender-identity.md) <br><br> - **Pilot and deploy  Defender for Office 365** (this article) <br><br> - [Pilot and deploy Defender for Endpoint](pilot-deploy-defender-endpoint.md) <br><br> - [Pilot and deploy Microsoft Defender for Cloud Apps](pilot-deploy-defender-cloud-apps.md)  |
|C. Investigate and respond to threats | [Practice incident investigation and response](pilot-deploy-investigate-respond.md) |

## Pilot and deploy workflow for Defender for Office 365

The following diagram illustrates a common process to deploy a product or service in an IT environment.

:::image type="content" source="./media/eval-defender-xdr/adoption-phases.svg" alt-text="Diagram of the pilot, evaluate, and full deployment adoption phases." lightbox="./media/eval-defender-xdr/adoption-phases.svg":::

You start by evaluating the product or service and how it will work within your organization. Then, you pilot the product or service with a suitably small subset of your production infrastructure for testing, learning, and customization. Then, gradually increase the scope of the deployment until your entire infrastructure or organization is covered.

Here is the workflow for piloting and deploying Defender for Office 365 in your production environment.

:::image type="content" source="./media/eval-defender-xdr/defender-office-365-pilot-deploy-steps.svg" alt-text="A diagram that shows the steps to pilot and deploy Microsoft Defender for Office 365." lightbox="./media/eval-defender-xdr/defender-office-365-pilot-deploy-steps.svg" border="false":::

Follow these steps:

1. [Audit and verify the public MX record](#step-1)
1. [Audit accepted domains](#step-2)
1. [Audit inbound connectors](#step-3)
1. [Activate the evaluation](#step-4)
1. [Create pilot groups](#step-5)
1. [Configure protection](#step-6)
1. [Try out capabilities](#step-7)

Here are the recommended steps for each deployment stage.

| Deployment stage | Description |
| --- | --- |
| Evaluate | Perform product evaluation for Defender for Office 365. |
| Pilot | Perform Steps 1-7 for pilot groups. |
| Full deployment | Configure the pilot user groups in Step 5 or add user groups to expand beyond the pilot and eventually include all of your user accounts. |

## Defender for Office 365 architecture and requirements

The following diagram illustrates baseline architecture for Microsoft Defender for Office 365, which can include a third-party SMTP gateway or on-premises integration. Hybrid coexistence scenarios (that is, production mailboxes are both on-premises and online) require more complex configurations and aren't covered in this article or evaluation guidance.

:::image type="content" source="./media/eval-defender-xdr/m365-defender-office-architecture.svg" alt-text="A diagram for the architecture for the Microsoft Defender for Office 365." lightbox="./media/eval-defender-xdr/m365-defender-office-architecture.svg":::

The following table describes this illustration.

| Call-out | Description |
|---|---|
| 1 | The host server for the external sender typically performs a public DNS lookup for an MX record, which provides the target server to relay the message. This referral can either be Exchange Online (EXO) directly or an SMTP gateway configured to relay against EXO. |
| 2 | Exchange Online Protection negotiates and validates the inbound connection and inspects the message headers and content to determine what extra policies, tagging, or processing is required. |
| 3 | Exchange Online integrates with Microsoft Defender for Office 365 to offer more advanced threat protection, mitigation, and remediation. |
| 4  |A message that isn't malicious, blocked, or quarantined is processed and delivered to the recipient in EXO where user preferences related to junk mail, mailbox rules, or other settings are evaluated and triggered. |
| 5 | Integration with on-premises Active Directory can be enabled using Microsoft Entra Connect to synchronize and provision mail-enabled objects and accounts to Microsoft Entra ID and ultimately Exchange Online. |
| 6 | When integrating an on-premises environment, it's best to use an Exchange server for supported management and administration of mail-related attributes, settings, and configurations. |
| 7 | Microsoft Defender for Office 365 shares signals to Microsoft Defender XDR for extended detection and response (XDR). |

On-premises integration is common but optional. If your environment is cloud-only, this guidance also works for you.

A successful Defender for Office 365 evaluation or production pilot requires the following prerequisites:

- All your recipient mailboxes are currently in Exchange Online.
- Your public MX record resolves directly to EOP or a third-party Simple Mail Transfer Protocol (SMTP) gateway that then relays inbound external email directly to EOP.
- Your primary email domain is configured as *authoritative* in Exchange Online.
- You successfully deployed and configured *Directory-Based Edge Blocking* (DBEB) as appropriate. For more information, see [Use Directory-Based Edge Blocking to reject messages sent to invalid recipients](/exchange/mail-flow-best-practices/use-directory-based-edge-blocking).

> [!IMPORTANT]
> If these requirements aren't applicable or you are still in a hybrid coexistence scenario, then a Microsoft Defender for Office 365 evaluation can require more complex or advanced configurations which aren't fully covered in this guidance.

<a name="step-1"></a>

## Step 1: Audit and verify the public MX record

To effectively evaluate Microsoft Defender for Office 365, it's important that inbound external email is relayed through the Exchange Online Protection (EOP) instance associated with your tenant.

1. In the M365 Admin Portal at <https://admin.microsoft.com>, expand *...Show all* if necessary, expand *Settings*, and then select **Domains**. Or, to go directly to the *Domains* page, use <https://admin.microsoft.com/Adminportal/Home#/Domains>.
2. On the *Domains* page, select your verified email domain by clicking anywhere on the entry other than the check box.
3. In the domain details flyout that opens, select the **DNS records** tab. Make note of the MX record that's generated and assigned to your EOP tenant.
4. Access your external (public) DNS zone and check the primary MX record associated with your email domain:
    - *If your public MX record currently matches the assigned EOP address (for example, contoso-com.mail.protection.outlook.com) then no further routing changes should be required*.
    - If your public MX record currently resolves to a third-party or on-premises SMTP gateway, then additional routing configurations may be required.
    - If your public MX record currently resolves to on-premises Exchange, then you may still be in a hybrid model where some recipient mailboxes haven't yet been migrated to EXO.

<a name="step-2"></a>

## Step 2: Audit accepted domains

1. In the Exchange admin center (EAC) at <https://admin.exchange.microsoft.com>, expand *Mail flow*, and then click **Accepted domains**. Or, to go directly to the *Accepted domains* page, use <https://admin.exchange.microsoft.com/#/accepteddomains>.
2. On the *Accepted domains* page, make note of the **Domain type** value for your primary email domain.
    - If the domain type is set to **Authoritative**, then it's assumed all recipient mailboxes for your organization currently reside in Exchange Online.
    - If the domain type is set to **InternalRelay**, then you may still be in a hybrid model where some recipient mailboxes still reside on-premises.

<a name="step-3"></a>

## Step 3: Audit inbound connectors

1. In the Exchange admin center (EAC) at <https://admin.exchange.microsoft.com>, expand *Mail flow*, and then click **Connectors**. Or, to go directly to the *Connectors* page, use <https://admin.exchange.microsoft.com/#/connectors>.
2. On the *Connectors* page, make note of any connectors with the following settings:
   - The **From** value is **Partner org** that might correlate to a third-party SMTP gateway.
   - The **From** value is **Your org** that might indicate you're still in a hybrid scenario.

<a name="step-4"></a>

## Step 4: Activate the evaluation

Use the instructions here to activate your Microsoft Defender for Office 365 evaluation from the Microsoft Defender portal.

For detailed information, see [Try Microsoft Defender for Office 365](/defender-office-365/try-microsoft-defender-for-office-365).

1. In the Microsoft Defender portal at <https://security.microsoft.com>, expand *Email & collaboration* \> select **Policies & rules** \> select **Threat policies** \> scroll down to the *Others* section, and then select **Evaluation mode**. Or, to go directly to the *Evaluation mode* page, use <https://security.microsoft.com/atpEvaluation>.

2. On the *Evaluation mode* page, click **Start evaluation**.

   :::image type="content" source="/defender/media/mdo-eval/mdo-eval-activate-eval_05.png" alt-text="Screenshot of the Evaluation mode page and the Start evaluation button to click." lightbox="/defender/media/mdo-eval/mdo-eval-activate-eval_05.png":::

3. In the *Turn on protection* dialog, select **No, I only want reporting**, and then click **Continue**.

   :::image type="content" source="/defender/media/mdo-eval/mdo-eval-activate-eval_06.png" alt-text="Screenshot of the Turn on protection dialog and the No, I only want reporting option to select." lightbox="/defender/media/mdo-eval/mdo-eval-activate-eval_06.png":::

4. In the *Select the users you want to include* dialog, select **All users**, and then click **Continue**.

   :::image type="content" source="/defender/media/mdo-eval/mdo-eval-activate-eval_07.png" alt-text="Screenshot of the Select the users you want to include dialog and the All users option to select." lightbox="/defender/media/mdo-eval/mdo-eval-activate-eval_07.png":::

5. In the *Help us understand your mail flow* dialog, one of the following options is automatically selected based on our detection of the MX record for your domain:

   - **I'm only using Microsoft Exchange Online**: The MX records for your domain point to Microsoft 365. There's nothing left to configure, so click **Finish**.

     :::image type="content" source="/defender/media/mdo-eval/mdo-eval-activate-eval_08a.png" alt-text="Screenshot of the Help us understand your mail flow dialog with the I'm only using Microsoft Exchange Online option selected." lightbox="/defender/media/mdo-eval/mdo-eval-activate-eval_08a.png":::

   - **I'm using a third-party and/or on-premises service provider**: In the upcoming screens, select the vendor name along with the inbound connector that accepts mail from that solution. You also decide if you need an Exchange Online mail flow rule (also known as a transport rule) that skips spam filtering for incoming messages from the third-party protection service or device. When you're finished, click **Finish**.

<a name="step-5"></a>

## Step 5: Create pilot groups

When you pilot Microsoft Defender for Office 365, you might choose to pilot specific users before enabling and enforcing policies for your entire organization. Creating distribution groups can help manage the deployment processes. For example, create groups such as *Defender for Office 365 Users - Standard Protection*, *Defender for Office 365 Users - Strict Protection*, *Defender for Office 365 Users - Custom Protection*, or *Defender for Office 365 Users - Exceptions*.

It might not be evident why 'Standard' and 'Strict' are the terms used for these groups, but that will become clear when you explore more about Defender for Office 365 security presets. Naming groups 'custom' and 'exceptions' speak for themselves, and though most of your users should fall under *standard* and *strict*, custom and exception groups will collect valuable data for you regarding managing risk.

Distribution groups can be created and defined directly in Exchange Online or synchronized from on-premises Active Directory.

1. Sign in to the Exchange Admin Center (EAC) at <https://admin.exchange.microsoft.com> using an account that has been granted Recipient Administrator role or been delegated group management permissions.
2. Go to **Recipients** \> **Groups**.

   :::image type="content" source="/defender/media/mdo-eval/1_mdo-eval-pilot.png" alt-text=" Screenshot of the Groups menu item." lightbox="/defender/media/mdo-eval/1_mdo-eval-pilot.png":::

3. On the **Groups** page, select ![Add a group icon.](/defender/media/m365-cc-sc-add-internal-icon.png) **Add a group**.

   :::image type="content" source="/defender/media/mdo-eval/2_mdo-eval-pilot-add-group.png" alt-text="Screenshot of the Add a group option." lightbox="/defender/media/mdo-eval/2_mdo-eval-pilot-add-group.png":::

4. For group type, select **Distribution**, and then click **Next**.

   :::image type="content" source="/defender/media/mdo-eval/3-mdo-eval-pilot-group-type.png" alt-text="Screenshot of the Choose a group type section." lightbox="/defender/media/mdo-eval/3-mdo-eval-pilot-group-type.png":::

5. Give the group a **Name** and optional **Description**, and then click Next.

   :::image type="content" source="/defender/media/mdo-eval/4_mdo-eval-pilot-set-up-basics.png" alt-text="Screenshot of the Set up the basics section." lightbox="/defender/media/mdo-eval/4_mdo-eval-pilot-set-up-basics.png":::

6. On the remaining pages, assign an owner, add members to the group, set the email address, join-depart restrictions, and other settings.

<a name="step-6"></a>

## Step 6: Configure protection

Some capabilities in Defender for Office 365 are configured and turned on by default, but security operations might want to raise the level of protection from the default.

Some capabilities are *not yet* configured. You have the following options for configuring protection (which are easy to change later):

- **Assign users to preset security policies**: [Preset security policies](/defender-office-365/preset-security-policies) are the recommended method to quickly assign a uniform level of protection across all of the capabilities. You can choose from **Standard** or **Strict** protection. The settings for Standard and Strict are described in the tables [here](/defender-office-365/recommended-settings-for-eop-and-office365). The differences between Standard and Strict are summarized in the table [here](/defender-office-365/preset-security-policies#policy-settings-in-preset-security-policies).

  The advantages of preset security policies are you protect groups of users as quickly as possible using Microsoft's recommended settings based on observations in the datacenters. As new protection capabilities are added and as the security landscape changes, the settings in preset security policies are automatically updated to our recommended settings.

  The disadvantage of preset security policies is you can't customize virtually any of the security settings in preset security policies (for example, you can't change an action from deliver to junk to quarantine, or vice-versa). The exception is entries and optional exceptions for [user impersonation and domain impersonation protection](/defender-office-365/anti-phishing-policies-about#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365), which you must configure manually.

  Also, keep in mind that preset security policies are *always* applied before custom policies. So, if you want to create and use any custom policies, you'll need to exclude users in those custom policies from preset security policies.

- **Configure *custom* protection policies**: If you prefer to configure the environment yourself, compare the default, Standard, and Strict settings in [Recommended settings for EOP and Microsoft Defender for Office 365 security](/defender-office-365/recommended-settings-for-eop-and-office365). Keep a spreadsheet of where your custom build deviates.

  You can also use the [Configuration analyzer](/defender-office-365/configuration-analyzer-for-security-policies) to compare the settings in your custom policies to the Standard and Strict values.

For detailed information about choosing preset security policies vs. custom policies, see [Determine your protection policy strategy](/defender-office-365/mdo-deployment-guide#determine-your-protection-policy-strategy).

### Assign preset security policies

We recommend you begin with the *preset security policies* in EOP and Defender for Office 365 fast by assigning them to specific pilot users or defined groups as part of your evaluation. Preset policies offer a baseline **Standard** protection template or a more aggressive **Strict** protection template, which can be assigned independently.

For example, an EOP condition for pilot evaluations could be applied if the recipients are *members* of a defined *EOP Standard Protection* group, and then managed by adding accounts to, or removing account from, the group.

Likewise, a Defender for Office 365 condition for pilot evaluations could be applied if the recipients are *members* of a defined *Defender for Office 365 Standard Protection* group and then managed by adding or removing accounts via the group.

For complete instructions, see [Use the Microsoft Defender portal to assign Standard and Strict preset security policies to users](/defender-office-365/preset-security-policies#use-the-microsoft-defender-portal-to-assign-standard-and-strict-preset-security-policies-to-users).

### Configure custom protection policies

The pre-defined *Standard* or *Strict* Defender for Office 365 policy templates give your pilot users the recommended baseline protection. However, you can also build and assign custom protection policies as part of your evaluation.

It's *important* to be aware of the precedence these protection policies take when applied and enforced, as explained in [Order of precedence for preset security policies and other policies](/defender-office-365/preset-security-policies#order-of-precedence-for-preset-security-policies-and-other-policies).

The explanation and table in [Configure protection policies](/defender-office-365/mdo-deployment-guide#step-2-configure-protection-policies) provides a handy reference for what you need to configure.

<a name="step-7"></a>

## Step 7: Try out capabilities

Now that your pilot is set up and configured, it's helpful to become familiar with the reporting, monitoring, and attack simulation tools that are unique to Microsoft Defender for Microsoft 365.

|Capability|Description|More information|
|---|---|---|
|Threat Explorer|Threat Explorer is a powerful near real-time tool to help Security Operations teams investigate and respond to threats and displays information about detected malware and phishing in email and files in Office 365, as well as other security threats and risks to your organization.|[About Threat Explorer](/defender-office-365/threat-explorer-real-time-detections-about)|
|Attack simulation training|You can use Attack simulation training in the Microsoft Defender portal to run realistic attack scenarios in your organization, which help you identify and find vulnerable users before a real attack impacts your environment.|[Get started using Attack simulation training](/defender-office-365/attack-simulation-training-get-started)|
|Reports dashboard|On the left navigation menu, click Reports and expand the Email & collaboration heading. The Email & collaboration reports are about spotting security trends some of which will allow you to take action (through buttons like 'Go to submissions'), and others that will show trends. These metrics are generated automatically.|[View email security reports in the Microsoft Defender portal](/defender-office-365/reports-email-security) <br/><br/> [View Defender for Office 365 reports in the Microsoft Defender portal](/defender-office-365/reports-defender-for-office-365)|

## SIEM integration

You can integrate Defender for Office 365 with Microsoft Sentinel or a generic security information and event management (SIEM) service to enable centralized monitoring of alerts and activities from connected apps. With Microsoft Sentinel, you can more comprehensively analyze security events across your organization and build playbooks for effective and immediate response.

:::image type="content" source="./media/eval-defender-xdr/defender-office-365-siem-integration.svg" alt-text="A diagram that shows the architecture for Microsoft Defender for Office 365 with SIEM integration." lightbox="./media/eval-defender-xdr/defender-office-365-siem-integration.svg":::

Microsoft Sentinel includes a Defender for Office 365 connector. For more information, see [Connect alerts from Microsoft Defender for Office 365](/azure/sentinel/connect-office-365-advanced-threat-protection).

Microsoft Defender for Office 365 can also be integrated into other SIEM solutions using the [Office 365 Activity Management API](/office/office-365-management-api/office-365-management-activity-api-reference). For information about integration with generic SIEM systems, see [Generic SIEM integration](/cloud-app-security/siem).

## Next step

Incorporate the information in [Microsoft Defender for Office 365 Security Operations Guide](/defender-office-365/mdo-sec-ops-guide) into your SecOps processes.

## Next step for the end-to-end deployment of Microsoft Defender XDR

Continue your end-to-end deployment of Microsoft Defender XDR with [Pilot and deploy Defender for Endpoint](pilot-deploy-defender-endpoint.md).

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-endpoint.svg" alt-text="A diagram that shows Microsoft Defender for Endpoint in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-endpoint.svg" border="false":::

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
