provider "google" {
  region = var.region
}

resource "random_id" "id" {
  byte_length = 4
  prefix      = var.project_name
}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = random_id.id.hex
  billing_account = var.billing_account
  org_id          = var.org_id
}

resource "google_project_service" "service" {
  for_each = toset([
    "compute.googleapis.com",
    "appengine.googleapis.com",
    "containerregistry.googleapis.com"
  ])

  service = each.key

  project            = google_project.project.project_id
  disable_on_destroy = false
}

resource "google_app_engine_application" "app" {
  project     = google_project.project.project_id
  location_id = var.region
}

output "project_id" {
  value = google_project.project.project_id
}

output "project_name" {
  value = google_project.project.name
}

output "gcr_domain" {
  value = google_app_engine_application.app.gcr_domain
}

output "app_hostname" {
  value = google_app_engine_application.app.default_hostname
}

output "app_id" {
  value = google_app_engine_application.app.app_id
}
