terraform {
  cloud {
    organization = "your-organization"
    workspaces {
      tags = ["tfc-config"]
    }
  }
}   

provider "tfe" {
  token = var.tfc_token
}

resource "tfe_workspace" "iam_demo_reg1" {
  name              = "iam-demo-reg1"
  organization      = var.org
  auto_apply        = true
  queue_all_runs    = false
  // working_directory = "tf/iam-demo"
}

resource "tfe_variable" "wks_region1" {
  key          = "region"
  value        = var.aws_regions[0]
  category     = "terraform"
  workspace_id = tfe_workspace.iam_demo_reg1.id
  sensitive    = false
}

resource "tfe_variable" "aws_access_key_iam_demo_reg1" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key
  category     = "env"
  workspace_id = tfe_workspace.iam_demo_reg1.id
  sensitive    = true
}

resource "tfe_variable" "aws_secret_access_iam_demo_reg1" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_id
  category     = "env"
  workspace_id = tfe_workspace.iam_demo_reg1.id
  sensitive    = true
}

resource "tfe_workspace" "iam_demo_reg2" {
  name              = "iam-demo-reg2"
  organization      = var.org
  auto_apply        = true
  queue_all_runs    = false
  // working_directory = "tf/iam-demo"
}

resource "tfe_variable" "wks_region2" {
  key          = "region"
  value        = var.aws_regions[1]
  category     = "terraform"
  workspace_id = tfe_workspace.iam_demo_reg2.id
  sensitive    = false
}

resource "tfe_variable" "aws_access_key_iam_demo_reg2" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key
  category     = "env"
  workspace_id = tfe_workspace.iam_demo_reg2.id
  sensitive    = true
}

resource "tfe_variable" "aws_secret_access_iam_demo_reg2" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_id
  category     = "env"
  workspace_id = tfe_workspace.iam_demo_reg2.id
  sensitive    = true
}
