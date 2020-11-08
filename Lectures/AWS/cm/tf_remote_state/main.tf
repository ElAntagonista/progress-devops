# The s3 bucket for our infrastructure remote state 
provider aws {
  region = "us-east-1"
}

module "terraform-backend" {
  source              = "github.com/ElAntagonista/tf-rifiniti-modules/common/terraform-aws-rs/"
  s3_bucket_name      = "progres-infra"
  dynamodb_table_name = "progres-infra"
}

output "s3_bucket_domain_name" {
  value = "${module.terraform-backend.s3_bucket_domain_name}"
}

output "s3_bucket_regional_domain_name" {
  value = "${module.terraform-backend.s3_bucket_regional_domain_name}"
}
