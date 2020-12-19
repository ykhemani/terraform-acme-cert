resource "tls_private_key" "private_key" {
  algorithm = var.tls_private_key_algorithm
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email_address
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = var.common_name
  subject_alternative_names = var.san

  dns_challenge {
    provider = var.dns_challenge_provider
  }
}

resource "local_file" "certificate" {
  content = acme_certificate.certificate.certificate_pem
  filename = "certificate.pem"
}

resource "local_file" "issuer" {
  content = acme_certificate.certificate.issuer_pem
  filename = "issuer.pem"
}

resource "local_file" "fullchain" {
  content = "${acme_certificate.certificate.certificate_pem}${acme_certificate.certificate.issuer_pem}"
  filename = "fullchain.pem"
}

resource "local_file" "private_key" {
  content = acme_certificate.certificate.private_key_pem
  filename = "privkey.pem"
}
