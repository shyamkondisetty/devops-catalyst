# Systems Kubernetes cluster

## Prerequisite

- [Terraform](https://terraform.io/) v0.12.28
- [Ansible](https://www.ansible.com/) v2.9
- [Direnv](https://github.com/direnv/direnv) v2.21.2
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install) v0.23.33

> ensure you have the specified version or above for all the above mentioned tools

## Usage

### DigitalOcean Setup

1. Follow the instruction [here](https://www.digitalocean.com/docs/api/create-personal-access-token/) to setup personal token
2. Create a ssh key for the digital ocean in your machine. Refer [here](https://www.digitalocean.com/docs/droplets/how-to/add-ssh-keys/create-with-openssh/)


### Set environment variables
```
cp .envrc.sample .envrc
```
Populate the required environment variables in `.envrc`

### Setup terraform cloud

1. Create an organization in the app.terraform.io for this project
2. Do the following steps
- Create 2 workspaces "k8s" and "sensible_defaults" with prefix `systems` under this new organization in `app.terraform.io` 
Example: `systems-k8s` & `systems-sensible_defaults`
- Set the execution mode to "local" for the above 2 workspaces
    - Go to `Settings -> General` under workspace to change execution mode
    - This is to use terraform cloud only to store and synchronize state.
- Update the organization name in `systems/terragrunt.hcl` in the repo
- Execute the plan as follows. There should not be any errors.
  ```shell
  terragrunt plan-all
  ```

### Plan & Apply
```sh
direnv allow . # only for the first time and whenever there is a change in .envrc
terragrunt plan-all
terragrunt apply-all
```

### Destroy
```sh
terragrunt destroy-all
```

> VPC destroy fails if loadbalancer is created using nginx ingress. Manuall delete the loadbalancer from control panel of digitalocean and then rerun `terragrunt destroy-all`.

### Terragrunt usage tips:
- `terragrunt plan-all` fetches the tf modules only for the first time. To get any new changes from tf modules, run `terragrunt plan-all --terragrunt-source-update`. It will fetch all the tf modules again and do reinitialize.

### To run individual modules
```sh
cd k8s
terragrunt plan
terragrunt apply

cd sensible_defaults
terragrunt plan
terragrunt apply
```
