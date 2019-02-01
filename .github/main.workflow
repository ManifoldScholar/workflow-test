workflow "doc test" {
  on = "pull_request"
  resolves = [
    "Notify: Start
    "Notify: End",
  ]
}

action "Notify: Start" {
  uses = "Ilshidur/action-slack@5b3a58f5e0ff655ca9c17a22516efdf9d0de36bf"
  secrets = ["SLACK_WEBHOOK"]
  args = "Action was triggered"
}

action "Notify: End" {
  uses = "Ilshidur/action-slack@5b3a58f5e0ff655ca9c17a22516efdf9d0de36bf"
  needs = "Ensure documentation label"
  secrets = ["SLACK_WEBHOOK"]
  args = "this is a test"
}

action "Ensure documentation label" {
  uses = "actions/bin/filter@c6471707d308175c57dfe91963406ef205837dbd"
  args = "label documentation"
  needs = "Ensure closed pull request"
}

action "Ensure closed pull request" {
  uses = "actions/bin/filter@master"
  args = "action closed"
}
