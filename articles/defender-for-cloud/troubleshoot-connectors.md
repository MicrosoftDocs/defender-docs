---
title: Troubleshoot connectors guide
description: This guide is for IT professionals, security analysts, and cloud admins who need to troubleshoot problems related to Microsoft Defender for Cloud's AWS and GCP connectors.
author: dcurwin
ms.author: dacurwin
ms.topic: conceptual
ms.date: 06/18/2025
---

# Troubleshoot connectors guide

Defender for Cloud provides a unified security management system that helps you protect your cloud resources. It supports various cloud providers, including Amazon Web Services (AWS) and Google Cloud Platform (GCP). This guide is for IT professionals, security analysts, and cloud admins who need to troubleshoot problems related to Microsoft Defender for Cloud connectors.

## Troubleshoot connectors

Defender for Cloud uses connectors to collect monitoring data from Amazon Web Services (AWS) accounts and Google Cloud Platform (GCP) projects. If you're experiencing problems with the connectors or you don't see data from AWS or GCP, review the following troubleshooting tips.

### Tips for common connector problems

- Make sure that the subscription associated with the connector is selected in the subscription filter located in the **Directories + subscriptions** section of the Azure portal.
- Standards should be assigned on the security connector. To check, go to **Environment settings** on the Defender for Cloud left menu, select the connector, and then select **Settings**. If no standards are assigned, select the three dots to check if you have permissions to assign standards.
- A connector resource should be present in Azure Resource Graph. Use the following Resource Graph query to check: `resources | where ['type'] =~ "microsoft.security/securityconnectors"`.
- Make sure that sending Kubernetes audit logs is enabled on the AWS or GCP connector so that you can get [threat detection alerts for the control plane](alerts-containers.md).
- Make sure that the Microsoft Defender sensor and the Azure Policy for Azure Arc-enabled Kubernetes extensions were installed successfully to your Amazon Elastic Kubernetes Service (EKS) and Google Kubernetes Engine (GKE) clusters. You can verify and install the agent with the following Defender for Cloud recommendations:
  - **EKS clusters should have Microsoft Defender's extension for Azure Arc installed**
  - **GKE clusters should have Microsoft Defender's extension for Azure Arc installed**
  - **Azure Arc-enabled Kubernetes clusters should have the Azure Policy extension installed**
  - **GKE clusters should have the Azure Policy extension installed**
- If you're experiencing problems with deleting the AWS or GCP connector, check the Azure Activity log for failed delete operations caused by resource locks. If a lock is present, learn how to [Manage locks to prevent resources from being deleted or changed](/azure/azure-resource-manager/management/lock-resources) to remove it and try again.
- Check that workloads exist in the AWS account or GCP project.

### Tips for AWS connector problems

- Make sure that the CloudFormation template deployment finished successfully.
- Wait at least 12 hours after creation of the AWS root account.
- Make sure that EKS clusters are successfully connected to Azure Arc-enabled Kubernetes.
- If you don't see AWS data in Defender for Cloud, make sure that the required AWS resources for sending data to Defender for Cloud exist in the AWS account.

### Connected to Sentinel first

If you connected your AWS account to Microsoft Sentinel first, the Defender for Cloud connector won't work. To fix this issue, you need to edit the CloudFormation template and apply remediation steps within your AWS account.

Learn how to [Connect a Microsoft Sentinel connected AWS account to Defender for Cloud](sentinel-connected-aws.md).

#### Cost impact of API calls to AWS

When you onboard your AWS single or management account, the discovery service in Defender for Cloud starts an immediate scan of your environment. The discovery service executes API calls to various service endpoints in order to retrieve all resources that Azure helps secure.

After this initial scan, the service continues to periodically scan your environment at the interval that you configured during onboarding. In AWS, each API call to the account generates a lookup event that's recorded in the CloudTrail resource. The CloudTrail resource incurs costs. For pricing details, see the [AWS CloudTrail Pricing](https://aws.amazon.com/cloudtrail/pricing/) page on the Amazon AWS site.

If you connected your CloudTrail to GuardDuty, you're also responsible for associated costs. You can find these costs in the [GuardDuty documentation](https://docs.aws.amazon.com/guardduty/latest/ug/monitoring_costs.html) on the Amazon AWS site.

#### Get the number of native API calls

There are two ways to get the number of calls that Defender for Cloud made:

- Use an existing Athena table or create a new one. For more information, see [Querying AWS CloudTrail logs](https://docs.aws.amazon.com/athena/latest/ug/cloudtrail-logs.html) on the Amazon AWS site.
- Use an existing event data store or create a new one. For more information, see [Working with AWS CloudTrail Lake](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake.html) on the Amazon AWS site.

Both methods rely on querying AWS CloudTrail logs.

To get the number of calls, go to the Athena table or the event data store and use one of the following predefined queries, according to your needs. Replace `<TABLE-NAME>` with the ID of the Athena table or event data store.

- List the number of overall API calls by Defender for Cloud:

  ```sql
  SELECT COUNT(*) AS overallApiCallsCount FROM <TABLE-NAME> 
  WHERE userIdentity.arn LIKE 'arn:aws:sts::<YOUR-ACCOUNT-ID>:assumed-role/CspmMonitorAws/MicrosoftDefenderForClouds_<YOUR-AZURE-TENANT-ID>' 
  AND eventTime > TIMESTAMP '<DATETIME>' 
  ```

- List the number of overall API calls by Defender for Cloud aggregated by day:

  ```sql
  SELECT DATE(eventTime) AS apiCallsDate, COUNT(*) AS apiCallsCountByRegion FROM <TABLE-NAME> 
  WHERE userIdentity.arn LIKE 'arn:aws:sts:: <YOUR-ACCOUNT-ID>:assumed-role/CspmMonitorAws/MicrosoftDefenderForClouds_<YOUR-AZURE-TENANT-ID>' 
  AND eventTime > TIMESTAMP '<DATETIME>' GROUP BY DATE(eventTime)
  ```

- List the number of overall API calls by Defender for Cloud aggregated by event name:

  ```sql
  SELECT eventName, COUNT(*) AS apiCallsCountByEventName FROM <TABLE-NAME> 
  WHERE userIdentity.arn LIKE 'arn:aws:sts::<YOUR-ACCOUNT-ID>:assumed-role/CspmMonitorAws/MicrosoftDefenderForClouds_<YOUR-AZURE-TENANT-ID>' 
  AND eventTime > TIMESTAMP '<DATETIME>' GROUP BY eventName     
  ```

- List the number of overall API calls by Defender for Cloud aggregated by region:

  ```sql
  SELECT awsRegion, COUNT(*) AS apiCallsCountByRegion FROM <TABLE-NAME> 
  WHERE userIdentity.arn LIKE 'arn:aws:sts::120589537074:assumed-role/CspmMonitorAws/MicrosoftDefenderForClouds_<YOUR-AZURE-TENANT-ID>' 
  AND eventTime > TIMESTAMP '<DATETIME>' GROUP BY awsRegion
  ```

### Tips for GCP connector problems

- Make sure that the GCP Cloud Shell script finished successfully.
- Make sure that GKE clusters are successfully connected to Azure Arc-enabled Kubernetes.
- Make sure that Azure Arc endpoints are in the firewall allowlist. The GCP connector makes API calls to these endpoints to fetch the necessary onboarding files.
- If the onboarding of GCP projects fails, make sure you have `compute.regions.list` permission and Microsoft Entra permission to create the service principal for the onboarding process. Make sure that the GCP resources `WorkloadIdentityPoolId`, `WorkloadIdentityProviderId`, and `ServiceAccountEmail` are created in the GCP project.

#### Defender API calls to GCP

When you onboard your GCP single project or organization, the discovery service in Defender for Cloud starts an immediate scan of your environment. The discovery service executes API calls to various service endpoints in order to retrieve all resources that Azure helps secure.

After this initial scan, the service continues to periodically scan your environment at the interval that you configured during onboarding.

To get the number of native API calls that Defender for Cloud executed:

1. Go to **Logging** > **Log Explorer**.

1. Filter the dates as you want (for example, **1d**).

1. To show API calls that Defender for Cloud executed, run this query:

   ```json
   protoPayload.authenticationInfo.principalEmail : "microsoft-defender"
   ```

Refer to the histogram to see the number of calls over time.

## See also

- [Connect a Microsoft Sentinel connected AWS account to Defender for Cloud](sentinel-connected-aws.md).
- [Resolve Domain Restricted Sharing policy](resolve-gcp-sharing-policy.md).
- [Resolve agentless scan error](resolve-disk-scanning-error.md).
- [Resolve VPC service controls issues](resolve-vpc-service-controls-issues.md).
- Review [common questions](faq-general.yml) about using Defender for Cloud.