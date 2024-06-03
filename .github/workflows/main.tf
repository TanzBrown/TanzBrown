resource "aws_iam_role" "rds_export_import_role" {
  name               = "RDSExportImportRole"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "rds.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "s3_full_access_attachment" {
  name       = "S3FullAccessAttachment"
  roles      = [aws_iam_role.rds_export_import_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
