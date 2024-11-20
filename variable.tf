variable "resource_group_name" {
  default = "brief4_g3"
}

variable "localisation" {
  default = "eastus"
}

variable "vnet_name" {
  default = "vnet_brief4_g3"
}

variable "subnet_bastion" {
  default = "AzureBastionSubnet"
}

variable "subnet_gateway" {
  default = "subnet_gateway"
}

variable "subnet_vm" {
  default = "subnet_jenkins"
}

variable "ip_bastion" {
  default = "IP_publique_bastion"
}

variable "ip_gateway" {
  default = "IP_publique_gateway"
}

variable "bastion" {
  default = "bastion_brief4_g3"
}

variable "DNS_bastion"{
    default = "dns-g3"
}

variable "DNS_gateway"{
    default = "dns-gateway-g3"
}

variable "VM-nic"{
    default = "vm-nic"
}

variable "config_vm"{
    default = "ip_config_nic"
}

variable "VM_name"{
    default = "VM_g3"
}

variable "computerVM_name"{
    default = "VMg3"
}

variable "admin"{
    default = "adming3"
}

variable "OSdisk_name"{
    default = "OSdisk"
}

variable "config_bastion"{
    default = "ip_config_bastion"
}

variable "NSG"{
    default = "NSG_group"
}

variable "VM_rule"{
    default = "SSH"
}

variable "VM_rule2"{
    default = "HTTP"
}

variable "server_name"{
    default = "serverg3b4"
}

variable "mariadb_admin"{
    default = "adminmariadb"
}

variable "mariadb_password"{
    default = "helloPaulCeliaRaja3"
}

variable "mariadb_name"{
    default = "g3mariadb"
}

variable "mariadb_rule"{
    default = "mariadb_VM_rule"
}

variable "gateway_name"{
    default = "jenkinsproxy"
}

variable "gateway_config"{
    default = "gateway-ip-configuration"
}

variable "keyvault_name"{
    default = "keyvault-g3b4"
}

variable "storage_name"{
    default = "g3stockage"
}

variable "container_name"{
    default = "g3conteneur"
}

variable "blob_name"{
    default = "stockage_blob"
}

variable "log_name"{
    default = "B4-G3"
}

variable "action_group_name"{
    default = "Group_B4G3"
}

variable "action_group_short_name"{
    default = "GpB4G3"
}

variable "devops1"{
    default = "celia"
}

variable "devops2"{
    default = "raja"
}

variable "devops3"{
    default = "paul"
}

variable "formateur1"{
    default = "alfred"
}

variable "formateur2"{
    default = "bryan"
}

variable "email_devops1"{
    default = "celia.ouedrao@gmail.com"
}

variable "email_devops2"{
    default = "raja-8@live.it"
}

variable "email_devops3"{
    default = "simplon.lion.paul@gmail.com"
}

variable "email_formateur1"{
    default = "asawaya.ext@simplon.co"
}

variable "email_formateur2"{
    default = "bstewart.ext@simplon.co"
}

variable "alert_name_vm"{
    default = "Alert_VM_G3B4"
}

variable "alert_name_db"{
    default = "Alert_mariadb_G3B4"
}

variable "alert_name_gateway"{
    default = "Alert_gateway_G3B4"
}

variable "app_insight_name"{
    default = "AppInsight_G3B4"
}