workflow "doc test" {
  resolves = [
    "Notify: End",
    "Create an issue",
  ]
  on = "issues"
}

action "Notify: End" {
  uses = "Ilshidur/action-slack@5b3a58f5e0ff655ca9c17a22516efdf9d0de36bf"
  needs = "Ensure documentation label"
  secrets = ["SLACK_WEBHOOK"]
  args = "An issue was assigned the \"documentation\" label."
}

action "Ensure documentation label" {
  uses = "actions/bin/filter@c6471707d308175c57dfe91963406ef205837dbd"
  args = "label documentation"
  needs = "Ensure closed pull request"
}

action "Ensure closed pull request" {
  uses = "actions/bin/filter@master"
  args = "action labeled"
}

action "Create an issue" {
  uses = "JasonEtco/create-an-issue@11c8e67a9a77b755021d8349484be7dd2c3092ce"
  needs = ["Ensure documentation label"]
  secrets = ["GITHUB_TOKEN"]
  args = ".github/documentation-issue-template.md"
}
