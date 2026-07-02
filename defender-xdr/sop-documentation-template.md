---
title: Create a compromised identity incident response SOP template
description: Use this template to create and customize a standard operating procedure for compromised identity incident responses in Microsoft Defender XDR.
ms.service: defender-xdr
ms.topic: how-to
ms.custom: msecd-doc-authoring-1012
author: mberdugo
ms.author: monaberdugo
ms.reviewer: Yuval Derman
ms.date: 06/03/2026
ms.collection:
  - m365-security
  - tier1
appliesto:
  - Microsoft Defender XDR
ai-usage: ai-assisted
#customer intent: As a security operations author, I want a reusable SOP template for compromised identity incidents so that I can customize guided responses for my organization.
---

# Create a compromised identity incident response SOP template

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Use this article to create a reusable standard operating procedure (SOP) for compromised identity incidents. Replace each placeholder with organization-specific values before you publish or upload the SOP.

> [!NOTE]
> This template is a generic example intended as a starting point. Don't use it as-is. Customize every section, including triggers, decision points, queries, escalation paths, and remediation steps, to match your organization's environment, tooling, roles, and policies before you publish or upload it as an SOP.

## Prerequisites

- Confirm who owns the SOP and who can approve changes for your organization.
- Verify that your analysts can access the `SigninLogs` data and any other sources that your SOP references.
- If you plan to upload the SOP as a guidebook, review the supported file types, size limits, and permission requirements in [Customize incident responses for your organization](security-upload-guide.md).
- Keep the guidebook text-focused. Avoid screenshots, graphs, and complex formatting that might reduce text extraction quality.

## SOP metadata

Use this section to identify the SOP owner, scope, and data sources.

- **Name:** `<Compromised identity incident response SOP>`
- **Version:** `<v1.0>`
- **Owner:** `<Security operations team>`
- **Applies to:** `<location>`
- **Primary data sources:** `SigninLogs`, `<Defender XDR incident data>`, `<Identity provider logs>`, `<Email telemetry>`, and `<Endpoint telemetry>`

## Purpose

Use this SOP to triage, contain, investigate, remediate, and prevent incidents that indicate a compromised identity. Customize the scope, decision points, and escalation paths so that analysts can respond consistently during incidents that affect `<User>`, `<Group>`, or `<Business unit>`.

## Triggers (when to invoke this SOP)

Invoke this SOP when an incident, alert, or user report suggests that an identity might be compromised.

- Alert examples include `Impossible travel`, `Unfamiliar sign-in properties`, `Password spray`, `MFA fatigue`, and `Suspicious inbox forwarding rules`.
- Use this SOP when `<User>` reports unexpected MFA prompts, suspicious sign-in notifications, or account changes they didn't make.
- Use this SOP when analysts observe successful sign-ins from unusual locations, risky IP addresses, or unfamiliar applications.

## Triage phase

Start with quick checks that confirm whether the sign-in activity is expected or suspicious.

### Validate sign-in activity

Review recent sign-in events for the affected identity. Replace the user filter before you run the query.

```kusto
SigninLogs
| where UserPrincipalName =~ "<user@company.com>"
| where TimeGenerated > ago(48h)
| project TimeGenerated, IPAddress, Location, AppDisplayName, AuthenticationRequirement, ConditionalAccessStatus, ClientAppUsed
```

1. Compare the sign-in times, IP addresses, locations, and applications with the incident timeline.
1. Highlight any successful sign-ins that the user or manager can't explain.
1. Record the first suspicious event, the latest suspicious event, and the accounts or apps involved.

### Review credential compromise indicators

Use a summary view to determine whether the account shows a pattern of repeated failures followed by successful access.

```kusto
SigninLogs
| where UserPrincipalName =~ "<user@company.com>"
| where TimeGenerated >= ago(7d)
| summarize
    Failures = countif(ResultType != 0),
    Successes = countif(ResultType == 0)
    by IPAddress, bin(TimeGenerated, 1h)
```

1. Look for bursts of failed sign-ins, followed by one or more successful sign-ins.
1. Note whether the same IP address, location, or application appears across multiple time buckets.
1. Record whether the pattern aligns with password spray, credential stuffing, token theft, or another suspected technique.

### Validate with the user

1. Contact `<User>` through an approved channel.
1. Ask whether they recognize the sign-ins, locations, devices, applications, and MFA prompts.
1. Ask whether they recently approved an MFA request, entered credentials into a prompt, shared a device, or traveled.
1. Capture the user's response in the incident record.

## Containment phase

Contain the risk before you complete the full investigation, but apply organization-specific approval logic first.

### Validate the identity

1. Check whether the identity is a service principal or other non-human identity (NHI). If it is, pause direct account-disable actions and notify `<Service owner>` before you rotate secrets, revoke access, or disable the identity.
1. Check whether the identity is a break-glass account. If it is, notify `<Identity team lead>` and `<Incident commander>` before you take action, and never disable the account without explicit authorization.
1. Check whether the affected user is senior leadership, an executive assistant, or another high-sensitivity profile. If they are, notify `<Incident commander>` and `<Communications lead>` before you contact the user or take disruptive action.

### Contain the identity

1. Revoke active sessions and refresh tokens for `<user@company.com>`.
1. Force a password reset or secret rotation, based on the identity type.
1. Disable the account temporarily if risk remains active and business approval allows it.
1. Block known malicious IP addresses, devices, applications, or tokens when your tooling supports those actions.
1. Preserve evidence, including incident IDs, alerts, sign-in screenshots or exports, and user statements.

## Investigation phase

Use this phase to identify the likely entry point, validate control gaps, and define the blast radius.

### Perform root cause analysis

Use successful sign-ins to identify where the attacker gained access and which application path they used.

```kusto
SigninLogs
| where UserPrincipalName =~ "<user@company.com>"
| where ResultType == 0
| order by TimeGenerated asc
| take 10
```

1. Identify the first confirmed successful sign-in that appears malicious.
1. Compare that sign-in with the alert time, user testimony, and any phishing or password spray indicators.
1. Document the suspected root cause, such as phishing, password reuse, adversary-in-the-middle activity, token theft, or MFA fatigue.

### Evaluate MFA

1. Determine whether MFA was enabled for `<user@company.com>` at the time of the incident.
1. Check whether the attacker satisfied MFA, bypassed MFA, or enrolled a new authentication method.
1. Identify gaps in Conditional Access, authentication strengths, token protection, or registration controls.
1. Record whether you need to reset MFA methods or review recent MFA changes.

### Analyze blast radius and impact

1. Review incident evidence for access to email, files, collaboration tools, cloud resources, or privileged roles.
1. Check for suspicious inbox rules, forwarding rules, consent grants, mailbox access, lateral movement, or privilege escalation.
1. Identify related accounts, devices, applications, and workloads that the compromised identity accessed.
1. Estimate business impact, data exposure, and regulatory or legal reporting requirements.

## Remediation phase

Complete the actions that remove attacker persistence and return the identity to a trusted state.

1. Reset the password, rotate secrets, and require fresh sign-in for all active sessions.
1. Remove malicious inbox rules, forwarding rules, OAuth app consent, or unauthorized authentication methods.
1. Restore approved MFA settings and re-register authentication methods if required.
1. Scan or reimage affected devices if endpoint compromise is suspected.
1. Review role assignments, group memberships, and application permissions, and remove unauthorized access.
1. Update the incident record with completed actions, owners, timestamps, and evidence.

## Prevention phase

Use lessons from the incident to reduce the likelihood of recurrence.

1. Enforce phishing-resistant MFA, stronger Conditional Access policies, and sign-in risk controls where available.
1. Disable legacy authentication and remove unused service accounts, applications, or credentials.
1. Improve detections for unusual sign-ins, MFA abuse, token abuse, impossible travel, and consent activity.
1. Deliver targeted user awareness guidance to `<User>`, `<Team>`, or `<Business unit>` if phishing or password reuse contributed to the incident.
1. Review this SOP after the incident, and update the placeholders, escalation paths, and thresholds for your organization.

## Related content

- [Customize incident responses for your organization](security-upload-guide.md)
- [Triage and investigate incidents with guided responses from Microsoft Copilot in Microsoft Defender](security-copilot-m365d-guided-response.md)
- [Alert classification playbooks](alert-classification-playbooks.md)
