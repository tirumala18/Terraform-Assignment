provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_s3_bucket" "s3-bucket-30122021" {
  bucket = "s3-bucket-30122021"
  acl    = "private"
}

resource "aws_iam_user" "user" {
  name ="${var.user_name}"
}
#programmatic access 
resource "aws_iam_policy" "policy_for_s3"{
    name="s3_bucket_policy_for_iam_user_30122021"
    policy =<<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::s3-bucket-30122021"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::s3-bucket-30122021/*"]
    }
  ]
}      
EOF
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.policy_for_s3.arn
}
