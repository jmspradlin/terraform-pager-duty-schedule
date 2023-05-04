resource "pagerduty_user" "responder" {
  for_each = var.pagerduty_user

  name      = each.value.name
  email     = each.value.email
  role      = each.value.role
  job_title = each.value.job_title
  time_zone = each.value.time_zone
}

resource "pagerduty_user" "manager" {
  for_each = var.pagerduty_manager

  name      = each.value.name
  email     = each.value.email
  role      = each.value.role
  job_title = each.value.job_title
  time_zone = each.value.time_zone
}

resource "pagerduty_user" "product_owner" {
  name  = var.product_owner.name
  email = var.product_owner.email
}

resource "pagerduty_user" "director" {
  name  = var.director.name
  email = var.director.email
}

resource "pagerduty_team" "this" {
  name        = var.pagerduty_team
  description = ""
}

resource "pagerduty_team_membership" "this" {
  for_each = pagerduty_user.responder
  user_id  = each.value.id
  team_id  = pagerduty_team.this.id
  role     = "responder"
}

resource "pagerduty_schedule" "this" {
  for_each  = var.schedule
  name      = each.value.name
  time_zone = each.value.time_zone

  layer {
    name                         = each.value.layer_name
    start                        = each.value.start
    rotation_virtual_start       = each.value.rotation_virtual_start
    rotation_turn_length_seconds = each.value.rotation_turn_length_seconds
    users                        = ["${pagerduty_user.responder[*].id}"]
  }

  teams = [pagerduty_team.this.id]
}