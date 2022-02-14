terraform {
  
  cloud {
    organization = "your_organization"
    workspaces {
      name = "iam-demo"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.24.1"
    }
  }
}

provider "aws" {
  region = var.region
}


resource "aws_iam_policy" "policy" {
  name = "iam-policy-sqs-demo"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:*",
        ]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })

}

resource "aws_iam_role" "test_role" {
  name = "iam-role-sqs-demo"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "sqs.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_sqs_queue" "terraform_queue" {
  name                      = "iam-demo-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

}
