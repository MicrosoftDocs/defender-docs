---
title: Enable Defender for open-source relational databases on Amazon Web Services (AWS)
description: Learn how to enable Microsoft Defender for open-source relational databases to detect potential security threats on AWS environments.
ms.date: 06/30/2025
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
#customer intent: As a reader, I want to learn how to configure Microsoft Defender for open-source relational databases to enhance the security of my AWS databases.
---

# Enable Defender for open-source relational databases on Amazon Web Services (AWS) (Preview)

The Defender for open-source relational databases plan in Microsoft Defender for Cloud helps you detect and investigate unusual activity in your AWS RDS databases. This plan supports the following database instance types:

- Aurora PostgreSQL
- Aurora MySQL
- PostgreSQL
- MySQL
- MariaDB

This article explains how to enable Defender for open-source relational databases on AWS so that you can start receiving alerts for suspicious activity.

When you enable this plan, Defender for Cloud also discovers sensitive data in your AWS account and enriches security insights with these findings. This capability is also included in Defender Cloud Security Posture Management (CSPM).

Learn more about this Microsoft Defender plan in [Overview of Microsoft Defender for open-source relational databases](defender-for-databases-introduction.md).

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have one, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- At least one connected [AWS account](quickstart-onboard-aws.md) with the required access and permissions.

- Region availability: All public AWS regions (excluding Tel Aviv, Milan, Jakarta, Spain, and Bahrain).

## Enable Defender for open-source relational databases

1. Sign in to [the Azure portal](https://portal.azure.com)

1. Search for and select **Microsoft Defender for Cloud**.

1. Select **Environment settings**.

1. Select the relevant AWS account.

1. Locate the **Databases** plan and select **Settings**.

    :::image type="content" source="media/enable-defender-for-databases-aws/databases-settings.png" alt-text="Screenshot of the AWS environment settings page that shows where the settings button is located." lightbox="media/enable-defender-for-databases-aws/databases-settings.png":::

1. Toggle open-source relational databases to **On**.  

    :::image type="content" source="media/enable-defender-for-databases-aws/toggle-open-source-on.png" alt-text="Screenshot that shows how to toggle the open-source relational databases to on." lightbox="media/enable-defender-for-databases-aws/toggle-open-source-on.png":::

    > [!NOTE]
    > Turning on Open-source relational databases also enables Sensitive data discovery, a shared feature with Defender CSPM for relational database service (RDS) resources.
    >
    > :::image type="content" source="media/enable-defender-for-databases-aws/cspm-shared.png" alt-text="Screenshot that shows the settings page for Defender CSPM and the sensitive data turned on with the protected resources." lightbox="media/enable-defender-for-databases-aws/cspm-shared.png":::
    >
    > Learn more about [sensitive data discovery in AWS RDS instances](concept-data-security-posture-prepare.md#discover-and-scan-aws-rds-instances).

1. Select **Configure access**.

1. In the deployment method section, select **Download**.

1. Follow the instructions to update the stack in AWS. This process creates or updates the CloudFormation template with the [required permissions](#required-permissions-for-defenderforcloud-datathreatprotectiondb-role).

1. Check the box confirming the CloudFormation template was updated on AWS environment (Stack).

1. Select **Review and generate**.

1. Review the information and select **Update**.

Defender for Cloud then automatically [updates the relevant parameter and option group settings](#affected-parameter-and-option-group-settings).

### Required permissions for DefenderForCloud-DataThreatProtectionDB Role

The following permissions are required for the role that’s created or updated when you download the CloudFormation template and update the AWS stack. These permissions allow Defender for Cloud to manage auditing configuration and collect database activity logs from your AWS RDS instances.

| Permission | Description |
|--|--|
| rds:AddTagsToResource | Adds tags on option and parameter groups created by the plan. |
| rds:DescribeDBClusterParameters | Describes parameters inside the cluster group. |
| rds:CreateDBParameterGroup | Creates a database parameter group. |
| rds:ModifyOptionGroup | Modifies options inside an option group. |
| rds:DescribeDBLogFiles | Describes database log files. |
| rds:DescribeDBParameterGroups | Describes database parameter groups. |
| rds:CreateOptionGroup | Creates an option group. |
| rds:ModifyDBParameterGroup | Modifies parameters inside database parameter groups. |
| rds:DownloadDBLogFilePortion | Downloads log file portions. |
| rds:DescribeDBInstances | Describes database instances. |
| rds:ModifyDBClusterParameterGroup | Modifies cluster parameters inside the cluster parameter group. |
| rds:ModifyDBInstance | Modifies databases to assign parameter or option groups as needed. |
| rds:ModifyDBCluster | Modifies clusters to assign cluster parameter groups as needed. |
| rds:DescribeDBParameters | Describes parameters inside the database group. |
| rds:CreateDBClusterParameterGroup | Creates a cluster parameter group. |
| rds:DescribeDBClusters | Describes clusters. |
| rds:DescribeDBClusterParameterGroups | Describes cluster parameter groups. |
| rds:DescribeOptionGroups | Describes option groups. |

## Affected parameter and option group settings

When you enable Defender for open-source relational databases, Defender for Cloud automatically configures auditing parameters in your RDS instances to consume and analyze access patterns. You don’t need to modify these settings manually; they’re listed here for reference

| Type | Parameter | Value |
|--|--|--|
| PostgreSQL and Aurora PostgreSQL | log_connections | 1|
| PostgreSQL and Aurora PostgreSQL | log_disconnections | 1 |
| Aurora MySQL cluster parameter group | server_audit_logging | 1 |
| Aurora MySQL cluster parameter group | server_audit_events | - If it exists, expand the value to include CONNECT, QUERY, <br> - If it doesn't exist, add it with the value CONNECT, QUERY. |
| Aurora MySQL cluster parameter group | server_audit_excl_users | If it exists, expand it to include rdsadmin. |
| Aurora MySQL cluster parameter group | server_audit_incl_users | - If it exists with a value and rdsadmin as part of the included, then it isn't present in SERVER_AUDIT_EXCL_USER, and the value of include is empty. |

An option group is required for MySQL and MariaDB with the following options for the `MARIADB_AUDIT_PLUGIN`.  

If the option doesn’t exist, add it; if it exists, expand the values as needed.

| Option name | Value |
|--|--|
| SERVER_AUDIT_EVENTS | If it exists, expand the value to include CONNECT <br> If it doesn't exist, add it with value CONNECT. |
| SERVER_AUDIT_EXCL_USER | If it exists, expand it to include rdsadmin. |
| SERVER_AUDIT_INCL_USERS | If it exists with a value and rdsadmin is part of the included, then it isn't present in SERVER_AUDIT_EXCL_USER, and the value of include is empty. |

> [!IMPORTANT]
> You might need to reboot your instances to apply these changes.
>
> If you're using the default parameter group, Defender for Cloud creates a new parameter group with the required changes and the prefix `defenderfordatabases*`.
>
> If you create a new parameter group or update static parameters, the changes don't take effect until you reboot the instance.

> [!NOTE]
>
> - If a parameter group already exists, it's updated accordingly.
>
> - `MARIADB_AUDIT_PLUGIN` is supported in MariaDB 10.2 and higher, MySQL 8.0.25 and higher 8.0 versions, and All MySQL 5.7 versions.
>
> - Changes that Defender for Cloud makes to the `MARIADB_AUDIT_PLUGIN` for MySQL instances are applied during the next maintenance window. For more information, see [MARIADB_AUDIT_PLUGIN for MySQL instances](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.MySQL.Options.AuditPlugin.html#Appendix.MySQL.Options.AuditPlugin.Add).

## Related content

- [What's supported in Sensitive Data Discovery](concept-data-security-posture-prepare.md#whats-supported)
- [Discovering sensitive data on AWS RDS instances](concept-data-security-posture-prepare.md#discover-and-scan-aws-rds-instances)

## Next step

> [!div class="nextstepaction"]
> [Respond to Defender open-source database alerts](defender-for-databases-usage.md)
