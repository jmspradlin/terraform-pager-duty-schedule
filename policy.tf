# This is an opinionated escalation policy set for P1-P4 events, with higher level incidents producing shorter escalation
# periods and higher level of escalation. This is opinionated and should be modified to meet your team structure, on-call teams
# uptime requirements, SLAs, and other SRE patterns.
resource "pagerduty_escalation_policy" "p1" {
  name  = "Example P1 Escalation Policy"
  teams = [pagerduty_team.this.id]

  rule { ## On-Call
    escalation_delay_in_minutes = 3
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.this.id
    }
  }
  rule { ## Team
    escalation_delay_in_minutes = 3
    dynamic "target" {
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
  }
  rule { ## Team + Managers
    escalation_delay_in_minutes = 3
    dynamic "target" { # Team
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
    dynamic "target" { # Managers
      for_each = pagerduty_user.manager
      type     = "user_reference"
      id       = each.value.id
    }
  }
  rule { ## Team + Managers + Product Owner
    escalation_delay_in_minutes = 3
    dynamic "target" { # Team
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
    dynamic "target" { # Managers
      for_each = pagerduty_user.manager
      type     = "user_reference"
      id       = each.value.id
    }
    target { # Product Owner
      type = "user_reference"
      id   = pagerduty_user.product_owner.id
    }
  }
  rule { ## All Hands
    escalation_delay_in_minutes = 3
    dynamic "target" { # Team
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
    dynamic "target" { # Managers
      for_each = pagerduty_user.manager
      type     = "user_reference"
      id       = each.value.id
    }
    target { # Product Owner
      type = "user_reference"
      id   = pagerduty_user.product_owner.id
    }
    target { # Director
      type = "user_reference"
      id   = pagerduty_user.director.id
    }
  }
}

resource "pagerduty_escalation_policy" "p2" {
  name  = "Example P2 Escalation Policy"
  teams = [pagerduty_team.this.id]

  rule { ## On-Call
    escalation_delay_in_minutes = 5
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.this.id
    }
  }
  rule { ## Team
    escalation_delay_in_minutes = 5
    dynamic "target" {
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
  }
  rule { ## Team + Managers
    escalation_delay_in_minutes = 5
    dynamic "target" { # Team
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
    dynamic "target" { # Managers
      for_each = pagerduty_user.manager
      type     = "user_reference"
      id       = each.value.id
    }
  }
  rule { ## Team + Managers + Product Owner
    escalation_delay_in_minutes = 5
    dynamic "target" { # Team
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
    dynamic "target" { # Managers
      for_each = pagerduty_user.manager
      type     = "user_reference"
      id       = each.value.id
    }
    target { # Product Owner
      type = "user_reference"
      id   = pagerduty_user.product_owner.id
    }
  }
  rule { ## All Hands
    escalation_delay_in_minutes = 5
    dynamic "target" { # Team
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
    dynamic "target" { # Managers
      for_each = pagerduty_user.manager
      type     = "user_reference"
      id       = each.value.id
    }
    target { # Product Owner
      type = "user_reference"
      id   = pagerduty_user.product_owner.id
    }
    target { # Director
      type = "user_reference"
      id   = pagerduty_user.director.id
    }
  }
}

resource "pagerduty_escalation_policy" "p3" {
  name  = "Example P3 Escalation Policy"
  teams = [pagerduty_team.this.id]

  rule { ## On-Call
    escalation_delay_in_minutes = 10
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.this.id
    }
  }
  rule { ## Team
    escalation_delay_in_minutes = 10
    dynamic "target" {
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
  }
  rule { ## Team + Managers
    escalation_delay_in_minutes = 15
    dynamic "target" { # Team
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
    dynamic "target" { # Managers
      for_each = pagerduty_user.manager
      type     = "user_reference"
      id       = each.value.id
    }
  }
  rule { ## Team + Managers + Product Owner
    escalation_delay_in_minutes = 15
    dynamic "target" { # Team
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
    dynamic "target" { # Managers
      for_each = pagerduty_user.manager
      type     = "user_reference"
      id       = each.value.id
    }
    target { # Product Owner
      type = "user_reference"
      id   = pagerduty_user.product_owner.id
    }
  }
}

resource "pagerduty_escalation_policy" "p4" {
  name  = "Example P4 Escalation Policy"
  teams = [pagerduty_team.this.id]

  rule { ## On-Call
    escalation_delay_in_minutes = 30
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.this.id
    }
  }
  rule { ## Team
    escalation_delay_in_minutes = 30
    dynamic "target" {
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
  }
  rule { ## Team + Managers
    escalation_delay_in_minutes = 30
    dynamic "target" { # Team
      for_each = pagerduty_user.responder
      type     = "user_reference"
      id       = each.value.id
    }
    dynamic "target" { # Managers
      for_each = pagerduty_user.manager
      type     = "user_reference"
      id       = each.value.id
    }
  }
}