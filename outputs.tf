output "biglake_hive_tables_id" {
  description = "Map of id values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no id are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.id if v.id != null && length(v.id) > 0 }
}
output "biglake_hive_tables_catalog" {
  description = "Map of catalog values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no catalog are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.catalog if v.catalog != null && length(v.catalog) > 0 }
}
output "biglake_hive_tables_create_time" {
  description = "Map of create_time values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no create_time are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "biglake_hive_tables_database" {
  description = "Map of database values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no database are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.database if v.database != null && length(v.database) > 0 }
}
output "biglake_hive_tables_deletion_policy" {
  description = "Map of deletion_policy values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no deletion_policy are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "biglake_hive_tables_description" {
  description = "Map of description values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no description are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.description if v.description != null && length(v.description) > 0 }
}
output "biglake_hive_tables_last_access_time" {
  description = "Map of last_access_time values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no last_access_time are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.last_access_time if v.last_access_time != null && length(v.last_access_time) > 0 }
}
output "biglake_hive_tables_name" {
  description = "Map of name values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no name are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.name if v.name != null && length(v.name) > 0 }
}
output "biglake_hive_tables_parameters" {
  description = "Map of parameters values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no parameters are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.parameters if v.parameters != null && length(v.parameters) > 0 }
}
output "biglake_hive_tables_partition_keys" {
  description = "Map of partition_keys values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no partition_keys are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.partition_keys if v.partition_keys != null && length(v.partition_keys) > 0 }
}
output "biglake_hive_tables_project" {
  description = "Map of project values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no project are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.project if v.project != null && length(v.project) > 0 }
}
output "biglake_hive_tables_storage_descriptor" {
  description = "Map of storage_descriptor values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no storage_descriptor are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => one(v.storage_descriptor) if v.storage_descriptor != null && length(v.storage_descriptor) > 0 }
}
output "biglake_hive_tables_table_type" {
  description = "Map of table_type values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no table_type are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.table_type if v.table_type != null && length(v.table_type) > 0 }
}
output "biglake_hive_tables_update_time" {
  description = "Map of update_time values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no update_time are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}
output "biglake_hive_tables_view_expanded_text" {
  description = "Map of view_expanded_text values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no view_expanded_text are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.view_expanded_text if v.view_expanded_text != null && length(v.view_expanded_text) > 0 }
}
output "biglake_hive_tables_view_original_text" {
  description = "Map of view_original_text values across all biglake_hive_tables, keyed the same as var.biglake_hive_tables except keys with no view_original_text are omitted"
  value       = { for k, v in google_biglake_hive_table.biglake_hive_tables : k => v.view_original_text if v.view_original_text != null && length(v.view_original_text) > 0 }
}

