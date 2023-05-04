resource "pagerduty_service" "p1" {
  name                    = "Example Web App - P1"
  auto_resolve_timeout    = null
  acknowledgement_timeout = null
  escalation_policy       = pagerduty_escalation_policy.p1.id
  alert_creation          = "create_alerts_and_incidents"
}

resource "pagerduty_service" "p2" {
  name                    = "Example Web App - P2"
  auto_resolve_timeout    = null
  acknowledgement_timeout = null
  escalation_policy       = pagerduty_escalation_policy.p2.id
  alert_creation          = "create_alerts_and_incidents"
}

resource "pagerduty_service" "p3" {
  name                    = "Example Web App - P3"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.p3.id
  alert_creation          = "create_alerts_and_incidents"
}

resource "pagerduty_service" "p4" {
  name                    = "Example Web App - P4"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.p4.id
  alert_creation          = "create_alerts_and_incidents"
}