---
title: Offensive Security Testing for Microsoft Defender for Identity
description: Learn about best practices for Offensive Security Testing for Microsoft Defender for Identity.
ms.date: 12/29/2025
ms.topic: article
#customerIntent: To learn about the best practices for Offensive Security Testing for Microsoft Defender for Identity.
ms.reviewer: martin77s
---

# Best Practices before Offensive Security Testing for Microsoft Defender for Identity

This article summarizes the best practices and things to review before you begin Offensive Security Testing for Microsoft Defender for Identity.

## Common issues that affect testing

Here are some common issues that can affect your offensive security testing:

### Infrastructure Coverage Issues:
- **Incomplete infrastructure coverage**: Ensure Microsoft Defender for Identity sensors are deployed on all domain controllers, AD FS, AD CS, and Microsoft Entra Connect servers
- **Missing Microsoft Defender for Endpoint**: Endpoint coverage adds detection capabilities for activities on identity infrastructure that may not be covered by identity-based detections alone

### Detection Accuracy Issues:
- **Insufficient learning period**: The learning period for alerts is used to tune alert detections. Without this learning period, detections will not be as accurate
- **Using accounts with established admin patterns**: Avoid using users or computers that regularly run administrative tasks, as these have been learned as normal behavior. Instead use:
  - **Existing computer**: Do not use a new computer or a computer that regularly runs admin or attack simulation activities
  - **Existing standard user**: Do not use a new user or a user that regularly runs admin or attack simulation activities

### Configuration Issues:
- **Network configuration mismatch**: Sensors running on VMware may experience Microsoft Defender for Identity health issues
- **Unhealthy Network Name Resolution (NNR)**: This can lead to issues with certain detections
- **Incomplete attack simulation**: Test with actual attack scenarios rather than single TTPs. Defender for Identity detections focus on complete attack stories. Performing only one segment of a kill chain without other steps yields incomplete results and decreased detection outcomes
- **Incompatible penetration testing tools**: Some tools may return false results; cross-check relevant audit logs to confirm successful attacks

## Best practices checklist 

|Recommendation |Description  |Links to Related Documentation  |
|---------|---------|---------|
|Check that Defender for Identity is deployed on all domain controllers  |Deployment on all domain controllers ensures that you are getting all of the signals for threat detection. Not having full coverage can lead to missed detections or false positives.   |[Microsoft Defender for Identity deployment overview](deploy/deploy-defender-identity.md).   |
|Check that Defender for Identity is deployed on all AD FS, AD CS, and Microsoft Entra Connect servers     |Deployment on all domain controllers ensures that you are getting all of the signals for threat detection. Not having full coverage can lead to missed detections or false positives.| [Configure sensors for AD FS, AD CS, and Microsoft Entra Connect](deploy/active-directory-federation-services.md)  |
|Check the health of your Defender for Identity sensors     |It is critical that your sensor is healthy and reporting as expected to ensure optimal performance.  Having an unhealthy sensor can lead to missed detections. Review all health alerts before running any tests.  |[Microsoft Defender for Identity health issues](health-alerts.md) |
|Consider integrating with Microsoft XDR|Defender for Identity proveds alerting on identity based threats. Integrating with Microsoft Defender XDR allows you to correlate these alerts with other signals for a more comprehensive view of threats and potential solutions.<br></br>Microsoft Defender XDR is a unified pre- and post-breach enterprise defense suite that natively coordinates detection, prevention, investigation, and response across endpoints, identities, email, and applications to provide integrated protection against sophisticated attacks.   |[https://learn.microsoft.com/defender-xdr/microsoft-365-defender](https://learn.microsoft.com/defender-xdr/microsoft-365-defender)  |
|Check windows event collection configuration|Optimal event collection is essential for Defender for Identity to analyze and detect threats effectively. Check your configuration before running any tests. |- [Configure windows event collection for domain controllers](deploy/configure-windows-event-collection.md#configure-windows-event-auditing-for-domain-controllers)</br> - [Configure windows event collection for AD CS](deploy/configure-windows-event-collection.md#configure-auditing-on-ad-cs)</br> - [Configure windows event collection for AD FS](deploy/configure-windows-event-collection.md#configure-auditing-on-ad-fs)</br> - [Configure windows event collection for Entra connect](deploy/configure-windows-event-collection.md#configure-auditing-on-microsoft-entra-connect)</br> - [Use Powershell to check your configuration](https://www.powershellgallery.com/packages/DefenderForIdentity/1.0.0.4)|
|Check that NNR is configured correctly|NNR is a critical component of Defender for Identity. Defender for Identity uses NNR to correlate between raw activities containing IP addresses, and the computers involved in each activity. Defender for Identity profiles entities, including computers, and generates security alerts for suspicious activities. It is important for NNR to be configured correctly for a successful deployment and to help detect advanced threats.|[Configure Network Name Resolution (NNR) for Microsoft Defender for Identity](deploy/configure-nnr.md)|
|Check that you have a Directory Service account (DSA) |While a DSA is optional in some scenarios, we recommend that you configure a DSA for Defender for Identity for full security coverage. When you have a DSA configured: <br> - the DSA is used to connect to the domain controller at startup.<br> - the DSA can be used to query the domain controller for data on entities seen in network traffic, monitored events, and monitored ETW activities.<br><br>A DSA is required for the following features and functionality:<br> - When working with a sensor installed on an AD FS / AD CS server<br> - To access the DeletedObjects container to collect information about deleted users and computers<br> - For domain and trust mapping, which occurs at sensor startup, and again every 10 minutes<br> - To query another domain via LDAP for details, when detecting activities from entities in those other domains. | |
|Check the alert learning periods|Alerts rely on learning periods to build a profile of patterns and then distinguish between legitimate and suspicious activities. Each alert incorporates specific conditions within the detection logic such as thresholds and filtering of popular activities. Check [these alerts](#security-alert-learning-periods) to make sure that they have met the required learning periods. |[Alerts overview](alerts-overview.md)|
|Check the alert thresholds|The threshold level of an alert influences the number of alerts you receive for that trigger. The default  threshold for all alerts is **High**. You can customize the threshold level for individual alerts to **High**, **Medium**, or **Low**. ALowering the threshold of an alerts increases the number of alerts generated by Microsoft Defender for Identity. Alerts that are triggered when threshold is set to med or low, contain text that indicates the alert threshold.  |[Adjust alert threshold settings or enable recommended test mode](advanced-settings#define-alert-learning-period-settings)|
|Review the Secure Score recommendations for Defender for Identity|Following Secure Score recommendations can help improve your security posture and enhance the effectiveness of Defender for Identity in detecting threats.|[Microsoft Secure Score](https://learn.microsoft.com/security/compass/microsoft-secure-score)

### Security alert learning periods

| Alert | Learning Period |
|-------|-----------------|
| [Network-mapping reconnaissance (DNS) (external ID 2007)](alerts-mdi-classic.md#network-mapping-reconnaissance-dns) | Eight days from the start of domain controller monitoring |
| [User and Group membership reconnaissance (SAMR) (external ID 2021)](alerts-mdi-classic.md#user-and-group-membership-reconnaissance-samr) | Four weeks per domain controller starting from the first network activity of SAMR against the specific DC |
| [Suspected Golden Ticket usage (encryption downgrade) (external ID 2009)](alerts-mdi-classic.md#suspected-golden-ticket-usage-encryption-downgrade) | This alert has a learning period of 5 days from the start of domain controller monitoring |
| [Suspicious additions to sensitive groups (external ID 2024)](alerts-mdi-classic.md#suspicious-additions-to-sensitive-groups) | Four weeks per domain controller, starting from the first event |
| [Suspected Brute Force attack (Kerberos, NTLM) (external ID 2023)](alerts-mdi-classic.md#suspected-brute-force-attack-kerberos-ntlm) | 1 week |
| [Security principal reconnaissance (LDAP) (external ID 2038)](alerts-mdi-classic.md#security-principal-reconnaissance-ldap) | 15 days per computer, starting from the day of the first event, observed from the machine |
| [Suspected over-pass-the-hash attack (forced encryption type) (external ID 2008)](alerts-mdi-classic.md#suspected-over-pass-the-hash-attack-forced-encryption-type) | 1 month |
| [Suspicious VPN connection (external ID 2025)](alerts-mdi-classic.md#suspicious-vpn-connection) | 30 days from the first VPN connection, and at least 5 VPN connections in the last 30 days, per user |
| [Possible Okta session theft](alerts-xdr.md#possible-okta-session-theft) | 2 weeks |

### Alert thresholds


## Related content

- The Microsoft Defender XDR [Security operations overview](/security/operations/overview).
