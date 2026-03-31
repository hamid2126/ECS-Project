terraform {
  backend "s3" {
    bucket       = "hamid-ecs-bucket"
    key          = "terraform.tfstate"
    region       = "eu-north-1"
    use_lockfile = "true"
  }
}
