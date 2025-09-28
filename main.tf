terraform {
  required_version = ">= 1.0.0"

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0.0"
    }
  }
}

provider "null" {}

resource "null_resource" "example" {
  # Using a trigger ensures the null_resource will run whenever the trigger value changes.
  # timestamp() makes it run on each plan/apply (useful for demos; remove/change for idempotence).
  triggers = {
    run_id = timestamp()
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command = <<EOT
      echo "Hello from Terraform Cloud run at $(date +'%Y-%m-%d %H:%M:%S')" > hello_from_tf_cloud.txt
      echo "Wrote hello_from_tf_cloud.txt in the run workspace"
    EOT
  }
}

output "result_note" {
  value = "The null_resource ran and attempted to write hello_from_tf_cloud.txt inside the run container. Files are ephemeral in Terraform Cloud runs."
}
