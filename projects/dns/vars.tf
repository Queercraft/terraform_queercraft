variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token"
  sensitive   = true
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare zone ID"
}

variable "tcpshield_verify" {
  type        = string
  description = "TCPShield verification string"
  default     = "tcpshield-network-verification=PAUKRKP6TUBTLQEGU4NCYXGVJ7EDR4TDD4W2ANGM2EUE4DBBW7EL5742WAIAFTJ3WCQTGJTC75KMVGSZ5TV7LYTZEJRLBER4GJYNFEY="
}

variable "tcpshield_cname" {
  type        = string
  description = "TCPShield CNAME"
  default     = "821a0595c68acbbe610f313ae62672ec.ipv4.tcpshield.com"
}

variable "server_ip" {
  type        = string
  description = "Server IP"
  default     = "54.39.243.77"
}

variable "root_domain" {
  type        = string
  description = "Root domain"
  default     = "queercraft.net"
}
