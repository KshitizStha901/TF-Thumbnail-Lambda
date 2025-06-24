# S3 Thumbnail Generator using AWS Lambda and Terraform

This project implements a serverless thumbnail generation system using AWS Lambda and S3. When an image is uploaded to a source S3 bucket, a Lambda function is triggered, which resizes the image using the Pillow library and stores the result in a destination S3 bucket. All infrastructure is provisioned using Terraform.

## Features

- Automatically resizes uploaded images to 50% of original dimensions
- Uses AWS Lambda triggered by S3 object creation
- Output thumbnails are stored in a separate destination bucket
- Infrastructure as Code using Terraform
- Python 3.12 with Pillow
- No Docker packaging required (uses pip with platform targeting)

## Requirements

- AWS account and configured CLI
- Python 3.12
- Terraform

## Setup Instructions

### 1. Install Python Dependencies

Install Pillow in a Lambda-compatible format:

```bash
cd Lambda_Function
pip3 install \
  --platform manylinux2014_x86_64 \
  --target=package \
  --implementation cp \
  --python-version 3.12 \
  --only-binary=:all: pillow


2. Create Lambda Deployment Package
cd package
zip -r9 ../lambda_function.zip .
cd ..
zip -g lambda_function.zip Lambda_function.py


3. Configure Terraform
Edit terraform.tfvars:

source_bucket_name  = "your-source-bucket"
destination_bucket_name = "your-destination-bucket"


4. Deploy with Terraform
cd Terraform
terraform init
terraform apply
Usage

Upload an image file (e.g., .jpg, .png) to the source S3 bucket.
The Lambda function is triggered and resizes the image.
The resized image is saved in the destination bucket with a resized- prefix.
Logs are available in CloudWatch for debugging and verification.
Environment Variables Used in Lambda

SOURCE_BUCKET: the name of the source S3 bucket
DESTINATION_BUCKET: the name of the destination S3 bucket
