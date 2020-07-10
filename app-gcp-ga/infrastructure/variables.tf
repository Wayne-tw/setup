variable project_name {
  description = "The project name to deploy to"
  default     = "<APP NAME>"
}

variable billing_account {
  description = "The billing account"
  default     = "<RUN gcloud beta billing accounts list>"
}

variable org_id {
  description = "The org id"
  default     = "<RUN gcloud organizations list>"
}

variable region {
  description = "Region for cloud resources."
  default     = "europe-west2"
}

variable zone {
  description = "Zone for managed instance groups."
  default     = "europe-west2-c"
}
