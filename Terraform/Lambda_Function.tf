resource "aws_lambda_function" "thumbnail_generator" {
  function_name = "s3-thumbnail-generator"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "Lambda_function.lambda_handler"
  runtime       = "python3.12"
  filename      = "${path.module}/../Lambda_Function/lambda_function.zip"
  source_code_hash = filebase64sha256("${path.module}/../Lambda_Function/lambda_function.zip")

  environment {
    variables = {
      SOURCE_BUCKET      = var.source_bucket_name
      DESTINATION_BUCKET = var.destination_bucket_name
    }
  }

  depends_on = [aws_iam_role_policy_attachment.lambda_policy]
}