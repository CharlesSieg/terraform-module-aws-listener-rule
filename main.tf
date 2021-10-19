locals {
  conditions = [{
    field  = var.rule_condition_field,
    values = [var.rule_condition_value]
  }]
}

resource "aws_lb_listener_rule" "rule" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    target_group_arn = var.tg_arn
    type             = "forward"
  }

  condition {
    dynamic "host_header" {
      for_each = { for i in local.conditions : i.field => i if i.field == "host-header" }
      content {
        values = host_header.value["values"]
      }
    }
    dynamic "path_pattern" {
      for_each = { for i in local.conditions : i.field => i if i.field == "path-pattern" }
      content {
        values = path_pattern.value["values"]
      }
    }
  }
}
