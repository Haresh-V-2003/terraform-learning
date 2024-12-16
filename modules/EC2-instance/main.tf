provider "aws" {
  region = "us-east-1"  # Set the AWS region to us-east-1
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-005fc0f236362e99f"  # Example AMI ID for Amazon Linux 2 in us-east-1 (update with your preferred AMI)
  instance_type = "t2.micro"  # Set the instance type to t2.micro

  tags = {
    Name = "my-ec2-instance"
  }
}
