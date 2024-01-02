# iam.tf

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role_policy_attachment" "dynamodb_access" {
  role = aws_iam_role.iam_lambda.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_role" "iam_lambda" {
  name               = var.iam_lambda
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
