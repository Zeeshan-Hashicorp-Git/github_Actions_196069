terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.4"
    }
  }
}

provider "null" {
  # Configuration options
}



resource "null_resource" "null_resource_1" {
echo "Hello World !"
}
