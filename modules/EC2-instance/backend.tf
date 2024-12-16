terraform {
  backend "s3" {
    bucket = "hermex-bucket"
    key = "staging/ec2.tfstate"
    region = "us-east-1"
    #dynamodb_table = "hermex_state_lock_table"
    encrypt = true
  }
}