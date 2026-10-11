resource "google_biglake_hive_table" "biglake_hive_tables" {
  for_each = var.biglake_hive_tables

  catalog            = each.value.catalog
  database           = each.value.database
  name               = each.value.name
  deletion_policy    = each.value.deletion_policy
  description        = each.value.description
  parameters         = each.value.parameters
  project            = each.value.project
  view_expanded_text = each.value.view_expanded_text
  view_original_text = each.value.view_original_text

  storage_descriptor {
    bucket_cols = each.value.storage_descriptor.bucket_cols
    dynamic "columns" {
      for_each = each.value.storage_descriptor.columns
      content {
        comment = columns.value.comment
        name    = columns.value.name
        type    = columns.value.type
      }
    }
    compressed    = each.value.storage_descriptor.compressed
    input_format  = each.value.storage_descriptor.input_format
    location_uri  = each.value.storage_descriptor.location_uri
    num_buckets   = each.value.storage_descriptor.num_buckets
    output_format = each.value.storage_descriptor.output_format
    parameters    = each.value.storage_descriptor.parameters
    dynamic "serde_info" {
      for_each = each.value.storage_descriptor.serde_info != null ? [each.value.storage_descriptor.serde_info] : []
      content {
        description        = serde_info.value.description
        deserializer_class = serde_info.value.deserializer_class
        name               = serde_info.value.name
        parameters         = serde_info.value.parameters
        serde_type         = serde_info.value.serde_type
        serialization_lib  = serde_info.value.serialization_lib
        serializer_class   = serde_info.value.serializer_class
      }
    }
    dynamic "skewed_info" {
      for_each = each.value.storage_descriptor.skewed_info != null ? [each.value.storage_descriptor.skewed_info] : []
      content {
        skewed_col_names = skewed_info.value.skewed_col_names
        dynamic "skewed_col_values" {
          for_each = skewed_info.value.skewed_col_values
          content {
            values = skewed_col_values.value.values
          }
        }
        dynamic "skewed_key_values_locations" {
          for_each = skewed_info.value.skewed_key_values_locations
          content {
            location = skewed_key_values_locations.value.location
            values   = skewed_key_values_locations.value.values
          }
        }
      }
    }
    dynamic "sort_cols" {
      for_each = each.value.storage_descriptor.sort_cols != null ? each.value.storage_descriptor.sort_cols : []
      content {
        col   = sort_cols.value.col
        order = sort_cols.value.order
      }
    }
    stored_as_sub_dirs = each.value.storage_descriptor.stored_as_sub_dirs
  }

  dynamic "partition_keys" {
    for_each = each.value.partition_keys != null ? each.value.partition_keys : []
    content {
      comment = partition_keys.value.comment
      name    = partition_keys.value.name
      type    = partition_keys.value.type
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

