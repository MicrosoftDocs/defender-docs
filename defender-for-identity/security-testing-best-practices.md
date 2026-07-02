---
title: Offensive Security Testing for Microsoft Defender for Identity
description: Learn about best practices for Offensive Security Testing for Microsoft Defender for Identity.
ms.date: 01/26/2026
ms.topic: article
#customerIntent: To learn about the best practices for Offensive Security Testing for Microsoft Defender for Identity.
ms.reviewer: martin77s
---

# Best Practices before Offensive Security Testing for Microsoft Defender for Identity

This article summarizes the best practices and items to review before you begin Offensive Security Testing for Microsoft Defender for Identity.

## Common issues that affect testing

Here are some common issues that can affect your offensive security testing:

### Infrastructure protection issues

- **Incomplete infrastructure protection**: Deploy Microsoft Defender for Identity sensors on all domain controllers.
- **Missing Microsoft Defender for Endpoint**: Endpoint protection adds detection capabilities for activities on identity infrastructure that may not be covered by identity-based detections alone.

### Detection accuracy issues

- **Insufficient learning period**: The learning period for alerts is used to tune alert detections. Without this learning period, detections won't be as accurate.
- **Using accounts with established admin patterns**: Avoid using users or computers that regularly run administrative tasks, as the system learns these as normal behavior. Instead, use:
  - **Existing computer**: Use a computer that doesn't regularly run admin or attack simulation activities.
  - **Existing standard user**: Use a user that doesn't regularly run admin or attack simulation activities.

### Configuration issues

- **Network configuration mismatch**: Sensors running on VMware might experience Microsoft Defender for Identity health issues. See [VMware virtual machine sensor issue](troubleshooting-known-issues.md#vmware-virtual-machine-sensor-issue).
- **Unhealthy Network Name Resolution (NNR)**: This issue can lead to problems with certain detections.
- **Incomplete attack simulation**: Test with actual attack scenarios rather than single TTPs. Defender for Identity detections focus on complete attack stories. Performing only one segment of a kill chain without other steps yields incomplete results and decreased detection outcomes.
- **Incompatible penetration testing tools**: Some tools might return false results. Cross-check relevant audit logs to confirm successful attacks.

## Best practices checklist

|Recommendation |Description  |Links to Documentation for related tasks  |
|---------|---------|---------|
|Check that Defender for Identity is deployed on all domain controllers  |Deployment on all domain controllers ensures that you're getting all of the signals for threat detection. Not having full protection can lead to missed detections or false positives.   |[Microsoft Defender for Identity deployment overview](deploy/deploy-defender-identity.md)   |
|Check that Defender for Identity is deployed on all AD FS, AD CS, and Microsoft Entra Connect servers     |Deployment on all these servers ensures that you're getting all of the signals for threat detection. Not having full protection can lead to missed detections or false positives.| [Configure sensors for AD FS, AD CS, and Microsoft Entra Connect](deploy/active-directory-federation-services.md)  |
|Check the health of your Defender for Identity sensors     |It's critical that your sensor is healthy and reporting as expected to ensure optimal performance. Having an unhealthy sensor can lead to missed detections. Review all health alerts before running any tests.  |[Microsoft Defender for Identity health issues](health-alerts.md) |
|Consider integrating with Microsoft XDR|Defender for Identity provides alerting on identity-based threats. Integrating with Microsoft Defender XDR lets you correlate these alerts with other signals for a more comprehensive view of threats and potential solutions.<br></br>Microsoft Defender XDR is a unified pre-breach and post-breach enterprise defense suite that natively coordinates detection, prevention, investigation, and response across endpoints, identities, email, and applications to provide integrated protection against sophisticated attacks.|[Microsoft Defender](/defender-xdr/microsoft-365-defender-train-security-staff).|
|Check Windows event collection configuration|Optimal event collection is essential for Defender for Identity to analyze and detect threats effectively. Check your configuration before running any tests. |- [Configure Windows event collection for domain controllers](deploy/configure-windows-event-collection.md)</br> - [Configure Windows event collection for AD CS](deploy/configure-windows-event-collection.md#configure-auditing-on-an-ad-cs-server)</br> - [Configure Windows event collection for AD FS](deploy/configure-windows-event-collection.md#configure-auditing-on-an-ad-fs-server)</br> - [Configure Windows event collection for Microsoft Entra Connect](deploy/configure-windows-event-collection.md#configure-auditing-on-microsoft-entra-connect)</br> - [Use PowerShell to check your configuration](https://www.powershellgallery.com/packages/DefenderForIdentity/1.0.0.4)|
|Check that NNR is configured correctly|NNR is a critical component of Defender for Identity. Defender for Identity uses NNR to correlate between raw activities containing IP addresses and the computers involved in each activity. Defender for Identity profiles entities, including computers, and generates security alerts for suspicious activities. It's important for NNR to be configured correctly for a successful deployment and to help detect advanced threats.|[Configure Network Name Resolution (NNR) for Microsoft Defender for Identity](nnr-policy.md)|
|Check that you have a Directory Service account (DSA) |While a DSA is optional in some scenarios, we recommend that you configure a DSA for Defender for Identity for full security protection. When you have a DSA configured: <br> - The DSA connects to the domain controller at startup.<br> - The DSA queries the domain controller for data on entities seen in network traffic, monitored events, and monitored Event Tracing for Windows (ETW) activities.<br><br>A DSA is required for the following features and functionality:<br> - When working with a sensor installed on an AD FS / AD CS server<br> - To access the DeletedObjects container to collect information about deleted users and computers<br> - For domain and trust mapping, which occurs at sensor startup, and again every 10 minutes.<br> - To query another domain via LDAP for details, when detecting activities from entities in those other domains. |[Directory Service Accounts for Microsoft Defender for Identity](deploy/directory-service-accounts.md)|
|Check the alert learning periods|Alerts rely on learning periods to build a profile of patterns and then distinguish between legitimate and suspicious activities. Each alert incorporates specific conditions within the detection logic, such as thresholds and filtering of popular activities. Check [these alerts](#security-alert-learning-periods) to make sure that they meet the required learning periods. |[Alerts overview](alerts-overview.md)|
|Check the alert thresholds|The threshold level of an alert influences the number of alerts you receive for that trigger. The default threshold for all alerts is **High**. You can customize the threshold level for individual alerts to **High**, **Medium**, or **Low**. Lowering the threshold of an alert increases the number of alerts generated by Microsoft Defender for Identity. Alerts that are triggered when threshold is set to **Medium** or **Low** contain text that indicates the alert threshold.<br>When you enable the **Recommended Test Mode** button, all alert threshold levels are set to **Low**. When the threshold is low, you get more alerts, including some related to legitimate traffic and activities. This setting can be useful to get more data into a nonproduction environment that doesn't have enough entity historical data or profiles.<br>Lowering the threshold to **Low** also leads to more false positives and isn't recommended for production environments. |[Adjust alert threshold settings or enable recommended test mode](advanced-settings.md#adjust-alert-thresholds)|
|Review the Secure Score recommendations for Defender for Identity|Following Secure Score recommendations helps improve your security posture and enhances the effectiveness of Defender for Identity in detecting threats.|[Microsoft Secure Score](https://security.microsoft.com/securescore?viewid=actions)|

### Security alert learning periods

Make sure that the learning periods for the alerts listed below have been met before you begin your offensive security testing.

| Alert | Learning Period |
|-------|-----------------|
| [Network-mapping reconnaissance (DNS) (External ID 2007)](alerts-mdi-classic.md#network-mapping-reconnaissance-dns) | Eight days from the start of domain controller monitoring |
| [User and Group membership reconnaissance (SAMR) (External ID 2021)](alerts-mdi-classic.md#user-and-group-membership-reconnaissance-samr) | Four weeks per domain controller starting from the first network activity of SAMR against the specific DC |
| [Suspected Golden Ticket usage (encryption downgrade) (External ID 2009)](alerts-mdi-classic.md#suspected-golden-ticket-usage-encryption-downgrade) | Five days from the start of domain controller monitoring |
| [Suspicious additions to sensitive groups (External ID 2024)](alerts-mdi-classic.md#suspicious-additions-to-sensitive-groups) | Four weeks per domain controller, starting from the first event |
| [Suspected Brute Force attack (Kerberos, NTLM) (External ID 2023)](alerts-mdi-classic.md#suspected-brute-force-attack-kerberos-ntlm) | One week |
| [Security principal reconnaissance (LDAP) (External ID 2038)](alerts-mdi-classic.md#security-principal-reconnaissance-ldap) | 15 days per computer, starting from the day of the first event, observed from the machine |
| [Suspected over-pass-the-hash attack (forced encryption type) (External ID 2008)](alerts-mdi-classic.md#suspected-over-pass-the-hash-attack-forced-encryption-type) | One month |
| [Suspicious VPN connection (External ID 2025)](alerts-mdi-classic.md#suspicious-vpn-connection) | 30 days from the first VPN connection, and at least 5 VPN connections in the last 30 days, per user |

## Related content

- The Microsoft Defender XDR [Security operations overview](/security/operations/overview).
