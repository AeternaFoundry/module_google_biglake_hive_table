variable "biglake_hive_tables" {
  description = <<EOT
Map of biglake_hive_tables, attributes below
Required:
    - catalog
    - database
    - name
    - storage_descriptor (block):
        - bucket_cols (optional)
        - columns (required, block):
            - comment (optional)
            - name (required)
            - type (required)
        - compressed (optional)
        - input_format (optional)
        - location_uri (optional)
        - num_buckets (optional)
        - output_format (optional)
        - parameters (optional)
        - serde_info (optional, block):
            - description (optional)
            - deserializer_class (optional)
            - name (required)
            - parameters (optional)
            - serde_type (optional)
            - serialization_lib (required)
            - serializer_class (optional)
        - skewed_info (optional, block):
            - skewed_col_names (required)
            - skewed_col_values (required, block):
                - values (required)
            - skewed_key_values_locations (required, block):
                - location (required)
                - values (required)
        - sort_cols (optional, block):
            - col (required)
            - order (required)
        - stored_as_sub_dirs (optional)
Optional:
    - deletion_policy
    - description
    - parameters
    - project
    - view_expanded_text
    - view_original_text
    - partition_keys (block):
        - comment (optional)
        - name (required)
        - type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    catalog            = string
    database           = string
    name               = string
    deletion_policy    = optional(string)
    description        = optional(string)
    parameters         = optional(map(string))
    project            = optional(string)
    view_expanded_text = optional(string)
    view_original_text = optional(string)
    storage_descriptor = object({
      bucket_cols = optional(list(string))
      columns = list(object({
        comment = optional(string)
        name    = string
        type    = string
      }))
      compressed    = optional(bool)
      input_format  = optional(string)
      location_uri  = optional(string)
      num_buckets   = optional(number)
      output_format = optional(string)
      parameters    = optional(map(string))
      serde_info = optional(object({
        description        = optional(string)
        deserializer_class = optional(string)
        name               = string
        parameters         = optional(map(string))
        serde_type         = optional(string)
        serialization_lib  = string
        serializer_class   = optional(string)
      }))
      skewed_info = optional(object({
        skewed_col_names = list(string)
        skewed_col_values = list(object({
          values = list(string)
        }))
        skewed_key_values_locations = list(object({
          location = string
          values   = list(string)
        }))
      }))
      sort_cols = optional(list(object({
        col   = string
        order = number
      })))
      stored_as_sub_dirs = optional(bool)
    })
    partition_keys = optional(list(object({
      comment = optional(string)
      name    = string
      type    = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.biglake_hive_tables : (
        length(v.storage_descriptor.columns) >= 1
      )
    ])
    error_message = "Each columns list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.biglake_hive_tables : (
        v.storage_descriptor.skewed_info == null || (length(v.storage_descriptor.skewed_info.skewed_col_values) >= 1)
      )
    ])
    error_message = "Each skewed_col_values list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.biglake_hive_tables : (
        v.storage_descriptor.skewed_info == null || (length(v.storage_descriptor.skewed_info.skewed_key_values_locations) >= 1)
      )
    ])
    error_message = "Each skewed_key_values_locations list must contain at least 1 items"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

