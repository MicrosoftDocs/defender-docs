---  
title: Troubleshoot notebooks on the Microsoft Sentinel data lake
titleSuffix: Microsoft Security  
description: Find solutions for common errors when working with Jupyter notebooks in the Microsoft Sentinel data lake, including database, table, authorization, and ingestion errors.
author: EdB-MSFT  
ms.author: edbaynash 
ms.topic: troubleshooting  
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.date: 04/27/2026
ai-usage: ai-assisted

# Customer intent: As a security engineer or data scientist, I want to troubleshoot common errors when working with Jupyter notebooks in the Microsoft Sentinel data lake so that I can quickly resolve issues and continue my analysis.
---

# Troubleshoot notebooks on the Microsoft Sentinel data lake

This article lists common errors you might encounter when working with Jupyter notebooks in the Microsoft Sentinel data lake, their root causes, and suggested actions to resolve them.

For information on running notebooks, see [Run notebooks on the Microsoft Sentinel data lake](notebooks.md).

## Common errors

The following table lists common errors, their error codes, and suggested actions to resolve them.

Error Category|Error Name|Error Code| Error Message |Suggested Action|
---|---|---|---|---|
DatabaseError|DatabaseNotFound|2001|Database {DatabaseName} not found.|Verify that the database exists. If the database is new, wait for a metadata refresh.|
DatabaseError|AmbiguousDatabaseName|2002|Several databases (IDs: {DatabaseID1}, {DatabaseID2}, ...) share the name {DatabaseName}. Provide a specific database ID.|Specify a database ID when multiple databases have the same name.|
DatabaseError|DatabaseIdMismatch|2003|Database ({DatabaseName}, ID {DatabaseID}) not found.|Check both the database name and ID. To obtain database IDs, list all the databases.|
DatabaseError|ListDatabasesFailure|2004|Can't fetch databases. Restart the session and try again.|Restart the session and retry the operation after a few minutes. |
TableError|TableDoesNotExist|2100|Table {TableName} not found in the database {DatabaseName}.|Verify that the table exists in the database. If the table or database is new, wait a few minutes and try again.|
TableError|ProvisioningIncomplete|2101|Table {TableName} is not ready. Wait a few minutes before trying again.|The table is being provisioned. Wait a few minutes before trying again.|
TableError|DeltaTableMissing|2102|Table {TableName} is empty. New tables can take up to a few hours to be ready.|It can take a few hours to fully synchronize an analytics table into the data lake. For tables that are only in the data lake, check if the data needs to be loaded or restored.|
TableError|TableDoesNotExistForDelete|2103|Can't delete table. Table {TableName} not found.|Verify that the table exists in the database. If the table or database is new, wait a few minutes and try again.|
AuthorizationFailure|MissingSASToken|2201|Can't access table. Restart the session and try again.|Authorization failed while trying to fetch the access token for the table. Restart the session and try again.|
AuthorizationFailure|InvalidSASToken|2202|Can't access table. Restart the session and try again.|Authorization failed while trying to fetch the access token for the table. Restart the session and try again.|
AuthorizationFailure|TokenExpired|2203|Can't access table. Restart the session and try again.|Authorization failed while trying to fetch the access token for the table. Restart the session and try again.|
AuthorizationFailure|TableInsufficientPermissions|2204|Access needed for the table {TableName} in the database {DatabaseName}.|Contact an administrator to request access to the table or the database (workspace).|
AuthorizationFailure|InternalTableAccessDenied|2205|Access to the table {TableName} is restricted.|Only system or user-defined tables can be accessed from a notebook.|
AuthorizationFailure|TableAuthFailure|2206|Can't save data to the table. Restart the session and try again.|Authorization failed while trying to save data to the table. Restart the session and try again.|
ConfigurationError|HadoopConfigFailure|2301|Can't update session configuration. Restart the session and try again.|This problem is transient and can be resolved by restarting the session and trying again. If this problem persists, contact support.|
DataError|JsonParsingFailure|2302|Table metadata has been corrupted. Contact support for assistance.|Contact support for assistance. Provide your tenant ID, the table name, and the database name.|
TableSchemaError|TableSchemaMismatch|2401|Column not found in the destination table. Align the DataFrame schema and the destination table or use overwrite mode.|Update the DataFrame schema to match the table in your target database. You can also replace the table entirely in overwrite mode.|
TableSchemaError|MissingRequiredColumns|2402|Column {ColumnName} is missing from the DataFrame. Check the DataFrame schema and align it with the destination table.|Update the DataFrame schema to match the table in your target database. You can also replace the table entirely in overwrite mode.|
TableSchemaError|ColumnTypeChangeNotAllowed|2403|Can't change the data type of the column {ColumnName}.|A data type change is not allowed for the column. Check existing columns in the destination table and align all data types in the DataFrame.|
TableSchemaError|ColumnNullabilityChangeNotAllowed|2404|Can't change nullability of the column {ColumnName}.|Can't update nullability settings of the column. Check the destination table and align the settings with the DataFrame.|
IngestionError|FolderCreationFailure|2501|Can't create storage for the table {TableName}.|This problem is transient and can be resolved by restarting the session and trying again. If this problem persists, contact support.|
IngestionError|SubJobRequestFailure|2502|Can't create ingestion job for the table {TableName}.|This problem is transient and can be resolved by restarting the session and trying again. If this problem persists, contact support.|
IngestionError|SubJobCreationFailure|2503|Can't create ingestion job for the table {TableName}.|This problem is transient and can be resolved by restarting the session and trying again. If this problem persists, contact support.|
InputError|InvalidWriteMode|2601|Invalid write mode. Use append or overwrite.|Specify a valid write mode (append or overwrite) before saving the DataFrame.|
InputError|PartitioningNotAllowed|2602|Can't partition analytics tables.|Remove any partitioning for all columns in analytics tables.|
InputError|MissingTableSuffixLake|2603|Invalid custom table name. All names of custom tables in the data lake must end with _SPRK.|Add _SPRK as a suffix to the table name before writing it to the data lake.|
InputError|MissingTableSuffixLA|2604|Invalid custom table name. All names of custom analytics tables must end with _SPRK_CL. |Add _SPRK_CL as a suffix to the table name before writing it to analytics storage.|
UnknownError|InternalServerError|2901|Something went wrong. Restart the session and try again.|This problem is transient and can be resolved by restarting the session and trying again. If this problem persists, contact support.|

> [!NOTE]
> Querying legacy tables such as AzureDiagnostics is not supported.

## Related content

- [Run notebooks on the Microsoft Sentinel data lake](./notebooks.md)
- [Create and manage notebook jobs](./notebook-jobs.md)
- [Sample notebooks for Microsoft Sentinel data lake](./notebook-examples.md)
- [Microsoft Sentinel Provider class reference](./sentinel-provider-class-reference.md)
- [Microsoft Sentinel data lake overview](./sentinel-lake-overview.md)
