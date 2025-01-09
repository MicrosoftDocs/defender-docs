---
title: Attack simulation training deployment considerations and FAQ
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: how-to
ms.localizationpriority: medium
search.appverid:
  - MET150
  - MOE150
ms.assetid:
ms.collection:
- m365-security
- tier2
ms.custom:
  - seo-marvel-apr2020
description: Admins can learn about deployment considerations and frequently asked questions regarding Attack simulation and training in Microsoft 365 E5 or Microsoft Defender for Office 365 Plan 2 organizations.
ms.service: defender-office-365
ms.date: 10/22/2024
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
---

# Attack simulation training deployment considerations and FAQ

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Attack simulation training enables Microsoft 365 E5 or Microsoft Defender for Office 365 Plan 2 organizations to measure and manage social engineering risk by allowing the creation and management of phishing simulations that are powered by real-world, harmless phishing payloads. Hyper-targeted training, delivered in partnership with Terranova security, helps improve knowledge and change employee behavior.

For more information about getting started with Attack simulation training, see [Get started using Attack simulation training](attack-simulation-training-get-started.md).

While the simulation creation and scheduling experience is designed to be free-flowing and frictionless, simulations at an enterprise scale require planning. This article helps address specific challenges that we see as our customers run simulations in their own environments.

## Issues with end user experiences

### Phishing simulation URLs blocked by Google Safe Browsing

A URL reputation service might identify one or more of the URLs that are used by Attack simulation training as unsafe. Google Safe Browsing in Google Chrome blocks some of the simulated phishing URLs with a **Deceptive site ahead** message. While we work with many URL reputation vendors to always allow our simulation URLs, we don't always have full coverage.

:::image type="content" source="media/attack-sim-training-faq-chrome-deceptive-site-message.png" alt-text="The Deceptive site ahead warning in Google Chrome" lightbox="media/attack-sim-training-faq-chrome-deceptive-site-message.png":::

This issue doesn't affect Microsoft Edge.

As part of the planning phase, be sure to check the availability of the URL in your supported web browsers before you use the URL in a phishing campaign. If the URLs are blocked by Google Safe Browsing, [follow this guidance](https://support.google.com/chrome/a/answer/7532419) from Google to allow access to the URLs.

Refer to [Get started using Attack simulation training](attack-simulation-training-get-started.md) for the list of URLs that are currently used by Attack simulation training.

### Phishing simulation and admin URLs blocked by network proxy solutions and filter drivers

Both phishing simulation URLs and admin URLs might be blocked or dropped by your intermediate security devices or filters. For example:

- Firewalls
- Web Application Firewall (WAF) solutions
- Third-party filter drivers (for example, kernel mode filters)

While we have seen few customers being blocked at this layer, it does happen. If you encounter problems, consider configuring the following URLs to bypass scanning by your security devices or filters as required:

- The simulated phishing URLs as described in [Get started using Attack simulation training](attack-simulation-training-get-started.md).
- <https://security.microsoft.com/attacksimulator>
- <https://security.microsoft.com/attacksimulationreport>
- <https://security.microsoft.com/trainingassignments>

### Simulation messages not delivered to all targeted users

It's possible that the number of users who actually receive the simulation email messages is less than the number of users who were targeted by the simulation. The following types of users are excluded as part of target validation:

- Invalid recipient email addresses.
- Guest users.
- Users that are no longer active in Microsoft Entra ID.

If you use distribution groups or mail-enabled security groups to target users, you can use the [Get-DistributionGroupMember](/powershell/module/exchange/get-distributiongroupmember) cmdlet in [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) to view and validate distribution group members.

### Trainings unexpectedly assigned or not assigned to users

The training threshold in training campaigns prevents users from having the same trainings assigned to them during a specific interval (90 days by default). For more information, see [Set the training threshold](attack-simulation-training-settings.md#configure-the-training-threshold).

If you created a [simulation](attack-simulation-training-simulations.md#assign-training) or a [simulation automation](attack-simulation-training-simulation-automations.md#assign-training) with the training assignment value **Assign training for me (Recommended)**, we assign training based on a user's previous simulation and training results. To assign training based on specific criteria, select **Select training courses and modules myself**.

### What happens when a user replies to or forwards a simulation message?

If a user replies to or forwards a simulation message to another mailbox, the message is treated like a normal email message (including detonation by Safe Links or Safe Attachments). The [Simulation report](attack-simulation-training-insights.md#simulation-report-for-simulations) shows whether the simulation message was replied to or forwarded. Each URL in the simulation email is tied to an individual user, so Safe Links detonations are identified as clicks by the user.

If you use a dedicated security operations (SecOps) mailbox, be sure to identify it as a SecOps in the [advanced delivery policy](advanced-delivery-policy-configure.md#use-the-microsoft-defender-portal-to-configure-secops-mailboxes-in-the-advanced-delivery-policy) so messages are delivered unfiltered.

### How can I stagger the delivery of simulation messages?

- Simulations offer [region aware delivery](#q-how-does-region-aware-delivery-work).
- Simulation automations have a [simulation schedule page](attack-simulation-training-simulation-automations.md#simulation-schedule) where you can randomize delivery and configure other delivery details.

Either way, it's important to use different payloads to avoid discussion and identification among users.

### Why are images in simulation messages being blocked by Outlook?

By default, Outlook is configured to block automatic image downloads in messages from the internet. Although you can [configure Outlook to automatically download images](https://support.microsoft.com/office/15e08854-6808-49b1-9a0a-50b81f2d617a), we don't recommend it due to the security implications (potential automatic download of malicious code or web bugs, also known as web beacons or tracking pixels).

### I see clicks or compromise events from users who insist they didn't click the link in the simulation message OR I see clicks within a few seconds of delivery for many users (false positives). What's going on?

These events can occur when additional security devices or applications inspect simulation messages. For example (but not limited to): 

- Applications or plugins within Outlook that inspect or intercept the message.
- Email security applications.
- Endpoint security or anti-virus software.
- Security orchestration, automation and response (SOAR) playbooks that automatically triage or automatically respond to reported messages.

These types of applications can look at web content to detecting phishing, so you need to define exclusions for simulation messages in these applications.

EmailLinkClicked_IP and EmailLinkClicked_TimeStamp data might give more details about the event. For example, if a click occured a few seconds after delivery, and the IP address doesn't belong to Microsoft, your company, or the user, then it's likely that a third-party filtering system or another service intercepted the message.

For any non-Microsoft filtering systems or services, you need to allow or exempt the following items:

- All [Attack simulation training URLs](attack-simulation-training-get-started.md#simulations) and the corresponding domains. Currently, we don't send simulation messages from a static list of IP addresses.
- Any other domains that you use in custom payloads.
	
### Can I add the External tag or safety tips to simulation messages?

Custom payloads have the option to add the External tag to messages. For more information, see Step 5 in [Create payloads](attack-simulation-training-payloads.md#create-payloads).

There are no built-in options to add safety tips to payloads, but you can use the following methods on the **Configure payload** page of the payload setup wizard::

- Use an existing email message that contains the safety tip as a template. Save the message as HTML and copy the information.
- Use the following sample code for the First contact safety tip:

  ```html
  <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" align="left" width="100%" style="width:100.0%;mso-cellspacing:0in;mso-yfti-tbllook:1184;
  mso-table-lspace:2.25pt;mso-table-rspace:2.25pt;mso-table-anchor-vertical:
  paragraph;mso-table-anchor-horizontal:column;mso-table-left:left;mso-padding-alt:
  0in 0in 0in 0in">
  <tbody><tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes">
    <td style="background:#A6A6A6;padding:5.25pt 1.5pt 5.25pt 1.5pt"></td>
    <td width="100%" style="width:100.0%;background:#EAEAEA;padding:5.25pt 3.75pt 5.25pt 11.25pt" cellpadding="7px 5px 7px 15px" color="#212121">
    <div>
    <p class="MsoNormal" style="mso-element:frame;mso-element-frame-hspace:2.25pt;
    mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
    column;mso-height-rule:exactly"><span style="font-size:9.0pt;font-family:
    wf_segoe-ui_normal;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:
    Aptos;color:#212121;mso-ligatures:none">You don't often get email from
    this sender <a rel="noopener" href="https://aka.ms/LearnAboutSenderIdentification" tabindex="-1" target="_blank">Learn why
    this is important</a></span></p>
    </div>
    </td>
    <td width="75" style="width:56.25pt;background:#EAEAEA;padding:5.25pt 3.75pt 5.25pt 3.75pt;
    align:left" cellpadding="7px 5px 7px 5px" color="#212121"></td>
   </tr>
  </tbody></table>
  <div>
  <p class="MsoNormal"><span lang="DA" style="font-size:12.0pt;font-family:&quot;Georgia&quot;,serif;
  color:black;mso-ansi-language:DA">Insert payload content here,</span></p>
  </div>
  ```

### Can I assign training modules without putting users through a simulation?

Yes. For more information, see [Training campaigns in Attack simulation training](attack-simulation-training-training-campaigns.md).

### How do I find out about simulation messages that weren't delivered?

The [Users tab](attack-simulation-training-simulations.md#users-tab) for the simulation is filterable by **Simulation message delivery: Failed to deliver**.

If you own the sender domain, the undelivered simulation report is returned in a non-delivery report (also known as an NDR or bounce message). For more information about the codes in the NDR, see [Email non-delivery reports and SMTP errors in Exchange Online](/exchange/troubleshoot/email-delivery/ndr/non-delivery-reports-in-exchange-online).

## Issues with Attack simulation training reporting

> [!TIP]
> Simulation data recording start a few minutes after the simulation is launched and after users begin interacting with the simulation messages. There's no fixed start time. Events are still captured after the simulation ends.

### Differences in user activity data from Attack simulation training reports and other reports

For reporting on user activity related to simulation messages, we recommend using the [built-in simulation reports](attack-simulation-training-insights.md). Reports from other sources (for example, [Advanced hunting](/defender-xdr/advanced-hunting-overview)) might not be accurate.

Simulation URLs aren't wrapped by Safe Links and are considered unwrapped links. Not all clicks on unwrapped links go through Safe Links, so user activity related to simulation messages might not be recorded in the [UrlClickEvents logs](/defender-xdr/advanced-hunting-urlclickevents-table).

### Attack simulation training reports don't contain any activity details

Attack simulation training comes with rich, actionable insights that keep you informed of the threat readiness progress of your employees. If Attack simulation training reports aren't populated with data, verify that audit logging is turned on in your organization (it's on by default).

Audit logging is required by Attack simulation training so events can be captured, recorded, and read back. Turning off audit logging has the following consequences for Attack simulation training:

- Reporting data isn't available across all reports. The reports appear empty.
- Training assignments are blocked, because data isn't available.

To verify that audit logging is on or to turn it on, see [Turn auditing on or off](/purview/audit-log-enable-disable).

> [!TIP]
> Empty activity details are also caused by no E5 licenses being assigned to users. Verify at least one E5 license is assigned to an active user to ensure that reporting events are captured and recorded.
>
> User actions and admin actions are audited. In the Management Activity API, look for the [AuditLogRecordType](/office/office-365-management-api/office-365-management-activity-api-schema) values 85, 88, and 218.
>
> Some auditing information might also be available in the [CloudAppEvents table](/defender-xdr/advanced-hunting-cloudappevents-table) in Microsoft Defender XDR Advanced hunting via the Defender portal or the [Streaming API](/defender-xdr/streaming-api).

### Reporting issues with on-premises mailboxes

Attack simulation training supports on-premises mailboxes, but with reduced reporting functionality:

- Data on whether users read, forwarded, or deleted the simulation email isn't available for on-premises mailboxes.
- The number of users who reported the simulation email isn't available for on-premises mailboxes.

> [!TIP]
> Other than the simulation messages being sent via the transport pipeline vs. direct injection in Microsoft 365, the training, automation, and content management experiences are the same for on-premises mailboxes.

### Simulation reports aren't updated immediately

Detailed simulation reports aren't updated immediately after you launch a campaign. Don't worry; this behavior is expected.

Every simulation campaign has a lifecycle. When first created, the simulation is in the **Scheduled** state. When the simulation starts, it transitions to the **In progress** state. When completed, the simulation transitions to the **Completed** state.

While a simulation is in the **Scheduled** state, the simulation reports are mostly empty. During this stage, the simulation engine is resolving the target user email addresses, expanding distribution groups, removing guest users from the list, etc.:

:::image type="content" source="media/attack-sim-training-faq-scheduled-state.png" alt-text="Simulation details showing the simulation in the Scheduled state" lightbox="media/attack-sim-training-faq-scheduled-state.png":::

Once the simulation enters the **In progress** stage, information starts trickling into the reporting:

:::image type="content" source="media/attack-sim-training-faq-in-progress-state.png" alt-text="Simulation details showing the simulation in the In progress state" lightbox="media/attack-sim-training-faq-in-progress-state.png":::

It can take up to 30 minutes for the individual simulation reports to update after the transition to the **In progress** state. The report data continues to build until the simulation reaches the **Completed** state. Reporting updates occur at the following intervals:

- Every 10 minutes for the first 60 minutes.
- Every 15 minutes after 60 minutes until two days.
- Every 30 minutes after two days until seven days.
- Every 60 minutes after seven days.

Widgets on the **Overview** page provide a quick snapshot of your organization's simulation-based security posture over time. Because these widgets reflect your overall security posture and journey over time, they're updated after each simulation campaign is completed.

> [!NOTE]
> You can use the **Export** option on the various reporting pages to extract data.

### Messages reported as phishing by users aren't appearing in simulation reports

Simulation reports in Attack simulator training provide details on user activity. For example:

- Users who clicked on the link in the message.
- Users who gave up their credentials.
- Users who reported the message as phishing.

If messages that users reported as phishing aren't captured in Attack simulation training simulation reports, there might be an Exchange mail flow rule (also known as a transport rule) that's blocking the delivery of the reported messages to Microsoft. Verify that any mail flow rules aren't blocking delivery to the following email addresses:

- `junk@office365.microsoft.com`
- `abuse@messaging.microsoft.com`
- `phish@office365.microsoft.com`
- `not_junk@office365.microsoft.com`

### Users are assigned training after they report a simulated message

If users are assigned training after they report a phishing simulation message, check to see if your organization uses a reporting mailbox to receive user reported messages at <https://security.microsoft.com/securitysettings/userSubmission>. The reporting mailbox needs to be configured to skip many security checks as described in the [reporting mailbox prerequisites](submissions-user-reported-messages-custom-mailbox.md#configuration-requirements-for-the-reporting-mailbox).

If you don't configure the required exclusions for the custom reporting mailbox, the messages might be detonated by Safe Links or Safe Attachments protection, which causes training assignments.

## Other frequently asked questions

### Q: What is the recommended method to target users for simulation campaigns?

A: Several options are available to target users:

- Include all users (currently available to organizations with less than 40,000 users).
- Choose specific users.
- Select users from a CSV file (one email address per line).
- Microsoft Entra group-based targeting. The following group types are supported:
  - Microsoft 365 Groups (static and dynamic)
  - Distribution groups (static only)
  - Mail-enabled security groups (static only)

We find that campaigns where the targeted users are identified by Microsoft Entra groups are easier to manage.

### Q: How many training modules are there?

Currently, there are 94 built-in trainings on the [Training modules](attack-simulation-training-training-modules.md) page.

### Q: How are languages used for experiences like training modules and notifications?

- **Training modules**: The browser locale settings are used. But once the training has been assigned to a user, the language selection persists, and future trainings are assigned in that language.
- **End user notifications**: The mailbox locale/language settings are used.
- **Simulation playloads**: The language selected by the admin during creation is used.
- **Landing pages**: The Microsoft 365 account language settings are used. User can also change languages from the drop down present in the landing page.

### Q: Are there any limits in targeting users while importing from a CSV or adding users?

A: The limit for importing recipients from a CSV file or adding individual recipients to a simulation is 40,000.

A recipient can be an individual user or a group. A group might contain hundreds or thousands of recipients. The upper limit on the number of users is 400,000, but we recommend a limit of 200,000 users for each simulation for best performance.

Managing a large CSV file or adding many individual recipients can be cumbersome. Using Microsoft Entra groups simplify the overall management of the simulation.

> [!TIP]
> Currently, shared mailboxes aren't supported in Attack simulation training. Simulations should target user mailboxes or groups containing user mailboxes.
>
> Groups are expanded and the list of users is generated at the time of saving the simulation, simulation automation, or training campaign.

### Q: Are the limits for the number of simulations that can be deployed during a specific time interval?

A. No, although you might experience slowness if you launch many parallel simulations. Message rates (including simulation message rates) are constrained by the [message rate limits of the service](/office365/servicedescriptions/exchange-online-service-description/exchange-online-limits#receiving-and-sending-limits).

### Q: Does Microsoft provide payloads in other languages?

A: Currently, there are 40+ localized payloads available in 29+ languages: English, Spanish, German, Japanese, French, Portuguese, Dutch, Italian, Swedish, Chinese (Simplified), Norwegian Bokmål, Polish, Russian, Finnish, Korean, Turkish, Hungarian, Hebrew, Thai, Arabic, Vietnamese, Slovak, Greek, Indonesian, Romanian, Slovenian, Croatian, Catalan, and Other. We've determined that direct or machine translation of existing payloads to other languages leads to inaccuracies and decreased relevance.

That being said, you can create your own payload in the language of your choice using the custom payload authoring experience. We also strongly recommend that you harvest existing payloads that were used to target users in a specific geography. In other words, let the attackers localize the content for you.

### Q: How many training videos are available?

A: Currently, there are more than 85 training modules available in the content library.

### Q: How can I switch to other languages for my admin portal and training experience?

A: In Microsoft 365 or Office 365, language configuration is specific and centralized for each user account. For instructions on how to change your language setting, see [Change your display language and time zone in Microsoft 365 for Business](https://support.microsoft.com/office/6f238bff-5252-441e-b32b-655d5d85d15b).

The configuration change might take up to 30 minutes to synchronize across all services.

### Q: Can I trigger a test simulation to understand what it looks like prior to launching a full-fledged campaign?

A: Yes you can! On the last **Review Simulation** page in the new simulation wizard, select **Send a test**. This option sends a sample phishing simulation message to the currently logged in user. After you validate the phishing message in your Inbox, you can submit the simulation.

:::image type="content" source="media/attack-sim-training-simulations-review-simulation.png" alt-text="The Send a test button on the Review simulation page" lightbox="media/attack-sim-training-simulations-review-simulation.png":::

> [!TIP]
> You can also use [Send a test](attack-simulation-training-payloads.md#send-a-test) from the **Payloads** page. But, if you ever use the selected payload in a simulation, the test message appears in the aggregate reports. You can export the results or use the [Microsoft Graph API](/graph/api/resources/report-m365defender-reports-overview) to filter the results.

### Q: Can I target users that belong to a different tenant as part of the same simulation campaign?

A: No. Currently, cross-tenant simulations aren't supported. Verify that all of your targeted users are in the same tenant. Any cross-tenant users or guest users are excluded from the simulation campaign.

### Q: How does region aware delivery work?

A: Region aware delivery uses the time zone attribute of the targeted user's mailbox to determine when to deliver the message. There might be a time difference of ± one hour in the email delivery based on the user's time zone. For example, consider the following scenario:

- At 7:00 AM in the Pacific time zone (UTC-8), an admin creates and schedules a campaign to start at 9:00 AM on the same day.
- UserA is in the Eastern time zone (UTC-5).
- UserB is also in the Pacific time zone.

At 9:00 AM on the same day, the simulation message is sent to UserB. With region-aware delivery, the message isn't sent to UserA on the same day, because 9:00 AM Pacific time is 12:00 PM Eastern time. Instead, the message is sent to UserA at 9:00 AM Eastern time on the following day.

So, on the initial run of a campaign with region aware delivery enabled, it might appear that the simulation message was sent only to users in a specific time zone. But, as time passes and more users come into scope, the targeted users increase.

If you don't use region aware delivery, the campaign starts based on the time zone of the user who's setting it up.

### Q: Does Microsoft collect or store any information that users enter at the Credential Harvest sign-in page, used in the Credential Harvest simulation technique?

A: No. Any information entered at the credential harvest sign-in page is discarded silently. Only the 'click' is recorded to capture the compromise event. Microsoft doesn't collect, log or store any details that users enter at this step.

### Q: How long is simulation information retained? Can I delete simulation data?

A: See the following table:

|Data type|Retention|
|---|---|
|Simulation metadata|18 months unless the [simulation is deleted sooner by an admin](attack-simulation-training-simulations.md#remove-simulations).|
|Simulation automation|18 months unless the [simulation automation is deleted sooner by an admin](attack-simulation-training-simulation-automations.md#remove-simulation-automations).|
|Payload automation|18 months unless the [payload automation is deleted sooner by an admin](attack-simulation-training-payload-automations.md#remove-payload-automations).|
|User activity in simulation metadata|18 months unless the [simulation is deleted sooner by an admin](attack-simulation-training-simulations.md#remove-simulations).|
|Global payloads|Persisted unless deleted by Microsoft.|
|Tenant payloads|18 months unless the [archived payload is deleted sooner by an admin](attack-simulation-training-payloads.md#remove-archived-payloads).|
|User activity in training metadata|18 months unless the [simulation is deleted sooner by an admin](attack-simulation-training-simulations.md#remove-simulations).|
|MDO recommended payloads|6 months.|
|Global end user notifications|Persisted unless deleted by Microsoft.|
|Tenant end user notifications|18 months unless the [notification is deleted sooner by an admin](attack-simulation-training-end-user-notifications.md#remove-end-user-notifications).|
|Global login pages|Persisted unless deleted by Microsoft.|
|Tenant login pages|18 months unless the [login page is deleted sooner by an admin](attack-simulation-training-login-pages.md#remove-login-pages).|
|Global landing pages|Persisted unless deleted by Microsoft|
|Tenant landing pages|18 months unless the [landing page is deleted sooner by an admin](attack-simulation-training-landing-pages.md#remove-landing-pages).|

If the entire tenant is deleted, attack simulation training data is deleted after 90 days.

For more information, see [Data retention information for Microsoft Defender for Office 365](mdo-data-retention.md).

### Q: Can I create, view, and manage simulations using an API?

A: Yes. Read and write scenarios are supported using the Microsoft Graph API:

- `AttackSimulation.Read.All`:
  - Read simulation metadata
  - Read user activity
  - Read training data
  - Read repeat offenders
- `AttackSimulation.ReadWrite.All`: Run simulations using the specified payloads, notifications, and login pages.

For more information, see [List simulations](/graph/api/attacksimulationroot-list-simulations) and [Reports API overview for attack simulation training as part of Microsoft Defender for Office 365](/graph/api/resources/report-m365defender-reports-overview).

### Q: Can I delete custom payloads?

A: Yes. First you archive the payload, then you delete the archived payload. For instructions, see [Archive payloads](attack-simulation-training-payloads.md#archive-payloads).

### Q: Can I modify the built-in payloads?

A: Not directly. You can copy the built-in payload and then modify the copy. For instructions, see [Copy payloads](attack-simulation-training-payloads.md#copy-payloads).

### Q: I'm trying to run a QR code simulation, but scanning the QR code shows me 'ping successful' instead of the landing page?

A: When you insert a QR code in the payload editor, it maps to the base phishing URL that you selected in the **Phishing link** section \> **Select URL**. The QR code is inserted in the email message as an image. If you switch from the **Text** tab to the **Code** tab, you see the inserted image in Base64 format. The beginning of the image contains `<div id="QRcode"...>`. Make sure to verify that the finished payload contains `<div id="QRcode"...>` before you use it in a simulation.

During simulation creation, if you scan the QR code or you use **Send a Test** to review the payload, the QR code points to the base phishing URL that you selected.

When the payload is used in a simulation, the service replaces the QR code with a dynamically generated QR code to track click and compromise metrics. The size, position, and shape of the QR code matches the configuration options you configured in the payload. Scanning the QR code during an actual simulation takes you to the configured landing page.

### Q: I'm trying to create a payload in HTML, but the payload editor seems to remove certain content from my design?

A: Currently, the following HTML tags aren't supported in the payload editor: `applet, base, basefont, command, embed, frame, frameset, iframe, keygen, link, meta, noframes, noscript, param, script, object, title`.
