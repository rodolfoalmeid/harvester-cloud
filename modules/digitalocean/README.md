# Terraform | DigitalOcean - Preparatory steps

In order for Terraform to run operations on your behalf, you must [install and configure the doctl utility](https://docs.digitalocean.com/reference/doctl/how-to/install/).

## Example

#### macOS installation and setup

##### How to generate the [personal Access Token](https://docs.digitalocean.com/reference/api/create-personal-access-token/#creating-a-token)

```bash
brew update && brew install doctl
```

```bash
doctl auth init # after executing the command enter the generated Personal Access Token
```

##### If there are other active subscriptions, run

```bash
doctl auth init --context <NAME>
```
