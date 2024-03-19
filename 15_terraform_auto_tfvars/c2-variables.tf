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
  default     = "East US"
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