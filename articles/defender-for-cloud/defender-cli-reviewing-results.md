---
title: Review CI/CD Pipeline Results in Cloud Security Explorer
description: Learn how to use Cloud Security Explorer in Microsoft Defender for Cloud to review CI/CD pipeline results and map them to container images effectively.
#customer intent: As a security analyst, I want to review CI/CD pipeline results in Cloud Security Explorer so that I can identify potential vulnerabilities in my DevOps environment.
author: dcurwin
ms.author: dacurwin
ms.reviewer: dacurwin
ms.date: 11/06/2025
ms.topic: concept-article
---

# Review CI/CD pipeline results in Cloud Security Explorer

After your CI/CD pipeline completes a scan with Defender CLI, you can review the results in Cloud Security Explorer. Cloud Security Explorer lets you query and visualize the relationship between your CI/CD pipelines and container images, helping you identify vulnerabilities and track security findings across your DevOps environment.

## Query pipeline results

1. After the pipeline runs successfully, go to Microsoft Defender for Cloud.  
1. In the **Defender for Cloud** menu, select **Cloud Security Explorer**.  
1. Select **Select resource types** dropdown, select **DevOps**, and then select **Done**.
   
   :::image type="content" source="media/cli-cicd/cloud-security-explorer.png" alt-text="Screenshot of CI/CD pipeline in Cloud Security Explorer."::: 

1. Select the + icon to add new search criteria.  
   
   :::image type="content" source="media/cli-cicd/cloud-security-explorer-search.png" alt-text="Screenshot of new search in Cloud Security Explorer.":::  

1. Choose the **Select condition** dropdown. Then select **Data**, and then select **Pushes**.  
   
   :::image type="content" source="media/cli-cicd/cloud-security-explorer-push.png" alt-text="Screenshot of selecting condition Cloud Security Explorer.":::  

1. Choose the **Select resource types** dropdown. Then select **Containers**, then **Container Images**, and then select **Done**.  
   
   :::image type="content" source="media/cli-cicd/cloud-security-explorer-containers.png" alt-text="Screenshot of selecting container images in Cloud Security Explorer.":::

1. Select the scope you selected during the creation of the integration in Environment settings.  

   :::image type="content" source="media/cli-cicd/cloud-security-explorer-scope.png" alt-text="Screenshot of selecting scope in Cloud Security Explorer.":::  

1. Select **Search**.  

   :::image type="content" source="media/cli-cicd/cloud-security-explorer.png" alt-text="Screenshot of CI/CD pipeline in Cloud Security Explorer.":::  

1. See the results of pipeline to images mapping.  

## Correlate with monitored containers

1. In Cloud Security Explorer, enter the following query: **CI/CD Pipeline** -> **Pipeline** + **Container Images** -> **Contained in** + **Container registries (group)**.  
1. Review the resource names to see the container mapping.
