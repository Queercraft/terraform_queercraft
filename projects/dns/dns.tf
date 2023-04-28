resource "cloudflare_record" "tcpshield_verify" {
  zone_id = var.cloudflare_zone_id
  name    = var.root_domain
  value   = var.tcpshield_verify
  type    = "TXT"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "tcpshield" {
  zone_id         = var.cloudflare_zone_id
  name            = "tcpshield"
  value           = var.tcpshield_cname
  type            = "CNAME"
  ttl             = 3600
  allow_overwrite = false
  proxied         = false
}

resource "cloudflare_record" "minecraft_srv" {
  zone_id = var.cloudflare_zone_id
  name    = "mc"
  type    = "SRV"
  ttl     = 1
  proxied = false

  data {
    name     = "mc.queercraft.net"
    service  = "_minecraft"
    proto    = "_tcp"
    target   = "${cloudflare_record.tcpshield.name}.${var.root_domain}"
    port     = 25565
    weight   = 1
    priority = 1
  }
}

locals {
  generic_subdomains = [
    {
      name            = "staff"
      value           = var.server_ip
      type            = "A"
      ttl             = 1
      proxied         = true
      allow_overwrite = false
    },
    {
      name            = "newsite"
      value           = var.server_ip
      type            = "A"
      ttl             = 1
      proxied         = true
      allow_overwrite = false
    },
    {
      name            = "mc"
      value           = var.server_ip
      type            = "A"
      ttl             = 1
      proxied         = false # Sadly this breaks Bedrock connections without a paid plan
      allow_overwrite = false
    },
      {
      name            = "radio"
      value           = var.server_ip
      type            = "A"
      ttl             = 1
      proxied         = true
      allow_overwrite = false
    },
    {
      name            = "map"
      value           = var.server_ip
      type            = "A"
      ttl             = 1
      proxied         = true
      allow_overwrite = false
    },
    {
      name            = "amp"
      value           = var.server_ip
      type            = "A"
      ttl             = 1
      proxied         = true
      allow_overwrite = false
    }
  ]
}

resource "cloudflare_record" "sites" {
  for_each = {
    for site in local.generic_subdomains : site.name => site
  }
  zone_id         = var.cloudflare_zone_id
  name            = each.value.name
  value           = each.value.value
  type            = each.value.type
  ttl             = each.value.ttl
  proxied         = each.value.proxied
  allow_overwrite = each.value.allow_overwrite
}
