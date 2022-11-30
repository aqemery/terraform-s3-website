data "archive_file" "zip" {
  type        = "zip"
  output_path = "lambda_zip_file_int_1.zip"
  source {
    content  = file("../lambdas/origin-request.py")
    filename = "origin-request.py"
  }
}

resource "aws_lambda_function" "origin_request" {
  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256
  handler          = "origin-request.lambda_handler"

  function_name = "${var.prefix}-origin_request"

  runtime = "python3.9"

  role    = aws_iam_role.lambda_edge_exec.arn
  publish = true
}
