# Devops Catalyst

## Supported Options
- [DigitalOcean](/digitalocean/README.md)
- [AWS EKS](/digitalocean/README.md)

## Usage

```bash
$ git clone git@github.com:twCatalyst/devops-catalyst.git
```

Choose one of the supported options,

if you wish to use digitalocean then

1. rename `mv devops-catalyst/digitalocean devops-catalyst/<name>`
2. remove `rm devops-catalyst/aws-eks`

if you wish to use aws

1. rename `mv devops-catalyst/awsk-eks devops-catalyst/<name>`
2. remove `rm devops-catalyst/digitalocean


then rename all the references of `systems` to the `name` and follow the provider specific `README.md`
