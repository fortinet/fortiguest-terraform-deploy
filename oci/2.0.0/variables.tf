// OCI configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "compartment_ocid" {}
variable "region" {}

variable "app_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaanvadbqcdfhmdezf4lly44xokjr22sgxavk332sv5kdtqidw3jaua" //2.0.0
}

variable "app_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaaqfyy5cfyecks3kdnvolaku6lwtl76zaqhbsgdot4jyrpw3mkqera" //2.0.0
}

// Version
variable "app_listing_resource_version" {
  default = "2.0.0"
}

// Environment configuration
variable "vcn_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.1.0.0/24"
}

variable "x86" {
  type    = bool
  default = true
}

// instance shape
variable "instance_shape" {
  type    = string
  default = "VM.Standard.E4.Flex" //x86
}

// instance cpu
variable "instance_cpu" {
  type    = string
  default = "4"
}

// instance memory
variable "instance_memory" {
  type    = string
  default = "16"
}

# Choose an Availability Domain (1,2,3)
variable "availability_domain" {
  type    = string
  default = "1"
}

variable "volume_size" {
  type    = string
  default = "100" //GB; Secondary Data Disk
}
