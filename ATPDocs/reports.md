---
title: Manage reports | Microsoft Defender for Identity
description: Learn how to download and schedule Microsoft Defender for Identity reports from Microsoft Defender XDR.
ms.date: 12/20/2023
ms.topic: how-to
#CustomerIntent: As a Defender for Identity admin, I want to understand how to generate and schedule reports for activity detected in my environment.
---

# Download and schedule Defender for Identity reports in Microsoft Defender XDR (Preview)

Microsoft Defender XDR provides Defender for Identity reports, which you can either generate on demand or configure to be sent periodically by email.

## Access Defender for Identity reports in Microsoft Defender XDR

To access Defender for Identity reports in Microsoft Defender XDR, from the navigation menu on the left, select **Reports** > **Identities** > **Report management**.

Available reports include:

|Report name  |Description  |
|---------|---------|
|**Summary**| Presents a dashboard of your system status, including: <br><br>- **Summary**: A summary of detected network activity <br>- **Open health issues**: Lists Defender for Identity health issues you should take care of. <br><br> Suspicious activities and health issues are listed by type. |
|**Modification to sensitive groups**     |    Lists every time a modification is made to sensitive groups, such as admins, or manually tagged accounts or groups. <br><br>If you're using Defender for Identity standalone sensors, make sure that [events are forwarded from your domain controllers to the standalone sensors](deploy/configure-event-forwarding.md) in order to receive a full report about your sensitive groups.     |
|**Passwords exposed in cleartext**     | Lists all source computer and account passwords detected by Defender for Identity being sent in clear text. <br><br>**Note**: Some services use the LDAP non-secure protocol to send account credentials in plain text. This can even happen for sensitive accounts. Attackers monitoring network traffic can catch and then reuse these credentials for malicious purposes.     |
| **Lateral movement paths to sensitive accounts** | Lists the sensitive accounts that are exposed via lateral movement paths, for the selected report period. <br><br>For more information, see [Lateral movement paths](understand-lateral-movement-paths.md). |

## Generate a report on demand

To generate a report on demand:

1. In Microsoft Defender XDR, select **Reports** > **Identities** > **Report management**.

1. On the **Identities reports** page, select a report and then select **Download**.

1. In the download report pane that appears on the right, define a time period for your report and then select **Download Report**.

Your report is downloaded by your browser, where you can open or save it. Downloaded reports include a maximum of 100,000 rows.


## Schedule a report by email

To define a schedule for a report to be sent to you by email:

1. In Microsoft Defender XDR, select **Reports** > **Identities** > **Report management**.

1. On the **Identities reports** page, select a report and then select **Schedule report**.

1. Use the wizard to define the following details:

    1. On the **Set schedule** page, define the conditions in which you want to send the report, and the time you want it sent.

        Your report is sent according to your Microsoft Defender XDR time zone settings (*Local* or UTC). For more information, see [Set the time zone for Microsoft Defender XDR](/microsoft-365/security/defender/m365d-time-zone).

    1. On the **Recipients** page, enter and add email addresses for anyone you want to receive the report. Select **Next** to complete the scheduling.

    1. The **Finish** page shows a confirmation message. Select **Close** to close the wizard.
    
Once the scheduling is configured, repeat this procedure to edit the scheduled time or recipients.

### Remove all scheduled reports

To remove a scheduled report and stop it from being sent:


1. In Microsoft Defender XDR, select **Reports** > **Identities** > **Reports management**.

1. On the **Identities reports** page, select the report you want to stop sending and then select **Reset schedule**.

1. In the confirmation message, select **Reset** to complete the process.


## Related content

- [Investigate assets](investigate-assets.md)
- [Understand and investigate Lateral Movement Paths (LMPs) with Microsoft Defender for Identity](understand-lateral-movement-paths.md)
- [Microsoft Defender for Identity's security posture assessments](security-assessment.md)
