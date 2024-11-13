#create iam role
resource "aws_iam_role" "ec2_s3_access_role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = var.iam_role_service
        }
      }
    ]
  })

  tags = {
    env  = var.Env
    team = var.Team
  }
}

#create policy and give it FullAccess at all bucket 
resource "aws_iam_policy" "s3_full_access_policy" {
  name        = var.iam_policy_name
  description = var.description

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

# # use this block if you want to restrict access policy and accessed to special bucket
# resource "aws_iam_policy" "s3_bucket_access_policy" {
#   name        = "S3BucketAccessPolicy"
#   description = "Policy to allow access to a specific S3 bucket from EC2 instances"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = [
#           "s3:ListBucket"
#         ],
#         Effect   = "Allow",
#         Resource = "arn:aws:s3:::your-bucket-name"  # Replace with your bucket name
#       },
#       {
#         Action = [
#           "s3:GetObject",
#           "s3:PutObject"
#         ],
#         Effect   = "Allow",
#         Resource = "arn:aws:s3:::your-bucket-name/*"  # Replace with your bucket name
#       }
#     ]
#   })
# }

## Attach the policy to the Role
resource "aws_iam_role_policy_attachment" "ec2_s3_policy_attachment" {
  role       = aws_iam_role.ec2_s3_access_role.name
  policy_arn = aws_iam_policy.s3_full_access_policy.arn 
}

## create an instance profile for the Iam Role
resource "aws_iam_instance_profile" "ec2_s3_instance_profile" {
  name = var.aws_iam_instance_profile_name
  role = aws_iam_role.ec2_s3_access_role.name
}

