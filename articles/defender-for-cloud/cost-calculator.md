---
title: Estimate costs with the Defender for Cloud cost calculator
description: Discover how to use the Microsoft Defender for Cloud Cost Calculator to estimate your cloud security expenses. 
ms.topic: how-to
ms.date: 01/08/2025
#customer intent: Customers will use this document to learn how to effectively estimate and manage their Microsoft Defender for Cloud costs. They will understand how to access and use the cost calculator, configure different plans and environments, add assets, and can adjust their cost estimates to optimize their cloud security expenses.
---

# Estimate costs with the Microsoft Defender for Cloud cost calculator  
  
The Microsoft Defender for Cloud cost calculator is a helpful tool for estimating the potential costs associated with your cloud security needs. It allows you to configure different plans and environments, providing a detailed cost breakdown, including applicable discounts.  
  
## Access the cost calculator
  
To begin using the Defender for Cloud Cost Calculator, navigate to the **Environment Settings** section of Microsoft Defender for Cloud. Select the **Cost Calculator** button located in the upper section of the interface.  

:::image type="content" source="media/cost-calculator/select-cost-calculator.png" alt-text="Screenshot of cost calculator button in Environment Settings." lightbox="media/cost-calculator/select-cost-calculator.png":::
  
## Configure Defender for Cloud plans and environments
  
On the first page of the calculator, select the **Add Assets** button to start adding assets to your cost calculation. You have three methods to add assets:  
  
- [Add assets with a script](#add-assets-with-a-script): Download and execute a script to automatically add existing assets.  
- [Add assets from onboarded environments](#assign-onboarded-assets): Add assets from environments already onboarded to Defender for Cloud.  
- [Add custom assets](#assign-custom-assets): Add assets manually without using automation.  

:::image type="content" source="media/cost-calculator/add-assets-cost-calculator.png" alt-text="Screenshot of how to add assets in cost calculator." lightbox="media/cost-calculator/add-assets-cost-calculator.png":::

> [!NOTE]
> Reservation plans (P3) for Defender for Cloud aren't considered.

### Add assets with a script  
  
1. Choose the environment type (Azure, AWS, or GCP) and copy the script to a new *.ps1 file.  

    > [!NOTE]
    > The script only collects information that the user running it has access to.

1. Run the script in your PowerShell 7.X environment using a privileged user account. The script collects information on your billable assets and creates a CSV file. It gathers information in two steps. First, it collects the current number of billable assets that usually stay constant. Second, it collects information on billable assets that can change a lot during the month. For these assets, it checks usage over the last 30 days to evaluate the cost. You can stop the script after the first step, which takes a few seconds. Or you can continue to collect the last 30 days of usage for dynamic assets, which might take longer for large accounts.
1. Upload this CSV file into the wizard where you downloaded the script.  
1. Select the desired Defender for Cloud plans. The calculator estimates costs based on your selection and any existing discounts.

> [!NOTE]
>
> - Reservation plans for Defender for Cloud aren't considered.
> - For Defender for APIs: When calculating the cost based on the number of API calls in the last 30 days, we automatically select the best Defender for APIs plan for you. If there are no API calls in the last 30 days, we automatically disable the plan for calculation purposes.

:::image type="content" source="media/cost-calculator/add-assets-with-script.png" alt-text="Screenshot of how to add assets with a script." lightbox="media/cost-calculator/add-assets-with-script.png":::

#### Required permissions for scripts

This section provides an overview of the permissions required to run the scripts for each cloud provider.

##### Azure

To run this script successfully for each subscription, the account you use needs permissions that allow it to:

- **Discover and list resources** (including virtual machines, storage accounts, APIM services, Cosmos DB accounts, etc.).

- **Query Resource Graph** (via Search-AzGraph).
- **Read Metrics** (via Get-AzMetric and the Azure Monitor/Insights APIs).

**Recommended built-in role**:

In most cases, the **Reader** role *at the subscription scope* is sufficient. The Reader role provides the following key capabilities needed by this script:

- **Read all resource types** (so you can list and parse things like Storage Accounts, VMs, Cosmos DB, and APIM, etc.).
- **Read metrics (Microsoft.Insights/metrics/read)** so that calls to Get-AzMetric or direct Azure Monitor REST queries succeed.
- **Resource Graph queries** works as long as you have at least read access to those resources in the subscription.

> [!NOTE]
> If you want to be certain you have the necessary metric permissions, you can also use **Monitoring Reader** role; however, the standard **Reader** role already includes read access to metrics and is usually all you need.

**If you already have Contributor or Owner roles**:

- **Contributor** or **Owner** on the subscription is more than enough (these roles are higher-privileged than Reader).
- The script doesn't perform resource creation or deletion. Therefore, granting high-level roles (like Contributor/Owner) for the sole purpose of data collection might be overkill from a least-privilege perspective.

**Summary**:

Granting your user or service principal the **Reader** role (or any higher-privileged role) on each subscription you wish to query ensures the script can:

- Retrieve the list of subscriptions.
- Enumerate and read all relevant resource information (via REST or Az PowerShell).
- Fetch the necessary metrics (Requests for APIM, RU consumption for Cosmos DB, Storage Accounts ingress, etc.).
- Run Resource Graph queries without issue.

##### AWS

The following is an overview of the permissions your AWS Identity (user or role) needs to run this script successfully. The script enumerates resources (EC2, RDS, EKS, S3, etc.) and fetches metadata for those resources. It does **not** create, modify, or delete resources, so **read-only** access is sufficient in most cases.

###### AWS Managed Policy: ReadOnlyAccess or ViewOnlyAccess

The simplest approach is to attach one of AWS's built-in read-only policies to the IAM principal (user/role) that runs this script. Examples include:

- `arn:aws:iam::aws:policy/ReadOnlyAccess`
- `arn:aws:iam::aws:policy/job-function/ViewOnlyAccess`

Either of these covers the *describe* and *list* permissions for most AWS services. If your environment's security policy allows it, **ReadOnlyAccess** is the easiest way to ensure the script works across all AWS resources it enumerates.

**Key services and required permissions**:

If you need a more granular approach with a **custom** IAM policy, the following are the services and permissions you must allow:

- **EC2**
  - ec2:DescribeInstances
  - ec2:DescribeRegions
  - ec2:DescribeInstanceTypes (for retrieving vCPU/core info)
- **RDS**
  - rds:DescribeDBInstances
- **EKS**
  - eks:ListClusters
  - eks:DescribeCluster
  - eks:ListNodegroups
  - eks:DescribeNodegroup
- **Auto Scaling** (for EKS node groups underlying instances)
  - autoscaling:DescribeAutoScalingGroups
- **S3**
  - s3:ListAllMyBuckets
- **STS**
  - sts:GetCallerIdentity (to retrieve the AWS Account ID)

Additionally, if you need to list other resources not shown in the script or if you plan to expand the script's capabilities, ensure you grant the appropriate Describe*, List*, and Get* actions as needed.

**Summary**:

- The most straightforward way is to attach AWS's built-in **ReadOnlyAccess** policy, which already includes all the actions required to list and describe EC2, RDS, EKS, S3, Auto Scaling resources, and call STS to get your account info.
- If you want just enough privileges, create a custom read-only policy with the above Describe*, List*, and Get* actions for EC2, RDS, EKS, Auto Scaling, S3, and STS.

Either approach gives your script sufficient permissions to:

- List regions.
- Retrieve EC2 instance metadata.
- Retrieve RDS instances.
- List and describe EKS clusters and node groups (and the underlying Auto Scaling groups).
- List S3 buckets.
- Obtain your AWS account ID via STS.

This ensures the script can discover resources and fetch the relevant metadata without creating, modifying, or deleting anything.

##### GCP

The following is an overview of the permissions your GCP user or service account needs to run this script successfully. In short, the script needs to list and describe resources (VM instances, Cloud SQL, GKE clusters, and GCS buckets) in your chosen project.

###### Recommended built-in role: Project Viewer

The simplest approach to ensure read-only access across all these resources is granting your user or service account the **roles/viewer** role at the project level (the same project you select via gcloud config set project).

The **roles/viewer** role includes read-only access to most GCP services within that project, including the necessary permissions for:

- **Compute Engine** (list VM instances, instance templates, machine types, etc.).
- **Cloud SQL** (list SQL instances).
- **Kubernetes Engine** (list clusters, node pools, etc.).
- **Cloud Storage** (list buckets).

**Granular permissions by service (if creating a custom role)**:

If you prefer a more granular approach, you can create a **custom IAM role** or set of roles that collectively grant just the needed read-list-describe actions for each service:

- **Compute Engine** (for VM Instances, Regions, Instance Templates, Instance Group Managers):
  - compute.instances.list
  - compute.regions.list
  - compute.machineTypes.list
  - compute.instanceTemplates.get
  - compute.instanceGroupManagers.get
  - compute.instanceGroups.get
- **Cloud SQL**:
  - cloudsql.instances.list
- **Google Kubernetes Engine**:
  - container.clusters.list
  - container.clusters.get (needed when describing clusters)
  - container.nodePools.list
  - container.nodePools.get
- **Cloud Storage**:
  - storage.buckets.list

The script doesn't create or modify any resources, so it doesn't require update or delete permissions—only list, get, or describe type permissions.

**Summary**:

- Using roles/viewer at the project level is the fastest and most straightforward way to grant enough permissions for this script to succeed.
- If you need the strictest least-privilege approach, create or combine custom roles that only include the relevant list/describe/get actions for Compute Engine, Cloud SQL, GKE, and Cloud Storage.

With these permissions in place, the script can:

- **Authenticate** (gcloud auth login).
- **List** VM instances, machine types, instance group managers, etc.
- **List** Cloud SQL instances.
- **List/describe** GKE clusters and node pools.
- **List** GCS buckets.

This read-level access allows enumerating resource counts and gathering metadata without modifying or creating any resources.

### Assign onboarded assets  

1. Select from the list of Azure environments already onboarded to Defender for Cloud to include in the cost calculation.

    > [!NOTE]
    > We only include the resources we received permission for during onboarding.

1. Choose the plans. The calculator estimates the cost based on your selections and any existing discounts.

:::image type="content" source="media/cost-calculator/assign-onboarded-assets.png" alt-text="Screenshot of how to assign onboarded assets." lightbox="media/cost-calculator/assign-onboarded-assets.png":::
  
### Assign custom assets  

1. Choose a name for the custom environment.
1. Specify the plans and the number of billable assets for each plan.
1. Select the types of assets you wish to include in the cost calculation.  
1. The calculator estimates costs based on your inputs and any existing discounts.

> [!NOTE]
> Reservation plans for Defender for Cloud aren't considered.

:::image type="content" source="media/cost-calculator/add-custom-environment.png" alt-text="Screenshot of how to add a custom environment." lightbox="media/cost-calculator/add-custom-environment.png":::
  
## Adjust your report
  
After generating the report, you can adjust the plans and the number of billable assets:  
  
1. Choose the environment you wish to modify by selecting the edit (pencil) icon.
1. A configuration page appears, enabling you to adjust plans, the number of billable assets, and the average monthly hours.  
1. Select the **Recalculate** button to update the cost estimate.  
  
## Export the report
  
Once you're satisfied with the report, you can export it as a CSV file:  
  
1. Select the **Export to CSV** button located at the bottom of the **Summary** panel on the right.  
1. The cost information is downloaded as a CSV file.  

## Frequently asked questions
  
### What is the cost calculator?  
  
The cost calculator is a tool designed to simplify the process of estimating costs for your security protection needs. When you define the scope of your desired plans and environments, the calculator provides a detailed breakdown of potential expenses, including any applicable discounts.  
  
### How does the cost calculator work?  
  
The calculator allows you to select the environments and plans you wish to enable. It then performs a discovery process to automatically populate the number of billable units for each plan per environment. You also can manually adjust the unit quantities and discount levels.  
  
### What is the discovery process?  
  
The discovery process generates a report of the selected environment, including the inventory of billable assets by the various Defender for Cloud plans. This process is based on the user permissions and the environment state at the time of discovery. For large environments, this process might take approximately 30-60 minutes as dynamic assets are also sampled.  
  
### Do I need to grant any special permission for the cost calculator to perform the discovery process?  
  
The Cost Calculator uses the user's existing permissions to run the script and perform discovery automatically, ensuring it gathers the necessary data without requiring further access rights. To see what permissions the user needs to run the script, refer to the [Required permissions for scripts](#required-permissions-for-scripts) section.
  
### Do the estimations accurately predict my cost?  
  
The calculator provides an estimate based on the information available when the script is executed. Various factors might influence the final cost, so it should be considered an approximate calculation.  
  
### What are the billable units?  
  
The cost of plans is based on the units they protect. Each plan charges for a different unit type, which can be found on the [Microsoft Defender for Cloud Settings page](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/PolicyMenuBlade/~/pricingTier/subscriptionId/615f5f56-4ba9-45cf-b644-0c09d7d325c8).  
  
### Can I adjust the estimates manually?  
  
Yes, the cost calculator allows for both automatic data collection and manual adjustments. You can modify the unit quantity and discount levels to better reflect your specific needs and see how these changes affect your overall cost.  
  
### Does the calculator support multiple cloud providers?  
  
Yes, it offers multicloud support, ensuring that you can obtain accurate cost estimations regardless of your cloud provider.  
  
### How can I share my cost estimate?  
  
Once you generated your cost estimate, you can easily export and share it for budget planning and approvals. This feature ensures that all stakeholders have access to the necessary information.  
  
### Where can I get help if I have questions?  
  
Our support team is ready to assist you with any questions or concerns you might have. Feel free to reach out to us for assistance.  
  
### How can I try the cost calculator?  
  
We invite you to try out the new cost calculator and experience its benefits firsthand. Access the tool and start defining the scope of your protection needs to get started. To use the Defender for Cloud Cost Calculator, go to [the Microsoft Defender for Cloud Settings](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/PolicyMenuBlade/~/pricingTier/subscriptionId/615f5f56-4ba9-45cf-b644-0c09d7d325c8) and select the **Cost Calculator** button in the upper section.  
  
## Related content

- [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/)
- [Optimize Microsoft Defender for Cloud costs with a prepurchase plan](prepurchase-plan.md)
