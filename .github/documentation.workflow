workflow "New workflow" {
  on = "pull_request"
  resolves = ["GitHub Action for Slack"]
}

action "GitHub Action for Slack" {
  uses = "Ilshidur/action-slack@5b3a58f5e0ff655ca9c17a22516efdf9d0de36bf"
  args = "Workflow was triggered"
  secrets = ["SLACK_WEBHOOK"]
}
