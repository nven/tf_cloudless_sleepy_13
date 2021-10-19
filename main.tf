

# Create an IBM Cloud infrastructure SSH key. You can find the SSH key surfaces in the infrastructure console under Devices > Manage > SSH Keys
#resource "ibm_compute_ssh_key" "test_key_1" {
 # label      = "test_key_1"
  #public_key = "var.ssh_public_key"
#}

# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello, I am a template. My sample_var value = $${sample_var} and my sensitive value is = $${sensitive_var} and complex type is $${simple_list_element}"

  vars = {
    sample_var = var.sample_var
    sensitive_var = var.sensitive_var
    simple_list_element = var.complex_type[0]
  }
}

# This is just to make sure that ibm provider is instantiated
/* data "ibm_schematics_workspace" "test" {
  workspace_id = "my-workspace-id"
}
*/

resource "null_resource" "sleep" {
  triggers = {
    uuid = uuid()
  }

  provisioner "local-exec" {
    command = "sleep ${var.sleepy_time}"
  }
}

