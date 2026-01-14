---
title: Ingest GCP logging
description: Learn how to ingest Google Cloud Platform (GCP) Cloud Logging into Microsoft Defender for Cloud using Pub/Sub.
ms.topic: install-set-up-deploy
ms.author: Elkrieger
author: Elazark
ms.date: 01/13/2026
ms.custom: sfi-image-nochange
---

# Ingest GCP cloud logging with Pub/Sub (Preview)

Integrating Google Cloud Platform (GCP) Cloud Logging with Microsoft Defender for Cloud allows you to ingest activity logs from GCP, enhancing your ability to monitor, detect, and respond to security events across your Google Cloud environments. You can configure log ingestion either at the project level or centrally at the organization level. Data streamed from GCP Pub/Sub provides the necessary context for Cloud Infrastructure Entitlement Management (CIEM) in Defender for Cloud, dependent on the log activity, calculated risk-based recommendations, security posture insights, and attack path analysis.

## How GCP logging ingestion works

Once configured, Defender for Cloud ingests and analyzes activity logs from Google Cloud to discover cloud identity and permissions insights, and CIEM recommendations.

Google Cloud records activity logs (including Admin Activity and Data Access logs) in [Cloud Logging](https://cloud.google.com/logging/docs). Logs are exported to the configured **Pub/Sub topic** using a Cloud Logging sink. The **Pub/Sub subscription** streams log messages to Defender for Cloud when new logs arrive.

Defender for Cloud pulls the logs from Pub/Sub, processes the activity events, and provides identity and permission insights as well as CIEM posture recommendations. Access between GCP and Defender for Cloud is secured via Google Cloud **IAM roles** and **service accounts** to ensure least-privilege operation.

Optionally, if **IAM Recommender** is enabled in your GCP environment, Defender for Cloud leverages its insights to enhance the accuracy of CIEM recommendations by identifying inactive and over-privileged roles.

## Deploy GCP Cloud Logging ingestion

Select the deployment scenario that meets your requirement:

- __Project-Level__: Configure log ingestion for individual GCP projects.

- __Organization-Level__: Centralize log ingestion across all projects within a GCP organization.

### Deployment steps

To configure GCP Cloud Logging:

1. 1. Sign in to the [Azure portal](https://portal.azure.com).
 
1. Search for and select **Microsoft Defender for Cloud**.
 
1. Go to **Environment settings**.

1. Select the relevant GCP connector.

1. Select **Settings** under the Monitoring coverage column.

1. Toggle the switches to **On** selecting one of the following methods:

   1. Create a new GCP Cloud Logging configuration and provide a Pub/Sub subscription name.

      :::image type="content" source="media/quickstart-onboard-gcp/cloud-logging-create-new.png" alt-text="Screenshot with the Create a new GCP Cloud Logging option selected." lightbox="media/quickstart-onboard-gcp/cloud-logging-create-new.png":::
      
      > [!IMPORTANT]
      > Selecting this option will incur additional cost. [Learn more about GCP Cloud Logging pricing](https://cloud.google.com/pubsub/pricing)
      
   1. Use your existing Cloud Logging configuration by manually providing your existing Pub/Sub subscription name.
   
   :::image type="content" source="media/quickstart-onboard-gcp/cloud-logging-manual-details.png" alt-text="Screenshot with the Manually provide GCP Cloud Logging details option selected." lightbox="media/quickstart-onboard-gcp/cloud-logging-manual-details.png":::

    > [!NOTE]
    > Access configuration for GCP can be completed using either GCP Cloud Shell or Terraform, depending on your organization’s deployment workflows.
   
1. Select **Save**.

1. Continue from step 8 of the [Connect your GCP project](quickstart-onboard-gcp.md#connect-your-gcp-project) instructions.

1. Review and generate the GCP connector to complete log ingestion onboarding into Defender for Cloud. 

## Next step

> [!div class="nextstep"]
> 