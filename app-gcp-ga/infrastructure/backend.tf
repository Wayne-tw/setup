terraform {
  backend "gcs" {
    bucket = "<BUCKET NAME- TERRAFORM USER>"
    prefix = "<STATE LOCATION- terraform/[appname]state>"
  }
}
