workflow "doc test" {
  on = "issue_comment"
  resolves = [
    "Notify Slack",
  ]
}

action "Notify Slack" {
  uses = "Ilshidur/action-slack@5b3a58f5e0ff655ca9c17a22516efdf9d0de36bf"
  needs = "Filter by label"
  secrets = ["SLACK_WEBHOOK"]
  args = "this is a test"
}

action "Filter by label" {
  uses = "actions/bin/filter@c6471707d308175c57dfe91963406ef205837dbd"
  args = "label documentation"
}
