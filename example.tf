// example terraform plan

// provider "triton" {
//     account      = "${SDC_ACCOUNT}"
//     key_material = "${file("~/.ssh/id_rsa")}"
//     key_id       = "${SDC_KEY_ID}"
//     url          = "${SDC_URL}"
// }
// export SDC_URL="https://us-east-1.api.joyent.com"

// docker_
provider "docker" {
  // default: DOCKER_HOST
  // default: DOCKER_CERT_PATH
}

resource "docker_image" "alpine" {
  name = "alpine"
}
// docker_container
resource "docker_container" "testcon" {
  image = "${docker_image.alpine.latest}"
  name = "examplecont"
}

// resource "docker_network" "private_network" {
//     name = "my_network"
// }
# Configure the Chef provider
// provider "chef" {
//      server_url = "https://api.chef.io/organizations/example/"
//
//      // You can set up a "Client" within the Chef Server management console.
//      client_name = "terraform"
//      private_key_pem = "${file(\"chef-terraform.pem\")}"
// }

// triton_machine
// resource "triton_machine" "test" {
//     name = "examplemachine"
//     package = "g4-highcpu-128M"
//     image = ""
//     // network = ""
//     nic = [
//       {
//         network = "Test-Fabric"
//         // mac     = ""
//         // ip      = ""
//         // primary = false
//         // gateway = ""
//         // netmask = ""
//         // state   = "running"
//       }
//     ]
//     firewall_enabled = false
//     // user_data = "test.txt"
//     // user_script = "test.sh"
//     // root_authorized_keys = ""
//     tags = {
//         hello = "world"
//         triton.cns.disable = false
//         triton.cns.services = "wwwtest"
//     }
// }
# Configure the Consul provider
provider "consul" {
    address = "status.example.com:8500"
    datacenter = "us-east-1"
}

# Access a key in Consul
// resource "consul_keys" "app" {
//     key {
//         name = "ami"
//         path = "service/app/launch_ami"
//         default = "ami-1234"
//     }
// }

# Use our variable from Consul
// resource "aws_instance" "app" {
//     ami = "${consul_keys.app.var.ami}"
// }
// module "consul" {
//     source = "github.com/hashicorp/consul/terraform/joyent"
//     servers = 5
// }

// * triton_machine.test: failed to create machine with name: example-machine
// caused by: Resource not found https://us-east-1.api.joyent.com/${SDC_ACCOUNT}/machines
// caused by: request "https://us-east-1.api.joyent.com/${SDC_ACCOUNT}/machines" returned unexpected status 404 with body "{\"code\":\"ResourceNotFound\",\"message\":\"/$%7BSDC_ACCOUNT%7D/machines does not exist\"}"
// [Joyent CloudAPI CLI Reference](https://apidocs.joyent.com/cloudapi/#appendix-d-cloudapi-cli-commands)
//
// triton_firewall_rule
// https://docs.joyent.com/public-cloud/network/firewall/cloud-firewall-rules-reference
// resource "triton_firewall_rule" "www" {
//     rule = "FROM any TO tag www ALLOW tcp (PORT 80 AND PORT 443)"
//     enabled = false
// }

// triton_key
// resource "triton_key" "example" {
//     name = "Example Key"
//     key = "${file("~/.ssh/id_rsa")}"
// }


//
//
// name - (string) The friendly name for the machine. Triton will generate a name if one is not specified.
//
// tags - (map) A mapping of tags to apply to the machine.
//
// package - (string, Required) The name of the package to use for provisioning.
//
// image - (string, Required) The UUID of the image to provision.
//
// networks - (list of string) A list of the IDs of the desired networks for the machine.
//
// firewall_enabled - (boolean) Default: false Whether the cloud firewall should be enabled for this machine.
//
// root_authorized_keys - (string) The public keys authorized for root access via SSH to the machine.
//
// user_data - (string) Data to be copied to the machine on boot.
//
// user_script - (string) The user script to run on boot (every boot on SmartMachines).
//
// administrator_pw - (string) The initial password for the Administrator user. Only used for Windows virtual machines.
//
// Attribute Reference
//
// The following attributes are exported:
//
// id - (string) - The identifier representing the firewall rule in Triton.
// type - (string) - The type of the machine (smartmachine or virtualmachine).
// state - (string) - The current state of the machine.
// dataset - (string) - The dataset URN with which the machine was provisioned.
// memory - (int) - The amount of memory the machine has (in Mb).
// disk - (int) - The amount of disk the machine has (in Gb).
// ips - (list of strings) - IP addresses of the machine.
// primaryip - (string) - The primary (public) IP address for the machine.
// created - (string) - The time at which the machine was created.
// updated - (string) - The time at which the machine was last updated.



// provider "aws" {
//   access_key = "ACCESS_KEY_HERE"
//   secret_key = "SECRET_KEY_HERE"
//   region     = "us-east-1"
// }
//
// resource "aws_instance" "example" {
//   ami           = "ami-0d729a60"
//   instance_type = "t2.micro"
// }
// $ TF_VAR_somemap='{foo = "bar", baz = "qux"}' terraform plan
//
