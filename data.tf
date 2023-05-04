data "pagerduty_user" "this" {
  for_each = var.pagerduty_user_existing
  email    = each.value.email
}