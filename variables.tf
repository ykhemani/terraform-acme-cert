variable "tls_private_key_algorithm" {}
variable "common_name"               {}
variable "email_address"             {}
variable "dns_challenge_provider"    {}
variable "acme_server_url"           {}
variable "san"                       {
  type = list(string)
}
