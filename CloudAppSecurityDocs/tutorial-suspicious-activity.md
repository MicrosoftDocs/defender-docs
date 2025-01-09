---
title: Detect suspicious user activity with UEBA 
description: This tutorial describes the process for tuning user activity detections in Microsoft Defender for Cloud Apps.
ms.date: 02/22/2023
ms.topic: tutorial
---

# Tutorial: Detect suspicious user activity with behavioral analytics (UEBA)



Microsoft Defender for Cloud Apps provides best-of-class detections across the attack kill chain for compromised users, insider threats, exfiltration, ransomware, and more. Our comprehensive solution is achieved by combining multiple detection methods, including anomaly, behavioral analytics (UEBA), and rule-based activity detections, to provide a broad view of how your users use apps in your environment.

So why is it important to detect suspicious behavior? The impact of a user able to alter your cloud environment can be significant and directly impact your ability to run your business. For instance, key corporate resources like the servers running your public website or service you're providing to customers can be compromised.

Using data captured from several sources, Defender for Cloud Apps analyzes the data to extract app and user activities in your organization giving your security analysts visibility into cloud use. The collected data is correlated, standardized, and enriched with threat intelligence, location, and many other details to provide an accurate, consistent view of suspicious activities.

Hence, to fully realize the benefits of these detections, first make sure you configure the following sources:

- **[Activity log](activity-filters.md)**  
Activities from your [API connected apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).
- **[Discovery log](tutorial-shadow-it.md)**  
Activities extracted from firewall and proxy traffic logs that are forwarded to Defender for Cloud Apps. The logs are analyzed against the [cloud app catalog](risk-score.md), ranked, and scored based on more than 90 risk factors.
- **[Proxy log](proxy-intro-aad.md)**  
Activities from your [conditional access app control apps](tutorial-proxy.md#phase-1-monitor-user-activities-for-anomalies).

Next, you'll want to tune your policies. The following policies can be fine-tuned by setting filters, dynamic thresholds (UEBA) to help train their detection models, and suppressions to reduce common false positive detections:

- Anomaly detection
- Cloud discovery anomaly detection
- Rule-based activity detection

In this tutorial, you'll learn how to tune user activity detections to identify true compromises and reduce alert fatigue resulting from handling large volumes of false positive detections:

> [!div class="checklist"]
>
> - [Configure IP address ranges](#phase-1-configure-ip-address-ranges)
> - [Tune anomaly detection policies](#phase-2-tune-anomaly-detection-policies)
> - [Tune cloud discovery anomaly detection policies](#phase-3-tune-cloud-discovery-anomaly-detection-policies)
> - [Tune rule-based detection policies](#phase-4-tune-rule-based-detection-activity-policies)
> - [Configure alerts](#phase-5-configure-alerts)
> - [Investigate and remediate](#phase-6-investigate-and-remediate)

## Phase 1: Configure IP address ranges

Before configuring individual policies, it advisable to configure IP ranges so that they are available to use in fine-tuning any type of suspicious user activity detection policies.

Because IP address information is crucial for almost all investigations, [configuring known IP addresses](ip-tags.md) helps our machine learning algorithms identify known locations and consider them as part of the machine learning models. For example, adding the IP address range of your VPN will help the model to correctly classify this IP range and automatically exclude it from impossible travel detections because the VPN location doesn't represent the true location of that user.

Note:  Configured IP ranges are not limited to detections and are used throughout Defender for Cloud Apps in areas such as activities in the activity log, Conditional Access, etc. Keep this in mind when configuring the ranges. So, for example, identifying your physical office IP addresses allows you to customize the way logs and alerts are displayed and investigated.

### Review out-of-the-box anomaly detection alerts

Defender for Cloud Apps includes a set of anomaly detection alerts to identify different security scenarios. These detections are automatically enabled out of the box and will start to profile user activity and generate alerts as soon as the relevant [app connectors](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md) are connected.

Start by familiarizing yourself with the [different detection policies](control-cloud-apps-with-policies.md), prioritize the top scenarios that you think are most relevant for your organization, and tune the policies accordingly.

## Phase 2: Tune anomaly detection policies

Several built-in anomaly detection policies are available in Defender for Cloud Apps that are preconfigured for common security use cases. You should take some time to familiarize yourself with the more popular detections, such as:

- **Impossible travel**  
Activities from the same user in different locations within a period that is shorter than the expected travel time between the two locations.
- **Activity from infrequent country**  
   Activity from a location that was not recently or never visited by the user.
- **Malware detection**  
Scans files in your cloud apps and runs suspicious files through Microsoft's threat intelligence engine to determine whether they are associated with known malware.
- **Ransomware activity**  
File uploads to the cloud that might be infected with ransomware.
- **Activity from suspicious IP addresses**  
Activity from an IP address that has been identified as risky by Microsoft Threat Intelligence.
- **Suspicious inbox forwarding**  
Detects suspicious inbox forwarding rules set on a user's inbox.
- **Unusual multiple file download activities**  
Detects multiple file download activities in a single session with respect to the baseline learned, which could indicate an attempted breach.
- **Unusual administrative activities**  
Detects multiple administrative activities in a single session with respect to the baseline learned, which could indicate an attempted breach.

For a full list of detections and what they do, see [Anomaly detection policies](anomaly-detection-policy.md#anomaly-detection-policies).

> [!NOTE]
> While some of the anomaly detections are primarily focused on detecting problematic security scenarios, others can assist in identifying and investigating anomalous user behavior that may not necessarily indicate a compromise. For such detections we created another data type called "behaviors" which is available in the Microsoft Defender XDR advanced hunting experience. For more information see [Behaviors](behaviors.md).

Once you are familiar with the policies, you should consider how you want to fine-tune them for your organization's specific requirements to better target activities that you may want to investigate further.

1. **Scope policies to specific users or groups**

    Scoping policies to specific users can help reduce noise from alerts that are not relevant to your organization. Each policy can be [configured to include or exclude specific users and groups](anomaly-detection-policy.md#scope-anomaly-detection-policies), such as in the following examples:

    - **Attack simulations**  
    Many organizations use a user or a group to constantly simulate attacks. Obviously, it doesn't make sense to constantly receive alerts from these users' activities. Therefore, you can configure your policies to exclude these users or groups. This also helps the machine learning models identify these users and fine-tune their dynamic thresholds accordingly.
    - **Targeted detections**  
    Your organization may be interested in investigating a specific group of VIP users such as members of an administrator or CXO group. In this scenario, you can create a policy for the activities you want to detect and choose to only include the set of users or groups you are interested.

1. **Tune anomalous sign-in detections**

    Some organizations want to see alerts resulting from [failed sign-in activities](anomaly-detection-policy.md#multiple-failed-login-attempts) as they may indicate that someone is attempting to target one or more user accounts. On the other hand, brute force attacks on user accounts occur all the time in the cloud and organizations have no way to prevent them. Therefore, larger organizations usually decide to only receive alerts for suspicious sign-in activities that result in successful sign-in activities, as they may represent true compromises.

    Identity theft is a key source of compromise and poses a major threat vector for your organization. Our [impossible travel](anomaly-detection-policy.md#impossible-travel), [activity from suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses), and  [infrequent country/region](anomaly-detection-policy.md#activity-from-infrequent-country) detections alerts help you discover activities that suggest an account is potentially compromised.

1. **Tune sensitivity of [impossible travel](anomaly-detection-policy.md#impossible-travel)**
    [Configure the sensitivity slider](anomaly-detection-policy.md#tune-anomaly-detection-policies) that determines the level of suppressions applied to anomalous behavior before triggering an impossible travel alert. For example, organizations interested in high fidelity should consider increasing the sensitivity level. On the other hand, if your organization has many users that travel, consider lowering the sensitivity level to suppress activities from a user's common locations learned from previous activities. You can choose from the following sensitivity levels:

    - **Low**: System, tenant, and user suppressions
    - **Medium**: System and user suppressions
    - **High**: Only system suppressions

    Where:

    | Suppression type | Description |
    | --- | --- |
    | **System** | Built-in detections that are always suppressed. |
    | **Tenant** | Common activities based on previous activity in the tenant. For example, suppressing activities from an ISP previously alerted on in your organization. |
    | **User** | Common activities based on previous activity of the specific user. For example, suppressing activities from a location that is commonly used by the user. |

## Phase 3: Tune cloud discovery anomaly detection policies

Like the anomaly detection policies, there are several built-in [cloud discovery anomaly detection policies](cloud-discovery-anomaly-detection-policy.md) that you can fine-tune. For example, the Data exfiltration to unsanctioned apps policy alerts you when data is being exfiltrated to an unsanctioned app and comes preconfigured with settings based on Microsoft experience in the security field.

However, you can fine-tune the built-in policies or create your own policies to aid you in identifying other scenarios that you may be interested in investigating. Since these policies are based on cloud discovery logs, they have different [tuning capabilities](cloud-discovery-anomaly-detection-policy.md#legacy-create-anomaly-detection-policy) more focused on anomalous app behavior and data exfiltration.

1. **Tune usage monitoring**  
Set the usage filters to control the baseline, scope, and activity period for detecting anomalous behavior. For example, you may want to receive alerts for anomalous activities relating to executive-level employees.

1. **Tune alert sensitivity**  
To prevent alert fatigue, configure the sensitivity of alerts. You can use the sensitivity slider to control the number of high-risk alerts sent per 1,000 users per week. Higher sensitivities require less variance to be considered an anomaly and generate more alerts. In general, set low sensitivity for users that don't have access to confidential data.

## Phase 4: Tune rule-based detection (activity) policies

[Rule-based detection policies](user-activity-policies.md) give you the ability to complement anomaly detection policies with organization-specific requirements. We recommend creating rules-based policies using one of our Activity policy templates (go to **Control** > **Templates** and set the **Type** filter to **Activity policy**) and then [configuring them](activity-filters-queries.md) to detect behaviors that are not normal for your environment. For example, for some organization that don't have any presence in a particular country/region, it may make sense to create a policy that detects the anomalous activities from that country/region and alert on them. For others, who have large branches in that country/region, activities from that country/region would be normal and it wouldn't make sense to detect such activities.

1. **Tune activity volume**  
Choose the volume of activity required before the detection raises an alert. Using our country/region example, if you have no presence in a country/region, even a single activity is significant and warrants an alert. However, a single sign-in failure could be human error and only of interest if there are many failures in a short period.
1. **Tune [activity filters](activity-filters-queries.md)**  
Set the filters you require to detect the type of activity you want to alert on. For example, to detect activity from a country/region, use the **Location** parameter.
1. **Tune alerts**  
To prevent alert fatigue, set the **daily alert limit**.

## Phase 5: Configure alerts

> [!NOTE]
> Since December 15, 2022, the Alerts/SMS (text messages) has been deprecated.
> If you would like to receive text alerts, you should use Microsoft Power Automate for custom alert automation. For more information, see [Integrate with Microsoft Power Automate for custom alert automation](flow-integration.md).

You can choose to receive alerts in the format and medium that most suits your needs. To receive immediate alerts at any time of the day, you may prefer to receive them via email.

You may also want the ability to analyze alerts in the context of other alerts triggered by other products in your organization to give you a holistic view of a potential threat. For example, you may want to correlate between cloud-based and on-premises events to see if there is any other mitigating evidence that may confirm an attack.

Additionally, you can also trigger custom alert automation using our integration with [Microsoft Power Automate](flow-integration.md). For example, you can set up a playbook automatically create an issue in [ServiceNow](/connectors/service-now/) or send an approval email to execute a custom governance action when an alert is triggered.

Use the following guidelines to configure your alerts:

1. **Email**  
Choose this option to receive alerts by email.
1. **SIEM**  
There are several SIEM integration options including [Microsoft Sentinel](siem-sentinel.md), [Microsoft Graph Security API](/graph/security-integration#list-of-connectors-from-microsoft), and other [generic SIEMs](siem.md). Choose the integration that best meets your requirements.
1. **Power Automate automation**  
Create the automation playbooks you require and set it as the policy's alert to Power Automate action.

## Phase 6: Investigate and remediate

Great, you've set up your policies and start receiving suspicious activity alerts. What should you do about them? For a start, you should take steps to investigate the activity. For example, you may want to look into activities that indicate that a [user has been compromised](tutorial-ueba.md#identify).

To optimize your protection, you should consider setting up automatic remediation actions to minimize the risk to your organization. Our policies allow you to apply [governance actions](governance-actions.md) in conjunction to the alerts so that the risk to your organization is reduced even before you start investigating. Available actions are determined by the policy type including actions such as suspending a user or blocking access to the requested resource.

[!INCLUDE [Open support ticket](includes/support.md)]

## Learn more

- Try our interactive guide: [Detect threats and manage alerts with Microsoft Defender for Cloud Apps](https://mslearn.cloudguides.com/guides/Detect%20threats%20and%20manage%20alerts%20with%20Microsoft%20Cloud%20App%20Security)

