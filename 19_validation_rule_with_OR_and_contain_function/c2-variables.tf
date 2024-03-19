# Input Variable

# 1. Business Unit Name
variable "business_unit" {
  description = "Business unit name"
  type        = string
  default     = "hr"
}

# 2. Environment 
variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "dev"
}

# 3. Resource Group name
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "myrg"
}

# 4. Resource Group Location 
variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
  default     = "eastus"
  validation {
    # condition = var.resource_group_location == "eastus" || var.resource_group_location == "eastus2"
    # condition = contains(["eastus", "eastus2"], var.resource_group_location)
    # error_message = "Location should be eastus or eastus2"
    condition = can(regex("india$", var.resource_group_location))
    error_message = "only india location is allowed"  
  }
}

# 5. Virtual network name
variable "virtual_network_name" {
  description = "virtual network name"
  type        = string
  default     = "vnet-sales-dev"
}

# 6. Subnet Name: Assign when prompted using CLI
variable "subnet_name" {
  description = "subnet name"
  type        = string
}

# 7. Virtual network address space
variable "virtual_network_address_space" {
  description = "cirtual network address space"
  type        = list(string)
  default     = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
}

# public ip SKU
variable "public_ip_sku" {
  description = "Azure public IP Address SKU"
  type        = map(string)
  default = {
    "eastus"  = "Basic",
    "eastus2" = "Standard"
  }
}

# 9. Common tags
variable "common_tags" {
  description = "common tags for azure resource"
  type        = map(string)
  default = {
    "CLITool" = "terraform",
    "Tag1"    = "Azure"
  }
}