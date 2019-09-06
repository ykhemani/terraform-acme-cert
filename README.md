# ACME SSL Certificates using the Terraform Provider

This repo allows you to use the [ACME Provider](https://www.terraform.io/docs/providers/acme/index.html) for [Terraform](https://terraform.io) to issue [ACME](https://tools.ietf.org/html/rfc8555) SSL certificates from [LetsEncrypt](https://letsencrypt.org/) or other ACME provider.

This approach to retrieving an ACME SSL Certificate does not require your host for whic you require the SSL certificate to be accessible on the public Internet. It does require you to have the authoritative DNS servers for the domain of the endpoint you want to secure be amongst those [supported](https://www.terraform.io/docs/providers/acme/dns_providers/index.html) by the Terraform ACME provider.

To use:

Download [Terraform](https://www.terraform.io/downloads.html).

Fork this repo and clone it. For example:

```
git clone git@github.com:your-github-id-or-org/terraform-acme-cert.git
```

Go into the directory where you've cloned your repo and initialize Terraform.

```
terraform init
```

Copy `terraform.tfvars.example` to `terraform.tfvars` and edit for your use case.

- `email_address` -- your email address.
- `common_name` -- The certificate's common name, the primary domain that the certificate will be recognized for. e.g. `www.example.com`. You can also specify a wildcard. e.g. `*.example.com`.
- `dns_challenge_provider` -- the DNS provider for the domain. Also set the appropriate environment variables to enable you to authenticate with your DNS provider. For example, with Route 53, you would set `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
- `acme_server_url` -- Set the ACME Server URL to the Staging endpoint for Lets Encrypt while you are testing. Switch to the production endpoint when you're ready to issue your certificate.

Run `terraform plan` and confirm that it looks as you expect.

Finally, run `terraform apply` to generate your private key and SSL certiciate.

The Private Key will be saved in the file `privkey.pem`.

The Issuer Certiciate will be saved in the file `issuer.pem`.

The Certiciate will be saved in the file `certificate.pem`.

The Certificate and Issuer Certificate will also be saved together in the file `fullchaim.pem`.

Please do not commit the Private Key to version control!
