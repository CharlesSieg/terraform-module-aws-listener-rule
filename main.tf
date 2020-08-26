resource "aws_lb_listener_rule" "rule" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    target_group_arn = var.tg_arn
    type             = "forward"
  }

  condition {
    field  = var.rule_condition_field
    values = [var.rule_condition_value]
  }
}
