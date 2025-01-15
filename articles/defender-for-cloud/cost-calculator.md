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

[Screenshot 1]
  
## Configure Defender for Cloud plans and environments
  
On the first page of the calculator, select the **Add Assets** button to start adding assets to your cost calculation. You have three methods to add assets:  
  
- **With a Script:** Download and execute a script to automatically add existing assets.  
- **From Existing Environments:** Add assets from environments already onboarded to Defender for Cloud.  
- **Manually:** Add assets manually without using automation.  

[Screenshot 2]
  
### Add assets with a script  
  
1. Choose the environment type (Azure, AWS, or GCP) and copy the script to a new file.  

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
  
### Assign onboarded assets  

1. Select from the list of Azure environments already onboarded to Defender for Cloud to include in the cost calculation.

    > [!NOTE]
    > We only include the resources we received permission for during onboarding.

1. Choose the plans. The calculator estimates the cost based on your selections and any existing discounts.

> [!NOTE]
> Reservation plans (P3) for Defender for Cloud aren't considered.

[Screenshot 4]
  
### Assign custom assets  
  
1. Select the types of assets you wish to include in the cost calculation.  
1. Choose a name for the custom environment.
1. Specify the plans and the number of billable assets for each plan.  
1. The calculator estimates costs based on your inputs and any existing discounts.

> [!NOTE]
> Reservation plans for Defender for Cloud aren't considered.

:::image type="content" source="media/cost-calculator/add-custom-environment.png" alt-text="Screenshot of how to add a custom environment." lightbox="media/cost-calculator/add-custom-environment.png":::
  
## Adjust your report
  
After generating the report, you can adjust the plans and the number of billable assets:  
  
- Choose the environment you wish to modify by selecting the edit (pencil) icon.
- A configuration page appears, enabling you to adjust plans, the number of billable assets, and the average monthly hours.  
- Select the **Recalculate** button to update the cost estimate.  
  
## Export the report  
  
Once you're satisfied with the report, you can export it as a CSV file:  
  
- Select the **Export to CSV** button located at the bottom of the **Summary** panel on the right.  
- The cost information is downloaded as a CSV file.  

## Frequently asked questions
  
### What is the cost calculator?  
  
The cost calculator is a tool designed to simplify the process of estimating costs for your security protection needs. When you define the scope of your desired plans and environments, the calculator provides a detailed breakdown of potential expenses, including any applicable discounts.  
  
### How does the cost calculator work?  
  
The calculator allows you to select the environments and plans you wish to enable. It then performs a discovery process to automatically populate the number of billable units for each plan per environment. You also can manually adjust the unit quantities and discount levels.  
  
### What is the discovery process?  
  
The discovery process generates a report of the selected environment, including the inventory of billable assets by the various Defender for Cloud plans. This process is based on the user permissions and the environment state at the time of discovery. It can take a few hours as dynamic assets are also sampled.  
  
### Do I need to grant any special permission for the cost calculator to perform the discovery process?  
  
No special permissions are needed. The Cost Calculator uses the user's existing permissions to run the script and perform discovery automatically, ensuring it gathers the necessary data without requiring further access rights.  
  
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
