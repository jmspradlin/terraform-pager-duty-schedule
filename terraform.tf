terraform {
  cloud {
    organization = "jeff-spradlin-org"

    workspaces {
      name = "pagerduty-schedule"
    }
  }

  required_providers {
    pagerduty = {
      source  = "pagerduty/pagerduty"
      version = "2.14.3"
    }
  }

  required_version = ">= 1.1.0"
}