---
title: Integrate GCP cloud logging
description: Learn how to ingest Google Cloud Platform (GCP) Cloud Logging into Microsoft Defender for Cloud using Pub/Sub.
ms.topic: install-set-up-deploy
ms.author: Elkrieger
author: Elazark
ms.date: 01/18/2026
ms.custom: sfi-image-nochange
---

# Integrate GCP cloud logging with Pub/Sub (Preview)

Microsoft Defender for Cloud can collect activity logs from Google Cloud Platform (GCP) by ingesting Cloud Logging data through Pub/Sub. These logs provide activity context used by Cloud Infrastructure Entitlement Management (CIEM) in Defender for Cloud, including risk-based recommendations and attack path analysis across your Google Cloud environments.

GCP Cloud Logging ingestion is available for individual GCP projects and for GCP organizations that use centralized logging. Learn more about the [Google Cloud resource hierarchy](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy#resource-hierarchy-detail).

## How GCP logging ingestion works

When GCP Cloud Logging ingestion is enabled, Defender for Cloud retrieves activity logs from Google Cloud and processes them to identify identity- and permission-related activity.

Google Cloud records activity logs (including Admin Activity and Data Access logs) in [Cloud Logging](https://cloud.google.com/logging/docs). Logs are exported to the configured Pub/Sub topic using a Cloud Logging sink. The Pub/Sub subscription streams log messages to Defender for Cloud when new logs arrive.

Defender for Cloud pulls activity events from Pub/Sub and processes them to generate identity and permission insights. Access between GCP and Defender for Cloud is secured using Google Cloud IAM roles and service accounts to support least-privilege access.

Optionally, if IAM Recommender is enabled in your GCP environment, Defender for Cloud leverages its insights to enhance the accuracy of CIEM recommendations by identifying inactive and over-privileged roles.

### Historical data hydration

When GCP Cloud Logging ingestion is enabled, Defender for Cloud performs a one-time historical data collection process (hydration).

As part of the onboarding workflow:

- A dedicated storage bucket is created in the GCP environment.
- Defender for Cloud retrieves up to 90 days of available historical Cloud Audit Logs using Google Cloud copy activity.
- The historical data is processed to generate identity and permission insights.

This process enables CIEM recommendations and attack path analysis to use historical activity data immediately after onboarding.

After hydration completes, ongoing activity logs continue to be ingested through Pub/Sub streaming.

## Prerequisites

Before enabling GCP Cloud Logging ingestion with Pub/Sub, ensure that your GCP environment has:

- An existing GCP connector configured in Microsoft Defender for Cloud.

- Access to the GCP project or organization where logs are generated.

- Permissions to create or manage Cloud Logging sinks.

- Permissions to create and manage Pub/Sub topics and subscriptions.

- IAM permissions to create or manage service accounts and assign required roles.

- If using an existing Pub/Sub subscription, access to the existing Cloud Logging sink and Pub/Sub resources, and that these resources align with your organization’s log retention and Pub/Sub configuration.

## Configure GCP Cloud Logging ingestion

To configure GCP Cloud Logging:

1. Sign in to the [Azure portal](https://portal.azure.com).
 
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
   
      > [!IMPORTANT]
      > If you use an existing Cloud Logging sink, ensure that the sink filter exports Cloud Audit Logs (such as Admin Activity and Data Access log types) to the specified Pub/Sub topic.  
      > If the required Cloud Audit log types aren't included in the filter, ingestion won't provide full identity and permission activity coverage.

      :::image type="content" source="media/quickstart-onboard-gcp/cloud-logging-manual-details.png" alt-text="Screenshot with the Manually provide GCP Cloud Logging details option selected." lightbox="media/quickstart-onboard-gcp/cloud-logging-manual-details.png":::
   
1. Select **Save**.

1. Continue from step 8 of the [Connect your GCP project](quickstart-onboard-gcp.md#connect-your-gcp-project) instructions.

1. Review and generate the GCP connector to complete log ingestion onboarding into Defender for Cloud. 

## Next step

> [!div class="nextstep"]
> [Security alerts and incidents](alerts-overview.md)