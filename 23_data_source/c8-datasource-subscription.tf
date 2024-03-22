data "azurerm_subscription" "current" {
  
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

output "current_subscription_id" {
  value = data.azurerm_subscription.current.id
}

output "current_subscription_spending_limit" {
  value = data.azurerm_subscription.current.spending_limit
}